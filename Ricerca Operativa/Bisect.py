epsilon = 0.01
left = -1
right = 2
opt = (right + left) / 2
iteration = 0

while (right - left > 2 * epsilon):
    d = (12 * (1 - opt**3 - opt**5))
    if (d >= 0):
        left = opt
    else:
        right = opt
    opt = (right + left) / 2
    iteration += 1
    print(str(iteration) + " " + str(d) + " " + str(left) + " " + str(right) + " " + str(opt))
