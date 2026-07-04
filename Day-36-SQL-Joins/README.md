# Day 36 — SQL JOINS

## 📅 90 Days of Code Challenge

Today I learned one of the most important SQL concepts for Data Analytics: **SQL JOINs**.

Instead of memorizing syntax, I focused on understanding **how tables are connected**, **when to use each JOIN**, and **how to solve real business problems**.

---

## 📚 Topics Covered

* INNER JOIN
* LEFT JOIN
* RIGHT JOIN
* FULL JOIN (Concept)
* SQL JOIN Execution Flow
* Visual Understanding of JOINs
* Real-world Use Cases
* Finding unmatched records using `LEFT JOIN` + `IS NULL`

---

## 🧠 Key Concepts Learned

* How relational databases connect multiple tables.
* Why normalization requires JOINs.
* Choosing the correct JOIN based on business requirements.
* Identifying the common key between tables.
* Understanding that multiple-table JOINs are built **one JOIN at a time**, not all at once.

---

## ✅ Practice Completed

Solved the following JOIN problems:

1. Show customer names with their order IDs.
2. List products that have never been ordered.
3. Find orders without a payment record.
4. Show the payment method for every order.
5. Show customers who have never placed an order.
6. Show every order with customer name and city.
7. Display every ordered product with product name and quantity.

---

## 💡 Important Patterns Learned

### INNER JOIN

* Returns only matching records.
* Best when related data must exist in both tables.

### LEFT JOIN

* Returns all rows from the left table.
* Used to find missing or unmatched records.

### Finding Missing Records

```sql
LEFT JOIN ...
ON ...

WHERE right_table.primary_key IS NULL;
```

This pattern is useful for:

* Customers who never purchased
* Products never ordered
* Orders without payments
* Employees without departments

---

## 🚀 Biggest Learning

Today I realized that writing JOIN queries is not about memorizing syntax.

The real skill is:

1. Identify the required output columns.
2. Determine which tables contain those columns.
3. Understand how the tables are related.
4. Join one table at a time until all required information is available.


#90DaysOfCode #SQL #DataAnalytics #DataAnalyst #LearningInPublic #OpenToWork
