<div id="footer">
    <img src="catalog/view/theme/ka.serova.new/image/footer.png"/>
    
    <div class="menu" style="float:left;">
        <ul style="margin-top: 0px;">
            <li style="margin-left: 0px;">
                <a href="<?php echo str_replace('&', '&amp;', $about_us); ?>"">
                    <div class="menu-icon"><img src="catalog/view/theme/ka.serova.new/image/about.png"></div><?php echo $text_about_us; ?>
                </a>
            </li>
            <li>
                <a style="margin-right: 1px;" href="https://www.facebook.com/KaSerovaHandmade"><div class="menu-icon"><img src="catalog/view/theme/ka.serova.new/image/connect_fb.png"></div></a><a href="http://vk.com/ka_serova"><div class="menu-icon"><img src="catalog/view/theme/ka.serova.new/image/connect_vk.png"></div><?php echo $text_connect; ?></a>
            </li>
            <li>
                <a href="<?php echo str_replace('&', '&amp;', $contact); ?>"">
                    <div class="menu-icon"><img src="catalog/view/theme/ka.serova.new/image/contact_round.png"></div><?php echo $text_contact; ?>
                </a>
            </li>
            <li>
                <a href="<?php echo str_replace('&', '&amp;', $shipping); ?>"">
                <div class="menu-icon"><img src="catalog/view/theme/ka.serova.new/image/shipping.png"></div><?php echo $text_shipping; ?>
                </a>
            </li>
        </ul>
    </div>

    <?php if($text_footer) { ?>
        <div class="div1"><?php echo $text_footer; ?></div>
    <?php } ?>

	<div class="div1">
		<?php echo $text_powered_by; ?>
	</div>
</div>
</div>
</div>
<?php echo $google_analytics; ?>
</body></html>