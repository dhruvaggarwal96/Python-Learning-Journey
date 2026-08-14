# Day 76 — Hyperparameter Tuning

## 🎯 Goal

Today I learned how to systematically improve machine learning model performance by finding suitable **hyperparameters** without overfitting to the test set.

The main focus was on:

* Parameters vs Hyperparameters
* Why Hyperparameter Tuning matters
* GridSearchCV
* RandomizedSearchCV
* Search Spaces
* Cross-Validation during tuning
* Scoring Metrics
* Computational Trade-offs
* Test-Set Protection
* Interpreting Tuning Results

---

# 🧠 1. Parameters vs Hyperparameters

## Parameters

Parameters are values **learned by the model from the training data**.

Examples:

* Logistic Regression coefficients
* Decision Tree split values

## Hyperparameters

Hyperparameters are values **chosen before or during model training** that control how the model learns.

Examples:

* KNN → `n_neighbors`
* Random Forest → `n_estimators`
* Random Forest → `max_depth`
* Logistic Regression → `C`
* Decision Tree → `max_depth`

### Key Difference

> **Parameters are learned from data. Hyperparameters are selected by us.**

---

# 🔧 2. Why Hyperparameter Tuning?

Machine learning models often have default hyperparameters.

However:

> Default values are generic and are not guaranteed to be optimal for our dataset.

Hyperparameter tuning helps us search for a configuration that performs well.

But:

> **More tuning ≠ automatically better.**

Over-tuning can lead to:

* Overfitting the validation/CV process
* Unstable performance
* Large computational cost
* Unnecessarily complex models

### Goal

> Find a configuration that **generalizes well to unseen data**.

---

# 🔎 3. GridSearchCV

`GridSearchCV` systematically tests combinations of hyperparameters using cross-validation.

Conceptual workflow:

```text
Parameter Grid
      ↓
Combination 1
      ↓
Cross Validation
      ↓
Metric
      ↓
Combination 2
      ↓
Cross Validation
      ↓
Metric
      ↓
...
      ↓
Best Combination
```

Example parameter grid:

```python
param_grid = {
    "model__n_estimators": [100, 200],
    "model__max_depth": [None, 10, 20],
    "model__min_samples_split": [2, 5]
}
```

If the model is inside a Pipeline, parameters can be accessed using:

```text
model__parameter_name
```

The double underscore connects the **Pipeline step name** with the **model's parameter**.

---

# 📦 4. Search Space

A search space defines the hyperparameter values that we want to investigate.

### Random Forest

Possible hyperparameters:

* `n_estimators`
* `max_depth`
* `min_samples_split`
* `min_samples_leaf`
* `max_features`
* `class_weight`

### Logistic Regression

Possible hyperparameters:

* `C`
* `penalty`
* `solver`

### KNN

Possible hyperparameters:

* `n_neighbors`
* `weights`
* `p`

### Decision Tree

Possible hyperparameters:

* `max_depth`
* `min_samples_split`
* `min_samples_leaf`
* `criterion`

### Important

Avoid creating unnecessarily huge grids.

A larger search space means:

> More combinations → more computation → more time.

A good data scientist creates a **reasonable, meaningful search space**.

---

# 🎲 5. RandomizedSearchCV

`RandomizedSearchCV` searches by sampling a specified number of hyperparameter combinations from the search space.

## GridSearchCV

Tests **every combination**.

## RandomizedSearchCV

Tests **a selected number of combinations**.

For example, a grid containing:

```text
10 × 10 × 10 × 10
```

contains:

```text
10,000 combinations
```

Testing every combination can become computationally expensive.

RandomizedSearchCV can be more practical when:

* The search space is large
* Many hyperparameters exist
* Computational resources are limited

---

# 🔄 6. Cross-Validation During Tuning

An important point:

> **GridSearchCV itself performs cross-validation.**

For each hyperparameter combination:

```text
Training Folds
      ↓
Validation Fold
      ↓
Metric
      ↓
Repeat for other folds
      ↓
Average CV Score
```

This gives us a more reliable estimate than repeatedly training once and manually checking a single validation split.

---

# 🛡️ 7. Protecting the Test Set

A good workflow is:

```text
X_train / y_train
        ↓
GridSearchCV
        ↓
Cross-Validation
        ↓
Best Hyperparameters
        ↓
Final Model
        ↓
X_test / y_test
        ↓
Final Evaluation
```

The test set should be used **only after selecting the best configuration using training/CV data**.

### Wrong workflow

```text
GridSearchCV
      ↓
Look at Test Score
      ↓
Change Parameter Grid
      ↓
GridSearchCV Again
      ↓
Look at Test Score Again
      ↓
Repeat
```

Repeatedly using the test set to guide decisions turns the test set into a form of validation data.

Therefore:

> **Do not tune based on the test set.**

---

# 📊 8. Choosing the Scoring Metric

The scoring metric used during tuning is an important decision.

For a customer churn problem, accuracy may not always be the best objective.

Possible metrics include:

* Precision
* Recall
* F1
* ROC-AUC
* Average Precision / PR-AUC

The appropriate metric depends on the business problem.

### Example

If missing a churner is very costly:

> Recall may be more important.

If retention campaigns are expensive:

> Precision may matter more.

If the dataset is imbalanced:

> PR-AUC / Average Precision may be particularly useful.

There is **no universally best metric**.

---

# 🧪 9. Multi-Metric Model Evaluation

Suppose:

### Model A

```text
CV F1      = 0.72
CV ROC-AUC = 0.84
```

### Model B

```text
CV F1      = 0.75
CV ROC-AUC = 0.83
```

We should not automatically select a model using only one metric.

We need to consider:

* Business requirements
* Precision
* Recall
* F1
* ROC-AUC
* PR-AUC where appropriate
* Cross-validation performance
* Stability
* Interpretability
* Complexity
* Generalization

---

# 📈 10. Logistic Regression Tuning

One important Logistic Regression hyperparameter is:

```text
C
```

Intuitively, `C` controls the strength of regularization.

### Smaller C

Stronger regularization.

This can make the model simpler and may reduce overfitting.

### Larger C

Weaker regularization.

The model can fit the training data more closely, which can increase the risk of overfitting.

The goal is to find an appropriate value rather than simply choosing the largest or smallest value.

---

# 🌳 11. Random Forest Tuning

Important Random Forest hyperparameters:

### `n_estimators`

Controls the number of trees in the forest.

Increasing it generally increases computational cost.

### `max_depth`

Controls the maximum depth of individual trees.

Greater depth can make trees more complex.

### `min_samples_split`

Controls the minimum number of samples required to split an internal node.

### `min_samples_leaf`

Controls the minimum number of samples required in a leaf.

Increasing it can make the model less complex.

### `max_features`

Controls how many features are considered when looking for a split.

### `class_weight`

Can be useful when dealing with class imbalance.

---

# 👥 12. KNN Tuning

Important KNN hyperparameters include:

* `n_neighbors`
* `weights`
* `p`

## Small K

A small value of K makes the model more sensitive to individual observations.

This can lead to:

> Higher variance → potential overfitting.

## Large K

A large value of K creates a smoother decision boundary.

This can lead to:

> Higher bias → potential underfitting.

Therefore, we need to find an appropriate value of K.

---

# 🏢 13. Customer Churn Project

Day 76 is the **Hyperparameter Tuning milestone** for the Customer Churn Prediction System.

Instead of blindly tuning every model, first identify the most promising models based on:

* CV F1
* Recall
* Precision
* ROC-AUC
* Stability

Then tune only the most promising **1–2 models first**.

### Recommended order

1. Logistic Regression
2. Random Forest

Another model can be tuned if there is a clear reason.

---

# 📓 14. Notebook

Create:

```text
03_hyperparameter_tuning.ipynb
```

The notebook should contain:

1. Baseline results
2. Selected models for tuning
3. Reason for selecting them
4. Parameter search spaces
5. GridSearchCV
6. RandomizedSearchCV where appropriate
7. CV scoring metric
8. Best parameters
9. Best CV score
10. Test-set performance
11. Comparison with untuned model
12. Interpretation of results

---

# 🧪 15. Tuning Results

### Example 1

```text
Untuned Random Forest:
CV F1   = 0.70
Test F1 = 0.68

Tuned Random Forest:
CV F1   = 0.74
Test F1 = 0.73
```

This provides evidence that tuning helped because both CV and test performance improved.

However, we still need to consider stability and other evaluation metrics.

---

### Example 2

```text
Untuned:
CV F1   = 0.70
Test F1 = 0.68

Tuned:
CV F1   = 0.80
Test F1 = 0.67
```

This result should make us investigate:

* Overfitting
* CV instability
* Search overfitting
* Data leakage
* Metric mismatch
* Train/test distribution differences

A much higher CV score does **not automatically mean** the tuned model is better.

---

# 🔐 16. Core Rule

The most important rule from today:

> **Never use the test set to guide hyperparameter tuning.**

Correct:

```text
Training Data
      ↓
Cross-Validation
      ↓
Hyperparameter Tuning
      ↓
Best Configuration
      ↓
Final Test Evaluation
```

---

# 🎯 Day 76 Deliverables

By the end of today, I should be able to:

* [ ] Understand parameters vs hyperparameters
* [ ] Understand why hyperparameter tuning is necessary
* [ ] Understand GridSearchCV
* [ ] Understand RandomizedSearchCV
* [ ] Design reasonable search spaces
* [ ] Understand scoring metrics during tuning
* [ ] Understand CV inside hyperparameter tuning
* [ ] Protect the test set
* [ ] Tune at least one model
* [ ] Compare tuned vs untuned performance
* [ ] Create `03_hyperparameter_tuning.ipynb`
* [ ] Document tuning decisions
* [ ] Complete interview practice
* [ ] Apply to 10 internships
* [ ] Make 5 LinkedIn connections
* [ ] Send 1–2 personalized recruiter/alumni messages
* [ ] Post Day 76 progress

---

# 💼 Internship Preparation

### Today's Targets

* [ ] Apply to 10 internships
* [ ] Make 5 relevant LinkedIn connections
* [ ] Send 1–2 personalized recruiter/alumni messages

### Resume / LinkedIn Improvement

Improve one project bullet by adding a **measurable result** from the Customer Churn project.

Focus on:

> What did I build + what technique did I use + what measurable result did I achieve?

---

# 🚀 Portfolio Task

Add a professional **Hyperparameter Tuning** section to the Customer Churn project README.

Document:

* Models considered
* Why models were selected for tuning
* Search spaces
* CV scoring metric
* Best parameters
* Untuned vs tuned performance
* Why the final configuration was selected

---

# 🐙 GitHub Task

Create:

```text
03_hyperparameter_tuning.ipynb
```

Keep the notebook clean and professional.

Use clear sections such as:

```text
1. Problem
2. Baseline
3. Model Selection
4. Search Space
5. GridSearchCV
6. RandomizedSearchCV
7. Results
8. Final Evaluation
9. Interpretation
```

---

# 💼 LinkedIn

### Post Idea

Share what you learned about **hyperparameter tuning** and why blindly increasing model complexity is not the same as improving generalization.

### Caption

Today I learned that improving an ML model isn't about blindly increasing parameters.

Day 76 focused on Hyperparameter Tuning, GridSearchCV, RandomizedSearchCV, CV, scoring metrics, and protecting the test set.

The goal: better generalization, not just a higher score.

---

# 𝕏 X Post

### Post Idea

Share the key lesson:

> Hyperparameter tuning is not “make the model more complex.” It is systematic search for a configuration that generalizes well.

Keep the final post under 200 characters.

---

# 🎤 Interview Questions

Practice answering these without looking at notes:

1. What is the difference between parameters and hyperparameters?
2. What is GridSearchCV?
3. What is RandomizedSearchCV?
4. When would you prefer RandomizedSearchCV?
5. Why use cross-validation during tuning?
6. Why should the test set not be used during hyperparameter selection?
7. What does `C` mean in Logistic Regression?
8. What does `max_depth` control in a Decision Tree?
9. What happens when K is very small in KNN?
10. How would you tune a Random Forest?
11. How do you choose the scoring metric for tuning?
12. Can hyperparameter tuning cause overfitting?

---

# 🧠 Success Criteria

I should be able to clearly explain:

### 1. Parameters vs Hyperparameters

> What is the difference between a model parameter and a hyperparameter?

### 2. Search Strategies

> What is the difference between GridSearchCV and RandomizedSearchCV?

### 3. Test-Set Protection

> Why should the test set NEVER guide my hyperparameter search?

### 4. Real-World Decision Making

> How would I choose a hyperparameter search space and scoring metric for a customer churn problem?

---

# 🔥 Day 76 Core Takeaway

> **Hyperparameter tuning is not about finding the model with the highest score on the test set.**

It is about:

```text
Choose a sensible search space
          ↓
Use Cross-Validation
          ↓
Optimize the right metric
          ↓
Select the best configuration
          ↓
Evaluate ONCE on the test set
          ↓
Check generalization + business impact
```

**Day 76 — Hyperparameter Tuning complete.**
