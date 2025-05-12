#import "../FoundationsQC_definitions.typ": *

The *Discrete Fourier Trasform* (*DFT*) operates on a vector of complex
numbers $X = (x_(0), x_(1), dots, x_(N - 1))^(T)$ and returns another
vector of complex numbers $Y = (y_(0), y_(1), dots, y_(N - 1))^(T)$.
The $k$-th number of the returned vector is computed as follows:

$ y_(k) = frac(1, sqrt(N)) sum_(j = 0)^(N - 1) x_(j) exp(2 pi i frac(k j, N)) $

#exercise[
	Let $X = (1, 2 - i, -i, -1 + 2i)^(T)$. What is its DFT?
]
#solution[
	$ y_(k) &= frac(1, sqrt(4)) sum_(j = 0)^(3) x_(j) exp(2 pi i frac(j k, 4)) = \
	        &= frac(1, 2) (x_(0) exp(2 pi i frac(0 k, 4)) +
	                       x_(1) exp(2 pi i frac(1 k, 4)) +
	                       x_(2) exp(2 pi i frac(2 k, 4)) +
	                       x_(3) exp(2 pi i frac(3 k, 4))) = \ 
	        &= frac(1, 2) (1 +
	                      (2 - i) dot exp(frac(1, 2) pi i k) -
	                      i dot exp(pi i k) +
	                      (-1 + 2i) dot exp(frac(3, 2) pi i k)) $

	Solved explicitly:

	$ y_(0) &= frac(1, 2) (1 + (2 - i) dot exp(frac(1, 2) pi i 0) -
	                            i dot exp(pi i 0) +
	                            (-1 + 2i) dot exp(frac(3, 2) pi i 0)) = \
	       &= frac(1, 2) (1 + (2 - i) dot 1 - i dot 1 + (-1 + 2i) dot 1)
	        = frac(1, 2) (1 + 2 - i - i -1 + 2i) = frac(1, 2) dot 2 = 1 \
	  y_(1) &= frac(1, 2) (1 + (2 - i) dot exp(frac(1, 2) pi i 1) -
	                            i dot exp(pi i 1) +
	                            (-1 + 2i) dot exp(frac(3, 2) pi i 1)) = \
	       &= frac(1, 2) (1 + (2 - i) i + i - (-1 + 2i) i)
	        = frac(1, 2) (1 + 2i + 1 + i + i + 2) = frac(1, 2) dot (4 + 4i) = 2 + 2i \
	  y_(2) &= frac(1, 2) (1 + (2 - i) dot exp(frac(1, 2) pi i 2) -
	                            i dot exp(pi i 2) +
	                            (-1 + 2i) dot exp(frac(3, 2) pi i 2)) = \
	       &= frac(1, 2) (1 - (2 - i) - i - (-1 + 2i))
	        = frac(1, 2) (1 - 2 + i - i + 1 - 2i) = frac(1, 2) dot (-2i) = -i \
	  y_(3) &= frac(1, 2) (1 + (2 - i) dot exp(frac(1, 2) pi i 3) -
	                            i dot exp(pi i 3) +
	                            (-1 + 2i) dot exp(frac(3, 2) pi i 3)) = \
	       &= frac(1, 2) (1 - (2 - i) i + i + (-1 + 2i) i)
	        = frac(1, 2) (1 - 2i - 1 + i - i - 2) = frac(1, 2) (-2i -2) = -1 -i $

	Which gives $Y = (1, 2 + 2i, -i, -1 -i)^(T)$
]

The *Quantum Fourier Transform* (*QFT*) is the analogous operation
with respect to quantum states. The QFT of an orthonormal (standard)
basis vector $ket(j)$, where $j$ is written as an integer, is given by:

#grid(
	columns: (0.66fr, 0.33fr),
	[$ "QFT"(ket(j)) =
	   frac(1, sqrt(N)) sum_(k = 0)^(N - 1) exp(2 pi i frac(k j, N)) ket(k) =
	   frac(1, sqrt(N)) sum_(k = 0)^(N - 1) w^(k j) ket(k) $],
	[$ "with" exp(frac(2 pi i, N)) = w $]
)

When applied to a single qubit, meaning $N = 2$ and $j$ either equal to
$0$ or to $1$, the QFT is equivalent to the Hadamard operator:

$ "QFT"(ket(0)) &=
	   frac(1, sqrt(2)) sum_(k = 0)^(2 - 1) exp(2 pi i frac(k dot 0, 2)) ket(k) =
	   frac(1, sqrt(2)) (exp(2 pi i dot 0) ket(0) + exp(2 pi i dot 0) ket(1)) = 
	   frac(1, sqrt(2)) (ket(0) + ket(1)) \
  "QFT"(ket(1)) &=
	   frac(1, sqrt(2)) sum_(k = 0)^(2 - 1) exp(2 pi i frac(k dot 1, 2)) ket(k) =
	   frac(1, sqrt(2)) (exp(2 pi i dot frac(0, 2)) ket(0) + exp(2 pi i dot frac(1, 2)) ket(1)) = 
	   frac(1, sqrt(2)) (ket(0) - ket(1)) $

It is possible to construct an equivalent matrix for the QFT. First, recall
that any standard basis vector $ket(j)$ is a column vector of $N = 2^(n - 1)$
elements, where the $j$-th entry is $1$ and all the others are $0$. Expanding:

$ "QFT"(ket(j)) &=
  frac(1, sqrt(N)) sum_(k = 0)^(N - 1) w^(k j) ket(k) = \
  &= frac(1, sqrt(N)) (w^(0 j) ket(0) +
                    w^(1 j) ket(1) +
                    w^(2 j) ket(2) +
                    dots +
                    w^((N - 1) j) ket(N - 1)) = \
  &= frac(1, sqrt(N)) (w^(0 j) vec(1, 0, 0, dots.v, 0) +
                       w^(1 j) vec(0, 1, 0, dots.v, 0) +
                       w^(2 j) vec(0, 0, 1, dots.v, 0) +
                       dots +
                       w^((N - 1) j) vec(0, 0, 0, dots.v, 1)) = \
  &= frac(1, sqrt(N)) (vec(w^(0 j), 0, 0, dots.v, 0) +
                       vec(0, w^(1 j), 0, dots.v, 0) +
                       vec(0, 0, w^(2 j), dots.v, 0) +
                       dots +
                       vec(0, 0, 0, dots.v, w^((N - 1) j))) =
     frac(1, sqrt(N)) vec(1, w^(j), w^(2j), dots.v, w^((N - 1) j)) $

The equivalent matrix for the QFT is therefore given by juxtaposing all
the vectors $"QFT"(ket(0)), "QFT"(ket(1)), dots, "QFT"(ket(N - 1))$:

$ U = frac(1, sqrt(N))
  mat(1, 1, 1, 1, dots, 1;
      1, w, w^(2), w^(3), dots, w^(N - 1);
      1, w^(2), w^(4), w^(6), dots, w^(2 (N - 1));
      1, w^(3), w^(6), w^(9), dots, w^(3 (N - 1));
      dots.v, dots.v, dots.v, dots.v, dots.down, dots.v;
      1, w^(N - 1), w^((N - 1) 2), w^((N - 1) 3), dots, w^((N - 1) (N - 1))) $

#exercise[
	Compute $"QFT"(ket(110))$ using the QFT matrix.
]
#solution[
	Let $exp(2 pi i slash 2^(n)) = w$. The $(r, s)$-th entry of the QFT
	matrix is given by $w^((r - 1) (s - 1))$. However, the matrix can be
	simplified by computing $w$ explicitly: since $n = 3$, $exp(2 pi
	i slash 2^(3)) = exp(pi i slash 4) = sqrt(i)$. Also, $w^(8) = exp((2
	pi i slash 8)^(8)) = exp(2 pi i) = 1$, therefore $w^(n) = w^(n + 8)$
	for any integer $n$.

	$ U = frac(1, sqrt(8))
	      mat(1, 1,     1,     1,     1,     1,     1,     1;
	          1, w,     w^(2), w^(3), w^(4), w^(5), w^(6), w^(7);
	          1, w^(2), w^(4), w^(6), 1,     w^(2), w^(4), w^(6);
	          1, w^(3), w^(6), w,     w^(4), w^(7), w^(2), w^(5);
	          1, w^(4), 1,     w^(4), 1,     w^(4), 1,     w^(4);
	          1, w^(5), w^(2), w^(7), w^(4), w,     w^(6), w^(3);
	          1, w^(6), w^(4), w^(2), 1,     w^(6), w^(4), w^(2);
	          1, w^(7), w^(6), w^(5), w^(4), w^(3), w^(2), w) =
		  frac(1, sqrt(8))
	      mat(1,  1,          1,  1,          1,  1,          1,  1;
	          1,  sqrt(i),    i,  i sqrt(i), -1, -sqrt(i),   -i, -i sqrt(i);
	          1,  i,         -1, -i,          1,  i,         -1, -i;
	          1,  i sqrt(i), -i,  sqrt(i),   -1, -i sqrt(i),  i, -sqrt(i);
	          1, -1,          1, -1,          1, -1,          1, -1;
	          1, -sqrt(i),    i, -i sqrt(i), -1,  sqrt(i),   -i,  i sqrt(i);
	          1, -i,         -1,  i,          1, -i,         -1,  i;
	          1, -i sqrt(i), -i, -sqrt(i),   -1,  i sqrt(i),  i,  sqrt(i)) $

	Multiplying $U$ by the vector $ket(110) = (0, 0, 0, 0, 0, 0, 1, 0)^(T)$ gives:

	$ U ket(110) =
	  frac(1, sqrt(8))
	  mat(1,  1,          1,  1,          1,  1,          1,  1;
	      1,  sqrt(i),    i,  i sqrt(i), -1, -sqrt(i),   -i, -i sqrt(i);
	      1,  i,         -1, -i,          1,  i,         -1, -i;
	      1,  i sqrt(i), -i,  sqrt(i),   -1, -i sqrt(i),  i, -sqrt(i);
	      1, -1,          1, -1,          1, -1,          1, -1;
	      1, -sqrt(i),    i, -i sqrt(i), -1,  sqrt(i),   -i,  i sqrt(i);
	      1, -i,         -1,  i,          1, -i,         -1,  i;
	      1, -i sqrt(i), -i, -sqrt(i),   -1,  i sqrt(i),  i,  sqrt(i))
	  vec(0, 0, 0, 0, 0, 0, 1, 0) =
	  frac(1, sqrt(8)) vec(1, -i, -1, i, 1, -i, -1, i) $

	Which is equivalent to the state:

	$ ket(Psi) = frac(1, sqrt(8)) (ket(000) - i ket(001) - ket(010) + i ket(011) + ket(100) - i ket(101) - ket(110) + i ket(111)) $
]

#theorem[
	The QFT matrix is unitary.
] <QFT-matrix-is-unitary>
#proof[
	By definition, the matrix $U$ is unitary if $U U^(dagger) =
	U^(dagger) U = I$. Writing explicitly the conjugate transpose
	of $U$ hints about its unitarity:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ U = frac(1, sqrt(N))
			mat(1, 1, 1, dots, 1;
			1, w, w^(2), dots, w^(N - 1);
			1, w^(2), w^(4), dots, w^(2 (N - 1));
			dots.v, dots.v, dots.v, dots.down, dots.v;
			1, w^(N - 1), w^((N - 1) 2), dots, w^((N - 1) (N - 1))) $],
		[$ U^(dagger) = frac(1, sqrt(N))
						mat(1, 1, 1, dots, 1;
						1, w^(-1), w^(-2), dots, w^(-(N - 1));
						1, w^(-2), w^(-4), dots, w^(-2 (N - 1));
						dots.v, dots.v, dots.v, dots.down, dots.v;
						1, w^(-(N - 1)), w^(-(N - 1) 2), dots, w^(-(N - 1) (N - 1))) $]
	)

	Consider the matrix product $U U^(dagger)$: the $(r, s)$-th entry of
	$U U^(dagger)$ is given by:

	$ U U^(dagger)[r, s] &=
	frac(1, sqrt(N)) vec(1, w^(r), w^(2r), dots.v, w^((N - 1) r)) 
	frac(1, sqrt(N)) (1, w^(-s), w^(-2s), dots, w^(-(N - 1) s)) = \
	&= frac(1, N) (1 dot 1 + w^(r) dot w^(-s) + w^(2r) dot w^(-2s) + dots + w^((N - 1) r) dot w^(-(N - 1) s)) = \
	&= frac(1, N) (1 + w^(r - s) + w^(2(r - s)) + dots + w^((N - 1) (r - s))) =
		frac(1, N) sum_(j = 0)^(N - 1) w^(j(r - s)) =
		frac(1, N) sum_(j = 0)^(N - 1) w^(j q) $

	With $q = r - s$. When $q = 0$:

	$ frac(1, N) sum_(j = 0)^(N - 1) w^(j dot 0) =
	frac(1, N) sum_(j = 0)^(N - 1) w^(0) = 
	frac(1, N) sum_(j = 0)^(N - 1) 1 = 
	frac(1, N) (1 + 1 + 1 + dots + 1) = 
	frac(1, cancel(N)) dot cancel(N) = 1 $

	Which means that all diagonal entries of $U U^(dagger)$ are equal to $1$.
	On the other hand, consider the case $q != 0$. The expression $(1 slash N)
	sum_(j = 0)^(N - 1) w^(j q)$ can be written as a (truncated) geometric series:

	$ frac(1, N) sum_(j = 0)^(N - 1) w^(j q) &= 
	frac(1, N) sum_(j = 0)^(N - 1) exp(frac(2 pi i, N))^(j q) = 
	frac(1, N) sum_(j = 0)^(N - 1) exp(frac(2 pi i q, N))^(j) = 
	frac(1, N) (frac(1 - exp(frac(2 pi i q, N))^((N - 1) + 1), 1 - exp(frac(2 pi i q, N)))) = \
	&= frac(1 - exp(frac(2 pi i q, cancel(N)) dot cancel(N)), N(1 - exp(frac(2 pi i q, N)))) =
		frac(1 - exp(q(2 pi i)), N - N exp(2 pi i q slash N)) $

	Note that $q$ is, by definition, an integer. This means that:

	$ frac(1 - exp(q(2 pi i)), N - N exp(2 pi i q slash N)) =
	frac(1 - exp(2 pi i), N - N exp(2 pi i q slash N)) =
	frac(1 - 1, N - N exp(2 pi i q slash N)) =
	frac(0, N - N exp(2 pi i q slash N)) = 0 $

	Also note that the denominator does not pose a problem, since it can
	never be equal to $0$. This is because the expression $N - N exp(2 pi
	i q slash N)$ can be equal to $0$ either if $N = 0$ or if $q = N$.
	However, $N$ cannot be equal to $0$ by definition and $q$ is an integer
	in the interval $[-(N - 1), +(N - 1)]$, therefore it cannot possibly be
	equal to $N$.
]

Due to @QFT-matrix-is-unitary, $U$ can be implemented in a quantum
circuit. However, it is first convenient to rewrite the expression
for the QFT in more convoluted, but easier to work with, way.

Let $N = 2^(n)$. Consider a computational basis state $ket(j)$, with $j in
[0, dots, 2^(n) - 1]$. The number $j$ can be written in binary representation
as $j = j_(1) j_(2) dots j_(n)$ or equivalently in decimal representation as:

$ j = sum_(l = 1)^(n) j_(l) dot 2^(n - l) =
      sum_(l = 1)^(n) j_(l) (frac(2^(n), 2^(l))) =
      j_(1) dot 2^(n - 1) + j_(2) dot 2^(n - 2) + dots + j_(n) dot 2^(n - n) =
      j_(1) dot 2^(n - 1) + j_(2) dot 2^(n - 2) + dots + j_(n) $

Consider what happens when $j$ is divided by $2^(n)$:

$ frac(j, 2^(n)) &=
  frac(j_(1) dot 2^(n - 1) + j_(2) dot 2^(n - 2) + dots + j_(n), 2^(n)) =
  frac(j_(1) dot 2^(n - 1), 2^(n)) + frac(j_(2) dot 2^(n - 2), 2^(n)) + dots + frac(j_(n) dot 1, 2^(n)) = \
  &= j_(1) dot 2^((n - 1) - n) + j_(2) dot 2^((n - 2) - n) + dots + j_(n) dot 2^(0 - n) =
     j_(1) dot 2^(-1) + j_(2) dot 2^(-2) + dots + j_(n) dot 2^(-n) =
     0.j_(1) j_(2) dots j_(n) $

That is, it is the binary representation of a $n$-bit bit-shift. This
allows one to rewrite the QFT of a standard basis state $ket(j)$, with
$j$ binary number $j = j_(1) j_(2) dots j_(n)$, as follows:

$ "QFT"(ket(j)) &=
  "QFT"(ket(j_(1) j_(2) dots j_(n))) =
	   frac(1, sqrt(2^(n))) sum_(k = 0)^(2^(n) - 1) exp(2 pi i j frac(k, 2^(n))) ket(k) = \
  &= frac(1, sqrt(2^(n)))
     sum_(k_(1) = 0)^(1)
     dots
     sum_(k_(n) = 0)^(1)
     (product_(l = 1)^(n) exp(2 pi i j frac(k_(l), 2^(l)))) ket(k_(1) k_(2) dots k_(n)) = \
  &= frac(1, sqrt(2^(n))) sum_(k_(1) = 0)^(1) dots sum_(k_(n) = 0)^(1) exp(2 pi i j (sum^(n)_(l = 1) frac(k_(l), 2^(l)))) ket(k_(1) k_(2) dots k_(n)) = \
  &= frac(1, sqrt(2^(n)))
     (sum_(k_(1) = 0)^(1) exp(2 pi i j frac(k_(1), 2^(1))) ket(k_(1)) times.circle
     sum_(k_(2) = 0)^(1) exp(2 pi i j frac(k_(2), 2^(2))) ket(k_(2)) times.circle
	 dots times.circle
     sum_(k_(n) = 0)^(1) exp(2 pi i j frac(k_(n), 2^(n))) ket(k_(n))) = \
  &= frac(1, sqrt(2^(n)))
     times.circle.big_(l = 1)^(n)
     (sum_(k_(l) = 0)^(1) exp(2 pi i j frac(k_(l), 2^(l))) ket(k_(l))) =
     frac(1, sqrt(2^(n)))
     times.circle.big_(l = 1)^(n)
     (ket(0) + exp(2 pi i j 2^(-l)) ket(1)) = \
  &= frac(1, sqrt(2^(n))) (ket(0) + e^(2 pi i 0.j_(n)) ket(1)) times.circle
       (ket(0) + e^(2 pi i 0.j_(n - 1) j_(n)) ket(1)) times.circle
       dots times.circle
       (ket(0) + e^(2 pi i 0.j_(1) j_(2) dots j_(n)) ket(1)) $

#exercise[
	Compute $"QFT"(ket(110))$ using the newfound formula.
]
#solution[
	The QFT for a $3$-qubit state looks like this:

	$ "QFT"(ket(j)) =
	  frac(1, sqrt(2^(n)))
	  (ket(0) + e^(2 pi i 0.j_(3)) ket(1)) times.circle
	  (ket(0) + e^(2 pi i 0.j_(2) j_(3)) ket(1)) times.circle
	  (ket(0) + e^(2 pi i 0.j_(1) j_(2) j_(3)) ket(1)) $

	Substituting $j_(1) = 1, j_(2) = 1, j_(3) = 0$:

	$ ket(Psi) =
	  "QFT"(ket(110)) &=
	  frac(1, sqrt(8))
	  (ket(0) + e^(2 pi i 0.0) ket(1)) times.circle
	  (ket(0) + e^(2 pi i 0.10) ket(1)) times.circle
	  (ket(0) + e^(2 pi i 0.110) ket(1)) = \
	  &= frac(1, sqrt(8))
	     (ket(0) + e^(2 pi i dot 0) ket(1)) times.circle
	     (ket(0) + e^(2 pi i (frac(1, 2))) ket(1)) times.circle
	     (ket(0) + e^(2 pi i (frac(1, 2) + frac(1, 4))) ket(1)) = \
	  &= frac(1, sqrt(8))
	     (ket(0) + e^(0) ket(1)) times.circle
	     (ket(0) + e^(pi i) ket(1)) times.circle
	     (ket(0) + e^(3 pi i slash 2) ket(1)) = \ 
	  &= frac(1, sqrt(8))
	     (ket(0) + ket(1)) times.circle
	     (ket(0) - ket(1)) times.circle
	     (ket(0) - i ket(1)) = \
	  &= frac(1, sqrt(8))
	     (ket(00) - ket(01) + ket(10) - ket(11)) times.circle
	     (ket(0) - i ket(1)) = \
	  &= frac(1, sqrt(8))
	     (ket(000) - i ket(001) - ket(010) + i ket(011) + ket(100) - i ket(101) - ket(110) + i ket(111)) $
]

Let $P_(eta) = mat(1, 0; 0, e^(frac(2 pi i, 2^(eta))))$. The circuit for
the QFT is presented as follows:

#align(
	center,
	[#quantum-circuit(scale: 75%,
		lstick($ket(j_(1))$), gate($H$), gate($P_(2)$), gate($P_(3)$), gate($dots$), gate($P_(n - 1)$), gate($P_(n)$), 1, 1, 1, 1, 1, midstick($dots$), 1, 1, 1, swap(0), 1, midstick($dots$), 1, [\ ],
		lstick($ket(j_(2))$), 1, ctrl(-1), 1, 1, 1, 1, gate($H$), gate($P_(2)$), gate($dots$), gate($P_(n - 2)$), gate($P_(n - 1)$), midstick($dots$), 1, 1, 1, 1, swap(0), midstick($dots$), 1, [\ ],
		lstick($ket(j_(3))$), 1, 1, ctrl(-2), 1, 1, 1, 1, ctrl(-1), 1, 1, 1, midstick($dots$), 1, 1, 1, 1, 1, midstick($dots$), swap(0), [\ ],
		lstick($dots.v$), 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, midstick($dots$), 1, 1, 1, 1, 1, midstick($dots$), swap(-1), [\ ],
		lstick($ket(j_(n - 1))$), 1, 1, 1, 1, ctrl(-4), 1, 1, 1, 1, ctrl(-3), 1, midstick($dots$), gate($H$), gate($P_(2)$), 1, 1, swap(-3), midstick($dots$), 1, [\ ],
		lstick($ket(j_(n))$), 1, 1, 1, 1, 1, ctrl(-5), 1, 1, 1, 1, ctrl(-4), midstick($dots$), 1, ctrl(-1), gate($H$), swap(-5), 1, midstick($dots$), 1
	)]
)

This circuit encodes in each wire one of the terms of the QFT as presented
above. Consider the first qubit; applying the Hadamard gate gives:

$ ket(Psi_(0)) &= (H times.circle I^(times.circle (n - 1)))
                 (ket(j_(1)) times.circle ket(j_(2)) times.circle dots times.circle ket(j_(n))) =
                 H ket(j_(1)) times.circle I ket(j_(2)) times.circle dots times.circle I ket(j_(n)) = \
 &= (frac(sqrt(2), 2) ket(0) + (-1)^(j_(1)) ket(1)) times.circle ket(j_(2) dots j_(n)) =
    frac(sqrt(2), 2) (ket(0) + e^(i pi j_(1)) ket(1)) times.circle ket(j_(2) dots j_(n)) = \
 &= frac(sqrt(2), 2) (ket(0) + e^(frac(2 i pi j_(1), 2)) ket(1)) times.circle ket(j_(2) dots j_(n)) =
    frac(sqrt(2), 2) (ket(0) + e^(2 i pi 0.j_(1)) ket(1)) times.circle ket(j_(2) dots j_(n)) $

Applying the controlled $P_(2)$ onto the first qubit:

$ ket(Psi_(1)) &= (P_(2) times.circle I^(times.circle (n - 1)))
                  ((frac(sqrt(2), 2) ket(0) + e^(2 i pi 0.j_(1)) ket(1)) times.circle ket(j_(2) dots j_(n))) = \
               &= P_(2) (frac(sqrt(2), 2) ket(0) + e^(2 i pi 0.j_(1)) ket(1)) times.circle I^(times.circle (n - 1)) ket(j_(2) dots j_(n)) =
                  frac(sqrt(2), 2) (P_(2) ket(0) + P_(2) e^(2 i pi 0.j_(1)) ket(1)) times.circle ket(j_(2) dots j_(n)) = \
               &= frac(sqrt(2), 2) (ket(0) + e^(2 i pi 0.j_(1)) e^(2 pi i j_(2) slash 2^(2)) ket(1)) times.circle ket(j_(2) dots j_(n)) =
                frac(sqrt(2), 2) (ket(0) + e^(2 i pi 0.j_(1) + 2 pi i 0.0j_(2)) ket(1)) times.circle ket(j_(2) dots j_(n)) = \
               &= frac(sqrt(2), 2) (ket(0) + e^(2 i pi 0.j_(1)j_(2)) ket(1)) times.circle ket(j_(2) dots j_(n)) $

It is clear that applying $P_(3), P_(4), dots, P_(n)$ will add an extra
bit to the phase of the $ket(1)$ state, obtaining:

$ frac(sqrt(2), 2) (ket(0) + e^(2 i pi 0.j_(1) j_(2) dots j_(n)) ket(1)) times.circle ket(j_(2) dots j_(n)) $

The same procedure is applied to all the qubits one by one. For instance,
the second qubit will undergo an Hadamard gate and the $P_(2), P_(3), P_(4),
dots, P_(n - 1)$ controlled gates, giving:

$ frac(1, 2) (ket(0) + e^(2 i pi 0.j_(1) j_(2) dots j_(n)) ket(1)) times.circle
             (ket(0) + e^(2 i pi 0.j_(2) dots j_(n)) ket(1)) times.circle
             ket(j_(3) dots j_(n)) $

When the last qubit undergoes the Hadamard gate, the state will be:

$ frac(1, sqrt(2^(n)))
  (ket(0) + e^(2 i pi 0.j_(1) j_(2) dots j_(n)) ket(1)) times.circle
  (ket(0) + e^(2 i pi 0.j_(2) dots j_(n)) ket(1)) times.circle
  dots times.circle
  (ket(0) + e^(2 i pi 0.j_(n - 1) j_(n)) ket(1)) times.circle
  (ket(0) + e^(2 i pi 0. j_(n)) ket(1)) $

This is exactly the same expression as the QFT tensor product expression,
bar the term ordering. However, the problem is fixed by the swap gates
at the end of the circuit, that swap the value of each $l$-th qubit with
the value of the $(n - l + 1)$-th qubit, giving:

$ frac(1, sqrt(2^(n)))
  (ket(0) + e^(2 i pi 0. j_(n)) ket(1)) times.circle
  (ket(0) + e^(2 i pi 0.j_(n - 1) j_(n)) ket(1)) times.circle
  dots times.circle
  (ket(0) + e^(2 i pi 0.j_(2) dots j_(n)) ket(1)) times.circle
  (ket(0) + e^(2 i pi 0.j_(1) j_(2) dots j_(n)) ket(1)) $

Which gives the desired outcome.

Consider how many gates are necessary to construct the circuit. The $l$-th
qubit requires $(n - l + 1)$ gates to process the input: one Hadamard gate
followed by $n - l$ $P_(eta)$ gates. If the number of qubits is $n$, then
$n + (n - 1) + dots + 1 = n(n + 1) slash 2$ gates are necessary. To these
gates one has to add the swap gates at the end; since each swap operates on
two qubits, $floor.l n slash 2 floor.r$ swaps are necessary. Each swap gate
can be decomposed into $3$ elementary gates and each $P_(eta)$ gate can be
decomposed into $5$ elementary gates. Therefore, the overall number of gates
required is $O(n^(2))$.

Despite being a fast algorithm #footnote[the *Fast Fourier Transform*
(*FFT*), the most known algorithm for computing the Discrete Fourier
Transform, requires $Θ(n 2^(n))$ gates, much more than the QFT.], its
usability is limited. For example, the values computed by the circuit
cannot actually be retrieved. This is due to the fact that the amplitudes
of the qubits at the end of the circuit are in a superposition with each
other, and a measurement would destroy this superposition. Also, in most
cases, it's not possible to prepare the circuit into the state $ket(j_(1)
dots j_(n))$ in an efficient way. Nonetheless, the QFT is still very useful
and appears as a subroutine in many noteworthy quantum algorithms.

#exercise[
	Compute $"QFT"(ket(110))$ using the circuit.
]
#solution[
	#align(
		center,
		[#quantum-circuit(scale: 125%,
			lstick($ket(1)$), gate($H$), gate($P_(2)$), gate($P_(3)$), 1, 1, 1, swap(0), 1, [\ ],
			lstick($ket(1)$), 1, ctrl(-1), 1, gate($H$), gate($P_(2)$), 1, 1, 1, [\ ],
			lstick($ket(0)$), 1, 1, ctrl(-2), 1, ctrl(-1), gate($H$), swap(-2), 1
		)]
	)

	Where the $P_(2)$ and $P_(3)$ matrices are:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ P_(2) =
		   mat(1, 0; 0, e^(frac(2 pi i, 2^(2)))) =
		   mat(1, 0; 0, i) = 
		   ketbra(0, 0) + i ketbra(1, 1) $],
		[$ P_(3) =
		   mat(1, 0; 0, e^(frac(2 pi i, 2^(3)))) =
		   mat(1, 0; 0, sqrt(i)) =
		   ketbra(0, 0) + sqrt(i) ketbra(1, 1) $]
	)

	Applying the circuit:

	$ ket(Psi) &=
	  "SWAP"_(1, 3) (P_(2) H ket(1) times.circle H ket(1) times.circle H ket(0)) = \
	  &= "SWAP"_(1, 3) (P_(2) frac(1, sqrt(2)) (ket(0) - ket(1)) times.circle
	                   frac(1, sqrt(2)) (ket(0) - ket(1)) times.circle
	                   frac(1, sqrt(2)) (ket(0) + ket(1))) = \
	  &= frac(1, sqrt(8))
	     "SWAP"_(1, 3) ((P_(2) ket(0) - P_(2) ket(1)) times.circle
	                   (ket(0) - ket(1)) times.circle
	                   (ket(0) + ket(1))) = \	
	  &= frac(1, sqrt(8))
	     "SWAP"_(1, 3) ((ket(0) braket(0, 0) + i ket(1) braket(1, 0) -
	                     ket(0) braket(0, 1) - i ket(1) braket(1, 1)) times.circle
	                   (ket(0) - ket(1)) times.circle
	                   (ket(0) + ket(1))) = \
	  &= frac(1, sqrt(8))
	     "SWAP"_(1, 3) ((ket(0) - i ket(1)) times.circle
	                    (ket(0) - ket(1)) times.circle
	                    (ket(0) + ket(1))) = \
	  &= frac(1, sqrt(8)) "SWAP"_(1, 3) ((ket(00) - ket(01) - i ket(10) + i ket(11)) times.circle (ket(0) + ket(1))) = \
	  &= frac(1, sqrt(8)) "SWAP"_(1, 3) (ket(000) + ket(001) - ket(010) - ket(011) - i ket(100) - i ket(101) + i ket(110) + i ket(111)) = \
	  &= frac(1, sqrt(8)) (ket(000) - i ket(001) - ket(010) + i ket(011) + ket(100) - i ket(101) - ket(110) + i ket(111)) $
]

As for the non-quantum case, the inverse function of the Fourier transform
is an important function. In the quantum computing case, the *Inverse Quantum
Fourier Transform* has the result of the application of the QFT to a quantum
state as input and the original state as output:

$ "QFT"^(-1)(
  frac((ket(0) + e^(2 pi i 0.j_(n)) ket(1)) times.circle
       (ket(0) + e^(2 pi i 0.j_(n - 1) j_(n)) ket(1)) times.circle
       dots times.circle
       (ket(0) + e^(2 pi i 0.j_(1) j_(2) dots j_(n)) ket(1)),
       sqrt(2^(n)))) =
  ket(j_(1) j_(2) dots j_(n)) $

Due to @QFT-matrix-is-unitary, the matrix of the inverse QFT is just
the conjugate transpose of the QFT matrix. This means that the explicit
expression for $"QFT"^(-1)$ is just:

$ "QFT"^(-1)(ket(j)) = frac(1, sqrt(N)) sum_(k = 0)^(N - 1) exp(-2 pi i frac(k j, N)) ket(k) $
