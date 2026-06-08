# Library Management System

# Create a class Library.

# Attributes:

# books (list)

# Methods:

# add_book()
# remove_book()
# show_books()

# Sample Menu:

# 1. Add Book
# 2. Remove Book
# 3. Show Books
# 4. Exit
class Library:
    def __init__(self , books):
        self.books = books
        self.menu()
    def add_book(self):
        name = input("Enter book name : " )
        self.books.append(name)
        print("Book Added Successfully")
    def remove_book(self):
        name = input("Enter book name : " )
        self.books.remove(name)
        print("Book Removed Successfully")
    def show_books(self):
        print("Books Are : " , self.books)
    def menu(self):
        while True:
            try:
                choice = int(input("Choice : \n    1.Add Book\n    2.Remove Book\n    3.Show Books\n    4.Exit\nEnter Choice :"))
                if choice == 1:
                    self.add_book()
                elif choice == 2:
                    self.remove_book()
                elif choice == 3:
                    self.show_books()
                elif choice == 4:
                    break
                else:
                    print("Invalid Choice")
            except ValueError:
                print("Please Enter a Valid Number")
l = Library(["All is well"])
