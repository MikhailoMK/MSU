n = int(input())

while n > 9:
    a = 0
    for i in str(n):
        a += int(i)
    n = a    

print(n)