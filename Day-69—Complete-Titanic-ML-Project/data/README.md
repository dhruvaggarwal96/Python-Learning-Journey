# Titanic Survival Prediction

## Project Overview

This project builds a supervised machine-learning classification system to predict whether a Titanic passenger survived based on available passenger information.

The project demonstrates a complete machine-learning workflow, including exploratory data analysis, data cleaning, feature engineering, preprocessing, model comparison, cross-validation, hyperparameter tuning, evaluation, feature interpretation, and final model selection.

---

## Business Problem

### Problem Statement

Can we predict whether a Titanic passenger survived based on information such as age, sex, passenger class, fare, and embarkation point?

### Objective

The primary objective is to build a classification model that can identify survivors accurately.

Because the project emphasizes identifying as many actual survivors as possible, **Recall** is treated as the primary evaluation metric.

### Machine Learning Problem

* **Problem type:** Binary Classification
* **Target variable:** `Survived`
* **Positive class:** `1` — Survived
* **Negative class:** `0` — Did not survive

---

## Dataset

The project uses the Titanic passenger dataset stored locally as `train.csv`.

The dataset contains passenger-level information used to predict the `Survived` target.

Important features include:

* `Pclass`
* `Sex`
* `Age`
* `SibSp`
* `Parch`
* `Fare`
* `Embarked`

---

## Technologies Used

* Python
* Pandas
* NumPy
* Matplotlib
* Scikit-learn
* Jupyter Notebook

---

## Project Workflow

The project follows this workflow:

```text
Problem Definition
        ↓
Data Loading & Understanding
        ↓
Exploratory Data Analysis
        ↓
Data Cleaning
        ↓
Feature Engineering
        ↓
Train/Test Split
        ↓
Preprocessing
        ↓
Model Training
        ↓
Model Evaluation
        ↓
Cross Validation
        ↓
Hyperparameter Tuning
        ↓
Model Comparison
        ↓
Final Model Selection
        ↓
Feature Interpretation
        ↓
Business Insights
```

---

## Data Understanding

Initial inspection included:

* Dataset shape
* Column names
* Data types
* Missing values
* Duplicate records
* Descriptive statistics
* Target distribution

The data was inspected before modeling to understand the structure and quality of the dataset.

---

## Exploratory Data Analysis

The analysis focused on understanding relationships between passenger characteristics and survival.

Key areas investigated include:

* Survival distribution
* Survival by gender
* Survival by passenger class
* Age and survival
* Fare and survival
* Embarkation point and survival
* Family size and survival
* Gender and passenger class

The goal of the EDA was not only to visualize the data, but also to identify useful patterns that could inform feature engineering and model development.

---

## Feature Engineering

Two derived features were used:

### FamilySize

```python
df["FamilySize"] = df["SibSp"] + df["Parch"] + 1
```

This combines the number of siblings/spouses and parents/children into a single family-size feature.

### IsAlone

```python
df["IsAlone"] = (df["FamilySize"] == 1).astype(int)
```

This indicates whether a passenger was traveling alone.

These features provide additional information about a passenger's family situation.

---

## Data Preprocessing

The preprocessing workflow was implemented using `Pipeline` and `ColumnTransformer`.

### Numerical Features

* `Age`
* `Fare`

Processing:

1. Median imputation
2. Standard scaling

### Categorical Features

* `Sex`
* `Embarked`
* `Pclass`

Processing:

1. Most-frequent imputation
2. One-Hot Encoding

The encoder used:

```python
OneHotEncoder(
    handle_unknown="ignore",
    sparse_output=False
)
```

### Why use a Pipeline?

Using a pipeline ensures that preprocessing is learned from the training data and consistently applied to validation, test, and new data.

This also helps prevent data leakage.

---

## Train/Test Split

The dataset was split into:

* **80% training data**
* **20% test data**

Stratification was used:

```python
train_test_split(
    X,
    y,
    test_size=0.2,
    random_state=42,
    stratify=y
)
```

Using `stratify=y` preserves approximately the same target-class proportions in the training and test sets.

---

## Models Used

Five baseline classification models were compared:

1. Logistic Regression
2. Decision Tree
3. Random Forest
4. K-Nearest Neighbors (KNN)
5. Gaussian Naive Bayes

---

## Evaluation Metrics

The models were evaluated using:

* Accuracy
* Precision
* Recall
* F1 Score
* ROC-AUC
* Confusion Matrix

### Primary Metric

**Recall** was treated as the primary metric because identifying as many actual survivors as possible was the main project objective.

---

## Baseline Model Comparison

| Model                |   Accuracy |  Precision |     Recall |         F1 |    ROC-AUC | Mean CV Recall |
| -------------------- | ---------: | ---------: | ---------: | ---------: | ---------: | -------------: |
| Logistic Regression  |     0.7710 |     0.7188 |     0.6667 |     0.6917 |     0.8343 |         0.6958 |
| Decision Tree        |     0.7989 |     0.7463 |     0.7246 |     0.7353 |     0.7791 |         0.7104 |
| Random Forest        | **0.8156** |     0.7813 | **0.7246** |     0.7519 |     0.8442 |         0.7454 |
| KNN                  | **0.8268** | **0.8276** |     0.6957 | **0.7559** | **0.8626** |         0.7192 |
| Gaussian Naive Bayes |     0.7654 |     0.6901 |     0.7101 |     0.7000 |     0.8108 |     **0.7486** |

---

## Cross Validation

Five-fold cross-validation was used to estimate model performance across multiple training and validation folds.

Recall was used as the scoring metric.

### Mean CV Recall

* Logistic Regression: **0.6958**
* Decision Tree: **0.7104**
* Random Forest: **0.7454**
* KNN: **0.7192**
* Gaussian Naive Bayes: **0.7486**

Gaussian Naive Bayes achieved the highest baseline mean CV recall, while Random Forest was very close.

Random Forest had a stronger overall test-set performance.

---

## Hyperparameter Tuning

Basic hyperparameter tuning was performed using `GridSearchCV`.

### Random Forest

Parameters investigated included:

* `n_estimators`
* `max_depth`
* `min_samples_leaf`
* `min_samples_split`

The best parameters found were:

```text
n_estimators = 300
max_depth = None
min_samples_leaf = 1
min_samples_split = 2
```

The tuned Random Forest achieved a CV recall of:

```text
0.7367
```

Its test recall was:

```text
0.7101
```

This was lower than the baseline Random Forest.

Therefore, the tuned Random Forest was **not selected**.

### Gaussian Naive Bayes

`var_smoothing` was tuned using `GridSearchCV`.

Best parameter:

```text
var_smoothing = 1e-11
```

Best CV recall:

```text
0.7583
```

However, the tuned Gaussian Naive Bayes produced the same test metrics as the baseline:

```text
Accuracy: 0.7654
Precision: 0.6901
Recall: 0.7101
F1: 0.7000
ROC-AUC: 0.8108
```

Therefore, the increase in CV recall did not translate into improved unseen-test performance.

---

## Final Model

### Selected Model: Random Forest

The **baseline Random Forest** was selected as the final model.

### Why Random Forest?

The decision was based on:

* Recall being the primary business metric
* Highest test recall jointly with Decision Tree: **0.7246**
* Strong accuracy: **0.8156**
* Strong precision: **0.7813**
* Strong F1 score: **0.7519**
* Strong ROC-AUC: **0.8442**
* Mean CV recall: **0.7454**
* Reasonable agreement between CV and test performance

The baseline Random Forest also outperformed the tuned Random Forest on the primary test metric.

### Final Model Results

```text
Accuracy : 0.8156
Precision: 0.7813
Recall   : 0.7246
F1 Score: 0.7519
ROC-AUC : 0.8442
CV Recall: 0.7454
```

---

## Feature Importance

Random Forest feature importance was used to understand which transformed features contributed most to the model's decisions.

### Top Features

| Feature      | Importance |
| ------------ | ---------: |
| `Fare`       |     0.2962 |
| `Age`        |     0.2771 |
| `Sex_male`   |     0.1448 |
| `Sex_female` |     0.1446 |
| `Pclass_3`   |     0.0573 |
| `Pclass_1`   |     0.0325 |
| `Pclass_2`   |     0.0146 |
| `Embarked_S` |     0.0145 |
| `Embarked_C` |     0.0102 |
| `Embarked_Q` |     0.0083 |

### Interpretation

`Fare` and `Age` were the two most important individual transformed features, followed by the encoded `Sex` features.

Feature importance indicates how useful features were to the Random Forest's decision-making process. It does **not** by itself establish causation or the direction of a relationship.

---

## Key Data Insights

### 1. Gender and Survival

Female passengers had a substantially higher survival rate than male passengers. Gender was therefore an important variable associated with survival.

### 2. Passenger Class and Survival

Passenger class was strongly associated with survival, with survival outcomes differing across passenger classes.

### 3. Age and Survival

Age showed meaningful differences in survival outcomes and was also one of the most important individual features in the Random Forest model.

### 4. Fare and Survival

`Fare` had the highest individual Random Forest feature importance at approximately **0.296**, indicating that fare information provided substantial predictive value.

### 5. Family Structure

Family-related features such as `FamilySize` and `IsAlone` can capture whether passengers were traveling alone or with relatives and provide additional information for prediction.

---

## Confusion Matrix

A confusion matrix was used to examine:

* True Positives
* True Negatives
* False Positives
* False Negatives

This is especially useful when recall is important because false negatives directly affect recall.

---

## Project Structure

```text
titanic-survival-prediction/
│
├── data/
│   └── README.md
│
├── notebooks/
│   └── titanic_survival_prediction.ipynb
│
├── visualizations/
│   └── feature_importance.png
│
├── README.md
├── requirements.txt
└── .gitignore
```

For the current project, a simple structure is sufficient. Production-style `src/` and `models/` directories can be introduced later if the project grows.

---

## Installation

Clone the repository:

```bash
git clone <your-github-repository-url>
cd titanic-survival-prediction
```

Create a virtual environment:

```bash
python -m venv venv
```

Activate the environment.

### Windows

```bash
venv\Scripts\activate
```

### macOS/Linux

```bash
source venv/bin/activate
```

Install dependencies:

```bash
pip install -r requirements.txt
```

---

## Requirements

The project uses:

```text
pandas
numpy
matplotlib
scikit-learn
```

---

## How to Run

Open the notebook:

```text
notebooks/titanic_survival_prediction.ipynb
```

Run the notebook cells in sequence to:

1. Load the dataset
2. Inspect and clean the data
3. Perform EDA
4. Engineer features
5. Build preprocessing pipelines
6. Train multiple models
7. Evaluate models
8. Perform cross-validation
9. Tune selected models
10. Select the final model
11. Analyze feature importance

---

## Results

The final selected model was **Random Forest**.

The model achieved:

* **81.56% Accuracy**
* **78.13% Precision**
* **72.46% Recall**
* **75.19% F1 Score**
* **84.42% ROC-AUC**
* **74.54% Mean 5-Fold CV Recall**

Recall was prioritized during model selection because the project emphasized identifying as many actual survivors as possible.

---

## Limitations

This project is based on the historical Titanic dataset and should be treated as a machine-learning learning/portfolio project rather than a real-world deployment system.

Important limitations include:

* The dataset is relatively small.
* Results depend on the selected train/test split.
* Feature importance does not imply causation.
* A single test split cannot fully represent future data.
* The final model is optimized around the project's recall-focused objective.

---

## Future Improvements

Potential improvements include:

* More systematic feature engineering
* More extensive cross-validation
* Threshold optimization for recall
* Class-weight experiments
* Hyperparameter optimization for additional models
* Permutation importance
* Model calibration
* More robust model comparison
* Deployment as a simple web application or API

---

## Key Learning Outcomes

Through this project, I practiced:

* Exploratory Data Analysis
* Data Cleaning
* Feature Engineering
* Missing Value Imputation
* One-Hot Encoding
* Feature Scaling
* Pipeline construction
* ColumnTransformer
* Data leakage prevention
* Classification modeling
* Cross-validation
* Hyperparameter tuning
* Model evaluation
* Feature importance
* Business-driven model selection

---

## Author

**Dhruv Aggarwal**

Data Science / Data Analytics Learner

GitHub: https://github.com/dhruvaggarwal96

LinkedIn: https://www.linkedin.com/in/dhruv-aggarwal-164608268/
