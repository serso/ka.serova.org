<?php

class MoneyValue {

	public $amount;

	public $currency;

	public function setAmount($amount) {
		$this->amount = $amount;
	}

	public function getAmount() {
		return $this->amount;
	}

	public function setCurrency($currency) {
		$this->currency = $currency;
	}

	public function getCurrency() {
		return $this->currency;
	}
}

?>