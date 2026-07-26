# Day 58/90 - Data Scientist + Internship Roadmap 🚀

## Topic: Probability & Normal Distribution

Today I learned the fundamentals of Probability and Distribution concepts that are essential for Statistics and Machine Learning.

---

## 📌 Topics Covered

### 1. Probability Basics

Learned that probability represents the likelihood of an event happening.

Key points:
- Probability range: 0 to 1
- 0 → Impossible event
- 1 → Certain event
- Probability can also be represented as 0% to 100%

Examples:
- 0.5 = 50% chance
- 0.25 = 25% chance

---

## 2. Probability Rules

### AND Probability

Used when both events need to happen.

Formula:

P(A and B) = P(A) × P(B)


### OR Probability

Used when either event can happen.

Formula:

P(A or B) = P(A) + P(B)

---

# 3. Conditional Probability

Learned how probability changes when we already know some information.

Formula:

P(A | B)

Meaning:

Probability of event A happening given that event B has already happened.

Examples:
- Probability of a customer churning given their behavior
- Probability of an email being spam given it contains specific words

Machine Learning Connection:
- Used in Naive Bayes Classification
- Helps calculate probabilities based on previous conditions

---

# 4. Random Variables

Learned that a random variable assigns numerical values to random outcomes.

## Discrete Random Variable

Values that can be counted.

Examples:
- Number of customers
- Number of children
- Number of emails

## Continuous Random Variable

Values that can be measured.

Examples:
- Height
- Salary
- House price

---

# 5. Normal Distribution

Learned about the famous bell-shaped distribution.

Characteristics:

- Symmetric distribution
- Mean = Median = Mode
- Most values are concentrated around the average
- Extreme values are rare

Examples:
- Human height
- IQ scores
- Measurement errors

---

# 6. Empirical Rule (68-95-99.7 Rule)

Learned how data spreads around the mean.
±1 Standard Deviation → 68%
±2 Standard Deviations → 95%
±3 Standard Deviations → 99.7%

Used this rule to calculate ranges in the California Housing dataset.

---

# 7. Python Implementation

Used California Housing Dataset:

```python
from sklearn.datasets import fetch_california_housing

housing = fetch_california_housing(as_frame=True)

df = housing.frame
df['MedHouseVal'].mean()

df['MedHouseVal'].std()
lower = mean_value - std_value
upper = mean_value + std_value
sns.histplot(df['MedHouseVal'], kde=True)
plt.show()
Learned that not every real-world dataset follows a perfect Normal Distribution.

California Housing values showed right-skewness due to high-value houses.

🧠 Machine Learning Connection

Probability and distributions are important for:

Classification algorithms
Feature analysis
Data preprocessing
Outlier detection
Model assumptions
Statistical inference

Algorithms using probability concepts:

Naive Bayes
Logistic Regression
Gaussian Mixture Models
