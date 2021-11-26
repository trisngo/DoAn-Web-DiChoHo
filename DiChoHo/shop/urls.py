from django.urls import path
from shop import views
from django.conf.urls import url

urlpatterns = [
    # khi goi duong dan home thi se render html minh lien ket ben views.py, name dung de goi duong dan cho nhanh
    path('', views.index_view, name='home'),
    path('shop/', views.shop_view, name='shop'),
    path('product/', views.product_view, name='product'),
    path('login/', views.login_view, name='login'),
    path('register/', views.register_view, name='register'),
    path('contact/', views.contact_view, name='contact'),
    path('about/', views.about_view, name='about'),
#     path('checkout/', views.checkout_view, name='checkout'),
    path('wishlist/', views.wishlist_view, name='wishlist'),
    path('logout/', views.logout_view, name='logout'),
    path('profile/', views.profile_view, name='profile'),
    path('product/<slug:slug>', views.product_detail, name='product_detail'),
    path('shop/<slug:category_slug>/', views.category_list, name='category_list'),
    path('cart/', views.cart_view, name='cart'),
    path('cart/add/', views.cart_add, name='cart_add'),
    path('cart/delete/', views.cart_delete, name='cart_delete'),
    path('cart/update/', views.cart_update, name='cart_update'),
    #address and order
    path("addresses/", views.view_address, name="addresses"),
    path("add_address/", views.add_address, name="add_address"),
    path("addresses/edit/<slug:id>/", views.edit_address, name="edit_address"),
    path("addresses/delete/<slug:id>/",
         views.delete_address, name="delete_address"),
    path("addresses/set_default/<slug:id>/",
         views.set_default, name="set_default"),

    path('search/', views.search_views, name='search_views'),
    path('404/', views.page_not_found, name='404'),
    url(r'^password/$', views.change_password, name='change_password'),
]
