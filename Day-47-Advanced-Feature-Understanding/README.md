# Day 47 – Advanced Feature Understanding with Pandas

## 📅 Date

**15 July 2026**

## 📖 Overview

Today, I continued my **90-Day Data Scientist + Internship Roadmap** by diving deeper into **Advanced Feature Understanding** using the Hotel Booking dataset.

The focus was on understanding dataset structure, identifying feature characteristics, analyzing missing values, measuring feature cardinality, and building professional feature summary tables using Pandas. I also learned how to apply vectorized conditional logic using **NumPy's `np.where()`** for feature engineering.

---

## 🚀 Topics Covered

### 🔹 Feature Understanding

* Identified numerical and categorical features
* Counted unique values for every feature
* Distinguished between high-cardinality and low-cardinality features
* Detected constant (single unique value) features
* Understood why high-cardinality features require different encoding strategies

### 🔹 Missing Value Analysis

* Calculated missing value counts
* Calculated missing value percentages
* Filtered columns containing missing values
* Sorted missing-value summaries in descending order
* Built reusable missing-value summary tables

### 🔹 Feature Summary Tables

Created professional summary tables containing:

* Feature Name
* Data Type
* Unique Values
* Missing Count
* Missing Percentage
* Cardinality (High / Low)

### 🔹 Pandas Skills Practiced

* `select_dtypes()`
* `nunique()`
* `dtypes`
* `isnull().sum()`
* Boolean Indexing
* `.index`
* `sort_values()`
* `head()`
* `DataFrame()` creation from Series
* Feature summary generation

### 🔹 NumPy

* Introduction to `np.where()`
* Creating conditional columns without loops
* Understanding vectorized operations

---

## 💡 Key Learnings

* Storage datatype and business meaning are different concepts.
* High-cardinality categorical features require careful encoding.
* Missing-value percentages provide better insights than raw counts.
* Boolean indexing is a powerful way to filter Pandas objects.
* `Series` and `DataFrame` operations differ in several important ways.
* `np.where()` works like Excel's **IF** statement and enables efficient feature engineering.

---

## 🛠️ Skills Improved

* Feature Understanding
* Data Quality Assessment
* Missing Value Analysis
* Feature Engineering Basics
* Pandas Data Manipulation
* Vectorized Conditional Logic
* Writing clean and reusable Pandas code

---

## 📌 Outcome

Today's session strengthened my understanding of how to inspect and evaluate dataset features before performing data cleaning, visualization, or machine learning. I also gained confidence in writing professional Pandas code for exploratory data analysis and feature engineering.

**Day 47 Complete ✅**
