# 🏠 House Price Prediction using Linear Regression

## 📌 Project Overview

This project demonstrates the complete Machine Learning workflow using the California Housing dataset from Scikit-learn. The objective is to build a Linear Regression model that predicts median house prices based on housing-related features.

This project covers the complete pipeline from loading the dataset to evaluating the model using standard regression metrics.

---

## 🎯 Objective

- Understand the complete Scikit-learn workflow
- Build a Linear Regression model
- Predict house prices
- Evaluate model performance using regression metrics

---

## 📂 Dataset

**Dataset:** California Housing Dataset

- Source: Scikit-learn
- Total Samples: **20,640**
- Features: **8**
- Target Variable: **MedHouseVal**

### Features

- MedInc
- HouseAge
- AveRooms
- AveBedrms
- Population
- AveOccup
- Latitude
- Longitude

### Target

- MedHouseVal (Median House Value)

---

## 🛠️ Technologies Used

- Python
- Pandas
- NumPy
- Scikit-learn

---

## 📚 Machine Learning Workflow

### 1. Load Dataset

Loaded the California Housing dataset using:

```python
from sklearn.datasets import fetch_california_housing
```

Converted it into a Pandas DataFrame.

---

### 2. Data Understanding

- Checked dataset shape
- Explored feature names
- Viewed first five rows

Dataset Shape:

```
(20640, 9)
```

---

### 3. Feature & Target Separation

Created:

```python
X = df.drop("MedHouseVal", axis=1)
y = df["MedHouseVal"]
```

Feature Shape:

```
(20640, 8)
```

Target Shape:

```
(20640,)
```

---

### 4. Train-Test Split

Split the dataset into:

- Training Data (80%)
- Testing Data (20%)

Using:

```python
train_test_split(
    X,
    y,
    test_size=0.2,
    random_state=42
)
```

Training Shape:

```
(16512, 8)
```

Testing Shape:

```
(4128, 8)
```

---

### 5. Model Training

Built the first Machine Learning model using Linear Regression.

```python
from sklearn.linear_model import LinearRegression

model = LinearRegression()

model.fit(X_train, y_train)
```

The model learned relationships between housing features and house prices.

---

### 6. Predictions

Generated predictions on unseen test data.

```python
y_pred = model.predict(X_test)
```

---

### 7. Model Evaluation

Evaluated the model using four standard regression metrics.

| Metric | Value |
|----------|---------|
| MAE | **0.5332** |
| MSE | **0.5559** |
| RMSE | **0.7456** |
| R² Score | **0.5758** |

---

## 📈 Interpretation

### Mean Absolute Error (MAE)

Average prediction error:

```
≈ 0.5332
```

Approximately **$53,320** average error.

---

### Mean Squared Error (MSE)

Measures squared prediction error.

```
0.5559
```

Lower values indicate better performance.

---

### Root Mean Squared Error (RMSE)

Average prediction error in the original target scale.

```
0.7456
```

Approximately **$74,560** average prediction error.

---

### R² Score

```
0.5758
```

The model explains approximately **57.58%** of the variance in house prices.

---

## 📌 Key Learnings

During this project, I learned:

- Complete Scikit-learn workflow
- Loading built-in datasets
- Feature and target separation
- Train-Test Split
- Training a Linear Regression model
- Making predictions
- Evaluating regression models
- Understanding MAE, MSE, RMSE, and R² Score
- Interpreting Machine Learning model performance

---

## 🚀 Future Improvements

- Feature Engineering
- Cross Validation
- Polynomial Regression
- Decision Tree Regression
- Random Forest Regression
- Hyperparameter Tuning
- Model Comparison

---

## 📷 Sample Output

```
MAE  : 0.5332
MSE  : 0.5559
RMSE : 0.7456
R²   : 0.5758
```

---

## 🎯 Conclusion

This project marks my first complete Machine Learning implementation using Scikit-learn.

I successfully built, trained, and evaluated a Linear Regression model for predicting California house prices. This project strengthened my understanding of the complete Machine Learning workflow and regression model evaluation.

---

## 👨‍💻 Author

**Dhruv Aggarwal**

### Connect with me

- GitHub: https://github.com/dhruvaggarwal96
- LinkedIn: www.linkedin.com/in/dhruv-aggarwal-961ba4287

---

⭐ If you found this project helpful, consider giving it a star!
