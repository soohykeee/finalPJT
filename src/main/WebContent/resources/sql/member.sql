create table member(
	id varchar(10) not null,
	password varchar(20) not null,
	name varchar(10) not null,
	gender varchar(4),
	birth varchar(10),
	email varchar(30),
	phone varchar(20),
	address varchar(90),
	regist_day varchar(50),
	primary key(id)
) default charset=utf8;
