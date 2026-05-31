# Create a function-based program that analyzes sales data.
# total_sales()
# average_sales()
# highest_sale()
# lowest_sale()

def total_sales(l):
    print(f"Total Sales is {sum(l)}")
def average_sales(l):
    print(f"Average Sales is {sum(l) / len(l)}")
def highest_sales(l):
    print(f"Maximun Sales is {max(l)}")
def lowest_sales(l):
    print(f"Lowest Sales is {min(l)}")

n = int(input("Enter Number of Times Want to Enter Data : "))
l = []
for i in range(n):
    data = int(input("Enter Sales Data : "))
    l.append(data)
total_sales(l)
average_sales(l)
highest_sales(l)
lowest_sales(l)
