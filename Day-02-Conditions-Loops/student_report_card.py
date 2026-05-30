# 🌟 Challenge Project 
# Student Report Card System
# Features:
# Ask student name.
# Ask number of subjects.
# Take marks using loop.
# Ignore invalid marks using continue.

Choice = "y"
while Choice=="y":
    name = input("Enter the Student Name : " )
    no = int(input("Enter Number Of Subjects : " ))
    sum = 0
    
    for i in range(1,no + 1):
        marks = float(input(f"Enter {i} Subject Marks : " ))
        if 0<=marks<=100:
           sum = sum + marks
        else:
            print("Invalid Marks")
            continue
    print("\nTotal Obtained Marks" , sum)
    percentage = sum/no
    print("\nPercemtage : " , percentage)
    if percentage>=90:
        print("\nGrade : A")
    elif 75<=percentage<90:
        print("\nGrade : B")
    elif 50<=percentage<75:
        print("\nGrade : C")
    else:
        print("\nGrade : D")
    if percentage>=45:
        print("\npass")
    else:
        print("\nFail")
    choice = input("\nDo you want to enter another student? (y/n) :")
    if choice == "n":
        break