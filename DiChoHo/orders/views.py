from django.http.response import JsonResponse
from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from shop import cart

from .models import Order, OrderItem

# Không xử lí đơn hàng tại đây nữa, xử lí tại module checkout
