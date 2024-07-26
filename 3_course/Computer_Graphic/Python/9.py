n = int(input())
coin = 0
layer = 0

while n >= (layer + 1):
    layer += 1
    coin += layer
    n -= layer

print(f'Монет: {coin}, Слоёв: {layer}')