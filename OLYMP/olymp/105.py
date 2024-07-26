with open('a.txt', 'r') as in_f:
    n = in_f.read()

s = 0
for i in n:
    s += int(i)

with open('b.txt', 'w') as out_f:
    out_f.write(str(s))