#import "../FoundationsQC_definitions.typ": *

Suppose a unitary operator $U$ has an eigenvector $ket(u)$ with eigenvalue
$e^(2 pi i phi)$, with $phi$ being an unknown parameter, meaning that $U
ket(u) = e^(2 pi i phi) ket(u)$. The *Quantum Phase Estimation Algorithm*
allows one to approximate the value of $phi$. The circuit for the algorithm
is presented below:

#align(
	center,
	[#quantum-circuit(scale: 150%,
	                  lstick($ket(0)^(times.circle t)$, n: 4), gate($H$), 1, 1, midstick($dots$), ctrl(4), mqgate($Q F T^(-1)$, n: 4), meter(), [\ ],
	                  setwire(0), 1, midstick($dots.v$), 1, 1, midstick($dots.v$), 1, 1, midstick($dots.v$), [\ ],
	                  1, gate($H$), 1, ctrl(2), midstick($dots$), 1, 1, meter(), [\ ],
	                  1, gate($H$), ctrl(1), 1, midstick($dots$), 1, 1, meter(), [\ ],
	                  lstick($ket(u)$), nwire($n$), gate($U^(2^(0))$), gate($U^(2^(1))$), midstick($dots$), gate($U^(2^(t - 1))$))
	]
)

Where the $t$ number of qubits of the first register is chosen depending
on the number of digits of the estimated value and on the probability of
the estimated value to be correct.

Applying the $t$ Hadamard gates to the first register:

$ ket(Psi_(0)) &=
  (H^(times.circle t) times.circle I^(times.circle n))
  (ket(0)^(times.circle t) times.circle ket(u)) =
  H^(times.circle t) ket(0)^(times.circle t) times.circle I^(times.circle n) ket(u) = \
  &= (frac(1, sqrt(2)) (ket(0) + ket(1))) times.circle
     (frac(1, sqrt(2)) (ket(0) + ket(1))) times.circle
     dots times.circle
     (frac(1, sqrt(2)) (ket(0) + ket(1))) times.circle
     ket(u)
  = frac(1, sqrt(2^(t))) (ket(0) + ket(1))^(times.circle t) times.circle ket(u) $

Applying the controlled $U^(2^(0)) = U$ matrix to the state $ket(u)$:

$ ket(Psi_(1)) &=
  (I^(times.circle t - 1) times.circle C U)
  (frac(1, sqrt(2^(t))) (ket(0) + ket(1))^(times.circle t) times.circle ket(u)) =
  frac(1, sqrt(2^(t))) (I^(times.circle t - 1) (ket(0) + ket(1))^(times.circle t - 1) times.circle C U ((ket(0) + ket(1)) times.circle ket(u))) = \
  &= frac(1, sqrt(2^(t))) (ket(0) + ket(1))^(times.circle t - 1) times.circle C U (ket(0u) + ket(1u)) =
     frac(1, sqrt(2^(t))) (ket(0) + ket(1))^(times.circle t - 1) times.circle (C U ket(0u) + C U ket(1u)) = \
  &= frac(1, sqrt(2^(t))) (ket(0) + ket(1))^(times.circle t - 1) times.circle (ket(0u) + e^(2 pi i phi) ket(1u)) =
     frac(1, sqrt(2^(t))) (ket(0) + ket(1))^(times.circle t - 1) times.circle (ket(0) + e^(2 pi i phi) ket(1)) times.circle ket(u) $

The substitution $C U ket(1u) = e^(2 pi i phi) ket(1u)$ is possible because,
by construction, $ket(u)$ is an eigenvector of $U$ with $e^(2 pi i phi)$ as
eigenvalue, and the control bit is set to $1$.

After applying all the $U$ matrices, the resulting state is:

$ ket(Psi_(2)) &=
  frac(1, sqrt(2^(t))) (ket(0) + e^(2 pi i phi 2^(t - 1)) ket(1)) times.circle 
                       (ket(0) + e^(2 pi i phi 2^(t - 2)) ket(1)) times.circle 
                       dots times.circle
                       (ket(0) + e^(2 pi i phi 2^(0)) ket(1)) times.circle
                       ket(u) = \
  &= frac(1, sqrt(2^(t))) (times.circle.big_(k = 0)^(t - 1) (ket(0) + e^(2 pi i phi 2^(t - 1 - k)) ket(1))) times.circle ket(u) =
     frac(1, sqrt(2^(t))) (sum_(k = 0)^(2^(t - 1)) e^(2 pi i phi k) ket(k)) times.circle ket(u) $

Then, the inverse QFT is applied to the first register of qubits. Assume
that the inverse QFT is performed with $l$ bits, with $l$ not necessarely
equal to $t$:

$ ket(Psi_(3))
  &= ("QFT"^(-1) times.circle I^(times.circle n))
     (frac(1, sqrt(2^(t))) (sum_(k = 0)^(2^(t - 1)) e^(2 pi i phi k) ket(k)) times.circle ket(u)) =
     "QFT"^(-1) (frac(1, sqrt(2^(t))) sum_(k = 0)^(2^(t - 1)) e^(2 pi i phi k) ket(k)) times.circle I^(times.circle n) ket(u) = \
  &= (frac(1, sqrt(2^(t))) sum_(k = 0)^(2^(t - 1)) e^(2 pi i phi k) ("QFT"^(-1) ket(k))) times.circle ket(u) =
     (frac(1, sqrt(2^(t))) sum_(k = 0)^(2^(t - 1)) e^(2 pi i phi k))
     (frac(1, sqrt(2^(t))) sum_(l = 0)^(2^(t - 1)) e^(-frac(2 pi i l k, 2^(t))) ket(l)) times.circle ket(u) = \
  &= (frac(1, 2^(t)) sum_(k = 0)^(2^(t - 1)) sum_(l = 0)^(2^(t - 1)) e^(2 pi i phi k)
     e^(-frac(2 pi i l k, 2^(t))) ket(l)) times.circle ket(u) =
     (frac(1, 2^(t)) sum_(k = 0)^(2^(t - 1)) sum_(l = 0)^(2^(t - 1)) e^(2 pi i k (phi -frac(l, 2^(t)))) ket(l)) times.circle ket(u) = \
  &= (frac(1, 2^(t)) sum_(k = 0)^(2^(t - 1)) sum_(l = 0)^(2^(t - 1)) e^(-frac(2 pi i k, 2^(t)) (l - 2^(t) phi)) ket(l)) times.circle ket(u) $

Decomposing the expression with respect to the computational basis:

$ ket(Psi_(3)) =
  (frac(1, 2^(t)) sum_(k = 0)^(2^(t - 1)) e^(-frac(2 pi i k, 2^(t)) (0 - 2^(t) phi)) ket(0) +
  frac(1, 2^(t)) sum_(k = 0)^(2^(t - 1)) e^(-frac(2 pi i k, 2^(t)) (1 - 2^(t) phi)) ket(1) +
  dots +
  frac(1, 2^(t)) sum_(k = 0)^(2^(t - 1)) e^(-frac(2 pi i k, 2^(t)) (2^(t) - 1 - 2^(t) phi)) ket(2^(t) - 1))
  times.circle ket(u) $

The approximation given by the algorithm depends on the choice of $t$.
To quantify the accuracy of the approximation, let $2^(t) phi = alpha +
2^(t) delta$, where $alpha$ is the positive integer closest to $2^(t) phi$
and $delta$ is the offset between the approximation $alpha$ and the true
value $phi$. Since $2^(n) delta$ is, by definition, a binary number with
integer part equal to $0$, it has to hold $-2^(-1) lt.eq 2^(t) delta lt.eq
2^(-1)$.

The $l$-th coefficient of the combination is given by:

$ c_(l) &=
  frac(1, 2^(t)) sum_(k = 0)^(2^(t - 1)) e^(-frac(2 pi i k, 2^(t)) (l - 2^(t) phi)) =
  frac(1, 2^(t)) sum_(k = 0)^(2^(t - 1)) e^(-frac(2 pi i k, 2^(t)) (l - (alpha + 2^(t) delta))) =
  frac(1, 2^(t)) sum_(k = 0)^(2^(t - 1)) e^(-frac(2 pi i k l, 2^(t)) + frac(2 pi i k (alpha + 2^(t) delta), 2^(t))) = \
  &= frac(1, 2^(t)) sum_(k = 0)^(2^(t - 1)) e^(-frac(2 pi i k l, 2^(t)) + frac(2 pi i k alpha, 2^(t)) + frac(2 pi i k cancel(2^(t)) delta, cancel(2^(t)))) =
     frac(1, 2^(t)) sum_(k = 0)^(2^(t - 1)) e^(frac(2 pi i k, 2^(t)) (-l + alpha) + 2 pi i k delta) =
     frac(1, 2^(t)) sum_(k = 0)^(2^(t - 1)) e^(-frac(2 pi i k, 2^(t)) (l - alpha)) e^(2 pi i k delta) $

Measuring the $t$ qubit register with respect to the computational basis
will yield a certain value $ket(l)$ with probability:

// This is not clear

$ P_(l) = abs(c_(l))^(2) &=
  abs(frac(1, 2^(t)) sum_(k = 0)^(2^(t - 1)) e^(-frac(2 pi i k, 2^(t)) (l - alpha)) e^(2 pi i k delta))^(2) =
  frac(1, 2^(2t)) abs(sum_(k = 0)^(2^(t - 1)) e^(-frac(2 pi i k, 2^(t)) (l - alpha)) e^(2 pi i k delta))^(2) =
  frac(1, 2^(2t)) abs(sum_(k = 0)^(2^(t - 1)) e^(2 pi i delta)^(k))^(2) = \
  &= frac(1, 2^(2t)) abs(frac(1 - e^(2 pi i delta)^(2^(t) - 1 + 1), 1 - e^(2 pi i delta)))^(2) =
     frac(1, 2^(2t)) abs(frac(1 - e^(2 pi i delta 2^(t)), 1 - e^(2 pi i delta)))^(2) = 
     frac(abs(1 - e^(2 pi i delta 2^(t)))^(2), 2^(2t) abs(1 - e^(2 pi i delta))^(2)) =
     frac(abs(sin(pi delta 2^(t)))^(2), 2^(2t) abs(sin(pi delta))^(2)) $

Since $-2^(-1) lt.eq 2^(t) delta lt.eq 2^(-1)$, it must hold $-2^(-1-t) lt.eq
delta lt.eq 2^(-1-t)$. Being $t$ at least $1$ ($t = 0$ would mean that the
circuit has no qubits to store the estimated eigenvalue, making it pointless),
$delta lt.eq 1 slash 4$, that in turn implies $pi delta lt.eq 1$, being a
proper fraction. This implies:

$ abs(sin(pi delta))^(2) lt.eq abs(pi delta)^(2) =>
  frac(1, abs(sin(pi delta))^(2)) gt.eq frac(1, abs(pi delta)^(2)) =>
  frac(abs(sin(pi delta 2^(t)))^(2), 2^(2t) abs(sin(pi delta))^(2)) gt.eq
  frac(abs(sin(pi delta 2^(t)))^(2), 2^(2t) abs(pi delta)^(2)) =>
  P_(l) gt.eq frac(abs(sin(pi delta 2^(t)))^(2), 2^(2t) abs(pi delta)^(2)) $

It is also easy to see that, for $delta lt.eq 1 slash 4$:

$ abs(sin(pi delta 2^(t)))^(2) gt.eq abs(2^(t + 1) delta)^(2) =>
  frac(abs(sin(pi delta 2^(t)))^(2), 2^(2t) abs(pi delta)^(2)) gt.eq
  frac(abs(2^(t + 1) delta)^(2), 2^(2t) abs(pi delta)^(2)) =>
  P_(l) gt.eq frac(abs(2 dot 2^(t) delta)^(2), 2^(2t) abs(pi delta)^(2)) =>
  P_(l) gt.eq frac(abs(2)^(2) cancel(abs(2^(t))^(2)) cancel(abs(delta)^(2)),
                   cancel(2^(2t)) abs(pi)^(2) cancel(abs(delta)^(2))) =>
  P_(l) gt.eq frac(4, pi^(2)) $

Which means that the probability of obtaining the best approximation
possible employing $t$ bits is at least roughly $40%$.
