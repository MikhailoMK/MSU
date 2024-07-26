with open('a.txt', 'r') as in_f:
    n = in_f.read().split('\n')

n[0] = int(n[0])
a = [n[i].split(' ') for i in range(1, n[0] + 1)]
b = [n[i].split(' ') for i in range(n[0] + 2, len(n))]
c = [[] for _ in range(n[0])]

for i in range(n[0]):
    for j in range(n[0]):
        a[i][j] = int(a[i][j])
        b[i][j] = int(b[i][j])
        c[i].insert(j, str(a[i][j] + b[i][j]))

with open('b.txt', 'w') as out_f:
    s = ''
    for i in range(n[0]):
        s += ' '.join(c[i]) + '\n'
    s = s[:-1]    
    out_f.write(s)