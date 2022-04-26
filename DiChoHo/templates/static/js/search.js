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
        })
    });

});