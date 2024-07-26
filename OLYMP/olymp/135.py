with open('a.txt', 'r') as in_f:
    n = in_f.read().split('\n')

l = [i.split(' ') for i in n]
for i in range(len(l)):
    for j in range(len(l[i])):
        l[i][j] = int(l[i][j])

a = min(l[1])
b = l[1].index(a)
c = l[1][0]


if c != a:
    l[1][0], l[1][b] = a, c

for i in range(l[0][0]):
    l[1][i] = str(l[1][i])

with open('b.txt', 'w') as out_f:
    s = ' '.join(l[1])
    out_f.write(s)