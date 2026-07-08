# Day 40 – SQL Window Functions (Part 1)

## 🚀 90 Days of Code Challenge

Today I started learning one of the most important SQL topics for **Data Analyst interviews**—**Window Functions for Time-Series Analysis**.

Instead of only solving questions, I focused on understanding the **logic**, **execution flow**, and **problem-solving approach** behind each query.

## 📚 Topics Covered

* ✅ `LAG()`
* ✅ `LEAD()`
* ✅ Running Total
* ✅ Cumulative Sum (Introduction)
* ✅ Window Functions with `PARTITION BY` and `ORDER BY`
* ✅ Using CTEs with Window Functions
* ✅ Understanding data granularity
* ✅ Aggregation before applying Window Functions

## ✅ Questions Solved

### Easy Questions

1. Display the previous order date for each customer using `LAG()`.
2. Display the next order date for each customer using `LEAD()`.
3. Calculate the running total revenue over time.
4. Calculate the running total revenue for each customer.

## 🧠 Key Concepts Learned

* Difference between `GROUP BY` and Window Functions.
* Why `LAG()` looks at the previous row and `LEAD()` looks at the next row.
* How `PARTITION BY` creates separate windows for calculations.
* Why `ORDER BY` is essential for Running Totals.
* Why data must first be aggregated at the correct level (for example, one row per order) before applying Window Functions.
* How to identify the correct granularity of a query before writing SQL.
* Why CTEs simplify complex analytical queries.

## 💡 Biggest Takeaway

Before writing any SQL query, always ask:

1. What should one row represent?
2. Which tables contain the required data?
3. Do I need aggregation first?
4. Should the calculation restart (`PARTITION BY`)?
5. In what sequence should it run (`ORDER BY`)?

This approach makes solving SQL interview questions much easier.

## 🎯 Progress

* ✅ Day 40 Completed (Part 1)
* ✅ 4 Easy SQL Window Function questions solved
* 🔜 Next: More `LAG()`, `LEAD()`, Moving Average, Cumulative Sum, and Interview-Level Practice

---

### Connect with Me

* **GitHub:** https://github.com/dhruvaggarwal96
* **LinkedIn:** https://www.linkedin.com/in/dhruv-aggarwal-164608268/
* **X (Twitter):** https://x.com/Dhruv_Agarwal11

#90DaysOfCode #SQL #WindowFunctions #LAG #LEAD #RunningTotal #CTE #DataAnalytics #DataScience #OpenToWork #LearningInPublic
