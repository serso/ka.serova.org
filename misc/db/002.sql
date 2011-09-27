create table country_name (
	country_id int(11) not null,
	language_id int(11) not null,
	name varchar(100) not null,
	PRIMARY KEY (country_id, language_id),
	foreign key (language_id) references `language`(language_id) on update cascade on delete cascade,
		foreign key (country_id) references `country`(country_id) on update cascade on delete cascade

)TYPE = MyISAM COLLATE 'utf8_bin';

insert into country_name values (176, 1, 'Russian Federation');
insert into country_name values (176, 2, 'Россия');
insert into country_name values (220, 2, 'Украина');

create table zone_name (
	zone_id int(11) not null,
	language_id int(11) not null,
	name varchar(100) not null,
	PRIMARY KEY (zone_id, language_id),
	foreign key (language_id) references `language`(language_id) on update cascade on delete cascade,
		foreign key (zone_id) references `zone`(zone_id) on update cascade on delete cascade

)TYPE = MyISAM COLLATE 'utf8_bin';

insert into zone_name values (2721, 2, 'Абакан');
insert into zone_name values (2722, 2, 'Агинское');
insert into zone_name values (2723, 2, 'Анадырь');
insert into zone_name values (2724, 2, 'Архангельск');
insert into zone_name values (2725, 2, 'Астрахань');
insert into zone_name values (2726, 2, 'Барнаул');
insert into zone_name values (2727, 2, 'Белгород');
insert into zone_name values (2728, 2, 'Биробиджан');
insert into zone_name values (2729, 2, 'Благовещенск');
insert into zone_name values (2730, 2, 'Брянск');
insert into zone_name values (2731, 2, 'Чебоксары');
insert into zone_name values (2732, 2, 'Челябинск');
insert into zone_name values (2733, 2, 'Черкесск');
insert into zone_name values (2734, 2, 'Чита');
insert into zone_name values (2735, 2, 'Дудинка');
insert into zone_name values (2736, 2, 'Элиста');
insert into zone_name values (2737, 2, 'Гомо-Алтайск');
insert into zone_name values (2738, 2, 'Горно-Алтайск');
insert into zone_name values (2739, 2, 'Грозный');
insert into zone_name values (2740, 2, 'Иркутск');
insert into zone_name values (2741, 2, 'Иваново');
insert into zone_name values (2742, 2, 'Ижевск');
insert into zone_name values (2743, 2, 'Калининград');
insert into zone_name values (2744, 2, 'Калуга');
insert into zone_name values (2745, 2, 'Каснодар');
insert into zone_name values (2746, 2, 'Казань');
insert into zone_name values (2747, 2, 'Кемерово');
insert into zone_name values (2748, 2, 'Хабаровск');
insert into zone_name values (2749, 2, 'Ханты-Мансийск');
insert into zone_name values (2750, 2, 'Кострома');
insert into zone_name values (2751, 2, 'Краснодар');
insert into zone_name values (2752, 2, 'Красноярск');
insert into zone_name values (2753, 2, 'Кудымкар');
insert into zone_name values (2754, 2, 'Курган');
insert into zone_name values (2755, 2, 'Курск');
insert into zone_name values (2756, 2, 'Кызыл');
insert into zone_name values (2757, 2, 'Липетск');
insert into zone_name values (2758, 2, 'Магадан');
insert into zone_name values (2759, 2, 'Махачкала');
insert into zone_name values (2760, 2, 'Майкоп');
insert into zone_name values (2761, 2, 'Москва');
insert into zone_name values (2762, 2, 'Мурманск');
insert into zone_name values (2763, 2, 'Нальчик');
insert into zone_name values (2764, 2, 'Нарьян Мар');
insert into zone_name values (2765, 2, 'Назрань');
insert into zone_name values (2766, 2, 'Нижний Новгород');
insert into zone_name values (2767, 2, 'Новгород');
insert into zone_name values (2768, 2, 'Новосибирск');
insert into zone_name values (2769, 2, 'Омск');
insert into zone_name values (2770, 2, 'Орёл');
insert into zone_name values (2771, 2, 'Оренбург');
insert into zone_name values (2772, 2, 'Палана');
insert into zone_name values (2773, 2, 'Пенза');
insert into zone_name values (2774, 2, 'Пермь');
insert into zone_name values (2775, 2, 'Петропавловск-Камчатский');
insert into zone_name values (2776, 2, 'Петрозаводск');
insert into zone_name values (2777, 2, 'Псков');
insert into zone_name values (2778, 2, 'Ростов-на-Дону');
insert into zone_name values (2779, 2, 'Рязань');
insert into zone_name values (2780, 2, 'Салехард');
insert into zone_name values (2781, 2, 'Самара');
insert into zone_name values (2782, 2, 'Саранск');
insert into zone_name values (2783, 2, 'Саратов');
insert into zone_name values (2784, 2, 'Смоленск');
insert into zone_name values (2785, 2, 'Санкт-Петербург');
insert into zone_name values (2786, 2, 'Ставрополь');
insert into zone_name values (2787, 2, 'Сывтывкар');
insert into zone_name values (2788, 2, 'Тамбов');
insert into zone_name values (2789, 2, 'Томск');
insert into zone_name values (2790, 2, 'Тула');
insert into zone_name values (2791, 2, 'Тура');
insert into zone_name values (2792, 2, 'Тверь');
insert into zone_name values (2793, 2, 'Тюмень');
insert into zone_name values (2794, 2, 'Уфа');
insert into zone_name values (2795, 2, 'Ульяновск');
insert into zone_name values (2796, 2, 'Улан-Удэ');
insert into zone_name values (2797, 2, 'Усть-ордынский');
insert into zone_name values (2798, 2, 'Владикавказ');
insert into zone_name values (2799, 2, 'Владимир');
insert into zone_name values (2800, 2, 'Владивосток');
insert into zone_name values (2801, 2, 'Волгоград');
insert into zone_name values (2802, 2, 'Вологда');
insert into zone_name values (2803, 2, 'Воронеж');
insert into zone_name values (2804, 2, 'Вятка');
insert into zone_name values (2805, 2, 'Якутск');
insert into zone_name values (2806, 2, 'Ярославль');
insert into zone_name values (2807, 2, 'Екатеринбург');
insert into zone_name values (2808, 2, 'Йошкар-Ола');
