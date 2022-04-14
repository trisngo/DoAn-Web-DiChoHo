# Đồ án Đi chợ hộ
Đây là đồ án của nhóm 12 môn Lập trình web, sử dụng Python phiên bản 3.9, django framework version 3.2.7 và MySQL


## Tác giả

- [@Ngô Đức Trí](https://github.com/trisngo)
- [@Bùi Quốc Huy](https://github.com/quochuyy10217)
- [@Bùi Đức Anh](https://github.com/BuiDucAnh68)
## Cài đặt

Để tiến hành cài đặt, hãy clone project này về local với câu lệnh:

```bash
  git clone https://github.com/trisngo/project-web-dichoho.git
```

Sau đó tiến hành cài đặt môi trường cần thiết cho project sử dụng câu lệnh sau:

```bash
  pip install -r requirements.txt
```

Ta vào file ``DiChoHo/settings.py`` để cấu hình các tùy chọn sau:

- Cấu hình để kết nối được với MySQL

```bash
DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.mysql', 
        'NAME': "", # Tên database sử dụng
        'USER': "", # Tên tài khoản sử dụng
        'PASSWORD': "", # Mật khẩu sử dụng
        'HOST': 'localhost',
        'PORT': '3306',
    }
}
```
- Cấu hình thiết lập host email gửi email cho người dùng
```bash
EMAIL_BACKEND = "django.core.mail.backends.smtp.EmailBackend"
EMAIL_HOST = 'smtp.gmail.com'
EMAIL_HOST_USER ='' # Email sử dung để gửi mail tới khách hàng
EMAIL_HOST_PASSWORD = '' # Mật khẩu email
EMAI_PORT = 587
EMAIL_USE_TLS = True
```

Sau khi đã cài đặt và cấu hình xong nếu bạn muốn sử dụng database có sẵn thì tiến hành Import database được đính kèm nằm ở thư mục ``DiChoHo/database_export/`` vào MySQL Workbench

Tiếp theo di chuyển đến thư mục có chứa file manage.py và apply dữ liệu cho database bằng 2 câu lệnh sau:

```bash
  python3 manage.py makemigrations
  python3 manage.py migrate
```

## Chạy local

Bắt đầu chạy website với lệnh sau:

```bash
python3 manage.py runserver
```
Sau đó truy cập tại đường dẫn ``http://127.0.0.1:8000/``

Bạn có thể vào file settings.py và đặt DEBUG = False nghĩa là khi website có lỗi thì sẽ không hiện thông tin lỗi trên trình duyệt, tuy nhiên cần phải chạy lệnh sau để cho phép chương trình load được page 404.html và các file css, js: 

```bash
python3 manage.py runserver --insecure
```

## Chạy với Docker

Tại thư mục gốc có chứa docker-compose.yml chạy lệnh sau:
```bash
docker-compose up
```
Bạn đợi 1 lúc để database hoàn thành khởi tạo và được import dữ liệu vào. Sau đó web đã chạy thành công. Sau đó truy cập tại đường dẫn ``http://127.0.0.1:8000/``

## Phụ Lục

Các tài khoản sử dụng trong project có thể được tìm thấy ở ``DiChoHo/account_test.txt``

