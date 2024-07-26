with open('a.txt', 'r') as in_f:
    n = in_f.read().split('\n')

l = [i.split(' ') for i in n]
for i in range(len(l)):
    for j in range(len(l[i])):
        l[i][j] = int(l[i][j])

gg = 0

for i in range(1, l[0][0] + 1):
    if gg <= sum(l[i]):
        gg = sum(l[i])
        a = str(i)

with open('b.txt', 'w') as out_f:
    out_f.write(a)