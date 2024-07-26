with open('a.txt', 'r') as in_f:
    n = in_f.read().split('\n')

l = [i.split(' ') for i in n]
for i in range(len(l)):
    for j in range(len(l[i])):
        l[i][j] = int(l[i][j])

glav = 0
pob = 0

for i in range(1, l[0][0] + 1):
    for j in range(l[0][0]):
        if i - 1 == j:
            glav += l[i][j]
        if i + j == l[0][0]:
            pob += l[i][j]

gg = str(glav) + ' ' + str(pob)

with open('b.txt', 'w') as out_f:
    out_f.write(gg)