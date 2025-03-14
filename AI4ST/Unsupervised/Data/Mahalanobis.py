import numpy as np
from sklearn.datasets import make_regression
from scipy.spatial.distance import pdist, squareform
import matplotlib.pyplot as plt

X, Y = make_regression(n_samples = 100, n_features = 1,
                       noise = 50, random_state = 0)
X = np.array([i[0] for i in X])

M = list(zip(X, Y))
M = np.array([(round(i[0], 2), round(i[1], 2)) for i in M])
D = pdist(M, metric = 'mahalanobis')
D = np.array([round(i, 2) for i in D])
D = squareform(D)

M.sort()
B = ["blue" for i in range(0, 100)]
# Pick three points
B[9] = B[12] = B[95] = "red"

plt.scatter(X, Y, color = B)
plt.show()
