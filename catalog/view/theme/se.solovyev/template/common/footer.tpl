<script type="text/javascript">
	if (jQuery && VK) {

		var url = document.location.href.split('#', 1)[0];

		$(".vk_like").each(function (index, item) {
			VK.Widgets.Like(item.id, {type: "mini", pageUrl: url + "#" + item.id.substring("vk_like_".length) });
		});
	}
</script>

<div id="footer">
	<div class="div2">
		<?php echo $text_powered_by; ?>
	</div>
</div>
</div>
</div>
<?php echo $google_analytics; ?>
</body></html>