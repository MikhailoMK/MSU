with open('a.txt', 'r') as in_f:
    n = int(in_f.read())

m = 0
chislo = 0
for i in range(1, n):
    s = 0
    for j in range(1, i + 1):
        if i % j == 0:
            s += j
    if m <= s:
        m = s
        chislo = i

with open('b.txt', 'w') as out_f:
    out_f.write(str(chislo))