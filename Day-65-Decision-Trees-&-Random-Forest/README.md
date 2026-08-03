# 🌳 Day 65 – Decision Trees & Random Forest | 90-Day Data Science Journey

## 📌 Overview

Today, I learned two of the most powerful tree-based machine learning algorithms: **Decision Tree** and **Random Forest**. I explored how decision trees split data using **Entropy**, **Information Gain**, and **Gini Impurity**, and how Random Forest improves performance by combining multiple decision trees through **Bagging** and **Bootstrap Sampling**.

I also trained and evaluated both models using the **Breast Cancer Wisconsin Dataset** from Scikit-learn, compared their performance, tuned important hyperparameters, and analyzed feature importance.

---

## 📚 Topics Covered

### 🌳 Decision Tree

* What is a Decision Tree?
* Decision Tree intuition
* Root Node, Internal Node & Leaf Node
* Tree splitting process
* Entropy
* Information Gain
* Gini Impurity
* Maximum Depth
* Pre-pruning & Post-pruning
* Overfitting in Decision Trees
* Advantages & Disadvantages
* Real-world business applications

### 🌲 Random Forest

* Why a single Decision Tree is unstable
* Ensemble Learning
* Bagging
* Bootstrap Sampling
* Random Feature Selection
* Voting Mechanism
* Feature Importance
* Hyperparameter Tuning
* Advantages & Disadvantages
* Business applications

---

## 💻 Practical Implementation

### Decision Tree

* Loaded the Breast Cancer Wisconsin Dataset
* Performed Train-Test Split
* Trained a Decision Tree Classifier
* Visualized the Decision Tree
* Generated predictions
* Evaluated using:

  * Accuracy
  * Precision
  * Recall
  * F1 Score
  * Confusion Matrix
* Experimented with different `max_depth` values
* Observed underfitting and overfitting

### Random Forest

* Trained a Random Forest Classifier
* Tuned:

  * `n_estimators`
  * `max_depth`
  * `min_samples_split`
* Compared results with Decision Tree
* Displayed Feature Importance
* Visualized the Top Important Features

---

## 🛠️ Libraries Used

* Python
* NumPy
* Pandas
* Matplotlib
* Scikit-learn

---

## 🎯 Key Learnings

* Understood how Decision Trees make decisions.
* Learned how Entropy and Gini measure node impurity.
* Explored Information Gain for selecting the best split.
* Learned why Decision Trees can easily overfit.
* Understood how Random Forest reduces overfitting using Bagging.
* Learned Bootstrap Sampling and Random Feature Selection.
* Compared Decision Tree, Random Forest, and Logistic Regression.
* Interpreted Feature Importance to understand influential features.

---

## 🚀 Skills Gained

* Tree-based Machine Learning
* Classification Modeling
* Hyperparameter Tuning
* Ensemble Learning
* Feature Importance Analysis
* Model Evaluation
* Tree Visualization
* Scikit-learn Workflow

---

## 📊 Algorithms Used

* Decision Tree Classifier
* Random Forest Classifier
* Logistic Regression (Comparison)

---

## 📁 Dataset

**Breast Cancer Wisconsin Dataset** (Scikit-learn)

* Samples: 569
* Features: 30
* Target Classes:

  * Malignant
  * Benign

---

## 🎯 Outcome

By completing Day 65, I gained practical experience with tree-based machine learning algorithms, understood how they make predictions, learned techniques to control overfitting, compared multiple classification models, and interpreted feature importance to build more accurate and explainable predictive models.

---

## 🔥 Next Step

➡️ Day 66: Support Vector Machine (SVM)
