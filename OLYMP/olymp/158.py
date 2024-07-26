with open('a.txt', 'r') as in_f:
    n = int(in_f.readline())
    l = [list(map(int, i.split())) for i in in_f]

for i in range(n):
    for j in range(n):
        for k in range(n):
            if l[i][j] > 0:
                

print(l)

#with open('b.txt', 'w') as out_f:
#    out_f.write(s)