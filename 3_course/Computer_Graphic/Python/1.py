def check(n):
    for i in str(n):
        if int(i) == 0 or n % int(i) != 0:
            return False
    return True

print([i for i in range(int(input()), int(input()) + 1) if check(i)])