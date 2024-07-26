import numpy as np
import matplotlib.pyplot as plt
import matplotlib.animation as animation

fig, ax = plt.subplots()

def update(num):
    ax.clear()
    data = np.loadtxt('data_' + str(num) + '.txt')
    ax.plot(data[:, 0], data[:, 1])
    ax.set_title('Кадр ' + str(num))

ani = animation.FuncAnimation(fig, update, frames=range(100), repeat=False)
plt.show()