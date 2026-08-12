# 🚀 Day 74 — ML Pipelines + ColumnTransformer

**Day:** 74
**Week:** 11
**Focus:** Machine Learning Pipelines
**Project:** Customer Churn Prediction System

---

## 🎯 Today's Goal

Learn how professional Machine Learning workflows combine:

* Data preprocessing
* Missing value handling
* Encoding
* Feature scaling
* Feature selection
* Model training

into a **reproducible and leakage-resistant workflow** using Scikit-learn Pipelines.

---

# 🧠 Topics Covered

## 1. Why ML Pipelines?

A professional ML workflow can be represented as:

```text
Raw Data
   ↓
Preprocessing
   ↓
Feature Transformation
   ↓
Model
   ↓
Prediction
```

A Pipeline connects these steps into one reproducible workflow.

### Benefits

* Consistency
* Reproducibility
* Leakage prevention
* Easier experimentation
* Easier cross-validation
* Easier hyperparameter tuning
* Easier deployment

---

## 2. `Pipeline`

Scikit-learn's `Pipeline` allows multiple ML steps to be chained together.

Conceptually:

```text
Preprocessing
      ↓
Feature Transformation
      ↓
Model
```

Example:

```text
StandardScaler
      ↓
LogisticRegression
```

Instead of manually performing preprocessing and then training the model separately, the entire workflow can be treated as one estimator.

---

# 🔄 3. `fit()` vs `transform()`

This is one of the most important concepts in Machine Learning preprocessing.

### `fit()`

Learns parameters from the data.

For example, `StandardScaler` learns:

* Mean
* Standard deviation

### `transform()`

Uses the learned parameters to transform data.

### `fit_transform()`

Performs both:

```text
fit()
  +
transform()
```

### Important Rule

The test data should **not teach the preprocessing step anything**.

Correct workflow:

```text
Training Data
     ↓
fit()
     ↓
Learn preprocessing parameters
     ↓
transform Training Data

Test Data
     ↓
transform()
     ↓
Use parameters learned from Training Data
```

Never fit the scaler separately on the test set.

---

# 🏗️ 4. ColumnTransformer

Different types of features often require different preprocessing.

### Numerical Features

Example:

```text
Age
MonthlyCharges
Tenure
```

May require:

```text
SimpleImputer
      ↓
StandardScaler
```

### Categorical Features

Example:

```text
Contract
PaymentMethod
InternetService
```

May require:

```text
SimpleImputer
      ↓
OneHotEncoder
```

`ColumnTransformer` allows us to apply different preprocessing workflows to different columns.

---

# 🔧 5. Complete Preprocessing Architecture

The professional architecture is:

```text
                    Raw Dataset
                         │
             ┌───────────┴───────────┐
             │                       │
       Numerical Data          Categorical Data
             │                       │
      SimpleImputer             SimpleImputer
             │                       │
      StandardScaler           OneHotEncoder
             │                       │
             └───────────┬───────────┘
                         │
                 ColumnTransformer
                         │
                    Preprocessor
                         │
                         ↓
                  LogisticRegression
```

This can then be wrapped into a complete Pipeline:

```text
Pipeline
   │
   ├── Preprocessor
   │      ├── Numerical Transformer
   │      └── Categorical Transformer
   │
   └── Model
```

---

# 🔐 6. Data Leakage

One major reason for using Pipelines is to reduce the risk of preprocessing leakage.

Incorrect workflow:

```text
Entire Dataset
      ↓
Imputation
      ↓
Encoding
      ↓
Scaling
      ↓
Cross Validation
```

The preprocessing steps may learn information from data that should remain unseen during validation.

This can produce **overly optimistic validation scores**.

---

# ✅ 7. Pipeline + Cross-Validation

A safer workflow is:

```text
Dataset
   ↓
Cross-Validation Split
   ↓
Training Fold
   ↓
Pipeline.fit()
   ↓
Preprocessing learned
   ↓
Model trained
   ↓
Validation Fold
   ↓
Transform using learned preprocessing
   ↓
Prediction
   ↓
Evaluation
```

The preprocessing is fitted independently inside each training fold.

This helps ensure that validation data remains unseen during fitting.

---

# 🎯 8. Pipeline + Feature Selection

Feature selection can also be placed inside a Pipeline.

Example:

```text
Preprocessing
      ↓
SelectKBest
      ↓
LogisticRegression
```

This is important during cross-validation.

If feature selection is performed using the complete dataset before cross-validation, information from validation folds can influence which features are selected.

Putting feature selection inside the Pipeline allows it to be learned separately within each training fold.

---

# 🤖 9. Pipeline + Multiple Models

The same general preprocessing structure can be combined with different models:

```text
Preprocessor → Logistic Regression
```

```text
Preprocessor → KNN
```

```text
Preprocessor → Decision Tree
```

```text
Preprocessor → Random Forest
```

However, the **same preprocessing is not automatically optimal for every model**.

For example:

| Model               | Scaling                                |
| ------------------- | -------------------------------------- |
| Logistic Regression | Generally beneficial                   |
| KNN                 | Important because it is distance-based |
| Decision Tree       | Generally not required                 |
| Random Forest       | Generally not required                 |

Model-specific requirements should therefore be considered when designing pipelines.

---

# 🏢 10. Customer Churn Prediction Pipeline

For the Customer Churn project, the initial professional preprocessing pipeline will handle:

### Numerical Features

* Missing values
* Scaling

### Categorical Features

* Missing values
* One-hot encoding
* Unknown categories

Initial model:

```text
Preprocessor
     ↓
Logistic Regression
```

The goal is to first make the preprocessing workflow **correct and leakage-resistant** before moving into more advanced experimentation.

---

# 📂 Project Structure

```text
Customer-Churn-Prediction/
│
├── notebooks/
│   ├── 01_data_understanding.ipynb
│   └── 02_preprocessing_pipeline.ipynb
│
├── data/
│
├── README.md
│
└── requirements.txt
```

---

# 📝 Day 74 Notebook Plan

`02_preprocessing_pipeline.ipynb`

### Step 1 — Train/Test Split

Separate the data before learning preprocessing parameters.

### Step 2 — Identify Features

Separate:

* Numerical columns
* Categorical columns

### Step 3 — Numerical Pipeline

```text
SimpleImputer
      ↓
StandardScaler
```

### Step 4 — Categorical Pipeline

```text
SimpleImputer
      ↓
OneHotEncoder
```

### Step 5 — ColumnTransformer

Combine both preprocessing workflows.

### Step 6 — Complete Pipeline

```text
Preprocessor
      ↓
LogisticRegression
```

### Step 7 — Fit on Training Data

Train the complete Pipeline using the training dataset.

### Step 8 — Evaluate

Evaluate the final Pipeline on the held-out test dataset.

---

# 🧪 Day 74 Learning Questions

During today's study, I focused on answering:

1. Why are ML Pipelines useful?
2. What does `Pipeline` do?
3. What does `ColumnTransformer` do?
4. What is the difference between `fit()` and `transform()`?
5. Why shouldn't preprocessing be fitted on test data?
6. How do Pipelines help prevent data leakage?
7. Why should preprocessing happen inside cross-validation?
8. Why should feature selection be inside the Pipeline?
9. Why does KNN generally require scaling?
10. Why don't tree-based models generally require scaling?

---

# 💡 Key Takeaway

The most important principle from Day 74:

> **Preprocessing is part of the Machine Learning model workflow and should be learned only from the appropriate training data.**

A professional workflow is:

```text
Raw Data
   ↓
Train/Test Split
   ↓
Pipeline
   ↓
Preprocessing
   ↓
Model
   ↓
Evaluation
```

And during Cross-Validation:

```text
Training Fold
     ↓
Pipeline.fit()
     ↓
Preprocessing + Model
     ↓
Validation Fold
     ↓
Prediction
```

This makes the workflow more **reproducible, consistent, and resistant to data leakage**.

---

# 💼 Internship Preparation

## Today's Targets

* [ ] Apply to 10 relevant internships
* [ ] Make 5 relevant LinkedIn connections
* [ ] Send 1–2 personalized recruiter/alumni messages

## Resume / LinkedIn Improvement

Improve one project description by replacing generic statements such as:

> "Built a machine learning model."

with a more professional description that explains:

**Problem → Approach → Technology → Result**

---

# 📊 Portfolio Improvement

Add a dedicated **Preprocessing Pipeline** section to the Customer Churn project README.

Document:

* Numerical preprocessing
* Categorical preprocessing
* ColumnTransformer
* Model Pipeline
* Leakage prevention
* Train/test methodology

This demonstrates that the project follows a professional ML workflow rather than simply training a model.

---

# 🐙 GitHub Task

Create and organize:

```text
notebooks/
    01_data_understanding.ipynb
    02_preprocessing_pipeline.ipynb
```

Keep the preprocessing work separate from the initial data-understanding notebook.

Use clear notebook section headings and explain **why** each preprocessing decision was made.

---

# 💼 LinkedIn

## Post Idea

Share the transition from manually preprocessing ML datasets to building a proper Scikit-learn Pipeline.

Focus on the key lesson:

**"Preprocessing isn't just preparation — it's part of the model workflow."**

## Caption

Today I learned why professional ML workflows use Pipelines. Instead of manually preprocessing data, I can combine imputation, encoding, scaling, and modeling into one reproducible workflow. The biggest lesson: preprocessing must be learned only from training data to avoid leakage.

---

# 𝕏 X Post Idea

```text
Day 74/90 🚀

ML Pipelines clicked today.

Preprocessing isn't just preparation—it’s part of the ML workflow.

Pipeline + ColumnTransformer help make preprocessing reproducible, consistent, and safer against data leakage.

#MachineLearning #DataScience
```

---

# 🎯 Day 74 Success Criteria

By the end of Day 74, I should be able to explain:

### Question 1

**Why is using a Pipeline safer than manually preprocessing the entire dataset before cross-validation?**

### Question 2

**What is the difference between Pipeline and ColumnTransformer?**

### Question 3

**How does a Pipeline prevent preprocessing information from leaking across cross-validation folds?**

---

# 🔥 Day 74 Mindset

Don't just learn:

```text
How to use Pipeline
```

Learn:

```text
Why Pipeline exists
        ↓
What problem it solves
        ↓
How it changes ML methodology
        ↓
Why it matters in real-world projects
```

The goal is not simply to write Scikit-learn code.

The goal is to **build ML workflows that you can trust.**

---

## 🚀 Day 74 Status

**Focus:** ML Pipelines + ColumnTransformer
**Project:** Customer Churn Prediction
**Primary Model:** Logistic Regression
**Main Skill:** Leakage-resistant preprocessing
**Next milestone:** Build and validate the professional preprocessing Pipeline
