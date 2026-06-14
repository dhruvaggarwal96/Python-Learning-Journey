# 🚀 Day 16 – Reading CSV Files with Pandas

## 📚 What I Learned

Today I learned how to load real-world datasets into Pandas using CSV files and perform basic data inspection.

### Topics Covered

* `pd.read_csv()`
* `head()`
* `tail()`
* `sample()`
* `shape`
* `info()`
* `dtypes`
* `isnull().sum()`

---

## 💻 Coding Practice

```python
import pandas as pd

df = pd.read_csv("sales.csv")

print("First 5 Rows:")
print(df.head())

print("\nLast 5 Rows:")
print(df.tail())

print("\nRandom 5 Rows:")
print(df.sample(5))
```

### Dataset Information

```python
print(df.shape)
print(df.dtypes)
df.info()
print(df.isnull().sum())
```

---

## 🎯 Key Learnings

### Read CSV File

```python
df = pd.read_csv("sales.csv")
```

### First 5 Rows

```python
df.head()
```

### Last 5 Rows

```python
df.tail()
```

### Random Rows

```python
df.sample(5)
```

### Number of Rows and Columns

```python
df.shape
```

### Data Types

```python
df.dtypes
```

### Detailed Information

```python
df.info()
```

### Missing Values

```python
df.isnull().sum()
```

---

## 🏋️ Practice Questions

1. Load a CSV file named `customers.csv`.
2. Display the first 10 rows.
3. Display the last 3 rows.
4. Print 5 random rows.
5. Find the total number of rows and columns.
6. Check data types of all columns.
7. Find missing values in each column.
8. Identify columns that contain missing values.
9. Find the column with the most missing values.
10. Explore a dataset from Kaggle and summarize it.

---

## 🚀 Mini Project

### Customer Dataset Analysis

```python
import pandas as pd

df = pd.read_csv("customer_dataset.csv")

print("Shape:", df.shape)

print("\nData Types:")
print(df.dtypes)

print("\nMissing Values:")
print(df.isnull().sum())

print("\nFirst 5 Rows:")
print(df.head())
```

---

## 🎤 Interview Questions

### What is a CSV file?

A CSV (Comma Separated Values) file stores tabular data in plain text format.

### What does `pd.read_csv()` do?

It reads a CSV file and converts it into a Pandas DataFrame.

### What is the difference between `head()` and `tail()`?

* `head()` shows the first rows.
* `tail()` shows the last rows.

### How do you find the shape of a dataset?

```python
df.shape
```

### How do you check data types?

```python
df.dtypes
```

### How do you find missing values?

```python
df.isnull().sum()
```

---

## 🔗 Connect With Me

GitHub: https://github.com/dhruvaggarwal96

X (Twitter): https://x.com/Dhruv_Agarwal11

#90DaysOfDataScience #Python #Pandas #DataScience #MachineLearning #LearningInPublic
