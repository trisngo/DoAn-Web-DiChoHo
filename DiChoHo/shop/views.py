from django.http.response import JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.decorators import login_required
from django.contrib.auth.forms import UserCreationForm
from django.http import HttpResponse
from .models import Profile, User, Category, Product, Order, OrderItem
from django.contrib import messages
from django.urls import reverse
from django.views.decorators.csrf import csrf_exempt
from django.template.loader import render_to_string
from .cart import Cart

# get index page


def index_view(request):
    products = Product.objects.all()
    return render(request, 'index.html', {'products': products})
# get product page


def product_view(request):
    return render(
        request,
        'product-single.html',
    )

# get shop page


def shop_view(request):
    products = Product.objects.all()
    return render(request, 'shop.html', {'products': products})

# get login page


def login_view(request):
    if request.method == 'POST':
        getUsername = request.POST["username"]
        getPassword = request.POST["password"]
        user = authenticate(username=getUsername,
                            password=getPassword)
        print(getUsername)
        print(getPassword)
        if user is not None:
            login(request, user)
            return redirect('/')
        else:
            messages.error(request, 'Sai tài khoản hoặc mật khẩu')
            return redirect(reverse('login'))
    return render(request, 'login.html')

# get register page


def register_view(request):
    if request.method == 'POST':
        username = request.POST['username']
        email = request.POST['email']
        password = request.POST['password']
        password2 = request.POST['password2']
        name = request.POST['name']
        phone = request.POST['phone']
        address = request.POST['address']

        if password == password2:
            if User.objects.filter(email=email).exists():
                messages.error(request, 'Email Already Used')
                return redirect('register')
            elif User.objects.filter(username=username).exists():
                messages.error(request, 'Username Already Used')
                return redirect('register')
            else:
                user = User.objects.create_user(
                    username=username, email=email, password=password)
                user.is_active = True
                user.first_name = name
                user.profile.address = address
                user.profile.phone = phone
                user.save()
                return redirect('home')
        else:
            messages.info(request, 'Password is not same')
            return redirect('register')
    return render(request, 'register.html')

# get contact page


def contact_view(request):
    return render(
        request,
        'contact.html',
    )

# get about page


def about_view(request):
    return render(
        request,
        'about.html',
    )


# get checkout page


def checkout_view(request):
    return render(
        request,
        'checkout.html',
    )

# get wishlist page


def wishlist_view(request):
    return render(
        request,
        'wishlist.html',
    )


def logout_view(request):
    logout(request)
    return redirect('/')


def profile_view(request):
    return render(
        request,
        'profile.html'
    )


# view category và product mẫu.
def category_list(request, category_slug=None):
    category = get_object_or_404(Category, slug=category_slug)
    products = Product.objects.filter(category=category)
    return render(request, 'category.html', {'category': category, 'products': products})


def product_detail(request, slug):
    product = get_object_or_404(Product, slug=slug, in_stock=True)
    relative_products = Product.objects.filter(category=product.category)
    return render(request, 'product-single.html', {'product': product, 'relative_products': relative_products})


# Hàm này dùng cho ajax, giờ như cc rồi nên bỏ
# @csrf_exempt
# def filter_product(request):
#     category = Category.objects.get(name=request.POST["category"])
#     products = list(Product.objects.filter(category=category).values())
#     # neu muon return nhu la Json
#     # return JsonResponse(products, safe=False)
#     # return render(request, 'filter_product.html', {"products": products})
#     # neu muon return nhu hien tai
#     return render(request, 'filter_product.html', locals())


#  ----------------view xử lí giỏ hàng------------------------

def cart_view(request):
    cart = Cart(request)
    return render(request, "cart.html", {"cart": cart})


def cart_add(request):
    cart = Cart(request)
    if request.POST.get("action") == "post":
        product_id = int(request.POST.get("productid"))
        product_qty = int(request.POST.get("productqty"))
        product = get_object_or_404(Product, id=product_id)
        cart.add(product=product, qty=product_qty)
        cartqty = cart.__len__()
        response = JsonResponse({"qty": cartqty})
        return response


def cart_delete(request):
    cart = Cart(request)
    if request.POST.get("action") == "post":
        product_id = int(request.POST.get("productid"))
        cart.delete(product=product_id)

        cartqty = cart.__len__()
        carttotal = cart.get_total_price()
        response = JsonResponse({"qty": cartqty, "subtotal": carttotal})
        return response


def cart_update(request):
    cart = Cart(request)
    if request.POST.get("action") == "post":
        product_id = int(request.POST.get("productid"))
        product_qty = int(request.POST.get("productqty"))
        cart.update(product=product_id, qty=product_qty)

        cartqty = cart.__len__()
        cartsubtotal = cart.get_subtotal_price()
        response = JsonResponse({"qty": cartqty, "subtotal": cartsubtotal})
        return response

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


# ----------------view xử lí Delivery và Payment ----------------------
# @login_required
# def deliverychoices(request):
#     deliveryoptions = DeliveryOptions.objects.filter(is_active=True)
#     return render(request, "checkout/delivery_choices.html", {"deliveryoptions": deliveryoptions})
