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
        if data.any_product
          $('.cart-button').removeClass('hidden')

  $('#available-colors').on 'click', 'li', (event) ->
    event.preventDefault();
    $('.selected_color').each ->
      $(this).removeClass('selected_color')
      $(this).addClass('color_li_border')
    $(this).removeClass('color_li_border')
    $(this).addClass('selected_color')