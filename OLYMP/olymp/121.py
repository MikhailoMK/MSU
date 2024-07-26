with open('a.txt', 'r') as in_f:
    n = in_f.read().split('\n')

l = [n[i].split(' ') for i in range(len(n))]

for i in range(len(l)):
    for j in range(len(l[i])):
        l[i][j] = int(l[i][j])

a = 0
b = 30001
s = 0
for i in range(1, l[0][0] + 1):
    if l[i][0] > a:
        a = l[i][0]
    if l[i][1] < b:
        b = l[i][1]

s = b - a

with open('b.txt', 'w') as out_f:
    out_f.write(str(s))