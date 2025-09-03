import csv
from sklearn.cluster import KMeans
from matplotlib import colormaps
from matplotlib import rcParams
import numpy as np
import matplotlib.pyplot as plt

Data = []

with open("geyser.csv", newline = '') as csvfile:
	entry = csv.reader(csvfile, delimiter = ',')
	for row in entry:
		Data.append([float(row[0]), float(row[1])])

X = [d[0] for d in Data]
Y = [d[1] for d in Data]
Data = np.array(Data)

kmeans = KMeans(n_clusters = 2, random_state = 0, n_init = "auto").fit(Data)

fig, ax = plt.subplots()
ax.set_facecolor("#d3d3d322")
ax.grid()
plt.scatter(X, Y, c = kmeans.labels_, s = rcParams["lines.markersize"], cmap = "cool")

ax.set_xlabel("Eruption duration (in minutes)")
ax.set_ylabel("Waiting time (in minutes)")
ax.set_title("Applying K-means (k = 2) to the faithful dataset")

if __name__ == "__main__":
	plt.savefig("geyser.svg", bbox_inches = "tight")
