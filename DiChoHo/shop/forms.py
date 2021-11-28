from django import forms
from .models import Address, Profile, User

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
       
class UserForm(forms.ModelForm):

    email = forms.EmailField(
        label='Email của tài khoản (yêu cầu)', max_length=200, widget=forms.TextInput(
            attrs={'class': 'form-control mb-3', 'placeholder': 'email', 'id': 'form-email'}))

    username = forms.CharField(
        label='Tên người dùng (không thể thay đổi)', max_length=100, widget=forms.TextInput(
            attrs={'class': 'form-control mb-3', 'placeholder': 'username', 'id': 'form-username', 'readonly': 'readonly'}))

    first_name = forms.CharField(
        label='Tên của bạn (yêu cầu)', max_length=100, widget=forms.TextInput(
            attrs={'class': 'form-control mb-3', 'placeholder': 'Firstname', 'id': 'form-firstname'}))
    
    last_name = forms.CharField(
        label='Họ của bạn (yêu cầu)', max_length=100, widget=forms.TextInput(
            attrs={'class': 'form-control mb-3', 'placeholder': 'Lastname', 'id': 'form-lastname'}))

    class Meta:
        model = User
        fields = ('email', 'username', 'first_name', 'last_name')

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)
        self.fields['username'].required = True
        self.fields['email'].required = True
        self.fields['first_name'].required = True
        self.fields['last_name'].required = True

class ProfileForm(forms.ModelForm):


    class Meta:
        model = Profile
        fields = ["birth_date", "phone", "profile_pic"]

    def __init__(self, *args, **kwargs):
        super().__init__(*args, **kwargs)

