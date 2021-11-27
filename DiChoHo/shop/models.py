from django.db import models
from django.contrib.auth.models import User
from django.db.models.aggregates import Min
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.urls import reverse
from django.core.validators import MaxValueValidator, MinValueValidator
from django.utils.translation import gettext_lazy as _
import uuid

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    birth_date = models.DateField(null=True, blank=True)
    phone = phone = models.CharField(_("Số điện thoại"), max_length=10, default="0")
    profile_pic = models.ImageField(
        default='defaultavatar.png', upload_to='profiles_pics')


@receiver(post_save, sender=User)
def create_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)


@receiver(post_save, sender=User)
def save_profile(sender, instance, **kwargs):
    instance.profile.save()

class Address(models.Model):
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user = models.ForeignKey(User, verbose_name=_("User"), on_delete=models.CASCADE)
    full_name = models.CharField(_("Họ tên người nhận"), max_length=150, default="Chưa tạo")
    phone = models.CharField(_("Số điện thoại nhận hàng"), max_length=10)
    address_line = models.CharField(_("Địa chỉ nhận hàng"), max_length=255)
    city = models.CharField(_("Thành Phố/Tỉnh"), max_length=150, default="Chưa tạo")
    delivery_instructions = models.CharField(_("Ghi chú nhận hàng"), max_length=255, default="Không có")
    created_at = models.DateTimeField(_("Created at"), auto_now_add=True)
    updated_at = models.DateTimeField(_("Updated at"), auto_now=True)
    default = models.BooleanField(_("Default"), default=False)

    class Meta:
        verbose_name = "Address"
        verbose_name_plural = "Addresses"

    def __str__(self):
        return "Address"

class Category(models.Model):
    name = models.CharField(max_length=255, db_index=True)
    slug = models.SlugField(max_length=255, unique=True)

    class Meta:
        verbose_name_plural = 'categories'

    def get_absolute_url(self):
        return reverse('category_list', args=[self.slug])
    
    def get_all_objects(self):
        queryset = self._meta.model.objects.all()
        # can use the below method also
        # queryset = self.__class__.objects.all()   
        return queryset

    def __str__(self):
        return self.name


class Product(models.Model):
    category = models.ForeignKey(
    Category, related_name='product', on_delete=models.CASCADE)
    created_by = models.ForeignKey(
    User, on_delete=models.CASCADE, related_name='product_creator')
    title = models.CharField(max_length=255)
    author = models.CharField(max_length=255, default='admin')
    description = models.TextField(blank=True)
    image = models.ImageField(
    upload_to='templates/static/images', default='/templates/static/images/Logo.png')
    slug = models.SlugField(max_length=255)
    price = models.DecimalField(max_digits=10, decimal_places=0, validators=[MinValueValidator(0)])
    in_stock = models.BooleanField(default=True)
    is_active = models.BooleanField(default=True)
    created = models.DateTimeField(auto_now_add=True)
    updated = models.DateTimeField(auto_now=True)
    objects = models.Manager()
    sold = models.IntegerField(default=0, validators=[MinValueValidator(0)])
    users_wishlist = models.ManyToManyField(User, related_name="user_wishlist", blank=True)
    class Meta:
        verbose_name_plural = 'Products'
        ordering = ('-created',)

    def get_absolute_url(self):
        return reverse('product_detail', args=[self.slug])


class Rating(models.Model):
    user = models.ForeignKey(
        User, on_delete=models.CASCADE, related_name='user')
    product = models.ForeignKey(
        Product, related_name="items", on_delete=models.CASCADE)
    content = models.TextField(blank=True)
    ratingStar = models.DecimalField(max_digits=6, decimal_places=1, validators=[
        MinValueValidator(0), MaxValueValidator(5)])

    class Meta:
        verbose_name = "Rating"
        verbose_name_plural = "Rating"

    def str(self):
        return "Rating"


