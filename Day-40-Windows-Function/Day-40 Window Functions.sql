-- CREATE DATABASE sql_window_functions_db;

USE sql_window_functions_db;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
);

INSERT INTO customers VALUES
(1,'Alice','Delhi'),
(2,'Bob','Mumbai'),
(3,'Charlie','Pune'),
(4,'David','Jaipur'),
(5,'Eva','Bangalore');

CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    price DECIMAL(10,2)
);

INSERT INTO products VALUES
(101,'Laptop','Electronics',60000),
(102,'Mouse','Electronics',800),
(103,'Keyboard','Electronics',1500),
(104,'Office Chair','Furniture',7000),
(105,'Desk','Furniture',12000),
(106,'Headphones','Electronics',2500),
(107,'Monitor','Electronics',18000),
(108,'Printer','Office',9000);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    FOREIGN KEY (customer_id)
        REFERENCES customers(customer_id)
);

INSERT INTO orders VALUES
(1001,1,'2025-01-01'),
(1002,2,'2025-01-02'),
(1003,1,'2025-01-05'),
(1004,3,'2025-01-07'),
(1005,2,'2025-01-10'),
(1006,4,'2025-01-11'),
(1007,5,'2025-01-15'),
(1008,1,'2025-01-20'),
(1009,3,'2025-01-25'),
(1010,5,'2025-01-28'),
(1011,2,'2025-02-02'),
(1012,4,'2025-02-05'),
(1013,1,'2025-02-08'),
(1014,3,'2025-02-11'),
(1015,5,'2025-02-15');

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

INSERT INTO order_items VALUES
(1,1001,101,1),
(2,1001,102,2),
(3,1002,103,1),
(4,1002,106,1),
(5,1003,107,1),
(6,1004,104,2),
(7,1005,105,1),
(8,1006,108,1),
(9,1007,102,3),
(10,1008,101,1),
(11,1009,107,2),
(12,1010,106,2),
(13,1011,103,2),
(14,1012,104,1),
(15,1013,105,1),
(16,1014,108,2),
(17,1015,101,1),
(18,1015,102,2);

SELECT * FROM customers;

SELECT * FROM products;

SELECT * FROM orders;

SELECT * FROM order_items;


-- =========================================
-- EASY
-- =========================================

-- Display each order along with the previous order date for the same customer.
SELECT o.customer_id , o.order_id , o.order_date ,  
LAG(o.order_date) OVER( PARTITION BY o.customer_id
					ORDER BY o.order_date) AS previous_order_date
FROM orders AS o;

-- Display each order along with the next order date for the same customer.
SELECT o.customer_id , o.order_id , o.order_date , 
LEAD(o.order_date) OVER( PARTITION BY o.customer_id 
			 ORDER BY o.order_date
             ) AS next_order_date
FROM orders AS o;

-- Calculate the running total revenue over time.
WITH daily_revenue_CTE AS (  
SELECT  o.order_date , SUM(p.price * oi.quantity) AS daily_revenue 
FROM orders AS o
LEFT JOIN order_items AS oi
ON oi.order_id  = o.order_id
LEFT JOIN products AS p
ON p.product_id = oi.product_id 
GROUP BY o.order_date) 

SELECT order_date , daily_revenue , 
SUM(daily_revenue) OVER( 
								ORDER BY order_date
                                ) AS running_total
FROM daily_revenue_CTE ;
					
-- Calculate the running total revenue for each customer.
WITH customer_daily_revenue AS ( 
SELECT c.customer_id ,o.order_date , SUM(p.price * oi.quantity) AS order_revenue 
FROM customers AS c
LEFT JOIN orders AS o
ON o.customer_id =  c.customer_id 
LEFT JOIN order_items AS oi
ON oi.order_id = o.order_id 
LEFT JOIN products AS p
ON p.product_id = oi.product_id
GROUP BY o.order_id,c.customer_id)

SELECT customer_id ,order_date , order_revenue , 
SUM(order_revenue) OVER( 
						PARTITION BY customer_id
                        ORDER BY order_date
                        ) AS customer_running_total
FROM customer_daily_revenue;

