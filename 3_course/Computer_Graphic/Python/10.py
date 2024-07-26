n = 1

for i in range(1, int(input()) + 1):
    n *= i
zero = 0
for j in str(n)[::-1]:
    if j == '0':
        zero += 1
    else:
        break

print(zero)