import json
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect, JsonResponse
from django.shortcuts import render, redirect
from .models import DeliveryOptions
from shop.cart import Cart
from django.contrib import messages
from shop.models import Address
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

    if (total_product_price < 200000):
        messages.warning(request, "Vì tình hình dịch bệnh hệ thống chỉ nhận đơn hàng trên 200.000 VNĐ. Xin quý khách thông cảm")
        return redirect('cart')

    deliveryoptions = DeliveryOptions.objects.filter(is_active=True) # lấy danh sách các dịch vụ vận chuyển nào đang hoạt động
    
    addresses = Address.objects.filter(user=request.user).order_by("-default")

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
def payment_option(request):

    session = request.session
    if "purchase" not in request.session:
        messages.success(request, "Vui lòng lựa chọn đơn vị giao hàng")
        return HttpResponseRedirect(request.META["HTTP_REFERER"])

    if "address" not in request.session:
        messages.success(request, "Vui lòng lựa chọn địa chỉ giao hàng")
        return HttpResponseRedirect(request.META["HTTP_REFERER"])

    return render(request, "checkout/payment_selection.html", {})


from paypalcheckoutsdk.orders import OrdersGetRequest
from .paypal import PayPalClient


@login_required
def payment_complete(request):
    PPClient = PayPalClient()

    body = json.loads(request.body)
    data = body["orderID"]
    user_id = request.user.id

    requestorder = OrdersGetRequest(data)
    response = PPClient.client.execute(requestorder)

    total_paid = response.result.purchase_units[0].amount.value

    cart = Cart(request)
    order = Order.objects.create(
        user_id=user_id,
        full_name=response.result.purchase_units[0].shipping.name.full_name,
        email=response.result.payer.email_address,
        address=response.result.purchase_units[0].shipping.address.address_line_1,
        total_paid=response.result.purchase_units[0].amount.value,
        order_key=response.result.id,
        payment_option="paypal",
        billing_status=True,
    )
    order_id = order.pk

    for item in cart:
        OrderItem.objects.create(order_id=order_id, product=item["product"], price=item["price"], quantity=item["qty"])

    return JsonResponse("Thanh toán thành công", safe=False)


@login_required
def payment_successful(request):
    cart = Cart(request)
    cart.clear()
    return render(request, "checkout/payment_successful.html", {})
