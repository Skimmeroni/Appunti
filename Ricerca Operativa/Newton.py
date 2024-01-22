epsilon = 0.00001
oldX = 1
newX = oldX + epsilon + 1
iteration = 0

for i in range (0, 5):
#while (abs(newX - oldX) >= epsilon):
    D1 = 12 * (1 - oldX**3 - oldX**5)
    D2 = -12 * (3 * oldX**2 + 5 * oldX**4)
    oldX = oldX - (D1 / D2)
    iteration += 1
    print(str(iteration) + " " + str(D1) + " " + str(D2) + " " + str(oldX))
