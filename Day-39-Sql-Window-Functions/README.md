# Day 39 — SQL Window Functions (Ranking Functions)

## 🚀 90 Days of Code Challenge

Today, I learned one of the most important SQL topics for Data Analyst and Data Scientist interviews—**Window Functions (Ranking Functions)**.

Unlike `GROUP BY`, window functions perform calculations across a set of rows **without collapsing the result**, making them extremely useful for analytical queries and business reporting.

---

## 📚 Topics Covered

* ✅ `OVER()`
* ✅ `PARTITION BY`
* ✅ `ORDER BY` (inside `OVER()`)
* ✅ `ROW_NUMBER()`
* ✅ `RANK()`
* ✅ `DENSE_RANK()`
* ✅ Using Window Functions with CTEs
* ✅ Top-N per Group Pattern
* ✅ Highest-Paid Employee per Department
* ✅ SQL Execution Order for Window Functions

---

## 🧠 Key Concepts Learned

### OVER()

Defines the window over which a window function performs its calculation.

### PARTITION BY

Divides rows into independent groups while keeping all rows in the output.

### ORDER BY

Determines the order in which the window function processes rows.

### ROW_NUMBER()

Assigns a unique sequential number to every row, even when values are tied.

### RANK()

Assigns the same rank to tied values and skips the next rank(s).

### DENSE_RANK()

Assigns the same rank to tied values but does **not** skip subsequent ranks.

---

## 📊 ROW_NUMBER() vs RANK() vs DENSE_RANK()

| Function     | Duplicate Values | Skips Rank | Best Use Case                       |
| ------------ | ---------------- | ---------- | ----------------------------------- |
| ROW_NUMBER() | ❌ No             | ❌ No       | Latest records, removing duplicates |
| RANK()       | ✅ Yes            | ✅ Yes      | Competition rankings                |
| DENSE_RANK() | ✅ Yes            | ❌ No       | Top-N reports and leaderboards      |

---

## 💻 SQL Problems Solved

* Assigned unique row numbers based on salary.
* Generated row numbers within each department.
* Ranked employees by salary using `RANK()`.
* Ranked employees using `DENSE_RANK()`.
* Found the highest-paid employee in each department using `ROW_NUMBER()` and a CTE.
* Retrieved the Top 2 highest-paid employees from each department.
* Answered multiple interview-style ranking scenarios involving tied salaries.
* Practiced the differences between `ROW_NUMBER()`, `RANK()`, and `DENSE_RANK()`.

---


## 🎯 Skills Improved

* SQL Window Functions
* Analytical Query Writing
* Ranking and Leaderboard Queries
* Common Interview Patterns
* CTE + Window Function Workflow
* Problem Solving with SQL

---

## 🛠️ Technologies

* SQL
* MySQL
* Window Functions
* Common Table Expressions (CTEs)

---

## 🔗 Connect With Me

* **GitHub:** https://github.com/dhruvaggarwal96
* **LinkedIn:** https://www.linkedin.com/in/dhruvaggarwal/
* **X (Twitter):** https://x.com/Dhruv_Aggar

---

### ⭐ Day 39 Complete!

Another step forward in my **90 Days of Code** journey. Today strengthened my understanding of SQL analytical functions that are frequently asked in interviews at companies like Amazon, Walmart, Flipkart, and Swiggy. Looking forward to learning **LAG()**, **LEAD()**, and more advanced window functions next.
