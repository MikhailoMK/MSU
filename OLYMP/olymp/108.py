with open('b.txt', 'w') as out_f:
    for i in range(100, 1000):
        if i // 100 != i % 100 // 10 and i // 100 != i % 100 % 10 and i % 100 // 10 != i % 100 % 10:
            i = str(i) + '\n'
            out_f.write(i)