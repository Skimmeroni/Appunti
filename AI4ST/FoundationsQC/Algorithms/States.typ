#import "../FoundationsQC_definitions.typ": *

=== Bell states

The following circuit generate the four different Bell states:

#align(
  center,
	[#quantum-circuit(scale: 150%,
	                  lstick([$ket(x)$]), gate($H$), ctrl(1), 1, [\ ],
	                  lstick([$ket(y)$]), 1, targ(), 1)]
)

Applying the Hadamard gate to the first qubit:

$ ket(Psi_(1)) &=
  (H times.circle I) (ket(x) times.circle ket(y)) =
  (H ket(x) times.circle I ket(y)) =
  frac(sqrt(2), 2) ((ket(0) + (-1)^(x) ket(1)) times.circle ket(y)) = \
  &= frac(sqrt(2), 2) (ket(0y) + (-1)^(x) ket(1y)) $

Applying a CNOT gate with first qubit as control and second as target:

$ ket(Psi_(2)) &=
  "CNOT"_(1, 2) frac(sqrt(2), 2) (ket(0y) + (-1)^(x) ket(1y)) =
  frac(sqrt(2), 2) ("CNOT"_(1, 2) ket(0y) + (-1)^(x) "CNOT"_(1, 2) ket(1y)) = \
  &= frac(sqrt(2), 2) (ket(0y) + (-1)^(x) ket(1(y or.dot 0))) $

Going over all the possible values of $x$ and $y$ it is possible to construct
the entire Bell basis:

$ "with" x = 0, y = 0 ==>
  frac(sqrt(2), 2) (ket(00) + (-1)^(0) ket(1(0 or.dot 0))) = 
  frac(sqrt(2), 2) (ket(00) + ket(11)) = ket(Phi^(+)) $

$ "with" x = 0, y = 1 ==>
  frac(sqrt(2), 2) (ket(01) + (-1)^(0) ket(1(1 or.dot 0))) = 
  frac(sqrt(2), 2) (ket(01) + ket(10)) = ket(Psi^(+)) $

$ "with" x = 1, y = 0 ==>
  frac(sqrt(2), 2) (ket(00) + (-1)^(1) ket(1(0 or.dot 0))) = 
  frac(sqrt(2), 2) (ket(00) - ket(11)) = ket(Phi^(-)) $

$ "with" x = 1, y = 1 ==>
  frac(sqrt(2), 2) (ket(01) + (-1)^(1) ket(1(1 or.dot 0))) = 
  frac(sqrt(2), 2) (ket(01) - ket(10)) = ket(Psi^(-)) $

=== GHZ state

The following circuit has $3$ qubits prepared in state $ket(0)$ and ends
in the GHZ state:

#align(
  center,
	[#quantum-circuit(scale: 150%,
	                  lstick([$ket(0)$]), gate($H$), ctrl(1), 1, 1, [\ ],
	                  lstick([$ket(0)$]), 1, targ(), ctrl(1), 1, [\ ],
	                  lstick([$ket(0)$]), 1, 1, targ(), 1)]
)

Applying a Hadamard gate to the first qubit:

$ ket(Psi_(1)) =
  H ket(Psi_(0)) =
  (H times.circle I times.circle I) ket(000) =
  (H ket(0) times.circle I ket(0) times.circle I ket(0)) =
  frac(sqrt(2), 2) (ket(0) + ket(1)) times.circle ket(00) =
  frac(sqrt(2), 2) (ket(000) + ket(100)) $

Applying a CNOT gate with first qubit as control and second qubit as target:

$ ket(Psi_(2)) &=
  ("CNOT"_(1, 2) times.circle I) ket(Psi_(1)) =
  ("CNOT"_(1, 2) times.circle I) frac(sqrt(2), 2) (ket(000) + ket(100)) = \
  &= frac(sqrt(2), 2) ("CNOT"_(1, 2) times.circle I) ((ket(00) + ket(10)) times.circle ket(0)) =
  frac(sqrt(2), 2) ("CNOT"_(1, 2) (ket(00) + ket(10)) times.circle I ket(0)) = \
  &= frac(sqrt(2), 2) (("CNOT"_(1, 2) ket(00) + "CNOT"_(1, 2) ket(10)) times.circle ket(0)) =
  frac(sqrt(2), 2) ((ket(00) + ket(11)) times.circle ket(0)) =
  frac(sqrt(2), 2) (ket(000) + ket(110)) $

Applying a CNOT gate with second qubit as control and third qubit as target:

$ ket(Psi_(3)) &=
  (I times.circle "CNOT"_(2, 3)) ket(Psi_(2)) =
  frac(sqrt(2), 2) (I times.circle "CNOT"_(2, 3)) (ket(0) times.circle ket(00) + ket(1) times.circle ket(10)) = \
  &= frac(sqrt(2), 2) (I times.circle "CNOT"_(2, 3)) (ket(0) times.circle ket(00)) +
     frac(sqrt(2), 2) (I times.circle "CNOT"_(2, 3)) (ket(1) times.circle ket(10)) = \
  &= frac(sqrt(2), 2) (I ket(0) times.circle "CNOT"_(2, 3) ket(00)) +
     frac(sqrt(2), 2) (I ket(1) times.circle "CNOT"_(2, 3) ket(10)) = \
  &= frac(sqrt(2), 2) (ket(0) times.circle ket(00) + ket(1) times.circle ket(11)) =
     frac(sqrt(2), 2) (ket(000) + ket(111)) $

=== W state

The following circuit has $3$ qubits prepared in state $ket(0)$ and ends
in the GHZ state:

#align(
  center,
	[#quantum-circuit(scale: 150%,
	                  lstick([$ket(0)$]), gate($R_(y)(2 cos^(-1)(1 slash sqrt(3)))$), ctrl(1), 1, ctrl(1), gate($X$), 1, [\ ],
	                  lstick([$ket(0)$]), 1, gate($H$), ctrl(1), targ(), 1, 1, [\ ],
	                  lstick([$ket(0)$]), 1, 1, targ(), 1, 1, 1)]
)

The rotation matrix is given by:

$ R_(y)(2 cos^(-1)(1 slash sqrt(3)) =
  mat(cos(cos^(-1)(1 slash sqrt(3))),
      sin(cos^(-1)(1 slash sqrt(3)));
      -sin(cos^(-1)(1 slash sqrt(3))),
      cos(cos^(-1)(1 slash sqrt(3)))) =
  mat(frac(1, sqrt(3)), sqrt(frac(2, 3));
      -sqrt(frac(2, 3)), frac(1, sqrt(3))) $

Applying a rotation on the $y$ axis on the first qubit:

$ ket(Psi_(1)) &=
  (mat(frac(1, sqrt(3)), sqrt(frac(2, 3)); -sqrt(frac(2, 3)), frac(1, sqrt(3))) times.circle I times.circle I) ket(000) =
  mat(frac(1, sqrt(3)), sqrt(frac(2, 3)); -sqrt(frac(2, 3)), frac(1, sqrt(3))) mat(1; 0) times.circle I ket(0) times.circle I ket(0) =
  mat(frac(1, sqrt(3)); sqrt(frac(2, 3))) times.circle ket(00) = \
  &= frac(1, sqrt(3)) mat(1; sqrt(2)) times.circle ket(00) =
  frac(1, sqrt(3)) (mat(1; 0) + sqrt(2) mat(0; 1)) times.circle ket(00) = 
  (frac(1, sqrt(3)) mat(1; 0) + sqrt(frac(2, 3)) mat(0; 1)) times.circle ket(00) = \
  &= (frac(1, sqrt(3)) ket(0) + sqrt(frac(2, 3)) ket(1)) times.circle ket(00) = 
  frac(1, sqrt(3)) ket(000) + sqrt(frac(2, 3)) ket(100) $

The controlled Hadamard is given by:

$ "CH" =
  (ketbra(0, 0) times.circle I + ketbra(1, 1) times.circle Q) times.circle I =
  ketbra(0, 0) times.circle I times.circle I + ketbra(1, 1) times.circle Q times.circle I $

Applying a controlled Hadamard with the first qubit as control
and the second as target:

$ ket(Psi_(2)) &=
  "CH" ket(Psi_(1)) =
  (ketbra(0, 0) times.circle I times.circle I + ketbra(1, 1) times.circle Q times.circle I)
  (frac(1, sqrt(3)) ket(000) + sqrt(frac(2, 3)) ket(100)) = \
  &= (ketbra(0, 0) times.circle I times.circle I + ketbra(1, 1) times.circle Q times.circle I)
  frac(1, sqrt(3)) ket(000) +
  (ketbra(0, 0) times.circle I times.circle I + ketbra(1, 1) times.circle Q times.circle I)
  sqrt(frac(2, 3)) ket(100) = \
  &= frac(1, sqrt(3)) (ketbra(0, 0) times.circle I times.circle I) ket(000) +
     cancel(frac(1, sqrt(3)) (ketbra(1, 1) times.circle Q times.circle I) ket(000)) +
     cancel(sqrt(frac(2, 3)) (ketbra(0, 0) times.circle I times.circle I) ket(100)) + \
     & space space sqrt(frac(2, 3)) (ketbra(1, 1) times.circle Q times.circle I) ket(100) =
  frac(1, sqrt(3)) (ket(0) times.circle I ket(0) times.circle I ket(0)) +
  sqrt(frac(2, 3)) (ket(1) times.circle Q ket(0) times.circle I ket(0)) = \
  &= frac(1, sqrt(3)) (ket(0) times.circle ket(0) times.circle ket(0)) +
  sqrt(frac(2, 3)) (ket(1) times.circle frac(sqrt(2), 2) (ket(0) + ket(1)) times.circle ket(0)) = \
  &= frac(1, sqrt(3)) ket(000) + sqrt(frac(2, 3)) (frac(sqrt(2), 2) (ket(100) + ket(110))) =
  frac(1, sqrt(3)) ket(000) + frac(1, sqrt(3)) ket(100) + frac(1, sqrt(3)) ket(110) $

Applying a CNOT gate with second qubit as control and third qubit as target:

$ ket(Psi_(3)) &=
  (I times.circle "CNOT"_(2, 3)) ket(Psi_(2)) = 
  (I times.circle "CNOT"_(2, 3))
  (frac(1, sqrt(3)) ket(000) + frac(1, sqrt(3)) ket(100) + frac(1, sqrt(3)) ket(110)) = \
  &= (I times.circle "CNOT"_(2, 3))(frac(1, sqrt(3)) ket(000)) +
     (I times.circle "CNOT"_(2, 3)) (frac(1, sqrt(3)) ket(100)) +
     (I times.circle "CNOT"_(2, 3)) (frac(1, sqrt(3)) ket(110)) = \
  &= frac(1, sqrt(3)) ket(000) + frac(1, sqrt(3)) ket(100) + frac(1, sqrt(3)) ket(111) $

Applying a CNOT gate with first qubit as control and second qubit as target:

$ ket(Psi_(4)) &=
  ("CNOT"_(1, 2) times.circle I) ket(Psi_(3)) = 
  ("CNOT"_(1, 2) times.circle I)
  (frac(1, sqrt(3)) ket(000) + frac(1, sqrt(3)) ket(100) + frac(1, sqrt(3)) ket(111)) = \
  &= ("CNOT"_(1, 2) times.circle I)(frac(1, sqrt(3)) ket(000)) +
     ("CNOT"_(1, 2) times.circle I) (frac(1, sqrt(3)) ket(100)) +
     ("CNOT"_(1, 2) times.circle I) (frac(1, sqrt(3)) ket(111)) = \
  &= frac(1, sqrt(3)) ket(000) + frac(1, sqrt(3)) ket(110) + frac(1, sqrt(3)) ket(101) $

Applying an X gate on the first qubit:

$ ket(Psi_(5)) &=
  (X times.circle I times.circle I) ket(Psi_(4)) =
  (X times.circle I times.circle I) (frac(1, sqrt(3)) ket(000) + frac(1, sqrt(3)) ket(110) + frac(1, sqrt(3)) ket(101)) = \
  &= (X times.circle I times.circle I) (frac(1, sqrt(3)) ket(000)) +
     (X times.circle I times.circle I) (frac(1, sqrt(3)) ket(110)) +
     (X times.circle I times.circle I) (frac(1, sqrt(3)) ket(101)) = \
  &= frac(1, sqrt(3)) ket(100) + frac(1, sqrt(3)) ket(010) + frac(1, sqrt(3)) ket(001) $
