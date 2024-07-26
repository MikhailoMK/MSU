with open('a.txt', 'r') as in_f:
    n = in_f.read().split('\n')

g = [int(i) for i in n[0].split(' ')]
a, b = int(g[0]), int(g[1])
c = int(n[a + 1].split()[0])

l1 = [n[i].split(' ') for i in range(1, a + 1)]
l2 = [n[i + a + 2].split(' ') for i in range(c)]

for i in range(a):
    for j in range(b):
        l1[i][j] = int(l1[i][j])

for i in range(c):
    for j in range(2):
        l2[i][j] = int(l2[i][j])

s = 0
for i in range(c):
    s += l1[l2[i][0] - 1][l2[i][1] - 1]
    l1[l2[i][0] - 1][l2[i][1] - 1] = 0
s = str(s)    

with open('b.txt', 'w') as out_f:
    out_f.write(s)