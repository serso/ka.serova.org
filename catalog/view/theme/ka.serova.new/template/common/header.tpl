<?php if (isset($_SERVER['HTTP_USER_AGENT']) && !strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE 6')) echo '<?xml version="1.0" encoding="UTF-8"?>' . "\n"; ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" dir="<?php echo $direction; ?>" lang="<?php echo $lang; ?>"
      xml:lang="<?php echo $lang; ?>">
<head>
    <title><?php echo $text_ka_serova_title.$title; ?></title>
    <?php if ($keywords) { ?>
    <meta name="keywords" content="<?php echo $keywords; ?>"/>
    <?php } else { ?>
    <meta name="keywords"
          content="украшения ручной работы, hand made, подарки, украшения, своими руками, авторские украшения, Санкт-Петербург, серьги, кольца, цветы, брошь, купить, подвески, пластика, бижутерия, хенд мейд, творчество, браслеты, сережки,  колье, заколки, подарки, открытки, альбомы, скрапбукинг, scrapbooking, хэндмэйд, подарок, fimo, ромашка, мак, ландышь"/>
    <?php } ?>

    <?php if ($description) { ?>
    <meta name="description" content="<?php echo $description; ?>"/>
    <?php } else { ?>
    <meta name="description"
          content="украшения ручной работы, hand made, подарки, украшения, своими руками, авторские украшения, Санкт-Петербург, серьги, кольца, цветы, брошь, купить, подвески, пластика, бижутерия, хенд мейд, творчество, браслеты, сережки,  колье, заколки, подарки, открытки, альбомы, скрапбукинг, scrapbooking, хэндмэйд, подарок, fimo, ромашка, мак, ландышь"/>
    <?php } ?>

    <base href="<?php echo $base; ?>"/>
    <?php if ($icon) { ?>
    <link href="<?php echo $icon; ?>" rel="icon"/>
    <?php } ?>
    <?php foreach ($links as $link) { ?>
    <link href="<?php echo str_replace('&', '&amp;', $link['href']); ?>" rel="<?php echo $link['rel']; ?>"/>
    <?php } ?>
    <link rel="stylesheet" type="text/css"
          href="catalog/view/theme/<?php echo $template; ?>/stylesheet/<?php echo $category_css; ?>"/>
    <link rel="stylesheet" type="text/css"
          href="catalog/view/theme/<?php echo $template; ?>/stylesheet/stylesheet.css"/>
    <link rel="stylesheet" href="resources/css/galleriffic.css" type="text/css"/>
    <link rel="shortcut icon" href="catalog/view/theme/<?php echo $template; ?>/image/favicon.ico" type="image/x-icon"/>

    <!--[if lt IE 7]>
    <link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css"/>

    <script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
    <script>
        DD_belatedPNG.fix('img, #header .div3 a, #content .left, #content .right, .box .top');
    </script>
    <![endif]-->
    <?php foreach ($styles as $style) { ?>
    <link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>"
          media="<?php echo $style['media']; ?>"/>
    <?php } ?>

    <script type="text/javascript" src="resources/js/jquery-1.5.2.min.js"></script>

    <script type="text/javascript" src="catalog/view/javascript/jquery/thickbox/thickbox-compressed.js"></script>
    <link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/thickbox/thickbox.css"/>

    <script type="text/javascript" src="catalog/view/javascript/jquery/tab.js"></script>

    <script type="text/javascript" src="resources/js/jquery.galleriffic.js"></script>
    <script type="text/javascript" src="resources/js/jquery.opacityrollover.js"></script>
    <script type="text/javascript" src="resources/js/jquery.history.js"></script>
    <script type="text/javascript" src="resources/js/jnotify/jquery/jNotify.jquery.js"></script>
    <link rel="stylesheet" type="text/css" href="resources/js/jnotify/jquery/jNotify.jquery.css"/>

    <!-- We only want the thumbnails to display when javascript is disabled -->
    <script type="text/javascript">
        document.write('<style>.noscript { display: none; }</style>');
    </script>

    <script type="text/javascript" src="http://userapi.com/js/api/openapi.js?32"></script>
    <script type="text/javascript" src="http://vk.com/js/api/openapi.js?79"></script>

    <script type="text/javascript">
        if (VK) {
            VK.init({apiId: 2395707, onlyWidgets: true});
        }
    </script>

    <script type="text/javascript">

        var _gaq = _gaq || [];
        _gaq.push(['_setAccount', 'UA-23041894-1']);
        _gaq.push(['_trackPageview']);

        (function () {
            var ga = document.createElement('script');
            ga.type = 'text/javascript';
            ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0];
            s.parentNode.insertBefore(ga, s);
        })();

    </script>

    <?php foreach ($scripts as $script) { ?>
    <script type="text/javascript" src="<?php echo $script; ?>"></script>
    <?php } ?>
    <script type="text/javascript"><!--
        function bookmark(url, title) {
            if (window.sidebar) { // firefox
                window.sidebar.addPanel(title, url, "");
            } else if (window.opera && window.print) { // opera
                var elem = document.createElement('a');
                elem.setAttribute('href', url);
                elem.setAttribute('title', title);
                elem.setAttribute('rel', 'sidebar');
                elem.click();
            } else if (document.all) {// ie
            window.external.AddFavorite(url, title);
        }
                    }
        //--></script>

</head>
<body class="category_background">

<div id="fb-root"></div>
<script>(function (d, s, id) {
        var js, fjs = d.getElementsByTagName(s)[0];
        if (d.getElementById(id)) {return;}
            js = d.createElement(s);
        js.id = id;
        js.src = "//connect.facebook.net/en_US/all.js#xfbml=1";
        fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));</script>

<!-- Yandex.Metrika counter -->
<div style="display:none;">
    <script type="text/javascript">
        (function (w, c) {
            (w[c] = w[c] || []).push(function () {
                try {
                    w.yaCounter10435543 = new Ya.Metrika({id:10435543,
                    clickmap:true});
                }
                catch (e) {
                }
            });
        })(window, "yandex_metrika_callbacks");
    </script>
</div>
<script src="//mc.yandex.ru/metrika/watch.js" type="text/javascript" defer="defer"></script>
<noscript>
    <div><img src="//mc.yandex.ru/watch/10435543" style="position:absolute; left:-9999px;" alt=""/></div>
</noscript>
<!-- /Yandex.Metrika counter -->

<div id="page">
<div id="container">
<div id="header">
    <div class="div6">
        <div class="left"></div>
        <div class="right"></div>
        <div class="center">

            <div class="menu-div" style="float:left;">
                <div id="vk_like_site" class="menu-div" style="float:left;">
                </div>
            </div>
            <div class="menu-div" style="float:left; margin-top: 3px;">
                <div class="fb-like" data-href="http://ka.serova.org/" data-send="false" data-width="100"
                     data-show-faces="false" layout="button_count"></div>
            </div>

            <div class="menu-div">

                <?php if ($currencies) { ?>

                <form action="<?php echo str_replace('&', '&amp;', $action); ?>" method="post"
                      enctype="multipart/form-data" id="currency_form">
                    <div class="switcher">

                        <?php $selectedCreated = false; ?>
                        <?php foreach ($currencies as $i => $currency) { ?>
                        <?php if ($currency['code'] == $currency_code || ($i == count($currencies) - 1 && !$selectedCreated)) { ?>
                        <?php $selectedCreated = true; ?>
                        <div class="selected"><a><img
                                        src="resources/images/currencies/<?php echo $currency['code']; ?>.png"
                                        alt="<?php echo $currency['title']; ?>"/></a></div>
                        <?php } ?>
                        <?php } ?>

                        <div class="option">
                            <?php foreach ($currencies as $currency) { ?>
                            <!--todo serso: not very good (.png for currency)-->
                            <a onclick="$('input[name=\'currency_code\']').attr('value', '<?php echo $currency['code']; ?>'); $('#currency_form').submit();"><img
                                        src="resources/images/currencies/<?php echo $currency['code']; ?>.png"
                                        alt="<?php echo $currency['title']; ?>"/></a>
                            <?php } ?>
                        </div>
                    </div>

                    <div style="display: inline;">
                        <input type="hidden" name="currency_code" value=""/>
                        <input type="hidden" id="currency_redirect" name="redirect"
                               value="<?php echo $redirect; ?>"/>
                        <input type="hidden" id="redirect_original" name="redirect_original"
                               value="<?php echo $redirect; ?>"/>
                    </div>
                </form>
                <?php } ?>

                <?php if ($languages) { ?>
                <form action="<?php echo str_replace('&', '&amp;', $action); ?>" method="post"
                      enctype="multipart/form-data" id="language_form">
                    <div class="switcher">
                        <?php $selectedCreated = false; ?>
                        <?php foreach ($languages as $i => $language) { ?>
                        <?php if ($language['code'] == $language_code || ($i == count($languages) - 1 && !$selectedCreated)) { ?>
                        <?php $selectedCreated = true; ?>
                        <div class="selected"><a><img
                                        src="resources/images/flags/<?php echo $language['image']; ?>"
                                        alt="<?php echo $language['name']; ?>"/></a></div>
                        <?php } ?>
                        <?php } ?>
                        <div class="option">
                            <?php foreach ($languages as $language) { ?>
                            <a onclick="$('input[name=\'language_code\']').attr('value', '<?php echo $language['code']; ?>'); $('#language_form').submit();"><img
                                        src="resources/images/flags/<?php echo $language['image']; ?>"
                                        alt="<?php echo $language['name']; ?>"/></a>
                            <?php } ?>
                        </div>
                    </div>
                    <div>
                        <input type="hidden" name="language_code" value=""/>
                        <input type="hidden" id="language_redirect" name="redirect"
                               value="<?php echo $redirect; ?>"/>
                        <?php if (!$currencies) { ?>
                        <input type="hidden" id="redirect_original" name="redirect_original"
                               value="<?php echo $redirect; ?>"/>
                        <?php }?>
                    </div>
                </form>
                <?php } ?>

            </div>

            <div class="menu-div">
                <div id="search">
                    <?php if ($keyword) { ?>
                    <input type="text" value="<?php echo $keyword; ?>" id="filter_keyword"/>
                    <?php } else { ?>
                    <input type="text" value="<?php echo $text_keyword; ?>" id="filter_keyword"
                           onclick="this.value = '';" onkeydown="this.style.color = '#000000'"
                           style="color: #999;"/>
                    <?php } ?>
                    <input type="hidden" name="filter_category_id" value="0">
                </div>
            </div>

            <div class="menu" style="float:right;">
                <ul>

                    <?php if (!$logged) { ?>

                        <li>
                            <a href="<?php echo str_replace('&', '&amp;', $login); ?>" id="tab_login">
                                <div class="menu-icon"><img src="catalog/view/theme/ka.serova.new/image/login.png"></div><?php echo $text_login; ?>
                            </a>
                        </li>

                    <?php } else { ?>

                        <li>
                            <a href="<?php echo str_replace('&', '&amp;', $logout); ?>" id="tab_logout">
                                <div class="menu-icon"><img src="catalog/view/theme/ka.serova.new/image/logout.png"></div><?php echo $text_logout; ?>
                            </a>
                        </li>

                        <li>
                            <a href="<?php echo str_replace('&', '&amp;', $account); ?>" id="tab_account">
                                <div class="menu-icon"><img src="catalog/view/theme/ka.serova.new/image/login.png"></div><?php echo $text_account; ?>
                            </a>
                        </li>

                    <?php } ?>

                    <li>
                        <a href="<?php echo str_replace('&', '&amp;', $cart); ?>" id="tab_cart">
                            <div class="menu-icon"><img src="catalog/view/theme/ka.serova.new/image/cart.png"></div><?php echo $text_cart; ?>(<span id="goodsInBasket"><?php echo $cartObj->countProducts(); ?></span>)
                        </a>
                    </li>

                    <li>
                        <a onclick="moduleSearch();">
                            <div class="menu-icon"><img src="catalog/view/theme/ka.serova.new/image/search.png"></div>
                        </a>
                    </li>
                </ul>
            </div>

        </div>
    </div>

    <!-- <li>
                        <a href="<?php echo str_replace('&', '&amp;', $about_us); ?>"><?php echo $text_about_us; ?></a>
                    </li>
                    <li><a href="<?php echo str_replace('&', '&amp;', $contact); ?>"
                           id="tab_contancts"><?php echo $text_contact; ?></a>
                    </li> -->

    <div class="div1">

        <a href="all">
            <div class="top_header">&nbsp;</div>
        </a>

        <div class="div5">
            <div class="left"></div>
            <div class="right"></div>

            <div class="center">
                <?php if (isset($categories)) { ?>
                <div id="h_menu">
                    <ul>

                        <?php foreach ($categories as $category) { ?>

                        <?php if (isset($category_id) && $category_id == $category['category_id']) { ?>
                        <li id="h_menu_selected">
                            <a href="<?php echo $category['category_name']; ?>"><?php echo str_replace('&nbsp;', '', $category['name']); ?></a>
                        </li>
                        <?php } else { ?>
                        <li class="not_selected">
                            <a href="<?php echo $category['category_name']; ?>"><?php echo str_replace('&nbsp;', '', $category['name']); ?></a>
                        </li>
                        <?php } ?>

                        <?php } ?>
                    </ul>
                </div>
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

    $(document).ready(function () {
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
    $('#search input').keydown(function (e) {
        if (e.keyCode == 13) {
            moduleSearch();
        }
    });

    function moduleSearch() {
        pathArray = location.pathname.split('/');

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
    $('.switcher').bind('click', function () {
        $(this).find('.option').slideToggle('fast');
    });
    $('.switcher').bind('mouseleave', function () {
        $(this).find('.option').slideUp('fast');
    });
    //--></script>

<script type="text/javascript">
    if (jQuery && VK) {

        var url = document.location.href.split('#', 1)[0];

        $("#vk_like_site").each(function (index, item) {
            VK.Widgets.Like(item.id, {type: "mini", pageUrl: "https://vk.com/ka_serova"}, "ka.serova");
        });
    }
</script>
