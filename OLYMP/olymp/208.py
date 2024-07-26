with open('a.txt', 'r') as in_f:
    l = [i for i in in_f.readline().split()]

s = ' '.join(l)

with open('b.txt', 'w') as out_f:
    out_f.write(s)