CREATE DATABASE sql_day32;

USE sql_day32;

SHOW tables;

CREATE TABLE sales (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    city VARCHAR(50),
    product_name VARCHAR(50),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2),
    salesperson VARCHAR(50)
);

INSERT INTO sales
(order_id, customer_name, city, product_name, category, quantity, price, salesperson)
VALUES
(101,'Amit','Delhi','Laptop','Electronics',2,60000,'Rahul'),
(102,'Priya','Mumbai','Phone','Electronics',3,25000,'Neha'),
(103,'Rohan','Delhi','Chair','Furniture',5,3000,'Rahul'),
(104,'Sneha','Pune','Table','Furniture',2,7000,'Aman'),
(105,'Karan','Delhi','Laptop','Electronics',1,60000,'Neha'),
(106,'Anjali','Mumbai','Phone','Electronics',4,25000,'Rahul'),
(107,'Vikas','Jaipur','Printer','Electronics',3,12000,'Aman'),
(108,'Meera','Pune','Chair','Furniture',6,3000,'Neha'),
(109,'Arjun','Delhi','Monitor','Electronics',2,18000,'Rahul'),
(110,'Nisha','Mumbai','Table','Furniture',4,7000,'Aman'),
(111,'Raj','Delhi','Phone','Electronics',2,25000,'Rahul'),
(112,'Pooja','Jaipur','Laptop','Electronics',1,60000,'Neha'),
(113,'Deepak','Pune','Printer','Electronics',5,12000,'Rahul'),
(114,'Simran','Delhi','Chair','Furniture',8,3000,'Aman'),
(115,'Mohit','Mumbai','Monitor','Electronics',3,18000,'Neha'),
(116,'Aisha','Jaipur','Table','Furniture',2,7000,'Rahul'),
(117,'Ravi','Delhi','Laptop','Electronics',2,60000,'Aman'),
(118,'Komal','Pune','Phone','Electronics',1,25000,'Rahul'),
(119,'Sahil','Mumbai','Chair','Furniture',7,3000,'Neha'),
(120,'Neeraj','Delhi','Printer','Electronics',4,12000,'Rahul'),
(121,'Isha','Jaipur','Monitor','Electronics',2,18000,'Aman'),
(122,'Manish','Delhi','Table','Furniture',3,7000,'Neha'),
(123,'Ritika','Pune','Laptop','Electronics',1,60000,'Rahul'),
(124,'Harsh','Mumbai','Phone','Electronics',5,25000,'Aman'),
(125,'Kavya','Delhi','Chair','Furniture',4,3000,'Rahul');

SELECT * FROM sales;

SELECT city , COUNT(*) AS total_customers
FROM sales
GROUP BY city;

SELECT city , COUNT(*) AS total_customers
FROM sales 
GROUP BY city 
HAVING COUNT(*) > 50 ; 

-- Show cities having more than 5 orders.
SELECT city , COUNT(order_id) AS orders
FROM sales
GROUP BY city 
HAVING orders > 5;

-- Show customers who purchased more than 10 items
SELECT customer_name , SUM(quantity) AS items
FROM sales
GROUP BY customer_name
HAVING items > 10;

-- Show products whose total revenue exceeds ₹50,000.
SELECT product_name , SUM(price * quantity ) AS revenue
FROM sales
GROUP BY product_name
HAVING revenue > 50000;

-- Show categories having an average price greater than ₹500.
SELECT category , AVG(price) AS average_price 
FROM sales
GROUP BY category
HAVING AVG(price) > 500;

-- Show salespersons who handled more than 3 orders.
SELECT salesperson , COUNT(order_id) AS orders
FROM sales
GROUP BY salesperson 
HAVING COUNT(order_id) > 3;

-- Show cities whose total revenue is greater than ₹1,00,000.
SELECT city , SUM(price * quantity ) AS revenue
FROM sales
GROUP BY city
HAVING SUM(price * quantity) > 100000;

-- Show categories where the total quantity sold is more than 100.
SELECT category , SUM(quantity ) AS total_quantity
FROM sales
GROUP BY category 
HAVING SUM(quantity) > 100;

-- Show products whose average selling price exceeds ₹1,000.
SELECT product_name , AVG(price) AS average_selling_price
FROM sales
GROUP BY product_name
HAVING AVG(price) > 1000;

-- Show customers who spent more than ₹75,000.
SELECT customer_name , SUM(price * quantity) AS spent
FROM sales
GROUP BY customer_name 
HAVING SUM(price * quantity) > 75000;

-- Show salespersons whose generated revenue exceeds ₹2,00,000.
SELECT salesperson , SUM(price * quantity ) AS revenue 
FROM sales
GROUP BY salesperson 
HAVING SUM(price * quantity ) > 200000;

-- Show cities where both:

-- Total revenue > ₹1,00,000
-- Number of orders > 10
SELECT city , SUM(price * quantity ) AS revenue , COUNT(order_id) AS number_of_order 
FROM sales
GROUP BY city
HAVING SUM(price * quantity) > 100000 AND COUNT(order_id) > 10;

-- Show products sold in more than 3 different cities.
SELECT product_name , COUNT(DISTINCT city) AS cities
FROM sales
GROUP BY product_name 
HAVING COUNT(DISTINCT city) > 3;

-- Show categories having revenue between ₹50,000 and ₹2,00,000.
SELECT category , SUM(price * quantity ) AS revenue
FROM sales
GROUP BY category 
HAVING SUM(price * quantity ) BETWEEN 50000 AND 200000;

-- Show customers whose average order value exceeds ₹8,000. 
SELECT customer_name , AVG(price * quantity) AS average_order_value 
FROM sales 
GROUP BY customer_name 
HAVING AVG(price * quantity) > 8000;

-- Show salespersons who sold more than 5 unique products.
SELECT salesperson , COUNT(DISTINCT product_name) AS unique_product
FROM sales 
GROUP BY salesperson 
HAVING COUNT(DISTINCT product_name) > 5;

-- Find cities whose revenue is greater than the average revenue of all cities.
SELECT city , SUM(price * quantity ) AS revenue 
FROM sales 
GROUP BY city 
HAVING SUM(price * quantity) > (
								SELECT AVG(sum_revenue)
                                FROM (SELECT SUM(price * quantity) AS sum_revenue
									  FROM sales 
                                      GROUP BY city) AS sum_revenue_per_city);
                                      
-- Find products whose total quantity sold is greater than the average quantity sold across all products.
SELECT product_name , SUM(quantity ) AS total_quantity 
FROM sales
GROUP BY product_name 
HAVING SUM(quantity) > (SELECT AVG(sum_quantity)
						FROM (SELECT SUM(quantity) AS sum_quantity
							  FROM sales 
                              GROUP BY product_name) AS sum_quantity_per_product);
                              
-- Find customers whose spending is greater than the highest city revenue divided by 2.
SELECT customer_name  , SUM(price * quantity) AS spend
FROM sales 
GROUP BY customer_name 
HAVING SUM(price * quantity) > ( SELECT MAX(revenue)/2
								 FROM ( SELECT city ,SUM(price * quantity) AS revenue 
										FROM sales 
                                        GROUP BY city) AS revenue_per_city);
                                        
-- Find categories contributing more than 30% of total revenue. 
SELECT category , SUM(price * quantity ) AS revenue 
FROM sales 
GROUP BY category 
HAVING SUM(price * quantity) > (SELECT SUM(price * quantity) * 0.30 
								FROM sales );
                                
-- Find the city with the second-highest revenue. 
SELECT city , SUM(price * quantity ) as revenue 
FROM sales
GROUP BY city 
ORDER BY SUM(price * quantity) DESC
LIMIT 1 OFFSET 1;

