with open('a.txt', 'r') as in_f:
    n = in_f.read().split('\n')

l = [i.split(' ') for i in n]
for i in range(len(l)):
    for j in range(len(l[i])):
        l[i][j] = int(l[i][j])

for i in range(1, l[0][0]):
    if l[i][0] > l[i + 1][0]:
        l[i], l[i + 1] = l[i + 1], l[i]

    if l[i][0] == l[i + 1][0]:
        if l[i][1] > l[i + 1][1]:
            l[i], l[i + 1] = l[i + 1], l[i]

    if l[i][0] == l[i + 1][0] and l[i][1] == l[i + 1][1]:
        if l[i][2] > l[i + 1][2]:
            l[i], l[i + 1] = l[i + 1], l[i]        

for i in range(1, l[0][0] + 1):
    s = str(l[i][0])
    for j in range(1, 3):
        s += ' ' + str(l[i][j])
    l[i] = s 

with open('b.txt', 'w') as out_f:
    g = ''
    for i in range(1, l[0][0] + 1):
        g += l[i] + '\n'
    g = g[:-1]
    out_f.write(g)