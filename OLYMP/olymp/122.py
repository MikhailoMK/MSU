with open('a.txt', 'r') as in_f:
    l = in_f.read().split(' ')

for i in range(len(l)):
    l[i] = int(l[i])

m = [l.count(i) for i in range(1, 10)]

for i in range(9):
    m[i] = str(m[i])

with open('b.txt', 'w') as out_f:
    s = ' '.join(m)
    out_f.write(s)