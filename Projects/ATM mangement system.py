# Build a menu-driven ATM Simulator using methods only.
class Atm:
    def __init__(self,account_no , balance):
        self.account_no = account_no
        self.balance  = balance
        self.menu()
    def check_balance(self):
        print(f"Your Balance is : {self.balance}")
    def withdraw(self):
        n = int(input("Enter the Amount in Rs: " ))
        if self.balance > n :
            self.balance = self.balance - n
            print(f"{n} Rs Debited To your account ")
        else:
            print("Insufficient Balance")
    def deposite(self):
        n = int(input("Enter the Amount Deposite "))
        self.balance += n
        print(f"{n} Rs. Credited to your account")
    def menu(self):
        while True:
            try:
                print("Welcome to ATM Simulator")
                choice = int(input("Choose : \n    1.Check Balance\n    2.Withdraw\n    3.Deposite\n    4.Exit\nEnter Choice : "))
                if choice == 1:
                    self.check_balance()
                elif choice == 2:
                    self.withdraw()
                elif choice == 3:
                    self.deposite()
                elif choice == 4:
                    break
                else:
                    print("Please Enter a Valid Choice[1-4]")
            except ValueError:
                print("Enter Valid Number ")
            
a = Atm(123,10000)