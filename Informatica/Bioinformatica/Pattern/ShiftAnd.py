import sys

T = [int(i) for i in sys.argv[1]]
P = [int(i) for i in sys.argv[2]]
occurrences = 0

U = [[0] * (len(P)) for _ in range(26)]
M = [[0] * (len(P)) for _ in range(len(T))]

for i in range (0, len(P)):
	Temp = ord(P[i]) - 97
	U[Temp][i] = 1

if (T[0] == P[0]):
	M[0][0] = 1

for i in range (1, len(T)):
	for j in range (1, len(P)):
		M[i][j] = M[i - 1][j - 1]
	M[i][0] = 1
	Temp = ord(T[i]) - 97
	for j in range (0, len(P)):
		M[i][j] = U[Temp][j] & M[i][j]

for i in range (len(T)):
	occurrences = occurrences + M[i][len(P) - 1]

print(occurrences)
