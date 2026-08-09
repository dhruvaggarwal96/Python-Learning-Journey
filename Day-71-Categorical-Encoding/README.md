# 🚀 Day 71 — Categorical Encoding

## 📅 90-Day Data Scientist + Internship Roadmap

**Week:** 11
**Day:** 71
**Focus:** Categorical Encoding
**Goal:** Become internship-ready for Data Analyst / Data Science roles and eventually become a Data Scientist.

---

## 🎯 Today's Objective

Today I focused on understanding how categorical variables are converted into numerical representations so that Machine Learning models can process them.

### Topics Covered

* Why ML models need numerical representations
* Nominal vs Ordinal categorical variables
* Label Encoding
* One-Hot Encoding
* Ordinal Encoding
* Choosing the correct encoding strategy
* Problems with inappropriate encoding
* Handling unknown categories
* High-cardinality categorical variables
* Encoding inside preprocessing workflows
* Avoiding data leakage during encoding

---

# 🧠 1. Why Do We Need Encoding?

Machine Learning models generally work with numerical inputs.

Real-world datasets often contain categorical values such as:

```text
Gender
Contract
PaymentMethod
InternetService
City
```

For example:

```text
Contract
----------------
Month-to-month
One year
Two year
```

These values need to be transformed into numerical representations before being used by many ML algorithms.

---

# 🔢 2. Nominal vs Ordinal Variables

## Nominal Variables

Nominal categories **do not have a meaningful order**.

Examples:

* Gender
* City
* Payment Method
* Internet Service

For example:

```text
PaymentMethod

Credit card
Bank transfer
Electronic check
```

There is no meaningful ranking between these categories.

---

## Ordinal Variables

Ordinal categories have a **meaningful order**.

Example:

```text
SatisfactionLevel

Low
Medium
High
```

The order:

```text
Low < Medium < High
```

contains useful information.

Therefore, ordinal variables can often be encoded while preserving their natural ordering.

---

# 🏷️ 3. Label Encoding

Label Encoding assigns numerical values to categories.

Example:

```text
Category       Encoded
-----------------------
A                 0
B                 1
C                 2
```

In scikit-learn:

```python
from sklearn.preprocessing import LabelEncoder

encoder = LabelEncoder()

y_encoded = encoder.fit_transform(y)
```

## ⚠️ Important

Label Encoding can be problematic for **nominal input features**.

For example:

```text
City

Delhi      → 0
Mumbai     → 1
Chennai    → 2
```

A model might interpret the numbers as having an ordered or numerical relationship.

But:

```text
Delhi < Mumbai < Chennai
```

has no meaningful mathematical interpretation.

Therefore, blindly applying Label Encoding to nominal features can introduce misleading relationships.

---

# 🔀 4. One-Hot Encoding

One-Hot Encoding creates a separate binary feature for each category.

Example:

```text
PaymentMethod

Credit card
Bank transfer
Electronic check
```

Can become:

```text
Credit_card    Bank_transfer    Electronic_check
-------------------------------------------------
1              0                0
0              1                0
0              0                1
```

Each category receives its own feature.

This avoids creating an artificial numerical ranking between nominal categories.

In scikit-learn:

```python
from sklearn.preprocessing import OneHotEncoder

encoder = OneHotEncoder(
    handle_unknown="ignore"
)
```

---

# 🧩 5. `drop='first'`

One-Hot Encoding can create redundant information when all categories are retained.

For example:

```text
Gender_Male
Gender_Female
```

If one is `1`, the other must be `0`.

A common option is:

```python
OneHotEncoder(
    drop="first",
    handle_unknown="ignore"
)
```

This removes one category from each encoded feature.

---

# 🚨 6. Handling Unknown Categories

A category that was not present during training may appear in test or deployment data.

Example:

Training data:

```text
PaymentMethod

Credit card
Bank transfer
```

Later, deployment data contains:

```text
UPI
```

Using:

```python
handle_unknown="ignore"
```

allows the encoder to handle unseen categories without failing during transformation.

---

# 📊 7. Ordinal Encoding

Ordinal Encoding is useful when categories have a genuine order.

Example:

```text
Education

High School
Bachelor's
Master's
PhD
```

Possible representation:

```text
High School → 0
Bachelor's  → 1
Master's    → 2
PhD         → 3
```

The numerical ordering represents real-world ordering.

In scikit-learn:

```python
from sklearn.preprocessing import OrdinalEncoder

encoder = OrdinalEncoder()
```

However, arbitrary ordinal encoding should **not** be used when categories have no meaningful order.

---

# 📈 8. High-Cardinality Categorical Variables

A categorical variable is high-cardinality when it contains a large number of unique categories.

Examples:

* CustomerID
* City
* ZIP Code
* ProductID

Imagine a feature containing:

```text
5,000 unique cities
```

One-Hot Encoding could create thousands of columns.

This can result in:

* Huge feature spaces
* Memory problems
* Sparse matrices
* Increased risk of overfitting
* Poor generalization

Possible strategies include:

* Dropping irrelevant identifiers
* Grouping rare categories
* Frequency encoding
* Target encoding
* Domain-based grouping

Target encoding was treated conceptually rather than deeply today.

---

# 🔐 9. Avoiding Data Leakage

Encoding should be learned from the **training data**, not from the entire dataset before splitting.

Correct principle:

```text
Train Data
    ↓
FIT encoder
    ↓
Transform Train Data

Test Data
    ↓
Transform using the SAME fitted encoder
```

The test set should not influence how the encoder learns its categories.

This is important for maintaining a realistic evaluation of model performance.

---

# 🏗️ 10. Customer Churn Project

Today's practical focus was the **Customer Churn Prediction System**.

### Categorical features investigated

* Gender
* Contract
* PaymentMethod
* InternetService
* SatisfactionLevel
* City

For each categorical feature, the goal was to investigate:

* Unique categories
* Cardinality
* Nominal vs ordinal classification
* Appropriate encoding strategy
* Potential high-cardinality problems
* Potential leakage concerns

---

# 🧪 11. Encoding Strategy

A general strategy:

| Feature Type                | Typical Encoding            |
| --------------------------- | --------------------------- |
| Nominal                     | One-Hot Encoding            |
| Ordinal                     | Ordinal Encoding            |
| Target                      | Appropriate target encoding |
| High-cardinality identifier | Often drop or transform     |

The correct encoding depends on both the **feature's meaning** and the **ML problem/model**.

---

# 🧠 Key Takeaways

### 1️⃣ Not every categorical feature should be encoded the same way.

The encoding method depends on whether the variable is nominal or ordinal.

### 2️⃣ Label Encoding is not automatically appropriate.

Using arbitrary numbers for nominal categories can create misleading relationships.

### 3️⃣ One-Hot Encoding works well for many nominal features.

It represents categories independently.

### 4️⃣ Ordinal Encoding preserves meaningful order.

It is appropriate when the categories genuinely have an ordered relationship.

### 5️⃣ Unknown categories must be considered.

`handle_unknown="ignore"` can make One-Hot Encoding safer for unseen categories.

### 6️⃣ High cardinality can create problems.

Thousands of categories can produce huge feature spaces.

### 7️⃣ Encoding must avoid data leakage.

The encoder should learn from training data and then transform other datasets.

---

# 💼 Internship Interview Questions Practiced

1. Why shouldn't you always use Label Encoding for categorical features?

2. What is the difference between nominal and ordinal variables?

3. When can One-Hot Encoding create problems?

4. What happens when an unseen category appears during inference?

5. How would you handle a categorical feature with 5,000 unique values?

6. Why should preprocessing be fitted only on training data?

7. What is the difference between encoding the target and encoding input features?

---

# 📌 Day 71 Deliverables

* [x] Understand nominal vs ordinal variables
* [x] Understand Label Encoding
* [x] Understand One-Hot Encoding
* [x] Understand Ordinal Encoding
* [x] Practice choosing appropriate encoding methods
* [x] Understand high-cardinality categorical features
* [x] Understand encoding-related data leakage
* [x] Apply encoding concepts to the Customer Churn project
* [x] Document encoding decisions

---

# 🚀 Next Step

The next stage of the Customer Churn project will build on today's understanding of categorical features and eventually incorporate preprocessing into a more complete ML workflow.

> **Day 71 takeaway:**
> Good Machine Learning isn't just about choosing a model — it starts with representing the data correctly.
