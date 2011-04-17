alter   table category
    add column display_details
varchar ( 255 );

update category
   set display_details = 'category_flowers.css'
 where category_id in ( select cd.category_id
			  from category_description cd
			 where lcase ( cd.name ) = 'flowers' );

update category
   set display_details = 'category_pics.css'
 where category_id in ( select cd.category_id
			  from category_description cd
			 where lcase ( cd.name ) = 'pics' );

update category
   set display_details = 'category_candy.css'
 where category_id in ( select cd.category_id
			  from category_description cd
			 where lcase ( cd.name ) = 'yummy' );

update category
   set display_details = 'category_brown.css'
 where display_details is null;


 alter table category
    add column category_name
varchar ( 255 );

update category
   set category_name = 'flowers'
 where category_id in ( select cd.category_id
			  from category_description cd
			 where lcase ( cd.name ) = 'flowers' );

update category
   set category_name = 'metal&beads'
 where category_id in ( select cd.category_id
			  from category_description cd
			 where lcase ( cd.name ) = 'metal&amp;beads' );

update category
   set category_name = 'pics'
 where category_id in ( select cd.category_id
			  from category_description cd
			 where lcase ( cd.name ) = 'pics' );
			 update category
   set category_name = 'other'
 where category_id in ( select cd.category_id
			  from category_description cd
			 where lcase ( cd.name ) = 'other' );update category
   set category_name = 'yummy'
 where category_id in ( select cd.category_id
			  from category_description cd
			 where lcase ( cd.name ) = 'yummy' );

			 update category set display_details = 'category_candy.css', category_name = 'handmade'
where category_id = 41;