with open('a.txt', 'r') as in_f:
    n = int(in_f.readline())
    l = [int(i) for i in in_f.readline().split()]
    m = int(in_f.readline())
    k = [int(i) for i in in_f.readline().split()]

a = []
for i in range(n):
    if l[i] not in k:
        a.append(l[i])

for i in range(len(a)):
    a[i] = str(a[i])

s = ' '.join(a)    

with open('b.txt', 'w') as out_f:
    out_f.write(s)