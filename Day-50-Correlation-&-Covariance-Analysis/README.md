# Day 50 – Correlation & Covariance Analysis

## 📅 Overview

Today focused on understanding relationships between numerical features using **Correlation** and **Covariance**. I learned how to identify strongly related variables, detect redundant features, and interpret relationships from both statistical and business perspectives.

---

## 📚 Topics Covered

### Correlation

* Pearson Correlation
* Spearman Correlation
* Positive vs Negative Correlation
* Strong vs Weak Correlation
* Correlation Matrix
* Correlation Heatmaps

### Covariance

* Covariance Matrix
* Difference between Covariance and Correlation
* Interpreting feature relationships

### Pandas Functions

* `corr()`
* `cov()`
* `sort_values()`
* `abs()`
* `stack()`
* `where()`
* `np.triu()`

---

## 🛠️ Practical Tasks Completed

* Generated a correlation matrix for numerical features.
* Generated a covariance matrix.
* Created a professional correlation heatmap.
* Identified the strongest positive and negative correlations with `adr`.
* Ranked features based on correlation with `lead_time` and `total_of_special_requests`.
* Extracted highly correlated feature pairs using NumPy and Pandas.
* Identified features with weak relationships.
* Compared Pearson and Spearman correlations.
* Explored redundant features for feature selection.
* Ranked numerical features by their absolute correlation with `adr`.

---

## 💼 Business Insights

* Identified the numerical features most strongly associated with **Average Daily Rate (ADR)**.
* Found features with little or no relationship to ADR, indicating limited predictive value.
* Detected highly correlated feature pairs that may introduce multicollinearity.
* Learned how correlation analysis supports feature selection before machine learning.
* Understood how business insights can be extracted from statistical relationships.

---


## 🎯 Key Learnings

* Correlation measures the **strength and direction** of relationships between variables.
* Covariance indicates whether variables move together but is not standardized.
* Pearson correlation is best for linear relationships, while Spearman is useful for monotonic relationships and is more robust to outliers.
* Correlation heatmaps provide a quick overview of feature relationships.
* Highly correlated features should be reviewed before building machine learning models to reduce multicollinearity.

