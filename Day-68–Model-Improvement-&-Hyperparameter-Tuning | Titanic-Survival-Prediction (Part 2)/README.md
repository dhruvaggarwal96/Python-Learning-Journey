# Day 68 – Model Improvement & Hyperparameter Tuning | Titanic Survival Prediction (Part 2)

## 📌 Overview

Day 68 focused on improving machine learning model performance through proper validation techniques, hyperparameter tuning, and fair model comparison. Continuing the Titanic Survival Prediction project, I evaluated multiple classification algorithms, applied cross-validation, tuned hyperparameters, and selected the most suitable model for production.

---

## 🎯 Topics Covered

### 📈 Model Improvement

* Why machine learning models don't always perform well
* Bias vs Variance
* Underfitting vs Overfitting
* Diagnosing model performance
* Training Error vs Test Error
* Learning Curves (Introduction)
* Validation Set
* Cross Validation Review
* K-Fold Cross Validation
* Stratified K-Fold Cross Validation
* Choosing the right validation strategy

### ⚙️ Hyperparameter Tuning

* Parameters vs Hyperparameters
* Why Hyperparameter Tuning is important
* GridSearchCV
* RandomizedSearchCV
* Choosing appropriate scoring metrics
* Understanding search spaces
* Best Estimator
* Best Parameters
* Best Cross-Validation Score
* Common tuning mistakes
* Computational cost and optimization

### 🤖 Model Selection

* Fair comparison of multiple models
* Why accuracy alone is not enough
* Business-driven model selection
* Performance vs Interpretability
* Selecting a production-ready model

---

## 🛠 Practical Implementation

### Baseline Models

Trained and evaluated:

* Logistic Regression
* Decision Tree Classifier
* Random Forest Classifier
* K-Nearest Neighbors (KNN)
* Gaussian Naive Bayes

Evaluation Metrics:

* Accuracy
* Precision
* Recall
* F1 Score
* ROC-AUC Score
* Confusion Matrix

---

### Cross Validation

Implemented:

* K-Fold Cross Validation
* Stratified K-Fold Cross Validation

Compared average cross-validation scores across all baseline models to evaluate model stability and generalization.

---

### Hyperparameter Tuning

Applied GridSearchCV for:

#### Logistic Regression

* C
* penalty
* solver

#### Decision Tree

* max_depth
* min_samples_split
* min_samples_leaf

#### Random Forest

* n_estimators
* max_depth
* min_samples_split

#### KNN

* n_neighbors
* weights
* metric

Also explored the basics of RandomizedSearchCV for efficient hyperparameter optimization.

---

### Model Comparison

Compared models based on:

* Default Performance
* Tuned Performance
* Cross-Validation Score
* Training Time
* Prediction Time
* Advantages
* Disadvantages

Selected the most suitable model considering both predictive performance and business requirements.

---

### Feature Importance

Analyzed feature importance for tree-based models to identify the strongest factors influencing Titanic passenger survival.

---

## 🧠 Key Learnings

* High training accuracy does not always indicate a good model.
* Cross-validation provides a more reliable estimate of model performance.
* Stratified K-Fold is preferred for imbalanced classification datasets.
* Hyperparameter tuning can significantly improve model performance.
* GridSearchCV performs exhaustive search, while RandomizedSearchCV is computationally efficient.
* Model selection should balance performance, interpretability, and business objectives.
* Feature importance helps explain model decisions and improves interpretability.

---

## 🧰 Libraries Used

* pandas
* numpy
* matplotlib
* scikit-learn

Modules:

* Pipeline
* ColumnTransformer
* GridSearchCV
* RandomizedSearchCV
* KFold
* StratifiedKFold
* cross_val_score
* LogisticRegression
* DecisionTreeClassifier
* RandomForestClassifier
* KNeighborsClassifier
* GaussianNB
* sklearn.metrics

---

## 📊 Skills Improved

* Model Evaluation
* Cross Validation
* Hyperparameter Tuning
* Model Selection
* Performance Comparison
* Feature Importance Analysis
* Production-Oriented Machine Learning Workflow

---

## 🚀 Outcome

Successfully compared multiple classification models, validated them using cross-validation, optimized performance through hyperparameter tuning, interpreted feature importance, and selected the most suitable production-ready model for the Titanic Survival Prediction project.

---

## 📂 Project

**Titanic Survival Prediction (Part 2): Model Improvement & Hyperparameter Tuning**

---

### 🌟 Day 68 Complete!

Every model can make predictions, but great Data Scientists know how to validate, optimize, compare, and confidently justify why one model is the best choice for production.
