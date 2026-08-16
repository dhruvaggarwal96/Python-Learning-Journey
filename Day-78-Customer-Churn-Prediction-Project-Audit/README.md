# Day 78 — Customer Churn Prediction Project Audit

## 📅 Day

Day 78 / 90


## 🎯 Week

Week 12 — Lighter Mode Before College Exams

---

## 🧭 Day 78 Focus

Today focused on **auditing and organizing the Customer Churn Prediction project** rather than building new features or completing deployment.

Because college exams begin on **August 29**, the priority is:

**🎓 College Exams > 💻 Data Science > 💼 Internship > 📄 Portfolio**

The goal was to understand the current project state, identify improvements, and avoid unnecessary work before exams.

---

## 📚 Learning Objectives

By the end of Day 78, the goal was to:

* Understand the current state of the Customer Churn project
* Define the business problem clearly
* Define the business objective
* Identify the ML problem
* Understand the target variable
* Audit the dataset at a basic level
* Review existing ML models
* Identify the best current model
* Review the evaluation approach
* Prioritize project improvements
* Review GitHub and resume quality
* Continue internship applications
* Practice ML/Data Science interview questions

---

# 🚀 Customer Churn Prediction Project

## 1. Business Problem

Customer churn is a major business problem because losing existing customers can reduce revenue and increase the cost of acquiring new customers.

A company wants to identify customers who are likely to leave so that it can take preventive actions.

---

## 2. Business Objective

The objective is to **identify customers who are at high risk of churning** and help the business take proactive retention actions.

Possible actions include:

* Personalized offers
* Discounts
* Better customer support
* Retention campaigns
* Customer-specific engagement strategies

---

## 3. Machine Learning Problem

Customer Churn Prediction is a **supervised binary classification problem**.

The model learns from historical customer data and predicts whether a customer is likely to:

* Churn
* Stay

---

## 4. Target Variable

The target variable represents whether the customer churned.

Example:

```text
Churn = Yes → Customer churned
Churn = No  → Customer stayed
```

---

## 5. Business Usage

The prediction can help the company:

1. Identify high-risk customers
2. Prioritize retention efforts
3. Allocate marketing/support resources
4. Reduce customer loss
5. Potentially increase customer lifetime value

---

# 🔍 Dataset Audit

The dataset audit should cover the basic structure of the data.

### Checklist

* Dataset shape
* Column names
* Data types
* Missing values
* Duplicate rows
* Target distribution
* Numerical features
* Categorical features

The purpose is **not to perform advanced EDA today**.

The goal is simply to understand the current dataset before making further modeling decisions.

---

# 🤖 Model Review

The existing models should be reviewed rather than automatically retrained.

### Review Points

* Models already trained
* Accuracy
* Precision
* Recall
* F1-score
* ROC-AUC, if available
* Confusion matrix
* Cross-validation results, if available
* Best-performing model
* Generalization performance

---

## Why Accuracy Alone Is Not Enough

For churn prediction, accuracy alone may be misleading.

For example, if most customers do not churn, a model could predict:

```text
Everyone → Not Churn
```

and still achieve relatively high accuracy.

However, the model would fail to identify the customers the business actually wants to retain.

Therefore, metrics such as:

* Precision
* Recall
* F1-score
* ROC-AUC
* Confusion Matrix

should also be considered.

For churn prediction, **recall can be especially important when missing a potential churn customer is costly**.

The final metric choice should depend on the actual business cost of false positives and false negatives.

---

# 🧠 Interview Questions

The following questions are part of today's interview practice.

### Python

**Question:** What is the difference between a list and a tuple in Python?

### Pandas

**Question:** What is the difference between `loc` and `iloc` in Pandas?

### SQL

**Question:** What is the difference between `WHERE` and `HAVING`?

### Statistics

**Question:** What is the difference between correlation and causation?

### Machine Learning

**Question:** Why is accuracy alone not sufficient for evaluating a customer churn prediction model?

Answers should be attempted independently before reviewing explanations.

---

# 🛠️ Project Improvement Plan

## DO NOW

* [ ] Audit the current notebook
* [ ] Clearly document the business problem
* [ ] Clearly document the ML problem
* [ ] Record existing model results
* [ ] Identify the current best model
* [ ] Make sure the notebook is understandable
* [ ] Remove unnecessary/duplicate code

---

## DO LATER

* [ ] Detailed error analysis
* [ ] Feature importance
* [ ] Model interpretation
* [ ] Model saving
* [ ] Streamlit deployment
* [ ] Improved README
* [ ] More advanced model tuning

These tasks can be completed after college exams if necessary.

---

## OPTIONAL

* [ ] Additional visualizations
* [ ] Advanced feature engineering
* [ ] Trying additional algorithms
* [ ] More extensive hyperparameter tuning
* [ ] Advanced model explainability

These are **not priorities before exams**.

---

# 🐙 GitHub Review

Today's GitHub review should take approximately **20–30 minutes**.

Focus on only the top three improvements:

### 1. README

Make sure the README clearly explains:

* What the project does
* Business problem
* Dataset
* ML approach
* Model performance
* Key results

### 2. Project Structure

Keep the repository understandable.

Example:

```text
customer-churn-prediction/
│
├── data/
├── notebooks/
├── src/
├── README.md
├── requirements.txt
└── .gitignore
```

The exact structure does not need to be redesigned if the current repository is already clean.

### 3. requirements.txt

Ensure the major libraries required to reproduce the project are listed.

Do not spend time redesigning the entire repository.

---

# 💼 Internship Work

Today's target:

**3–5 quality applications**

Focus on:

* Data Analyst Intern
* Data Science Intern
* Machine Learning Intern
* Python/Data Intern
* Business Analyst Intern

Optional:

* [ ] 1 recruiter/alumni message

Quality is more important than application count.

---

# 📄 Resume Review

Limit resume work to approximately **20 minutes**.

Focus on the top three improvements:

1. Strengthen the Customer Churn project description
2. Show measurable/project-specific results where possible
3. Align technical skills and project bullets with Data Analyst/Data Science internship roles

No complete resume rewrite is required today.

---

# 🎓 College Exam Priority

College preparation remains the highest priority.

Recommended daily balance:

```text
🎓 College Study       4–6+ hours
💻 Data Science        1–2 hours
💼 Internship          30–45 minutes
📄 Career/Portfolio    20 minutes
```

If college workload increases:

**Reduce Data Science/Career work first.**

Do not sacrifice exam preparation to complete optional roadmap tasks.

---

# ⏱️ Day 78 Time Budget

| Activity                   |     Target |
| -------------------------- | ---------: |
| 🎓 College preparation     | 4–6+ hours |
| 💻 Project audit           |  60–75 min |
| 🤖 Model review            |  30–40 min |
| 🚀 Improvement planning    |    ~20 min |
| 💼 Internship applications |  30–45 min |
| 📄 Resume/Portfolio        |    ~20 min |
| 🎤 Interview practice      |  20–30 min |

### Data Science + Career Limit

**Approximately 2–4 hours maximum.**

---

# 🎯 Day 78 Deliverables

* [ ] Customer Churn project audited
* [ ] Business problem defined
* [ ] Business objective defined
* [ ] ML problem defined
* [ ] Target variable identified
* [ ] Dataset basic audit completed
* [ ] Existing models reviewed
* [ ] Best model identified
* [ ] Evaluation approach reviewed
* [ ] Project improvements prioritized
* [ ] GitHub top 3 improvements identified
* [ ] 3–5 internship applications completed
* [ ] Top 3 resume improvements identified
* [ ] 5 interview questions attempted

---

# ✅ Success Criteria

Day 78 is successful if the project becomes **clearer and more organized**, even if no new model is trained.

The main principle for Week 12 is:

> **Understand → Audit → Prioritize → Improve only what matters.**

There is no need to complete deployment, advanced tuning, extensive EDA, or major repository restructuring before exams.

---

## 🧠 Key Takeaway

The goal is not to maximize the amount of work completed.

The goal is to make **high-value progress while protecting college exam preparation**.

**College exams come first.**

The Customer Churn project can continue after exams.

---

## 🚦 Roadmap Status

**Day 78 — In Progress**

Next step:

**Review the existing Customer Churn Prediction notebook/code and audit the current implementation.**

**Day 79 is intentionally not started.**
