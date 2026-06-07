# 🎯 Mini Project
# # Student Management System
# Create a class:

# class Student:
# Attributes
# name
# age
# course
# Methods
# display_details()
# is_adult() → Returns True if age ≥ 18
# Create
# 3 student objects
# Display all details
# Check whether each student is adult or not
class Student:
    def __init__(self , name , age , course ):
        self.name = name
        self.age = age 
        self.course = course
    def display_details(self):
        print("Student Details " )
        print("Student Name : " , self.name)
        print("Student Age : " , self.age)
        print("Student Course : " , self.course)
    def is_adult(self): 
        if self.age >= 18:
            return True
        else :
            return False
s1 = Student("Dhruv" , 20 , "Btech")
s2 = Student("Parth" , 17 , "BBA")
s3 = Student("Aman" , 18 , "BCA")

s1.display_details()
s2.display_details()
s3.display_details()
