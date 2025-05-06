#import "../FoundationsQC_definitions.typ": *

Suppose one is given a binary function $f : \{0, 1\}^(n) -> \{0, 1\}$
defined as $f(x) = angle.l s, x angle.r$, where $s$ is an unknown $n$-bit
binary string and $angle.l angle.r$ denotes the dot product. Assuming to
know the value of $f(x)$ for all $n$-bit binary strings $x$, the task is
to find $s$.

The most efficient way to solve the problem in a classical framework
would be to pick $n$ strings out of the posssible $2^(n)$ strings and
evaluate the function on those strings. This leads to a system of linear
equations having $n$ unknowns. Of course, the most reasonable choice of
strings are those having $0$ in each position but one:

$ cases(
  f(1000 dots 0) =
  angle.l s\, 1000 dots 0 angle.r =
  s_(1) dot 1 + s_(2) dot 0 + dots + s_(n) dot 0 =
  s_(1),
  f(0100 dots 0) =
  angle.l s\, 0100 dots 0 angle.r =
  s_(1) dot 0 + s_(2) dot 1 + dots + s_(n) dot 0 = 
  s_(2),
  dots.v,
  f(0000 dots 1) =
  angle.l s\, 0000 dots 1 angle.r =
  s_(1) dot 0 + s_(2) dot 0 + dots + s_(n) dot 1 =
  s_(n)
) $

This means that the computational complexity of a classical algorithm for
this problem is $O(n)$.

A quantum algorithm known as *Bernstein-Vazirani algorithm*, whose quantum
circuit is presented below, can solve the problem faster. Notice how the
circuit is identical to the one presented for the Deutsch-Josza Algorithm,
except for the function encoded in the $U_(f)$ gate:

#align(
	center,
	[#quantum-circuit(scale: 150%,
	                  lstick($ket(0)^(times.circle n)$, n: 4), 1, gate($H$), mqgate($U_(f)$, n: 5), gate($H$), meter(), [\ ],
	                  1, 1, gate($H$), 1, gate($H$), meter(), [\ ],
	                  setwire(0), 1, 1, midstick($dots.v$), 1, midstick($dots.v$), midstick($dots.v$), [\ ],
	                  1, 1, gate($H$), 1, gate($H$), meter(), [\ ], 
	                  lstick($ket(0)$), gate($X$), gate($H$), 1)
	]
)

The algorithm starts with $n + 1$ qubits in state $ket(0)$, where each of
the first $n$ qubits represents one of the bits of the string and the last
qubit is an ancillary qubit. The last qubit is changed from $ket(0)$ to
$ket(1)$, leaving the other qubits unchanged:

$ ket(Psi_(0)) =
  (I times.circle I times.circle dots times.circle I times.circle X) ket(000 dots 0) =
  (I ket(0)) times.circle (I ket(0)) times.circle dots times.circle (X ket(0)) =
  ket(000 dots 01) $

A Hadamard gate is the applied to all the qubits:

$ ket(Psi_(1)) &=
  (H times.circle H times.circle dots times.circle H times.circle H) ket(Psi_(0)) =
  (H ket(0)) times.circle (H ket(0)) times.circle dots times.circle (H ket(1)) = \
  &= (frac(1, sqrt(2)) (ket(0) + ket(1))) times.circle 
     (frac(1, sqrt(2)) (ket(0) + ket(1))) times.circle 
     dots times.circle
     (frac(1, sqrt(2)) (ket(0) - ket(1))) = \
  &= frac(1, sqrt(2^(n + 1))) sum_(x in \{0, 1\}^(n)) ket(x) (ket(0) - ket(1)) $

It is now possible to apply $U_(f): ket(x\, y) -> ket(x\, y or.dot f(x))$
to the state:

$ ket(Psi_(2)) &=
  U_(f) ket(Psi_(1)) =
  U_(f) frac(1, sqrt(2^(n + 1))) sum_(x in \{0, 1\}^(n)) ket(x) (ket(0) - ket(1)) =
  frac(1, sqrt(2^(n + 1))) sum_(x in \{0, 1\}^(n)) U_(f) ket(x) (ket(0) - ket(1)) = \
  &= frac(1, sqrt(2^(n + 1))) sum_(x in \{0, 1\}^(n)) U_(f) ket(x) ket(0) - U_(f) ket(x) ket(1) =
  frac(1, sqrt(2^(n + 1))) sum_(x in \{0, 1\}^(n)) ket(x) ket(0 or.dot f(x)) - ket(x) ket(1 or.dot f(x)) = \
  &= frac(1, sqrt(2^(n + 1))) sum_(x in \{0, 1\}^(n)) (-1)^(f(x)) ket(x) (ket(0) - ket(1)) =
  frac(1, sqrt(2^(n + 1))) sum_(x in \{0, 1\}^(n)) (-1)^(angle.l x\, s angle.r) ket(x) (ket(0) - ket(1)) $

Discarding the last qubit and applying Hadamard again:

$ ket(Psi_(3)) &=
  H ket(Psi_(2)) =
  H frac(1, sqrt(2^(n))) sum_(x in \{0, 1\}^(n)) (-1)^(angle.l x\, s angle.r) ket(x) =
  frac(1, 2^(n)) sum_(x in \{0, 1\}^(n)) sum_(j in \{0, 1\}^(n)) (-1)^(angle.l x\, s angle.r or.dot angle.l x\, j angle.r) ket(j) = \
  &= frac(1, 2^(n)) sum_(x in \{0, 1\}^(n)) sum_(j in \{0, 1\}^(n)) (-1)^(angle.l x\, (s or.dot j) angle.r) ket(j) $

The amplitude of the state $ket(s)$ is:

$ frac(1, 2^(n)) sum_(x in \{0, 1\}^(n)) (-1)^(angle.l x\, (s or.dot s) angle.r) =
  frac(1, 2^(n)) sum_(x in \{0, 1\}^(n)) (-1)^(angle.l x\, 000 dots 0 angle.r) =
  frac(1, 2^(n)) sum_(x in \{0, 1\}^(n)) (-1)^(0) =
  frac(1, 2^(n)) sum_(x in \{0, 1\}^(n)) 1 =
  frac(1, cancel(2^(n))) cancel(2^(n)) =
  1 $

Which means that, when measuring with respect to the standard basis, the
state $ket(s)$ will be obtained with certainty. Since the algorithm has
performed a single function call to solve the problem, its time bound is
$O(1)$.
