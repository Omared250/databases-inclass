drop table if exists bookings;
drop table if exists hotels;
drop table if exists customers;

CREATE TABLE customers (
  id       SERIAL PRIMARY KEY,
  name     VARCHAR(30) NOT NULL,
  email    VARCHAR(120) NOT NULL,
  address  VARCHAR(120),
  city     VARCHAR(30),
  postcode VARCHAR(12),
  country  VARCHAR(20)
);

CREATE TABLE hotels (
  id       SERIAL PRIMARY KEY,
  name     VARCHAR(120) NOT NULL,
  rooms    INT NOT NULL,
  postcode VARCHAR(10)
);

CREATE TABLE bookings (
  id            SERIAL PRIMARY KEY,
  customer_id   INT REFERENCES customers(id),
  hotel_id      INT REFERENCES hotels(id),
  checkin_date  DATE NOT NULL,
  nights        INT NOT NULL
);

INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('John Smith','j.smith@johnsmith.org','11 New Road','Liverpool','L10 2AB','UK');
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Sue Jones','s.jones1234@gmail.com','120 Old Street','London','N10 3CD','UK');
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Alice Evans','alice.evans001@hotmail.com','3 High Road','Manchester','m13 4ef','UK');
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Mohammed Trungpa','mo.trungpa@hotmail.com','25 Blue Road','Manchester','M25 6GH','UK');
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Steven King','steve.king123@hotmail.com','19 Bed Street','Newtown', 'xy2 3ac','UK');
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Nadia Sethuraman','nadia.sethuraman@mail.com','135 Green Street','Manchester','M10 4BG','UK');
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Melinda Marsh','mel.marsh-123@gmail.com','7 Preston Road','Oldham','OL3 5XZ','UK');
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Mart�n Sommer','martin.sommer@dfgg.net','C/ Romero, 33','Madrid','28016','Spain');
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Laurence Lebihan','laurence.lebihan@xmzx.net','12, rue des Bouchers','Marseille','13008','France');
INSERT INTO customers (name, email, address, city, postcode, country) VALUES ('Keith Stewart','keith.stewart@gmail.com','84 Town Lane','Tadworth','td5 7ng','UK');

INSERT INTO hotels (name, rooms, postcode) VALUES ('Golden Cavern Resort', 10, 'L10ABC');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Elder Lake Hotel', 5, 'L10ABC');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Pleasant Mountain Hotel', 7, 'ABCDE1');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Azure Crown Resort & Spa', 18, 'DGQ127');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Jade Peaks Hotel', 4, 'DGQ127');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Elegant Resort', 14, 'DGQ127');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Cozy Hotel', 20, 'AYD189');
INSERT INTO hotels (name, rooms, postcode) VALUES ('Snowy Echo Motel', 15, 'AYD189');

INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (1, 1, '2019-10-01', 2);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (1, 1, '2019-12-10', 6);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (1, 3, '2019-07-20', 4);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (2, 3, '2020-03-10', 4);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (2, 5, '2020-04-01', 1);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (3, 1, '2019-11-01', 1);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (3, 2, '2019-11-23', 2);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (4, 8, '2019-12-23', 3);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (4, 2, '2019-09-16', 5);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (6, 5, '2019-09-14', 2);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (6, 6, '2020-01-14', 5);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (8, 4, '2020-02-01', 3);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (8, 5, '2020-01-03', 7);
INSERT INTO bookings (customer_id, hotel_id, checkin_date, nights) VALUES (8, 8, '2019-12-25', 4);

-- Retrieve all information for the customer Laurence Lebihan.
select * from customers where name='Laurence Lebihan';
-- Output
-- 9	Laurence Lebihan	laurence.lebihan@xmzx.net	12, rue des Bouchers	Marseille	13008	France

-- Retrieve all customers name living in UK.
select name from customers where country='UK';
-- Output
-- John Smith
-- Sue Jones
-- Alice Evans
-- Mohammed Trungpa
-- Steven King
-- Nadia Sethuraman
-- Melinda Marsh
-- Keith Stewart

-- Retrieve the address, city and postcode of Melinda Marsh
select address,city,postcode from customers where name='Melinda Marsh';
-- Output
-- 7 Preston Road	Oldham	OL3 5XZ

-- Retrieve all hotels located in the postcode DGQ127.
select * from hotels where postcode='DGQ127';
-- Output
-- 4	Azure Crown Resort & Spa	18	DGQ127
-- 5	Jade Peaks Hotel	4	DGQ127
-- 6	Elegant Resort	14	DGQ127

-- Retrieve all hotels with more than 11 rooms
select * from hotels where rooms > 11;
-- Output
-- 4	Azure Crown Resort & Spa	18	DGQ127
-- 6	Elegant Resort	14	DGQ127
-- 7	Cozy Hotel	20	AYD189
-- 8	Snowy Echo Motel	15	AYD189

-- Retrieve all hotels with more than 6 rooms but less than 15 rooms
select * from hotels where rooms > 6 and rooms < 15;
-- Output
-- 1	Golden Cavern Resort	10	L10ABC
-- 3	Pleasant Mountain Hotel	7	ABCDE1
-- 6	Elegant Resort	14	DGQ127

-- Retrieve all hotels with exactly 10 rooms or 20 rooms
select * from hotels where rooms = 10 or rooms = 20;
-- Output
-- 1	Golden Cavern Resort	10	L10ABC
-- 7	Cozy Hotel	20	AYD189

-- Retrieve all bookings for customer id 1
select * from bookings where customer_id=1;
-- Output
-- 1	1	1	2019-10-01	2
-- 2	1	1	2019-12-10	6
-- 3	1	3	2019-07-20	4

-- Retrieve all bookings for more than 4 nights.
select * from bookings where nights > 4;
-- Output
-- 2	1	1	2019-12-10	6
-- 9	4	2	2019-09-16	5
-- 11	6	6	2020-01-14	5
-- 13	8	5	2020-01-03	7

-- Retrieve all bookings starting in 2020
select * from bookings where checkin_date >= '2020-01-01';
-- Output
-- 4	2	3	2020-03-10	4
-- 5	2	5	2020-04-01	1
-- 11	6	6	2020-01-14	5
-- 12	8	4	2020-02-01	3
-- 13	8	5	2020-01-03	7

-- Retrieve all bookings before 2020 for less than 4 nights
select * from bookings where checkin_date < '2020-01-01' and nights < 4;
-- Output
-- 1	1	1	2019-10-01	2
-- 6	3	1	2019-11-01	1
-- 7	3	2	2019-11-23	2
-- 8	4	8	2019-12-23	3
-- 10	6	5	2019-09-14	2








