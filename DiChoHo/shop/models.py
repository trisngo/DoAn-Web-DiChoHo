from django.db import models
from django.contrib.auth.models import User
from django.db.models.aggregates import Min
from django.db.models.signals import post_save
from django.dispatch import receiver
from django.urls import reverse
from django.core.validators import MaxValueValidator, MinValueValidator
from django.utils.translation import gettext_lazy as _

class Profile(models.Model):
    user = models.OneToOneField(User, on_delete=models.CASCADE)
    birth_date = models.DateField(null=True, blank=True)
    profile_pic = models.ImageField(
        default='defaultavatar.png', upload_to='profiles_pics')
    address = models.TextField(max_length=500, null=False)
    phone = models.CharField(max_length=100, null=False)


@receiver(post_save, sender=User)
def create_profile(sender, instance, created, **kwargs):
    if created:
        Profile.objects.create(user=instance)


@receiver(post_save, sender=User)
def save_profile(sender, instance, **kwargs):
    instance.profile.save()


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

class Order(models.Model):
    # django tự tạo khóa id của mỗi class
    user = models.ForeignKey(User, on_delete=models.CASCADE, related_name='order_user')
    full_name = models.CharField(max_length=50) #tên user, xử lí trong view tự động cạp nhật
    address = models.CharField(max_length=250)
    phone = models.CharField(max_length=100)
    created = models.DateTimeField(auto_now_add=True) #ngay tạo order, còn hiểu là ngày thanh toán
    updated = models.DateTimeField(auto_now=True) #nếu có update thay đổi do trục trặc hay khách thay đổi địa chỉ thì thêm ngày
    total_paid = models.DecimalField(max_digits=10, decimal_places=0, validators=[MinValueValidator(0)])
    order_key = models.CharField(max_length=200) # mã order key, cung cấp cho khách hàng chứ không cung cấp id order cho khách(khách hàng tìm kiếm lại bằng mã này)
    billing_status = models.BooleanField(default=False) #thanh toán hay chưa

    class Meta:
        ordering = ('-created',)
    
    def __str__(self):
        return str(self.created)


class OrderItem(models.Model):
    # django tự tạo khóa id của mỗi class
    order = models.ForeignKey(Order,
                              related_name='items',
                              on_delete=models.CASCADE)
    product = models.ForeignKey(Product,
                                related_name='order_items',
                                on_delete=models.CASCADE)
    payment = models.DecimalField(max_digits=10, decimal_places=0, validators=[MinValueValidator(0)])#giá sản phẩn đó
    quantity = models.PositiveIntegerField(default=1)

    def __str__(self):
        return str(self.id)



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