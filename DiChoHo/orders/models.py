from decimal import Decimal
from django.conf import settings
from django.db import models
from django.contrib.auth.models import User
from shop.models import Product
from django.core.validators import MaxValueValidator, MinValueValidator

class Order(models.Model):
    # django tự tạo khóa id của mỗi class
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='order_user')
    full_name = models.CharField(max_length=50) #tên user, xử lí trong view tự động cạp nhật
    email = models.EmailField(max_length=254, blank=True)
    address = models.CharField(max_length=250)
    phone = models.CharField(max_length=100)
    created = models.DateTimeField(auto_now_add=True) #ngay tạo order, còn hiểu là ngày thanh toán
    updated = models.DateTimeField(auto_now=True) #nếu có update thay đổi do trục trặc hay khách thay đổi địa chỉ thì thêm ngày
    total_paid = models.DecimalField(max_digits=10, decimal_places=0, validators=[MinValueValidator(0)])
    order_key = models.CharField(max_length=200) # mã order key của paypal trả về, nếu cod thì là cod
    payment_option = models.CharField(max_length=200, blank=True)
    billing_status = models.BooleanField(default=False) #thanh toán hay chưa

    class Meta:
        ordering = ('-created',)
    
    def __str__(self):
        return str(self.created)


class OrderItem(models.Model):
    # django tự tạo khóa id của mỗi class
    order = models.ForeignKey(Order, related_name="items", on_delete=models.CASCADE)
    product = models.ForeignKey(Product, related_name="order_items", on_delete=models.CASCADE)
    price = models.DecimalField(max_digits=10, decimal_places=0, default=0.0)
    quantity = models.PositiveIntegerField(default=1)

    def __str__(self):
        return str(self.id)