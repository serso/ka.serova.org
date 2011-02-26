<?php

class Picture {

	public $path;

	public $thumbnailPath;


	public function setPath($path) {
		$this->path = $path;
	}

	public function getPath() {
		return $this->path;
	}

	public function setThumbnailPath($thumbnailPath) {
		$this->thumbnailPath = $thumbnailPath;
	}

	public function getThumbnailPath() {
		return $this->thumbnailPath;
	}
}

?>