CREATE DATABASE ecommerce_day41;

USE ecommerce_day41;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    city VARCHAR(50),
    signup_date DATE
);

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_status VARCHAR(30),

    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id),

    FOREIGN KEY (product_id)
    REFERENCES products(product_id)
);


CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(30),
    payment_status VARCHAR(30),
    payment_amount DECIMAL(10,2),

    FOREIGN KEY (order_id)
    REFERENCES orders(order_id)
);

INSERT INTO customers VALUES
(1,'Alice','alice@gmail.com','Delhi','2024-01-10'),
(2,'Bob','bob@gmail.com','Mumbai','2024-02-05'),
(3,'Charlie','charlie@gmail.com','Pune','2024-03-12'),
(4,'David','david@gmail.com','Delhi','2024-04-01'),
(5,'Eva','eva@gmail.com','Bangalore','2024-05-15'),
(6,'Frank','frank@gmail.com','Hyderabad','2024-06-20'),
(7,'Grace','grace@gmail.com','Jaipur','2024-07-08'),
(8,'Henry','henry@gmail.com','Chennai','2024-08-18');

INSERT INTO products VALUES
(101,'Laptop','Electronics',65000),
(102,'Mouse','Electronics',800),
(103,'Keyboard','Electronics',1500),
(104,'Headphones','Electronics',2500),
(105,'Office Chair','Furniture',7000),
(106,'Desk','Furniture',12000),
(107,'Notebook','Stationery',120),
(108,'Pen','Stationery',30);

INSERT INTO orders VALUES
(1001,1,'2025-01-05','Delivered'),
(1002,2,'2025-01-08','Delivered'),
(1003,1,'2025-01-10','Cancelled'),
(1004,3,'2025-01-12','Delivered'),
(1005,4,'2025-01-15','Delivered'),
(1006,5,'2025-02-01','Pending'),
(1007,1,'2025-02-03','Delivered'),
(1008,6,'2025-02-08','Delivered'),
(1009,7,'2025-02-15','Delivered'),
(1010,8,'2025-02-20','Pending'),
(1011,1,'2025-03-02','Delivered'),
(1012,1,'2025-03-10','Delivered'),
(1013,1,'2025-03-18','Delivered'),
(1014,2,'2025-03-25','Delivered'),
(1015,3,'2025-04-05','Cancelled');

INSERT INTO order_items VALUES
(1,1001,101,1),
(2,1001,102,2),
(3,1002,103,1),
(4,1003,104,1),
(5,1004,105,1),
(6,1005,106,1),
(7,1006,107,10),
(8,1007,101,1),
(9,1008,108,20),
(10,1009,104,2),
(11,1010,102,3),
(12,1011,103,2),
(13,1012,105,1),
(14,1013,107,15),
(15,1014,101,1),
(16,1015,106,1);

INSERT INTO payments VALUES
(501,1001,'UPI','Success',66600),
(502,1002,'Card','Success',1500),
(503,1003,'UPI','Refunded',2500),
(504,1004,'Net Banking','Success',7000),
(505,1005,'Card','Success',12000),
(506,1006,'Cash','Pending',1200),
(507,1007,'UPI','Success',65000),
(508,1008,'Card','Success',600),
(509,1009,'UPI','Success',5000),
(510,1010,'Cash','Pending',2400),
(511,1011,'Card','Success',3000),
(512,1012,'UPI','Success',7000),
(513,1013,'Card','Success',1800),
(514,1014,'Net Banking','Success',65000),
(515,1015,'UPI','Refunded',12000);

SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM orders;

SELECT * FROM order_items;

SELECT * FROM payments;

-- ===============================
-- EASY 
-- ===============================

-- Create a view named active_customers that shows customers who have placed more than 5 orders.
CREATE VIEW active_customers AS 
SELECT c.customer_id , c.customer_name , c.city 
FROM customers  AS c
INNER JOIN orders AS o 
ON o.customer_id = c.customer_id 
GROUP BY c.customer_id , c.customer_name , c.city 
HAVING COUNT(o.order_id) > 5;

-- Display all records from the active_customers view.
SELECT * FROM active_customers;

-- Delete the view active_customers.
DROP VIEW active_customers ; 

-- Create an index on the customer_id column of the orders table.
CREATE INDEX idx_customer 
ON orders(customer_id) ; 

--  Display all orders placed by customer_id = 1.
SELECT * FROM orders 
WHERE customer_id  = 1;

-- OR
SELECT order_id , customer_id , order_date 
FROM orders
WHERE customer_id = 1 ; 

-- =====================================
-- MEDIUM
-- =====================================

-- Create a view named customer_revenue that displays:

-- customer_id
-- customer_name
-- total_revenue

-- Where:

-- total_revenue = SUM(payment_amount)
-- Include only successful payments (payment_status = 'Success')
-- Group the results by customer.

CREATE VIEW customer_revenue AS 
SELECT c.customer_id , c.customer_name , SUM(p.payment_amount) AS Total_revenue 
FROM customers AS c
LEFT JOIN orders AS o 
ON o.customer_id = c.customer_id 
LEFT JOIN payments AS p
ON p.order_id = o.order_id 
WHERE p.payment_status = "Success"
GROUP BY c.customer_id , c.customer_name ; 

-- Create a view named product_sales that displays:

-- product_id
-- product_name
-- category
-- total_quantity_sold

-- Requirements:

-- Use the products and order_items tables.
-- Calculate total_quantity_sold using SUM(quantity).
-- Group the results by product.
CREATE VIEW product_sales AS 
SELECT p.product_id , p.product_name , p.category , SUM(oi.quantity) AS Total_quantity_sold 
FROM products AS p 
JOIN order_items AS oi 
ON oi.product_id = p.product_id 
GROUP BY p.product_id , p.product_name , p.category  ; 

-- Look at these tables:

-- customers
-- orders
-- order_items
-- products
-- payments
-- Task:

-- Which columns would you create indexes on to improve query performance?

-- Write only the CREATE INDEX statements.
CREATE INDEX idx_order_customer_id 
ON orders(customer_id) ; 

-- optimize Querys 

SELECT order_id , customer_id , order_date 
FROM orders 
WHERE order_date >= "2025-01-01" AND order_date <= "2026-01-01";

SELECT order_id , customer_id , order_date 
FROM orders 
WHERE customer_id = 1 ; 
