import numpy

mu = 5
c = 1
eta = 0.95
max_iterations = 100

def Q(solution):
	return 0

W = numpy.array(...)

s = numpy.random.random()
Phi = numpy.full((W.size, W.size), s)
best_solution = numpy.arange(W.size)

for it in max_iterations:
	C = numpy.arange(W.size)
	this_node = numpy.random.choice(C)
	this_solution = [this_node]
	C = numpy.delete(C, numpy.where(C == this_node))

	while (C.size > 0):
		probabilities = Phi[this_node, C] / Phi[this_node, C].sum()
		this_node = numpy.random.choice(C, p = probabilities)
		C = numpy.delete(C, numpy.where(C == this_node))
		numpy.append(this_solution, this_node)

	Phi[] = Phi[] + Q(this_solution)

	best_solution = this_solution if (Q(this_solution) > Q(best_solution)) else best_solution
	if (it % mu == 0):
		Phi = (1 - eta) * Phi

print(best_solution)
