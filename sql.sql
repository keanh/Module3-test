use test_module;
create table product(
id int not null primary key auto_increment,
name varchar(50),
price int,
quantity int,
color varchar(50),
description varchar(255),
id_category int,
foreign key(id_category) references category(id)
);

create table category(
id int primary key auto_increment,
name varchar(50)
);

insert into category(name) value('Phone');
insert into category(name) value('Television');

DELIMITER $$
CREATE PROCEDURE `createProduct` (
name_p varchar(50),
price_p int,
quantity_p int,
color_p varchar(50),
description_p varchar(255),
id_category_p int)
BEGIN
	insert into product(name,price,quantity,color,description,id_category)
    values(name_p, price_p, quantity_p, color_p,description_p,id_category_p);
END$$
DELIMITER ;
call createProduct('Iphone 11',779,12,'Purple,Yellow,Green','good',1);

DELIMITER $$
CREATE PROCEDURE `deleteProduct` (id_p int)
BEGIN
	delete from product where id = id_p;
END$$
DELIMITER ;
call deleteProduct(1);

DELIMITER $$
CREATE PROCEDURE `updateProduct` (id_p int,
name_p varchar(50),
price_p int,
quantity_p int,
color_p varchar(50),
description_p varchar(255),
id_category_p int)
BEGIN
	update product set name = name_p, price = price_p, quantity = quantity_p,
    color = color_p, description = description_p, id_category = id_category_p
    where id = id_p;
END$$
DELIMITER ;
call updateProduct(2,'TV',779,12,'Purple,Yellow,Green','good',2);

DELIMITER $$
CREATE PROCEDURE `selectAllProduct` ()
BEGIN
	select product.id,product.name,price,quantity,color,description,category.name
    from product join category on product.id_category = category.id;
END$$
DELIMITER ;
call selectAllProduct();

DELIMITER $$
CREATE PROCEDURE `selectProductById` (id_p int)
BEGIN
	select product.id,product.name,price,quantity,color,description,category.name
    from product join category on product.id_category = category.id 
    where product.id = id_p;
END$$
DELIMITER ;
call selectProductById(2);

DELIMITER $$
CREATE PROCEDURE `selectProductByName` (name_p varchar(50))
BEGIN
	select product.id,product.name,price,quantity,color,description,category.name
    from product join category on product.id_category = category.id 
    where product.name regexp name_p;
END$$
DELIMITER ;
call selectProductByName('Xiaomi');

select * from product where product.name like 'Xiaomi%';
select * from product;