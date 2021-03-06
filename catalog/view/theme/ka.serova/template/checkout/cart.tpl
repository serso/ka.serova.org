<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
  <div class="top">
    <div class="left"></div>
    <div class="right"></div>
		<div class="center">
			<h1><?php echo $heading_title; ?></h1>
		</div>  </div>
  <div class="middle">
    <?php if ($error_warning) { ?>
    <div class="warning"><?php echo $error_warning; ?></div>
    <?php } ?>
    <form action="<?php echo str_replace('&', '&amp;', $action); ?>" method="post" enctype="multipart/form-data" id="cart">
      <table class="cart">
        <tr>
          <th align="center"><?php echo $column_remove; ?></th>
          <th align="center"><?php echo $column_image; ?></th>
          <th align="center"><?php echo $column_name; ?></th>
          <th align="center"><?php echo $column_model; ?></th>
          <th align="center"><?php echo $column_quantity; ?></th>
          <?php if ($display_price) { ?>
		  <th align="center"><?php echo $column_price; ?></th>
          <th align="center"><?php echo $column_total; ?></th>
          <th align="center">&nbsp;</th>
		  <?php } ?>
        </tr>
        <?php $class = 'odd'; ?>
        <?php foreach ($products as $product) { ?>
        <?php $class = ($class == 'even' ? 'odd' : 'even'); ?>
        <tr class="<?php echo $class; ?>">
          <td align="center"><input type="checkbox" name="remove[<?php echo $product['key']; ?>]" /></td>
          <td align="center"><a href="<?php echo str_replace('&', '&amp;', $product['href']); ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></td>
          <td align="center"><a href="<?php echo str_replace('&', '&amp;', $product['href']); ?>"><?php echo $product['name']; ?></a>
            <?php if (!$product['stock']) { ?>
            <span style="color: #FF0000; font-weight: bold;">***</span>
            <?php } ?>
            <div>
              <?php foreach ($product['option'] as $option) { ?>
              - <small><?php echo $option['name']; ?> <?php echo $option['value']; ?></small><br />
              <?php } ?>
            </div></td>
          <td align="center" ><?php echo $product['model']; ?></td>
          <td align="center" ><input type="text" name="quantity[<?php echo $product['key']; ?>]" id="product_<?php echo $product['key']; ?>" value="<?php echo $product['quantity']; ?>" size="3" /></td>
          <?php if ($display_price) { ?>
		  <td align="center" ><?php echo $product['price']; ?></td>
          <td align="center" ><?php echo $product['total']; ?></td>
		  <?php } ?>
			<td align="center"><a onclick="removeProduct('<?php echo $product['key']; ?>');$('#cart').submit();" class="button"><span><?php echo $column_remove; ?></span></a></td>
        </tr>
        <?php } ?>
		  <?php foreach ($totals as $total) { ?>
		  <tr class="totals">
          <td align="center">&nbsp;</td>
          <td align="center">&nbsp;</td>
          <td align="center">&nbsp;</td>
          <td align="center">&nbsp;</td>
          <td align="center">&nbsp;</td>
          <?php if ($display_price) { ?>
		  <td align="right"><b><?php echo $total['title']; ?></b></td>
          <td align="center"><b><?php echo $total['text']; ?></b></td>
		  <?php } ?>
		<td align="center">&nbsp;</td>
        </tr>
		  <?php } ?>

      </table>
    </form>
	  <div class="buttons" style="float:left;width:100%;">
		  <table>
			  <tr>
				  <td align="left">
					  <a class="button" onclick="history.back();"><span><?php echo $button_back; ?></span></a>
				  </td>
				  <td align="center">&nbsp;</td>
				  <td align="right">
					  <a onclick="$('#cart').submit();" class="button"><span><?php echo $button_update; ?></span></a>
					  <a onclick="location = '<?php echo str_replace('&amp;', '&', $checkout); ?>'" class="button"><span><?php echo $button_checkout; ?></span></a>
				  </td>
			  </tr>
		  </table>
	  </div>
  </div>
  <div class="bottom">
    <div class="left"></div>
    <div class="right"></div>
    <div class="center"></div>
  </div>
</div>

	<script type="text/javascript">
		function removeProduct (productId) {
			$('#product_' + productId).val(0);
		}
	</script>
<?php echo $footer; ?> 