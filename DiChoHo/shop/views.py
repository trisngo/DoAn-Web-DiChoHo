from django.http.response import JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import UserCreationForm
from django.http import HttpResponse
from .models import Profile, User, Category, Product
from django.contrib import messages
from django.urls import reverse
from django.views.decorators.csrf import csrf_exempt
from django.template.loader import render_to_string
from .cart import Cart
from orders.models import Order
from django.core.paginator import EmptyPage, Paginator
import re

# get index page


# def index_view(request):
#     products = Product.objects.all()
#     return render(request, 'index.html', {'products': products})


def index_view(request):
    products = Product.objects.all().order_by('-sold')
    products2 = Product.objects.all().order_by('-updated')
    products3 = Product.objects.all().order_by('price')
    return render(request, 'index.html', {'products': products, 'products2': products2, 'products3': products3},)
# get product page


def product_view(request):
    return render(
        request,
        'product-single.html',
    )

# get shop page


def shop_view(request):
    allProducts = Product.objects.all()
    p = Paginator(allProducts, 12)
    currentPage = 1
    if request.method == 'GET' and 'page' in request.GET:
        currentPage = request.GET.get("page")
    try:
        products = p.page(currentPage)
    except EmptyPage:
        return redirect('404')
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
    allFilterProducts = Product.objects.filter(category=category)
    p = Paginator(allFilterProducts, 12)
    currentPage = 1
    if request.method == 'GET' and 'page' in request.GET:
        currentPage = request.GET.get("page")
    try:
        products = p.page(currentPage)
    except EmptyPage:
        return redirect('404')
    return render(request, 'category.html', {'category': category.slug, 'products': products})


def product_detail(request, slug):
    product = get_object_or_404(Product, slug=slug, in_stock=True)
    relative_products = Product.objects.filter(category=product.category)
    return render(request, 'product-single.html', {'product': product, 'relative_products': relative_products})


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




# ----------------view xử lí Delivery và Payment ----------------------
# Addresses chưa có thêm template để update address(chờ)


@login_required
def view_address(request):
    addresses = Address.objects.filter(customer=request.user)
    return render(request, "account/dashboard/addresses.html", {"addresses": addresses})


@login_required
def add_address(request):
    if request.method == "POST":
        address_form = UserAddressForm(data=request.POST)
        if address_form.is_valid():
            address_form = address_form.save(commit=False)
            address_form.customer = request.user
            address_form.save()
            return HttpResponseRedirect(reverse("account:addresses"))
    else:
        address_form = UserAddressForm()
    return render(request, "account/dashboard/edit_addresses.html", {"form": address_form})


@login_required
def edit_address(request, id):
    if request.method == "POST":
        address = Address.objects.get(pk=id, customer=request.user)
        address_form = UserAddressForm(instance=address, data=request.POST)
        if address_form.is_valid():
            address_form.save()
            return HttpResponseRedirect(reverse("account:addresses"))
    else:
        address = Address.objects.get(pk=id, customer=request.user)
        address_form = UserAddressForm(instance=address)
    return render(request, "account/dashboard/edit_addresses.html", {"form": address_form})


@login_required
def delete_address(request, id):
    address = Address.objects.filter(pk=id, customer=request.user).delete()
    return redirect("account:addresses")


@login_required
def set_default(request, id):
    Address.objects.filter(customer=request.user, default=True).update(default=False)
    Address.objects.filter(pk=id, customer=request.user).update(default=True)

    previous_url = request.META.get("HTTP_REFERER")

    if "delivery_address" in previous_url:
        return redirect("checkout:delivery_address")

    return redirect("account:addresses")


@login_required
def user_orders(request):
    user_id = request.user.id
    orders = Order.objects.filter(user_id=user_id).filter(billing_status=True)
    return render(request, "profile/user_orders.html", {"orders": orders})

def search_views(request):
    query_item = request.GET.get("search").lower()
    products = Product.objects.filter(title__icontains=query_item)
    return render(request, "search.html", {'products': products})


def page_not_found(request):
    return render(request, '404.html')
