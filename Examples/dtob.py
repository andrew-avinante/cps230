def StackToString(stack):
    answer = ""
    for i in reversed(stack):
        answer += i
    return answer

def Convert(num, base):
    stack = []
    hexLetters = ['A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', 'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', 'U', 'V', 'W', 'X', 'Y', 'Z']
    while(num != 0):
        if num%base < 10:
            stack.append(str(num%base))
        else:
            stack.append(hexLetters[int(str(num%base))-10])
        num /= base
    return StackToString(stack)

x = int(input("Decimal number: "))
y = int(input("Base to be converted to: "))

if y < 37 and y > 1:
    print(Convert(x,y))
else:
    print('Cannot calculate to base ' + str(y))