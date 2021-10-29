---- now lets code SQL

create table customers (
	id serial primary key,
	-- name "string" <mandatory>
	name varchar(30) not null,
	email varchar(120) not null,
	address varchar(120),
	city varchar(30),
	postcode varchar(12),
	country varchar(20)
);

create table hotels (
	id serial primary key,
	name varchar(120) not null,
	rooms int not null,
	postcode varchar(10)
);

create table bookings (
	id serial primary key,
	customer_id int references customers(id),
	hotel_id int references hotels(id),
	checkin_date date not null,
	nights int not null
);

INSERT INTO customers 
(name, email, address, city, postcode, country) 
VALUES ('John Smith','j.smith@johnsmith.org','11 New Road','Liverpool','L10 2AB','UK');

INSERT INTO hotels 
(name, rooms, postcode) 
VALUES ('Triple Point Hotel', 10, 'CM194JS');

INSERT INTO bookings 
(customer_id, hotel_id, checkin_date, nights) 
VALUES (1, 1, '2019-10-01', 2);

insert into customers 
(name, email, address, city, postcode, country)
values ('Omar Ascanio', 'omared@gmail.com', 'fluvia 199', 'Barcelona', '08020', 'ESP');

INSERT INTO hotels 
(name, rooms, postcode) 
VALUES ('Royal Cosmos Hotel', 5, 'TR209AX');

INSERT INTO hotels 
(name, rooms, postcode) 
VALUES ('Pacific Petal Motel', 15, 'BN180TG');

-- showing all the hotels
select * from hotels

-- showing all the customers info
select * from customers

-- showing all bookings info
select * from bookings

-- showing customers by name
select * from customers where name='Omar Ascanio'

-- show me all the customers that live in UK
select * from customers where country='UK'

-- show me ONLY THE NAME of the customers that live in SPAIN
select name from customers where country='ESP'

-- exercise 4

-- showing expecific info about customers
select name,address from customers

-- show me all the hotel with more tah 7 rooms
select * from hotels where rooms > 7;

-- show me the name and address of teh customer with id 1
select name,address from customers where id=1;

-- show me the bookings after 2019/10/01 date
select * from bookings where checkin_date > '2019/10/01';

-- show me the bookings after 2019/10/01 and a minimum of 2 nights
select * from bookings where checkin_date > '2019/10/01' and nights >= 2;

-- show me all the hotels with an especific zip code
select * from hotels where postcode = 'CM194JS' or postcode = 'TR209AX';


















