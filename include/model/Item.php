<?php

class Item {

	public $itemId;

	public $title;

	public $description;

	public $price;

	public $creatorId;

	public $pictures;

	public function __construct() {
		$this->price = new MoneyValue();
	}


	public function setCreatorId($creatorId) {
		$this->creatorId = $creatorId;
	}

	public function getCreatorId() {
		return $this->creatorId;
	}

	public function setDescription($description) {
		$this->description = $description;
	}

	public function getDescription() {
		return $this->description;
	}

	public function setItemId($itemId) {
		$this->itemId = $itemId;
	}

	public function getItemId() {
		return $this->itemId;
	}

	public function setPictures($pictures) {
		$this->pictures = $pictures;
	}

	public function getPictures() {
		return $this->pictures;
	}

	public function setPrice($price) {
		$this->price = $price;
	}

	public function getPrice() {
		return $this->price;
	}

	public function setTitle($title) {
		$this->title = $title;
	}

	public function getTitle() {
		return $this->title;
	}

	public function toString() {
		return "<strong>Item</strong></br>Item id = '" . $this->itemId . "'</br>" .
				"Title= '" . $this->title . "'</br>" .
				"Description = '" . $this->description . "'</br>" .
				$this->price->toString() . "</br>" .
				"Creator Id = '" . $this->creatorId . "'</br>";
	}

	public function set($name, $value) {
		$result = false;

		switch ($name) {
			case "title":
				$this->setTitle($value);
				$result = true;
				break;
			case "description":
				$this->setDescription($value);
				$result = true;
				break;
			case "creatorId":
				$this->setCreatorId($value);
				$result = true;
				break;
			case "priceAmount":
				$this->price->setAmount($value);
				$result = true;
				break;
			case "priceCurrency":
				$this->price->setCurrency($value);
				$result = true;
				break;
		}

		return $result;
	}
}

?>