from django.urls import include, path

from . import views

app_name = "checkout"

urlpatterns = [
    path("delivery/", views.delivery, name="delivery"),
    path("update_delivery/", views.update_delivery, name="update_delivery"),
    path("update_payment/", views.update_payment, name="update_payment"),
    path("payment/", views.payment, name="payment"),
    path("payment_complete/", views.payment_complete, name="payment_complete"),
    path("payment_successful/", views.payment_successful, name="payment_successful"),
]
