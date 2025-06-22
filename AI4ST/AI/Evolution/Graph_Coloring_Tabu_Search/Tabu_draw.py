import networkx as nx
import numpy as np
import matplotlib.pyplot as plt
import sys
import Tabu # Generated from SWIG

file = open(sys.argv[1], "r")
Tabu.cvar.NUMBER_OF_NODES = sum(1 for line in file)
file.close()
Tabu.cvar.NUMBER_OF_COLORS = int(sys.argv[2])
Tabu.cvar.MUTATION_PROBABILITY = 1 / float(Tabu.cvar.NUMBER_OF_NODES)

input_data = Tabu.adj_matrix_create_from_csv(sys.argv[1])
colors = Tabu.main_loop(input_data)
colors = [colors.__getitem__(i) for i in range(0, Tabu.cvar.NUMBER_OF_NODES)]

input_data = Tabu.adj_matrix_create_from_csv(sys.argv[1])
dim = range(0, Tabu.cvar.NUMBER_OF_NODES)
input_data = [[Tabu.adj_matrix_at(input_data, i, j) for i in dim] for j in dim]
input_data = [[bool(entry) for entry in row] for row in input_data]
input_data = np.array(input_data)

G = nx.DiGraph(input_data)
nx.draw(G, node_size = 1000, pos = nx.circular_layout(G), arrows = True,
        arrowsize = 20, with_labels = True, node_color = colors,
        cmap = plt.cm.viridis)
plt.show()
