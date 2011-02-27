<?php

class Category
{
	const flowers = "flowers";
	const metal_and_beads = "metal_and_beads";
	const yummy = "yummy";
	const pics = "pics";
	const other = "other";

	public static function values () {
		return array(Category::flowers, Category::metal_and_beads, Category::yummy, Category::pics, Category::other);
	}

}

?>