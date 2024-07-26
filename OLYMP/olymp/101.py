with open('a.txt', 'r') as in_f:
    data = in_f.read()

l = data.split()
s = 0
for i in l:
    s += int(i)

with open('b.txt', 'w') as out_f:
    out_f.write(str(s))