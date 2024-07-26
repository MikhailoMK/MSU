with open('a.txt', 'r') as in_f:
    n = in_f.read().split('\n')

l = [n[i].split(' ') for i in range(len(n))]

for i in range(len(l)):
    for j in range(len(l[i])):
        l[i][j] = int(l[i][j])

mm = 0
s = 0
for i in l[1]:
    if i == mm:
        s += 1
    if i > mm:
        s = 0
        mm = i
        s += 1

with open('b.txt', 'w') as out_f:
    out_f.write(str(s))