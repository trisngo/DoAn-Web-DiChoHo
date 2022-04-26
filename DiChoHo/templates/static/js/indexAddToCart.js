$(function () {

    $(document).ready(function () {
        $(".jqueryCatch").on('click', function (e) {
            if (e.target !== e.currentTarget) return;
            e.preventDefault();
            var clickElementId = e.target.id;
            var csrf_token = document.getElementById('ctk').value;
            if (clickElementId.includes("productAdd")) {
                var prodid = clickElementId.replace("productAdd1", "");
                prodid = prodid.replace("productAdd2", "");
                prodid = prodid.replace("productAdd3", "");
                prodid = prodid.replace("productAdd4", "");
                prodid = prodid.replace("productAdd5", "");
                prodid = prodid.replace("productAdd6", "");
                var count = document.getElementById("cart_qty").innerHTML;
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
                        count++;
                        document.getElementById("cart_qty").innerHTML = count;
                        $("#success-alert").show();
                        $("#success-alert").fadeTo(2000, 500).slideUp(500, function () {
                            $("#success-alert").slideUp(500);
                        });
                    },
                    error: function (xhr, errmsg, err) { }
                });
            } else {
                var prodid = clickElementId.replace("wishlist1", "");
                prodid = prodid.replace("wishlist2", "");
                prodid = prodid.replace("wishlist3", "");
                prodid = prodid.replace("wishlist4", "");
                prodid = prodid.replace("wishlist5", "");
                prodid = prodid.replace("wishlist6", "");
                $.ajax({
                    type: 'POST',
                    url: '/wishlist/add',
                    data: {
                        productid: prodid,
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
        })
    });

});