"""
To generate the SWIG binding:

swig -python Annealing.i
$(CC) -fPIC -c Annealing.c Annealing_wrap.c $(pkgconf --cflags python3)
$(CC) -shared Annealing.o Annealing_wrap.o -lm -o _Annealing.so
"""

import networkx as nx
import numpy as np
import matplotlib.pyplot as plt
import sys
import itertools
import Annealing # Generated from SWIG

file = open(sys.argv[1], "r")
Annealing.cvar.NUMBER_OF_NODES = sum(1 for line in file)
file.close()

input_data = Annealing.adj_matrix_create_from_csv(sys.argv[1])
path = Annealing.main_loop(input_data)
path = [path.__getitem__(i) for i in range(0, Annealing.cvar.NUMBER_OF_NODES)]
path.append(path[0])
path = list((itertools.pairwise(path)))

input_data = Annealing.adj_matrix_create_from_csv(sys.argv[1])
dim = range(0, Annealing.cvar.NUMBER_OF_NODES)
input_data = [[Annealing.adj_matrix_at(input_data, i, j) for i in dim] for j in dim]
input_data = [[0 if entry == np.inf else entry for entry in row] for row in input_data]
input_data = [[round(entry, 6) for entry in row] for row in input_data]
input_data = np.array(input_data)

G = nx.DiGraph(input_data)
layout = nx.spring_layout(G, seed = 37, k = 16)
nx.draw_networkx_edges(G, layout, edgelist = path,
                       width = 3, edge_color = "red")
nx.draw_networkx(G, layout, node_size = 1000, arrows = True,
        arrowsize = 20, with_labels = True, node_color = "cyan")
nx.draw_networkx_edge_labels(G, layout, nx.get_edge_attributes(G, "weight"))

plt.show()

"""
#To solve the problem directly in Python:

P = nx.approximation.traveling_salesman_problem(G, method = nx.approximation.simulated_annealing_tsp, init_cycle = "greedy")
print(nx.path_weight(G, P, weight = "weight"))
"""
