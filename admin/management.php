<?php

include ("../include/header.php");

$requestParams = getRequestParams();

$creatorId = Constants::$SYSTEM_USER_ID;

switch ($requestParams['action']) {

	case 'add':

		$itemsForAdd = array();

		foreach ($requestParams as $requestParamName => $requestParam) {

			// Session::getInstance()->messageCollector->addMessage($requestParamName . "-> " . $requestParam);

			if (startsWith($requestParamName, "item_")) {

				$cropped = substr($requestParamName, 5);

				$index = strstr($cropped, "_", true);

				if (is_numeric($index)) {

					$propertyName = substr($cropped, strlen($index) + 1);

					// Session::getInstance()->messageCollector->addMessage("Parsing '" . $propertyName . "' property");

					$element = $itemsForAdd[$index];

					if (!isset($element)) {
						$element = new Item();
						$itemsForAdd[$index] = $element;
					}

					$element->set($propertyName, $requestParam);

				} else {
					Session::getInstance()->messageCollector->addMessage("Cannot be parsed - not numeric: " . $requestParamName . "-> " . $requestParam);
				}
			}
		}

		foreach ($_FILES as $requestParamName => $file) {

			Session::getInstance()->messageCollector->addMessage("Processing file: " . $requestParamName);
			Session::getInstance()->messageCollector->addMessage("Tmp file name: " . $file["tmp_name"]);

			if ($file["type"] == "image/gif"
					|| $file["type"] == "image/jpeg"
					|| $file["type"] == "image/pjpeg") {

				if ($file["error"] > 0) {
					Session::getInstance()->messageCollector->addMessage("Error occurred: return code is " . $file["error"]);
				} else {

					/*if (!file_exists(Constants::$PATH_TO_UPLOAD . "/" . $file["name"])) {
						Session::getInstance()->messageCollector->addMessage($file["name"] . " already exists. ");
					} else {
						Session::getInstance()->messageCollector->addMessage("Trying to save file to: " . Constants::$PATH_TO_UPLOAD . "/" . $file["name"]);
						if ( !move_uploaded_file($file["tmp_name"], Constants::$PATH_TO_UPLOAD . "/" . $file["name"]) ) {
							Session::getInstance()->messageCollector->addMessage("Error occurred while saving file!");
						}
					}*/

					if (startsWith($requestParamName, "item_")) {

						$cropped = substr($requestParamName, 5);

						$index = strstr($cropped, "_", true);

						if (is_numeric($index)) {

							$pictureRequestParamName = substr($cropped, strlen($index) + 1);

							$picture = null;

							if (startsWith($pictureRequestParamName, "picture_")) {
								$cropped = substr($pictureRequestParamName, 8);
								$picture = true;
							} else if (startsWith($pictureRequestParamName, "thumbnail_")) {
								$cropped = substr($pictureRequestParamName, 10);
								$picture = false;
							} else {
								Session::getInstance()->messageCollector->addMessage("Neither picture nor thumbnail: " + $requestParamName);
							}

							if ($picture != null) {
								$pictureIndex = strstr($cropped, "_", true);

								if (is_numeric($pictureIndex)) {
									$pictureProperty = substr($cropped, strlen($pictureIndex) + 1);

									$element = $itemsForAdd[$index];

									if (isset($element)) {

									} else {
										Session::getInstance()->messageCollector->addMessage("No element found with index: " . $index);
									}

								} else {
									Session::getInstance()->messageCollector->addMessage("Cannot be parsed - not numeric: " . $requestParamName . "->" . $cropped);
								}
							}

						} else {
							Session::getInstance()->messageCollector->addMessage("Cannot be parsed - not numeric: " . $requestParamName . "->" . $cropped);
						}
					}


				}
			} else {
				Session::getInstance()->messageCollector->addMessage("Invalid file: " . $file["name"]);
			}
		}

		$error = false;
		foreach ($itemsForAdd as $k => $v) {
			if (!isset($v->title) ||
					!isset($v->description) ||
					!isset($v->description) ||
					!isset($v->price) ||
					!isset($v->pictures)) {
				$error = true;
			}
		}

		if (!$error) {
			try {
				$insertItemCommand = new InsertItemCommand($dbh);
				foreach ($itemsForAdd as $k => $v) {
					$v->setCreatorId($creatorId);
					$insertItemCommand->insert($v, $dbh);
					Session::getInstance()->messageCollector->addMessage($v->toString());
				}
			} catch (PDOExecption $e) {
				echo "Error!: " . $e->getMessage() . "</br>";
			}
		} else {
			$items = $itemsForAdd;
		}
		break;

	case 'show':

		$itemProducer = new ItemProducer($dbh);
		$items = $itemProducer->execute();

		break;

}
?>

<html>

<head>
	<meta http-equiv="Content-type" content="text/html; charset=utf-8">
	<title>ka.serova hand made accessories :: management</title>

	<link rel="stylesheet" href="../resources/css/main.css" type="text/css"/>
	<link rel="stylesheet" href="../resources/css/galleriffic.css" type="text/css"/>

	<script type="text/javascript" src="../resources/js/jquery-1.5.js"></script>
	<script type="text/javascript" src="../resources/js/jquery.validate.js"></script>

	<style type="text/css">

		label {
			width: 10em;
			float: left;
		}

		label.error {
			float: none;
			color: red;
			padding-left: .5em;
			vertical-align: top;
		}

	</style>
	<script type="text/javascript">
		$(document).ready(function() {
			$("#addItemsForm").validate();
		});
	</script>

</head>

<body>

<div id="page">
	<div id="container">

		<?php include "../include/message_box.html" ?>

		<a href="management.php?action=show">Show all</a> |
		<a href="management.php?action=add">Clear</a><br>

<?php
		foreach ($items as $k => $item) {
		echo $item->toString();
	}
		?>

		<form id="addItemsForm" action="management.php?action=add" method="post" enctype="multipart/form-data">
			<input type="button" value="Add item" onclick="addItemForm()">

			<input type="submit" class="submit" value="Save" onclick="validateAndSubmitForm()">

			<div id="startPoint"></div>

		</form>
		<?php include "../include/footer.html" ?>
	</div>
</div>

<script type="text/javascript">

	var i = 0;
	var iPic = 0;

	function addItemForm() {

		$('div#startPoint').prepend(createItemForm());

		i++;
	}

	function removeElement(elementId) {
		if (confirm("Do you really want to delete item?")) {
			$('div#' + elementId).remove();
		}
	}

	function createItemForm() {
		var elementId = 'item_' + i;
		var removeElementFunction = 'removeElement( \'' + elementId + '\' )';
		var addPictureFunction = 'addPicture( \'' + i + '\' )';

		return	 '<div id="' + elementId + '">' +
				'<h2 style="background-color:#a7d4fb;">Item # ' + i + '</h2>' +
				'<table cellpadding="0" cellspacing="5" border="0" width="100%" bgcolor="#f0f8ff">' +
				'<tr>' +
				'<td>Title:</td><td><input type="text" name="item_' + i + '_title" id="item_' + i + '_title" class="required" minlength="2"></td>' +
				'<td rowspan="4"><div id="picStartPoint_' + i + '">' + createPicturesInputs(i) + '</div></td>' +
				'</tr>' +
				'<tr>' +
				'<td>Category:</td><td>' + createSelect('category', true, true, createCategoriesOptions) + ' </td>' +
				'</tr>' +
				'<tr>' +
				'<td>Description:</td><td><textarea rows="10" cols="20" name="item_' + i + '_description" id="item_' + i + '_description"></textarea></td>' +
				'<tr>' +
				'<td>Price:</td><td><input type="text" name="item_' + i + '_price_amount" id="item_' + i + '_price_amount" class="required digits">' + createSelect('price_currency', false, true, createCurrenciesOptions) + '</td>' +
				'</tr>' +
				'</tr>' +
				'<tr>' +
				'<td><input type="button" value="Delete item" onclick="' + removeElementFunction + '"></td><td>&nbsp</td><td><input type="button" value="Add picture" onclick="' + addPictureFunction + '"></td>' +
				'</tr>' +
				'</table>' +
				'</div>';
	}

	/*
	<input type="file" name="item_' + i + '_picture" id="item_' + i + '_picture" accept="png|jpeg|jpg|gif">
	<input type="file" name="item_' + i + '_thumbnail" id="item_' + i + '_thumbnail" accept="png|jpeg|jpg|gif">
	* */

	function createSelect(name, multiple, required, optionsCreator) {
		var result = '<select name="item_' + i + '_' + name + '" id="item_' + i + '_' + name + '" ';

		if (multiple) {
			result = result + 'multiple="multiple" ';
		}

		if (required) {
			result = result + 'class="required" ';
		}

		result = result + '>' +
				optionsCreator() +
				'</select>';

		return result;
	}

	function addPicture(index) {
		$('div#picStartPoint_' + index).append(createPicturesInputs(index));
	}

	function createPicturesInputs(index) {
		var result =
				'Picture:<input type="file" name="item_' + index + '_picture' + '_' + iPic + '" id="item_' + index + '_picture' + '_' + iPic + '" accept="png|jpeg|jpg|gif"></br>' +
					/*'URL:<input type="text" name="item_' + index + '_path' + '_' + iPic + '" id="item_' + index + '_path' + '_' + iPic + '" minlength="2"></br>' +*/
						'Thumbnail:<input type="file" name="item_' + index + '_thumbnail' + '_' + iPic + '" id="item_' + index + '_thumbnail' + '_' + iPic + '" accept="png|jpeg|jpg|gif">' +
					/*'URL:<input type="text" name="item_' + index + '_thumbnailPath' + '_' + iPic + '" id="item_' + index + '_thumbnailPath' + '_' + iPic + '" minlength="2">' +*/
						'</br></br>';

		iPic++;


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