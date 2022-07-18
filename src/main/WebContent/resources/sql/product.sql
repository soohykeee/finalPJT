create table if not exists product(
	p_id varchar(20) not null,
	p_name varchar(30),
	p_unitPrice integer,
	p_description text,
	p_brand varchar(20),
	p_category varchar(20),
	p_unitsInStock long,
	p_size varchar(10),
	p_fileName varchar(20),
	primary key (p_id)
)default charset=utf8;

