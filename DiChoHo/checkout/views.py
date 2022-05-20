import json
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect, JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.core.mail import EmailMessage
from django.conf import settings
from django.views.decorators.csrf import csrf_exempt
from django.template.loader import render_to_string

from paypalcheckoutsdk.orders import OrdersGetRequest
from .paypal import PayPalClient
from decimal import Decimal
from smtplib import SMTPException

from .models import DeliveryOptions, PaymentOptions
from shop.cart import Cart
from django.contrib import messages
from shop.models import Address, Product, User
from orders.models import Order, OrderItem


@login_required
def delivery(request):
    session = request.session

    if "cart" not in request.session:
        messages.warning(request, "Vì tình hình dịch bệnh hệ thống chỉ nhận đơn hàng trên 200.000 VNĐ. Xin quý khách thông cảm")
        return HttpResponseRedirect(request.META["HTTP_REFERER"])

    print(session['cart'])
    total_product_price = 0
    for item in session['cart']:
        total_product_price += int(session['cart'][item]['price']) * int(session['cart'][item]['qty'])
    print(total_product_price)
    
    if (total_product_price <= 0):
        messages.warning(request, "Vui lòng thêm hàng vào giỏ trước khi thanh toán")
        return redirect('cart')

    deliveryoptions = DeliveryOptions.objects.filter(is_active=True)
    paymentoptions = PaymentOptions.objects.filter(is_active=True)
    addresses = Address.objects.filter(user=request.user).order_by("-default")

    if Address.objects.filter(user=request.user).exists():

        if "address" not in request.session:
            session["address"] = {"address_id": str(addresses[0].id)}
        else:
            session["address"]["address_id"] = str(addresses[0].id)
            session.modified = True
        
    return render(request, "checkout/delivery.html", {"deliveryoptions": deliveryoptions, "addresses": addresses, 'paymentoptions': paymentoptions})


@login_required
def update_delivery(request):
    cart = Cart(request)
    if request.POST.get("action") == "post":
        delivery_option = int(request.POST.get("deliveryoption"))
        delivery_type = DeliveryOptions.objects.get(id=delivery_option)
        updated_total_price = cart.cart_update_delivery(delivery_type.delivery_price)

        session = request.session
        if "purchase" not in request.session:
            session["purchase"] = {
                "delivery_id": delivery_type.id,
            }
        else:
            session["purchase"]["delivery_id"] = delivery_type.id
            session.modified = True

        response = JsonResponse({"total": updated_total_price, "delivery_price": delivery_type.delivery_price})
        return response

@login_required
def update_payment(request):
    if request.POST.get("action") == "post":
        payment_option = int(request.POST.get("paymentoption"))
        payment_type = PaymentOptions.objects.get(id=payment_option)

        session = request.session
        if "payment" not in request.session:
            session["payment"] = {
                "payment_option": payment_type.id,
            }
        else:
            session["payment"]["payment_option"] = payment_type.id
            session.modified = True
        response = JsonResponse({"payment": payment_type.name})
        return response


@login_required
def payment(request):
    session = request.session
    if "purchase" not in request.session:
        messages.success(request, "Vui lòng lựa chọn đơn vị giao hàng")
        return HttpResponseRedirect(request.META["HTTP_REFERER"])

    if "address" not in request.session:
        messages.success(request, "Vui lòng lựa chọn địa chỉ nhận hàng / Vui lòng tạo mới nếu chưa có địa chỉ nhận hàng.")
        return HttpResponseRedirect(request.META["HTTP_REFERER"])

    if "payment" not in request.session:
        messages.success(request, "Vui lòng lựa chọn phương thức thanh toán")
        return HttpResponseRedirect(request.META["HTTP_REFERER"])
    
    payment_id = session["payment"]["payment_option"]
    payment_type = PaymentOptions.objects.get(id=payment_id)

    if "Paypal" in payment_type.name:
        return render(request, "checkout/payment_paypal.html", {})
    else:
        payment_complete(request)
        payment_successful(request)
    
   

@login_required
def payment_complete(request):
    user_id = request.user.id
    session = request.session
    user = get_object_or_404(User, id=user_id)
    address = get_object_or_404(Address, user=user, default=True)
    cart = Cart(request)
    payment_id = session["payment"]["payment_option"]
    payment_type = PaymentOptions.objects.get(id=payment_id)
    payment_name = payment_type.name
    if "Paypal" in payment_type.name:
        PPClient = PayPalClient()

        body = json.loads(request.body)
        data = body["orderID"]

        requestorder = OrdersGetRequest(data)
        response = PPClient.client.execute(requestorder)
        order = Order.objects.create(
            user_id=user_id,
            full_name=address.full_name,
            email=user.email,
            address=address.address_line,
            phone=address.phone,
            total_paid=response.result.purchase_units[0].amount.value,
            order_key=response.result.id,
            payment_option=payment_name,
            billing_status=True,
        )

    else:
        order = Order.objects.create(
            user_id=user_id,
            full_name=address.full_name,
            email=user.email,
            address=address.address_line,
            phone=address.phone,
            total_paid=Decimal(cart.get_total_price()),
            order_key="not paypal",
            payment_option=payment_name,
            billing_status=False,
        )
    order_id = order.pk

    for item in cart:
        OrderItem.objects.create(order_id=order_id, product=item["product"], price=item["price"], quantity=item["qty"])
        sold_qty = get_object_or_404(Product, id=item["product"].id).sold + item["qty"]
        Product.objects.filter(id=item["product"].id).update(sold=sold_qty)
    send_mail(request.user, cart, order)
    return JsonResponse("Thanh toán thành công", safe=False)


@login_required
def payment_successful(request):
    cart = Cart(request)
    cart.clear()
    del request.session["payment"]
    return render(request, "checkout/payment_successful.html", {})

@csrf_exempt
def send_mail(uid, cart, order):
    template = render_to_string('checkout/bill_email.html',{'name':uid.first_name,'cart':cart, 'order': order})
    email = EmailMessage(
        'Đơn hàng của bạn đã được chấp nhận',
        template,
        settings.EMAIL_HOST_USER, 
        [uid.email],
    )

    email.fail_silently = False
    email.content_subtype = 'html'
    try:
        email.send()
    except SMTPException as e:
        print('There was an error sending an email: ', e) 
    return JsonResponse("Gửi gmail thành công",safe=False)