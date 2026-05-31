# Requirements

# Create functions for:

# 1. Student Details
# student_info(name, roll_no)

# Display student information.

# 2. Calculate Total Marks
# calculate_total(m1, m2, m3)

# Return total marks.

# 3. Calculate Percentage
# calculate_percentage(total)

# Return percentage.

# 4. Assign Grade

# Use conditions:

# Percentage	Grade
# 90+	A
# 80-89	B
# 70-79	C
# 60-69	D
# Below 60	F



def student_info(name, roll_no):
    print(f"Name : {name}\nRoll Number : {roll_no}\n")
def calculate_total(m1, m2, m3):
    return m1+m2+m3
def calculate_percentage(total):
    return total/3
def grade(percentage):
    if percentage>=90:
        return "A"
    elif 80<=percentage<=89:
        return "B"
    elif 70<=percentage<=79:
        return "C"
    elif 60<=percentage<=69:
        return "D"
    else:
        return "E"
def pass_fail(percent):
    if percent>=45:
        return "Pass"
    else:
        return "Fail"


print("======== STUDENT REPORT =======\n\n")
student_info("Dhruv",20)
python = 94
sql = 92
stat = 88
total = calculate_total(python,sql,stat)
print(f"Marks: \nPython:{python}\nSQL: {sql}\nStatistics:{stat}\n\nTotal:{total}\n\n")
percent = calculate_percentage(total)
print(f"Percentage : {percent}")
get_grade = grade(percent)
print(f"Grade : {get_grade}")
is_pass = pass_fail(percent)
print(f"Result : {is_pass}")