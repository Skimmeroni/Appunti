#import "../FoundationsQC_definitions.typ": *

Suppose one is given $2^(n)$ objects, each uniquely identified by a
binary string of $n$ bits. Suppose that there's interest in finding,
out of all these $2^(n)$ objects, a specific object identified by the
string $x_(0)$. This problem could model, for example, the search of
an element in a database whose IDs are unsorted.

The task of inspecting a generic string $x$ to determine if it is equal
to $x_(0)$ could be formalized mathematically by a function such as:

$ f(x) =
  cases(1 & "if" x = x_(0), 0 & "if" x != x_(0)) $

Solving this problem in a classical computation framework would simply
entail applying this function to all of the possible $2^(n)$ strings
that can be constructed with $n$ bits. Therefore, the classical time
bound for the problem is $O(2^(n))$.

A quantum algorithm known as *Grover algorithm*, whose quantum circuit
is presented below, can solve the problem faster:

#align(
	center,
	[#quantum-circuit(scale: 150%,
	                  lstick($ket(0)^(times.circle n)$, n: 4), gate($H$),
	                  mqgate($U_(f)$, n: 4), mqgate($D$, n: 4),
	                  midstick($dots$),
	                  mqgate($U_(f)$, n: 4), mqgate($D$, n: 4),
	                  meter(), [\ ],
	                  1, gate($H$), 1, 1, midstick($dots$), 1, 1, meter(), [\ ],
	                  setwire(0), 1, midstick($dots.v$), 1, 1, 1, 1, 1, midstick($dots.v$), [\ ],
	                  1, gate($H$), 1, 1, midstick($dots$), 1, 1, meter())
	]
)

The algorithm starts with $n$ qubits (each representing one of the bits of
the string) prepared in the $ket(0)$ state. Then, each qubit undergoes a
Hadamard transformation; for the sake of clarity, the resulting state is
denoted as $ket(eta)$:

$ ket(Psi_(0)) =
  (H times.circle H times.circle dots times.circle H)
  (ket(0) times.circle ket(0) times.circle dots times.circle ket(0)) =
  frac(1, sqrt(2^(n))) sum_(x in \{0, 1\}^(n)) ket(x) =
  ket(eta) $

Then, the quantum oracle that encodes $f$ is applied. Given a generic
$n$-qubit state $ket(x)$, the oracle can be defined as follows:

$ U_(f) ket(x) =
  cases(-ket(x) & "if" x = x_(0) "or equivalently if" f(x) = 1,
        ket(x) & "if" x != x_(0) "or equivalently if" f(x) = 0) =
  (-1)^(f(x)) ket(x) $

Applying the oracle gives:

$ ket(Psi_(1)) &=
  U_(f) ket(Psi_(0)) =
  U_(f) ket(eta) =
  U_(f) frac(1, sqrt(2^(n))) sum_(x in \{0, 1\}^(n)) ket(x) =
  frac(1, sqrt(2^(n))) sum_(x in \{0, 1\}^(n)) U_(f) ket(x) = \
  &= frac(1, sqrt(2^(n))) sum_(x in \{0, 1\}^(n)) (-1)^(f(x)) ket(x) =
  ket(eta) - frac(2, sqrt(2^(n))) ket(x_(0)) $

The resulting state is a superposition of all strings, each having the
same amplitude but the $ket(x_(0))$ state had its sign flipped. Note
that, at this point, nothing much has changed: if one were to sample
the current state, the probability of finding any state is exactly the
same, because the modulus square of a negative amplitude is still positive.

Next, the *diffusion operator* $D = 2 ketbra(eta, eta) - I$ is applied,
giving:

$ ket(Psi_(2)) &=
  D ket(Psi_(1)) =
  (2 ketbra(eta, eta) - I) ket(Psi_(1)) =
  (2 ketbra(eta, eta) - I) (ket(eta) - frac(2, sqrt(2^(n))) ket(x_(0))) = \
  &= 2 ket(eta) braket(eta, eta) -
     frac(4, sqrt(2^(n))) ket(eta) braket(eta, x_(0)) -
     I ket(eta) +
     I frac(2, sqrt(2^(n))) ket(x_(0)) =
  ket(eta) - frac(4, sqrt(2^(n))) ket(eta) braket(eta, x_(0)) + frac(2, sqrt(2^(n))) ket(x_(0)) $

Note that, since all base states are orthonormal:

$ braket(eta, x_(0)) =
  frac(1, sqrt(2^(n))) sum_(x in \{0, 1\}^(n)) braket(x, x_(0)) =
  frac(1, sqrt(2^(n))) (0 + 0 + dots + 1 + dots + 0) =
  frac(1, sqrt(2^(n))) $

Where the single $1$ is the contribution given by $ket(x_(0))$ itself.
Substituting the expression in the previous one gives:

$ ket(Psi_(2)) =
  ket(eta) - frac(4, sqrt(2^(n))) ket(eta) (frac(1, sqrt(2^(n)))) + frac(2, sqrt(2^(n))) ket(x_(0)) =
  ket(eta) - frac(4, 2^(n)) ket(eta) + frac(2, sqrt(2^(n))) ket(x_(0)) =  
  (1 - frac(4, 2^(n))) ket(eta) + frac(2, sqrt(2^(n))) ket(x_(0)) $

Explicitly expanding $ket(eta)$ can give a clearer understanding of the
result:

$ ket(Psi_(2)) &=
  (1 - frac(4, 2^(n))) ket(eta) + frac(2, sqrt(2^(n))) ket(x_(0)) =
  (1 - frac(4, 2^(n))) (frac(1, sqrt(2^(n))) sum_(x in \{0, 1\}^(n)) ket(x)) + frac(2, sqrt(2^(n))) ket(x_(0)) = \
  &= (1 - frac(4, 2^(n))) (frac(1, sqrt(2^(n))) (ket(x_(0)) + sum_(x in \{0, 1\}^(n) - \{x_(0)\}) ket(x))) +
     frac(2, sqrt(2^(n))) ket(x_(0)) = \
  &= (1 - frac(4, 2^(n))) (frac(1, sqrt(2^(n))) ket(x_(0)) + frac(1, sqrt(2^(n))) sum_(x in \{0, 1\}^(n) - \{x_(0)\}) ket(x)) +
     frac(2, sqrt(2^(n))) ket(x_(0)) = \
  &= frac(1, sqrt(2^(n))) ket(x_(0)) +
     frac(1, sqrt(2^(n))) sum_(x in \{0, 1\}^(n) - \{x_(0)\}) ket(x) -
     frac(4, 2^(n)) frac(1, sqrt(2^(n))) ket(x_(0)) -
     frac(4, 2^(n)) frac(1, sqrt(2^(n))) sum_(x in \{0, 1\}^(n) - \{x_(0)\}) ket(x) +
     frac(2, sqrt(2^(n))) ket(x_(0)) = \
  &= (frac(1, sqrt(2^(n))) - frac(4, 2^(n)) frac(1, sqrt(2^(n)))) sum_(x in \{0, 1\}^(n) - \{x_(0)\}) ket(x) +
     (frac(1, sqrt(2^(n))) - frac(4, 2^(n)) frac(1, sqrt(2^(n))) + frac(2, sqrt(2^(n)))) ket(x_(0)) = \
  &= frac(2^(n) - 4, 2^(n) sqrt(2^(n))) sum_(x in \{0, 1\}^(n) - \{x_(0)\}) ket(x) +
     frac(3 dot 2^(n) - 4, 2^(n) sqrt(2^(n))) ket(x_(0)) approx
     frac(2^(n) - 4, 2^(n) sqrt(2^(n))) sum_(x in \{0, 1\}^(n) - \{x_(0)\}) ket(x) +
     3 (frac(2^(n) - 4, 2^(n) sqrt(2^(n)))) ket(x_(0)) $

Which means that the amplitude of the state $ket(x_(0))$ is roughly
three times the amplitude of all the other states. This means that
now, if the state is sampled, there is an increased probability of
obtaining $ket(x_(0))$ than of obtaining any other state, even though
this is not necessarely certain.

The idea is to apply repeatedly the unitary matrix and the diffusion
operator so that the probability of obtaining $ket(x_(0))$ becomes
arbitrarely large. With enough _amplitude amplifications_, the chance
of obtaining $ket(x_(0))$ is almost certain. For example, to have a 
$90\%$ probability of obtaining $ket(x_(0))$, roughly $ceil.l frac(pi, 4)
sqrt(2^(n)) ceil.r$ amplitude amplifications are necessary.

This means that the advantage over classical computation given by
the Grover Algorithm is of a quadratic factor, giving a time bound
of $O(sqrt(2^(n)))$. It has also been proven that no algorithm,
whether classical or quantum, can achieve a time bound lower than this.
