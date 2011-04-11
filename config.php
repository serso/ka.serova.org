<?php

$webRoot = '/home/ssolovyev/applications/web/ka.serova.org';

// DIR
define('DIR_APPLICATION', $webRoot . '/catalog/');
define('DIR_SYSTEM', $webRoot . '/system/');
define('DIR_DATABASE', $webRoot . '/system/database/');
define('DIR_LANGUAGE', $webRoot . '/catalog/language/');
define('DIR_TEMPLATE', $webRoot . '/catalog/view/theme/');
define('DIR_CONFIG', $webRoot . '/system/config/');
define('DIR_IMAGE', $webRoot . '/resources/images/');
define('DIR_CACHE', $webRoot . '/system/cache/');
define('DIR_DOWNLOAD', $webRoot . '/download/');
define('DIR_LOGS', $webRoot . '/system/logs/');

// DB
define('DB_DRIVER', 'mysql');
define('DB_HOSTNAME', 'localhost');
define('DB_USERNAME', 'opencart');
define('DB_PASSWORD', 'opencart');
define('DB_DATABASE', 'opencart');
define('DB_PREFIX', '');
?>