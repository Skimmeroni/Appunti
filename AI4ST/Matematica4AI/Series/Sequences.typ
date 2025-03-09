#import "../Math4AI_definitions.typ": *

A *sequence* is any function whose domain is $NN$ and whose codomain is $RR$.
A sequence is denoted as ${x_(1), x_(2), dots, x_(n)}$ or ${x_(n)}_(n in NN)$.
In general, the "$n in NN$" pedix is omitted. Note that, technically, ${x_(1),
x_(2), dots, x_(n)}$ denotes the image of the sequence, and not the function
itself, but it is customary to denote sequences as such.

#exercise[
	Provide some examples of sequences.
] <Examples-of-sequences>
#solution[
	#grid(
	columns: (0.25fr, 0.35fr, 0.4fr),
		[$ {1, 2, 3, dots, n} = {n} $],
		[$ {-1, 1, -1, dots, (-1)^(n)} = {(-1)^(n)} $],
		[$ {1, frac(1, 2), frac(1, 4), dots, (frac(1, 2))^(n)} =
		   {(frac(1, 2))^(n)} $]
	)
]

A sequence ${x_(n)}_(n in NN)$ is said to be:

- *Increasing* if, for any $n < m$ with $n,m in NN$, $x_(n) < x_(m)$;
- *Decreasing* if, for any $n < m$ with $n,m in NN$, $x_(n) > x_(m)$.
- *Non decreasing* if, for any $n < m$ with $n,m in NN$, $x_(n) lt.eq x_(m)$;
- *Non increasing* if, for any $n < m$ with $n,m in NN$, $x_(n) gt.eq x_(m)$;

A sequence that possesses one of the aforementioned properties is said to be
*monotone*.

#exercise[
	Do the sequences in @Examples-of-sequences possess any of those
	properties?
]
#solution[
	${n}_(n in NN)$ is increasing, ${(frac(1, 2))^(n)}_(n in NN)$ is
	decreasing, ${(-1)^(n)}_(n in NN)$ is not monotone.
]

A sequence ${x_(n)}_(n in NN)$ is said to have a *limit* $L in RR$ if, given
any number $epsilon > 0$, exists $N in NN$ dependent on $epsilon$, such that
for any $n > N$:

$ |x_(n) - L| < epsilon $

In that case, ${x_(n)}_(n in NN)$ is said to *converge* to $L$, or simply
to be *convergent*. To denote that ${x_(n)}_(n in NN)$ has limit $L$ the
following notation is used:

$ lim_(n -> +infinity) x_(n) = L $

#exercise[
	Prove that $display(lim_(x -> +infinity) frac(1, n) = 0)$.
] <One-over-n-goes-to-zero>
#solution[
	Let $epsilon$ be any strictly positive number, and let $N = [frac(1,
	epsilon)] + 1$. By the definition of $N$, any $n > N$ cannot lie in
	the interval $(0, 1]$, because it has to be at least greater than $1$.
	Therefore, any $frac(1, n)$ must lie in $(0, 1]$. Since $epsilon$ is
	strictly positive, it must be true that:

	$ 0 < frac(1, n) < epsilon $

	If both $frac(1, n)$ and $epsilon$ are strictly positive, they must
	be greater than any negative number, and in particular greater than
	$-epsilon$. Therefore, the $0$ in the inequality can be substituted
	with $-epsilon$:

	$ 0 < frac(1, n) < epsilon => -epsilon < frac(1, n) < epsilon =>
	  abs(frac(1, n)) < epsilon => abs(frac(1, n) - 0) < epsilon $

	Which is the definition of convergence.
]

Note that the existence of a $L in RR$ such that $lim_(n -> +infinity) x_(n) =
L$ is not guaranteed. That is to say, not all sequences are convergent.

#theorem("Uniqueness of the limit")[
	Let ${x_(n)}_(n in NN)$ be a sequence such that $lim_(n -> +infinity)
	x_(n) = L$ with $L in RR$. If such an $L$ exists, it is unique.
] <Uniquenes-of-the-limit>
// #proof[
// To be added
// ]

#theorem[
	If a sequence ${x_(n)}$ is convergent then it is limited, that is to say
	it exists an interval $[a, b]$ such that ${x_(n)} subset [a, b]$.
] <Convergent-sequences-are-limited>
// #proof[
// To be added
// ]

#theorem[
	Let ${x_(n)}$ and ${y_(n)}$ be two convergent sequences, converging to $x$
	and to $y$ respectively. The following results hold:

	- ${x_(n) + y_(n)}$ converges to $x + y$;
	- Given $alpha in RR$, ${alpha x_(n)}$ converges to $alpha x$;
	- ${x_(n) y_(n)}$ converges to $x y$;
	- ${|x_(n)|}$ converges to $|x|$;
	- If $y != 0$ and, for any $n in NN$, $y_(n) != 0$, the sequence
	  ${frac(x_(n), y_(n))}$ converges to $frac(x_(n), y_(n))$;
	- If $x_(n) < y_(n)$ for any $n in NN$, then $x lt.eq y$;
	- If $x_(n) = k$ for any $n in NN$, then $lim_(n -> +infinity)
	  x_(n) = k$, $k in RR$;
] <Properties-of-sequences>
// #proof[
// To be added
// ]

A sequence ${x_(n)}_(n in NN)$ is said to have *limit to* $+infinity$, denoted
as:

$ lim_(n -> +infinity) x_(n) = +infinity $

If, for any $M > 0$, exists a $N in NN$ dependent on $M$ such that, for any
$n > N$, it is true that $x_(n) > M$.

A sequence ${x_(n)}_(n in NN)$ is said to have *limit to* $-infinity$, denoted
as:

$ lim_(n -> +infinity) x_(n) = -infinity $

If, for any $M > 0$, exists a $N in NN$ dependent on $M$ such that, for any
$n > N$, it is true that $x_(n) < -M$.

In general, a sequence having limit to $plus.minus infinity$ is just called
*divergent* (to $+infinity$ or to $-infinity$).

#exercise[
	Prove that $display(lim_(x -> +infinity) -2^(n) = -infinity)$.
]
#solution[
	Let $M$ be any strictly positive number, and let $N = [log_(2)(M)] + 1$.
	For any $n > N$, it must be true that $2^(n) > M$, which in turn is
	equivalent to $-2^(n) < -M$. Therefore, $display(lim_(x -> +infinity)
	-2^(n) = -infinity)$
]

If a sequence ${x_(n)}_(n in NN)$ is neither convergent or divergent, is said
to be *indeterminate*. More formally, a sequence is indeterminate if, for any
$M > 0$, exists an $N in NN$ dependent on $M$ such that, for any $n > N$, it
is true that $|x_(n)| > M$. An indeterminate sequence is denoted as:

$ lim_(n -> +infinity) x_(n) = infinity $

Notice the lack of sign on the symbol $infinity$, meaning that it's neither
positive nor negative infinity

Note that the statements "a sequence is limited" and "a sequence has a limit"
are not equivalent. @Convergent-sequences-are-limited states that a sequence
that has a limit (that is convergent) is limited, but a sequence that is
limited might not have a limit.

#theorem[
	A sequence that is both limited and monotone has a limit.
] <Limited-monotone-sequences-have-limit>
// #proof[
// To be added
// ]

Note that the opposite of @Limited-monotone-sequences-have-limit is not true.
That is, if a sequence has a limit, it might not be monotone.

#theorem("Squeeze theorem (for sequences)")[
	Let ${x_(n)}$, ${y_(n)}$ and ${z_(n)}$ be three sequences such
	that, for any $n in NN$, $x_(n) lt.eq y_(n) lt.eq z_(n)$. Suppose
	that:

	$ lim_(n -> +infinity) x_(n) = lim_(n -> +infinity) z_(n) = L $

	Then, $display(lim_(n -> +infinity) y_(n) = L)$.
] <Squeeze-theorem-for-sequences>
// #proof[
// To be added
// ]

#theorem[
	Let ${x_(n)}$ and ${y_(n)}$ be two sequences such that, for any $n in NN$,
	$x_(n) lt.eq y_(n)$. Suppose that:

	$ lim_(n -> +infinity) y_(n) = +infinity $

	Then, $display(lim_(n -> +infinity) x_(n) = +infinity)$.
] <Squeeze-theorem-for-divergent-sequences>
// #proof[
// To be added
// ]

#exercise[
	Prove that $display(lim_(n -> +infinity) {(frac(1, 2))^(n)} = 0)$.
]
#solution[
	Consider the sequences ${0^(n)}$ and ${frac(1, n)}$. Both sequences
	are convergent:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ lim_(n -> +infinity) 0^(n) = 0 $],
		[$ lim_(n -> +infinity) frac(1, n) = 0 $]
	)

	The result on the left is trivial, the result on the right was already
	proven in @One-over-n-goes-to-zero.

	It is clear that, for any $n in NN$, $0^(n) lt.eq (frac(1, 2))^(n)$.
	It is also possible to prove by induction that, for any $n in NN$,
	$(frac(1, 2))^(n) lt.eq frac(1, n)$:

	- With $n = 1$, $frac(1, 2)^(1) = frac(1, 2)$ and $frac(1, 1) = 1$, and
	  clearly $frac(1, 2) lt.eq 1$;
	- Assuming $(frac(1, 2))^(n) lt.eq frac(1, n)$ to be true:

	  $ (frac(1, 2))^(n + 1) lt.eq frac(1, n + 1) =>
	    (frac(1, 2)) (frac(1, 2))^(n) lt.eq frac(1, n) - frac(1, n(n + 1)) =>
	    (frac(1, 2))^(n) lt.eq frac(2, n) - frac(2, n(n + 1)) => \
	    frac(1, n) lt.eq frac(2, n) - frac(2, n(n + 1)) =>
	    - frac(1, n) lt.eq - frac(2, n(n + 1)) =>
	    frac(1, n) gt.eq frac(2, n(n + 1)) =>
	    1 gt.eq frac(2, n + 1) => n + 1 gt.eq 2 => n gt.eq 1 $

	It is then possible to apply @Squeeze-theorem-for-sequences to prove
	that $display(lim_(n -> +infinity) {(frac(1, 2))^(n)} = 0)$.
]

Let ${x_(n)}_(n in NN)$ be an increasing sequence of natural numbers.
${k_(n)}_(n in NN)$. The sequence ${x_(k_(n))}_(n in NN)$ is then
said to be a *subsequence* of the sequence ${x_(n)}_(n in NN)$.

#theorem[
	Let ${x_(n)}_(n in NN)$ be a sequence. If ${x_(n)}_(n in NN)$
	converges to $L$, then any subsequence of ${x_(n)}_(n in NN)$
	also converges to $L$.
] <Convergent-sequences-have-convergent-subsequences>
// #proof[
// To be added
// ]

#theorem[
	Every limited sequence has (at least) a converging subsequence.
]
// #proof[
// To be added
// ]
