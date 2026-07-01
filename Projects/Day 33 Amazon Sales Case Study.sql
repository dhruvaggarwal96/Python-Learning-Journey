CREATE DATABASE amazon_sales_db;

USE amazon_sales_db;

CREATE TABLE sales (
    order_id INT PRIMARY KEY,
    order_date DATE,
    customer_id INT,
    customer_name VARCHAR(100),
    city VARCHAR(50),
    product VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    price DECIMAL(10,2)
);

INSERT INTO sales VALUES
(1,'2025-01-05',101,'Rahul','Delhi','Laptop','Electronics',1,65000),
(2,'2025-01-06',102,'Priya','Mumbai','Mouse','Electronics',2,800),
(3,'2025-01-08',103,'Amit','Delhi','Keyboard','Electronics',1,1500),
(4,'2025-01-12',101,'Rahul','Delhi','Monitor','Electronics',1,12000),
(5,'2025-02-03',104,'Sneha','Pune','Laptop','Electronics',1,65000),
(6,'2025-02-05',102,'Priya','Mumbai','Headphones','Electronics',1,2500),
(7,'2025-02-10',105,'Rohan','Bangalore','Keyboard','Electronics',2,1500),
(8,'2025-02-15',106,'Neha','Delhi','Laptop','Electronics',1,65000),
(9,'2025-03-01',101,'Rahul','Delhi','Mouse','Electronics',3,800),
(10,'2025-03-05',107,'Anjali','Mumbai','Laptop','Electronics',1,65000),
(11,'2025-03-08',104,'Sneha','Pune','Monitor','Electronics',2,12000),
(12,'2025-03-12',108,'Karan','Jaipur','Keyboard','Electronics',1,1500),
(13,'2025-03-15',109,'Riya','Delhi','Mouse','Electronics',5,800),
(14,'2025-03-18',102,'Priya','Mumbai','Laptop','Electronics',1,65000),
(15,'2025-03-20',110,'Arjun','Lucknow','Headphones','Electronics',2,2500);

SELECT * FROM sales;


-- ===============================================
-- Best Selling Product
-- ===============================================

-- Business Insight: 
-- This query identifies the product with the highest quantity sold.
-- It helps the company understand which product customers purchase the most.

SELECT product , SUM(quantity) FROM sales
GROUP BY product 
ORDER BY SUM(quantity) DESC 
LIMIT 1 ;

-- Conclusion:
-- The top - Selling product should always be kept in stock.
-- It can also be promoted through advertisements and bundled with
-- lower-selling products to increase overall sales.

-- ===============================================
-- Worst Selling Product
-- ===============================================

-- Business Insight: 
-- This query identifies the product with the lowest quantity sold.
-- It helps the company understand which product have lowest customer demand.

SELECT product , SUM(quantity) as total_quantity FROM sales 
GROUP BY product 
ORDER BY SUM(quantity) ASC
LIMIT 1;

-- Conclusion: 
-- Consider Promoting this product through discounts or bundle offers with best-selling products.
-- Also analyze its pricing , quality , and customer demand before making inventory decisions  

-- ===============================================
-- Monthly Revenue
-- ===============================================

-- Business Insight: 
-- Monthly Revenue shows an upward trend over the three-month period. 
-- Revenue increased from Rs.80,100 in January to Rs.166,900 in March, 
-- Indicating stronger sales performance and growing customer spending.

SELECT MONTHNAME(order_date) AS Months , SUM(quantity * price ) AS Revenue 
FROM sales 
GROUP BY MONTHNAME(order_date);

-- Conclusion: 
-- Since revenue has increased consistently from January to March , 
-- the company should analyze the factors driving this growth , 
-- such as successful promotions , seasonal demand , or popular products.
-- These strategies can then be applied to future months to maintain or increase revenue 

-- ===============================================
-- Top Customer
-- ===============================================

-- Bussiness Insights : 
-- Sneha is the highest revenue-generating customer, contributing ₹89,000 in total purchases. 
-- This indicates that she is a high-value customer and plays an important role in the company's revenue.

SELECT customer_name , SUM(quantity * price ) AS revenue 
FROM sales 
GROUP BY customer_name 
ORDER BY revenue DESC 
LIMIT 1;

-- Conclusion : 
-- Since Sneha is the highest revenue-generating customer, 
-- the company should focus on retaining high-value customers through 
-- loyalty programs, personalized offers, and exclusive rewards. 
-- Keeping valuable customers engaged can increase repeat purchases and long-term revenue.

-- ===============================================
-- Customer Retention
-- ===============================================

-- Business Insight:
-- Out of all customers, 3 customers placed more than one order, indicating a base of repeat customers. 
-- Repeat customers are valuable because they contribute to consistent revenue 
-- and are generally less expensive to retain than acquiring new customers.

SELECT COUNT(*) AS retained_customers FROM 
(
SELECT customer_id  , COUNT(customer_id) FROM sales 
GROUP BY customer_id
HAVING COUNT(*) > 1) AS retained;

-- Conclusion:
-- The company should continue improving customer retention by 
-- introducing loyalty programs, personalized recommendations, and targeted offers for returning customers. 
-- Increasing the number of repeat customers can lead to higher long-term revenue and stronger customer relationships.


-- ===============================================
-- Average Basket Size
-- ===============================================

-- Business Insight:
-- Customers purchase an average of 1.67 items per order, 
-- indicating that most orders contain only one or two products. 
-- This suggests there is an opportunity to encourage customers to add more items to their carts.

SELECT AVG(total_items) AS avg_basket_size FROM
(SELECT order_id , SUM(quantity) AS total_items FROM sales 
GROUP BY order_id) AS basket ;

-- Conclusion:
-- The company should increase the average basket size by using 
-- cross-selling, product recommendations, bundle offers, or free shipping thresholds. 
-- Encouraging customers to purchase additional items can increase revenue without requiring more customers.

-- ===============================================
-- Revenue by City
-- ===============================================

-- Business Insight:
-- Delhi generated the highest revenue of ₹149,900,
--  making it the company's strongest-performing market in this dataset. 
-- This indicates high customer demand and strong sales performance in the city.

SELECT city , SUM(price * quantity) AS revenue 
FROM SALES 
GROUP BY city 
ORDER BY revenue DESC
LIMIT 1; 

-- Conclusion:
-- Since Delhi is the highest revenue-generating city, 
-- the company should prioritize inventory availability, strengthen delivery operations, 
-- and invest more in targeted marketing campaigns there. 
-- At the same time, the business should analyze why other cities generate less revenue 
-- and apply successful strategies from Delhi to improve sales in those markets.

-- ===============================================
-- Revenue by Weekday
-- ===============================================

-- Business Insight:
-- Revenue varies significantly across the week. 
-- Saturday generated the highest revenue (₹95,400), 
-- indicating stronger customer purchasing activity during weekends. 
-- In contrast, Thursday recorded the lowest revenue (₹5,000),
-- suggesting lower customer engagement on that day.

SELECT DAYNAME(order_date) AS Weekday , SUM(price * quantity ) AS sales 
FROM sales 
GROUP BY DAYNAME(order_date) ;

-- Conclusion:
-- Since Saturday generates the highest revenue, 
-- the company should ensure sufficient inventory, staffing, and promotional campaigns before 
-- weekends to maximize sales. 
-- For Thursday, the business should investigate the cause of low revenue and consider offering discounts or 
-- targeted promotions to improve customer activity on slower days.