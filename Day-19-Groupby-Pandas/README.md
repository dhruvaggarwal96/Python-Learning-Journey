# 📅 Day 19 — GroupBy in Pandas

## 📚 Study Notes

Today, I learned how to use `groupby()` in Pandas to analyze and summarize data.

### Topics Covered

* `groupby()`
* `sum()`
* `mean()`
* `size()`
* `sort_values()`
* Grouping by multiple columns
* `agg()` for multiple aggregations

---

## 💻 Coding Practice

### Total Sales by Product Category

```python
df.groupby("Product_Category")["Sales_Amount"].sum()
```

### Average Sales by Product Category

```python
df.groupby("Product_Category")["Sales_Amount"].mean()
```

### Orders by Region

```python
df.groupby("Region").size()
```

### Total Quantity Sold by Region

```python
df.groupby("Region")["Quantity_Sold"].sum()
```

### Total Sales by Sales Channel

```python
df.groupby("Sales_Channel")["Sales_Amount"].sum()
```

### Group By Multiple Columns

```python
df.groupby(["Region", "Sales_Channel"])["Sales_Amount"].sum()
```

### Multiple Aggregations

```python
df.groupby("Product_Category")["Sales_Amount"].agg(
    ["sum", "mean", "max", "min", "count"]
)
```

---

## 🚀 Key Takeaway

`groupby()` follows three steps:

* Split → Divide data into groups
* Apply → Perform calculations
* Combine → Return summarized results

---

## 🎯 Interview Questions

### What is `groupby()` in Pandas?

`groupby()` is used to split data into groups and perform aggregate operations like sum, average, count, minimum, and maximum.

### Difference between `count()` and `size()`?

* `count()` counts non-null values.
* `size()` counts all rows, including null values.

### What does `agg()` do?

`agg()` allows multiple aggregate functions to be applied at once.

---

## 🔥 Day 19 Completed

✅ Learned GroupBy

✅ Performed aggregation operations

✅ Analyzed sales data

✅ Practiced multiple grouping techniques

#90DaysOfDataScience
