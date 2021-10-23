from django.urls import path
from shop import views

urlpatterns = [
    path('', views.index_view, name='home'), # khi goi duong dan home thi se render html minh lien ket ben views.py, name dung de goi duong dan cho nhanh
    path('shop/', views.shop_view, name='shop'),
    path('product/', views.product_view, name='product'),
    path('login/', views.login_view, name='login'),
    path('register/', views.register_view, name='register'),
    path('contact/', views.contact_view, name='contact'),
    path('about/', views.about_view, name='about'),
    path('cart/', views.cart_view, name='cart'),
    path('checkout/', views.checkout_view, name='checkout'),
    path('wishlist/', views.wishlist_view, name='wishlist'),
]
