with open('a.txt', 'r') as in_f:
    n = in_f.read().split('\n')

l = [i.split(' ') for i in n]
for i in range(len(l)):
    for j in range(len(l[i])):
        l[i][j] = int(l[i][j])

for i in range(l[0][0]):
    for j in range(l[0][0] - 1):
        if l[1][j] > l[1][j + 1]:
            l[1][j], l[1][j + 1] = l[1][j + 1], l[1][j]

for i in range(l[0][0]):
    l[1][i] = str(l[1][i])

with open('b.txt', 'w') as out_f:
    s = ' '.join(l[1])
    out_f.write(s)