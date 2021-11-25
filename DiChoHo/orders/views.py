from django.http.response import JsonResponse
from django.shortcuts import render

from shop import cart

from .models import Order, OrderItem

#  ----------------view xử lí đơn hàng------------------------

def orders_add(request):
    cart = Cart(request)
    if request.POST.get("action") == "post":

        order_key = request.POST.get("order_key")
        user_id = request.user.id
        carttotal = cart.get_total_price()

        # Kiểm tra xem cái đơn này đã tồn tại chưa
        if Order.objects.filter(order_key=order_key).exists():
            pass
        else:
            # Nếu chưa tồn tại ta tạo 1 đơn mới
            order = Order.objects.create(
                user_id=user_id,
                # các trường dưới đây chưa xử lí tự lấy thông tin từ table user, có trong đơn vì cần hiển thị thông tin này ra khi in hóa đơn
                full_name="name",
                address="add",
                phone="phone",
                total_paid=carttotal,
                order_key=order_key,
            )
            # tạo 1 biến id để lấy primary key của order phía trên vừa tạo, dùng biến này để tạo khóa
            order_id = order.pk

            # Tạo sản phẩm trong mỗi đơn, ở đây có 1 db OrderItem để quản lí nên tự động tạo cùng luôn
            for item in cart:
                OrderItem.objects.create(
                    order=order_id, product=item["product"], price=item["price"], quantity=item["qty"]
                )

        response = JsonResponse({"success": "Return something"})
        return response


def payment_confirmation(data):
    Order.objects.filter(order_key=data).update(billing_status=True)


def user_orders(request):
    user_id = request.user.id
    orders = Order.objects.filter(user_id=user_id).filter(billing_status=True)
    return orders
