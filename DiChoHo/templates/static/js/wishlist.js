$(function () {

    $(document).ready(function () {
        $("#jqueryCatchClick").on("click", function (e) {
            e.preventDefault();
            var clickElementId = e.target.id;
            var csrf_token = document.getElementById('ctk').value;
            if (clickElementId.includes("delete-")) {
                var prodid = clickElementId.replace("delete-button", "");
                prodid = prodid.replace("delete-span", "");
                $.ajax({
                    type: "POST",
                    url: '/cart/delete/',
                    data: {
                        productid: prodid,
                        csrfmiddlewaretoken: csrf_token,
                        action: "post",
                    },
                    success: function (json) {
                        $("#delete-button" + prodid).parent().parent().remove();
                    },
                    error: function (xhr, errmsg, err) { },
                });
            }
        });
    });

});