with open('a.txt', 'r') as in_f:
    n = in_f.read().split('\n')

l = [n[i].split(' ') for i in range(len(n))]

for i in range(len(l)):
    for j in range(len(l[i])):
        l[i][j] = int(l[i][j])

m = []
for i in range(len(l[1])):
    if (i + 1) % 2 != 0:
        m.append(l[1][i])

for i in range(len(l[1])):
    if (i + 1) % 2 == 0:
        m.append(l[1][i])

for i in range(len(m)):
    m[i] = str(m[i])

with open('b.txt', 'w') as out_f:
    s = ' '.join(m)
    out_f.write(s)