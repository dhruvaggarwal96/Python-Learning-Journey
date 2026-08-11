# 🚀 Day 73 — Feature Selection

## 📅 90-Days-Of-Code 

**Week:** 11
**Day:** 73
**Main Topic:** Feature Selection
**Project:** Customer Churn Prediction System

---

## 🎯 Today's Goal

Learn how to decide **which features should actually be given to a machine learning model**.

Feature selection is not simply:

> "Delete columns until the model gets better."

Instead:

> **Use evidence, validation, and domain knowledge to identify a useful and reliable feature set.**

---

# 🧠 What is Feature Selection?

**Feature Selection** means choosing which existing or created features should be used by the machine learning model.

### Feature Engineering vs Feature Selection

| Concept             | Meaning                                |
| ------------------- | -------------------------------------- |
| Feature Engineering | Creating or transforming features      |
| Feature Selection   | Choosing which features should be used |

Example:

If we create:

`TenureMonths = TenureDays / 30`

Creating this feature is **Feature Engineering**.

Deciding whether `TenureMonths` should be given to the model is **Feature Selection**.

---

# 🔍 Why Feature Selection Matters

Having more features does **not** necessarily mean having a better model.

Unnecessary features can introduce:

* Noise
* Overfitting
* Higher computational cost
* More complex models
* Difficult interpretation
* Multicollinearity
* Poor generalization

However, fewer features are **not automatically better**.

### 🎯 The Goal

Keep features that provide useful predictive information while removing unnecessary complexity.

---

# 🧩 Irrelevant vs Redundant Features

### Irrelevant Feature

A feature that provides little or no useful predictive information.

Examples:

* RandomNumber
* CustomerID in many churn problems

### Redundant Feature

A feature that contains information very similar to another feature.

For example:

* MonthlyCharges
* TotalCharges
* Tenure

Some of these may contain overlapping information.

### ⚠️ Suspicious Features

Features that appear unusually predictive should be investigated carefully.

They may contain:

* Data leakage
* Post-outcome information
* Target-related information that would not be available at prediction time

---

# 📊 Correlation-Based Feature Selection

Correlation can help investigate relationships between variables.

## Pearson Correlation

Pearson correlation measures the strength and direction of a **linear relationship**.

Its value ranges from:

`-1 → +1`

### Positive Correlation

When one variable increases, the other tends to increase.

### Negative Correlation

When one variable increases, the other tends to decrease.

### Near-Zero Correlation

Little linear relationship exists.

---

## ⚠️ Important Limitation

Correlation alone is **not enough** for feature selection.

> **Low correlation ≠ useless feature**

A feature may have a weak linear relationship with churn but still contain:

* Nonlinear information
* Interaction effects
* Predictive patterns captured by tree-based models

Similarly:

> **High correlation ≠ automatically keep**

A highly correlated feature may be redundant with another feature.

---

# 🔗 Multicollinearity

**Multicollinearity** occurs when features are strongly related to each other.

Example:

```text
MonthlyCharges
TotalCharges
Tenure
```

If two features contain very similar information, keeping both may add unnecessary complexity, especially for models such as Logistic Regression.

---

# 📉 VarianceThreshold

`VarianceThreshold` is a simple filter-based feature selection technique.

### Intuition

A feature that barely changes across observations may provide little information.

Example:

```text
Feature A:
1
1
1
1
1
1
```

This feature has extremely low variance.

Compared with:

```text
Feature B:
1
0
1
0
1
0
```

Feature B has greater variation.

### ⚠️ Limitation

Low variance does **not automatically mean useless**.

A feature can have low variance and still be predictive.

---

# 📌 SelectKBest

`SelectKBest` is a **filter method** that selects the `k` highest-scoring features according to a statistical test.

Example:

```text
20 features
      ↓
SelectKBest(k=5)
      ↓
5 selected features
```

For classification problems, commonly used scoring functions include:

* `chi2`
* `f_classif`

### Important

Feature selection must be fitted appropriately.

The test set should **not influence feature selection**.

---

# 🔄 Recursive Feature Elimination (RFE)

RFE stands for:

**Recursive Feature Elimination**

Basic process:

```text
Start with all features
        ↓
Train model
        ↓
Rank feature importance
        ↓
Remove weakest feature(s)
        ↓
Train again
        ↓
Repeat
```

RFE is a **wrapper method** because it repeatedly uses a machine learning model to decide which features to keep.

### Advantages

* Considers the model while selecting features
* Can identify a useful subset of features

### Disadvantages

* Computationally expensive
* Depends on the underlying estimator

---

# 🌳 Embedded Feature Selection

Embedded methods perform feature selection **as part of the model-training process**.

Examples:

### L1 Regularization

For example:

**Logistic Regression + L1 regularization**

L1 regularization can drive some coefficients toward zero.

### Tree-Based Models

Tree models can provide feature importance scores.

Examples:

* Decision Tree
* Random Forest

---

# 🆚 Feature Selection Methods

| Method                  | Category | Main Idea                                     |
| ----------------------- | -------- | --------------------------------------------- |
| Correlation             | Filter   | Select based on statistical relationship      |
| VarianceThreshold       | Filter   | Remove low-variance features                  |
| SelectKBest             | Filter   | Select features using statistical scores      |
| RFE                     | Wrapper  | Repeatedly remove weak features using a model |
| L1 Regularization       | Embedded | Model drives some coefficients toward zero    |
| Tree Feature Importance | Embedded | Model identifies important features           |

---

# 🚨 Feature Selection & Data Leakage

This is one of the most important concepts from Day 73.

Suppose we have:

**10,000 customers**

We calculate the correlation between every feature and the target using the **complete dataset**.

Then:

```text
Select top 10 features
        ↓
Train/Test Split
```

### ❌ Problem

The test data has already influenced feature selection.

Therefore, information from the test set has leaked into the training process.

This can make model evaluation overly optimistic.

---

# ✅ Correct Workflow

The general principle is:

```text
Split data
    ↓
Training Data
    ↓
Feature Selection
    ↓
Model Training
    ↓
Evaluate on untouched Test Data
```

For robust workflows, feature selection should be performed inside the appropriate **pipeline/cross-validation process**.

---

# 🏗️ Customer Churn Prediction System

Day 73 continues the Customer Churn Prediction System.

Today's focus:

### Feature Selection

Investigate:

* Identifier columns
* Constant features
* Near-constant features
* Highly correlated features
* Potentially redundant features
* Suspicious predictive features
* Features created during Day 72

---

# 📋 Feature Selection Report

Create a report using:

| Feature   | Reason to Keep/Remove | Evidence | Risk |
| --------- | --------------------- | -------- | ---- |
| Feature A | Keep/Remove           | Evidence | Risk |
| Feature B | Keep/Remove           | Evidence | Risk |
| Feature C | Keep/Remove           | Evidence | Risk |

The goal is **not** to permanently remove a feature just because one method says it is unimportant.

Instead:

> **Compare evidence from multiple methods.**

---

# 🧪 Experiments

Experiment with:

### 1. Correlation-Based Selection

Investigate:

* Feature → Target correlation
* Feature ↔ Feature correlation

### 2. VarianceThreshold

Identify features with extremely low variance.

### 3. SelectKBest

Experiment with selecting the strongest statistical features.

### 4. Model-Based Feature Importance

Use model-based importance to investigate which features contribute to predictions.

---

# 🧠 Data Scientist Thinking

Consider this situation:

```text
Feature A

Correlation with churn = 0.02

Random Forest:
Feature A = Top 5 Important Feature
```

Do not immediately conclude that one method is correct and the other is wrong.

Consider:

* Linear vs nonlinear relationships
* Interaction effects
* Limitations of correlation
* Model-specific feature importance
* Cross-validation

---

# 📊 Model Comparison

Consider:

### Model A

```text
Features = 10
F1 Score = 0.71
ROC-AUC = 0.84
```

### Model B

```text
Features = 35
F1 Score = 0.72
ROC-AUC = 0.845
```

The model with more features is **not automatically better**.

Consider:

* Performance difference
* Complexity
* Interpretability
* Maintenance
* Stability
* Business value

---

# 💼 Internship Preparation

Today's focus is to understand and explain:

1. Why is feature selection important?
2. Difference between feature selection and feature extraction
3. What is multicollinearity?
4. How would you detect redundant features?
5. What is SelectKBest?
6. Explain RFE.
7. Difference between filter, wrapper and embedded methods
8. Can a feature have low correlation but still be useful?
9. How can feature selection cause data leakage?
10. Would you always remove highly correlated features?

---

# 🧑‍💻 Daily Practice

### Python — 5 Questions

Practice medium → hard Python problems.

### Pandas — 5 Questions

Focus on practical data manipulation and analysis.

### SQL — 5 Interview Questions

Focus on:

* Joins
* CTEs
* Window Functions
* Analytical problems

### Machine Learning — 5 Questions

Focus on:

* Feature selection
* Model evaluation
* Generalization
* Data leakage
* Model comparison

### Statistics — 5 Questions

Focus on:

* Correlation
* Variance
* Statistical reasoning
* Relationships between variables

---

# 💼 Internship Targets

Today's targets:

* Apply to **10 internships**
* Make **5 relevant LinkedIn connections**
* Send **1–2 personalized recruiter/alumni messages**

---

# 📄 Resume / LinkedIn Improvement

Improve one project description by emphasizing:

**Problem → Approach → Model → Evaluation → Business Impact**

Avoid simply listing libraries and algorithms.

---

# 🚀 Portfolio Improvement

Add a professional **Feature Selection Report** to the Customer Churn Prediction project.

Document:

* Features investigated
* Features removed
* Features retained
* Evidence used
* Potential leakage risks
* Model performance before/after selection

---

# 🐙 GitHub Task

Improve the Customer Churn repository documentation.

Add a section:

```text
## Feature Selection
```

Explain:

* Why feature selection was performed
* Methods tested
* Features removed
* Features retained
* How leakage was prevented

---

# 💼 LinkedIn Task

### Post Idea

Share what you learned about why **more features do not necessarily mean a better machine learning model**.

Discuss:

* Irrelevant features
* Redundant features
* Feature selection
* Data leakage
* Model generalization

---

# 🐦 X Task

### Post Idea

Share one key lesson from Day 73:

> More features ≠ better ML model.

Keep the post focused on feature selection, noise, overfitting, and generalization.

---

# 🎯 Day 73 Deliverables

By the end of Day 73:

* [ ] Understand why feature selection matters
* [ ] Identify irrelevant features
* [ ] Identify redundant features
* [ ] Practice correlation-based selection
* [ ] Practice variance-based selection
* [ ] Understand SelectKBest
* [ ] Understand RFE
* [ ] Understand filter/wrapper/embedded methods
* [ ] Practice model-based feature importance
* [ ] Understand feature-selection leakage
* [ ] Create a feature-selection report
* [ ] Compare selected vs unselected features
* [ ] Complete interview practice
* [ ] Apply to 10 internships
* [ ] Make 5 LinkedIn connections
* [ ] Send 1–2 personalized messages
* [ ] Post Day 73 progress

---

# 🏆 Success Criteria

By the end of today, I should be able to explain:

### Question 1

**Why doesn't selecting the features with the highest correlation to churn necessarily give me the best feature set?**

### Question 2

**How can feature selection accidentally cause data leakage?**

---

# 🔥 Core Lesson

Feature Selection is **not**:

> "Delete columns until the model gets better."

It is:

> **"Use evidence, validation and domain knowledge to identify a useful, reliable feature set."**

---



