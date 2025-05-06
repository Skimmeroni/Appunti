#import "../FoundationsQC_definitions.typ": *

Consider a function $f: \{0, 1\}^(n) -> \{0, 1\}$ that has in input a
binary string for length $n$ and returns a binary value. This function
in known in advance to be either _constant_, meaning that it has the
same output for any input, or _balanced_, meaning that it returns each
output an equal amount of times. In this case, $f$ is constant if its
output is always $0$ or always $1$ and is balanced if its output is
$0$ $50\%$ of the times and $1$ $50\%$ of the times. The task is to
determine in which of the two categories it falls.

A classical algorithm that solves this problem would necessarely resort
to a "brute force" approach. In particular, in the most unfavorable case,
a classical algorithm would need to test the function on half of all the
$2^(n)$ possible strings, that is, $2^(n - 1)$ function calls. This is
because, assuming that the function has always returned the same output
on all the previous trials, if the $2^(n - 1) + 1$-th output is the same
as before the function is necessarely constant, otherwise is balanced.
This means that the computational complexity of the algorithm is $O(2^(n))$.

It is possible to construct a quantum algorithm that solves this problem
in $O(1)$ time. This algorithm is called *Deutsch-Josza Algorithm*, and
is depicted as a quantum circuit as follows:

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

The circuit starts with $n + 1$ qubits initialized in the state $ket(0)$.
The last extra qubit, called *ancillary qubit*, is necessary for the quantum
computation to be reversible. The starting state of the entire system can be
then written as $ket(000 dots 0)$.

The last qubit is changed from $ket(0)$ to $ket(1)$ applying an $X$ gate,
leaving the other qubits unchanged:

$ ket(Psi_(0)) =
  (I times.circle I times.circle dots times.circle I times.circle X) ket(000 dots 0) =
  (I ket(0)) times.circle (I ket(0)) times.circle dots times.circle (X ket(0)) =
  ket(000 dots 01) $

Then, an Hadamard gate is applied to all the qubits:

$ ket(Psi_(1)) &=
  (H times.circle H times.circle dots times.circle H) ket(Psi_(0)) =
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
  frac(1, sqrt(2^(n + 1))) sum_(x in \{0, 1\}^(n)) ket(x) ket(0 or.dot f(x)) - ket(x) ket(1 or.dot f(x)) $

Consider $ket(x) ket(0 or.dot f(x)) - ket(x) ket(1 or.dot f(x))$. Since $0$
and $1$ are single bits and opposite in value, $ket(0 or.dot f(x))$ and
$ket(1 or.dot f(x))$ will always be one the negation of the other. It is
therefore possible to rewrite the expression as $ket(x) ket(f(x)) - ket(x)
ket(overline(f(x))))$. The expression can be simplified even further by
observing what happens when the function $f(x)$ is substituted explicitly
with its possible outputs:

$ ket(x) ket(f(x)) - ket(x)ket(overline(f(x)))) =
  cases(
  ket(x) ket(0) - ket(x) ket(overline(0)) =
  ket(x) ket(0) - ket(x) ket(1) =
  ket(x) (ket(0) - ket(1)),
  ket(x) ket(1) - ket(x) ket(overline(1)) =
  ket(x) ket(1) - ket(x) ket(0) =
  ket(x) (ket(1) - ket(0))) =
  (-1)^(f(x)) ket(x) (ket(0) - ket(1)) $

Substituting in the previous state gives:

$ ket(Psi_(2)) =
  frac(1, sqrt(2^(n + 1))) sum_(x in \{0, 1\}^(n)) (-1)^(f(x)) ket(x) (ket(0) - ket(1)) $

At this point, the ancillary bit is no longer necessary and can be ignored,
and the following remains:

$ ket(Psi_(2)) =
  frac(1, sqrt(2^(n))) sum_(x in \{0, 1\}^(n)) (-1)^(f(x)) ket(x) $

Applying the Hadamard gate (again) gives:

$ ket(Psi_(3)) =
  H ket(Psi_(2)) =
  H frac(1, sqrt(2^(n))) sum_(x in \{0, 1\}^(n)) (-1)^(f(x)) ket(x) =
  frac(1, sqrt(2^(n))) sum_(x in \{0, 1\}^(n)) (-1)^(f(x)) H ket(x) $

Recall that $H ket(0) = frac(sqrt(2), 2) (ket(0) + ket(1))$, whereas
$H ket(1) = frac(sqrt(2), 2) (ket(0) - ket(1))$. It is then possible
to write the result of applying a Hadamard gate to a single unknown
bit $x_(i)$ as $H ket(x_(i)) = frac(sqrt(2), 2) (ket(0) + (-1)^(x_(i))
ket(1))$. This result can be generalized:

$ H ket(x_(1) x_(2) dots x_(n)) &=
  H ket(x_(1)) times.circle H ket(x_(2)) times.circle dots times.circle H ket(x_(n)) = \
  &= frac(1, sqrt(2)) (ket(0) + (-1)^(x_(1)) ket(1)) times.circle
  frac(1, sqrt(2)) (ket(0) + (-1)^(x_(2)) ket(1)) times.circle
  dots times.circle
  frac(1, sqrt(2)) (ket(0) + (-1)^(x_(n)) ket(1)) = \
  &= frac(1, sqrt(2^(n))) sum_(j in \{0, 1\}^(n)) (-1)^(angle.l x\, j angle.r) ket(j) $

Where $angle.l angle.r$ denotes the inner product. Substituting it back:

$ ket(Psi_(3)) &=
  frac(1, sqrt(2^(n))) sum_(x in \{0, 1\}^(n)) (-1)^(f(x)) frac(1, sqrt(2^(n))) sum_(j in \{0, 1\}^(n)) (-1)^(angle.l x\, j angle.r) ket(j) =
  frac(1, 2^(n)) sum_(x in \{0, 1\}^(n)) (-1)^(f(x)) sum_(j in \{0, 1\}^(n)) (-1)^(angle.l x\, j angle.r) ket(j) = \
  &= frac(1, 2^(n)) sum_(x in \{0, 1\}^(n)) sum_(j in \{0, 1\}^(n)) (-1)^(f(x) + angle.l x\, j angle.r) ket(j) $

Applying a measurement process with respect to the state $ket(000 dots 0)$:

$ frac(1, 2^(n)) sum_(x in \{0, 1\}^(n)) sum_(j in \{0\}^(n)) (-1)^(f(x) + angle.l x\, 0 angle.r) ket(0) =
  frac(1, 2^(n)) sum_(x in \{0, 1\}^(n)) (-1)^(f(x) + x dot 0) ket(0) =
  frac(1, 2^(n)) sum_(x in \{0, 1\}^(n)) (-1)^(f(x)) ket(0) $

The probability of obtaining this state is therefore:

$ P_(0) = abs(frac(1, 2^(n)) sum_(x in \{0, 1\}^(n)) (-1)^(f(x)))^(2) $

Now consider the case in which $f(x)$ is constant, meaning that $f(x) = 0$
for all $x$ or $f(x) = 1$ for all $x$. Consider the first case:
  
$ abs(frac(1, 2^(n)) sum_(x in \{0\}^(n)) (-1)^(0))^(2) = 
  abs(frac(1, 2^(n)) sum_(x in \{0\}^(n)) 1)^(2) =
  abs(frac(1, cancel(2^(n))) cancel(2^(n)))^(2) =
  abs(1)^(2) = 1^(2) = 1 $

As for the second case:

$ abs(frac(1, 2^(n)) sum_(x in \{1\}^(n)) (-1)^(1))^(2) =
  abs(frac(1, 2^(n)) -sum_(x in \{1\}^(n)) 1)^(2) = 
  abs(frac(-1, cancel(2^(n))) cancel(2^(n)))^(2) =
  abs(-1)^(2) = 1^(2) = 1 $

This means that the probability of observing the state $ket(000 dots 0)$
is $1$ (complete certainty) when the function is constant.

Consider instead the case in which $f(x)$ is balanced. Since $f(x) = 0$
on one half of the inputs and $f(x) = 1$ on the other half of the inputs,
the sum cancels:

$ abs(frac(1, 2^(n)) sum_(x in \{0, 1\}^(n)) (-1)^(f(x)))^(2) = 
  abs(frac(1, 2^(n)) ((-1)^(0) + (-1)^(0) + dots + (-1)^(1) + (-1)^(1)))^(2) = 
  abs(frac(1, 2^(n)) 0)^(2) = 
  abs(0)^(2) = 0^(2) = 0 $

This means that the probability of observing the state $ket(000 dots 0)$
is $0$ (complete impossibility) when the function is balanced.

The algorithm then solves the problem in $O(1)$ time, because the function
and each gate is invoked exactly once. Note how this problem is, from a
practical standpoint, useless, since there are no real-world applications
for solving it. Nevertheless, it is an instructive example on how a quantum
computer would solve a problem exponentially faster than any classical
computer could.
