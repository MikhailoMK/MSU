p = abs(int(input()))
step = 0
position = 0


while position < p or (position - p) % 2 != 0:
    step += 1
    position += step

print(step)