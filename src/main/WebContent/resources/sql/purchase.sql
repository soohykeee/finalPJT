create table purchase(
	purchaseId int not null auto_increment,
	userId varchar(10) not null,
	productId varchar(20) not null,
	shipName varchar(20) not null,
	shipAddress varchar(50) not null,
	shipPhone varchar(20) not null,
	purchaseDate varchar(30) not null,
	primary key(purchaseId)
)default charset=utf8;
