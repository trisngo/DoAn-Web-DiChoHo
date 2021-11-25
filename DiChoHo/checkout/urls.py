from django.urls import include, path

from . import views

app_name = "checkout"

urlpatterns = [
    path("delivery/", views.delivery, name="delivery"),
    path("cart_update_delivery/", views.cart_update_delivery, name="cart_update_delivery"),
    path("payment_option/", views.payment_option, name="payment_option"),
    path("payment_complete/", views.payment_complete, name="payment_complete"),
    path("payment_successful/", views.payment_successful, name="payment_successful"),
]
