with open('a.txt', 'r') as in_f:
    n = in_f.read().split('\n')

l = [n[i].split(' ') for i in range(len(n))]

for i in range(len(l)):
    for j in range(len(l[i])):
        l[i][j] = int(l[i][j])

with open('b.txt', 'w') as out_f:
    out_f.write(str(min(l[1])))