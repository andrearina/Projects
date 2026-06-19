while True:
    input1 = input("Enter a word: ").split()
    reverse = ""

    input2 = "".join(input1)

    for x in input2:
        reverse = x+reverse
    
    if reverse == input2:
        print("PALINDROME")
    else:
        print("NOT A PALINDROME")
    
    choice = input("Do you want to continue? (yes/no): ").lower()
    if choice != "yes":
        print("Goodbye!")
        break
