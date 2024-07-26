with open('a.txt', 'r') as in_f:
    n, m = map(int, in_f.readline().split())
    l = [int(i) for i in in_f.readline().split()]

ans = []
l_start, r = l[0], l[0]
for i in l[1:]:
    if i == r + 1:
        r = i
    else:
        if l_start != r:
            ans.append('{}-{}'.format(l_start, r))
        else:
            ans.append(str(l_start))
        l_start, r = i, i
if l_start != r:
    ans.append('{}-{}'.format(l_start, r))
else:
    ans.append(str(l_start))
ans = ','.join(ans)

with open('b.txt', 'w') as out_f:
    out_f.write(ans)