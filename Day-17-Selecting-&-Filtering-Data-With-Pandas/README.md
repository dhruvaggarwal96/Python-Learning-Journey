# Day 17 – Selecting & Filtering Data with Pandas

## Overview

Today I learned how to select specific columns and filter data in Pandas DataFrames. I practiced these concepts using real-world datasets.

## Concepts Learned

### Selecting Columns

```python
df["column_name"]
df[["column1", "column2"]]
```

### Filtering Rows

```python
df[df["Sales"] > 500]
```

### Multiple Conditions

```python
df[(df["Sales"] > 500) & (df["Profit"] > 100)]
```

### Sorting Data

```python
df.sort_values(by="column_name", ascending=False)
```

## Datasets Practiced

### 1. Customer Dataset

Tasks Completed:

- Display specific columns
- Filter customers by age
- Filter customers by city
- Filter customers by purchase amount
- Find customers with missing values
- Find top customers by purchase amount

### 2. Sales Dataset

Tasks Completed:

- Filter sales by region
- Filter sales by sales amount
- Find online sales
- Find B2B customers
- Find products with high unit prices
- Find top sales records

### 3. Amazon Dataset

Status: In Progress

Tasks Completed:

- Explored dataset structure
- Learned about object and float data types
- Started working with rating column

Pending Tasks:

- Convert rating column to numeric format
- Filter products with rating > 4
- Filter products with high discounts
- Find top-rated products
- Find most expensive products

## Key Learnings

- Difference between selecting and filtering data
- Using conditional statements in Pandas
- Working with multiple filter conditions
- Sorting data using sort_values()
- Understanding data types (object, int, float)
- Converting columns to numeric data types

## Technologies Used

- Python
- Pandas
- Jupyter Notebook / VS Code

## Next Steps

- Complete Amazon dataset exercises
- Practice more filtering scenarios
- Learn Sorting, Indexing, and Slicing in Pandas

## Day 17 Status

✅ Customer Dataset Completed

✅ Sales Dataset Completed
