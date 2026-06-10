# 🚀 Day 12: Polymorphism in Python

Welcome to Day 12 of my **90-Day Data Science Journey**.

Today I learned **Polymorphism**, one of the core concepts of Object-Oriented Programming (OOP). Polymorphism allows the same method name to behave differently depending on the object that calls it, making code more flexible and reusable.

## 📚 Topics Covered

* What is Polymorphism?
* Many Forms Concept
* Same Method, Different Behavior
* Method Overriding
* Polymorphism with Loops
* Real-World Examples of Polymorphism

## 💻 Coding Practice

### Animal Sound Example

```python
class Dog:
    def sound(self):
        print("Bark")

class Cat:
    def sound(self):
        print("Meow")

animals = [Dog(), Cat()]

for animal in animals:
    animal.sound()
```

### Shape Example

```python
class Shape:
    def area(self):
        print("Area calculation")

class Circle(Shape):
    def area(self):
        print("Area of Circle = πr²")

class Rectangle(Shape):
    def area(self):
        print("Area of Rectangle = length × width")

shapes = [Circle(), Rectangle()]

for shape in shapes:
    shape.area()
```

## 🚀 Mini Project

### Employee Management System

Created classes:

* Employee
* Manager
* Developer
* Designer

Each class contains a `work()` method demonstrating polymorphism.

Example:

```python
employees = [Manager(), Developer(), Designer()]

for emp in employees:
    emp.work()
```

## 🎯 Key Takeaways

* Polymorphism means "Many Forms".
* The same method can perform different actions.
* Method Overriding is a common way to achieve polymorphism.
* Polymorphism makes code flexible, reusable, and maintainable.
* Widely used in real-world software development.

## 🔗 Connect With Me

* GitHub: https://github.com/
* LinkedIn: https://www.linkedin.com/in/dhruv-aggarwal-164608268/
* X (Twitter): https://x.com/Dhruv_Agarwal11

#90DaysOfDataScience #Python #OOP #Polymorphism #CodingJourney #DataScience
