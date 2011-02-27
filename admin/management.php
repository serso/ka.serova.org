<?php

include ("../include/header.php");

$requestParams = getRequestParams();

if ($requestParams['action'] == 'add') {

	$itemsForAdd = array();

	foreach ($requestParams as $requestParamName => $requestParam) {

		// Session::getInstance()->messageCollector->addMessage($requestParamName . "-> " . $requestParam);

		if ( startsWith($requestParamName, "item_") ) {

			$cropped = substr($requestParamName, 5);

			$index = strstr($cropped, "_", true);

			if (is_numeric($index) ) {

				$propertyName = substr($cropped, strlen($index) + 1);

				// Session::getInstance()->messageCollector->addMessage("Parsing '" . $propertyName . "' property");

				$element = $itemsForAdd[$index];

				if ( !isset($element)) {
					$element = new Item();
					$itemsForAdd[$index] = $element;
				}

				$element->set($propertyName, $requestParam);

			} else {
				Session::getInstance()->messageCollector->addMessage("Cannot be parsed - not numeric: ". $requestParamName . "-> " . $requestParam);
			}
		}
	}

	foreach ( $itemsForAdd as $k => $v ) {
		Session::getInstance()->messageCollector->addMessage($v->toString());
	}
}

?>

<html>

<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<title>ka.serova hand made accessories :: management</title>

	<link rel="stylesheet" href="../resources/css/main.css" type="text/css"/>
	<link rel="stylesheet" href="../resources/css/galleriffic.css" type="text/css"/>

	<script type="text/javascript" src="../resources/js/jquery-1.5.js"></script>

</head>

<body>

<div id="page">
	<div id="container">

		<?php include "../include/message_box.html" ?>

		<form id="addItemsForm" action="management.php?action=add" method="post" enctype="multipart/form-data">
			<input type="button" value="Add item" onclick="addItemForm()">

			<input type="submit" value="Save">

			<div id="startPoint"></div>

		</form>
		<?php include "../include/footer.html" ?>
	</div>
</div>

<script type="text/javascript">

	var i = 0;

	function addItemForm() {

		$('div#startPoint').prepend(createItemForm());

		i++;
	}

	function removeElement(elementId) {
		$('div#' + elementId).remove();
	}

	function createItemForm() {
		var elementId = 'item_' + i;
		var removeElementFunction = 'removeElement( \'' + elementId + '\' )';

		return	 '<div id="' + elementId + '">' +
				'<h2 style="background-color:#a7d4fb;">Item # ' + i + '</h2>' +
				'<table cellpadding="0" cellspacing="5" border="0" width="100%" bgcolor="#f0f8ff">' +
				'<tr>' +
				'<td>Title:</td><td><input type="text" name="item_' + i + '_title" id="item_' + i + '_title"></td>' +
				'<td>Picture:</td><td><input type="file" name="item_' + i + '_picture" id="item_' + i + '_picture" accept="image/jpg,image/gif"></td>' +
				'</tr>' +
				'<tr>' +
				'<td>Category:</td><td>' + createSelect('category', true, createCategoriesOptions) + ' </td>' +
				'<td>Thumbnail:</td><td><input type="file" name="item_' + i + '_thumbnail" id="item_' + i + '_thumbnail" accept="image/jpg,image/gif"></td>' +
				'</tr>' +
				'<tr>' +
				'<td>Description:</td><td colspan="3"><textarea rows="10" cols="20" name="item_' + i + '_description" id="item_' + i + '_description"></textarea></td>' +
				'<tr>' +
				'<td>Price:</td><td><input type="text" name="item_' + i + '_priceAmount" id="item_' + i + '_priceAmount">' + createSelect('priceCurrency', false, createCurrenciesOptions) + '</td><td colspan="2">&nbsp;</td>' +
				'</tr>' +
				'</tr>' +
				'<tr>' +
				'<td><input type="button" value="Delete item" onclick="' + removeElementFunction + '"></td><td colspan="3">&nbsp</td>' +
				'</tr>' +
				'</table>' +
				'</div>';
	}

	function createSelect(name, multiple, optionsCreator) {
		var result = '<select name="item_' + i + '_' + name + '" id="item_' + i + '_' + name + '" ';

		if (multiple) {
			result = result + 'multiple="multiple" ';
		}

		result = result + '>' +
				optionsCreator() +
				'</select>';

		return result;
	}

	function createCategoriesOptions() {
		return '<?php
		createSelectOptions(Category::values());
		?>';
	}

	function createCurrenciesOptions() {
		return '<?php
		createSelectOptions(Currency::values());
		?>';
	}

</script>

</body>

</html>