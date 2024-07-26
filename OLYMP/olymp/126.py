with open('a.txt', 'r') as in_f:
    l = in_f.read().split(' ')

for i in range(len(l)):
    l[i] = int(l[i])

m = []
while len(l) > 0:
    a = l.pop(0)
    s = ''
    for i in range(a):
        s += str(l.pop(0))
    m.append(s)

m.insert(0, str(len(m)))

with open('b.txt', 'w') as out_f:
    s = ' '.join(m)
    out_f.write(s)