<?php

function getRequestParams($defaultValues = null,
						  $overwrite = false,
						  $superGlobalArrayNames = array('_GET', '_POST', '_COOKIE')) {

	$result = array();

	// fetch values from request
	foreach ($superGlobalArrayNames as $superGlobalArrayName) {
		foreach ($GLOBALS[$superGlobalArrayName] as $k => $v) {
			$result[$k] = $v;
		}
	}

	// apply defaults for missing parameters
	if ($defaultValues) {
		foreach ($defaultValues as $k => $v) {
			if (!isset($result[$k])) {
				$result[$k] = $v;
			}
		}
	}

	if ($overwrite) {
		$_REQUEST = $result;
	}

	return $result;
}

?>