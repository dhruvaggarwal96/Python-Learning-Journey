# 🏠 House Price Prediction Using Linear Regression

An end-to-end Machine Learning project using the **California Housing dataset** and a Linear Regression baseline to predict median house values.

## 📌 Project Objective

Build a complete regression workflow covering:

- Data loading
- Data inspection
- Data quality checks
- Exploratory Data Analysis
- Feature engineering
- Train-test split
- Feature scaling
- Linear Regression
- Model evaluation
- Business insights

## 🗂️ Dataset

The project uses the California Housing dataset provided through `scikit-learn`.

The dataset contains **20,640 observations and 9 original columns**, including the target `MedHouseVal`.

## 🛠️ Tech Stack

- Python
- Pandas
- NumPy
- Matplotlib
- Seaborn
- Scikit-learn
- Jupyter Notebook

## 🔎 Workflow

```text
Data Loading
     ↓
Data Inspection
     ↓
Data Quality Checks
     ↓
Exploratory Data Analysis
     ↓
Feature Engineering
     ↓
Train-Test Split
     ↓
Feature Scaling
     ↓
Linear Regression
     ↓
Predictions
     ↓
Model Evaluation
     ↓
Business Insights
```

## ⚙️ Feature Engineering

Two additional features were created:

- `RoomsPerPerson`
- `BedroomsPerRoom`

## 🤖 Model

**Linear Regression** was used as the baseline regression model.

The features were standardized using `StandardScaler`. The scaler was fitted only on the training data and then applied to the test data.

## 📊 Model Performance

| Metric | Score |
|---|---:|
| MAE | 0.4862 |
| MSE | 0.4561 |
| RMSE | 0.6753 |
| R² | 0.6519 |

### Interpretation

The model explains approximately **65.2% of the variation** in the target values on the test set.

## 💡 Key Insights

- `MedInc` has the strongest positive linear correlation with `MedHouseVal` in this dataset (approximately 0.69).
- Higher median income is associated with higher house values in the dataset.
- Linear Regression provides a useful baseline but may not capture complex non-linear relationships.

> Correlation indicates association, not causation.

## 🚀 Future Improvements

- Compare Linear Regression with Ridge/Lasso
- Try Random Forest and other non-linear models
- Add cross-validation
- Perform hyperparameter tuning
- Create additional domain-informed features
- Compare multiple models using MAE, RMSE, and R²

## 📁 Repository Structure

```text
House-Price-Prediction/
│
├── House_Price_Prediction_Linear_Regression_GitHub_Ready.ipynb
├── Correlation Heatmap.png
├── house_price_distribution.png
├── README.md
└── requirements.txt
```

## 👨‍💻 Author

**Dhruv**

Part of my 90-Day Data Scientist + Internship Roadmap.
