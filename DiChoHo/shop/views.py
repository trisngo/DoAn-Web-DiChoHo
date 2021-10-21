from django.shortcuts import render
from django.http import HttpResponse

# get index page
def index_view(request):
    return render( #gui them tham so vao template
        request,
        'index.html', #response 1 trang html, co the truyen cho tham so gi do
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
    return render(
        request,
        'login.html',
    )

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