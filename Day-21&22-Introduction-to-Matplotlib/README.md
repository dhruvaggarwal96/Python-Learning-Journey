# Day 21 & Day 22 – Pandas Analysis and Matplotlib Basics

## Overview
This project covers Day 21 and Day 22 of my Data Science learning journey. During these two days, I practiced data analysis using Pandas and learned the fundamentals of data visualization using Matplotlib.

## Day 21 – Data Analysis with Pandas

### Topics Covered
- DataFrame operations
- Filtering data
- Sorting values
- Statistical analysis
- Finding maximum, minimum, and average values
- Working with real datasets

### Skills Practiced
- Data cleaning
- Data exploration
- Data analysis
- Extracting insights from datasets

## Day 22 – Introduction to Matplotlib

### Topics Covered
- What is Matplotlib
- Basic plotting
- Figure and Axes
- Titles and Labels
- Gridlines
- Markers
- Line styles
- Legends
- Saving charts

### Charts Created
1. Student Marks Analysis
2. Monthly Expenses Analysis
3. Daily Study Hours Analysis
4. YouTube Views Analysis

## Sample Code

```python
import matplotlib.pyplot as plt

days = ["Mon", "Tue", "Wed", "Thu", "Fri"]
sales = [100, 120, 150, 170, 200]

plt.plot(days, sales, marker="o")
plt.title("Sales Analysis")
plt.xlabel("Days")
plt.ylabel("Sales")
plt.grid()
plt.show()
