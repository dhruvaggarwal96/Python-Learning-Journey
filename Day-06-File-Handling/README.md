# Day 6 - File Handling in Python

## 📅 Date
June 2026

## 🎯 Learning Objectives

Today I learned:

- Creating files
- Reading files
- Writing data to files
- Appending data to files
- Using `with open()`
- Handling file errors
- Building a simple data storage system

---

## 📚 Topics Covered

### 1. File Modes

| Mode | Description |
|--------|------------|
| `r` | Read file |
| `w` | Write file (overwrites existing content) |
| `a` | Append data to file |
| `r+` | Read and write |

---

### 2. Creating and Writing Files

```python
with open("data.txt", "w") as file:
    file.write("Hello World")
```

---

### 3. Reading Files

```python
with open("data.txt", "r") as file:
    content = file.read()
    print(content)
```

---

### 4. Appending Data

```python
with open("data.txt", "a") as file:
    file.write("\nNew Data")
```

---

### 5. Error Handling

```python
try:
    with open("data.txt", "r") as file:
        print(file.read())
except FileNotFoundError:
    print("File not found")
```

---

## 🛠 Practice Questions Completed

- [ ] Create a file
- [ ] Read a file
- [ ] Append data
- [ ] Count lines in a file
- [ ] Store student records
- [ ] Search student records
- [ ] Calculate average marks
- [ ] Find top scorer

---

## 🚀 Mini Project

### Student Management System

Features:

- Add Student
- View Students
- Search Student
- Count Students
- Exit Program

Data is stored permanently using text files.

---

## 💡 Key Learnings

- Files help store data permanently.
- `with open()` is the recommended way to work with files.
- File handling is essential for Data Science because datasets are usually stored in files such as CSV, Excel, and JSON.
- Reading and writing files is a fundamental Python skill.

---

## 📈 Progress in 90-Day Data Science Journey

### Completed

- Day 1: Python Basics
- Day 2: Operators & Conditional Statements
- Day 3: Loops
- Day 4: Functions
- Day 5: Lists, Dictionaries & Tuples
- Day 6: File Handling

### Next Step

Day 7: Object-Oriented Programming (OOP) Basics

---

## 🔗 GitHub Repository

This repository contains all code, practice exercises, and projects completed during Day 6 of my 90-Day Data Science Journey.

### Author

Dhruv Aggarwal

B.Tech CSE Student | Aspiring Data Scientist

Learning Python, SQL, Data Analytics, Machine Learning, and Data Science.
