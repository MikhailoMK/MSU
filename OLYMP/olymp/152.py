with open('a.txt', 'r') as in_f:
    n = in_f.read().split('\n')

g = [int(i) for i in n[0].split(' ')]
a, b = int(g[0]), int(g[1])
c = int(n[a + 1].split()[0])

l1 = [n[i].split(' ') for i in range(1, a + 1)]
l2 = n[a + 2].split(' ')

for i in range(a):
    for j in range(b):
        l1[i][j] = int(l1[i][j])

for i in range(c - 1):
    l2[i] = int(l2[i])

s = l1[0][0]
x, y = 0, 0
l1[0][0] = 0

for i in l2:
    if i == 1:
        y += 1
        s += l1[x][y]
    elif i == 2:
        x -= 1
        s += l1[x][y]
    elif i == 3:
        y -= 1
        s += l1[x][y]
    elif i == 4:
        x += 1
        s += l1[x][y]
    l1[x][y] = 0

s = str(s)

with open('b.txt', 'w') as out_f:
    out_f.write(s)