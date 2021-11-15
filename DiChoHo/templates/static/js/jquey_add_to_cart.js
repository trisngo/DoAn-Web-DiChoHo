$(document).on('click', '#add_to_cart_btn', function (e) {
    e.preventDefault();
    $.ajax({
        type: 'POST',
        url: '{% url "cart_add" %}',
        data: {
            productid: $(this).data("value"),
            productqty: 1,
            // chưa làm được quantity nên mặc định là 1
            //   productqty: $('#id').text(),
            csrfmiddlewaretoken: "{{csrf_token}}",
            action: 'post'
        },
        success: function (json) {
            document.getElementById("cart-qty").innerHTML = json.qty
        },
        error: function (xhr, errmsg, err) { }
    });
})