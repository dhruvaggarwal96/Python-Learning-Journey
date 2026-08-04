# Day 66 – K-Nearest Neighbors (KNN) & Naive Bayes | 90 Days of Data Science 🚀

## 📌 Overview

Day 66 focused on two fundamental supervised machine learning algorithms used for classification: **K-Nearest Neighbors (KNN)** and **Naive Bayes**. I explored how KNN classifies data based on the nearest neighbors using distance metrics, and how Naive Bayes applies probability and Bayes' Theorem to make predictions. I also compared both algorithms using the Breast Cancer Wisconsin dataset.

---

## 📚 Topics Covered

### K-Nearest Neighbors (KNN)

* What is KNN?
* Intuition behind KNN
* Lazy Learning vs Eager Learning
* Distance-Based Learning
* Euclidean Distance
* Manhattan Distance
* Introduction to Minkowski Distance
* Choosing the value of K
* Odd vs Even values of K
* Decision Boundary
* Importance of Feature Scaling
* Curse of Dimensionality
* Time Complexity
* Advantages & Disadvantages
* Business Use Cases

### Naive Bayes

* What is Naive Bayes?
* Intuition behind Naive Bayes
* Bayes' Theorem
* Prior Probability
* Posterior Probability
* Likelihood
* Evidence
* Why it is called "Naive"
* Conditional Independence Assumption
* Gaussian Naive Bayes
* Multinomial Naive Bayes
* Bernoulli Naive Bayes
* Advantages & Disadvantages
* Business Use Cases

---

## 💻 Practical Implementation

### Dataset

* Breast Cancer Wisconsin Dataset (`sklearn.datasets`)

### Workflow

* Loaded the dataset
* Split data into training and testing sets
* Applied Feature Scaling
* Trained KNN Classifier
* Tested multiple values of K:

  * K = 1
  * K = 3
  * K = 5
  * K = 7
  * K = 9
* Compared model performance
* Plotted Accuracy vs K
* Selected the optimal K
* Trained Gaussian Naive Bayes
* Evaluated both models using:

  * Accuracy
  * Precision
  * Recall
  * F1 Score
  * ROC-AUC
  * Classification Report
  * Confusion Matrix

---

## 🔍 Key Learnings

* Understood how KNN predicts using nearby data points.
* Learned the impact of different distance metrics.
* Explored how the choice of K affects bias and variance.
* Understood why feature scaling is essential for distance-based algorithms.
* Learned Bayes' Theorem and probability-based classification.
* Explored the assumptions behind Naive Bayes.
* Compared KNN and Gaussian Naive Bayes on the same dataset.
* Strengthened understanding of model evaluation for classification tasks.

---

## 🛠️ Libraries Used

* Python
* NumPy
* Pandas
* Matplotlib
* Scikit-learn

---

## 📈 Skills Improved

* Supervised Machine Learning
* Classification Algorithms
* Distance Metrics
* Feature Scaling
* Probability & Bayes' Theorem
* Model Evaluation
* Hyperparameter Selection
* Data Preprocessing

---

## 🎯 Outcome

By the end of Day 66, I gained a solid understanding of **K-Nearest Neighbors (KNN)** and **Naive Bayes**, implemented both algorithms in Python, evaluated their performance using multiple classification metrics, and learned when to choose each model for real-world machine learning problems.

---

### 🚀 90 Days of Data Science Challenge

Every day, I'm learning new concepts, building projects, and improving my practical machine learning skills to become a **Data Scientist** and secure a **Data Analyst/Data Science Internship**.

**#Day66 #90DaysOfDataScience**
