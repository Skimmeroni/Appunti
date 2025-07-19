import numpy as np
import matplotlib.pyplot as plt

x = np.linspace(0, 8 * np.pi, 1000)
threshold = 5 * np.pi
wavelength1 = 2 * np.pi
wavelength2 = np.pi

def piecewise_sine(x, threshold, wavelength1, wavelength2):
    transition_width = 0.2
    t = (x - threshold) / transition_width
    smooth_factor = 1 / (1 + np.exp(-t))
    wavelength = (1 - smooth_factor) * wavelength1 + smooth_factor * wavelength2
    return np.sin(2 * np.pi * x / wavelength)

y = piecewise_sine(x, threshold, wavelength1, wavelength2)
fig, ax = plt.subplots()
ax.plot(x, y, label = "sinusoidal wave", color = "blue")
ax.axvline(x = threshold, color = "red", linestyle = "--", label = "boundary")

ax.set_title("Light wave traversing two different media")
ax.set_xlabel("x")
ax.set_ylabel("D(x, 0)")
ax.legend()
ax.grid()
plt.savefig("transition.svg")
