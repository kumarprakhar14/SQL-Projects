create database Shop;
use Shop;

create table Customer(
	Cust_id integer primary key,
    Cust_name varchar(50) not null
);

create table Item(
	item_id integer primary key, 
    item_name varchar(50) not null,
    price integer not null
);

create table sale(
	bill_no integer primary key, 
    bill_date date not null, 
    Cust_id integer, 
    item_id integer, 
    Qty_sold integer,
    foreign key(Cust_id)references Customer(Cust_id),
    foreign key(item_id)references Item(item_id)
    );
    
insert into Customer(Cust_id, Cust_name) values
(1, "John"), 
(2, "Alice"),
(3, "Bob"),
(4, "Emily"), 
(5, "David"), 
(6, "Sophia"),
(7, "Michael"),
(8, "Emma"), 
(9, "Oliver"), 
(10, "Eva");

insert into Item(item_id, item_name, price) values
(101, 'Phone', 500),
(102, 'Laptop', 1000),
(103, 'Tablet', 800),
(104, 'Headphone', 100), 
(105, 'Watch', 200),
(106, 'TV', 2000),
(107, 'Clock', 300),
(108, 'Monitor', 800),
(109, 'Keyboard', 400),
(110, 'Mouse', 300);

insert into sale(bill_no, bill_date, Cust_id, item_id, Qty_sold) values
(1, '2024-03-26', 1, 101, 2),
(2, '2024-03-26', 2, 102, 1), 
(3, '2024-03-27', 3, 103, 3),
(4, '2024-03-27', 4, 104, 2),
(5, '2024-03-28', 5, 105, 1),
(6, '2024-03-28', 1, 106, 1),
(7, '2024-03-29', 2, 107, 2),
(8, '2024-03-29', 3, 108, 3),
(9, '2024-03-30', 4, 109, 3), 
(10, '2024-03-30', 5, 110, 1);

