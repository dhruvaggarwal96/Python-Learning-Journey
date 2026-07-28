# Day 60/90 - Feature Scaling Basics 🚀

## 📌 Topic: Why Feature Scaling Matters

Today I started preparing data for Machine Learning by understanding the importance of **Feature Scaling**.

Feature Scaling is an important preprocessing step that transforms features into a similar numerical range so that Machine Learning algorithms can treat all features fairly.

---

## 🧠 Why Feature Scaling is Needed?

Machine Learning algorithms like:

- KNN
- K-Means
- SVM
- Neural Networks
- PCA

use distance calculations or optimization techniques.

When features have different scales, larger numerical values can dominate the model.

Example:

| Feature | Range |
|---------|-------|
| Population | 3 - 35,000 |
| HouseAge | 1 - 52 |

Here, Population has much larger values than HouseAge.

Without scaling, the model may give more importance to Population simply because its numbers are bigger, not because it is more important.

---

## 📊 Real-World Example

Imagine predicting house prices using:

- Population
- House Age

Population values may be in thousands, while House Age values are only in years.

The difference in scale can create bias in distance-based algorithms.

Feature Scaling solves this problem by bringing features to a comparable scale.

---

## ⚙️ Algorithms That Need Feature Scaling

### Usually Require Scaling:

✅ K-Nearest Neighbors (KNN)  
✅ K-Means Clustering  
✅ Support Vector Machines (SVM)  
✅ Logistic Regression  
✅ Neural Networks  
✅ Principal Component Analysis (PCA)

---

## 🌳 Algorithms That Usually Don't Need Scaling

Tree-based algorithms generally do not require feature scaling:

✅ Decision Tree  
✅ Random Forest  
✅ XGBoost  
✅ LightGBM  
✅ CatBoost  

Reason:

Tree models split data based on feature values rather than calculating distances.

---

## 🔍 Practical Analysis - California Housing Dataset

Checked feature ranges using:

```python
df.agg(['min', 'max']).T
Calculated feature ranges:
df_min_max = df.agg(['min', 'max']).T

df_min_max['range'] = (
    df_min_max['max'] - df_min_max['min']
)

df_min_max['range'].idxmax()
df_min_max['range'].idxmin()
This helped identify features with very different scales.
