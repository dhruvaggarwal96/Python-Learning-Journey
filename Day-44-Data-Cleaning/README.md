# 🚀 Day 44/90 – Data Cleaning with Pandas

## 📅 Date

12 July 2026

## 📚 Topics Covered

* Understanding Data Cleaning
* Detecting Missing Values
* Calculating Missing Value Percentage
* Finding Duplicate Rows
* Removing Duplicate Rows
* Inspecting Dataset Information
* Viewing and Renaming Columns
* Converting Data Types
* Handling Invalid Date Formats
* Identifying Non-Numeric Values
* Filtering Data Using Boolean Conditions

## 💻 Concepts Practiced

### 🔹 Missing Values

* `df.isnull()`
* `df.isnull().sum()`
* `(df.isnull().sum() / len(df)) * 100`

### 🔹 Duplicate Rows

* `df.duplicated().sum()`
* `df.drop_duplicates(inplace=True)`

### 🔹 Dataset Inspection

* `df.info()`
* `df.shape`
* `df.columns`

### 🔹 Renaming Columns

* `df.rename(columns={...}, inplace=True)`

### 🔹 Data Type Conversion

* `pd.to_datetime()`
* `errors="coerce"`
* `pd.to_numeric()`

### 🔹 Data Filtering

* Missing values
* Non-missing values
* Multiple conditions using `&` and `|`
* `isin()` for filtering multiple categories

## 📝 Practice Completed

* Loaded a real-world messy dataset
* Checked dataset dimensions and metadata
* Found missing values and their percentages
* Detected and removed duplicate rows
* Renamed columns
* Converted date columns to `datetime`
* Filtered rows with missing values
* Filtered rows using multiple conditions
* Found rows with non-numeric values
* Identified invalid date entries

## 🎯 Key Learnings

* Real-world datasets are rarely clean.
* Always inspect data before performing analysis.
* Convert columns to the correct data types before calculations.
* Use `errors="coerce"` to safely detect invalid numeric or date values.
* Boolean indexing is a powerful technique for filtering datasets.

## 💡 Interview Takeaways

* Difference between `isnull()` and `notnull()`
* Why missing value percentage matters
* `&` vs `and` in Pandas filtering
* Using `isin()` for multiple conditions
* Detecting invalid values with `pd.to_numeric()` and `pd.to_datetime()`

## 🚀 Progress

✅ Day 44 Completed

Every clean dataset leads to more reliable insights. Learning to clean data is one of the most valuable skills for any Data Analyst or Data Scientist.
