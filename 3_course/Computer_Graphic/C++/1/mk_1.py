import numpy as np
import matplotlib.pyplot as plt

data = np.loadtxt('data_a.txt')

plt.plot(data[:, 0], data[:, 1])
plt.xlabel('x')
plt.ylabel('y')
plt.title('График функции')
plt.grid(True)
plt.show()