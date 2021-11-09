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

# get cart page


def cart_view(request):
    return render(
        request,
        'cart.html',
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
