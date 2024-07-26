with open('a.txt', 'r') as in_f:
    l = in_f.read().split(' ')

for i in range(len(l)):
    l[i] = int(l[i])

m = [str(i + 1) for i in range(l[0])]

a = 0
while a < l[1] - 1:
    for i in range(1, l[0]):
        m[i], m[i - 1] = m[i - 1], m[i]
    a += 1

with open('b.txt', 'w') as out_f:
    s = ' '.join(m)
    out_f.write(s)