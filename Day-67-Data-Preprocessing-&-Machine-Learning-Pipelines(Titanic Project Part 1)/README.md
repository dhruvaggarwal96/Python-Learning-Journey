# Day 67 – Data Preprocessing & Machine Learning Pipelines (Titanic Project - Part 1)

## 📖 Overview

Today marked the beginning of my **Titanic Survival Prediction** project, where I focused on building a strong foundation in **data preprocessing** and **machine learning pipelines**. Instead of jumping directly into model training, I learned how to prepare real-world data for machine learning by handling missing values, engineering useful features, encoding categorical variables, scaling numerical features, and creating reusable preprocessing pipelines.

## 🚀 Topics Covered

### Data Preprocessing

* Importance of Data Preprocessing
* Understanding Raw Datasets
* Numerical vs Categorical Features
* Detecting Missing Values
* Handling Missing Values

  * Mean Imputation
  * Median Imputation
  * Mode Imputation
  * Constant Value Imputation
* When to Remove Rows or Columns
* Detecting and Removing Duplicate Records
* Handling Inconsistent Values
* Outlier Handling (Review)
* Data Leakage and Prevention

### Encoding Categorical Variables

* Why Machine Learning Models Cannot Use Text Directly
* Label Encoding
* One-Hot Encoding
* Ordinal Encoding
* Binary Encoding (Introduction)
* Choosing the Right Encoding Technique
* Advantages and Disadvantages
* Common Encoding Mistakes

### Feature Scaling

* Why Feature Scaling is Important
* StandardScaler
* MinMaxScaler
* RobustScaler
* Normalization vs Standardization
* Algorithms That Require Scaling
* Algorithms That Do Not Require Scaling

### Machine Learning Pipelines

* Introduction to Pipelines
* Benefits of Pipelines
* Preventing Data Leakage
* ColumnTransformer
* Combining Preprocessing and Model Training
* Building Reusable ML Pipelines
* Best Practices for Production

## 🛠 Practical Work

* Loaded the Titanic Dataset
* Explored Dataset Shape and Columns
* Checked Data Types
* Analyzed Missing Values
* Generated Descriptive Statistics
* Identified Numerical and Categorical Features
* Handled Missing Values
* Removed Duplicates (if any)
* Performed Feature Engineering:

  * FamilySize
  * IsAlone
  * Title Extraction
  * Age Groups (Optional)
* Applied Appropriate Encoding Techniques
* Applied Feature Scaling Where Required
* Built a Complete Preprocessing Pipeline using:

  * Pipeline
  * ColumnTransformer

## 💡 Key Learnings

* High-quality data is more valuable than complex models.
* Missing values should be handled based on the data and business context.
* Different encoding techniques are suitable for different types of categorical variables.
* Feature scaling is essential for distance-based and gradient-based algorithms.
* Pipelines simplify workflows, improve reproducibility, and help prevent data leakage.
* Feature engineering can significantly improve model performance.

## 🧰 Libraries Used

* Python
* NumPy
* Pandas
* Matplotlib
* Scikit-learn

## 🎯 Outcome

By the end of Day 67, I learned how to transform raw data into a machine-learning-ready dataset using industry-standard preprocessing techniques and reusable pipelines. This prepares the Titanic dataset for model training in the next phase of the project.

## 📌 Next Step

On **Day 68**, I will train and evaluate multiple machine learning models on the preprocessed Titanic dataset and compare their performance.

---

### 🔥 90-Day Data Science Journey

**Day 67/90 Completed ✅**

Learning consistently, building projects, and moving one step closer to becoming a **Data Scientist**.
