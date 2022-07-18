CREATE TABLE cart (
	cartId int not null auto_increment,
	userId varchar(10) not null,
	productId varchar(20) not null,
	amout int default 0,
	primary key(cartid)
)default charset=utf8;

