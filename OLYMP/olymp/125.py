with open('a.txt', 'r') as in_f:
    l = in_f.read().split(' ')

l.remove('0')

with open('b.txt', 'w') as out_f:
    s = ' '.join(l)
    out_f.write(str(len(l)) + '\n' + s)