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
	- The natural numbers, listed from $1$ up to a given $n$, forms a
	  sequence: ${1, 2, 3, dots, n} = {n}$;
	- An infinitely long alternating collection of $+1$ and $-1$ forms
	  a sequence: ${-1, 1, -1, dots, (-1)^(n)} = {(-1)^(n)}$;
	- The integer powers of $1 slash 2$, listed from $1$ up to a given
	  $(1 slash 2)^(n)$, forms a sequence: 

	$ {1, frac(1, 2), frac(1, 4), dots, (frac(1, 2))^(n)} = {(frac(1, 2))^(n)} $
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
	- By definition, the successor of a natural number is greater than
	  the number itself. Hence, ${n}_(n in NN)$ is an increasing sequence;
	- By definition, the successor of the reciprocal a natural number is
	  smaller than the number itself. Hence, ${(frac(1, 2))^(n)}_(n in NN)$
	  is decreasing;
	- ${(-1)^(n)}_(n in NN)$ is not monotone. For example, choosing $n = 0$
	  and $m = 1$, one has $x_(n) = (-1)^(0) = 1$ and $x_(m) = (-1)^(1) =
	  -1$, hence $x_(n) < x_(m)$. However, choosing $n = 1$ and $m = 2$, one
	  has $x_(n) = (-1)^(1) = -1$ and $x_(m) = (-1)^(2) = 1$, hence $x_(n)
	  > x_(m)$.
]

A sequence ${x_(n)}_(n in NN)$ is said to have a *limit* $L in RR$ if, given
any number $epsilon > 0$, exists $N in NN$ dependent on $epsilon$, such that
for any $n > N$:

$ abs(x_(n) - L) < epsilon $

In that case, ${x_(n)}_(n in NN)$ is said to *converge* to $L$, or simply
to be *convergent*. To denote that ${x_(n)}_(n in NN)$ has limit $L$ the
following notation is used:

$ lim_(n -> +infinity) x_(n) = L $

Proving the convergence of a series is often far from obvious.
@Archimedean-Principle is a useful fact that can aid in such
endeavour.

#lemma("Archimedean principle")[
	For any $a, b in RR$ with $a > 0$, there exist $n in NN$ such that
	$n a > b$.
] <Archimedean-Principle>
#proof[
	Stating that $n a > b$ is the same as stating that $n > a slash b$;
	since $a$ is assumed to be positive, there are no issues in dividing
	both sides by $a$. Since $RR$ is closed under division (the ratio of
	two real numbers is always a real number), $a slash b$ is a real number.

	Let $a slash b = x$; the statement $n a > b$ is then equivalent to
	$n > x$. Suppose that the statement is false, and therefore that there
	is no $n$ such that $n > x$. Stated otherwise, this would mean that the
	real number $x$ is greater than any natural number. If that were to be
	the case, $NN$ would have a supremum, since $NN$ is a non-empty subset
	of $RR$ and $RR$ is a complete set.

	Let $S = sup(NN)$; notice that $S$ might not be equal to $x$, but
	is certainly smaller than $x$. Consider $S - 1$; since $S = sup(NN)$,
	$S - 1$ is clearly not an upper bound for $NN$, which means that
	there has to exist $m in NN$ such that $m > S - 1$. However, this
	is the same as $m + 1 > S$, which leads to a contradiction since
	$S = sup(NN)$ and $m + 1 in NN$ ($NN$ is closed under addition).

	Therefore, it must be the case that for any $x in RR$, there exist
	$n in NN$ such that $n > x$. Having chosen $x = a slash b$, it then
	exists $n in NN$ such that $n > a slash b$, which is the same as
	stating that there exists $n in NN$ such that $a n > b$.
]

#exercise[
	Prove that $display(lim_(x -> +infinity) frac(1, n) = 0)$.
] <One-over-n-goes-to-zero>
#solution[
	First, notice that:

	$ abs(frac(1, n) - 0) = abs(frac(1, n)) = frac(1, n) $

	Since $0$ is the neutral element of addition for $NN$ and $QQ^(+)$
	is closed under division. Therefore, to prove that $lim_(n -> +infinity)
	1 slash n = 0$, it is necessary to prove the existence, for any $epsilon
	> 0$, of a $N in NN$ such that $1 slash n < epsilon$ for any $n > N$.

	$1 slash n < epsilon$ is equivalent to $n > 1 slash epsilon$. This
	means that, by choosing a $N < n$ such that $N > 1 slash epsilon$,
	one has $1 slash n < 1 slash N$, since dividing a number by a bigger
	number gives a smaller result. Having chosen $N$ such that $N > 1
	slash epsilon$, one has:

	$ frac(1, n) < frac(1, N) < frac(1, frac(1, epsilon)) space "which is" space
	  frac(1, n) < frac(1, N) < epsilon $

	The fact that such $N$ exists is guaranteed by @Archimedean-Principle,
	hence the result is proven.
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
	$x_(n) lt.eq y_(n)$. If $display(lim_(n -> +infinity) y_(n) = +infinity)$,
	then $display(lim_(n -> +infinity) x_(n) = +infinity)$.
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

	Clearly, $0^(n) lt.eq (1 slash 2)^(n)$ for any $n in NN$. Moreover,
	the fact that $(1 slash 2)^(n) lt.eq 1 slash n$ for any $n in NN$
	can be proven applying the Principle of Induction:

	- With $n = 1$, $(1 slash 2)^(1) = 1 slash 2$ and $1 slash 1 = 1$, and
	  clearly $1 slash 2 lt.eq 1$;
	- Assuming $(1 slash 2)^(n) lt.eq 1 slash n$ to be true:

	  $ (frac(1, 2))^(n + 1) lt.eq frac(1, n + 1) =>&
	    (frac(1, 2)) (frac(1, 2))^(n) lt.eq frac(1, n) - frac(1, n(n + 1)) =>
	    (frac(1, 2))^(n) lt.eq frac(2, n) - frac(2, n(n + 1)) => \
	    &frac(1, n) lt.eq frac(2, n) - frac(2, n(n + 1)) =>
	    - frac(1, n) lt.eq - frac(2, n(n + 1)) => \
	    &frac(1, n) gt.eq frac(2, n(n + 1)) => 
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
