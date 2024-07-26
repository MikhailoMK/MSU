n = int(input())

for i in (2, 3, 5):
    while n % i == 0:
        n = n // i

print('ДА' if n > 1 else 'НЕТ')