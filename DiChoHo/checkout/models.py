from django.db import models
from django.utils.translation import gettext_lazy as _

class DeliveryOptions(models.Model):
    # ta có thể thêm các phương thức giao hàng khác(khác đơn vị giao hàng)
    DELIVERY_CHOICES = [
        ("DD", "Giao tại 1 địa điểm"),
        ("TN", "Giao tận nhà"),
    ]
    delivery_method = models.CharField(
        choices=DELIVERY_CHOICES,
        verbose_name=_("Lựa chọn phương thức giao hàng"),
        help_text=_("Bắt buộc"),
        max_length=255,
    )
    delivery_name = models.CharField(
        verbose_name=_("Tên đơn vị giao"),
        help_text=_("Bắt buộc"),
        max_length=255,
    )
    delivery_price = models.DecimalField(
        verbose_name=_("Phí giao"),
        help_text=_("Tối đa 1 000 000"),
        error_messages={
            "name": {
                "max_length": _("Số tiền nên nằm trong khoảng 0 đến 1.000.000"),
            },
        },
        max_digits=6,
        decimal_places=0,
    )
    #thoi gian giao
    delivery_timeframe = models.CharField(
        verbose_name=_("Thời gian giao:"),
        help_text=_("Bắt buộc (vd: 1-2 ngày)"),
        max_length=255,
    )

    delivery_window = models.CharField(
        verbose_name=_("Thời điểm nhận hàng"),
        help_text=_("Bắt buộc (vd: 9:00-21:00)"),
        max_length=255,
    )
    # Ta cho nó thứ tự để hiện lên cho khách hàng theo thứ tự nào
    order = models.IntegerField(verbose_name=_("Thứ tự"), help_text=_("Bắt buộc"), default=0)
    is_active = models.BooleanField(default=True)

    class Meta:
        verbose_name = _("Delivery Option")
        verbose_name_plural = _("Delivery Options")

    def __str__(self):
        return self.delivery_name


# Phương thức thanh toán
class PaymentOptions(models.Model):
    name = models.CharField(
        verbose_name=_("Tên phương thức"),
        help_text=_("Bắt buộc"),
        max_length=255,
    )
    is_active = models.BooleanField(default=True)
    class Meta:
        verbose_name = _("Payment Selection")
        verbose_name_plural = _("Payment Selections")

    def __str__(self):
        return self.name