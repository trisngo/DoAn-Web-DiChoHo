$(function () {

    $(document).ready(function () {
        $("#jqueryCatchClick").on("keypress", function (e) {
            if (e.which == 13) {
                var onlyproductid = e.target.id.replace("input", "");
                var productqty = document.getElementById(e.target.id).value;
                var td_id = "price_" + e.target.id;
                var productprice = document.getElementById(td_id).innerText;
                productprice = productprice.replace("đ", "");
                var csrf_token = document.getElementById('csrf_token_id').value;
                document.getElementById("total" + td_id).innerText =
                    productprice * productqty + "đ";
                $.ajax({
                    type: "POST",
                    url: '/cart/update/',
                    data: {
                        productid: onlyproductid,
                        productqty: productqty,
                        csrfmiddlewaretoken: csrf_token,
                        action: "post",
                    },
                    success: function (json) {
                        document.getElementById("totalPrice").innerText = json.subtotal + "đ";
                    },
                    error: function (xhr, errmsg, err) { },
                });
            }
        });

        $("#jqueryCatchClick").on("click", function (e) {
            e.preventDefault();
            var clickElementId = e.target.id;
            var csrf_token = document.getElementById('csrf_token_id').value;
            if (clickElementId.includes("delete-")) {
                var prodid = clickElementId.replace("delete-button", "");
                prodid = prodid.replace("delete-span", "");
                var count = document.getElementById("cart_qty").innerHTML;
                $.ajax({
                    type: "POST",
                    url: '/cart/delete/',
                    data: {
                        productid: prodid,
                        csrfmiddlewaretoken: csrf_token,
                        action: "post",
                    },
                    success: function (json) {
                        count--;
                        document.getElementById("cart_qty").innerHTML = count;
                        document.getElementById("totalPrice").innerText = json.subtotal + "đ";
                        $("#delete-button" + prodid).parent().parent().remove();
                        if (json.qty == 0) {
                            total = 0
                            subtotal = 0
                        } else {
                            total = (parseFloat(json.subtotal) + 11.50).toFixed(2);
                            subtotal = json.subtotal
                        }
                    },
                    error: function (xhr, errmsg, err) { },
                });
            }
        });
    });

});