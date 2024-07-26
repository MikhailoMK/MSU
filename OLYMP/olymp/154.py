with open('a.txt', 'r') as in_f:
    n, m = map(int, in_f.readline().split())
    l = [list(map(int, i.split())) for i in in_f]

dp = [[0] * m for _ in range(n)]
dp[0][0] = l[0][0]

for i in range(1, n):
    dp[i][0] = dp[i - 1][0] + l[i][0]

for j in range(1, m):
    dp[0][j] = dp[0][j - 1] + l[0][j]

for i in range(1, n):
    for j in range(1, m):
        dp[i][j] = min(dp[i - 1][j], dp[i][j - 1]) + l[i][j]

s = dp[-1][-1]

with open('b.txt', 'w') as out_f:
    out_f.write(str(s))