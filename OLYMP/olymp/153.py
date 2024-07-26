from math import factorial

def catalan(n, m):
    return factorial(m + n - 2) // (factorial(m - 1) * factorial(n - 1))

with open('a.txt', 'r') as in_f:
    n = in_f.read().split(' ')

for i in range(len(n)):
    n[i] = int(n[i])

a, b = n[0], n[1]    

with open('b.txt', 'w') as out_f:
    out_f.write(str(catalan(a, b)))