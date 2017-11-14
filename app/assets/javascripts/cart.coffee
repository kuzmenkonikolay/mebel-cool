$(document).ready ->
  $('#add_to_cart_button').on 'click', (event) ->
    type = $(this).data('product_type')
    color = $('.selected_color').data('color_id')
    quantity = $('#selectbox-quantity').val()
    product_id = $('#product_id_input').val()
    $.ajax
      type: 'post'
      url: '/add_to_cart'
      data: {type: type, color: color, quantity: quantity, product_id: product_id}
      success: (data) ->
        if data.any_product && data.status == 'success'
          $.toast
            text: 'Товар добавлен в корзину!'
            position: 'top-right'
            loaderBg: '#fff'
            icon: 'success'
            hideAfter: 5500
            stack: 6
          $('.cart-button').removeClass('hidden')

  $('#available-colors').on 'click', 'li', (event) ->
    event.preventDefault();
    $('.selected_color').each ->
      $(this).removeClass('selected_color')
      $(this).addClass('color_li_border')
    $(this).removeClass('color_li_border')
    $(this).addClass('selected_color')

  $('#submit_order_button').on 'click', (e) ->
    e.preventDefault()
    $('#submit_order').modal('show');

  $('#submit_order_button_modal').on 'click', (e) ->
    $(this).attr('disabled', true)
    e.preventDefault()
    number = $('#client_phone_number').val()
    email = $('#client_email').val()
    $.ajax
      type: 'post'
      url: '/create_order'
      data: {number: number, email: email}
      success: (data) ->
        if data.status == 'success'
          $('#submit_order').modal('hide');
          $.toast
            text: data.msg
            position: 'top-right'
            loaderBg: '#fff'
            icon: 'success'
            hideAfter: 5500
            stack: 6
          setTimeout("location.reload();", 2000);

window.onload = (event) ->
  priceCounter();

priceCounter = () ->
  price = 0;
  $('.product-cart-price').each ->
    price += +$(this).html()
  $('#total-cart-price').html('Итого: ' + Math.round(price) + ' р.')