class ATM:
    def __init__(self,correct_pin):
        self.card_block = False
        self.attempt = 0
        self.correct_pin = correct_pin

    def enter_pin(self):
        while self.attempt < 3:
            pin = input("Enter your pin number: ")
            if pin == self.correct_pin:
                print("Access Granted")
                return True
            else:
                self.attempt += 1
                print(f"INcorrect pin number,you have {3-self.attempt} attempts remaining")

        self.card_block = True
        print("Card Blocked")
        return False

shubham =ATM('1234')
shubham.enter_pin()