from django.shortcuts import render, redirect
from django.contrib.auth import authenticate, login
from django.http import HttpResponse
from .models import Profile, User
from django.contrib import messages
from django.urls import reverse

# get index page
def index_view(request):
    return render(
        request,
        'index.html', 
        {
            
        }
    )
# get product page
def product_view(request):
    return render(
        request,
        'product-single.html', 
    )

# get shop page
def shop_view(request):
    return render(
        request,
        'shop.html', 
    )

# get login page
def login_view(request):
    if request.method == 'POST':
        if 'sdt' not in request.POST:
            username = request.POST["username"]
            password = request.POST["password"]
            print(username)
            print(password)
            
            try: 
                user = User.objects.get(username=username) #query của django
                print(user)
            except:
                messages.error(request, 'User does not exist')
                return redirect(reverse('login'))

            user = authenticate(username=username, password=password)
            if user is not None:
                login(request, user)
                return redirect('/')
            else:
                messages.error(request, 'Username or Password is wrong')
                return redirect(reverse('login'))
        else:
            return HttpResponse('<h1>Yes</h1>')
    else:
        return render(request, 'login.html')

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
