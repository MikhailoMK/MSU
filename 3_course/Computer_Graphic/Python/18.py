n = int(input())
i = 2
mult = []

while i * i <= n:
    if n % i:
        i += 1
    else:
        n //= i
        mult.append(i)

if n > 1:
    mult.append(n)

print(*mult if mult else 'Нет простых множителей'.split())