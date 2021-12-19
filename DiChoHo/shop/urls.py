from django.urls import path
from shop import views
from django.conf.urls import url

urlpatterns = [

     path('', views.index_view, name='home'),
     path('login/', views.login_view, name='login'),
     path('register/', views.register_view, name='register'),
     path('logout/', views.logout_view, name='logout'),
     path('contact/', views.contact_view, name='contact'),
     path('about/', views.about_view, name='about'),
     # wishlist
     path('wishlist/', views.wishlist_view, name='wishlist'),
     path('wishlist/add', views.wishlist_add, name='wishlist_add'),
     path('wishlist/delete', views.wishlist_delete, name='wishlist_delete'),
     # shop, product
     path('shop/', views.shop_view, name='shop'),
     path('product/<slug:slug>', views.product_detail, name='product_detail'),
     path('shop/<slug:category_slug>/', views.category_list, name='category_list'),
     # cart
     path('cart/', views.cart_view, name='cart'),
     path('cart/add/', views.cart_add, name='cart_add'),
     path('cart/delete/', views.cart_delete, name='cart_delete'),
     path('cart/update/', views.cart_update, name='cart_update'),
     #profile
     path('profile/', views.profile_view, name='profile'),
     path("profile/add_addresses", views.add_address, name="add_address"),
     path("profile/edit_addresses/<slug:id>/", views.edit_address, name="edit_address"),
     path("profile/delete_addresses/<slug:id>/", views.delete_address, name="delete_address"),
     path("profile/set_address_default/<slug:id>/", views.set_address_default, name="set_address_default"),
     path("profile/edit_profile/<slug:id>/",  views.edit_profile, name="edit_profile"),
     path("profile/review", views.review_add, name="review_add"),
     # something else
     path('search/', views.search_views, name='search_views'),
     path('404/', views.page_not_found, name='404'),
]
