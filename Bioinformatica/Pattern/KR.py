import sys
from functools import reduce

T = [int(i) for i in sys.argv[1]]
P = [int(i) for i in sys.argv[2]]
p = 3
occurrences = 0

def init(S):
    H = 0
    for i in range (0, len(S)):
        H = (H + (S[i] * 2**(len(S) - i - 1))) % p
    return H

Hp = init(P) 
Ht = init(T)

for i in range (1, len(T) - len(P) + 1):
    Ht = (((2 * Ht) % p) - (2**(len(P)) % p) * T[i - 1] + T[len(P) + i - 1]) % p
    if (Ht == Hp):
        occurrences = occurrences + 1

print(occurrences)
