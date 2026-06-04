# 🏆 Challenge Project (Must Do)

# Build a Student Management System with this menu:

# 1. Add Student
# 2. View Students
# 3. Search Student
# 4. Count Students
# 5. Exit

# Store all data in a text file.

def add_student():
  name = input("Enter the name of the student :")
  marks = int(input("Enter the marks of the student : "))
  with open("student.csv","a") as file:
    file.write(f"{name},{marks}\n")
  print("Record Added Successfully")

def view_student():
  with open("student.csv","r") as file:
    content = file.read()
    print(content)

def search_student():
  name = input("Enter the name of the student : ")
  with open("student.csv",'r') as file:
    content = file.readlines()
    for line in content:
      if name in line:
        print("Student Found")
      else:
        print("Student Not Found")

def count_student():
   with open("student.csv","r") as file:
    content  = file.readlines()
    print(f"Total Students : {len(content)}")

#main
while True:
  try:
    choice = int(input("Choose The Option : \n    1.Add Students\n    2.View Students\n    3.Search Students\n    4.Count Students    \n    5.Exit\nEnter Choice : "))
    if choice == 1:
      add_student()
    elif choice == 2:
      view_student()
    elif choice == 3:
      search_student()
    elif choice == 4:
      count_student()
    elif choice == 5:
      break
    else:
      print("Invalid Choice")
  except FileNotFoundError:
      with open("student.csv","w") as file:
        pass

