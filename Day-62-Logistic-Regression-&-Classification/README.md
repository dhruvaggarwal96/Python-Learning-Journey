# Day 62 - Logistic Regression & Classification 📊

## 🚀 Overview

Today I learned the fundamentals of **Classification** and built my first **Logistic Regression** model using **scikit-learn**. I understood how Logistic Regression predicts probabilities using the **Sigmoid Function** and evaluated the model using important classification metrics.

---

## 📚 Topics Covered

* Difference between Classification and Regression
* Logistic (Sigmoid) Function
* Odds and Log Odds
* Decision Boundary
* Logistic Regression using scikit-learn
* Accuracy
* Confusion Matrix
* Precision
* Recall
* F1 Score

---

## 💻 Practical Implementation

* Loaded the Breast Cancer Wisconsin Dataset
* Explored features and target classes
* Counted class distribution using NumPy
* Implemented the Sigmoid Function from scratch using Python
* Calculated Odds from probabilities
* Applied a Decision Boundary (0.5 threshold)
* Split data into training and testing sets
* Trained a Logistic Regression model
* Generated predictions on test data
* Evaluated the model using:

  * Accuracy
  * Confusion Matrix
  * Precision
  * Recall
  * F1 Score

---

## 🧠 Key Concepts Learned

### ✅ Classification vs Regression

* Regression predicts continuous values.
* Classification predicts discrete classes.

### ✅ Sigmoid Function

* Converts any real number into a probability between **0 and 1**.
* Forms an S-shaped curve.
* Used to perform binary classification.

### ✅ Odds & Log Odds

* Odds compare the probability of an event occurring versus not occurring.
* Logistic Regression models **log odds** internally before converting them into probabilities.

### ✅ Decision Boundary

* Default threshold is **0.5**.
* Probability ≥ 0.5 → Class 1
* Probability < 0.5 → Class 0

### ✅ Model Evaluation

* **Accuracy** measures overall correctness.
* **Confusion Matrix** shows TP, TN, FP, and FN.
* **Precision** measures prediction reliability.
* **Recall** measures the ability to detect actual positives.
* **F1 Score** balances Precision and Recall.

---

## 🛠️ Libraries Used

* NumPy
* scikit-learn

---

## 📂 Dataset

* Breast Cancer Wisconsin Dataset (`sklearn.datasets.load_breast_cancer`)

---

## 🎯 Key Takeaways

* Understood why Logistic Regression is used for classification instead of Linear Regression.
* Learned how probabilities are generated using the Sigmoid Function.
* Built a complete binary classification model.
* Learned the importance of evaluation metrics beyond Accuracy.
* Gained practical experience with Logistic Regression in scikit-learn.

---

## 📌 Status

✅ Day 62 Completed

**Progress:** 62/90 Days Completed 🚀
