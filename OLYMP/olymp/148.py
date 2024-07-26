with open('a.txt', 'r') as in_f:
    n = int(in_f.read())

l = [[1] for _ in range(n)]

for i in range(1, n):
    for j in range(1, i):
        m = l[i - 1][j] + l[i - 1][j - 1]
        l[i].append(m)
    l[i].append(1)            

for i in range(n):
    for j in range(i + 1):
        l[i][j] = str(l[i][j])

with open('b.txt', 'w') as out_f:
    s = ''
    for i in range(n):
        s += ' '.join(l[i]) + '\n'
    s = s[:-1]    
    out_f.write(s)