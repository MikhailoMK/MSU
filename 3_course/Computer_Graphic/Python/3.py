n = int(input())
bi = bin(n)[2:]
zero = 0
max_zero = 0


for i in bi:
    if i == '1':
        if zero > max_zero:
            max_zero = zero
        zero = 0
    else:
        zero += 1

print(max_zero)