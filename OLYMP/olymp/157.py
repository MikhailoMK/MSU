with open('a.txt', 'r') as in_f:
    n = int(in_f.readline())
    l = [list(map(int, i.split())) for i in in_f]

m = l[-1]
l = l[:-2]
s = 0

for i in range(n):
    for j in range(n):
        if l[i][j] == l[j][i] == 1:
            if m[i] != m[j]:
                s += 1
                l[i][j] = 0
                l[j][i] = 0

s = str(s)
with open('b.txt', 'w') as out_f:
    out_f.write(s)