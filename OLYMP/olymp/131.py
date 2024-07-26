with open('a.txt', 'r') as in_f:
    l = in_f.read().split(' ')

for i in range(len(l)):
    l[i] = int(l[i])

m = [1 for _ in range(l[0])]

de = 0
while m.count(1) != 1:
    for i in range(l[0]):
        if m[i] == 1:
            de += 1
            if de == l[1]:
                m[i] = 0
                de = 0

s = str(m.index(1) + 1)
with open('b.txt', 'w') as out_f:
    out_f.write(s)