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
    """
    Address
    """
    id = models.UUIDField(primary_key=True, default=uuid.uuid4, editable=False)
    user = models.ForeignKey(User, verbose_name=_("User"), on_delete=models.CASCADE)
    # full_name = models.CharField(_("Full Name"), max_length=150)
    phone = models.CharField(_("Phone Number"), max_length=50)
    postcode = models.CharField(_("Postcode"), max_length=50)
    address_line = models.CharField(_("Address Line 1"), max_length=255)
    address_line2 = models.CharField(_("Address Line 2"), max_length=255)
    town_city = models.CharField(_("Town/City/State"), max_length=150)
    delivery_instructions = models.CharField(_("Delivery Instructions"), max_length=255)
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
    class Meta:
        verbose_name_plural = 'Products'
        ordering = ('-created',)

    def get_absolute_url(self):
        return reverse('product_detail', args=[self.slug])




# talbe comment:
# id rating
# id Product
# id User
# comment
# rating(desau)

class DeliveryOptions(models.Model):

    DELIVERY_CHOICES = [
        ("IS", "In Store"),
        ("HD", "Home Delivery"),
        ("DD", "Digital Delivery"),
    ]

    delivery_name = models.CharField(
        verbose_name=_("delivery_name"),
        help_text=_("Required"),
        max_length=255,
    )

    
    delivery_price = models.DecimalField(
        verbose_name=_("delivery price"),
        help_text=_("Maximum 999.99"),
        error_messages={
            "name": {
                "max_length": _("The price must be between 0 and 999.99."),
            },
        },
        max_digits=5,
        decimal_places=2,
    )
    delivery_method = models.CharField(
        choices=DELIVERY_CHOICES,
        verbose_name=_("delivery_method"),
        help_text=_("Required"),
        max_length=255,
    )
    delivery_timeframe = models.CharField(
        verbose_name=_("delivery timeframe"),
        help_text=_("Required"),
        max_length=255,
    )
    delivery_window = models.CharField(
        verbose_name=_("delivery window"),
        help_text=_("Required"),
        max_length=255,
    )
    order = models.IntegerField(verbose_name=_("list order"), help_text=_("Required"), default=0)
    is_active = models.BooleanField(default=True)

    class Meta:
        verbose_name = _("Delivery Option")
        verbose_name_plural = _("Delivery Options")

    def __str__(self):
        return self.delivery_name


class PaymentSelections(models.Model):
    """
    Store payment options
    """

    name = models.CharField(
        verbose_name=_("name"),
        help_text=_("Required"),
        max_length=255,
    )

    is_active = models.BooleanField(default=True)

    class Meta:
        verbose_name = _("Payment Selection")
        verbose_name_plural = _("Payment Selections")

    def __str__(self):
        return self.name