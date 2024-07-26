with open('a.txt', 'r') as in_f:
    n, m = map(int, in_f.readline().split())
    l = [list(map(int, i.split())) for i in in_f]

a = [0 for _ in range(n)]

for i in range(m):
    for j in range(2):
        a[l[i][j] - 1] += 1

for i in range(n):
    a[i] = str(a[i])

with open('b.txt', 'w') as out_f:
    s = ' '.join(a)
    out_f.write(s)