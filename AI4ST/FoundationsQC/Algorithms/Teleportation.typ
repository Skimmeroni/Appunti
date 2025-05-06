#import "../FoundationsQC_definitions.typ": *

The following circuit implements *quantum teleportation* of a single
qubit in an unknown state $ket(Lambda) = alpha ket(0) + beta ket(1)$:

#align(
	center,
	[#quantum-circuit(scale: 150%,
		lstick($ket(Lambda)$), 1, 1, ctrl(1), gate($H$), 1, ctrl(2), meter(), [\ ],
		lstick($ket(0)$), gate($H$), ctrl(1), targ(), 1, ctrl(1), 1, meter(), [\ ],
		lstick($ket(0)$), 1, targ(), 1, 1, targ(), gate($Z$), rstick($ket(Lambda)$)
	)]
)

Applying an Hadamard gate to the second qubit:

$ ket(Psi_(1)) &=
  (I times.circle H times.circle I) ((alpha ket(0) + beta ket(1)) times.circle ket(0) times.circle ket(0)) =
  (I (alpha ket(0) + beta ket(1))) times.circle (H ket(0)) times.circle (I ket(0)) = \
  &= (alpha ket(0) + beta ket(1)) times.circle frac(sqrt(2), 2) (ket(0) + ket(1)) times.circle ket(0) =
  frac(sqrt(2), 2) (alpha ket(0) + beta ket(1)) times.circle (ket(00) + ket(10)) = \
  &= frac(sqrt(2), 2) (alpha ket(000) + alpha ket(010) + beta ket(100) + beta ket(110)) $

Applying a CX (CNOT) gate to the second and third qubit:

$ ket(Psi_(2)) &=
  (I times.circle "CX"_(2, 3)) ket(Psi_(1)) =
  (I times.circle "CX"_(2, 3)) frac(sqrt(2), 2) (alpha ket(000) + alpha ket(010) + beta ket(100) + beta ket(110)) = \
  &= frac(sqrt(2), 2) ((I times.circle "CX"_(2, 3)) alpha ket(000) +
                    (I times.circle "CX"_(2, 3)) alpha ket(010) +
                    (I times.circle "CX"_(2, 3)) beta ket(100) +
                    (I times.circle "CX"_(2, 3)) beta ket(110)) = \
  &= frac(sqrt(2), 2) (alpha ket(000) + alpha ket(011) + beta ket(100) + beta ket(111)) $

Applying a CX gate to the first and second qubit:

$ ket(Psi_(3)) &=
  (I times.circle "CX"_(1, 2)) ket(Psi_(2)) =
  (I times.circle "CX"_(1, 2)) frac(sqrt(2), 2) (alpha ket(000) + alpha ket(011) + beta ket(100) + beta ket(111)) = \
  &= frac(sqrt(2), 2) ((I times.circle "CX"_(1, 2)) alpha ket(000) +
                    (I times.circle "CX"_(1, 2)) alpha ket(011) +
                    (I times.circle "CX"_(1, 2)) beta ket(100) +
                    (I times.circle "CX"_(1, 2)) beta ket(111)) = \
  &= frac(sqrt(2), 2) (alpha ket(000) + alpha ket(011) + beta ket(110) + beta ket(101)) $

Applying an Hadamard gate to the first qubit:

$ ket(Psi_(4)) &=
  (H times.circle I times.circle I) ket(Psi_(3)) =
  (H times.circle I times.circle I) frac(sqrt(2), 2) (alpha ket(000) + alpha ket(011) + beta ket(110) + beta ket(101)) = \
  &= frac(sqrt(2), 2) ((H times.circle I times.circle I) alpha ket(000) +
                       (H times.circle I times.circle I) alpha ket(011) +
                       (H times.circle I times.circle I) beta ket(110) +
                       (H times.circle I times.circle I) beta ket(101)) = \
  &= frac(sqrt(2), 2) (frac(sqrt(2), 2) (alpha (ket(0) + ket(1)) times.circle ket(00) +
                       alpha (ket(0) + ket(1)) times.circle ket(11) +
                       beta (ket(0) - ket(1)) times.circle ket(10) +
                       beta (ket(0) - ket(1)) times.circle ket(01))) = \
  &= frac(1, 2) (alpha ket(000) + alpha ket(100) + alpha ket(011) + alpha ket(111) +
                 beta ket(010) - beta ket(110) + beta ket(001) - beta ket(101)) $

Applying a CX (CNOT) gate to the second and third qubit:

$ ket(Psi_(5)) &=
  (I times.circle "CX"_(2, 3)) ket(Psi_(4)) = \
  &= (I times.circle "CX"_(2, 3)) frac(1, 2) (alpha ket(000) + alpha ket(100) + alpha ket(011) + alpha ket(111) +
                                              beta ket(010) - beta ket(110) + beta ket(001) - beta ket(101)) = \
  &= frac(1, 2) (alpha ket(000) + alpha ket(100) + alpha ket(010) + alpha ket(110) +
                 beta ket(011) - beta ket(111) + beta ket(001) - beta ket(101)) $

Applying a CZ gate to the first and third qubit:

$ ket(Psi_(6)) &=
  (I times.circle "CZ"_(1, 3)) ket(Psi_(5)) = \
  &= (I times.circle "CZ"_(1, 3)) frac(1, 2) (alpha ket(000) + alpha ket(100) + alpha ket(010) + alpha ket(110) +
                                              beta ket(011) - beta ket(111) + beta ket(001) - beta ket(101)) = \
  &= frac(1, 2) (alpha ket(000) + alpha ket(100) + alpha ket(010) + alpha ket(110) +
              beta ket(011) + beta ket(111) + beta ket(001) + beta ket(101)) \
  &= frac(1, 2) alpha (ket(000) + ket(100) + ket(010) + ket(110)) +
     frac(1, 2) beta (ket(011) + ket(111) + ket(001) + ket(101)) $

Measuring the first and second qubit can result in four outcomes:
$ket(00), ket(01), ket(10), ket(11)$. Their projectors are as follows:

$ mat(delim: "[",
	  P_(00) = ketbra(000, 000) + ketbra(001, 001),
	  P_(01) = ketbra(010, 010) + ketbra(011, 011);
	  P_(10) = ketbra(100, 100) + ketbra(101, 101),
	  P_(11) = ketbra(110, 110) + ketbra(111, 111)) $

Applying these projectors to the final state $ket(Psi_(6))$:

$ P_(00) ket(Psi_(6)) &=
  (ketbra(000, 000) + ketbra(001, 001))
  (frac(1, 2) alpha (ket(000) + ket(100) + ket(010) + ket(110)) +
  frac(1, 2) beta (ket(011) + ket(111) + ket(001) + ket(101))) = \
  &= frac(1, 2) alpha ket(000) + frac(1, 2) beta ket(001) $

$ P_(01) ket(Psi_(6)) &=
  (ketbra(010, 010) + ketbra(011, 011))
  (frac(1, 2) alpha (ket(000) + ket(100) + ket(010) + ket(110)) +
  frac(1, 2) beta (ket(011) + ket(111) + ket(001) + ket(101))) = \
  &= frac(1, 2) alpha ket(010) + frac(1, 2) beta ket(011) $

$ P_(10) ket(Psi_(6)) &=
  (ketbra(100, 100) + ketbra(101, 101))
  (frac(1, 2) alpha (ket(000) + ket(100) + ket(010) + ket(110)) +
  frac(1, 2) beta (ket(011) + ket(111) + ket(001) + ket(101))) = \
  &= frac(1, 2) alpha ket(100) + frac(1, 2) beta ket(101) $

$ P_(11) ket(Psi_(6)) &=
  (ketbra(110, 110) + ketbra(111, 111))
  (frac(1, 2) alpha (ket(000) + ket(100) + ket(010) + ket(110)) +
  frac(1, 2) beta (ket(011) + ket(111) + ket(001) + ket(101))) = \
  &= frac(1, 2) alpha ket(110) + frac(1, 2) beta ket(111) $

The norm of any of these states is the same, so the probability
of having it as outcome:

$ abs(abs(P_(00) ket(Psi_(6)))) &=
  abs(abs(P_(01) ket(Psi_(6)))) =
  abs(abs(P_(10) ket(Psi_(6)))) =
  abs(abs(P_(11) ket(Psi_(6)))) = \
  sqrt((frac(1, 2) alpha)^(2) + (frac(1, 2) beta)^(2)) &=
  sqrt(frac(1, 4) alpha^(2) + frac(1, 4) beta^(2)) =
  sqrt(frac(1, 4) (alpha^(2) + beta^(2))) =
  frac(1, 2) sqrt(alpha^(2) + beta^(2)) =
  frac(1, 2) dot 1 =
  frac(1, 2) $

$ abs(abs(P_(00) ket(Psi_(6))))^(2) =
  abs(abs(P_(01) ket(Psi_(6))))^(2) =
  abs(abs(P_(10) ket(Psi_(6))))^(2) =
  abs(abs(P_(11) ket(Psi_(6))))^(2) =
  (frac(1, 2))^(2) = frac(1, 4) $

The resulting four possible states are therefore:

$ ket(lambda_(1)) =
  frac(P_(00) ket(Psi_(6)), abs(abs(P_(00) ket(Psi_(6))))) =
  2(frac(1, 2) alpha ket(000) + frac(1, 2) beta ket(001)) =
  alpha ket(000) + beta ket(001) =
  ket(00) times.circle (alpha ket(0) + beta ket(1)) $
$ ket(lambda_(2)) =
  frac(P_(01) ket(Psi_(6)), abs(abs(P_(01) ket(Psi_(6))))) =
  2(frac(1, 2) alpha ket(010) + frac(1, 2) beta ket(011)) =
  alpha ket(010) + beta ket(011) =
  ket(01) times.circle (alpha ket(0) + beta ket(1)) $
$ ket(lambda_(3)) =
  frac(P_(10) ket(Psi_(6)), abs(abs(P_(10) ket(Psi_(6))))) =
  2(frac(1, 2) alpha ket(100) + frac(1, 2) beta ket(101)) =
  alpha ket(100) + beta ket(101) =
  ket(10) times.circle (alpha ket(0) + beta ket(1)) $
$ ket(lambda_(4)) =
  frac(P_(11) ket(Psi_(6)), abs(abs(P_(11) ket(Psi_(6))))) =
  2(frac(1, 2) alpha ket(110) + frac(1, 2) beta ket(111)) =
  alpha ket(110) + beta ket(111) =
  ket(11) times.circle (alpha ket(0) + beta ket(1)) $

Any of these states is reached with the same probability, and in all
four cases the third qubit is in the state $alpha ket(0) + beta ket(1)$,
which is exactly the state $ket(Lambda)$ with which the circuit started.
Notice how the starting state is now lost, since the first qubit had
to be measured and therefore losing its superposition.
