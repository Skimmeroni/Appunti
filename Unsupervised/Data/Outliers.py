import matplotlib.pyplot as plt
from sklearn.datasets import make_blobs
from sklearn.preprocessing import StandardScaler
from sklearn.cluster import DBSCAN

data, labels = make_blobs(n_samples = 750,
                          centers = [[1, 1], [-1, -1], [1, -1]],
                          cluster_std = 0.4,
                          random_state = 0)
data = StandardScaler().fit_transform(data)

result = DBSCAN(eps = 0.3, min_samples = 10).fit(data)
colors = ["blue" if i == -1 else "gray" for i in result.labels_]

plt.scatter(x = data[:, 0], y = data[:, 1], c = colors)
plt.savefig("outlier.svg", format = "svg", dpi = 300)
plt.close()
