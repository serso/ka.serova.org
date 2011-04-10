<?php echo $header; ?><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content">
  <div class="top">
    <div class="left"></div>
    <div class="right"></div>
    <div class="center"></div>
  </div>
  <div class="middle">

	  <?php if ($description) { ?>
		<div><?php echo $description; ?></div>
	<?php } ?>

	<?php if (!$categories && !$products) { ?>
    	<div class="content"><?php echo $text_error; ?></div>
    <?php } ?>

	<?php if ($categories) { ?>
		<table class="list">
		  <?php for ($i = 0; $i < sizeof($categories); $i = $i + 4) { ?>
		  <tr>
			<?php for ($j = $i; $j < ($i + 4); $j++) { ?>
			<td width="25%"><?php if (isset($categories[$j])) { ?>
			  <a href="<?php echo $categories[$j]['href']; ?>"><img src="<?php echo $categories[$j]['thumb']; ?>" title="<?php echo $categories[$j]['name']; ?>" alt="<?php echo $categories[$j]['name']; ?>" style="margin-bottom: 3px;" /></a><br />
			  <a href="<?php echo $categories[$j]['href']; ?>"><?php echo $categories[$j]['name']; ?></a>
			  <?php } ?></td>
			<?php } ?>
		  </tr>
		  <?php } ?>
		</table>
    <?php } ?>

	<?php if ($products) { ?>

	  <!-- Start Advanced Gallery Html Containers -->
	  <div id="gallery" class="content">

		  <div id="controls" class="controls"></div>

		  <div class="slideshow-container">
			  <div id="loading" class="loader"></div>
			  <div id="selected_image" class="slideshow"></div>
		  </div>

		  <div id="caption" class="caption-container"></div>
	  </div>


	  <div id="thumbs" class="navigation">
		  <ul class="thumbs noscript">
			  <?php foreach( $products as $product ) { ?>

			  <li>
				  <a class="thumb" name="<?php echo $product['product_id']; ?>" href="<?php echo $product['image']; ?>" title="<?php echo $product['name']; ?>" id="<?php echo $product['product_id']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="Title #0"/></a>

				  <div class="caption">

					  <div class="image-title">
						  <div class="left"><?php echo $product['name']; ?></div>
						  <div class="right">
							  <?php if ($display_price) { ?>
								<?php if (!$product['special']) { ?>
									<span class="price"><?php echo $product['price']; ?></span>
								<?php } else { ?>
									<span class="price" style="text-decoration: line-through; opacity:0.3;"><?php echo $product['price']; ?></span>
									<span class="price"><?php echo $product['special']; ?></span>
								<?php } ?>

							<a class="button_add_small" title="<?php echo $button_add_to_cart; ?>" onclick="addToCart(<?php echo $product['product_id']; ?>, 'caption', '<?php echo "<a href=" . str_replace('&', '&amp;', $cart) . ">" . $text_added_to_cart . "</a>";?>')">&nbsp;</a>
							<a class="button_buy_now" href="<?php echo $product['add']; ?>" title="<?php echo $text_buy; ?>" >&nbsp;</a>


							  <?php } ?>
						  </div>
					  	</div>

					  <?php if ($product['description']) { ?>
						  <div class="image-desc"><?php echo $product['description']; ?></div>
					  <?php } ?>

				  </div>
			  </li>
			  <?php } ?>

		  </ul>
	  </div>

	  <script type="text/javascript">
	jQuery(document).ready(function($) {
		// We only want these styles applied when javascript is enabled
		$('div.navigation').css({'width' : '300px', 'float' : 'left'});
		$('div.content').css('display', 'block');

		// Initially set opacity on thumbs and add
		// additional styling for hover effect on thumbs
		var onMouseOutOpacity = 0.67;
		$('#thumbs ul.thumbs li').opacityrollover({
			mouseOutOpacity:   onMouseOutOpacity,
			mouseOverOpacity:  1.0,
			fadeSpeed:		 'fast',
			exemptionSelector: '.selected'
		});

		// Initialize Advanced Galleriffic Gallery
		var gallery = $('#thumbs').galleriffic({
			delay:						2500,
			numThumbs:					15,
			preloadAhead:				10,
			enableTopPager:				true,
			enableBottomPager:			true,
			maxPagesToShow:				7,
			imageContainerSel:			'#selected_image',
			controlsContainerSel:		'#controls',
			captionContainerSel:		'#caption',
			loadingContainerSel:		'#loading',
			renderSSControls:			false,
			renderNavControls:			true,
			prevLinkText:				'←',
			nextLinkText:				'→',
			nextPageLinkText:			'→',
			prevPageLinkText:			'←',
			enableHistory:				true,
			autoStart:					false,
			syncTransitions:			true,
			defaultTransitionDuration:	900,

			onSlideChange:			 function(prevIndex, nextIndex) {
				// 'this' refers to the gallery, which is an extension of $('#thumbs')
				this.find('ul.thumbs').children()
						.eq(prevIndex).fadeTo('fast', onMouseOutOpacity).end()
						.eq(nextIndex).fadeTo('fast', 1.0);

				var originalRedirect = $('#redirect_original')[0];

				if (originalRedirect) {

					var itemId = this.find('ul.thumbs').children().eq(nextIndex).children()[0].id;

					$('#currency_redirect').each(function(index, input) {
						input.value = originalRedirect.value + "#" + itemId;
					});
					
					$('#language_redirect').each(function(index, input) {
						input.value = originalRedirect.value + "#" + itemId;
					});
				}
			},

			onPageTransitionOut:	   function(callback) {
				this.fadeTo('fast', 0.0, callback);
			},

			onPageTransitionIn:		function() {
				this.fadeTo('fast', 1.0);
			}

		});

		/**** Functions to support integration of galleriffic with the jquery.history plugin ****/

		// PageLoad function
		// This function is called when:
		// 1. after calling $.historyInit();
		// 2. after calling $.historyLoad();
		// 3. after pushing "Go Back" button of a browser
		function pageload(hash) {
			// alert("pageload: " + hash);
			// hash doesn't contain the first # character.
			if (hash) {
				$.galleriffic.gotoImage(hash);
			} else {
				gallery.gotoIndex(0);
			}
		}

		// Initialize history plugin.
		// The callback is called at once by present location.hash.
		$.historyInit(pageload, "advanced.html");

		// set onclick event for buttons using the jQuery 1.3 live method
		$("a[rel='history']").live('click', function(e) {
			if (e.button != 0) return true;

			var hash = this.href;
			hash = hash.replace(/^.*#/, '');

			// moves to a new page.
			// pageload is called at once.
			// hash don't contain "#", "?"
			$.historyLoad(hash);

			return false;
		});

		/****************************************************************************************/
	});

</script>

	 <?php } ?>
  </div>
  <div class="bottom">
    <div class="left"></div>
    <div class="right"></div>
    <div class="center"></div>
  </div>
</div>
<?php echo $footer; ?> 