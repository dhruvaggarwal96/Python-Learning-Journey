# 🚀 Day 10: Methods in Python

Welcome to Day 10 of my 90-Day Python & Data Science Journey.

## 📚 What I Learned

### What are Methods?

Methods are functions defined inside a class. They describe the behavior of an object and can access or modify its attributes using `self`.

Example:

```python
class Student:
    def greet(self):
        print("Hello")
```

### Why Use Methods?

Methods help objects perform actions.

Examples:

* Deposit money
* Withdraw money
* Check balance
* Display details

---

## 💻 Coding Practice

### BankAccount Class

Created a `BankAccount` class with the following methods:

* `deposit()`
* `withdraw()`
* `check_balance()`

Example:

```python
class BankAccount:
    def __init__(self):
        self.balance = 0

    def deposit(self, amount):
        self.balance += amount

    def withdraw(self, amount):
        if amount <= self.balance:
            self.balance -= amount

    def check_balance(self):
        print(self.balance)
```

---

## 🚀 Mini Project

### ATM Simulator

Built a menu-driven ATM Simulator using methods.

### Features

* Deposit Money
* Withdraw Money
* Check Balance
* Exit Program

### Concepts Used

* Classes
* Objects
* Constructor (`__init__`)
* Methods
* `self`
* Loops
* Conditional Statements

---

## 🎤 Interview Questions

### 1. What are Methods?

**Answer:**
Methods are functions defined inside a class that perform actions related to an object.

### 2. What is the purpose of `self`?

**Answer:**
`self` refers to the current object and allows access to its attributes and methods.

### 3. Difference Between Variable and Method?

| Variable           | Method               |
| ------------------ | -------------------- |
| Stores data        | Performs actions     |
| Represents state   | Represents behavior  |
| Example: `balance` | Example: `deposit()` |

---

## 🔗 Connect With Me

* GitHub: https://github.com/dhruvaggarwal96/Python-Learning-Journey
* LinkedIn: https://www.linkedin.com/in/dhruv-aggarwal-164608268/
* X (Twitter): https://x.com/Dhruv_Agarwal11

---

⭐ Day 10 Complete! Consistency is the key to mastering Python and becoming a Data Scientist.
