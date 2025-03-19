#import "../FoundationsQC_definitions.typ": *

A *Turing machine* is a fundamental theoretical model of computation.
It can be informally conceived as a moving head with an internal state
that can move along a tape of infinite lenght, divided into cells. The 
machine can perform one operation at a time, reading the symbol on the
current cell, replacing it with another symbol (or with the symbol itself)
and moving one cell to the left or to the right.

A Turing machine $M$ is formally defined as the tuple:

$ M = (Q, A, b in A, Sigma = A union \{L, R\}, delta: Q times A -> Q times Sigma, q_(0) in Q, F subset.eq Q) $

Where:

- $Q$ is the finite control set of states;
- $A$ is the alphabet of the tape (the symbols that can be written on it);
- $b$ is a special symbol called _blank_;
- $Sigma$ is the symbol output alphabet;
- $delta$ is a function that, given a state and a tape symbol,
  outputs a state and an output symbol;
- $q_(0)$ is a special state, called _starting state_;
- $F$ are special states, called _final states_;

Each Turing machine can be encoded into a binary string. That is, to each
tuple as defined above is possible to associate a binary string that is
able to represent the machine, without any loss of information. For a
Turing machine $M$, its binary encoding is denoted as $angle.l M angle.r$.

Any string $S$ can be expressed in different languages. The most generic
way to express $S$ is as $angle.l M angle.r w$, where $w$ is an input
string and $angle.l M angle.r$ is a Turing machine that accepts $w$ as
input and has $S$ as output. This equivalent description of $S$ with
respect to $angle.l M angle.r$ and $w$ is $d(S)$.

The lenght of $d(S)$ is denoted as $l(s)$. Note that both $angle.l M angle.r$
and $w$ are not unique, therefore there are countably infinitely many
combinations of Turing machines and inputs outputting $S$. A Turing
machine-input combination constitutes a *program*: $P = angle.l M angle.r$

Being countable, there must be (at least) one program that is _minimal_,
that is, constituted by the smallest number of characters. The length of
one of those minimal programs is called *Kolmogorov complexity* of the
string $S$, denoted as $K(S)$:

$ K(S) = min\{l(P) | M(P) = S\} $

The Kolmogorov complexity of a string can be conceived as the minimum
number of characters necessary to encode a string in the most generic
language possible.

The Turing machine here described is, to be more precise, a *deterministic
Turing machine*, because the transition relation is a function: each
time the head reads a symbol on the tape, it performs a single action.
It is also possible to construct a *non deterministic Turing machine*,
where the transition relation is not a function: each time the head reads
a symbol on the tape, it performs one or more actions. Of course, it is
not possible to construct a non deterministic Turing machine in practice,
but it is still possible to employ it as a theoretical model.

Other Turing machines extensions include *probabilistic Turing machines*
and *bounded probabilistic Turing machines*
// We have: D, N, Pr, BP. What is R?

*Computational complexity* is defined by a language and a machine capable
of recognizing the language. In this context, a _machine_ is any classical
or quantum device that executes a single algorithm of which it is possible
to compute the number of steps needed to complete its operation (*time
complexity*) or the number of bits needed to store information (*space
complexity*). A _language_ is simply any sets of strings on an alphabet.
A machine _recognises_ a language if it is able to stop in a finite number
of steps with an affermative answer for all strings in the language.

A set of languages recognised by a particular kind of machine within given
resource bounds in terms of transition relation is called *complexity class*.
For each algorithm it is possible to have a complexity class with respect
to time and to space; the two might not be the same.

Note that, while Kolmogorov complexity is incomputable, complexity class
is not. That is, there is an algorithm that, given in input another algorithm,
is capable of (always) determining its complexity class, whereis there is
no algorithm that, given in input a string, is capable of (always) determining
its Kolmogorov complexity.

All previously stated computation models are still based on classical
computations. A computational model for quantum computation is given by
the *quantum Turing machine*:

$ M = (H_(Q), H_(A), b in H_(A), Sigma = H_(A) union \{L, R\}, delta: H_(Q) -> H_(Q), q_(0) in H_(Q), F subset.eq H_(Q)) $

Where:

- $H_(Q)$ is an Hilbert space containing the states;
- $H_(A)$ is an Hilbert space containing the alphabet of the tape;
- $b$ is the null vector of $H_(Q)$;
- $Sigma$ is the set that contains vectors of $H_(Q)$;
- $delta$ is an automorphism from $H_(Q)$ to itself;
- $q_(0)$ is a special state, called _starting state_;
- $F$ are special states, called _final states_;

The *quantum speedup*, that is, the improvement in algorithm speed that a
quantum computer has with respect to classical computers, is not due to
the raw power of the machine. It is instead due to the fact that complexity
classes of quantum algorithms are not arranged in the same way as classical
algorithms:

//#figure(
//	image("complexity_classes.png", width: 80%),
//	caption: [Quantum complexity classes.]
//)
