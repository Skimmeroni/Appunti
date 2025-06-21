"""
To generate the SWIG binding:

swig -c++ -python Edge.i
$(CXX) -fPIC -c Edge.cxx Edge_wrap.cxx $(pkgconf --cflags python3)
$(CXX) -shared Edge.o Edge_wrap.o -lm -o _Edge.so
"""

import networkx as nx
import numpy as np
import matplotlib.pyplot as plt
import itertools
import sys
import Edge # Generated from SWIG

input_data = Edge.Matrix(sys.argv[1])
path = Edge.main_loop(input_data)
path = [path.__getitem__(i) for i in range(0, path.size())]
path.append(path[0])
path = list((itertools.pairwise(path)))

dim = range(0, input_data.size())
input_data = [[input_data.__getitem__(i, j) for i in dim] for j in dim]
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
