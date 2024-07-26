with open('a.txt', 'r') as in_f:
    l = in_f.read().split(' ')

for i in range(len(l)):
    l[i] = int(l[i])

m =[[1 for _ in range(l[0])] for _ in range(l[1])]

res = []

for i in range(l[0]):
    if (i + 1) % 2 != 0:
        for j in range(l[1]):
            if m[i][j] == 1:
                m[i][j] = 0
                s = str(i + 1) + ' ' + str(j + 1)
                res.append(s)
    else:      
        for j in range(l[1] - 1, -1, -1):
            if m[i][j] == 1:
                m[i][j] = 0
                s = str(i + 1) + ' ' + str(j + 1)
                res.append(s)         

with open('b.txt', 'w') as out_f:
    s = '\n'.join(res)
    out_f.write(s)