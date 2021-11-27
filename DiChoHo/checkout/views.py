import json
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect, JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
from .models import DeliveryOptions
from shop.cart import Cart
from django.contrib import messages
from shop.models import Address, Product, User
from orders.models import Order, OrderItem
from paypalcheckoutsdk.orders import OrdersGetRequest
from .paypal import PayPalClient
from decimal import Decimal

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

    if (total_product_price < 200000):
        messages.warning(request, "Vì tình hình dịch bệnh hệ thống chỉ nhận đơn hàng trên 200.000 VNĐ. Xin quý khách thông cảm")
        return redirect('cart')

    deliveryoptions = DeliveryOptions.objects.filter(is_active=True) # lấy danh sách các dịch vụ vận chuyển nào đang hoạt động
    
    addresses = Address.objects.filter(user=request.user).order_by("-default")

    if Address.objects.filter(user=request.user).exists():

        if "address" not in request.session:
            session["address"] = {"address_id": str(addresses[0].id)}
        else:
            session["address"]["address_id"] = str(addresses[0].id)
            session.modified = True
        
    return render(request, "checkout/delivery.html", {"deliveryoptions": deliveryoptions, "addresses": addresses})


@login_required
def cart_update_delivery(request):
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
def session_update_payment(request):
    session = request.session

    if request.POST.get("action") == "post":
        payment_option = int(request.POST.get("paymentoption"))
        print(payment_option)

        session["payment"] = {
                "payment_option": payment_option,
        }
        response = JsonResponse({"payment": payment_option})
        return response


@login_required
def payment_option(request):
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
    
    print(session["payment"]["payment_option"])
    if session["payment"]["payment_option"] == 1:
        print("hello")
        payment_complete(request)
        return render(request, "checkout/payment_successful.html", {})
    elif session["purchase"]["delivery_id"] == 2:
        return render(request, "checkout/payment_selection.html", {})
    else:
        messages.success(request, "Có lỗi xảy ra")
        return HttpResponseRedirect(request.META["HTTP_REFERER"])

    return render(request, "checkout/payment_selection.html", {})
    
   

@login_required
def payment_complete(request):
    
    user_id = request.user.id

    session = request.session
    user = get_object_or_404(User, id=user_id)
    address = get_object_or_404(Address, user=user, default=True)
    cart = Cart(request)

    if session["payment"]["payment_option"] == 1:
        payment = "cod"
        order = Order.objects.create(
            user_id=user_id,
            full_name=address.full_name,
            email=user.email,
            address=address.address_line,
            phone=address.phone,
            total_paid=Decimal(cart.get_total_price()),
            order_key="cod",
            payment_option=payment,
            billing_status=True,
        )
    else:
        PPClient = PayPalClient()

        body = json.loads(request.body)
        data = body["orderID"]
        payment = "paypal"

        requestorder = OrdersGetRequest(data)
        response = PPClient.client.execute(requestorder)

        order = Order.objects.create(
            user_id=user_id,
            full_name=address.full_name,
            email=user.email,
            address=address.address_line,
            phone=address.phone,
            total_paid=response.result.purchase_units[0].amount.value, #lấy thông tin tiền được trả từ paypal
            order_key=response.result.id,
            payment_option=payment,
            billing_status=True,
        )

    order_id = order.pk

    for item in cart:
        OrderItem.objects.create(order_id=order_id, product=item["product"], price=item["price"], quantity=item["qty"])
        sold_qty = get_object_or_404(Product, id=item["product"].id).sold + item["qty"]
        Product.objects.filter(id=item["product"].id).update(sold=sold_qty)

    return JsonResponse("Thanh toán thành công", safe=False)


@login_required
def payment_successful(request):
    cart = Cart(request)
    cart.clear()
    del request.session["payment"]
    return render(request, "checkout/payment_successful.html", {})
