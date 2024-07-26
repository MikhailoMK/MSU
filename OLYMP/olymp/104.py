with open('a.txt', 'r') as in_f:
    n = int(in_f.read())

def two(n):
    if n == 0:
        return False
    while n != 1:
        if n % 2 != 0:
            return False
        n //= 2
    return True

with open('b.txt', 'w') as out_f:
    out_f.write('YES' if two(n) else 'NO')