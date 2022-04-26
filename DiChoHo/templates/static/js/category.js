$(function () {

    var urlArray = window.location.href.split("/");
    if (urlArray[urlArray.length - 2] == "rau-cu") {
        document.getElementById("raucu").classList.add('active');
    } else if (urlArray[urlArray.length - 2] == "trai-cay") {
        document.getElementById("traicay").classList.add('active');
    } else if (urlArray[urlArray.length - 2] == "thit") {
        document.getElementById("thit").classList.add('active');
    } else if (urlArray[urlArray.length - 2] == "do-uong") {
        document.getElementById("douong").classList.add('active');
    } else {
        document.getElementById("ca").classList.add('active');
    }

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
            } else {
                var prodid = clickElementId.replace("wishlist1", "");
                prodid = prodid.replace("wishlist2", "");
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