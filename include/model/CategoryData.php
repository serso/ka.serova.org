<?php

class CategoryData {
	// property declaration
	public $category;

	public $translation;

	public $cssFileName;

	public function __construct($category, $cssFileName, $translation) {
		$this->category = $category;
		$this->cssFileName = $cssFileName;
		$this->translation = $translation;
	}

	public function setCategory($category) {
		$this->category = $category;
	}

	public function getCategory() {
		return $this->category;
	}

	public function setCssFileName($cssFileName) {
		$this->cssFileName = $cssFileName;
	}

	public function getCssFileName() {
		return $this->cssFileName;
	}

	public function setTranslation($translation) {
		$this->translation = $translation;
	}

	public function getTranslation() {
		return $this->translation;
	}
}

?>