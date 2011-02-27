<?php

class MessageCollector {

	public $messages = array();

	public function addMessage($message) {
		array_push($this->messages, $message);
	}

	public function getMessages () {
		return $this->messages;
	}

	public function clean () {
		$this->messages = array();
	}

}

?>