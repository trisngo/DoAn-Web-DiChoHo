$(function () {

    function Toggle() {
        var temp = document.getElementById("typepass");
        if (temp.type === "password") {
            temp.type = "text";
        } else {
            temp.type = "password";
        }
    }

    function Toggle1() {
        var temp = document.getElementById("typepassnew");
        if (temp.type === "password") {
            temp.type = "text";
        } else {
            temp.type = "password";
        }
    }

    function Toggle2() {
        var temp = document.getElementById("typepassconfirmnew");
        if (temp.type === "password") {
            temp.type = "text";
        } else {
            temp.type = "password";
        }
    }

    $('.submit_evaluation').on('click', function (e) {
        e.preventDefault();
        $('#guidanhgia').modal('toggle');
        return false;
    });

    $(document).ready(function () {
        var prodid = "";
        var csrf_token = document.getElementById('ctk').value;
        $(".jQueryEvaluate").on("click", function (e) {
            if (e.target !== e.currentTarget) return;
            e.preventDefault();
            var clickElementId = e.target.id;
            if (clickElementId.includes("evaluate")) {
                prodid = clickElementId.replace("evaluate", "");
            }
        });

        $("#sendRating").on("click", function (event) {
            var contentRating = document.getElementById("form3").value;
            var starRating = parseFloat(document.getElementById("form2").value);
            console.log(contentRating);
            $.ajax({
                type: 'POST',
                url: '/profile/review',
                data: {
                    productid: prodid,
                    star: starRating,
                    content: contentRating,
                    csrfmiddlewaretoken: csrf_token,
                    action: 'post'
                },
                success: function (json) {
                    document.getElementById("form3").value = "";
                    document.getElementById("form2").value = "";
                    $("#success-alert").show();
                    $("#success-alert").fadeTo(2000, 500).slideUp(500, function () {
                        $("#success-alert").slideUp(500);
                    });
                },
                error: function (xhr, errmsg, err) { }
            });
        })
    });

});