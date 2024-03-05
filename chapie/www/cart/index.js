$(document).ready(function(){

    //Decrease quantity
    $(".minus-btn").click(function(e){
        e.preventDefault();
        var itemId = $(this).attr("data-item-id");
        var quanityInput = $(".qty-input[data-item-id='" + itemId + "']");
        let currentQuantity = parseInt(quanityInput.val());
        if(currentQuantity > 1){
            quanityInput.val(currentQuantity - 1);
            updateCart(itemId, currentQuantity - 1);
        }

        var price = ($(".item-price[data-item-id='" + itemId + "']")).attr("value");
        var priceInt = parseFloat(price).toFixed(2);

        var totalPrice = priceInt * currentQuantity;
        $('.item-subtotal-price[data-item-id="' + itemId + '"]').text("RM" + totalPrice.toFixed(2));
        
        updateTotalPrice(); // update total price


    })

      // Increase quantity button
    $(".plus-btn").click(function(e) {
        e.preventDefault();
        var itemId = $(this).attr("data-item-id");
        var quantityInput = $(".qty-input[data-item-id='" + itemId + "']");
        let currentQuantity = parseInt(quantityInput.val());
        quantityInput.val(currentQuantity + 1);
        updateCart(itemId, currentQuantity + 1);

        var price = ($(".item-price[data-item-id='" + itemId + "']")).attr("value");
        var priceInt = parseFloat(price);

        var totalPrice = priceInt * currentQuantity;
        $('.item-subtotal-price[data-item-id="' + itemId + '"]').text("RM" + totalPrice.toFixed(2));
        
        updateTotalPrice(); // update total price


    });

    $(".remove-btn").click(function(e) {
      e.preventDefault();
      var itemId = $(this).attr("data-item-id");
      removeItem(itemId);

      updateTotalPrice(); // update total price

    });
});

function removeItem(itemId){
  $.ajax({
    url: 'remove_cart.php',
    type: 'POST',
    data: {
      itemId: itemId,
    },
    success: function(response) {
      console.log(response);
      $('.qty-btn[data-item-id="' + itemId + '"]').closest('tr').remove();
      
    },
    error: function(jqXHR, textStatus, errorThrown) {
      console.log(textStatus, errorThrown);
    }
  });
}

function updateCart(itemId, quantity){
    $.ajax({
        url: 'update_cart.php',
        type: 'POST',
        data: {
          itemId: itemId,
          quantity: quantity
        },
        success: function(response) {
          console.log(response);

        },
        error: function(jqXHR, textStatus, errorThrown) {
          console.log(textStatus, errorThrown);
        }
    });
}  

function updateTotalPrice() {
  var totalPrice = 0;
  $('.item-subtotal-price').each(function() {
      var subtotal = parseFloat($(this).text().replace('RM', ''));
      totalPrice += subtotal;
  });
  $('#total-price').text('RM ' + totalPrice.toFixed(2));
}