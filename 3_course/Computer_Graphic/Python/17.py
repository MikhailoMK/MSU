n = int(input())
m = int(input())

while m != 0:
    n, m = m, n % m

print(n)