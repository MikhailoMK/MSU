with open('a.txt', 'r') as in_f:
    s = in_f.read()

a = 'URA' if '1543' in s else 'NO'    
    
with open('b.txt', 'w') as out_f:
    out_f.write(a)