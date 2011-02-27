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

function createSelectOptions($values) {
	foreach ($values as $value) {
		echo "<option value=\"" . $value . "\">" . $value . "</option>";
	}
}

function startsWith($haystack, $needle, $case = true) {
	if ($case) {
		return (strcmp(substr($haystack, 0, strlen($needle)), $needle) === 0);
	}
	return (strcasecmp(substr($haystack, 0, strlen($needle)), $needle) === 0);
}

function endsWith($haystack, $needle, $case = true) {
	if ($case) {
		return (strcmp(substr($haystack, strlen($haystack) - strlen($needle)), $needle) === 0);
	}
	return (strcasecmp(substr($haystack, strlen($haystack) - strlen($needle)), $needle) === 0);
}

?>