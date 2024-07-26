with open('a.txt', 'r') as in_f:
    n = in_f.read().split('\n')

l = [n[i].split(' ') for i in range(len(n))]

for i in range(len(l)):
    for j in range(len(l[i])):
        l[i][j] = int(l[i][j])

s = 0

for i in range(l[0][0]):
    for j in range(i + 1, l[0][0]):
        if l[1][i] == l[1][j]:
            s += 1

with open('b.txt', 'w') as out_f:
    out_f.write(str(s))