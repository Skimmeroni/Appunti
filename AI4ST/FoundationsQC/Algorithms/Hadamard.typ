#import "../FoundationsQC_definitions.typ": *

=== Hadamard test for the expected result of an observable

The implementation of many quantum algorithms require computing the
expectation value of an arbitrary unitary operator $U$ with respect
to a state $ket(Lambda)$. This can be done by exploiting a quantum
algorithm known as the *Hadamard test*; this algorithm is actually
composed by two circuits, one for obtaining the real part of the
expectation value and one for the imaginary part. The first circuit
is presented below:

#align(
	center,
	[#quantum-circuit(scale: 150%,
	                  lstick($ket(0)$), gate($H$), ctrl(1), gate($H$), meter(), [\ ],
	                  lstick($ket(Lambda)$), 1, gate($U$))
	]
)

Applying an Hadamard gate to the first qubit:

$ ket(Psi_(0)) &=
  (H times.circle I^(times.circle n))
  (ket(0) times.circle ket(Lambda)) =
  H ket(0) times.circle I^(times.circle n) ket(Lambda) =
  frac(1, sqrt(2)) (ket(0) + ket(1)) times.circle ket(Lambda) =
  frac(1, sqrt(2)) (ket(0) times.circle ket(Lambda) +
                       ket(1) times.circle ket(Lambda)) $

Applying the controlled unitary transformation to the state $ket(Lambda)$:

$ ket(Psi_(1)) &=
  C U (frac(1, sqrt(2)) (ket(0) times.circle ket(Lambda) +
                         ket(1) times.circle ket(Lambda))) =
  frac(1, sqrt(2)) (C U (ket(0) times.circle ket(Lambda)) +
                    C U (ket(1) times.circle ket(Lambda))) = \
  &= frac(1, sqrt(2)) (ket(0) times.circle ket(Lambda) +
                    ket(1) times.circle U ket(Lambda)) $

Applying an Hadamard gate to the first qubit:

$ ket(Psi_(2)) &=
  (H times.circle I^(times.circle n))
  (frac(1, sqrt(2)) (ket(0) times.circle ket(Lambda) + ket(1) times.circle U ket(Lambda))) =
  frac(1, sqrt(2)) ((H times.circle I^(times.circle n)) (ket(0) times.circle ket(Lambda)) +
                    (H times.circle I^(times.circle n)) (ket(1) times.circle U ket(Lambda))) = \
  &= frac(1, sqrt(2)) ((H ket(0) times.circle I^(times.circle n) ket(Lambda)) +
                      (H ket(1) times.circle I^(times.circle n) U ket(Lambda))) =
  frac(1, sqrt(2)) (frac(1, sqrt(2))(ket(0) + ket(1)) times.circle ket(Lambda) +
                    frac(1, sqrt(2))(ket(0) - ket(1)) times.circle U ket(Lambda)) = \
  &= frac(1, 2) (ket(0) times.circle ket(Lambda) +
                 ket(1) times.circle ket(Lambda) +
                 ket(0) times.circle U ket(Lambda) -
                 ket(1) times.circle U ket(Lambda)) =
   frac(1, 2) (ket(0) times.circle (ket(Lambda) + U ket(Lambda)) +
               ket(1) times.circle (ket(Lambda) - U ket(Lambda))) = \
  &= frac(1, 2) (ket(0) times.circle (I + U) ket(Lambda) +
                 ket(1) times.circle (I - U) ket(Lambda)) $

A measurement is performed on the first qubit. The associated projector is
given by $P_(0) = ketbra(0, 0) times.circle I^(times.circle n)$. Applying it
to the state gives:

$ P_(0) ket(Psi_(2)) &=
  (ketbra(0, 0) times.circle I^(times.circle n))
  (frac(1, 2) (ket(0) times.circle (I + U) ket(Lambda) +
              ket(1) times.circle (I - U) ket(Lambda))) = \
  &= frac(1, 2) (ket(0) braket(0, 0) times.circle I^(times.circle n) (I + U) ket(Lambda) +
              ket(0) braket(1, 0) times.circle I^(times.circle n) (I - U) ket(Lambda)) =
  frac(1, 2) (ket(0) times.circle (I + U) ket(Lambda)) $

Which means that the probability of measuring the first qubit to be in
state $ket(0)$ is:

$ bra(Psi_(2)) P_(0) ket(Psi_(2)) &=
  (frac(1, 2) (bra(0) times.circle bra(Lambda) (I + U)^(dagger) +
               bra(1) times.circle bra(Lambda) (I - U)^(dagger)))
  (frac(1, 2) (ket(0) times.circle (I + U) ket(Lambda))) = \
  &= frac(1, 4) (bra(0) times.circle bra(Lambda) (I + U)^(dagger))
             (ket(0) times.circle (I + U) ket(Lambda)) =
     frac(1, 4) (braket(0, 0) times.circle bra(Lambda) (I + U)^(dagger) (I + U) ket(Lambda)) = \
  &= frac(1, 4) bra(Lambda) (I + U)^(dagger) (I + U) ket(Lambda) = 
     frac(1, 4) bra(Lambda) (I + U^(dagger)) (I + U) ket(Lambda) = \
  &= frac(1, 4) bra(Lambda) (I I + I U + U^(dagger) I + U^(dagger) U) ket(Lambda) = 
     frac(1, 4) bra(Lambda) (2I + U + U^(dagger)) ket(Lambda) $

The other projector is $P_(1) = ketbra(1, 1) times.circle I^(times.circle n)$.
Applying it to the state gives:

$ P_(1) ket(Psi_(2)) &=
  (ketbra(1, 1) times.circle I^(times.circle n))
  (frac(1, 2) (ket(0) times.circle (I + U) ket(Lambda) +
              ket(1) times.circle (I - U) ket(Lambda))) = \
  &= frac(1, 2) (ket(1) braket(1, 0) times.circle I^(times.circle n) (I + U) ket(Lambda) +
              ket(1) braket(1, 1) times.circle I^(times.circle n) (I - U) ket(Lambda)) =
  frac(1, 2) (ket(1) times.circle (I - U) ket(Lambda)) $

Which means that the probability of measuring the first qubit to be in
state $ket(1)$ is:

$ bra(Psi_(2)) P_(1) ket(Psi_(2)) &=
  (frac(1, 2) (bra(0) times.circle bra(Lambda) (I + U)^(dagger) +
               bra(1) times.circle bra(Lambda) (I - U)^(dagger)))
  (frac(1, 2) (ket(1) times.circle (I - U) ket(Lambda))) = \
  &= frac(1, 4) (bra(1) times.circle bra(Lambda) (I - U)^(dagger))
             (ket(1) times.circle (I - U) ket(Lambda)) =
     frac(1, 4) (braket(0, 0) times.circle bra(Lambda) (I - U)^(dagger) (I - U) ket(Lambda)) = \
  &= frac(1, 4) bra(Lambda) (I - U)^(dagger) (I - U) ket(Lambda) =
     frac(1, 4) bra(Lambda) (I - U^(dagger)) (I - U) ket(Lambda) = \
  &= frac(1, 4) bra(Lambda) (I I - I U - U^(dagger) I + U^(dagger) U) ket(Lambda) =
     frac(1, 4) bra(Lambda) (2I - U - U^(dagger)) ket(Lambda) $

Subtracting the two:

$ bra(Psi_(2)) P_(0) ket(Psi_(2)) - bra(Psi_(2)) P_(1) ket(Psi_(2)) &=
  frac(1, 4) bra(Lambda) (2I + U + U^(dagger)) ket(Lambda) -
  frac(1, 4) bra(Lambda) (2I - U - U^(dagger)) ket(Lambda) = \
  &= frac(1, 4) bra(Lambda) (cancel(2I) + U + U^(dagger) - cancel(2I) + U + U^(dagger)) ket(Lambda) =
  frac(1, 4) bra(Lambda) (2U + 2U^(dagger)) ket(Lambda) = \
  &= frac(1, 2) bra(Lambda) (U + U^(dagger)) ket(Lambda) =
  frac(1, 2) (bra(Lambda) U ket(Lambda) + bra(Lambda) U^(dagger) ket(Lambda)) =
  Re(bra(Lambda) U ket(Lambda)) $

The imaginary part of the expected value can be obtained from the same
circuit by introducing a phase shift of $-frac(pi, 2)$:

#align(
	center,
	[#quantum-circuit(scale: 150%,
	                  lstick($ket(0)$), gate($H$), gate($R_(z)(-pi slash 2)$), ctrl(1), gate($H$), meter(), [\ ],
	                  lstick($ket(Lambda)$), 1, 1, gate($U$))
	]
)

Applying an Hadamard gate to the first qubit:

$ ket(Psi_(0)) &=
  (H times.circle I^(times.circle n))
  (ket(0) times.circle ket(Lambda)) =
  H ket(0) times.circle I^(times.circle n) ket(Lambda) =
  frac(1, sqrt(2)) (ket(0) + ket(1)) times.circle ket(Lambda) =
  frac(1, sqrt(2)) (ket(0) times.circle ket(Lambda) +
                       ket(1) times.circle ket(Lambda)) $

Applying a phase shift of $-frac(pi, 2)$:

$ ket(Psi_(1)) &= (R_(z)(-frac(pi, 2)) times.circle I^(times.circle n))
                 (frac(1, sqrt(2)) (ket(0) times.circle ket(Lambda) +
                                    ket(1) times.circle ket(Lambda))) = \
  &= frac(1, sqrt(2)) ((R_(z)(-frac(pi, 2)) times.circle I^(times.circle n)) (ket(0) times.circle ket(Lambda)) +
                       (R_(z)(-frac(pi, 2)) times.circle I^(times.circle n)) (ket(1) times.circle ket(Lambda))) = \
  &= frac(1, sqrt(2)) (R_(z)(-frac(pi, 2)) ket(0) times.circle I^(times.circle n) ket(Lambda) +
                       R_(z)(-frac(pi, 2)) ket(1) times.circle I^(times.circle n) ket(Lambda)) =
     frac(1, sqrt(2)) (ket(0) times.circle ket(Lambda) - i ket(1) times.circle ket(Lambda)) $

Applying the controlled unitary transformation to the state $ket(Lambda)$:

$ ket(Psi_(2)) &=
  C U (frac(1, sqrt(2)) (ket(0) times.circle ket(Lambda) -
                         i ket(1) times.circle ket(Lambda))) =
  frac(1, sqrt(2)) (C U (ket(0) times.circle ket(Lambda)) -
                    C U (i ket(1) times.circle ket(Lambda))) = \
  &= frac(1, sqrt(2)) (ket(0) times.circle ket(Lambda) -
                    i ket(1) times.circle U ket(Lambda)) $

Applying an Hadamard gate to the first qubit:

$ ket(Psi_(3)) &=
  (H times.circle I^(times.circle n))
  (frac(1, sqrt(2)) (ket(0) times.circle ket(Lambda) - i ket(1) times.circle U ket(Lambda))) =
  frac(1, sqrt(2)) ((H times.circle I^(times.circle n)) (ket(0) times.circle ket(Lambda)) - i
                    (H times.circle I^(times.circle n)) (ket(1) times.circle U ket(Lambda))) = \
  &= frac(1, sqrt(2)) ((H ket(0) times.circle I^(times.circle n) ket(Lambda)) - i
                      (H ket(1) times.circle I^(times.circle n) U ket(Lambda))) =
  frac(1, sqrt(2)) (frac(1, sqrt(2))(ket(0) + ket(1)) times.circle ket(Lambda) - i
                    frac(1, sqrt(2))(ket(0) - ket(1)) times.circle U ket(Lambda)) = \
  &= frac(1, 2) (ket(0) times.circle ket(Lambda) +
                 ket(1) times.circle ket(Lambda) -
                 i ket(0) times.circle U ket(Lambda) +
                 i ket(1) times.circle U ket(Lambda)) =
   frac(1, 2) (ket(0) times.circle (ket(Lambda) - i U ket(Lambda)) +
               ket(1) times.circle (ket(Lambda) + i U ket(Lambda))) = \
  &= frac(1, 2) (ket(0) times.circle (I - i U) ket(Lambda) +
                 ket(1) times.circle (I + i U) ket(Lambda)) $

A measurement is performed on the first qubit. The associated projector is
given by $P_(0) = ketbra(0, 0) times.circle I^(times.circle n)$. Applying it
to the state gives:

$ P_(0) ket(Psi_(3)) &=
  (ketbra(0, 0) times.circle I^(times.circle n))
  (frac(1, 2) (ket(0) times.circle (I - i U) ket(Lambda) +
              ket(1) times.circle (I + i U) ket(Lambda))) = \
  &= frac(1, 2) (ket(0) braket(0, 0) times.circle I^(times.circle n) (I - i U) ket(Lambda) +
              ket(0) braket(1, 0) times.circle I^(times.circle n) (I + i U) ket(Lambda)) =
  frac(1, 2) (ket(0) times.circle (I - i U) ket(Lambda)) $

Which means that the probability of measuring the first qubit to be in
state $ket(0)$ is:

$ bra(Psi_(3)) P_(0) ket(Psi_(3)) &=
  (frac(1, 2) (bra(0) times.circle bra(Lambda) (I - i U)^(dagger) +
               bra(1) times.circle bra(Lambda) (I + i U)^(dagger)))
  (frac(1, 2) (ket(0) times.circle (I - i U) ket(Lambda))) = \
  &= frac(1, 4) (bra(0) times.circle bra(Lambda) (I - i U)^(dagger))
             (ket(0) times.circle (I - i U) ket(Lambda)) =
     frac(1, 4) (braket(0, 0) times.circle bra(Lambda) (I - i U)^(dagger) (I - i U) ket(Lambda)) = \
  &= frac(1, 4) bra(Lambda) (I - i U)^(dagger) (I - i U) ket(Lambda) =
     frac(1, 4) bra(Lambda) (I + i U^(dagger)) (I - i U) ket(Lambda) = \
  &= frac(1, 4) bra(Lambda) (I I - i I U + i U^(dagger) I - i^(2) U^(dagger) U) ket(Lambda) =
     frac(1, 4) bra(Lambda) (2I - i U + i U^(dagger)) ket(Lambda) $

The other projector is $P_(1) = ketbra(1, 1) times.circle I^(times.circle n)$.
Applying it to the state gives:

$ P_(1) ket(Psi_(3)) &=
  (ketbra(1, 1) times.circle I^(times.circle n))
  (frac(1, 2) (ket(0) times.circle (I - i U) ket(Lambda) +
              ket(1) times.circle (I + i U) ket(Lambda))) = \
  &= frac(1, 2) (ket(1) braket(1, 0) times.circle I^(times.circle n) (I - i U) ket(Lambda) +
              ket(1) braket(1, 1) times.circle I^(times.circle n) (I + i U) ket(Lambda)) =
  frac(1, 2) (ket(1) times.circle (I + i U) ket(Lambda)) $

Which means that the probability of measuring the first qubit to be in
state $ket(1)$ is:

$ bra(Psi_(3)) P_(1) ket(Psi_(3)) &=
  (frac(1, 2) (bra(0) times.circle bra(Lambda) (I - i U)^(dagger) +
               bra(1) times.circle bra(Lambda) (I + i U)^(dagger)))
  (frac(1, 2) (ket(1) times.circle (I + i U) ket(Lambda))) = \
  &= frac(1, 4) (bra(1) times.circle bra(Lambda) (I + i U)^(dagger))
             (ket(1) times.circle (I + i U) ket(Lambda)) =
     frac(1, 4) (braket(0, 0) times.circle bra(Lambda) (I + i U)^(dagger) (I + i U) ket(Lambda)) = \
  &= frac(1, 4) bra(Lambda) (I + i U)^(dagger) (I + i U) ket(Lambda) =
     frac(1, 4) bra(Lambda) (I - i U^(dagger)) (I + i U) ket(Lambda) = \
  &= frac(1, 4) bra(Lambda) (I I + i I U - i U^(dagger) I - i^(2) U^(dagger) U) ket(Lambda) =
     frac(1, 4) bra(Lambda) (2I + i U - i U^(dagger)) ket(Lambda) $

Subtracting the two:

$ bra(Psi_(3)) P_(0) ket(Psi_(3)) - bra(Psi_(3)) P_(1) ket(Psi_(3)) &=
  frac(1, 4) bra(Lambda) (2I - i U + i U^(dagger)) ket(Lambda) -
  frac(1, 4) bra(Lambda) (2I + i U - i U^(dagger)) ket(Lambda) = \
  &= frac(1, 4) bra(Lambda) (cancel(2I) - i U + i U^(dagger) - cancel(2I) - i U + i U^(dagger)) ket(Lambda) =
     frac(1, 4) bra(Lambda) (2i U^(dagger) - 2i U) ket(Lambda) = \
  &= frac(i, 2) bra(Lambda) (U^(dagger) - U) ket(Lambda) =
     -frac(1, 2i) bra(Lambda) (U^(dagger) - U) ket(Lambda) =
     frac(1, 2i) bra(Lambda) (U - U^(dagger)) ket(Lambda) = \
  &= Im(bra(Lambda) U ket(Lambda)) $

The precision of the test increases with the number of times the circuit
is run. If the desired accuracy is $epsilon$, it can be achieved by running
the circuit $O(frac(1, epsilon))$ times.

=== Hadamard test for the inner product

The Hadamard test can be tweaked to return the inner product between two
states. Given two $n$-qubit states $ket(Lambda_(1))$ and $ket(Lambda_(2))$,
let $U_(Lambda_(1))$ and $U_(Lambda_(2))$ be two unitary matrices,
constructed in such a way that $U_(Lambda_(1)) ket(000 dots 0) =
ket(Lambda_(1))$ and $U_(Lambda_(2)) ket(000 dots 0) = ket(Lambda_(2))$
(of course, there is an infinite collection of matrices with these
properties).

As expected, two circuits are needed, one for the real part of the inner
product and one for the imaginary part of the inner product. The modified
Hadamard test circuit for the real part is presented below:

#align(
	center,
	[#quantum-circuit(scale: 150%,
	                  lstick($ket(0)$), gate($H$), ctrl(1), gate($X$), ctrl(1), gate($X$), gate($H$), meter(), [\ ],
	                  lstick($ket(0)$), nwire($n$), gate($U_(Lambda 1)$), 1, gate($U_(Lambda 2)$), 1, 1)
	]
)

Applying an Hadamard gate to the first qubit:

$ ket(Psi_(0)) &=
  (H times.circle I^(times.circle n))
  (ket(0) times.circle ket(0)^(times.circle n)) =
  H ket(0) times.circle I^(times.circle n) ket(0)^(times.circle n) =
  frac(1, sqrt(2)) (ket(0) + ket(1)) times.circle ket(0)^(times.circle n) = \
  &= frac(1, sqrt(2)) (ket(0) times.circle ket(0)^(times.circle n) +
                       ket(1) times.circle ket(0)^(times.circle n)) $

Applying the controlled unitary $U_(Lambda_(1))$ to the $n$ qubits:

$ ket(Psi_(1)) &=
  C U_(Lambda_(1)) (frac(1, sqrt(2)) (ket(0) times.circle ket(0)^(times.circle n) +
                                      ket(1) times.circle ket(0)^(times.circle n))) =
   frac(1, sqrt(2)) (C U_(Lambda_(1)) (ket(0) times.circle ket(0)^(times.circle n)) +
                     C U_(Lambda_(1)) (ket(1) times.circle ket(0)^(times.circle n))) = \              
   &= frac(1, sqrt(2)) (ket(0) times.circle ket(0)^(times.circle n) +
                     ket(1) times.circle ket(Lambda_(1))) $

Applying the $X$ gate to the first qubit:

$ ket(Psi_(2)) &=
  (X times.circle I^(times.circle n))
  frac(1, sqrt(2)) (ket(0) times.circle ket(0)^(times.circle n) +
                     ket(1) times.circle ket(Lambda_(1))) =
  frac(1, sqrt(2))
  ((X times.circle I^(times.circle n)) (ket(0) times.circle ket(0)^(times.circle n)) +
  (X times.circle I^(times.circle n)) (ket(1) times.circle ket(Lambda_(1)))) = \
  &= frac(1, sqrt(2))
  (ket(1) times.circle ket(0)^(times.circle n) +
  ket(0) times.circle ket(Lambda_(1))) $

Applying the controlled unitary $U_(Lambda_(2))$ to the $n$ qubits:

$ ket(Psi_(3)) &=
  C U_(Lambda_(2)) (frac(1, sqrt(2)) (ket(1) times.circle ket(0)^(times.circle n) +
                                     ket(0) times.circle ket(Lambda_(1)))) =
  frac(1, sqrt(2)) (C U_(Lambda_(2)) (ket(1) times.circle ket(0)^(times.circle n)) +
                    C U_(Lambda_(2)) (ket(0) times.circle ket(Lambda_(1)))) = \
  &= frac(1, sqrt(2)) (ket(1) times.circle ket(Lambda_(2)) +
                       ket(0) times.circle ket(Lambda_(1))) $

Applying the $X$ gate to the first qubit:

$ ket(Psi_(4)) &=
  (X times.circle I^(times.circle n))
  frac(1, sqrt(2)) (ket(1) times.circle ket(Lambda_(2)) +
                     ket(0) times.circle ket(Lambda_(1))) =
  frac(1, sqrt(2))
  ((X times.circle I^(times.circle n)) (ket(1) times.circle ket(Lambda_(2)) +
  (X times.circle I^(times.circle n)) (ket(0) times.circle ket(Lambda_(1)))) = \
  &= frac(1, sqrt(2))
  (ket(0) times.circle ket(Lambda_(2)) +
  ket(1) times.circle ket(Lambda_(1))) $

Applying the Hadamard gate to the first qubit:

$ ket(Psi_(5)) &=
  (H times.circle I^(times.circle n))
  (frac(1, sqrt(2))
  (ket(0) times.circle ket(Lambda_(2)) +
  ket(1) times.circle ket(Lambda_(1)))) =
  frac(1, sqrt(2))
  ((H times.circle I^(times.circle n))
   (ket(0) times.circle ket(Lambda_(2))) +
   (H times.circle I^(times.circle n))
   (ket(1) times.circle ket(Lambda_(1)))) = \
  &= frac(1, sqrt(2))
   (frac(1, sqrt(2))(ket(0) + ket(1)) times.circle ket(Lambda_(2)) +
   frac(1, sqrt(2))(ket(0) - ket(1)) times.circle ket(Lambda_(1))) =
   frac(1, 2) ((ket(0) + ket(1)) times.circle ket(Lambda_(2)) +
               (ket(0) - ket(1)) times.circle ket(Lambda_(1))) = \
  &= frac(1, 2) (ket(0) times.circle ket(Lambda_(2)) +
                 ket(1) times.circle ket(Lambda_(2)) +
                 ket(0) times.circle ket(Lambda_(1)) -
                 ket(1) times.circle ket(Lambda_(1))) =
     frac(1, 2) (ket(0) times.circle (ket(Lambda_(2)) + ket(Lambda_(1))) +
                 ket(1) times.circle (ket(Lambda_(2)) - ket(Lambda_(1)))) $

A measurement is performed on the first qubit. The associated projector is
given by $P_(0) = ketbra(0, 0) times.circle I^(times.circle n)$. Applying it
to the state gives:

$ P_(0) ket(Psi_(5)) &=
  (ketbra(0, 0) times.circle I^(times.circle n))
  frac(1, 2) (ket(0) times.circle (ket(Lambda_(2)) + ket(Lambda_(1))) +
              ket(1) times.circle (ket(Lambda_(2)) - ket(Lambda_(1)))) = \
  &= frac(1, 2) (ket(0) braket(0, 0) times.circle I^(times.circle n) (ket(Lambda_(2)) + ket(Lambda_(1))) +
                 ket(0) braket(0, 1) times.circle I^(times.circle n) (ket(Lambda_(2)) - ket(Lambda_(1)))) =
  frac(1, 2) (ket(0) times.circle (ket(Lambda_(2)) + ket(Lambda_(1)))) $

Which means that the probability of measuring the first qubit to be in
state $ket(0)$ is:

$ bra(Psi_(5)) P_(0) ket(Psi_(5)) &=
  frac(1, 2) (bra(0) times.circle (bra(Lambda_(2)) + bra(Lambda_(1))) +
              bra(1) times.circle (bra(Lambda_(2)) - bra(Lambda_(1))))
  frac(1, 2) (ket(0) times.circle (ket(Lambda_(2)) + ket(Lambda_(1)))) = \
  &= frac(1, 4) 
  (bra(0) times.circle (bra(Lambda_(2)) + bra(Lambda_(1))))
  (ket(0) times.circle (ket(Lambda_(2)) + ket(Lambda_(1))) +
  frac(1, 4)
  (bra(1) times.circle (bra(Lambda_(2)) - bra(Lambda_(1))))
  (ket(0) times.circle (ket(Lambda_(2)) + ket(Lambda_(1)))) = \
  &= frac(1, 4)
  (braket(0, 0) times.circle (bra(Lambda_(2)) + bra(Lambda_(1)))(ket(Lambda_(2)) + ket(Lambda_(1)))) +
  frac(1, 4)
  (braket(1, 0) times.circle (bra(Lambda_(2)) - bra(Lambda_(1)))(ket(Lambda_(2)) + ket(Lambda_(1)))) = \
  &= frac(1, 4) (bra(Lambda_(2)) + bra(Lambda_(1)))(ket(Lambda_(2)) + ket(Lambda_(1))) =
  frac(1, 4) (braket(Lambda_(2), Lambda_(2)) +
              braket(Lambda_(2), Lambda_(1)) +
              braket(Lambda_(1), Lambda_(2)) +
              braket(Lambda_(1), Lambda_(1))) = \
  &= frac(1, 4) (1 + 1 + braket(Lambda_(2), Lambda_(1)) + braket(Lambda_(1), Lambda_(2))) =
     frac(1, 4) (2 + (braket(Lambda_(1), Lambda_(2)))^(*) + braket(Lambda_(1), Lambda_(2))) = \
  &= frac(1, 4) (2 + 2 Re(braket(Lambda_(1), Lambda_(2)))) =
     frac(1, 2) (1 + Re(braket(Lambda_(1), Lambda_(2)))) $

As in the previous case, the imaginary part of the inner product can be
obtained from the same circuit by introducing a phase shift of $-frac(pi, 2)$:

#align(
	center,
	[#quantum-circuit(scale: 150%,
	                  lstick($ket(0)$), gate($H$), gate($R_(z)(-pi slash 2)$), ctrl(1), gate($X$), ctrl(1), gate($X$), gate($H$), meter(), [\ ],
	                  lstick($ket(0)$), nwire($n$), 1, gate($U_(Lambda 1)$), 1, gate($U_(Lambda 2)$), 1, 1)
	]
)

Applying an Hadamard gate to the first qubit:

$ ket(Psi_(0)) &=
  (H times.circle I^(times.circle n))
  (ket(0) times.circle ket(0)^(times.circle n)) =
  H ket(0) times.circle I^(times.circle n) ket(0)^(times.circle n) =
  frac(1, sqrt(2)) (ket(0) + ket(1)) times.circle ket(0)^(times.circle n) = \
  &= frac(1, sqrt(2)) (ket(0) times.circle ket(0)^(times.circle n) +
                       ket(1) times.circle ket(0)^(times.circle n)) $

Applying a phase shift of $-frac(pi, 2)$:

$ ket(Psi_(1)) &=
  (R_(z)(-frac(pi, 2)) times.circle I^(times.circle n))
  (frac(1, sqrt(2)) (ket(0) times.circle ket(0)^(times.circle n) +
                     ket(1) times.circle ket(0)^(times.circle n))) = \
  &= frac(1, sqrt(2)) ((R_(z)(-frac(pi, 2)) times.circle I^(times.circle n))
                    (ket(0) times.circle ket(0)^(times.circle n)) +
                    (R_(z)(-frac(pi, 2)) times.circle I^(times.circle n))
                    (ket(1) times.circle ket(0)^(times.circle n))) = \
  &= frac(1, sqrt(2)) ((R_(z)(-frac(pi, 2)) ket(0)) times.circle (I^(times.circle n) ket(0)^(times.circle n)) +
                       (R_(z)(-frac(pi, 2)) ket(1)) times.circle (I^(times.circle n) ket(0)^(times.circle n))) = \
  &= frac(1, sqrt(2)) (ket(0) times.circle ket(0)^(times.circle n) -
                       i ket(1) times.circle ket(0)^(times.circle n)) $

Applying the controlled unitary $U_(Lambda_(1))$ to the $n$ qubits:

$ ket(Psi_(2)) &=
  C U_(Lambda_(1)) (frac(1, sqrt(2)) (ket(0) times.circle ket(0)^(times.circle n) -
                                      i ket(1) times.circle ket(0)^(times.circle n))) =
   frac(1, sqrt(2)) (C U_(Lambda_(1)) (ket(0) times.circle ket(0)^(times.circle n)) -
                     C U_(Lambda_(1)) (i ket(1) times.circle ket(0)^(times.circle n))) = \              
   &= frac(1, sqrt(2)) (ket(0) times.circle ket(0)^(times.circle n) -
                        i ket(1) times.circle ket(Lambda_(1))) $

Applying the $X$ gate to the first qubit:

$ ket(Psi_(3)) &=
  (X times.circle I^(times.circle n))
  frac(1, sqrt(2)) (ket(0) times.circle ket(0)^(times.circle n) -
                    i ket(1) times.circle ket(Lambda_(1))) =
  frac(1, sqrt(2))
  ((X times.circle I^(times.circle n)) (ket(0) times.circle ket(0)^(times.circle n)) -
  (X times.circle I^(times.circle n)) (i ket(1) times.circle ket(Lambda_(1)))) = \
  &= frac(1, sqrt(2))
  (ket(1) times.circle ket(0)^(times.circle n) -
  i ket(0) times.circle ket(Lambda_(1))) $

Applying the controlled unitary $U_(Lambda_(2))$ to the $n$ qubits:

$ ket(Psi_(4)) &=
  C U_(Lambda_(2)) (frac(1, sqrt(2)) (ket(1) times.circle ket(0)^(times.circle n) -
                                     i ket(0) times.circle ket(Lambda_(1)))) =
  frac(1, sqrt(2)) (C U_(Lambda_(2)) (ket(1) times.circle ket(0)^(times.circle n)) -
                    C U_(Lambda_(2)) (i ket(0) times.circle ket(Lambda_(1)))) = \
  &= frac(1, sqrt(2)) (ket(1) times.circle ket(Lambda_(2)) -
                       i ket(0) times.circle ket(Lambda_(1))) $

Applying the $X$ gate to the first qubit:

$ ket(Psi_(5)) &=
  (X times.circle I^(times.circle n))
  frac(1, sqrt(2)) (ket(1) times.circle ket(Lambda_(2)) -
                    i ket(0) times.circle ket(Lambda_(1))) =
  frac(1, sqrt(2))
  ((X times.circle I^(times.circle n)) (ket(1) times.circle ket(Lambda_(2)) -
  (X times.circle I^(times.circle n)) (i ket(0) times.circle ket(Lambda_(1)))) = \
  &= frac(1, sqrt(2))
  (ket(0) times.circle ket(Lambda_(2)) -
  i ket(1) times.circle ket(Lambda_(1))) $

Applying the Hadamard gate to the first qubit:

$ ket(Psi_(6)) &=
  (H times.circle I^(times.circle n))
  (frac(1, sqrt(2))
  (ket(0) times.circle ket(Lambda_(2)) -
  i ket(1) times.circle ket(Lambda_(1)))) =
  frac(1, sqrt(2))
  ((H times.circle I^(times.circle n))
   (ket(0) times.circle ket(Lambda_(2))) -
   (H times.circle I^(times.circle n))
   (i ket(1) times.circle ket(Lambda_(1)))) = \
  &= frac(1, sqrt(2))
   (frac(1, sqrt(2))(ket(0) + ket(1)) times.circle ket(Lambda_(2)) -
   i frac(1, sqrt(2))(ket(0) - ket(1)) times.circle ket(Lambda_(1))) =
  frac(1, 2) ((ket(0) + ket(1)) times.circle ket(Lambda_(2)) -
              i (ket(0) - ket(1)) times.circle ket(Lambda_(1))) = \
  &= frac(1, 2) (ket(0) times.circle ket(Lambda_(2)) +
              ket(1) times.circle ket(Lambda_(2)) -
              i ket(0) times.circle ket(Lambda_(1)) +
              i ket(1) times.circle ket(Lambda_(1))) =
  frac(1, 2) (ket(0) times.circle (ket(Lambda_(2)) - i ket(Lambda_(1))) +
              ket(1) times.circle (ket(Lambda_(2)) + i ket(Lambda_(1)))) $

A measurement is performed on the first qubit. The associated projector is
given by $P_(0) = ketbra(0, 0) times.circle I^(times.circle n)$. Applying it
to the state gives:

$ P_(0) ket(Psi_(6)) &=
  (ketbra(0, 0) times.circle I^(times.circle n))
  frac(1, 2) (ket(0) times.circle (ket(Lambda_(2)) - i ket(Lambda_(1))) +
              ket(1) times.circle (ket(Lambda_(2)) + i ket(Lambda_(1)))) = \
  &= frac(1, 2) (ket(0) braket(0, 0) times.circle I^(times.circle n) (ket(Lambda_(2)) - i ket(Lambda_(1))) +
                 ket(0) braket(0, 1) times.circle I^(times.circle n) (ket(Lambda_(2)) + i ket(Lambda_(1)))) =
  frac(1, 2) (ket(0) times.circle (ket(Lambda_(2)) - i ket(Lambda_(1)))) $

Which means that the probability of measuring the first qubit to be in
state $ket(0)$ is:

$ bra(Psi_(6)) P_(0) ket(Psi_(6)) &=
  frac(1, 2) (bra(0) times.circle (bra(Lambda_(2)) + i bra(Lambda_(1))) +
              bra(1) times.circle (bra(Lambda_(2)) - i bra(Lambda_(1))))
  frac(1, 2) (ket(0) times.circle (ket(Lambda_(2)) - i ket(Lambda_(1)))) = \
  &= frac(1, 4) 
  (bra(0) times.circle (bra(Lambda_(2)) + i bra(Lambda_(1))))
  (ket(0) times.circle (ket(Lambda_(2)) - i ket(Lambda_(1))) +
  frac(1, 4)
  (bra(1) times.circle (bra(Lambda_(2)) - i bra(Lambda_(1))))
  (ket(0) times.circle (ket(Lambda_(2)) - i ket(Lambda_(1)))) = \
  &= frac(1, 4) 
  (braket(0, 0) times.circle (bra(Lambda_(2)) + i bra(Lambda_(1)))
                             (ket(Lambda_(2)) - i ket(Lambda_(1)))) =
  frac(1, 4) (braket(Lambda_(2), Lambda_(2)) -
              i braket(Lambda_(2), Lambda_(1)) +
              i braket(Lambda_(1), Lambda_(2)) +
              braket(Lambda_(1), Lambda_(1))) = \
  &= frac(1, 4) (1 + 1 - i braket(Lambda_(2), Lambda_(1)) +
                         i braket(Lambda_(1), Lambda_(2))) =
  frac(1, 4) (2 - i (braket(Lambda_(1), Lambda_(2)))^(*) +
                  i braket(Lambda_(1), Lambda_(2))) = \
  &= frac(i, 4) (frac(2, i) + braket(Lambda_(1), Lambda_(2))
                 - (braket(Lambda_(1), Lambda_(2)))^(*)) =
     frac(i, 4) (frac(2, i) + 2i Im(braket(Lambda_(1), Lambda_(2)))) =
     frac(1, 2) (1 - Im(braket(Lambda_(1), Lambda_(2)))) $
