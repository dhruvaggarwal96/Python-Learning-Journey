# Day 46 — Feature Understanding (Hotel Booking Dataset)

## 📌 What I Learned

Today I started working with the **Hotel Booking Demand** dataset and focused on understanding the features before performing any exploratory data analysis.

### Topics Covered

* Loaded and inspected the dataset using Pandas.
* Explored dataset dimensions, columns, and datatypes.
* Identified numerical and categorical features using `select_dtypes()`.
* Counted numerical and categorical columns dynamically.
* Learned the difference between a column's **storage datatype** and its **business meaning** (e.g., `is_canceled` is stored as `int64` but represents a binary categorical feature).
* Practiced writing clean, dynamic Pandas code without hardcoding column names.

### Pandas Functions Practiced

* `pd.read_csv()`
* `head()`
* `tail()`
* `shape`
* `columns`
* `info()`
* `select_dtypes()`
* `len()`

### Key Takeaways

* Always understand the business meaning of each feature before analysis.
* `select_dtypes()` is an efficient way to classify features.
* Numeric datatypes do not always represent continuous numerical variables; some are binary categorical features.
* Feature understanding is the foundation for effective EDA, feature engineering, and machine learning.

### Next Step

Continue exploring the dataset by identifying missing values, analyzing feature quality, detecting high- and low-cardinality columns, and preparing features for data preprocessing.
