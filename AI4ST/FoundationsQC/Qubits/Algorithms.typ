#import "../FoundationsQC_definitions.typ": *

*Quantum algorithms* are the counterpart to classical algorithms, a set
of well-defined procedures that use quantum operators instead of classical
operators.

Quantum algorithms, as expected, must operate on quantum information
(elements of an Hilbert space), but real world information is generally
classical information. Therefore, the first step in constructing a quantum
algorithm is to device a method of representing classical information as
quantum information. That is, defining a *quantum embedding*.

The simplest form of quantum embedding is *base embedding*, where classical
bits are mapped to base states. This means that a binary string $b_(1) b_(2)
dots b_(n)$ is mapped to the state $ket(b_(1) b_(2) dots b_(n))$. Of course,
this embedding is only possible if the input is binary, but since all strings
can be encoded into a binary alphabet in a unique way, theoretically speaking
this is not restrictive. It should be noted, however, that this embedding
might be wasteful and/or cumbersome, since to represent $n$ classical bits,
just as many qubits are needed.

Quantum transformations are carried out by unitary matrices, all having
a defined inverse. This means that, when presented with an output, it is
possible to recover the original input without any loss of information
simply by multiplying the output with the inverse of the transformation.
In other words, quantum computation is *reversible*.

Classical computation, on the other hand, is in general not reversible:
if an output of a circuit is presented, it may not be possible to recover
the original input. For example, whereas the logical `NOT` is reversible,
the logical `AND` is not. This is not a setback, however, because any
classical function can be adjusted to become reversible.

#exercise[
	Why is the logical `AND` not reversible?
]
#solution[
	Let $A$ and $B$ be two classical bits. Consider $A and B$: if the
	output is $1$, then it is known for sure that both $A$ and $B$ were
	equal to $1$. On the other hand, if the output is $0$, there are
	three possibilities: $A = 0$ and $B = 0$, $A = 1$ and $B = 0$,
	$A = 0$ and $B = 1$. Not having other prior information, all of
	these possibilities are equally probable.
]

First, consider a reversible classical function with $n$ input and $n$
output bits. The output of this function is just a permutation $2^(n)$
of bit strings given in input. This means that for any classical reversible
function there is a permutation $pi: bold(Z)_(2^(n)) -> bold(Z)_(2^(n))$
that maps input strings to output strings in the exact same way as the
original function. This permutation can be used, without any additional
modification, to define an equivalent quantum transformation:

$ U_(pi): sum_(x = 0)^(2^(n) - 1) a_(x) ket(x) ->
          sum_(x = 0)^(2^(n) - 1) a_(x) ket(pi(x)) $

Now consider a non-reversible classical function $f: bold(Z)_(2^(n)) ->
bold(Z)_(2^(m))$ with $n$ input and $m$ output bits. This function can
be modified in a standard way to create a reversible function $pi_(f):
bold(Z)_(2^(n + m)) -> bold(Z)_(2^(n + m))$ that does the exact same
thing, but is reversible.

This function acts on two subset of bits, a set of $n$ bits that contains
the input and a set of $m$ bits. Both sets are given to the function as
input and both are present as output. Each pair $(x, y)$ of input-output
bits is mapped by the function to the pair $(x, y or.dot f(x))$, where
$or.dot$ denotes the logical `XOR` #footnote[A much more common notation
for the logical `XOR` is $xor$, but this notation is here avoided because
it conflicts with the direct sum symbol.] and $f$ is the original, non
reversible function. In other words, $pi_(f)$ simply applies the original
function $f$ to $x$ and returns both the original input unchanged and the
actual value of $f(x)$, stored in $y$.

#exercise[
	Construct a reversible version of the logical `AND`.
]
#solution[
	#align(
		center,
		[#grid(
			columns: (0.5fr, 0.5fr),
			[#table(
				columns: 6,
				table.cell(colspan: 3)[*Inputs*], table.cell(colspan: 3)[*Outputs*],
				[*A*], [*B*], [*C*], [*A*], [*B*], [*C #math.or.dot (A #math.and B)*],
				[$0$], [$0$], [$0$], [$0$], [$0$], [$0$],
				[$0$], [$0$], [$1$], [$0$], [$0$], [$1$],
				[$0$], [$1$], [$0$], [$0$], [$1$], [$0$],
				[$0$], [$1$], [$1$], [$0$], [$1$], [$1$],
				[$1$], [$0$], [$0$], [$1$], [$0$], [$0$],
				[$1$], [$0$], [$1$], [$1$], [$0$], [$1$],
				[$1$], [$1$], [$0$], [$1$], [$1$], [$1$],
				[$1$], [$1$], [$1$], [$1$], [$1$], [$0$],
			)],
			[#quantum-circuit(lstick("A"), mqgate("AND", n: 3), rstick("A"), [\ ],
			                  lstick("B"), 1, rstick("B"), [\ ],
			                  lstick("C"), 1, rstick([C #math.or.dot (A #math.and B)]))]
		)]
	)
]

Since this new function $pi_(f)$ is now reversible, it is possible to construct
a unitary transformation $U_(f): ket(x\, y) -> ket(x\, y or.dot f(x))$ that
implements the function, depicted as follows:

#align(
	center,
	[#quantum-circuit(scale: 150%,
	                  lstick([$ket(x)$]), mqgate([$U_(f)$], n: 2), rstick($ket(x)$), [\ ],
			          lstick([$ket(y)$]), 1, rstick([$ket(y or.dot f(x))$]))
	]
)

Note that, in general, this method of constructing reversible counterparts
of non-reversible functions is highly inefficient, and there are ad-hoc
methods that use less bits. This is not important, however, since the
interest is to show that there is a method that always works, and therefore
that each function that a classical computer can compute can be just as well
computed by a quantum computer.

=== Deutsch-Josza Algorithm

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
	                  lstick($ket(0)$), nwire($n$), gate($H$),
	                  mqgate($U_(f)$, n: 2), gate($H$), meter(),
	                  [\ ],
	                  lstick($ket(1)$), gate($H$))
	]
)

The circuit starts with $n$ qubits initialized in the state $ket(0)$
and a single auxiliary qubit, called *ancillary qubit*, in state $ket(1)$.
As for the classical gates case, the ancillary qubit is necessary for the
quantum computation to be reversible. The starting state of the entire
system can be then written as $ket(000 dots 01)$.

The first operation encountered is an Hadamard gate applied on the ancillary
qubit, while leaving the other $n$ qubits unchanged:

$ ket(Psi_(0)) =
  (I times.circle I times.circle dots times.circle I times.circle H) ket(000 dots 01) =
  (I ket(0)) times.circle (I ket(0)) times.circle dots times.circle (H ket(1)) =
  ket(000 dots 0-) $

Then, an Hadamard gate is applied to the $n$ qubits, leaving the
ancillary bit unchanged:

$ ket(Psi_(1)) &=
  (H times.circle H times.circle dots times.circle H times.circle I) ket(Psi_(0)) =
  (H ket(0)) times.circle (H ket(0)) times.circle dots times.circle (I ket(-)) = \
  &= (frac(1, sqrt(2)) (ket(0) + ket(1))) times.circle 
     (frac(1, sqrt(2)) (ket(0) + ket(1))) times.circle 
     dots times.circle
     (frac(1, sqrt(2)) (ket(0) + ket(1))) times.circle ket(-) = \
  &= frac(1, sqrt(2^(n))) sum_(x in \{0, 1\}^(n)) ket(x) ket(-) =
  frac(1, sqrt(2^(n + 1))) sum_(x in \{0, 1\}^(n)) ket(x) (ket(0) - ket(1))
  $

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
  &= frac(1, sqrt(2^(n))) sum_(j in \{0, 1\}^(n)) (-1)^(x dot.circle j) ket(j) $

Where $dot.circle$ denotes the inner product. Substituting it back:

$ ket(Psi_(3)) &=
  frac(1, sqrt(2^(n))) sum_(x in \{0, 1\}^(n)) (-1)^(f(x)) frac(1, sqrt(2^(n))) sum_(j in \{0, 1\}^(n)) (-1)^(x dot.circle j) ket(j) =
  frac(1, 2^(n)) sum_(x in \{0, 1\}^(n)) (-1)^(f(x)) sum_(j in \{0, 1\}^(n)) (-1)^(x dot.circle j) ket(j) = \
  &= frac(1, 2^(n)) sum_(x in \{0, 1\}^(n)) sum_(j in \{0, 1\}^(n)) (-1)^(f(x) + x dot.circle j) ket(j) $

Applying a measurement process with respect to the state $ket(000 dots 0)$:

$ frac(1, 2^(n)) sum_(x in \{0, 1\}^(n)) sum_(j in \{0\}^(n)) (-1)^(f(x) + x dot.circle 0) ket(0) =
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
