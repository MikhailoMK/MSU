with open('a.txt', 'r') as in_f:
    n = in_f.read().split(' ')

l = [int(i) for i in n]
gg = 0

for i in range(1, l[0] + 1):
    s = str(i)
    a = 0
    for j in s:
        a += int(j)
    if a % l[1] == 0:
        gg += 1

with open('b.txt', 'w') as out_f:
    out_f.write(str(gg))