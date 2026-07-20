# Day 52 – Skewness & Kurtosis

## 📌 Overview

Today I learned how to analyze the shape of data distributions using **Skewness** and **Kurtosis**. I practiced identifying right-skewed, left-skewed, and near-normal features, interpreted distributions using visualizations, and learned when feature transformations are useful for machine learning.

---

## 📚 Topics Covered

### Statistics

* Normal Distribution
* Skewness
* Kurtosis
* Right-Skewed Distribution
* Left-Skewed Distribution
* Near-Normal Distribution
* Mean vs Median Relationship
* Outlier Interpretation
* Feature Transformation (`np.log1p()`)

### Data Visualization

* Histogram
* KDE Plot
* Box Plot
* Distribution Interpretation

### Pandas Practice

* Calculate skewness of numerical features
* Calculate kurtosis of numerical features
* Identify right-skewed columns
* Identify left-skewed columns
* Identify near-normal columns
* Find the most right-skewed feature
* Find the most left-skewed feature
* Find the top 5 right-skewed features
* Find the top 5 left-skewed features
* Find the feature closest to a normal distribution
* Count right-skewed, left-skewed, and near-normal features
* Filter features using Boolean indexing
* Sort features by skewness
* Identify suitable features for transformation

### Visualization Practice

* Histogram of `adr`
* KDE Plot of `adr`
* Box Plot of `lead_time`
* Distribution Analysis
* Outlier Detection

---

## 💻 Key Pandas Functions Used

```python
select_dtypes()
skew()
kurt()
sort_values()
idxmax()
idxmin()
abs()
head()
index
loc[]
len()
```

---

## 📊 Visualization Functions

```python
plt.hist()
sns.histplot()
sns.kdeplot()
sns.boxplot()
plt.figure()
plt.title()
plt.show()
```

---

## 🧠 Key Learnings

* Skewness measures the asymmetry of a distribution.
* Kurtosis measures the heaviness of distribution tails.
* Right-skewed distributions usually have **Mean > Median**.
* Left-skewed distributions usually have **Mean < Median**.
* Normal distributions have **Mean ≈ Median**.
* Outliers should be investigated before removing them.
* `np.log1p()` is commonly used to reduce high positive skewness.

---

## 📈 Business Insights

1. Several booking-related features are highly right-skewed, indicating that extreme values occur infrequently but can significantly influence analysis.
2. `adr` contains high-value bookings that create a long right tail, suggesting premium or seasonal bookings.
3. `lead_time` contains many outliers, indicating some customers book far in advance compared to the majority.
4. Features with near-normal distributions are generally easier to interpret and often require less preprocessing.
5. Applying transformations such as `np.log1p()` to highly skewed features can improve model performance and reduce the influence of extreme values.

---

## 🎯 Interview Concepts Practiced

* Distribution Analysis
* Statistical Interpretation
* Outlier Analysis
* Feature Engineering
* Data Visualization
* Pandas Data Analysis

---

## 🚀 Day 52 Summary

✅ Learned Normal Distribution, Skewness & Kurtosis
✅ Practiced 15 Pandas interview questions
✅ Solved 5 visualization and interpretation questions
✅ Identified skewed and near-normal features
✅ Interpreted histograms, KDE plots, and box plots
✅ Learned when and why to apply feature transformations

**Day 52 Complete ✔️**
