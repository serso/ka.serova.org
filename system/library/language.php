<?php
final class Language {
  	private $directory;
    public $language_id;
	private $data = array();

    // 1 = en
	public function __construct($directory, $language_id = 1) {
		$this->directory = $directory;
        $this->language_id = $language_id;
	}
	
  	public function get($key) {
   		return (isset($this->data[$key]) ? $this->data[$key] : $key);
  	}
	
	public function load($filename) {
		$_ = array();

		$default = DIR_LANGUAGE . 'english/' . $filename . '.php';

		if (file_exists($default)) {
			require($default);
		}

		$file = DIR_LANGUAGE . $this->directory . '/' . $filename . '.php';

    	if (file_exists($file) && $file != $default) {
	  		require($file);
		}

	  	$this->data = array_merge($this->data, $_);

		return $this->data;
  	}
}
?>