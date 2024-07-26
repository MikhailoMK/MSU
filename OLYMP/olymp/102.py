with open('a.txt', 'r') as in_f:
    data = in_f.read()

l = [int(i) for i in data if i != ' ']

with open('b.txt', 'w') as out_f:
    out_f.write('YES' if abs(l[0] + l[1] - l[2] - l[3]) % 2 == 0 else 'NO')