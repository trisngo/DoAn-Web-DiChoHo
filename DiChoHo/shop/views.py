from django.views.decorators.csrf import csrf_exempt
from django.http.response import JsonResponse
from django.shortcuts import render, redirect, get_object_or_404
from django.contrib.auth import authenticate, login, logout
from django.contrib.auth.forms import UserCreationForm
from django.contrib.auth.decorators import login_required
from django.http import HttpResponseRedirect
from .models import Profile, User, Category, Product, Address, Rating
from django.contrib import messages
from django.urls import reverse
from django.views.decorators.csrf import csrf_exempt
from django.template.loader import render_to_string
from .cart import Cart
from orders.models import Order, OrderItem
from django.core.paginator import EmptyPage, Paginator
from django.template import RequestContext
import django.shortcuts
from django.contrib.auth import update_session_auth_hash
from django.contrib.auth.forms import PasswordChangeForm
from .forms import AddressForm, UserForm, ProfileForm
from django.core.mail import EmailMessage
from django.conf import settings
import datetime


def handler404(request):
    response = django.shortcuts.render_to_response(
        '404.html', {}, context_instance=RequestContext(request))
    response.status_code = 404
    return response

# get index page


def index_view(request):
    products = Product.objects.all().order_by('-sold')
    products2 = Product.objects.all().order_by('-created')
    products3 = Product.objects.all().order_by('price')
    return render(request, 'index.html', {'products': products, 'products2': products2, 'products3': products3},)


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
    if request.user.is_authenticated:
        return redirect('/')
    if request.method == 'POST':
        getUsername = request.POST["username"]
        getPassword = request.POST["password"]
        user = authenticate(request=request, username=getUsername,
                            password=getPassword)
        if user is not None:
            login(request, user)
            return redirect('/')
        else:
            messages.error(request, 'Sai tài khoản hoặc mật khẩu')
            return redirect(reverse('login'))
    return render(request, 'login.html')

# get register page


def register_view(request):
    if request.user.is_authenticated:
        return redirect('/')
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
                send_mail(user)
                return redirect('home')
        else:
            messages.info(request, 'Password is not same')
            return redirect('register')
    return render(request, 'register.html')

# send mail


@csrf_exempt
def send_mail(uid):
    template = render_to_string('register_mail.html', {'name': uid.first_name})
    email = EmailMessage(
        'Cám ơn bạn đã đăng ký tại trang Đi chợ hộ của chúng tôi !',
        template,
        settings.EMAIL_HOST_USER,
        [uid.email],
    )

    email.fail_silently = False
    email.content_subtype = 'html'
    email.send()
    print(email)
    return redirect('login')


def logout_view(request):
    logout(request)
    return redirect('/')

# get about page


def about_view(request):
    return render(
        request,
        'about.html',
    )

# get wishlist page


@login_required
def wishlist_view(request):
    products = Product.objects.filter(users_wishlist=request.user)
    return render(
        request,
        'wishlist.html',
        {"products": products}
    )


@login_required
def wishlist_add(request):
    prodid = request.POST.get("productid")
    product = get_object_or_404(Product, id=prodid)
    product.users_wishlist.add(request.user)
    response = JsonResponse({"Status": "OK"})
    return response


@login_required
def wishlist_delete(request):
    prodid = request.POST.get("productid")
    product = get_object_or_404(Product, id=prodid)
    product.users_wishlist.remove(request.user)
    response = JsonResponse({"Status": "OK"})
    return response

# profile


@login_required
def profile_view(request):
    if request.method == "POST":
        form = PasswordChangeForm(request.user, request.POST)
        if form.is_valid():
            user = form.save()
            update_session_auth_hash(request, user)
            messages.success(request, "Mật khẩu được đổi thành công")
            return redirect('profile')
        else:
            messages.error(request, 'Mật khẩu được đổi không thành công')

    form = PasswordChangeForm(request.user)
    userid = request.user.id
    orders = Order.objects.filter(user_id=userid).filter(billing_status=True)
    user1 = get_object_or_404(User, id=userid)
    profile = get_object_or_404(Profile, id=userid)
    addresses = Address.objects.filter(user=request.user)
    ratings = Rating.objects.filter(user=request.user)
    return render(
        request,
        'profile.html',
        {'user': user1, 'profile': profile, 'orders': orders,
            'form': form, 'addresses': addresses, 'ratings': ratings}
    )


@login_required
def edit_profile(request, id):
    if request.method == "POST":
        user = User.objects.get(pk=id, username=request.user)
        user_form = UserForm(instance=user, data=request.POST)
        profile = Profile.objects.get(pk=id, user=request.user)
        profile_form = ProfileForm(
            request.POST, request.FILES, instance=profile)
        if user_form.is_valid() and profile_form.is_valid():
            print(profile_form)
            print(profile)
            user_form.save()

            if Profile.objects.filter(user=request.user).exists() == False:
                profile_form.save(commit=False)
                profile_form.user = request.user
            profile_form.save()
            return HttpResponseRedirect(reverse("profile"))

    else:
        user = User.objects.get(pk=id, username=request.user)
        user_form = UserForm(instance=user)
        profile = Profile.objects.get(pk=id, user=request.user)
        profile_form = ProfileForm(instance=user)
    return render(request, "edit_profile.html", {"user_form": user_form, "profile_form": profile_form})

# view category, product


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
    return render(request, 'category.html', {'category': category, 'products': products})


def product_detail(request, slug):
    product = get_object_or_404(Product, slug=slug, in_stock=True)
    all_relative_products = Product.objects.filter(category=product.category)
    p = Paginator(all_relative_products, 4)
    relative_products = p.page(1)
    allRatings = Rating.objects.filter(product=product)
    count = 0
    count_stars = 0
    for rating in allRatings:
        count += 1
        count_stars += rating.ratingStar
    average_stars = 0
    if count > 0:
        average_stars = round(count_stars/count, 1)
    average_stars_int = int(average_stars)
    time_now = datetime.datetime.now()
    rating_time = time_now.strftime("%H:%M:%S %d/%m/%Y")
    return render(request, 'product-single.html',
                  {'product': product, 'relative_products': relative_products,
                   'ratings': allRatings, "rating_count": count,
                   'stars': average_stars, 'stars_int': range(average_stars_int),
                   'unstars_int': range(5 - average_stars_int),
                   })


# review
@login_required
def review_add(request):
    # if request.method == "POST":
    if request.POST.get("action") == "post":
        user_id = request.user.id
        product_id = int(request.POST.get("productid"))
        product = get_object_or_404(Product, id=product_id)
        user = get_object_or_404(User, id=user_id)
        content = str(request.POST.get("content"))
        ratingStar = float(request.POST.get("star"))

        if Rating.objects.filter(product=product_id).exists():
            rating = Rating.objects.filter(product=product_id).update(
                content=content,
                ratingStar=ratingStar,
            )

        else:
            rating = Rating.objects.create(
                user=user,
                product=product,
                content=content,
                ratingStar=ratingStar,
            )
        response = JsonResponse({"status": "OK"})
        return response


#  cart

def cart_view(request):
    cart = Cart(request)
    return render(request, "cart.html", {"cart": cart})


def cart_add(request):
    if int(request.POST.get("productqty")):
        if int(request.POST.get("productqty")) > 0:
            cart = Cart(request)
            if request.POST.get("action") == "post":
                product_id = int(request.POST.get("productid"))
                product_qty = int(request.POST.get("productqty"))
                product = get_object_or_404(Product, id=product_id)
                cart.add(product=product, qty=product_qty)
                cartqty = cart.__len__()
                response = JsonResponse({"qty": cartqty})
                return response
    else:
        print(type(request.POST.get("productqty")))


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
    if int(request.POST.get("productqty")):
        if int(request.POST.get("productqty")) > 0:
            cart = Cart(request)
            if request.POST.get("action") == "post":
                product_id = int(request.POST.get("productid"))
                product_qty = int(request.POST.get("productqty"))
                cart.update(product=product_id, qty=product_qty)
                cartqty = cart.__len__()
                cartsubtotal = cart.get_subtotal_price()
                response = JsonResponse(
                    {"qty": cartqty, "subtotal": cartsubtotal})
                return response

# address(có nhiều địa chỉ có thể được tạo)


@ login_required
def add_address(request):
    if request.method == "POST":
        address_form = AddressForm(data=request.POST)
        if address_form.is_valid():
            address_form = address_form.save(commit=False)
            address_form.user = request.user
            address_form.save()
            return HttpResponseRedirect(reverse("profile"))
    else:
        address_form = AddressForm()
    return render(request, "edit_address.html", {"form": address_form})


@ login_required
def edit_address(request, id):
    if request.method == "POST":
        address = Address.objects.get(pk=id, user=request.user)
        address_form = AddressForm(instance=address, data=request.POST)
        if address_form.is_valid():
            address_form.save()
            return HttpResponseRedirect(reverse("profile"))
    else:
        address = Address.objects.get(pk=id, user=request.user)
        address_form = AddressForm(instance=address)
    return render(request, "edit_address.html", {"form": address_form})


@ login_required
def delete_address(request, id):
    address = Address.objects.filter(pk=id, user=request.user).delete()
    return redirect("profile")


@ login_required
def set_address_default(request, id):
    Address.objects.filter(
        user=request.user, default=True).update(default=False)
    Address.objects.filter(pk=id, user=request.user).update(default=True)
    previous_url = request.META.get("HTTP_REFERER")

    if "delivery_address" in previous_url:
        return redirect("checkout:delivery_address")

    return redirect("profile")

# search


def search_views(request):
    query_item = request.GET.get("search").lower()
    products = Product.objects.filter(title__icontains=query_item)
    return render(request, "search.html", {'products': products})


def page_not_found(request):
    return render(request, '404.html')


def locked_out(request):
    return render(request, 'lockedout.html')
