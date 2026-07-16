# Day 48 — Exploratory Data Analysis (EDA) with Hotel Booking Dataset

## 📌 Overview

Today, I continued my Exploratory Data Analysis (EDA) journey using the **Hotel Booking Demand** dataset. The focus was on understanding the dataset structure, identifying data quality issues, and practicing intermediate-level Pandas operations commonly used by Data Analysts and Data Scientists.

---

## 📚 Topics Covered

### 1. Dataset Overview
- Explored dataset dimensions using `shape`
- Displayed column names
- Examined data types
- Viewed the first and last few records
- Retrieved random samples
- Measured dataset memory usage

### 2. Missing Value Analysis
- Identified missing values in each column
- Calculated missing value percentages
- Filtered only columns containing missing values
- Sorted missing value percentages in descending order

### 3. Duplicate Data Analysis
- Counted duplicate records
- Displayed duplicate rows
- Removed duplicate records using `drop_duplicates()`

### 4. Feature Analysis
- Counted unique values for every feature
- Selected categorical features
- Selected numerical features
- Generated descriptive statistics for numerical columns

### 5. Frequency Analysis
- Counted hotel types using `value_counts()`
- Identified the top countries by number of bookings

### 6. GroupBy Analysis
Performed several business-oriented aggregations:
- Average ADR by hotel type
- Average lead time by hotel type
- Average ADR by country

### 7. Advanced Pandas
Practiced:
- `groupby()`
- `mean()`
- `count()`
- `size()`
- `value_counts()`
- `sort_values()`
- `pivot_table()`
- `crosstab()`

Created summary tables such as:
- Hotel Type vs Meal Type
- Country-wise booking statistics
- Resort Hotel booking analysis

---

## 🛠️ Pandas Functions Practiced

```python
shape
columns
dtypes
head()
tail()
sample()
memory_usage()
isnull()
sum()
mean()
duplicated()
drop_duplicates()
nunique()
describe()
select_dtypes()
value_counts()
groupby()
count()
size()
sort_values()
pivot_table()
crosstab()
```

---

## 🎯 Key Learnings

- Learned the professional workflow for starting an EDA project.
- Improved data cleaning skills by handling missing values and duplicates.
- Practiced business-oriented data aggregation using `groupby()`.
- Understood when to use `value_counts()`, `groupby()`, `pivot_table()`, and `crosstab()`.
- Improved confidence in writing clean and readable Pandas code.

---

## 🚀 Skills Improved

- Data Cleaning
- Exploratory Data Analysis (EDA)
- Intermediate Pandas
- Business Data Analysis
- Data Aggregation
- Data Profiling
- Feature Understanding

---

## 📈 Next Steps

In the next session, I will continue with:

- Univariate Analysis
- Distribution Analysis
- Outlier Detection
- Data Visualization using Matplotlib & Seaborn
- Business Insights
- Feature Relationships
- Correlation Analysis
