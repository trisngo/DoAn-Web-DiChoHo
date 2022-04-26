$(function () {

    $(document).ready(function () {
        $(".jqueryCatch").on('click', function (e) {
            if (e.target !== e.currentTarget) return;
            e.preventDefault();
            var clickElementId = e.target.id;
            var csrf_token = document.getElementById('csrf_token_id').value;
            if (clickElementId.includes("productAdd")) {
                var prodid = clickElementId.replace("productAdd1", "");
                prodid = prodid.replace("productAdd2", "");
                $.ajax({
                    type: 'POST',
                    url: '/cart/add/',
                    data: {
                        productid: prodid,
                        productqty: 1,
                        csrfmiddlewaretoken: csrf_token,
                        action: 'post'
                    },
                    success: function (json) {
                        $("#success-alert").show();
                        $("#success-alert").fadeTo(2000, 500).slideUp(500, function () {
                            $("#success-alert").slideUp(500);
                        });
                    },
                    error: function (xhr, errmsg, err) { }
                });
            }
            else if (clickElementId.includes("wishlist")) {
                var prodid = clickElementId.replace("wishlist1", "");
                prodid = prodid.replace("wishlist2", "");
                var count = document.getElementById("cart_qty").innerHTML;
                $.ajax({
                    type: 'POST',
                    url: '/wishlist/add',
                    data: {
                        productid: prodid,
                        csrfmiddlewaretoken: csrf_token,
                        action: 'post'
                    },
                    success: function (json) {
                        count++;
                        document.getElementById("cart_qty").innerHTML = count;
                        $("#success-alert").show();
                        $("#success-alert").fadeTo(2000, 500).slideUp(500, function () {
                            $("#success-alert").slideUp(500);
                        });
                    },
                    error: function (xhr, errmsg, err) { }
                });
            }
            else {
                var prodid = parseInt(clickElementId.replace("current_product", ""));
                var product_qty = parseInt(document.getElementById("quantity").value);
                if (isNaN(product_qty)) {
                    alert("Số lượng sản phẩm không hợp lệ!");
                    document.getElementById("quantity").value = 1;
                }
                else {
                    $.ajax({
                        type: 'POST',
                        url: '/cart/add/',
                        data: {
                            productid: prodid,
                            productqty: product_qty,
                            csrfmiddlewaretoken: csrf_token,
                            action: 'post'
                        },
                        success: function (json) {
                            window.location.href = '/cart/'
                        },
                        error: function (xhr, errmsg, err) { }
                    });
                }
            }
        });

        $(".quantity-left-minus").on('click', function (e) {
            var product_qty = parseInt(document.getElementById("quantity").value);
            if (product_qty <= 1) {
                alert("Không thể giảm số lượng sản phẩm xuống nữa");
            } else {
                document.getElementById("quantity").value = product_qty - 1;
            }
        });

        $(".quantity-right-plus").on('click', function (e) {
            var product_qty = parseInt(document.getElementById("quantity").value);
            if (product_qty >= 100) {
                alert("Không thể tăng số lượng sản phẩm lên nữa");
            } else {
                document.getElementById("quantity").value = product_qty + 1;
            }
        });

        $("#quantity").on("keypress", function (e) {
            if (e.which == 13) {
                var product_qty = parseInt(document.getElementById("quantity").value);
                if (product_qty > 100 || product_qty < 1) {
                    alert("Số lượng sản phẩm không hợp lệ!");
                    document.getElementById("quantity").value = 1;
                }
            }

        });
    });

});