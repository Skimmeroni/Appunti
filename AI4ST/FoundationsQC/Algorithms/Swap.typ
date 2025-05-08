#import "../FoundationsQC_definitions.typ": *

Let $Lambda_(1)$ and $Lambda_(2)$ be two quantum states. Suppose that
there's interest in knowing how much the two differ. Of course, this
cannot be done by measuring, since measurement destroys the information
contained in the two states. However, there is a way to know how much
two states differ without knowing what these two states actually are.

This can be achieved through a quantum algorithm called *swap test*,
whose circuit is presented below:

#align(
	center,
	[#quantum-circuit(scale: 150%,
	                  lstick($ket(0)$), gate($H$), ctrl(1), gate($H$), meter(), [\ ],
	                  lstick($ket(Lambda_(1))$), 1, swap(1), 1, [\ ],
	                  lstick($ket(Lambda_(2))$), 1, swap(0), 1)
	]
)

The algorithm starts with three qubits: an ancillary qubit prepared in the
state $ket(0)$ and two qubits prepared in the states $ket(Lambda_(1))$ and
$ket(Lambda_(2))$ respectively. Applying an Hadamard gate to the first qubit:

$ ket(Psi_(0)) =
  (H times.circle I times.circle I)
  (ket(0) times.circle ket(Lambda_(1)) times.circle ket(Lambda_(2))) =
  H ket(0) times.circle I ket(Lambda_(1)) times.circle I ket(Lambda_(2)) =
  frac(1, sqrt(2)) (ket(0) + ket(1)) times.circle ket(Lambda_(1)) times.circle ket(Lambda_(2)) $

Applying the controlled swap gate (first is control, second and third are
the target):

$ ket(Psi_(1)) &=
  "CSWAP"_(1, 2, 3) ket(Psi_(0)) =
  "CSWAP"_(1, 2, 3) (frac(1, sqrt(2)) (ket(0) + ket(1)) times.circle ket(Lambda_(1)) times.circle ket(Lambda_(2))) = \
  &= frac(1, sqrt(2)) "CSWAP"_(1, 2, 3) (ket(0) times.circle ket(Lambda_(1)) times.circle ket(Lambda_(2)) +
                                         ket(1) times.circle ket(Lambda_(1)) times.circle ket(Lambda_(2))) = \
  &= frac(1, sqrt(2)) (ket(0) times.circle ket(Lambda_(1)) times.circle ket(Lambda_(2)) +
                    ket(1) times.circle ket(Lambda_(2)) times.circle ket(Lambda_(1))) $

Applying an Hadamard gate to the first qubit once again:

$ ket(Psi_(2)) &=
  H ket(Psi_(1)) =
  (H times.circle I times.circle I)
  (frac(1, sqrt(2)) (ket(0) times.circle ket(Lambda_(1)) times.circle ket(Lambda_(2)) +
                     ket(1) times.circle ket(Lambda_(2)) times.circle ket(Lambda_(1)))) = \
  &= frac(1, sqrt(2)) (H ket(0) times.circle I ket(Lambda_(1)) times.circle I ket(Lambda_(2)) +
                       H ket(1) times.circle I ket(Lambda_(2)) times.circle I ket(Lambda_(1))) = \
  &= frac(1, sqrt(2)) (frac(1, sqrt(2)) (ket(0) + ket(1)) times.circle ket(Lambda_(1)) times.circle ket(Lambda_(2)) +
                       frac(1, sqrt(2)) (ket(0) - ket(1)) times.circle ket(Lambda_(2)) times.circle ket(Lambda_(1))) = \
  &= frac(1, 2) (ket(0) times.circle ket(Lambda_(1)) times.circle ket(Lambda_(2)) +
                 ket(1) times.circle ket(Lambda_(1)) times.circle ket(Lambda_(2)) +
                 ket(0) times.circle ket(Lambda_(2)) times.circle ket(Lambda_(1)) -
                 ket(1) times.circle ket(Lambda_(2)) times.circle ket(Lambda_(1))) = \
  &= frac(1, 2) ket(0) times.circle (ket(Lambda_(1)) times.circle ket(Lambda_(2)) + ket(Lambda_(2)) times.circle ket(Lambda_(1))) +
     frac(1, 2) ket(1) times.circle (ket(Lambda_(1)) times.circle ket(Lambda_(2)) - ket(Lambda_(2)) times.circle ket(Lambda_(1))) = \
  &= frac(1, 2) ket(0) times.circle (ket(Lambda_(1) Lambda_(2)) + ket(Lambda_(2) Lambda_(1))) +
     frac(1, 2) ket(1) times.circle (ket(Lambda_(1) Lambda_(2)) - ket(Lambda_(2) Lambda_(1))) $

A measurement is performed on the first qubit. The associated projector is
given by $P_(0) = ketbra(0, 0) times.circle I times.circle I$. Applying it
to the state gives:

$ P_(0) ket(Psi_(2)) &=
  (ketbra(0, 0) times.circle I times.circle I)
  (frac(1, 2) ket(0) times.circle (ket(Lambda_(1) Lambda_(2)) + ket(Lambda_(2) Lambda_(1))) +
   frac(1, 2) ket(1) times.circle (ket(Lambda_(1) Lambda_(2)) - ket(Lambda_(2) Lambda_(1)))) = \
  &= frac(1, 2) ket(0) braket(0, 0) times.circle (ket(Lambda_(1) Lambda_(2)) + ket(Lambda_(2) Lambda_(1))) +
   frac(1, 2) ket(0) braket(0, 1) times.circle (ket(Lambda_(1) Lambda_(2)) - ket(Lambda_(2) Lambda_(1))) = \
  &= frac(1, 2) ket(0) times.circle (ket(Lambda_(1) Lambda_(2)) + ket(Lambda_(2) Lambda_(1))) $

Which means that the probability of measuring the first qubit to be in
state $ket(0)$ is:

$ bra(Psi_(2)) P_(0) ket(Psi_(2)) &= 
  (frac(1, 2) bra(0) times.circle (bra(Lambda_(1) Lambda_(2)) + bra(Lambda_(2) Lambda_(1))) +
   frac(1, 2) bra(1) times.circle (bra(Lambda_(1) Lambda_(2)) - bra(Lambda_(2) Lambda_(1))))
  (frac(1, 2) ket(0) times.circle (ket(Lambda_(1) Lambda_(2)) + ket(Lambda_(2) Lambda_(1)))) = \
  &= frac(1, 4) (bra(0) times.circle (bra(Lambda_(1) Lambda_(2)) + bra(Lambda_(2) Lambda_(1))) +
   bra(1) times.circle (bra(Lambda_(1) Lambda_(2)) - bra(Lambda_(2) Lambda_(1))))
  (ket(0) times.circle (ket(Lambda_(1) Lambda_(2)) + ket(Lambda_(2) Lambda_(1)))) \
  &= frac(1, 4) (bra(0) times.circle (bra(Lambda_(1) Lambda_(2)) + bra(Lambda_(2) Lambda_(1))))
  (ket(0) times.circle (ket(Lambda_(1) Lambda_(2)) + ket(Lambda_(2) Lambda_(1)))) = \
  &= frac(1, 4) (braket(0, 0) times.circle (bra(Lambda_(1) Lambda_(2)) + bra(Lambda_(2) Lambda_(1)))
  (ket(Lambda_(1) Lambda_(2)) + ket(Lambda_(2) Lambda_(1)))) = \
  &= frac(1, 4) (braket(Lambda_(1) Lambda_(2), Lambda_(1) Lambda_(2)) +
                 braket(Lambda_(2) Lambda_(1), Lambda_(1) Lambda_(2)) +
                 braket(Lambda_(1) Lambda_(2), Lambda_(2) Lambda_(1)) +
                 braket(Lambda_(2) Lambda_(1), Lambda_(2) Lambda_(1))) = \
  &= frac(1, 4) (1 + (bra(Lambda_(2)) times.circle bra(Lambda_(1))) (ket(Lambda_(1)) times.circle ket(Lambda_(2))) +
                 (bra(Lambda_(1)) times.circle bra(Lambda_(2))) (ket(Lambda_(2)) times.circle ket(Lambda_(1))) + 1) = \
  &= frac(1, 4) (2 + braket(Lambda_(2), Lambda_(1)) braket(Lambda_(1), Lambda_(2)) +
                 braket(Lambda_(1), Lambda_(2)) braket(Lambda_(2), Lambda_(1))) = \
  &= frac(1, 4) (2 + 2 braket(Lambda_(2), Lambda_(1)) braket(Lambda_(1), Lambda_(2))) =
     frac(1, 2) + frac(1, 2) (braket(Lambda_(1), Lambda_(2)))^(*) braket(Lambda_(1), Lambda_(2)) =
     frac(1, 2) + frac(1, 2) abs(braket(Lambda_(1), Lambda_(2)))^(2) $

It is then necessary to run the circuit repeatedly on the exact
same input state, or to have many identical copies of those states
and run the circuit as many times in parallel. This way, the value
$frac(1, 2) + frac(1, 2) abs(braket(Lambda_(1), Lambda_(2)))^(2)$
will be estimated with increasing accuracy. In particular, an
accuracy of $epsilon$ can be achieved by running the circuit
$O(frac(1, epsilon^(2)))$ times.

When this sample mean $s = overline(bra(Psi_(2)) P_(0) ket(Psi_(2)))$
is collected, it is possible to solve for $abs(braket(Lambda_(1),
Lambda_(2)))$:

$ frac(1, 2) + frac(1, 2) abs(braket(Lambda_(1),Lambda_(2)))^(2)
  approx s => abs(braket(Lambda_(1),Lambda_(2))) approx sqrt(2 s - 1) $

For example, if $s = 0.5$, then $abs(braket(Lambda_(1),Lambda_(2))) = 0$,
which means that the two states are orthogonal. If $s = 1$, then
$abs(braket(Lambda_(1),Lambda_(2))) = 1$, which means that the two
states are equal.
