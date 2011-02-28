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
			case "item_id":
				$this->setItemId($value);
				$result = true;
				break;
			case "title":
				$this->setTitle($value);
				$result = true;
				break;
			case "description":
				$this->setDescription($value);
				$result = true;
				break;
			case "creator_id":
				$this->setCreatorId($value);
				$result = true;
				break;
			case "price_amount":
				$this->price->setAmount($value);
				$result = true;
				break;
			case "price_currency":
				$this->price->setCurrency($value);
				$result = true;
				break;
		}

		return $result;
	}
}

class InsertItemCommand extends InsertSqlCommand {

	private $sql = "insert into items (title, description, price_amount, price_currency, creator_id) values (:title, :description, :price_amount, :price_currency, :creator_id)";

	public function __construct($dbh) {
		parent::__construct($this->sql, $dbh);
	}

	protected function getSqlValues() {
		return array(
			new SqlValue(':title', $this->object->getTitle(), PDO::PARAM_STR),
			new SqlValue(':description', $this->object->getDescription(), PDO::PARAM_STR),
			new SqlValue(':price_amount', $this->object->getPrice()->getAmount(), null),
			new SqlValue(':price_currency', $this->object->getPrice()->getCurrency(), PDO::PARAM_STR),
			new SqlValue(':creator_id', $this->object->getCreatorId(), PDO::PARAM_INT)
		);
	}

	protected function setInsertedId($id) {
		$this->object->setItemId($id);
	}
}

class ItemProducer extends SqlCommand {

	private $sql = "select item_id, title, description, price_amount, price_currency, creator_id from items";

	public function __construct($dbh) {
		parent::__construct($this->sql, $dbh);
	}

	public function execute() {
		$result = array();

		$this->stmt->execute();

		while( $row = $this->stmt->fetch(PDO::FETCH_ASSOC)) {
			$item = new Item();
			
			foreach ($row as $k => $v) {
				$item->set($k, $v);
			}

			array_push($result, $item);
		}

		return $result;
	}
}

?>