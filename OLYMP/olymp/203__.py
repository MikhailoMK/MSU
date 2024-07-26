def count_partitions(n):
    dp = [0] * (n + 1)
    dp[0] = 1
    for i in range(1, n + 1):
        for j in range(i, n + 1):
            dp[j] += dp[j - i]
    return dp[n]

with open('a.txt', 'r') as in_f:
    n = int(in_f.readline())

ans = count_partitions(n)

with open('b.txt', 'w') as out_f:
    out_f.write(str(ans))