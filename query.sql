create table user (
	nama varchar(50) not null,
	username varchar(50) primary key,
	password varchar(50) not null,
	alamat text not null,
	email varchar(50) not null,
	birth_date date,
	bio text
);

create table message (
	id int auto_increment primary key,
	content text not null,
	date date not null,
	time time not null,
	username varchar(50) not null,
	foreign key (username) references user (username)
);

create table order_list (
	id int auto_increment primary key,
	date date not null,
	time time not null,
	username varchar(50) not null,
	foreign key (username) references user (username)
);

create table order_detail (
	id_order int not null,
	no int not null,
	addition text,
	quantity int not null,
	primary key (id_order, no),
	foreign key (id_order) references order_list (id)
);


create table category (
	id int auto_increment not null primary key,
	name text not null
);

create table menu (
	id int auto_increment primary key,
	name text not null,
	description text not null,
	price int not null
);


