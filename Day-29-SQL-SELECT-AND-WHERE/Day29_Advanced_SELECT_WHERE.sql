USE mysqlpratice;
CREATE TABLE Customers ( 
	CustomerID INT PRIMARY KEY  , 
    Name VARCHAR(50) , 
    Age INT ,
    City VARCHAR(50) , 
    Salary INT , 
    RegistrationDate DATE , 
    PurchaseAmount INT
);
INSERT INTO Customers VALUES
(1,'Aman',25,'Delhi',50000,'2024-01-15',12000),
(2,'Rohan',35,'Mumbai',70000,'2023-12-20',8000),
(3,'Anjali',29,'Delhi',45000,'2024-02-10',15000),
(4,'Karan',42,'Pune',90000,'2022-09-18',5000),
(5,'Simran',31,'Jaipur',65000,'2024-03-05',18000),
(6,'Arjun',27,NULL,40000,'2023-07-25',3000),
(7,'Neha',38,'Delhi',85000,'2024-04-11',22000),
(8,'Rahul',24,'Mumbai',38000,'2024-05-20',6000),
(9,'Ayaan',33,'Lucknow',75000,'2023-01-14',14000),
(10,'Kiran',30,'Delhi',50000,'2024-06-01',9500),
(11,'Mohan',36,'Pune',70000,'2024-02-18',11000),
(12,'Rohan',28,'Mumbai',55000,'2023-08-30',7000);

Show databases;

-- 1. Show all customers. --
SELECT * FROM Customers;

-- 2. Show only customer names. --
SELECT NAME FROM Customers;

-- 3. Find customers from Delhi. -- 
SELECT * FROM Customers 
WHERE City = "Delhi";

-- 4. Find customers older than 30. --
SELECT * FROM Customers 
WHERE Age > 30;

-- 5. Find salary between ₹40,000 and ₹80,000. --
SELECT * FROM Customers 
WHERE Salary BETWEEN 40000 AND 80000;

-- 6. Find names starting with "A". -- 
SELECT * FROM Customers 
WHERE Name LIKE "A%"

-- 7. Find names ending with "n". --
SELECT * FROM Customers 
WHERE NAME LIKE "%n";

-- 8. Find names whose second letter is "a". --
SELECT * FROM Customers
WHERE Name LIKE "_a%";

-- 9. Find customers whose city is NULL. -- 
SELECT * FROM Customers 
WHERE City IS NULL;

-- 10. Find duplicate cities. -- 
SELECT CITY , COUNT(*) AS TOTAL FROM CUSTOMERS
GROUP BY City
HAVING COUNT(*) > 1;

-- 11. Find customers who purchased more than ₹10,000. -- 
SELECT * FROM Customers 
WHERE PurchaseAmount > 10000;

-- 12. Find the top 20 expensive customers (highest salary). -- 
SELECT * FROM Customers 
ORDER BY Salary DESC
LIMIT 20;

-- 13. Customers NOT from Delhi or Mumbai. -- 
SELECT * FROM Customers 
WHERE CITY NOT IN ("Delhi" , "Mumbai");

-- 14. Customers who registered after 2023. -- 
SELECT * FROM Customers 
WHERE  RegistrationDate >= '2023-01-01';

/* 15. Combine multiple WHERE conditions.

Find customers:

Age > 30
Salary > 60,000
City = Delhi */
SELECT * FROM Customers 
WHERE Age > 30 AND Salary > 60000 AND City = "Delhi";

-- Show unique cities. -- 
SELECT DISTINCT City FROM Customers ;

-- Alias --
SELECT NAME AS Customer_Name , 
Salary AS Monthly_Salary 
FROM Customers;

-- IN -- 
SELECT * FROM Customers 
WHERE City IN ("Delhi" , "Mumbai" , "Pune" ) ; 

-- IS NOT NULL -- 
SELECT * FROM Customers 
WHERE City IS NOT NULL;