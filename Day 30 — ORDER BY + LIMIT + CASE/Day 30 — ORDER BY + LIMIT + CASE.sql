use employee;

show tables;
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    age INT,
    gender VARCHAR(10),
    city VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employee (emp_id, name, age, gender, city, department, salary)
VALUES
(101, 'Amit', 25, 'Male', 'Delhi', 'IT', 45000),
(102, 'Sneha', 30, 'Female', 'Mumbai', 'HR', 52000),
(103, 'Rahul', 28, 'Male', 'Bangalore', 'IT', 68000),
(104, 'Priya', 35, 'Female', 'Pune', 'Finance', 75000),
(105, 'Karan', 40, 'Male', 'Delhi', 'Sales', 39000),
(106, 'Neha', 27, 'Female', 'Chennai', 'Marketing', 48000),
(107, 'Arjun', 32, 'Male', 'Hyderabad', 'IT', 82000),
(108, 'Pooja', 29, 'Female', 'Kolkata', 'HR', 41000),
(109, 'Vikas', 45, 'Male', 'Jaipur', 'Finance', 91000),
(110, 'Riya', 24, 'Female', 'Delhi', 'Marketing', 36000),
(111, 'Sahil', 31, 'Male', 'Mumbai', 'Sales', 58000),
(112, 'Anjali', 26, 'Female', 'Bangalore', 'IT', 62000),
(113, 'Deepak', 38, 'Male', 'Pune', 'Finance', 73000),
(114, 'Meera', 33, 'Female', 'Chennai', 'HR', 54000),
(115, 'Rohit', 29, 'Male', 'Hyderabad', 'Marketing', 47000),
(116, 'Kavita', 41, 'Female', 'Delhi', 'Sales', 85000),
(117, 'Manish', 36, 'Male', 'Jaipur', 'IT', 69000),
(118, 'Simran', 27, 'Female', 'Mumbai', 'Finance', 56000),
(119, 'Tarun', 34, 'Male', 'Kolkata', 'Sales', 61000),
(120, 'Nisha', 23, 'Female', 'Bangalore', 'HR', 35000);

-- ORDER BY (ASC BY DEFAULT) --
SELECT * FROM employee
ORDER BY salary;

-- ORDER BY (DESC) -- 
SELECT * FROM employee
ORDER BY salary DESC;

-- LIMIT -- 
SELECT * FROM employee
LIMIT 5;

-- OFFSET -- 
SELECT * FROM employee
LIMIT 5 OFFSET 5;

-- CASE -- 
SELECT name , salary , 
CASE 
	WHEN salary >= 70000 THEN "HIGH"
    WHEN salary >= 40000 THEN "MEDIUM"
    ELSE "LOW"
END AS Salary_Category
FROM employee;

-- Display all employees sorted by salary (Lowest to Highest). -- 
SELECT * FROM employee
ORDER BY salary;

-- Display employees sorted by salary (Highest to Lowest). --
SELECT * FROM employee
ORDER BY salary DESC;

-- Display employees sorted alphabetically. --
SELECT * FROM employee 
ORDER BY name;

-- Show the Top 5 highest-paid employees. -- 
SELECT * FROM employee
ORDER BY salary DESC
LIMIT 5;

-- Show the Bottom 5 salaries. -- 
SELECT * FROM employee
ORDER BY salary 
LIMIT 5;

-- Show employees ranked by age (Oldest first). -- 
SELECT * FROM employee
ORDER BY age DESC;

-- Display employees after skipping the first 5. -- 
SELECT * FROM employee
LIMIT 5 OFFSET 5;

-- Show the 3rd to 7th highest-paid employees. -- 
SELECT * FROM employee
ORDER BY salary DESC
LIMIT 5 OFFSET 2;

-- Sort by department first, then salary. -- 
SELECT * FROM employee
ORDER BY department , salary DESC ; 

-- Sort by city and then employee name. -- 
SELECT * FROM employee 
ORDER BY city , name ; 

/* Categorize salary.

High ≥ 70000
Medium ≥ 40000
Low < 40000 */

SELECT * name , salary , 
CASE 
	WHEN salary >= 70000 THEN "High"
    WHEN salary >= 40000 THEN "Medium"
    ELSE "Low"
END AS "Salary_Category"
FROM employee;

/*Categorize age.

Young < 30
Adult 30–45
Senior > 45 */

SELECT name , age , 
CASE 
	WHEN age < 30 THEN "Young"
    WHEN age BETWEEN 30 AND 45 THEN "Adult"
    ELSE 'Senior'
END AS "Age_Category"
FROM employee;

-- Display employee name, salary, and salary category sorted by salary. --
SELECT name , salary , 
CASE 
	WHEN salary >= 70000 THEN "High"
    WHEN salary >= 40000 THEN "Medium"
    ELSE "Low"
END AS "Salary_Category"
FROM employee
ORDER BY salary DESC; 


-- Display employee name, age, age category, and city. -- 
SELECT name , age , city , 
CASE 
	WHEN age < 30 THEN "Young"
    WHEN age BETWEEN 30 AND 45 THEN "Adult"
    ELSE 'Senior'
END AS "Age_Category"
FROM employee;

-- Display employee name, department, salary category, ordered by department and salary. --
SELECT name , department , 
CASE
	WHEN salary >= 70000 THEN "High"
    WHEN salary >= 40000 THEN "Medium"
    ELSE "Low"
END AS "Salary_Category"
FROM employee
ORDER BY department , salary ;