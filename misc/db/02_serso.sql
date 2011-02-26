create table items (
	item_id int unsigned auto_increment not null,
	
	title varchar(200) not null,
	description varchar(2000) null,
	price_amount float null,
	price_currency varchar(40) null,
	
	creator_id int unsigned not null,

	hidden enum ('true', 'false') not null default 'false',
	
	primary key(item_id),
	
	constraint `price_currency_in_items_fk`
	foreign key (price_currency) references currencies(currency_code)
	on update cascade
	on delete restrict,

	constraint `creator_id_in_items_fk`
	foreign key (creator_id) references users(user_id)
	on update cascade
	on delete cascade

)ENGINE=InnoDB;

create table item_pictures (
	item_id int unsigned not null,
	path varchar(1000) not null,
	thumbnail_path varchar(1000) not null,

	constraint `item_id_in_item_pictures_fk`
	foreign key (item_id) references items(item_id)
	on update cascade
	on delete cascade
)ENGINE=InnoDB;