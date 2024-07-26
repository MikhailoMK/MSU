with open('a.txt', 'r') as in_f:
    n = in_f.read().split('\n')

l = [n[i].split(' ') for i in range(len(n))]

for i in range(len(l)):
    for j in range(len(l[i])):
        l[i][j] = int(l[i][j])

s = []
for i in range(l[0][0]):
    if l[1].count(l[1][i]) > 1:
        s.append(i + 1)

if s == []:
    s = [0, 0]

m = str(s)[1:][:-1].replace(',', '')


with open('b.txt', 'w') as out_f:
    out_f.write(m)