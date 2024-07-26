with open('a.txt', 'r') as in_f:
    n = int(in_f.readline())
    l = [list(map(int, i.split())) for i in in_f]


s = 0
for i in range(n):
    for j in range(n):
        if l[i][j] == 1:
            l[j][i] = 0
            s += 1

with open('b.txt', 'w') as out_f:
    out_f.write(str(s))