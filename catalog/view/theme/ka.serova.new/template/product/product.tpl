<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
	<div class="top">
		<div class="left">
			<script type="text/javascript" src="catalog/view/javascript/jquery/ajax_add.js"></script>
		</div>
		<div class="right"></div>
		<div class="center">
			<h1><?php echo $heading_title; ?></h1>
		</div>
	</div>
    <div class="middle">
        <div style="width: 100%; margin-bottom: 30px;">
            <table style="width: 100%; border-collapse: collapse;">
                <tr>
                    <td style="text-align: center; width: 250px; vertical-align: top;"><a href="<?php echo $popup; ?>"
                                                                                          title="<?php echo $heading_title; ?>"
                                                                                          class="thickbox"
                                                                                          rel="gallery"><img
                                    src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>"
                                    alt="<?php echo $heading_title; ?>" id="image"
                                    style="margin-bottom: 3px;"/></a><br/>
                        <span style="font-size: 11px;"><?php echo $text_enlarge; ?></span></td>
                    <td style="padding-left: 15px; width: 296px; vertical-align: top;">

              <span style="position: relative; float: left; width: 100%; margin-top: 50px;">
              <table class="product-description">
                  <tr>
                      <td colspan="2" class="heading">
                          <?php echo $heading_title; ?>
                      </td>
                  </tr>
                  <?php if ($description) { ?>
                      <tr>
                          <td colspan="2">
                              <?php echo $description; ?>
                          </td>
                      </tr>
                  <?php } ?>
                  <?php if ($display_price) { ?>
                  <tr>
                      <td><?php echo $text_price; ?></td>
                      <td><?php if (!$special) { ?>
                          <?php echo $price; ?>
                          <?php } else { ?>
                          <span style="text-decoration: line-through;"><?php echo $price; ?></span> <span
                                  style="color: #F00;"><?php echo $special; ?></span>
                          <?php } ?></td>
                  </tr>
                  <?php } ?>
                  <tr>
                      <td><?php echo $text_availability; ?></td>
                      <td><?php echo $stock; ?></td>
                  </tr>
                  <tr>
                      <td><?php echo $text_model; ?></td>
                      <td><?php echo $model; ?></td>
                  </tr>

                  <?php if ($review_status) { ?>
                  <tr>
                      <td><?php echo $text_average; ?></td>
                      <td><?php if ($average) { ?>
                          <img src="catalog/view/theme/default/image/stars_<?php echo $average . '.png'; ?>"
                               alt="<?php echo $text_stars; ?>" style="margin-top: 2px;"/>
                          <?php } else { ?>
                          <?php echo $text_no_rating; ?>
                          <?php } ?></td>
                  </tr>
                  <?php } ?>
                  <?php if ($display_price) { ?>
                  <tr style="margin-top: 10px;">
                      <td>
                          <div class="menu">
                              <ul style="margin: 0px">
                                  <li style="margin: 0px">
                                      <a onclick="history.back();">
                                          <div class="menu-icon"><img src="catalog/view/theme/ka.serova.new/image/back.png"></div><?php echo $button_back; ?>
                                      </a>
                                  </li>
                              </ul>
                          </div>
                      </td>
                      <td>
                          <div class="menu">
                              <ul style="margin: 0px">
                                  <li style="margin: 0px">
                                      <a title="<?php echo $button_add_to_cart; ?>"
                                         onclick="addToCart(<?php echo $product_id; ?>, null, '<?php echo "<a href=" . str_replace('&', '&amp;', $cart) . ">" . $text_added_to_cart ."</a>";?>')">
                                      <div class="menu-icon"><img src="catalog/view/theme/ka.serova.new/image/cart.png"></div><?php echo $button_add_to_cart; ?>
                                      </a>
                                  </li>
                              </ul>
                          </div>
                      </td>
                  </tr>
                  <?php } ?>
              </table>
              </span></td>
                </tr>
            </table>
        </div>
    <div class="tabs">
      <a tab="#tab_related"><div class="menu-icon"><img src="catalog/view/theme/ka.serova.new/image/recommended.png"></div><?php echo $tab_related; ?> (<?php echo count($products); ?>)</a>
      <a tab="#tab_image"><div class="menu-icon"><img src="catalog/view/theme/ka.serova.new/image/images.png"></div><?php echo $tab_image; ?>  (<?php echo count($images); ?>)</a>
      <?php if ($review_status) { ?><a tab="#tab_review"><?php echo $tab_review; ?></a><?php } ?>
    </div>
    <?php if ($review_status) { ?>
    <div id="tab_review" class="tab_page">
      <div id="review"></div>
      <div class="heading" id="review_title"><?php echo $text_write; ?></div>
      <div class="content"><b><?php echo $entry_name; ?></b><br />
        <input type="text" name="name" value="" />
        <br />
        <br />
        <b><?php echo $entry_review; ?></b>
        <textarea name="text" style="width: 98%;" rows="8"></textarea>
        <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
        <br />
        <b><?php echo $entry_rating; ?></b> <span><?php echo $entry_bad; ?></span>&nbsp;
        <input type="radio" name="rating" value="1" style="margin: 0;" />
        &nbsp;
        <input type="radio" name="rating" value="2" style="margin: 0;" />
        &nbsp;
        <input type="radio" name="rating" value="3" style="margin: 0;" />
        &nbsp;
        <input type="radio" name="rating" value="4" style="margin: 0;" />
        &nbsp;
        <input type="radio" name="rating" value="5" style="margin: 0;" />
        &nbsp; <span><?php echo $entry_good; ?></span><br />
        <br />
        <b><?php echo $entry_captcha; ?></b><br />
        <input type="text" name="captcha" value="" autocomplete="off" />
        <br />
        <img src="index.php?route=product/product/captcha" id="captcha" /></div>
      <div class="buttons">
        <table>
          <tr>
            <td align="right"><a onclick="review();" class="button"><span><?php echo $button_continue; ?></span></a></td>
          </tr>
        </table>
      </div>
    </div>
    <?php } ?>

	<div id="tab_image" class="tab_page">
      <?php if ($images) { ?>
      <div style="display: inline-block;">
        <?php foreach ($images as $image) { ?>
        <div style="display: inline-block; float: left; text-align: center; margin-left: 5px; margin-right: 5px; margin-bottom: 10px;"><a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="thickbox" rel="gallery"><img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" style="border: 1px solid #DDDDDD; margin-bottom: 3px;" /></a><br />
          <span style="font-size: 11px;"><?php echo $text_enlarge; ?></span></div>
        <?php } ?>
      </div>
      <?php } else { ?>
      <div style="background: #fdfdfd; border: 1px solid #e3e3e3; padding: 10px; margin-bottom: 10px;"><?php echo $text_no_images; ?></div>
      <?php } ?>
    </div>
    <div id="tab_related" class="tab_page">
      <?php if ($products) { ?>
      <table class="list">
        <?php for ($i = 0; $i < sizeof($products); $i = $i + 4) { ?>
        <tr>
          <?php for ($j = $i; $j < ($i + 4); $j++) { ?>
          <td width="25%"><?php if (isset($products[$j])) { ?>
            <a href="<?php echo str_replace('&', '&amp;', $products[$j]['href']); ?>"><img src="<?php echo $products[$j]['thumb']; ?>" title="<?php echo $products[$j]['name']; ?>" alt="<?php echo $products[$j]['name']; ?>" /></a><br />
            <a href="<?php echo str_replace('&', '&amp;', $products[$j]['href']); ?>"><?php echo $products[$j]['name']; ?></a><br />
            <span style="color: #999; font-size: 11px;"><?php echo $products[$j]['model']; ?></span><br />
            <?php if ($display_price) { ?>
            <?php if (!$products[$j]['special']) { ?>
            <span style="color: #900; font-weight: bold;"><?php echo $products[$j]['price']; ?></span>
            <?php } else { ?>
            <span style="color: #900; font-weight: bold; text-decoration: line-through;"><?php echo $products[$j]['price']; ?></span> <span style="color: #F00;"><?php echo $products[$j]['special']; ?></span>
            <?php } ?>
			<a class="button_add_small" href="<?php echo $products[$j]['add']; ?>" title="<?php echo $button_add_to_cart; ?>" >&nbsp;</a>
            <?php } ?>
            <br />
            <?php if ($products[$j]['rating']) { ?>
            <img src="catalog/view/theme/default/image/stars_<?php echo $products[$j]['rating'] . '.png'; ?>" alt="<?php echo $products[$j]['stars']; ?>" />
            <?php } ?>
            <?php } ?></td>
          <?php } ?>
        </tr>
        <?php } ?>
      </table>
      <?php } else { ?>
      <div style="background: #fdfdfd; border: 1px solid #e3e3e3; padding: 10px; margin-bottom: 10px;"><?php echo $text_no_related; ?></div>
      <?php } ?>
    </div>
  </div>
  <div class="bottom">
    <div class="left"></div>
    <div class="right"></div>
    <div class="center"></div>
  </div>
  <?php if ($tags) { ?>
  <div class="tags"><?php echo $text_tags; ?>
  <?php foreach ($tags as $i => $tag) { ?>
  <a href="<?php echo $tag['href']; ?>"><?php echo $tag['tag']; ?></a><?php if ( $i + 1< count($tags)) {
				echo ",";
		  }
			?>
  <?php } ?>
  </div>
  <?php } ?>
</div>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').slideUp('slow');
		
	$('#review').load(this.href);
	
	$('#review').slideDown('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

function review() {
	$.ajax({
		type: 'POST',
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#review_button').attr('disabled', 'disabled');
			$('#review_title').after('<div class="wait"><img src="catalog/view/theme/default/image/loading_1.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#review_button').attr('disabled', '');
			$('.wait').remove();
		},
		success: function(data) {
			if (data.error) {
				$('#review_title').after('<div class="warning">' + data.error + '</div>');
			}
			
			if (data.success) {
				$('#review_title').after('<div class="success">' + data.success + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
}
//--></script>
<script type="text/javascript"><!--
$.tabs('.tabs a'); 
//--></script>
<?php echo $footer; ?> 