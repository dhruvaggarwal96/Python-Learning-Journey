-- ============================================
-- Create Database
-- ============================================
CREATE DATABASE window_functions_db;

-- ============================================
-- Use Database
-- ============================================
USE window_functions_db;

-- ============================================
-- Create Employees Table
-- ============================================
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(100),
    department VARCHAR(50),
    salary DECIMAL(10,2)
);

-- ============================================
-- Insert Sample Data
-- ============================================
INSERT INTO employees (employee_id, employee_name, department, salary)
VALUES
(1, 'Alice',   'HR',    50000),
(2, 'Bob',     'HR',    60000),
(3, 'Charlie', 'IT',    70000),
(4, 'David',   'IT',    65000),
(5, 'Emma',    'Sales', 55000);


SELECT * FROM employees;

-- =============================================
-- EASY 
-- =============================================

-- Assign a unique row number to every employee based on salary in descending order.
SELECT *  , 
ROW_NUMBER() OVER(
    ORDER BY salary DESC) AS row_num
FROM employees ; 

-- Assign a row number within each department based on salary DESC.
SELECT * , 
ROW_NUMBER() OVER( 
	PARTITION BY department 
    ORDER BY salary DESC 
    ) AS Row_num
FROM employees;

INSERT INTO employees
VALUES (6, 'John', 'IT', 70000);

-- Write a query to rank employees by salary in descending order using DENSE_RANK().
SELECT * , 
DENSE_RANK() OVER( 
	ORDER BY salary DESC 
    ) AS Salary_order 
FROM employees;

-- Find the highest-paid employee from each department.
SELECT employee_name , department , salary , 
ROW_NUMBER() OVER(
	PARTITION BY department 
    ORDER BY salary DESC 
    ) AS salary_rank 
FROM employees ; 

-- OR 

WITH high_paid_em_per_dep AS 
( SELECT employee_name , department , salary ,
ROW_NUMBER() OVER(
PARTITION BY department 
ORDER BY salary DESC 
) AS salary_rank 
FROM employees
)
SELECT * FROM high_paid_em_per_dep
WHERE salary_rank = 1;


-- Find the top 2 highest-paid employees in each department.
WITH Top_2_high_paid_emp AS 
( 	
	SELECT employee_name , department , salary , 
	ROW_NUMBER() OVER(
				PARTITION BY department
				ORDER BY salary DESC
				 ) AS row_num
    FROM employees
) 
SELECT * FROM Top_2_high_paid_emp
WHERE row_num <= 2;

