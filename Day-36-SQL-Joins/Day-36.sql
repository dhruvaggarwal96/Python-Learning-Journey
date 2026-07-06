-- CREATE DATABASE sql_joins_day36;

USE sql_joins_day36;

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    city VARCHAR(50)
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
    shipping_date DATE,
    FOREIGN KEY (customer_id)
    REFERENCES customers(customer_id)
);

CREATE TABLE order_items (
    order_item_id INT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT,
    FOREIGN KEY(order_id)
    REFERENCES orders(order_id),
    FOREIGN KEY(product_id)
    REFERENCES products(product_id)
);

CREATE TABLE payments (
    payment_id INT PRIMARY KEY,
    order_id INT,
    payment_method VARCHAR(30),
    payment_status VARCHAR(20),
    FOREIGN KEY(order_id)
    REFERENCES orders(order_id)
);

CREATE TABLE reviews (
    review_id INT PRIMARY KEY,
    product_id INT,
    rating INT,
    FOREIGN KEY(product_id)
    REFERENCES products(product_id)
);

INSERT INTO customers VALUES
(1,'Dhruv','Delhi'),
(2,'Rahul','Mumbai'),
(3,'Aman','Delhi'),
(4,'Priya','Jaipur'),
(5,'Neha','Lucknow'),
(6,'Karan','Mumbai'),
(7,'Riya','Delhi'),
(8,'Arjun','Pune');

INSERT INTO products VALUES
(101,'Laptop','Electronics',65000),
(102,'Phone','Electronics',30000),
(103,'Headphones','Accessories',2500),
(104,'Keyboard','Accessories',1800),
(105,'Mouse','Accessories',1200),
(106,'Chair','Furniture',7000),
(107,'Desk','Furniture',15000),
(108,'Monitor','Electronics',18000);

INSERT INTO orders VALUES
(1001,1,'2025-01-05','2025-01-08'),
(1002,2,'2025-01-10','2025-01-14'),
(1003,1,'2025-01-12','2025-01-13'),
(1004,4,'2025-01-15','2025-01-21'),
(1005,5,'2025-01-18','2025-01-19'),
(1006,6,'2025-01-20','2025-01-26'),
(1007,2,'2025-01-22','2025-01-24');

INSERT INTO order_items VALUES
(1,1001,101,1),
(2,1001,103,2),
(3,1002,102,1),
(4,1003,104,1),
(5,1003,105,2),
(6,1004,108,1),
(7,1005,106,1),
(8,1006,107,1),
(9,1007,103,3),
(10,1007,105,2);

INSERT INTO payments VALUES
(1,1001,'UPI','Completed'),
(2,1002,'Card','Completed'),
(3,1003,'UPI','Completed'),
(4,1004,'COD','Pending'),
(5,1005,'Card','Completed'),
(6,1007,'Net Banking','Completed');

INSERT INTO reviews VALUES
(1,101,5),
(2,102,4),
(3,103,5),
(4,103,4),
(5,104,3),
(6,108,5),
(7,107,4);

show tables;

-- ==================================================
-- EASY QUESTION(1-20)
-- ==================================================

-- Show the customer names along with their order IDs.
SELECT customer_name , order_id FROM customers 
INNER JOIN orders
ON customers.customer_id = orders.customer_id;


-- List all products that have never been ordered.
SELECT p.product_id , p.product_name 
FROM products AS p
LEFT JOIN order_items AS oi
ON p.product_id = oi.product_id
WHERE oi.order_id IS NULL;

-- Find all orders that do not have a payment record.
SELECT o.order_id , o.customer_id 
FROM orders AS o 
LEFT JOIN payments AS p
ON o.order_id = p.order_id 
WHERE p.payment_id IS NULL ;


-- Show the payment method for every order.
SELECT o.order_id , p.payment_method 
FROM orders AS o
LEFT JOIN payments AS p 
ON o.order_id = p.order_id ;

-- Show all customers who have never placed an order.
SELECT c.customer_id , c.customer_name 
FROM customers AS c 
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id 
WHERE o.order_id IS NULL ; 

-- Show every order along with the customer name and city.
SELECT o.order_id , c.customer_name , c.city 
FROM orders AS o 
LEFT JOIN customers AS c
ON o.customer_id = c.customer_id ;

-- Display every ordered product along with:
-- Order ID
-- Product Name
-- Quantity Ordered
SELECT oi.order_id , p.product_name , oi.quantity
FROM order_items AS oi 
LEFT JOIN products AS p 
ON oi.product_id = p.product_id ;

-- Show each order with:
-- Order ID
-- Customer Name
-- Product Name
-- Quantity
SELECT o.order_id , c.customer_name , p.product_name , oi.quantity
FROM orders AS o
INNER JOIN customers AS c
ON c.customer_id = o.customer_id 

INNER JOIN  order_items AS oi
ON oi.order_id = o.order_id 

INNER JOIN products AS p
ON p.product_id = oi.product_id;

-- Show every customer along with the total number of orders they have placed.
SELECT c.customer_name , COUNT(o.order_id) AS Total_number_of_orders 
FROM customers AS c 
LEFT JOIN orders AS o 
ON c.customer_id = o.customer_id 
GROUP BY c.customer_id ;

-- Show each customer along with the total quantity of products they have purchased.
SELECT c.customer_name , SUM(oi.quantity) AS Total_quantity 
FROM customers AS c
LEFT JOIN orders AS o
ON o.customer_id = c.customer_id 

LEFT JOIN order_items AS oi
ON oi.order_id = o.order_id 

GROUP BY c.customer_id;

-- Show every product along with the total quantity sold.
SELECT p.product_name , COALESCE(SUM(oi.quantity),0) AS Total_quantity
FROM products AS p
LEFT JOIN order_items AS oi
ON oi.product_id = p.product_id 
GROUP BY p.product_id 

-- Show each order along with the total number of different products in that order.
SELECT oi.order_id , COUNT(oi.product_id) AS Total_products
FROM order_items AS oi
GROUP BY oi.order_id;

-- Show every customer along with the total amount they have spent.
SELECT c.customer_name , COALESCE(SUM(p.price * oi.quantity ) , 0 ) AS Total_amount 
FROM customers AS c
LEFT JOIN orders AS o
ON o.customer_id = c.customer_id
LEFT JOIN order_items AS oi
ON o.order_id = oi.order_id
LEFT JOIN products AS p
ON oi.product_id = p.product_id 
GROUP BY c.customer_id ;

-- Show every category along with the total number of products in that category.
SELECT p.category , COUNT(p.product_id)
FROM products AS p 
GROUP BY p.category 

-- Show each payment method along with the total number of orders paid using that method.
SELECT pm.payment_method , COUNT(pm.order_id) AS Total_orders
FROM payments AS pm
GROUP BY pm.payment_method;

-- Show each customer along with the number of different products they have purchased.
SELECT c.customer_name , COUNT(DISTINCT p.product_id) AS Total_products 
FROM customers AS c
LEFT JOIN orders AS o
ON  o.customer_id = c.customer_id 
LEFT JOIN order_items AS oi 
ON oi.order_id = o.order_id 
LEFT JOIN products AS p
ON p.product_id = oi.product_id 
GROUP BY c.customer_name ; 

-- Show every order along with its total order amount.
SELECT o.order_id , COALESCE(SUM(oi.quantity * p.price ) , 0 ) AS Total_amount
FROM orders AS o
LEFT JOIN order_items AS oi
ON o.order_id = oi.order_id
LEFT JOIN products AS p
ON p.product_id = oi.product_id 
GROUP BY o.order_id ;

-- Show each customer along with the date of their latest order.
SELECT c.customer_name , COALESCE(MAX(o.order_date), "No orders") AS Latest_order_date
FROM customers AS c
LEFT JOIN orders AS o
ON o.customer_id = c.customer_id 
GROUP BY c.customer_id ;

-- Show every customer along with the total number of payments they have made.
SELECT c.customer_name , COUNT(p.payment_id) AS Total_payments 
FROM customers AS c
LEFT JOIN orders AS o
ON o.customer_id = c.customer_id 
LEFT JOIN payments AS p
ON p.order_id = o.order_id
GROUP BY c.customer_id ;

-- Show every category along with the total revenue generated from that category.
SELECT p.category , COALESCE(SUM(p.price * oi.quantity), 0) AS Total_revenue 
FROM products AS p
LEFT JOIN order_items AS oi
ON oi.product_id = p.product_id 
GROUP BY category ; 

-- ==================================================
-- MEDIUM (1-14)
-- ==================================================

-- Find the top 3 categories by total revenue.
SELECT p.category , COALESCE(SUM(p.price * oi.quantity), 0 ) AS Total_revenue 
FROM products AS p
LEFT JOIN order_items AS oi
ON oi.product_id = p.product_id 
GROUP BY p.category 
ORDER BY Total_revenue DESC
LIMIT 3;

-- Find customers whose total spending is greater than ₹20,000.
SELECT c.customer_name , COALESCE(SUM(p.price * oi.quantity ) , 0 ) AS Total_spending
FROM customers AS c
LEFT JOIN orders AS o
ON o.customer_id = c.customer_id 
LEFT JOIN order_items AS oi
ON oi.order_id = o.order_id 
LEFT JOIN products AS p
ON p.product_id = oi.product_id 
GROUP BY c.customer_id 
HAVING Total_spending > 20000;

-- Find the average order value (AOV).
SELECT AVG(order_value) AS Avg_order_value FROM 
(
SELECT oi.order_id , COALESCE(SUM(p.price * oi.quantity) , 0 ) AS order_value
FROM order_items AS oi
LEFT JOIN products AS p 
ON p.product_id = oi.product_id  
GROUP BY oi.order_id 
) AS order_value_table; 

-- Find the customer who has spent the most money.
SELECT c.customer_name , COALESCE(SUM(p.price * oi.quantity ),0) AS Total_spending
FROM customers AS c
LEFT JOIN orders AS o
ON o.customer_id = c.customer_id 
LEFT JOIN order_items AS oi 
ON oi.order_id = o.order_id 
LEFT JOIN products AS p
ON p.product_id = oi.product_id 
GROUP BY c.customer_id 
ORDER BY Total_spending DESC 
LIMIT 1; 

-- Find the most expensive product that has actually been ordered.
SELECT p.product_name AS Product_Name , p.price AS Price 
FROM order_items AS oi
INNER JOIN products AS p  
ON p.product_id = oi.product_id 
GROUP BY oi.product_id 
ORDER BY p.price DESC 
LIMIT 1;

-- Find the total revenue generated by each payment method.
SELECT pm.payment_method , COALESCE(SUM(p.price * oi.quantity),0) AS Total_revenue 
FROM payments AS pm 
LEFT JOIN order_items AS oi
ON oi.order_id = pm.order_id
LEFT JOIN products AS p
ON p.product_id = oi.product_id
GROUP BY pm.payment_method ; 

-- Find the number of orders placed in each city.
SELECT c.city , COUNT(o.order_id) AS Total_orders 
FROM customers AS c
LEFT JOIN orders AS o
ON o.customer_id = c.customer_id 
GROUP BY c.city ;

-- Find the top 5 customers based on the total quantity of products purchased
SELECT c.customer_name AS Name , COALESCE(SUM(oi.quantity) , 0 ) AS Total_quantity
FROM customers AS c
LEFT JOIN orders AS o
ON o.customer_id = c.customer_id 
LEFT JOIN order_items AS oi
ON oi.order_id = o.order_id 
GROUP BY c.customer_id
ORDER BY Total_quantity DESC  
LIMIT 5;

-- Find the number of orders placed in each city.
SELECT c.city AS City , COUNT(o.order_id) AS Total_orders 
FROM customers AS c
LEFT JOIN orders AS o
ON o.customer_id = c.customer_id 
GROUP BY c.city 
ORDER BY Total_orders DESC;

-- Find all customers who have purchased products from more than one category.
SELECT c.customer_name , COUNT(DISTINCT p.category ) AS categories_purchased
FROM customers AS c
LEFT JOIN  orders AS o
ON o.customer_id = c.customer_id 
LEFT JOIN order_items AS oi
ON oi.order_id = o.order_id 
LEFT JOIN products AS p
ON p.product_id = oi.product_id 
GROUP BY c.customer_id 
HAVING categories_purchased > 1;

-- Find the average number of products per order.
SELECT AVG(Total_products) AS Avg_products FROM (
SELECT order_id  , COUNT(product_id) AS Total_products
FROM order_items 
GROUP BY order_id ) AS Total_products_table;

-- Find the top 3 customers who have placed the highest number of orders.
SELECT c.customer_name , COUNT(o.order_id) AS Total_orders 
FROM customers AS c
LEFT JOIN orders AS o
ON c.customer_id = o.customer_id
GROUP BY c.customer_id  
ORDER BY Total_orders DESC
LIMIT 3;

-- Find products that have been ordered by at least 3 different customers.
SELECT p.product_name AS Product_Name , COUNT(DISTINCT c.customer_id) AS Customer_Count
FROM products AS p
LEFT JOIN order_items AS oi
ON oi.product_id = p.product_id 
LEFT JOIN orders AS o
ON o.order_id = oi.order_id 
LEFT JOIN customers AS c
ON c.customer_id = o.customer_id 
GROUP BY p.product_name
HAVING Customer_Count >= 3;

-- Find the customer(s) who have purchased the highest number of distinct products.
SELECT
    customer_name,
    product_count
FROM
(
    SELECT
        c.customer_name,
        COUNT(DISTINCT oi.product_id) AS product_count
    FROM customers AS c
    LEFT JOIN orders AS o
        ON c.customer_id = o.customer_id
    LEFT JOIN order_items AS oi
        ON o.order_id = oi.order_id
    GROUP BY
        c.customer_id,
        c.customer_name
) AS customer_products
WHERE product_count =
(
    SELECT MAX(product_count)
    FROM
    (
        SELECT
            COUNT(DISTINCT oi.product_id) AS product_count
        FROM customers AS c
        LEFT JOIN orders AS o
            ON c.customer_id = o.customer_id
        LEFT JOIN order_items AS oi
            ON o.order_id = oi.order_id
        GROUP BY c.customer_id
    ) AS max_products
);

-- Find the city that generated the highest total revenue.
SELECT 
	c.city ,
    COALESCE(SUM(p.price * oi.quantity ) , 0) AS Total_revenue 
FROM customers AS c
LEFT JOIN orders AS o
	ON o.customer_id = c.customer_id 
LEFT JOIN order_items AS oi
	ON oi.order_id = o.order_id 
LEFT JOIN products AS p
	ON p.product_id = oi.product_id 
GROUP BY c.city 
HAVING Total_revenue = ( 
						SELECT MAX(Total_revenue) 
                        FROM (
								SELECT 
									c.city ,
									COALESCE(SUM(p.price * oi.quantity ) , 0) AS Total_revenue 
								FROM customers AS c
								LEFT JOIN orders AS o
									ON o.customer_id = c.customer_id 
								LEFT JOIN order_items AS oi
									ON oi.order_id = o.order_id 
								LEFT JOIN products AS p
									ON p.product_id = oi.product_id 
								GROUP BY c.city 
								) AS MAX_Total_revenue
						) ; 
          
