# Day 75 — Baseline Models + Cross-Validation

## 📌 Day 75 Overview

Today is **Day 75 of my 90-Day Data Scientist + Internship Roadmap**.

I am currently in **Week 11**, focused on becoming better at building, improving, evaluating, and explaining real-world machine learning models.

Today's focus is:

> **Baseline Models + Cross-Validation + Proper Model Comparison**

The goal is not to select the final model or perform hyperparameter tuning. The goal is to establish a **fair baseline**, evaluate multiple models properly, and identify models that deserve further investigation.

---

## 🎯 Learning Objectives

By the end of Day 75, I should understand:

* What a baseline model is
* Why a baseline is necessary
* What `DummyClassifier` does
* Difference between baseline and final model
* Why one train/test split can be misleading
* What K-Fold Cross-Validation does
* Why `StratifiedKFold` is useful for classification
* Mean CV score
* Standard deviation of CV scores
* Model stability
* Why cross-validation must be performed correctly
* How pipelines work with cross-validation
* How to compare multiple models fairly
* Why accuracy alone is insufficient for churn prediction
* How business objectives influence evaluation metrics

---

# 🧠 Part 1 — Think Like a Data Scientist

Consider a customer churn dataset:

* 10,000 customers
* 8,000 → No Churn
* 2,000 → Churn

A model achieves:

**Accuracy = 82%**

Before celebrating the 82% accuracy, I should investigate the **class distribution and baseline performance**.

A model can appear accurate simply because the majority class dominates the dataset.

### Key Question

> Before celebrating this 82% accuracy, what would I investigate?

---

# 📊 Part 2 — Baseline Model

A **baseline model** provides a simple reference point against which more sophisticated models can be compared.

For classification, `DummyClassifier` can be used to establish a baseline.

Common strategies include:

* `most_frequent`
* `stratified`

The important idea is:

> A sophisticated model is not useful merely because it performs well. It should perform meaningfully better than a reasonable baseline.

### Example

If:

* Random Forest → 82% accuracy
* DummyClassifier → 80% accuracy

The Random Forest is **not automatically impressive**.

The improvement over the baseline must be considered.

---

# 🔄 Part 3 — Why One Train/Test Split Is Not Enough

Suppose:

| Model   | Test Accuracy |
| ------- | ------------: |
| Model A |           84% |
| Model B |           82% |

We cannot immediately conclude that Model A is better.

A single train/test split can be affected by:

* Randomness
* Class distribution
* Outliers
* Particular samples appearing in train/test

This motivates the use of **Cross-Validation**.

---

# 🔁 Part 4 — K-Fold Cross-Validation

K-Fold Cross-Validation divides the training dataset into multiple folds.

For **K = 5**:

1. Fold 1 → validation, Folds 2–5 → training
2. Fold 2 → validation, Folds 1, 3–5 → training
3. Fold 3 → validation, remaining folds → training
4. Fold 4 → validation
5. Fold 5 → validation

Each observation gets an opportunity to be part of the validation set.

Instead of relying on one score, we obtain multiple scores.

---

## 📈 Mean CV Score

The mean of the cross-validation scores gives an estimate of overall model performance.

For example:

```text
CV Scores:
[0.82, 0.81, 0.85, 0.79, 0.85]

Mean CV Score:
0.824
```

The **mean** helps us understand the model's expected performance across different folds.

---

## 📉 Standard Deviation

Standard deviation tells us how much the model's performance varies across folds.

A smaller standard deviation generally indicates more consistent performance.

For example:

```text
Model A:
CV F1 = 0.78 ± 0.01

Model B:
CV F1 = 0.80 ± 0.08
```

The mean score alone is not enough.

We should also consider **stability and variation**.

### Key Question

> Would I prefer a model with CV F1 = 0.78 ± 0.01 or 0.80 ± 0.08?

I should consider both performance and stability before deciding.

---

# 🧩 Part 5 — Stratified K-Fold

Customer churn is a **classification problem**.

The target distribution is:

```text
No Churn → 80%
Churn    → 20%
```

`StratifiedKFold` attempts to preserve approximately the same class distribution in every fold.

This is especially useful when the dataset is imbalanced or relatively small.

### Why?

We want every validation fold to contain a representative mixture of:

* No Churn
* Churn

This makes model evaluation more reliable.

---

# 🎯 Part 6 — Choosing the Right Metric

For churn prediction, accuracy alone may not tell the complete story.

The business wants to identify customers who are likely to leave.

Two important errors are:

### False Positive

We predict:

> Customer will churn

But the customer actually does not churn.

### False Negative

We predict:

> Customer will not churn

But the customer actually churns.

The business cost of these mistakes may be different.

Therefore, metric selection should depend on the **business objective**.

---

# 📐 Part 7 — Metric Trade-Offs

Important classification metrics:

* Accuracy
* Precision
* Recall
* F1
* ROC-AUC
* PR-AUC

### Precision

High precision means:

> When we predict churn, we are usually correct.

### Recall

High recall means:

> We identify more of the customers who actually churn.

### F1

F1 provides a balance between precision and recall.

### ROC-AUC

ROC-AUC evaluates how well the model separates/ranks positive and negative examples across thresholds.

### PR-AUC

PR-AUC can be particularly useful when the positive class is relatively rare.

---

## 💼 Business Perspective

Suppose the company has a limited retention budget and can contact only **1,000 customers**.

Question:

> Would maximizing recall alone necessarily be optimal?

The answer depends on the business costs associated with false positives and false negatives.

---

# 📊 Part 8 — Confusion Matrix Practice

Consider:

```text
                 Predicted
               No       Yes
Actual No     7000     1000
Actual Yes     500     1500
```

I should calculate:

* Accuracy
* Precision
* Recall
* F1

The important goal is not just calculating metrics, but understanding **what each metric tells us about the business problem**.

---

# ⚖️ Part 9 — Fair Model Comparison

When comparing models, I should use the same evaluation protocol.

### Fair comparison requires:

1. Same dataset
2. Same target
3. Same train/test strategy
4. Same CV strategy
5. Appropriate preprocessing
6. Appropriate metrics
7. Same evaluation protocol

Models to compare:

* Logistic Regression
* KNN
* Decision Tree
* Random Forest

A useful comparison table is:

| Model               | CV Accuracy | CV Precision | CV Recall | CV F1 | CV ROC-AUC | Std |
| ------------------- | ----------: | -----------: | --------: | ----: | ---------: | --: |
| Logistic Regression |           — |            — |         — |     — |          — |   — |
| KNN                 |           — |            — |         — |     — |          — |   — |
| Decision Tree       |           — |            — |         — |     — |          — |   — |
| Random Forest       |           — |            — |         — |     — |          — |   — |

This is more informative than simply comparing:

```text
Model A → Accuracy 85%
Model B → Accuracy 87%
```

---

# 🔗 Part 10 — Pipeline + Cross-Validation

Today's concepts connect directly with the previous day's work on preprocessing pipelines.

The basic architecture is:

```text
Pipeline
    ↓
Preprocessing
    ↓
Model
    ↓
StratifiedKFold
    ↓
Cross-Validation
```

Conceptually:

```python
Pipeline(
    preprocessing,
    model
)
```

Then:

```python
cross_validate(
    pipeline,
    X_train,
    y_train,
    cv=StratifiedKFold(...)
)
```

### Important Principle

Preprocessing must happen **independently inside each fold**.

This prevents information from the validation fold from influencing preprocessing during training.

The pipeline therefore helps prevent **data leakage**.

---

# 🧪 Part 11 — Test Set vs Cross-Validation

### Training Set

Used to learn model parameters.

### Cross-Validation

Used to estimate and compare model performance and make model-selection/tuning decisions using the training data.

### Test Set

Held out for the final evaluation.

The test set should remain untouched during model selection.

### Important Question

> If I run 20 different models and repeatedly inspect test accuracy before choosing the winner, is the test set still truly unbiased?

No.

Repeatedly using the test set to make decisions causes the test set to influence model selection.

Therefore:

```text
Training Data
      ↓
Cross-Validation
      ↓
Model Selection
      ↓
Final Model
      ↓
Test Set
      ↓
Final Unbiased Evaluation
```

---

# 💻 Part 12 — Practical Coding Task

Using the **Customer Churn dataset**, the goal is to:

1. Separate `X` and `y`
2. Perform train/test split
3. Use stratification
4. Build a `DummyClassifier` baseline
5. Build Logistic Regression pipeline
6. Build KNN pipeline
7. Build Decision Tree pipeline
8. Build Random Forest pipeline
9. Use `StratifiedKFold`
10. Compare models using cross-validation
11. Record:

* Accuracy
* Precision
* Recall
* F1
* ROC-AUC

12. Calculate mean and standard deviation
13. Create a model comparison DataFrame

### Important

Do **not** perform hyperparameter tuning today.

Do **not** select the final model today.

Today's objective is to establish a **fair baseline** and determine which models deserve further investigation.

---

# 🔍 Part 13 — Model Comparison Thinking

Consider:

### Model A

```text
Accuracy  = 0.91
Precision = 0.72
Recall    = 0.41
F1        = 0.52
ROC-AUC   = 0.81
```

### Model B

```text
Accuracy  = 0.87
Precision = 0.63
Recall    = 0.76
F1        = 0.69
ROC-AUC   = 0.86
```

### Model C

```text
Accuracy  = 0.85
Precision = 0.70
Recall    = 0.74
F1        = 0.72
ROC-AUC   = 0.87
```

The correct question is not simply:

> Which model has the highest accuracy?

Instead, investigate:

* Business objective
* Precision
* Recall
* Cost of false negatives
* ROC-AUC
* Stability
* Interpretability
* Computational complexity
* Deployment considerations

The model that deserves further investigation should be justified using both:

**Statistical evidence + Business requirements**

---

# 🚀 Part 14 — Customer Churn Project

Today's major project milestone:

```text
02_baseline_model_comparison.ipynb
```

It should contain:

1. Problem reminder
2. Train/test split
3. Stratification
4. Dummy baseline
5. Preprocessing pipeline
6. Logistic Regression
7. KNN
8. Decision Tree
9. Random Forest
10. Stratified K-Fold CV
11. Multiple evaluation metrics
12. Model comparison table
13. Initial model analysis
14. Preliminary model shortlist

### Today's Boundary

```text
❌ No hyperparameter tuning
❌ No final model selection

✅ Establish baseline
✅ Cross-validation
✅ Fair model comparison
✅ Understand metrics
✅ Shortlist models for further investigation
```

---

# 🐛 Part 15 — Error Analysis Preview

A model can have poor recall because it systematically misses certain types of customers.

Think about:

> If a churn model has poor recall, what types of customers might it be systematically missing?

The goal is to start thinking about model errors from a **business perspective**.

---

# 📝 Daily Practice

## Python — 5 Questions

1. Write a function that accepts a list of CV scores and returns the mean and standard deviation without using `np.mean()` or `np.std()`.

2. Given a dictionary containing model names and CV scores, write logic to identify the model with the highest mean score while also considering its standard deviation.

3. Explain what happens if `random_state` is changed during a train/test split and how that can affect model evaluation.

4. Write Python logic to verify whether two datasets have the same number of rows and matching indices.

5. Design a function that accepts predictions and actual values and returns the confusion-matrix components: TP, TN, FP, and FN.

---

## Pandas — 5 Questions

1. Given a model comparison DataFrame, sort models by F1 score and then by ROC-AUC.

2. Calculate the mean and standard deviation of CV results grouped by model.

3. Given a churn DataFrame, calculate the percentage of churned customers.

4. Create a cross-tabulation showing actual churn vs predicted churn.

5. Given CV results stored across multiple columns, reshape them into a long-format DataFrame suitable for visualization.

---

## SQL — 5 Interview Questions

1. A `customers` table contains `customer_id`, `monthly_charges`, and `churn`. Write a query to calculate churn rate by monthly-charge group.

2. Find the top 3 customers with the highest monthly charges within each customer segment.

3. Calculate each customer's previous month's charges using a window function.

4. Find customers whose monthly charges increased for two consecutive months.

5. A company wants to identify the department with the highest employee attrition rate. How would you calculate it?

---

## Machine Learning — 5 Questions

1. Why can a model with 90% accuracy still be poor for churn prediction?

2. Explain why `StratifiedKFold` is generally preferred over ordinary `KFold` for an imbalanced classification problem.

3. A model has high precision but very low recall. What does this tell you?

4. Why should preprocessing be placed inside a pipeline when performing cross-validation?

5. Why is the test set not used repeatedly during model selection?

---

## Statistics — 5 Questions

1. Two models have the same mean CV score, but one has much higher standard deviation. What could this indicate?

2. Explain the difference between variance and standard deviation in the context of model evaluation.

3. Why does sample distribution matter when estimating model performance?

4. If a metric has values `[0.70, 0.72, 0.71, 0.95, 0.69]`, what would you investigate before reporting the mean?

5. Explain why a representative sample is important when estimating population-level performance.

---

# 🎤 Internship Interview Preparation

Prepare answers for:

1. What is a baseline model?
2. Why use `DummyClassifier`?
3. Why is one train/test split sometimes insufficient?
4. Explain K-Fold Cross-Validation.
5. Why use `StratifiedKFold` for classification?
6. What does CV standard deviation tell you?
7. Why should the test set be kept untouched?
8. Why can accuracy be misleading for churn?
9. Precision vs recall — which would you prioritize and why?
10. What is the difference between ROC-AUC and PR-AUC?
11. How would you compare two models fairly?
12. Why should preprocessing be inside the CV pipeline?

**Do not memorize definitions. Explain the reasoning behind each answer.**

---

# 💼 Internship Preparation

Today's targets:

* Apply to **10 internships**
* Make **5 relevant LinkedIn connections**
* Send **1–2 personalized recruiter/alumni messages**

### Resume / LinkedIn Improvement

Take one existing project bullet and rewrite it using:

**Action → Technical Work → Result**

Focus on measurable outcomes where possible.

---

# 📁 Portfolio Task

Improve the Customer Churn project by adding a professional **Model Comparison** section.

Show:

```text
Baseline
    ↓
Cross-Validation
    ↓
Multiple Metrics
    ↓
Model Comparison
    ↓
Preliminary Shortlist
```

This demonstrates that model selection is based on more than a single accuracy score.

---

# 🐙 GitHub Task

Create:

```text
02_baseline_model_comparison.ipynb
```

Keep the notebook organized into clear sections and make sure the model comparison results are easy for another developer or recruiter to understand.

---

# 💼 LinkedIn

### Post Idea

Share what you learned about why **accuracy alone is not enough** for Customer Churn Prediction.

Focus on:

* Baseline models
* Cross-validation
* StratifiedKFold
* Precision vs Recall
* Fair model comparison

### Caption

> Day 75 of my Data Science journey 🚀
>
> Today I learned why a single test accuracy isn't enough to choose an ML model.
>
> I explored DummyClassifier, StratifiedKFold, cross-validation, precision, recall, F1 & fair model comparison.
>
> Building models is one thing. Evaluating them correctly is another.

---

# 𝕏 X Post

### Post Idea

> Day 75/90 🚀
> Today I learned that a high accuracy score doesn't automatically mean a good ML model. Baselines, StratifiedKFold, CV stability, and business metrics like precision/recall are essential for fair model comparison.

---

# 🎯 Day 75 Deliverables

By the end of today, I should have:

* [ ] Understood baseline models
* [ ] Built a `DummyClassifier` baseline
* [ ] Understood K-Fold Cross-Validation
* [ ] Understood `StratifiedKFold`
* [ ] Understood CV mean and standard deviation
* [ ] Understood why one train/test split can be misleading
* [ ] Compared multiple models fairly
* [ ] Evaluated models using multiple metrics
* [ ] Built a model comparison table
* [ ] Connected Pipeline with cross-validation
* [ ] Created `02_baseline_model_comparison.ipynb`
* [ ] Established preliminary model candidates
* [ ] Avoided hyperparameter tuning
* [ ] Avoided final model selection
* [ ] Completed interview practice
* [ ] Applied to 10 internships
* [ ] Made 5 LinkedIn connections
* [ ] Sent 1–2 personalized messages
* [ ] Posted Day 75 progress

---

# 🏆 Success Criteria

By the end of Day 75, I should be able to clearly explain:

### 1. Why is a single test-set accuracy not enough to decide which model is best?

### 2. Why should I use `StratifiedKFold` for a churn classification problem?

### 3. Why should the test set remain untouched until the final evaluation?

Most importantly, I should be able to look at multiple models and justify which one deserves further investigation using:

**1. Statistical evidence**

**2. Business requirements**

---

## 🚦 Day 75 Boundary

Today's focus ends at:

> **Baseline Models + Cross-Validation + Proper Model Comparison**

The final model is **not** selected today.

Hyperparameter tuning is **not** performed today.

The objective is to build a reliable evaluation foundation before moving forward.

---

## 🔥 Key Takeaway

> **A good Data Scientist doesn't simply ask, "Which model has the highest accuracy?"**

They ask:

> **"Compared with a meaningful baseline, how well does the model generalize across different folds, how stable is its performance, which errors does it make, and does its behavior align with the business objective?"**
