$(document).ready(function () {
	$('#add_to_cart').removeAttr('onclick');

	$('#add_to_cart').click(function () {
		$.ajax({
			type: 'post',
			url: 'index.php?route=module/cart/callback',
			dataType: 'html',
			data: $('#product :input'),
			success: function (html) {
				$('#module_cart .middle').html(html);
			},	
			complete: function () {
				var image = $('#image').offset();
				var cart  = $('#module_cart').offset();
	
				$('#image').before('<img src="' + $('#image').attr('src') + '" id="temp" style="position: absolute; top: ' + image.top + 'px; left: ' + image.left + 'px;" />');
	
				params = {
					top : cart.top + 'px',
					left : cart.left + 'px',
					opacity : 0.0,
					width : $('#module_cart').width(),  
					height : $('#module_cart').height()
				};		
	
				$('#temp').animate(params, 'slow', false, function () {
					$('#temp').remove();
				});		
			}			
		});			
	});			
});

function addToCart(productId, elementId, text) {
	$.ajax({
		type: 'post',
		url: 'index.php?route=module/cart/callback',
		dataType: 'html',
		data: {'product_id': productId, 'quantity': 1, 'noNeedResultHtml': 'anyVar'},
		success: function (html) {
			$('#' + elementId + " .button_add_small").after('<div class="added_item">' + text + '</div>');
			$('#goodsInBasket').each(function(index, span) {
				if ( isNumber(span.innerHTML) ) {
					span.innerHTML = 1 + parseInt(span.innerHTML);
				}
			});

			setTimeout(function() {
				$('.added_item').slideUp(1000);
			}, 2000);
		},
		complete: function () {
			/*var image = $('#image').offset();
			var cart = $('#module_cart').offset();

			$('#image').before('<img src="' + $('#image').attr('src') + '" id="temp" style="position: absolute; top: ' + image.top + 'px; left: ' + image.left + 'px;" />');

			params = {
				top : cart.top + 'px',
				left : cart.left + 'px',
				opacity : 0.0,
				width : $('#module_cart').width(),
				height : $('#module_cart').height()
			};

			$('#temp').animate(params, 'slow', false, function () {
				$('#temp').remove();
			});*/
		}
	});
}

function isNumber (o) {
  return ! isNaN (o-0);
}