with open('a.txt', 'r') as in_f:
    n = in_f.read().split('\n')

l = [n[i].split(' ') for i in range(len(n))]

l[1].pop(int(l[2][0]) - 1)

with open('b.txt', 'w') as out_f:
    s = ' '.join(l[1])
    out_f.write(s)