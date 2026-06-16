# 📅 Day 18 - Missing Values in Pandas

Today I learned how to handle missing values in datasets using Pandas.

## 📚 Topics Covered

- Detect missing values
- Count missing values
- Remove missing values
- Fill missing values
- Replace missing values using mean

---

## 🛠️ Concepts Learned

### Check Missing Values

```python
df.isnull()

df.isnull().sum()
```

### Remove Missing Values

```python
df.dropna()
```

### Fill Missing Values

```python
df.fillna(0)
```

### Mean Replacement

```python
df["Age"] = df["Age"].fillna(df["Age"].mean())
```

---

## 💻 Practice Dataset

```python
import pandas as pd
import numpy as np

data = {
    "Name": ["A", "B", "C"],
    "Age": [20, np.nan, 22],
    "Salary": [50000, 60000, np.nan]
}

df = pd.DataFrame(data)

print(df)
```

### Output

| Name | Age | Salary |
|------|-----|--------|
| A | 20 | 50000 |
| B | NaN | 60000 |
| C | 22 | NaN |

---

## 🏋️ Practice Questions

1. Count missing values in each column.
2. Find the total number of missing values.
3. Display rows containing missing values.
4. Remove all rows with missing values.
5. Replace all missing values with 0.
6. Fill missing Age values with the average age.
7. Fill missing Salary values with the average salary.
8. Verify that no missing values remain.
9. Create your own dataset and practice all operations.

---

## 🎯 Mini Challenge

Create this DataFrame:

| Name | Age | Salary |
|------|-----|--------|
| Dhruv | 21 | 50000 |
| Aman | NaN | 60000 |
| Riya | 23 | NaN |
| Neha | NaN | 70000 |

Tasks:

- Count missing values
- Fill Age with mean
- Fill Salary with mean
- Verify no missing values remain

---

## 🎤 Interview Question

### What is the difference between `dropna()` and `fillna()`?

- `dropna()` removes rows or columns containing missing values.
- `fillna()` replaces missing values with a specified value such as 0, mean, median, or mode.

---

## 🚀 Day 18 Completed

Today I learned how to clean datasets by handling missing values, which is one of the most important steps in Data Analysis.

#100DaysOfDataAnalytics
