with open('a.txt', 'r') as in_f:
    n = in_f.read().split('\n')

l = [i.split(' ') for i in n]
for i in range(len(l)):
    for j in range(len(l[i])):
        l[i][j] = int(l[i][j])


a = 1001
for i in range(1, l[0][0] + 1):
    for j in range(l[0][1]):
        gg = l[i][j]
        if gg < a:
            a = l[i][j]

print(l)

with open('b.txt', 'w') as out_f:
    a = str(a)
    out_f.write(a)