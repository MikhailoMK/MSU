with open('a.txt', 'r') as in_f:
    s = in_f.read()
    
with open('b.txt', 'w') as out_f:
    out_f.write(s)