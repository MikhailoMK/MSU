import numpy as np
import matplotlib.pyplot as plt

data = np.loadtxt('data_b.txt')

x = data[:, 0]
y = data[:, 1]
z = data[:, 2]

x = x.reshape((int(np.sqrt(len(x))), int(np.sqrt(len(x)))))
y = y.reshape((int(np.sqrt(len(y))), int(np.sqrt(len(y)))))
z = z.reshape((int(np.sqrt(len(z))), int(np.sqrt(len(z)))))

plt.contour(x, y, z, colors=['red', 'green', 'blue'])
plt.xlabel('x')
plt.ylabel('y')
plt.title('График контуров')
plt.show()