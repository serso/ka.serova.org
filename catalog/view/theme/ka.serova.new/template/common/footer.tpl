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
                <a href="<?php echo str_replace('&', '&amp;', $shipping); ?>"">
                <div class="menu-icon"><img src="catalog/view/theme/ka.serova.new/image/shipping.png"></div><?php echo $text_shipping; ?>
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
        </ul>
    </div>

    <?php if($text_footer) { ?>
        <div class="div1"><?php echo $text_footer; ?></div>
        <div class="div1" style="opacity: 0.6; margin-top: 0px;"><img src="catalog/view/theme/ka.serova.new/image/me.png"></div>
    <?php } ?>

    <div class="div1">All money transactions are done through Paypal.</div>

    <!-- PayPal Logo -->
    <table border="0" cellpadding="10" cellspacing="0" align="left" style="opacity: 0.5; clear: both;">
        <tr>
            <td align="left" style="margin: 0px; padding: 0px;">
                <a href="https://www.paypal.com/webapps/mpp/paypal-popup" title="How PayPal Works"
                                  onclick="javascript:window.open('https://www.paypal.com/webapps/mpp/paypal-popup','WIPaypal','toolbar=no, location=no, directories=no, status=no, menubar=no, scrollbars=yes, resizable=yes, width=1060, height=700'); return false;"><img
                            src="catalog/view/theme/ka.serova.new/image/paypal.jpg" border="0"
                            alt="PayPal Acceptance Mark"></a></td>
        </tr>
    </table>
    <!-- PayPal Logo -->

    <div class="div1">
		<?php echo $text_powered_by; ?>
	</div>
</div>
</div>
</div>
<?php echo $google_analytics; ?>
</body></html>