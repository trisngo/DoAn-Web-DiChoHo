from django.urls import path
from shop import views

urlpatterns = [
    path('login', views.login, name='login')
]
