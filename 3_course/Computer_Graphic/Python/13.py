c = int(input())
n = 0

for i in range(c):
    for j in range(c):
        if c == i**2 + j**2:
            print(i, j)
            n += 1
        
if n < 1:      
    print('Таких не существует')