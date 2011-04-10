<?php if (isset($_SERVER['HTTP_USER_AGENT']) && !strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE 6')) echo '<?xml version="1.0" encoding="UTF-8"?>'. "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>" xml:lang="<?php echo $lang; ?>">
<head>
<title><?php echo $title; ?></title>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<base href="<?php echo $base; ?>" />
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo str_replace('&', '&amp;', $link['href']); ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/<?php echo $template; ?>/stylesheet/stylesheet.css" />
<link rel="stylesheet" href="resources/css/galleriffic.css" type="text/css"/>
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script>
DD_belatedPNG.fix('img, #header .div3 a, #content .left, #content .right, .box .top');
</script>
<![endif]-->
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>

<script type="text/javascript" src="resources/js/jquery-1.5.js"></script>

<script type="text/javascript" src="catalog/view/javascript/jquery/thickbox/thickbox-compressed.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/thickbox/thickbox.css" />

<script type="text/javascript" src="catalog/view/javascript/jquery/tab.js"></script>

<script type="text/javascript" src="resources/js/jquery.galleriffic.js"></script>
<script type="text/javascript" src="resources/js/jquery.opacityrollover.js"></script>
<script type="text/javascript" src="resources/js/jquery.history.js"></script>

	<!-- We only want the thumbnails to display when javascript is disabled -->
<script type="text/javascript">
		document.write('<style>.noscript { display: none; }</style>');
</script>


<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<script type="text/javascript"><!--
function bookmark(url, title) {
	if (window.sidebar) { // firefox
    window.sidebar.addPanel(title, url, "");
	} else if(window.opera && window.print) { // opera
		var elem = document.createElement('a');
		elem.setAttribute('href',url);
		elem.setAttribute('title',title);
		elem.setAttribute('rel','sidebar');
		elem.click();
	} else if(document.all) {// ie
   		window.external.AddFavorite(url, title);
	}
}
//--></script>
</head>
<body class="category_background">
<div id="page">
<div id="container">
<div id="header">
  <div class="div1">
	  <h1 align="center" style="margin:0;height:130px;">
		  <a href="index.php">ka⚘serova</a>
	  </h1>

	  <div class="div5">
      <div class="left"></div>
      <div class="right"></div>

		  <div class="center">
		  <?php if (isset($categories)) { ?>
			<div id="h_menu">
				<ul>
			<?php foreach ($categories as $category) { ?>
				<li><a href="index.php?route=product/category&path=<?php echo str_replace('&nbsp;', '', $category['category_id']); ?>" ><?php echo str_replace('&nbsp;', '', $category['name']); ?></a></li>
			<?php } ?>
					</ul>
				</div>
		<?php } ?>
      </div>

    </div>
  </div>
  <div class="div6">
    <div class="left">
	</div>
    <div class="right"></div>
    <div class="center">
		<div id="menu" style="height:60px;">
			<ul>

				<?php if (!$logged) { ?>
					<li><a href="<?php echo str_replace('&', '&amp;', $login); ?>" id="tab_login"><?php echo $text_login; ?></a></li>
				<?php } else { ?>
					<li><a href="<?php echo str_replace('&', '&amp;', $logout); ?>" id="tab_logout"><?php echo $text_logout; ?></a></li>
					<li><a href="<?php echo str_replace('&', '&amp;', $account); ?>" id="tab_account"><?php echo $text_account; ?></a></li>
				<?php } ?>

				<li><a href="<?php echo str_replace('&', '&amp;', $cart); ?>" id="tab_cart"><?php echo $text_cart; ?>(<span id="goodsInBasket"><?php echo $cartObj->countProducts(); ?></span>)</a></li>
				<li><a href="<?php echo str_replace('&', '&amp;', $checkout); ?>" id="tab_checkout"><?php echo $text_checkout; ?></a></li>
			
			</ul>
		</div>
    		
      <div class="div7">
        <?php if ($currencies) { ?>
        <form action="<?php echo str_replace('&', '&amp;', $action); ?>" method="post" enctype="multipart/form-data" id="currency_form">
          <div class="switcher">
            <?php foreach ($currencies as $currency) { ?>
            <?php if ($currency['code'] == $currency_code) { ?>
            <div class="selected"><a><?php echo $currency['title']; ?></a></div>
            <?php } ?>
            <?php } ?>
            <div class="option">
              <?php foreach ($currencies as $currency) { ?>
              <a onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $('#currency_form').submit();"><?php echo $currency['title']; ?></a>
              <?php } ?>
            </div>
          </div>
          <div style="display: inline;">
            <input type="hidden" name="currency_code" value="" />
            <input type="hidden" id="currency_redirect" name="redirect" value="<?php echo $redirect; ?>" />
            <input type="hidden" id="redirect_original" name="redirect_original" value="<?php echo $redirect; ?>" />
          </div>
        </form>
        <?php } ?>
        <?php if ($languages) { ?>
        <form action="<?php echo str_replace('&', '&amp;', $action); ?>" method="post" enctype="multipart/form-data" id="language_form">
          <div class="switcher">
            <?php foreach ($languages as $language) { ?>
            <?php if ($language['code'] == $language_code) { ?>
            <div class="selected"><a><img src="resources/images/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" />&nbsp;&nbsp;<?php echo $language['name']; ?></a></div>
            <?php } ?>
            <?php } ?>
            <div class="option">
              <?php foreach ($languages as $language) { ?>
              <a onclick="$('input[name=\'language_code\']').attr('value', '<?php echo $language['code']; ?>'); $('#language_form').submit();"><img src="resources/images/flags/<?php echo $language['image']; ?>" alt="<?php echo $language['name']; ?>" />&nbsp;&nbsp;<?php echo $language['name']; ?></a>
              <?php } ?>
            </div>
          </div>
          <div>
            <input type="hidden" name="language_code" value="" />
            <input type="hidden" id="language_redirect" name="redirect" value="<?php echo $redirect; ?>" />
			  <?php if (!$currencies) { ?>
			  	<input type="hidden" id="redirect_original" name="redirect_original" value="<?php echo $redirect; ?>" />
			<?php }?>
          </div>
        </form>
        <?php } ?>
      </div>
    </div>
  </div>

	<?php if (isset($common_error)) { ?>
		<div class="div6">
			<div class="left"></div>
			<div class="right"></div>
			<div class="center">
				<div class="warning"><?php echo $common_error; ?></div>
			</div>
		</div>
	<?php } ?>

</div>
<script type="text/javascript"><!-- 
function getURLVar(urlVarName) {
	var urlHalves = String(document.location).toLowerCase().split('?');
	var urlVarValue = '';
	
	if (urlHalves[1]) {
		var urlVars = urlHalves[1].split('&');

		for (var i = 0; i <= (urlVars.length); i++) {
			if (urlVars[i]) {
				var urlVarPair = urlVars[i].split('=');
				
				if (urlVarPair[0] && urlVarPair[0] == urlVarName.toLowerCase()) {
					urlVarValue = urlVarPair[1];
				}
			}
		}
	}
	
	return urlVarValue;
} 

$(document).ready(function() {
	route = getURLVar('route');
	
	if (!route) {
		$('#tab_home').addClass('selected');
	} else {
		part = route.split('/');
		
		if (route == 'common/home') {
			$('#tab_home').addClass('selected');
		} else if (route == 'account/login') {
			$('#tab_login').addClass('selected');	
		} else if (part[0] == 'account') {
			$('#tab_account').addClass('selected');
		} else if (route == 'checkout/cart') {
			$('#tab_cart').addClass('selected');
		} else if (part[0] == 'checkout') {
			$('#tab_checkout').addClass('selected');
		} else {
			$('#tab_home').addClass('selected');
		}
	}
});
//--></script>
<script type="text/javascript"><!--
$('#search input').keydown(function(e) {
	if (e.keyCode == 13) {
		moduleSearch();
	}
});

function moduleSearch() {	
	pathArray = location.pathname.split( '/' );
	
	url = '<?php echo HTTP_SERVER; ?>';
		
	url += 'index.php?route=product/search';
		
	var filter_keyword = $('#filter_keyword').attr('value')
	
	if (filter_keyword) {
		url += '&keyword=' + encodeURIComponent(filter_keyword);
	}
	
	var filter_category_id = $('#filter_category_id').attr('value');
	
	if (filter_category_id) {
		url += '&category_id=' + filter_category_id;
	}
	
	location = url;
}
//--></script>
<script type="text/javascript"><!--
$('.switcher').bind('click', function() {
	$(this).find('.option').slideToggle('fast');
});
$('.switcher').bind('mouseleave', function() {
	$(this).find('.option').slideUp('fast');
}); 
//--></script>
