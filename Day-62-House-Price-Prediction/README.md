# 🏡 House Price Prediction using Linear Regression

## 📌 Project Overview

This project predicts California house prices using **Linear Regression**. It covers the complete Machine Learning workflow, from data loading and exploratory data analysis to model evaluation and business insights.

This project was completed as part of my **90-Day Data Scientist + Internship Roadmap (Day 63 | Week 9 Final Project).**

---

## 📂 Dataset

* **Dataset:** California Housing Dataset
* **Source:** Scikit-learn (`fetch_california_housing`)
* **Records:** 20,640
* **Features:** 8
* **Target Variable:** `MedHouseVal`

---

## 🎯 Project Objectives

* Load and understand the dataset
* Perform data cleaning
* Conduct Exploratory Data Analysis (EDA)
* Create new features
* Scale numerical features
* Split the dataset into training and testing sets
* Train a Linear Regression model
* Evaluate model performance
* Generate business insights

---

## 🛠️ Technologies Used

* Python
* Pandas
* NumPy
* Matplotlib
* Seaborn
* Scikit-learn

---

## 📊 Exploratory Data Analysis

Performed:

* Dataset inspection
* Missing value analysis
* Duplicate value check
* Correlation analysis
* Correlation heatmap
* Target variable distribution
* Boxplot for outlier detection

### Key Findings

* Median Income (`MedInc`) has the strongest positive correlation with house prices.
* Latitude shows the strongest negative correlation with house prices.
* The target variable is positively skewed.
* Outliers are present in house prices.

---

## ⚙️ Feature Engineering

Created new features:

* `RoomsPerPerson`
* `BedroomsPerRoom`

These engineered features provide additional information about house occupancy and room composition.

---

## 🤖 Machine Learning Pipeline

* Feature Scaling using StandardScaler
* Train-Test Split (80:20)
* Linear Regression Model
* Model Prediction

---

## 📈 Model Evaluation

Evaluation Metrics:

* Mean Absolute Error (MAE)
* Mean Squared Error (MSE)
* Root Mean Squared Error (RMSE)
* R² Score

The Linear Regression model achieved moderate predictive performance and explained a significant portion of the variance in house prices.

---

## 💼 Business Insights

* Areas with higher median income generally have higher house prices.
* Income is the most influential feature for predicting house prices.
* The model can support preliminary pricing decisions.
* More advanced models may improve prediction accuracy.

---

## 🚀 Future Improvements

* Random Forest Regressor
* XGBoost Regressor
* Hyperparameter Tuning
* Cross Validation
* Advanced Feature Engineering
* Model Deployment using Streamlit or Flask

---

## 📚 Key Skills Demonstrated

* Data Cleaning
* Exploratory Data Analysis
* Feature Engineering
* Feature Scaling
* Regression Modeling
* Model Evaluation
* Business Insight Generation
* Data Visualization

---

## 👨‍💻 Author

**Dhruv Aggarwal**

**90-Day Data Scientist + Internship Roadmap**

**Day 63 | Week 9 Final Project**
