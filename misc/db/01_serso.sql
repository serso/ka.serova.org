create database if not exists ka_serova_db default character set = "utf8";

use ka_serova_db;

create table users (
	user_id int unsigned auto_increment not null,
	username varchar(255) not null,
	email varchar(255) not null,
	password char(32) not null,
	creation_date datetime not null,
	creator_id int unsigned not null,
	modification_date datetime null,
	enabled enum ('true', 'false') not null default 'false',
	
	primary key(user_id),
	
	constraint `creator_id_in_users_fk`
	foreign key (creator_id) references users(user_id)
	on update cascade
	on delete restrict,
	
	unique(email),
	unique(username)
)ENGINE=InnoDB;

create table user_roles (
    user_role varchar(20) not null,
	primary key (user_role)
)ENGINE=InnoDB;

create table users_user_roles_link (
	user_id int unsigned not null,
	user_role varchar(20) not null default 'user',

	primary key (user_id, user_role),

	constraint `user_id_in_users_user_roles_link_fk` foreign key (user_id) references users(user_id)
	on update cascade
	on delete cascade,

	constraint `user_role_in_users_user_roles_link_fk` foreign key (user_role) references user_roles(user_role)
	on update cascade
	on delete cascade
)ENGINE=InnoDB;

insert into user_roles values('system');
insert into user_roles values('administrator');
insert into user_roles values('master');
insert into user_roles values('developer');

insert into users values (1, 'system', '', '', now(), 1, null, 'false');
insert into users values (2, 'serso', 'serso1988@gmail.com', 'f03df3dff8f672ea78015bb2fe84a419', now(), 1, null, 'true');
insert into users values (3, 'ka.serova', 'ka.serova@gmail.com', 'e1b2c5f57bdaf3a59fcdb5488a116b98', now(), 1, null, 'true');

insert into users_user_roles_link values (1, 'system');
insert into users_user_roles_link values (2, 'administrator');
insert into users_user_roles_link values (2, 'developer');
insert into users_user_roles_link values (3, 'master');

create table categories (
	category_name varchar(40) not null,
	primary key (category_name)
)ENGINE=InnoDB;

insert into categories values ('flowers');
insert into categories values ('yummy');
insert into categories values ('metal_and_beads');
insert into categories values ('pics');
insert into categories values ('other');

create table currencies (
	currency_code varchar(40) not null,
	primary key (currency_code)
)ENGINE=InnoDB;

insert into currencies values ('RUB');