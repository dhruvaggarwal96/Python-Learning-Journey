# 🏆 Week 1 Final Mini Project
# Student Record Management System

# Create:

# student_record_manager.py
# Features
# 1. Add Student
# Name
# Marks
# 2. View Students

# Display all students.

# 3. Search Student

# Search by name.

# 4. Delete Student

# Remove student.

# 5. Save to File

# Store data in:

# students.txt
# 6. Load from File

# Read saved data.

# 7. Exception Handling

# Handle:

# Invalid marks
# Missing file
# Invalid menu choices

while True:
  try:
    with open("students.txt","r") as file:
      choice = int(input("Choose : \n    1.Add Student\n    2.View Students\n    3.Search Student\n    4.Delete Student\n    5.Exit\nEnter Choice :  "))
      if choice == 1:
        try:
          name = input("Enter the name : ")
          marks = int(input("Enter the marks : "))
          with open("students.txt","a") as file:
            file.write(f"{name},{marks}\n")
            print("Record Added Successfully")
        except ValueError:
          print("Invalid Marks")
      elif choice == 2:
        with open("students.txt","r") as file:
          content = file.read()
          print(content)
      elif choice == 3:
        name = input("Enter the Name : ")
        with open("students.txt" , "r") as file:
          content = file.readlines()
          for i in content:
            if name in i:
              print(i)
      elif choice == 4:
        name = input("Enter the Name : ")
        with open("students.txt","r") as file:
          content = file.readlines()
          with open("students.txt","w") as file:
            for i in content:
              if name not in i:
                file.write(i)
                print("Record Deleted Successfully")
      elif choice == 5:
          break
      else:
        print("Invalid Choice")
  except FileNotFoundError:
    with open("students.txt","w") as file:
      pass
  finally:
    print("Program End")