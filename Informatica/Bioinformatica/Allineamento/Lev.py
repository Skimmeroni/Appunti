import sys

S1 = sys.argv[1]
S2 = sys.argv[2]

m = len(S1) + 1
n = len(S2) + 1

Lev = [[0] * (n) for _ in range(m)]

for i in range(1, m):               # The first row and first
	Lev[i][0] = i                   # column are computed from
for j in range(1, n):               # the base case of the
	Lev[0][j] = j                   # recurrence relation

for i in range(1, m):
	for j in range(1, n):
		A = Lev[i - 1][j] + 1       # A generic entry is given by
		B = Lev[i][j - 1] + 1       # computing its 3 companion values
		C = Lev[i - 1][j - 1]       # and finding the minimum

		if (S1[i - 1] != S2[j - 1]):
			C = C + 1

		Lev[i][j] = min(A, B, C)

print(Lev[m - 1][n - 1])            # The solution is the last entry
