# Day 45 – Outlier Detection 📊

Today, I learned how to identify and handle outliers during the Data Cleaning phase of Exploratory Data Analysis (EDA).

## 📚 Topics Covered

- Understanding Outliers
- Detecting Outliers using Boxplots
- Understanding Quartiles (Q1, Q2/Median, Q3)
- Interquartile Range (IQR)
- Calculating Lower & Upper Bounds
- Identifying Outliers using the IQR Method
- Removing Outliers from a Dataset
- Introduction to the Z-score Method
- When to use IQR vs Z-score

## 🛠️ Practical Tasks Completed

- Loaded and explored an employee dataset
- Visualized the `Salary` column using a Boxplot
- Calculated:
  - Q1 (25th Percentile)
  - Q3 (75th Percentile)
  - IQR (Interquartile Range)
  - Lower Bound
  - Upper Bound
- Detected salary outliers using the IQR method
- Removed outliers using Pandas filtering

## 💻 Key Python Code

### Draw a Boxplot

```python
import seaborn as sns
import matplotlib.pyplot as plt

sns.boxplot(x=df["Salary"])
plt.show()
```

### Calculate IQR

```python
Q1 = df["Salary"].quantile(0.25)
Q3 = df["Salary"].quantile(0.75)

IQR = Q3 - Q1

lower = Q1 - (1.5 * IQR)
upper = Q3 + (1.5 * IQR)
```

### Detect Outliers

```python
outliers = df[
    (df["Salary"] < lower) |
    (df["Salary"] > upper)
]
```

### Remove Outliers

```python
df = df[
    (df["Salary"] >= lower) &
    (df["Salary"] <= upper)
]
```

## 🧠 Key Takeaways

- A Boxplot provides a quick visual way to detect potential outliers.
- The IQR represents the spread of the middle 50% of the data.
- Values below the Lower Bound or above the Upper Bound are considered outliers.
- The IQR method is best suited for skewed datasets such as salaries, income, and house prices.
- Z-score is generally preferred when the data follows a normal distribution.

## 🚀 Progress

**Day 45/90 Completed ✅**

Every step in data cleaning improves the quality of insights and machine learning models.
