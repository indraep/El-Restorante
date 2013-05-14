% Nama database : el restorante

create table user (
	nama varchar(50) not null,
	username varchar(50) primary key,
	password varchar(50) not null,
	alamat text not null,
	email varchar(50) not null,
	birth_date date not null,
	bio text not null,
	role int not null,
	image longblob
);

insert into user(nama, username, password, alamat, email, birth_date, bio, role) 
	values('admin', 'admin', md5('admin'), 'Depok', 'admin@elrestorante.com', '1992-12-07', 'Hidup Segan Mati Tak Mau', 1)

create table message (
	id int auto_increment primary key,
	content text not null,
	date date not null,
	time time not null,
	username varchar(50) not null,
	foreign key (username) references user (username) on update cascade on delete cascade
);

create table order_list (
	id int auto_increment primary key,
	kode_pesanan text,
	date date not null,
	time time not null,
	username varchar(50) not null,
	total_biaya int not null,
	addition text,
	foreign key (username) references user (username) on update cascade on delete cascade
);

create table order_detail (
	id_order int not null,
	id_menu int not null,
	no int not null,
	quantity int not null,
	primary key (id_order, no),
	foreign key (id_order) references order_list (id) on update cascade on delete cascade
);


create table category (
	id int auto_increment not null primary key,
	name text not null
);

create table menu (
	id int auto_increment primary key,
	category_id int not null,
	name text not null,
	description text not null,
	price int not null,
	image longblob,
	foreign key (category_id) references category (id) on update cascade on delete cascade
);


