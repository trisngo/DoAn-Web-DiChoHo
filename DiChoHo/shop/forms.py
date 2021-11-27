from django import forms
from .models import Address

class AddressForm(forms.ModelForm):
    class Meta:
        model = Address
        fields = ["full_name", "phone", "address_line", "city"]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields["full_name"].widget.attrs.update(
            {"class": "form-control account-form mb-2", "placeholder": "Họ tên nhận hàng"}
        )
        self.fields["phone"].widget.attrs.update(
            {"class": "form-control account-form mb-2", "placeholder": "Số điện thoại nhận hàng"}
        )
        self.fields["address_line"].widget.attrs.update(
            {"class": "form-control account-form mb-2", "placeholder": "Địa chỉ nhận hàng"}
        )
        self.fields["city"].widget.attrs.update(
            {"class": "form-control account-form mb-2", "placeholder": "Thành Phố/Tỉnh"}
        )
       

