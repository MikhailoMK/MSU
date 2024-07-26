with open('a.txt', 'r') as in_f:
    a, b = map(str, in_f.readline().split())

s = b + ' ' + a

with open('b.txt', 'w') as out_f:
    out_f.write(s)