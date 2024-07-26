def is_power(n):
    if n == 0:
        return False
    while n != 1:
        if n % 3 != 0:
            return False
        n = n // 3
    return True

print('ДА' if is_power(int(input())) else 'НЕТ')