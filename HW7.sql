create database store;
USE store;
CREATE TABLE orders(
    id int NOT NULL UNIQUE AUTO_INCREMENT,
    product varchar(20),
    cost int,
    orderID INT NOT NULL,
    customerID INT NOT NULL,
     FOREIGN KEY (customerID) REFERENCES customers(id),
    PRIMARY KEY (id)
);
CREATE TABLE customers(
    id int NOT NULL UNIQUE AUTO_INCREMENT,
    firstname varchar(20),
    lastname varchar(20),
    customerID INT NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE products(
    id int NOT NULL UNIQUE AUTO_INCREMENT,
    brand varchar(20),
    productID int NOT NULL,
    customerID INT NOT NULL,
    orderID INT NOT NULL,
    FOREIGN KEY (customerID) REFERENCES customers(id),
    FOREIGN KEY (orderID) REFERENCES orders(id),
    PRIMARY KEY (id)
)
INSERT INTO customers (firstname, lastname, customerID) VALUES ('Bob', 'Duncan', 1);
INSERT INTO customers (firstname, lastname, customerID) VALUES ('Ash', 'Ketchum', 2);
INSERT INTO customers (firstname, lastname, customerID) VALUES ('Anakin', 'Skywalker', 3);

INSERT INTO orders (product, cost, orderID, customerID) VALUES ('Hammers', 5, 1, 1);
INSERT INTO orders (product, cost, orderID, customerID) VALUES ('Nails', 1, 2, 1);
INSERT INTO orders (product, cost, orderID, customerID) VALUES ('Wood', 3, 3, 2);
INSERT INTO orders (product, cost, orderID, customerID) VALUES ('Spaceship', 2000000, 4, 3);

INSERT INTO products (brand, productID, orderID, customerID) VALUES ('Estwing', 1, 1, 1);
INSERT INTO products (brand, productID, orderID, customerID) VALUES ('Cocena', 2, 2, 1);
INSERT INTO products (brand, productID, orderID, customerID) VALUES ('Fezzia', 3, 3, 2);
INSERT INTO products (brand, productID, orderID, customerID) VALUES ('Empire', 4, 4, 3);

SELECT * FROM customers;
SELECT * FROM orders;
SELECT * FROM products;

SELECT productID, customerID, orderID FROM products;
SELECT firstname, lastname FROM customers;
SELECT product, cost FROM orders;

DELETE from products where id = 5;
DELETE from products where id = 6;
DELETE from products where id = 7;
DELETE from products where id = 8;
DELETE from orders where id in (7,8);

SELECT customers.firstname, customers.lastname, orders.product
FROM customers
INNER JOIN orders ON orders.customerID = customers.id;

SELECT customers.firstname, customers.lastname, orders.product
FROM customers
INNER JOIN orders ON orders.customerID = customers.id
WHERE lastname = 'Duncan';

SELECT customers.firstname, customers.lastname, orders.product
FROM customers
INNER JOIN orders ON orders.customerID = customers.id
WHERE firstname = 'Anakin';


