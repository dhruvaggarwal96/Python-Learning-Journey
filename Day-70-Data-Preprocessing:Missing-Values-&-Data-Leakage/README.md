# Day 70 — Data Preprocessing: Missing Values & Data Leakage

**90-Day Data Scientist + Internship Roadmap | Week 11**

## 🎯 Today's Goal

Today I focused on an important part of real-world Machine Learning:

> **Data Preprocessing — Missing Values & Data Leakage**

The goal was to understand how missing data should be handled and why preprocessing must be performed correctly to avoid data leakage.

---

## 📚 Topics Covered

### 1. Missing Values

* Why missing values occur
* Detecting missing values
* Numerical vs categorical missing values
* Mean imputation
* Median imputation
* Mode imputation
* Constant / `"Unknown"` imputation
* Dropping rows
* Dropping columns
* Missingness indicators
* Effect of outliers on imputation

### 2. Missing Data Mechanisms

* **MCAR** — Missing Completely At Random
* **MAR** — Missing At Random
* **MNAR** — Missing Not At Random

Understanding *why* values are missing is important before choosing an imputation strategy.

### 3. Data Leakage

Learned why preprocessing before the train/test split can cause **data leakage**.

Key ideas:

* Train/test contamination
* Fitting preprocessing only on training data
* Using training statistics to transform test data
* Target leakage
* Feature leakage
* Why leakage can produce unrealistically high model performance

---

## 🧠 Important Concepts

### Mean vs Median Imputation

**Mean** can work when the feature is reasonably symmetric and doesn't contain extreme outliers.

**Median** is often safer when the feature is skewed or contains outliers.

The choice should depend on the **data distribution and business context**, not simply on convenience.

### Missingness Indicators

Sometimes the fact that a value is missing can itself contain useful information.

For example:

```text
Income = missing
```

could indicate something about a customer's behavior or profile.

A missingness indicator can capture this:

```text
Income_missing = 1
```

---

## 🚨 Data Leakage

One of the most important lessons today:

> **The test set must remain unseen during training and preprocessing.**

Incorrect approach:

```text
Entire Dataset
      ↓
Calculate Mean
      ↓
Impute Missing Values
      ↓
Train/Test Split
```

Correct approach:

```text
Entire Dataset
      ↓
Train/Test Split
      ↓
Training Data → Fit Imputer
      ↓
Training Data → Transform
Test Data → Transform using training statistics
```

The imputer should learn values such as the mean or median **only from the training data**.

---

## 🛠️ Practical Skills

Practiced how to:

```python
df.isnull().sum()
```

Calculate missing percentages:

```python
df.isnull().mean() * 100
```

Identify numerical and categorical columns:

```python
df.select_dtypes(include="number")
df.select_dtypes(include="object")
```

Compare:

```text
Mean
Median
Mode
```

before deciding how to handle missing values.

---

## 🚕 Customer Churn Project

Today I started the **Customer Churn Prediction System**.

### Project Structure

```text
customer-churn-prediction/
│
├── data/
│   └── raw/
│
├── notebooks/
│   └── 01_data_understanding.ipynb
│
├── src/
├── visualizations/
├── reports/
├── README.md
├── requirements.txt
└── .gitignore
```

### Today's Notebook

`01_data_understanding.ipynb`

Tasks:

* Load the dataset
* Inspect shape
* Inspect columns
* Check data types
* Identify target variable
* Identify numerical features
* Identify categorical features
* Calculate missing values
* Calculate missing percentages
* Identify suspicious columns
* Look for potential target leakage
* Write initial business hypotheses

**No model training today.**

---

## 💡 Key Data Scientist Mindset

Instead of asking:

> "How do I fill these missing values?"

I should ask:

> **"Why are these values missing, and what effect will my decision have on the model?"**

Preprocessing is not just a coding step.

It is a **data science decision**.

---

## 🎯 Day 70 Success Criteria

By the end of today, I should be able to explain without notes:

### Question 1

**What is data leakage and how can preprocessing cause it?**

### Question 2

**If a numerical feature contains missing values, how do I decide between mean, median, dropping rows, or another strategy?**

---

## 📈 Internship Preparation

Today's focus also included:

* Practicing ML interview questions
* Applying to Data Analyst / Data Science internships
* Connecting with relevant professionals on LinkedIn
* Sending personalized recruiter/alumni messages
* Improving my portfolio
* Updating GitHub documentation

---

## 🚀 Progress

**Day 70 / 90**

Week 11 has started.

The focus now is not just on building models, but on learning how to build **reliable, leakage-free and explainable Machine Learning systems**.

> **Don't just train a model. Understand the data behind it.**
