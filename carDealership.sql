CREATE TABLE Customer (
	customer_id INTEGER PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(100),
	address VARCHAR(200),
	phone_no VARCHAR(15)
);
INSERT INTO Customer (customer_id, first_name, last_name, email, address, phone_no)
VALUES (1, 'Ramesh', 'Hardik', 'hardik@gmail', 'Delhi', '2347893451');

INSERT INTO Customer (customer_id, first_name, last_name, email, address, phone_no)
VALUES (2, 'John', 'Smith', 'smith@gmail', 'New York', '2347895555');

CREATE TABLE Sales_person(
	staff_id serial PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	contact_num VARCHAR(150),
	emial VARCHAR(200)
);
INSERT INTO Sales_person(staff_id, first_name, last_name, contact_num, emial)
VALUES (3, 'Smith', 'Bob', '123098743', 'bobsmith@gmail.com');
 
SELECT *
FROM Sales_person;

CREATE TABLE mechanic(
	mechanic_id serial PRIMARY KEY,
	first_name VARCHAR(100),
	last_name VARCHAR(100),
	email VARCHAR(100),
	address VARCHAR(200),
	phone VARCHAR(15)
);
INSERT INTO mechanic(mechanic_id, first_name, last_name, emial, address, phone)
VALUES (6, 'Ahmed', 'Ali', 'alia@hotmail.com', 'BC CANADA', '1230987654');

CREATE TABLE Mechanic_record(
	record_id serial PRIMARY KEY,
	service_id INTEGER,
	mechanic_id INTEGER,
	Foreign key (mechanic_id) references mechanic(mechanic_id)	
);

CREATE TABLE Service_invoice(
	service_id serial PRIMARY KEY,
	order_date TIMESTAMP,
	amount NUMERIC(8,2),
	total_cost NUMERIC(10,2),
	description VARCHAR(500),
	customer_id INTEGER,
	Foreign Key(customer_id) references Customer(customer_id)
);

CREATE TABLE Parts(
	parts_id serial PRIMARY KEY,
	part_type VARCHAR(100),
	part_price NUMERIC(6,2),
	service_id INTEGER,
	Foreign Key(service_id) references Service_invoice(service_id)
);
ALTER TABLE Mechanic_record
ADD FOREIGN KEY(service_id) references Service_invoice(service_id)

INSERT INTO Service_invoice(service_id, order_date, amount, total_cost, description, customer_id, item_id)
VALUES ('4', '11-05-2020', '3', '130', 'Changing oil and one tire', '3', '2');

INSERT INTO Mechanic_record(record_id, service_id, mechanic_id)
VALUES (5, 4, 6)

INSERT INTO Parts (parts_id, part_type, part_price, service_id)
VALUES ('5', 'Tire', '30', '1');

CREATE TABLE car_inventory(
	serial_id INTEGER PRIMARY KEY,
	Make VARCHAR(15),
	Model VARCHAR(15),
	staff_id INTEGER references Sales_person(staff_id),
	customer_id INTEGER references customer(customer_id)
);
INSERT INTO car_inventory(serial_id, Make, Model, staff_id, customer_id)
VALUES ('2','Ford', 'Explorer','3','7');

CREATE TABLE sales_invoice(
	sales_id INTEGER PRIMARY KEY,
	amount NUMERIC(8,2),
	purchase_date TIMESTAMP,
	serial_id INTEGER,
	Foreign Key(serial_id) references car_inventory(serial_id),
	staff_id INTEGER,
	Foreign Key(staff_id) references Sales_person(staff_id),
	customer_id INTEGER,
	Foreign Key(customer_id) references Customer(customer_id)
);
INSERT INTO sales_invoice(sales_id, amount, purchase_date, serial_id, staff_id, customer_id)
VALUES ('4','67','21-03-2020','643','9','5');


SELECT *
FROM Mechanic





