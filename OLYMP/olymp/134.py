with open('a.txt', 'r') as in_f:
    n = in_f.read().split('\n')

l = [i.split(' ') for i in n]
for i in range(len(l)):
    for j in range(len(l[i])):
        l[i][j] = int(l[i][j])

m = [str(i) for i in range(1, l[0][0] + 1)]

for i in range(2, l[1][0] + 2):
    m[l[i][0] - 1], m[l[i][1] - 1] = m[l[i][1] - 1], m[l[i][0] - 1]


with open('b.txt', 'w') as out_f:
    s = ' '.join(m)
    out_f.write(s)