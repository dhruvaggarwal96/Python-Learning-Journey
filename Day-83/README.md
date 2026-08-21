# Customer Churn Prediction

An end-to-end machine learning project focused on predicting customer churn and identifying patterns that may help businesses understand which customers are more likely to leave.

## Problem Statement

Customer churn can negatively affect a company's revenue and growth. This project uses customer data to build a machine learning workflow for predicting whether a customer is likely to churn.

## Business Objective

The objective is to identify customers who may be at risk of leaving so that a business can better understand churn patterns and potentially take preventive actions.

## Dataset

The dataset contains customer-related information, including demographic, financial, service, and contract-related variables, along with a target variable indicating customer churn.

Some features contain missing values, requiring investigation and appropriate preprocessing before modeling.

## Features

The project includes features related to areas such as:

* Customer age
* Monthly charges
* Income
* Contract type
* Customer tenure

The target variable is:

* `Churn`

## EDA

Exploratory Data Analysis was performed to understand:

* Dataset structure and feature types
* Missing values
* Numerical feature distributions
* Potential outliers
* Relationships between customer characteristics and churn

Missing values were investigated rather than automatically removed, as missing information can sometimes contain useful patterns.

## Methodology

The machine learning workflow follows these steps:

1. Data loading and inspection
2. Exploratory Data Analysis
3. Missing value analysis
4. Data preprocessing
5. Train-test split
6. Feature engineering and feature selection where appropriate
7. Machine learning model training
8. Model evaluation and comparison
9. Final model selection
10. Business insight generation

Care was taken to avoid data leakage by fitting preprocessing steps using the training data.

## Models Used

The project explores machine learning models from the following approaches:

* Logistic Regression
* K-Nearest Neighbors
* Decision Tree
* Random Forest
* Naive Bayes

Only models actually included in the final project should remain in this section.

## Model Comparison

Models are compared using appropriate evaluation metrics rather than relying only on accuracy.

The final comparison and metric values should be documented based on the completed project results.

## Final Model

The final model will be selected based on:

* Performance on unseen test data
* Appropriate evaluation metrics
* Ability to generalize
* Alignment with the business objective

## Results

The final model results should be added here after the evaluation and model selection are finalized.

> No performance metrics are included here until they are confirmed from the project.

## Business Insights

The project aims to identify patterns associated with customer churn and translate those findings into useful business insights.

Potential insights may help businesses:

* Identify customers with a higher risk of churn
* Understand factors associated with customer retention
* Prioritize customers for retention strategies

Only insights supported by the actual analysis should be added to this section.

## Installation

Clone the repository:

```bash
git clone <your-repository-url>
```

Navigate to the project directory:

```bash
cd Customer-Churn-Prediction
```

Install the required dependencies:

```bash
pip install -r requirements.txt
```

## Usage

Run the notebooks in the appropriate order to reproduce the analysis, preprocessing, modeling, and evaluation workflow.

## Project Structure

```text
Customer-Churn-Prediction/
│
├── data/
│   └── customer_churn_data.csv
│
├── notebooks/
│   ├── 01_data_understanding.ipynb
│   ├── 02_eda.ipynb
│   ├── 03_preprocessing.ipynb
│   └── 04_modeling.ipynb
│
├── README.md
├── requirements.txt
└── .gitignore
```

> Update this structure to match the actual repository before publishing.

## Future Improvements

* Improve model performance through further experimentation
* Explore additional feature engineering opportunities
* Perform deeper feature importance analysis
* Improve business insight reporting
* Add model explainability techniques
* Consider deployment after the project and exams are complete
