with open('a.txt', 'r') as in_f:
    l = [in_f.readline().split()]
    for i in range(int(l[0][0])):
        l.append(in_f.readline().split())


for i in range(1, int(l[0][0]) + 1):
    l[i][0] = str(int(l[i][0]) + 1)

s = ''
with open('b.txt', 'w') as out_f:
    for i in l:
        s += ' '.join(i) + '\n'
    out_f.write(s[:-1])