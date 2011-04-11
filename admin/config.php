<?php

$httpWebRoot = 'http://localhost';

// HTTP
define('HTTP_SERVER', $httpWebRoot . '/admin/');
define('HTTP_CATALOG', $httpWebRoot . '/');
define('HTTP_IMAGE', $httpWebRoot . '/resources/images/');

// HTTPS
define('HTTPS_SERVER', $httpWebRoot . '/admin/');
define('HTTPS_IMAGE', $httpWebRoot . '/resources/images/');

$webRoot = '/home/ssolovyev/applications/web/ka.serova.org';

// DIR
define('DIR_APPLICATION', $webRoot . '/admin/');
define('DIR_SYSTEM', $webRoot . '/system/');
define('DIR_DATABASE', $webRoot . '/system/database/');
define('DIR_LANGUAGE', $webRoot . '/admin/language/');
define('DIR_TEMPLATE', $webRoot . '/admin/view/template/');
define('DIR_CONFIG', $webRoot . '/system/config/');
define('DIR_IMAGE', $webRoot . '/resources/images/');
define('DIR_CACHE', $webRoot . '/system/cache/');
define('DIR_DOWNLOAD', $webRoot . '/download/');
define('DIR_LOGS', $webRoot . '/system/logs/');
define('DIR_CATALOG', $webRoot . '/catalog/');

// DB
define('DB_DRIVER', 'mysql');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'opencart');
define('DB_PASSWORD', 'opencart');
define('DB_DATABASE', 'opencart');
define('DB_PREFIX', '');
?>
