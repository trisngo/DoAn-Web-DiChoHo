from django.db import models

# Create your models here.

class user(models.Model):
    username = models.CharField(max_length=100,null=False)
    password = models.CharField(max_length=100,null=False)
    email = models.EmailField(max_length=100,null=False)
    name = models.CharField(max_length=100,null=False)
    address = models.TextField(max_length=500,null=False)
    phone = models.CharField(max_length=100,null=False)
    is_admin = models.BooleanField()


