with open('a.txt', 'r') as in_f:
    n = in_f.read().split('\n')

l = [i.split(' ') for i in n]
for i in range(len(l)):
    for j in range(len(l[i])):
        l[i][j] = int(l[i][j])

for i in range(1, l[0][0] + 1):
    for j in range(l[0][1]):
        if l[i][j] == 0:
            s = str(i) + ' ' + str(j + 1)

with open('b.txt', 'w') as out_f:
    out_f.write(s)