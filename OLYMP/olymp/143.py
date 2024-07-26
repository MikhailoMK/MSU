with open('a.txt', 'r') as in_f:
    n = in_f.read().split('\n')

l = [i.split(' ') for i in n]
for i in range(len(l)):
    for j in range(len(l[i])):
        l[i][j] = int(l[i][j])

a = 10001
for i in range(l[0][0]):
    if a > abs(l[1][i] - l[2][0]):
        a = abs(l[1][i] - l[2][0])
        gg = str(i + 1)



with open('b.txt', 'w') as out_f:
    out_f.write(gg)