with open('a.txt', 'r') as in_f:
    n = in_f.read().split('\n')

l = [n[i].split(' ') for i in range(len(n))]

for i in range(len(l)):
    for j in range(len(l[i])):
        l[i][j] = int(l[i][j])

s = -1
for i in range(l[0][0]):
    for j in range(i + 1, l[0][0]):
        for k in range(j + 1, l[0][0]):
            a = l[1][i] * l[1][j] * l[1][k]
            if a > s:
                s = a
                first = str(l[1][i])
                second = str(l[1][j])
                third = str(l[1][k])

res = first + ' ' + second + ' ' + third

with open('b.txt', 'w') as out_f:
    out_f.write(res)