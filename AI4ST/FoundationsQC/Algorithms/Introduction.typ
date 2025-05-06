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
