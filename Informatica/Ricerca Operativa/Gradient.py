import sympy as sp
#sp.init_printing(use_unicode=True)

t = sp.Symbol("t")
p = (0, 0)
g = (2 * p[1] - 2 * p[0], 2 * p[0] + 2 - 4 * p[1])
epsilon = 0.1

while (g[0] >= 0.1 or g[1] >= 0.1):
    g = (2 * p[1] - 2 * p[0], 2 * p[0] + 2 - 4 * p[1])
    v = (sp.simplify(p[0] + t * g[0]), sp.simplify(p[1] + t * g[1]))
    s = sp.simplify(2 * v[0] * v[1] + 2 * v[1] - (v[0])**2 - 2 * (v[1])**2)
    T = sp.solve(sp.diff(s))[0]
    P = p
    p = (p[0] + T * g[0], p[1] + T * g[1])
    print(str(P[0]) + " " + str(P[1]) + " " +
          str(g[0]) + " " + str(g[1]) + " " +
          str(v[0]) + " " + str(v[1]) + " " +
          str(s) + " " + str(T) + " " +
          str(p[0]) + " " + str(p[1]))

