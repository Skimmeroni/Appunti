import sys

T = [int(i) for i in sys.argv[1]]
P = [int(i) for i in sys.argv[2]]
p = 3
occurrences = 0

def check(S):
    b = True
    for i in range (0, len(S)):
        if (S[i] != 1 and S[i] != 0):
            b = False
    return b

def init(S, n):
    H = 0
    for i in range (0, len(S)):
        H = (H + (S[i] * 2**(n - i - 1))) % p
    return H

if (check(T) == False or check(P) == False):
    print("Strings are not binary")
    sys.exit(1)

Hp = init(P, len(P))
Ht = init(T, len(P))

for i in range (1, len(T) - len(P) + 1):
    Ht = (((2 * Ht) % p) - (2**(len(P)) % p) * T[i - 1] + T[len(P) + i - 1]) % p
    if (Ht == Hp):
        occurrences = occurrences + 1

print(occurrences)
