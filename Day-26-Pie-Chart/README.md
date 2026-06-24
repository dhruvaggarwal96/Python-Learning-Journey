# 🥧 Day 26 - Pie Charts | 90 Days of Code

Today I learned how to create **Pie Charts** using Matplotlib.

Pie charts are used to visualize **proportions** and **parts of a whole**.

---

## 📚 Topics Covered

* What is a Pie Chart?
* Creating Pie Charts using `plt.pie()`
* Adding labels
* Displaying percentages with `autopct`
* Analyzing proportions
* Comparing category contributions
* Combining smaller categories into `Others`

---

## 🛠️ Libraries Used

```python
import matplotlib.pyplot as plt
```

---

## 📝 Practice Exercises

### 1️⃣ Monthly Expenses

```python
labels = ["Food", "Rent", "Travel", "Shopping"]
expenses = [40, 30, 15, 15]
```

Questions:

* Which category dominates?
* Which category is the smallest?

---

### 2️⃣ Company Departments

```python
labels = ["HR", "IT", "Sales", "Finance"]
employees = [10, 35, 40, 15]
```

Questions:

* Which department has the most employees?
* Which department has the least employees?

---

### 3️⃣ Product Category Sales

```python
labels = ["Electronics", "Clothing", "Furniture", "Books"]
sales = [45, 25, 20, 10]
```

Questions:

* Which category dominates?
* Which category is the smallest?

---

## 🚀 Level Up Exercises

### Smartphone Brand Market Share

```python
brands = ["Apple", "Samsung", "Xiaomi", "OnePlus", "Others"]
share = [35, 30, 15, 10, 10]
```

Tasks:

* Calculate percentages manually
* Combine categories below 15% into `Others`

---

### E-commerce Sales Distribution

```python
categories = [
    "Electronics",
    "Clothing",
    "Furniture",
    "Beauty",
    "Books"
]

sales = [450000, 250000, 150000, 100000, 50000]
```

Tasks:

* Calculate percentages
* Find categories contributing more than 20%
* Find categories contributing less than 10%

---

## 🎯 Key Learnings

✅ Pie charts show proportions.

✅ Best used for 3–6 categories.

✅ Use percentages to improve readability.

✅ Group very small categories into `Others`.

❌ Avoid pie charts when there are too many categories.

---

## 💡 Data Analyst Tip

Always calculate percentages using:

```python
percentage = (value / total) * 100
```

Do not assume values are already percentages.

---

## 🔥 Day 26 Completed

Continuing my **90 Days of Code** journey towards becoming a Data Analyst 🚀
