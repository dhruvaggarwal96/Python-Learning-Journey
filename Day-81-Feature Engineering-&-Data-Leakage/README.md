# Day 81 — Feature Engineering & Data Leakage


## 🎯 Focus

**Feature Engineering + Data Leakage**

Today I focused on understanding how to create useful features for machine learning while ensuring that the features do not contain information that would only be available after the prediction point.

> 🎓 **College exams are the priority.**
> Data Science work is intentionally kept light and practical.

---

## 📚 Learning Objectives

* Revise practical feature engineering techniques.
* Understand how meaningful features can improve tabular classification models.
* Identify whether a feature is available at prediction time.
* Understand different types of data leakage.
* Connect leakage prevention with `Pipeline` and `ColumnTransformer`.
* Apply leakage-aware thinking to the Customer Churn Prediction project.
* Practice explaining feature engineering and data leakage in interviews.

---

## 🧠 Feature Engineering

Feature engineering is the process of creating, transforming, selecting, or removing features so that machine learning models can learn useful patterns from the data.

### Techniques Revised

#### 1. Creating Meaningful Features

Create a new variable from existing information that represents a useful business concept.

Example:

```python
EstimatedCustomerValue = MonthlyCharges * Tenure
```

**Useful when:** existing variables together represent a meaningful relationship.

**Risk:** the calculation may use information unavailable at prediction time.

---

#### 2. Combining Existing Features

Combine related variables into a more meaningful feature.

Example:

```python
FamilySize = SibSp + Parch + 1
```

**Useful when:** multiple variables describe the same underlying concept.

**Risk:** redundant or highly correlated features may add little value.

---

#### 3. Transformations

Transform the distribution or scale of a feature.

Example:

```python
df["LogIncome"] = np.log1p(df["Income"])
```

**Useful when:** numerical variables are highly skewed.

**Risk:** transformations must be applied consistently and without learning information from the test set.

---

#### 4. Binning

Convert continuous variables into meaningful groups.

Example:

```text
Tenure
0–12       → New
13–36      → Medium
37+        → Long-term
```

**Useful when:** business behavior changes across meaningful ranges.

**Risk:** arbitrary bins can remove useful information.

---

#### 5. Aggregations

Create features such as:

```text
Average spending
Total orders
Number of transactions
Average order value
```

**Useful when:** multiple observations belong to the same customer or entity.

**Risk:** aggregation may accidentally include future information.

---

#### 6. Date/Time Features

Extract useful information from dates.

Examples:

```text
Signup month
Signup year
Days since signup
Customer tenure
```

**Useful when:** customer behavior depends on time.

**Risk:** using future dates or future events can introduce temporal leakage.

---

#### 7. Encoding Categorical Variables

Convert categorical values into numerical representations.

Example:

```python
OneHotEncoder()
```

**Useful when:** machine learning models require numerical inputs.

**Risk:** fitting the encoder on the complete dataset before splitting can leak information.

---

#### 8. Scaling Numerical Features

Transform numerical variables to comparable scales.

Examples:

```python
StandardScaler()
MinMaxScaler()
```

**Useful for:** models such as KNN and Logistic Regression.

**Risk:** calculating scaling statistics using the entire dataset causes preprocessing leakage.

---

#### 9. Removing Irrelevant Features

Remove variables that do not provide meaningful predictive information.

Example:

```text
CustomerID
```

when it is simply an identifier.

**Useful when:** reducing noise and unnecessary complexity.

**Risk:** accidentally removing a legitimate predictive variable.

---

#### 10. Feature Selection

Select the most useful features using:

* Domain knowledge
* Correlation analysis
* Statistical methods
* Model-based importance
* RFE
* L1 regularization

**Useful when:** the dataset contains many variables.

**Risk:** selecting features using the test set can contaminate the final evaluation.

---

# 🚨 Data Leakage

Data leakage happens when information that should not be available to the model during training becomes available to it.

The result is usually an overly optimistic evaluation.

The key question is:

> **Would this information actually be available at the moment the prediction is made?**

---

## Types of Leakage

### 1. Target Leakage

A feature directly or indirectly contains information about the target.

Example:

```text
Churn = Yes
CancellationReason = Price
```

If `CancellationReason` is only recorded after the customer churns, it should not be used to predict churn.

---

### 2. Train/Test Contamination

Information from the test set influences the training process.

Example:

```python
scaler.fit_transform(X)

X_train, X_test = train_test_split(X)
```

The scaler has already learned information from both training and test observations.

---

### 3. Preprocessing Leakage

Example:

```python
df["Income"].fillna(df["Income"].median())
```

before train/test splitting.

The median was calculated using the entire dataset, including the future test set.

---

### 4. Temporal Leakage

Future information is used to predict the past or present.

Example:

```text
Future 3-month spending
```

being used to predict whether a customer will churn today.

---

### 5. Feature Engineering Leakage

A feature appears legitimate but is calculated using information that would not exist at prediction time.

Example:

```text
Lifetime spending
```

being used when predicting churn halfway through the customer's lifetime.

---

# 🔄 Pipeline Thinking

A safe ML workflow is:

```text
Raw Dataset
     ↓
Train/Test Split
     ↓
Training Data
     ↓
Fit Preprocessing
     ↓
Fit Model
     ↓
Evaluate on Test Data
```

Using a pipeline:

```text
SimpleImputer
      ↓
Scaling / Encoding
      ↓
Model
```

helps keep preprocessing and model training together.

With cross-validation, the preprocessing should be fitted separately inside each training fold rather than using information from the entire dataset.

---

# 🚀 Customer Churn Project

## Feature Engineering Audit

Before creating a new feature, I should ask:

1. What does this feature represent?
2. Why might it help predict churn?
3. How will I calculate it?
4. Will it be available at prediction time?
5. Could it introduce data leakage?

### Candidate Features

I will propose at least three possible features from the actual Customer Churn dataset and evaluate each one using the questions above.

The goal is **not** to add features just to make the project bigger.

A feature should be added only when it has:

* Business meaning
* Predictive potential
* Availability at prediction time
* Low leakage risk

---

# 🧪 Leakage Practice

I evaluated these scenarios as **LEAKAGE / NOT LEAKAGE**:

### Scenario 1

Split the data first and calculate the training median for imputing `MonthlyCharges`.

### Scenario 2

Calculate:

```python
TotalCharges / Tenure
```

using the customer's current values.

### Scenario 3

Calculate feature-target correlations on the entire dataset before splitting and use them for feature selection.

### Scenario 4

Create fixed business-defined `TenureGroup` bins before train/test splitting.

### Scenario 5

Use a customer's future 3-month average spending to predict whether they will churn today.

The important principle is to reason about **when the information becomes available**, not just whether the feature seems predictive.

---

# 💻 Practical Workflow

For today's project work:

```text
Customer Churn Dataset
        ↓
Audit Existing Features
        ↓
Identify Potential New Features
        ↓
Check Business Meaning
        ↓
Check Prediction-Time Availability
        ↓
Check Leakage Risk
        ↓
Implement ONE Useful Feature
        ↓
Evaluate
```

If the existing feature engineering is already sufficient, I will document why an additional feature is unnecessary rather than adding complexity without purpose.

---

# 🎤 Interview Practice

Questions practiced:

1. What is feature engineering?
2. Give an example of feature engineering in your churn project.
3. What is data leakage?
4. How can a machine learning pipeline help prevent leakage?
5. How would you know whether a feature is safe to use?

For each answer, the goal is to explain the reasoning rather than memorize definitions.

---

# 💼 Internship Task

Today's internship target:

* [ ] Apply to 1 Data Analyst Intern position
* [ ] Apply to 1 Data Science / ML Intern position
* [ ] Apply to 1 Python/Data or Business Analyst Intern position
* [ ] Optional: Contact 1 recruiter/alumni

### Priority

Quality applications > application quantity.

Because exams are approaching, today's target is only **3 quality applications**.

---

# 📄 Resume / Portfolio

Spend only **15–20 minutes** improving one Customer Churn project component.

Possible improvements:

* [ ] Project title
* [ ] One project bullet
* [ ] Technology list
* [ ] One result statement

No metrics should be invented.

---

# 📱 LinkedIn / X

## Post Topic

**What I learned about data leakage while building a machine learning project**

Key idea:

> A feature being strongly correlated with the target does not automatically make it a good feature.

The important question is:

> **Would this information actually exist when the prediction is made?**

Keep the post authentic and student-level.

---

# 🎯 Day 81 Deliverables

* [ ] Feature engineering revised
* [ ] At least 3 possible churn features identified
* [ ] Feature leakage risks considered
* [ ] 5 leakage scenarios attempted
* [ ] One small feature-engineering improvement completed OR justified why no new feature is needed
* [ ] Pipeline/leakage relationship understood
* [ ] 2 Python questions attempted
* [ ] 2 Pandas questions attempted
* [ ] 2 SQL questions attempted
* [ ] 2 Statistics/ML questions attempted
* [ ] 3 internship applications
* [ ] One small resume/project improvement
* [ ] Up to 5 interview questions practiced
* [ ] One LinkedIn/X post idea prepared

---

# 📊 Day 81 Schedule

| Task                | Recommended Time |
| ------------------- | ---------------: |
| 🎓 College studies  |        4–6 hours |
| 💻 Data Science     |      1.5–2 hours |
| 💼 Internship       |       30 minutes |
| 📄 Resume/Portfolio |    15–20 minutes |
| 📱 LinkedIn/X       |       10 minutes |

**Total DS + career workload:** approximately **2–3 hours**

---

# ✅ Success Criteria

Day 81 is successful if I can confidently answer:

> **"Would this feature genuinely be available at prediction time?"**

and explain why preprocessing the entire dataset before splitting can produce leakage.

The goal is not to build a bigger project.

The goal is to make the existing Customer Churn project **more trustworthy and more scientifically sound**.

---

## 🎓 Priority Reminder

College exams begin on **August 29**.

Therefore:

**College studies > Data Science > Internship applications > Portfolio polishing**

I will keep today's workload light and avoid unnecessary complexity.

---

**Day 81 Focus:**
`Feature Engineering → Prediction-Time Availability → Data Leakage → Pipeline Thinking → Churn Project Audit`
