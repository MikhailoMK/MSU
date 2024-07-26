def short(r1, k1, r2, k2):
    if r1 == r2:
        return str(abs(k1 - k2))
    elif k1 == k2:
        return str(min(abs(r1 - r2), 6 - abs(r1 - r2)) * k1)
    else:
        radial_distance = min(abs(r1 - r2), 6 - abs(r1 - r2))
        ring_distance = abs(k1 - k2)
        return str(min(radial_distance * k2 + ring_distance, radial_distance + ring_distance * k2))
    
with open('a.txt', 'r') as in_f:
    r1, k1, r2, k2 = map(int, in_f.readline().split())


with open('b.txt', 'w') as out_f:
    out_f.write(short(r1, k1, r2, k2))    