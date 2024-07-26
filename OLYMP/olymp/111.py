with open('a.txt', 'r') as in_f:
    n = in_f.read().split(' ')

for i in range(len(n)):
    n[i] = int(n[i])

if n[0] > n[1]:
    while n[0] > n[1]:
        n[0], n[1] = n[0] % n[1], n[0]
else:
    while n[0] < n[1]:
        n[0], n[1] = n[1], n[1] % n[0]

with open('b.txt', 'w') as out_f:
    out_f.write(str(min(n)))