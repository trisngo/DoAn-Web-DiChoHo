from django.db import models
from django.contrib.auth.models import User
from shop.models import Product
from django.core.validators import MaxValueValidator, MinValueValidator

class Order(models.Model):
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='order_user')
    full_name = models.CharField(max_length=50)
    email = models.EmailField(max_length=254, blank=True)
    address = models.CharField(max_length=250)
    phone = models.CharField(max_length=100)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    total_paid = models.DecimalField(max_digits=10, decimal_places=0, validators=[MinValueValidator(0)])
    order_key = models.CharField(max_length=200)
    payment_option = models.CharField(max_length=200, blank=True)
    billing_status = models.BooleanField(default=False)
    class Meta:
        ordering = ('-created',)
    
    def __str__(self):
        return str(self.created)

class OrderItem(models.Model):
    order = models.ForeignKey(Order, related_name="items", on_delete=models.CASCADE)
    product = models.ForeignKey(Product, related_name="order_items", on_delete=models.CASCADE)
    price = models.DecimalField(max_digits=10, decimal_places=0, default=0.0)
    quantity = models.PositiveIntegerField(default=1)

    def __str__(self):
        return str(self.id)