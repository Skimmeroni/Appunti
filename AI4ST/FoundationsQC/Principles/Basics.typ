#import "../FoundationsQC_definitions.typ": *

Any quantum computer architecture that presents itself as usable must respect
all of these criteria, called *DiVincenzo Criteria* #footnote[Only the first
five criteria are present in the original formulation; the remaining three
were introduced later.]:

+ Possesses well isolated qubits, qubits shouldn't drift away;
+ Qubits must be initialized to a starting state that is fully under control;
+ Implements a universal set of operations;
+ Taking quantum decoherence into account: the operation time of quantum logic
  gates should be significantly less than the time frame in which qubits are
  stable;
+ There must be a way to sample the status of the qubit (readout);
+ Interconvention between qubits and flying qubits;
+ Existence of flying qubits;
+ Scalability: a technology that is not just theoretical but also usable in
  real applications.

Many real implementations of quantum computers include:

- *Superconducting qubits*;
- *Semiconductors*;
- *Photonic qubits*;
- *Trapped ions*;
- *Neutral atoms*.

Classical computers are based on the Von Neumann architecture, whereas quantum
computers have many architecture model. Some architectures are better for some
uses, whereas some are better for other uses. Most common ones are:

- *Gate model*, where gates are chained with each other in the same way as
  classical logic gates are combined into circuits. Supports criteria $1$,
  $2$, $4$, $5$; 
- *Adiabatic*, arranging qubits and then applying thermodinamical processes.
  Supports criteria $1$ and $4$;
- *Measurement based*, virtualization of the gate model performing operation
  to condition each state. Support criteria $3$;
- *Topological*, at the moment only theoretical.

Quantum noise is still problematic, but can be mitigated with *quantum error
correction* introducing redundancy.

Similar to how the ISO-OSI model was formulated for classical computing,
an analogous layered architecture was formulated for quantum computing.
From top to bottom:

+ *Application layer*, where only algorithm live, hardware-independent;
+ *Representation layer*, where qubits are abstracted to logical qubits,
  hardware-independent;
+ *Quantum error correction layer*, to introduce redundancy;
+ *Virtual layer*, exploiting physical properties so that qubits are stable;
+ *Physical layer*, raw atoms and molecules.

Even though it is possible to consider qubits as the single atoms or
molecules, a more reasonable approach is to go up one level of abstraction
an talk about *logical qubits*, that also comprehend rendundancy qubits for
error correction.

// See "Layered architecture for quantum computing"

Quantum systems are different from classical systems. The evolution of a
classical system can be completely determined from its starting conditions,
that is, a classical system is *deterministic*. Observing a classical system
at a certain time and predicting the state in which the system will find
itself at that same time are, as a matter of fact, indistinguishable.

Quantum systems are not entirely deterministic. When a quantum system
is not observed, it evolves in a deterministic way (according to, say,
the Schroedinger equation), but when it is observed the result is only
partially predictable. This is because, when observed, the system must
be found in any of the possible states it can be, but until then it could
be in any of those. The probability of finding the system in a certain
state depends on the initial conditions.

Quantum mechanics rests on six postulates:

+ *Superposition principle*. At any given time $t_(0)$, the state of a
  physical system $ket(Phi(t_(0)))$ is described by specifying the
  vector `ket` as an appropriately normalized element of an Hilber space
  $Eta$, also called *state space*.
+ *Observable quantities*. Energy, angular momentum, position, ecc... are
  not described by functions. Instead, they are described by operators
  that act on elements of $Eta$. The matrix representation of operators
  is required to be Hermitian (square and has real eigenvalues). Operators,
  in general, do not commute, therefore the order of application matters. 
+ *Spectrum of measurements*. Every possible value of an observable quantity
  is quantized, and it is an eigenvalue of the (matrix representation of the)
  operator associated to such observable. 
+ *Probabilistic measurement for a non-degenerate discrete spectra of an
  operator*. Each possible eigenvalue has a probability to be sampled.
  Measuring an operator $A$ over state $ket(Psi(t_(0)))$ has a 
  probability of obtaining the value $a_(i)$ equal to $P(a_(i))$, that
  goes with $abs(angle.l mu_(i)\, a_(i) angle.r)^(2)$, with $mu_(i)$
  being the eigenvector associated to $a_(i)$. The vector $ket(mu_(i))$
  is given by an operator called *projection*, that extracts
  a component of a vector:

  //#grid(
  //  columns: (0.5fr, 0.5fr),
  //  [$ P_(i) = | mu_(i) angle.r angle.r mu_(i) | $],
  //  [$ P_(i) | Psi angle.r = | mu_(i) angle.r angle.r mu_(i) | Psi angle.r $]
  //)
+ *Irreversibility of measurements*. The measurement of an observable
  $A$ on the state $ket(Psi)$, equivalent to applying said operator to
  $ket(Psi)$, after the measurement process the new state is given by:

  $ frac(P_(i) ket(Psi), sqrt(angle.l | P_(i) | Psi angle.r)) $

  Which means that measuring a state influences the system giving a new
  system, states are not reversible.
+ *Time evolution*. The evolution in time of the states $ket(Psi)$
  are governed by the *Schroedinger equation*:

  $ i frac(h, 2 pi) frac(d, d t) ket(Psi(t)) = H(t) ket(Psi(t)) $

  Where $H(t)$ is the *Hermitian operator*, an operator associated to the
  energy of the system.

Postulates $5$ and $6$ seem to be contradictory, but they are not. Until
a measurement is performed, a state is governed smoothly by and equation,
whereas when a measurement happens the state is influenced.
