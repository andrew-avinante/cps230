num = int(input("Input: "))
itter = 10
while(itter != 0):
    if(num % itter == 0):
        print(str(num) + " IS DIVISIBLE BY: " + str(itter))
    itter -= 1