with open('a.txt', 'r') as in_f:
    n = in_f.read().split(' ')

with open('b.txt', 'w') as out_f:
    out_f.write(str(len(n)))