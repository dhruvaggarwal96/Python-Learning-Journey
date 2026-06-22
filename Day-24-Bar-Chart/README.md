# 📊 Day 24 - Bar Charts | 90 Days of Code

## 🎯 Objective

Learn how to create **Bar Charts** using Python and Matplotlib to compare values across different categories.

---

## 📚 What I Learned

* What a Bar Chart is
* How to create a bar chart using `plt.bar()`
* Adding titles and axis labels
* Comparing categorical data visually
* Analyzing highest and lowest values

---

## 🛠️ Topics Covered

* Importing Matplotlib
* Creating Bar Charts
* Adding Titles
* Adding X and Y Labels
* Data Visualization Basics

---

## 📝 Practice 1: Product Sales

### Dataset

```python
products = ["A", "B", "C", "D"]
sales = [500, 700, 300, 900]
```

### Code

```python
import matplotlib.pyplot as plt

products = ["A", "B", "C", "D"]
sales = [500, 700, 300, 900]

plt.bar(products, sales)

plt.title("Product Sales")
plt.xlabel("Products")
plt.ylabel("Sales")

plt.show()
```

### Analysis

✅ Best Performing Product: D (900)

❌ Worst Performing Product: C (300)

---

## 📝 Practice 2: Student Marks

```python
students = ["Rahul", "Aman", "Priya", "Riya"]
marks = [85, 92, 78, 88]

plt.bar(students, marks)

plt.title("Student Marks")
plt.xlabel("Students")
plt.ylabel("Marks")

plt.show()
```

### Analysis

🏆 Highest Marks: Aman (92)

📉 Lowest Marks: Priya (78)

---

## 📝 Practice 3: Department-wise Employees

```python
departments = ["HR", "IT", "Sales", "Finance"]
employees = [12, 35, 25, 18]

plt.bar(departments, employees)

plt.title("Department-wise Employees")
plt.xlabel("Departments")
plt.ylabel("Employees")

plt.show()
```

### Analysis

👥 Most Employees: IT (35)

👥 Fewest Employees: HR (12)

---

## 🏋️ Additional Practice

### Monthly Expenses

```python
months = ["Jan", "Feb", "Mar", "Apr"]
expenses = [10000, 12000, 9000, 15000]
```

### Website Visitors

```python
days = ["Mon", "Tue", "Wed", "Thu", "Fri"]
visitors = [120, 150, 180, 140, 200]
```

### Mobile Brands Sold

```python
brands = ["Samsung", "Apple", "OnePlus", "Xiaomi"]
sold = [40, 25, 18, 32]
```

---

## 💡 Key Takeaway

Bar charts are useful for comparing values across categories and quickly identifying the highest and lowest performers.

#90DaysOfCode #Python #Matplotlib #DataVisualization #DataScience
