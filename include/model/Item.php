<?php

class Item {

	public $itemId;

	public $title;

	public $description;

	public $price;

	public $creatorId;

	public $pictures;


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
}

?>