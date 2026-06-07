# 🚀 Day 9: Constructors (`__init__`) in Python

Welcome to Day 9 of my **90-Day Python & Data Science Journey**.

Today, I learned one of the most important concepts of Object-Oriented Programming (OOP): **Constructors** and the **self keyword**.

## 📚 Topics Covered

### What is a Constructor?

A constructor is a special method that automatically runs when an object is created.

```python
class Student:
    def __init__(self, name):
        self.name = name

s1 = Student("Dhruv")

print(s1.name)
```

### Understanding `self`

* `self` refers to the current object.
* It is used to access attributes and methods of the class.

```python
class Student:
    def __init__(self, name):
        self.name = name
```

### Class vs Object

| Class             | Object                          |
| ----------------- | ------------------------------- |
| Blueprint         | Instance of a class             |
| Defines structure | Uses the structure              |
| Created once      | Multiple objects can be created |

Example:

```python
class Car:
    pass

car1 = Car()
car2 = Car()
```

## 💻 Coding Exercise

Created a `Laptop` class with:

* Brand
* RAM
* Price

Created multiple laptop objects and displayed their details.

```python
class Laptop:
    def __init__(self, brand, ram, price):
        self.brand = brand
        self.ram = ram
        self.price = price
```

## 📝 Practice Questions

* Create a Student class with name and age.
* Create a Car class with brand and model.
* Create an Employee class with name, salary, and department.
* Create a Mobile class with brand, storage, and price.
* Create a Rectangle class and calculate area.
* Create a Circle class and calculate circumference.

## 🎯 Mini Project

### Student Management System

Features:

* Store student details
* Display student information
* Check whether a student is an adult (18+)

## 🎤 Interview Questions

### What is `__init__()`?

A special constructor method that automatically executes when an object is created.

### What is `self`?

`self` refers to the current instance of a class.

### Difference between Class and Object?

A class is a blueprint, while an object is an actual instance created from that blueprint.

---

## 🔗 Connect With Me

### GitHub

https://github.com/dhruvaggarwal96/Python-Learning-Journey

### LinkedIn

https://www.linkedin.com/in/dhruv-aggarwal-164608268/

### X (Twitter)

https://x.com/Dhruv_Agarwal11

---

⭐ Follow my journey as I learn Python, Data Science, and prepare for a career in Data Analytics & Data Science.
