<?php if ($ajax) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajax_add.js"></script>
<?php } ?>

<script type="text/javascript"><!--

function getUrlParam(name) {
  var name = name.replace(/[\[]/,"\\\[").replace(/[\]]/,"\\\]");
  var regexS = "[\\?&]"+name+"=([^&#]*)";
  var regex = new RegExp(regexS);
  var results = regex.exec(window.location.href);
  if (results == null)
    return "";
  else
    return results[1];
}

$(document).ready(function () {
	$('.cart_remove').live('click', function () {
		if (!confirm('<?php echo $text_confirm; ?>')) {
			return false;
		}
		$(this).removeClass('cart_remove').addClass('cart_remove_loading');
		$.ajax({
			type: 'post',
			url: 'index.php?route=module/cart/callback',
			dataType: 'html',
			data: 'remove=' + this.id,
			success: function (html) {
				$('#module_cart .middle').html(html);
				if (getUrlParam('route').indexOf('checkout') != -1) {
					window.location.reload();
				}
			}
		});
	});
});
//--></script>