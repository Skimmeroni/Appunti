#import "../Math4AI_definitions.typ": *

Let ${a_(n)}_(n in NN)$ be a sequence. The following sum having an infinite
amount of elements is called a *series*:

$ sum_(n = i)^(infinity) a_(n) $

The $a_(n)$ elements are called the *terms* of the series. In most cases,
$i$ is equal to either $0$ or $1$.

A summation of this kind, even though having infinite terms, may still give
a finite value. In particular, a series is said to be *convergent* if the
sequence:

$ {s_(n)} = {sum_(k = i)^(n) a_(k)} = {sum_(k = i)^(1) a_(k), sum_(k = i)^(2)
  a_(k), dots, sum_(k = i)^(n) a_(k)} = {a_(i), a_(i) + a_(i + 1), dots,
  a_(i) + a_(i + 1) + dots + a_(i + n)} $

called the *partial sums sequence*, is itself convergent. If $L$ is the limit
of ${s_(n)}$, the series $sum_(n = i)^(infinity) a_(n)$ is equal to $L$, and
$L$ is called the *sum* of the series:

$ lim_(n -> +infinity) s_(n) = L = sum_(n = i)^(infinity) a_(n) $

Similarly, a series is said to be *divergent* (to $+infinity$ or to
$-infinity$) if its partial sums sequence is divergent (to $+infinity$
or to $-infinity$, respectively). Finally, a series is said to be
*indeterminate* if its partial sums sequence is indeterminate.

#exercise[
	Let $r$ and $a$ be two real numbers. Study the behaviour of the series

	$ sum_(n = 0)^(infinity) a r^(n) $

	with respect to how $r$ and $a$ vary. Any series defined as such is called
	a *geometric series of common ratio* $r$.
] <Geometric-series>
#solution[
	If either $a$ or $r$ are equal to $0$, the series is clearly equal
	to $0$. This is why such cases are not taken into account.

	The $n$-th partial sum of the series can be rewritten as:

	$ s_(n) = sum_(i = 0)^(n) a r^(n) =
	  a r^(0) + a r^(1) + a r^(2) + a r^(3) + dots + a r^(n) =
	  a (frac(1 - r^(n + 1), 1 - r)) $

	As long as $r != 1$. Therefore:

	$ sum_(n = 0)^(infinity) a r^(n) &= lim_(n -> +infinity) s_(n) =
	  lim_(n -> +infinity) a frac(1 - r^(n + 1), 1 - r) =
	  frac(a, 1 - r) - (frac(a, 1 - r)) lim_(n -> +infinity) r^(n + 1) = \
	  &= frac(a, 1 - r) (1 - lim_(n -> +infinity) r^(n + 1)) $

	There are three possibilities:

	- If $r gt.eq 1$, it is easy to see that ${r^(n + 1)}$ diverges to
	  $+infinity$, and therefore $sum_(n = 0)^(infinity) a r^(n)$
	  diverges to $+infinity$ if $a$ is positive or to $-infinity$
	  if $a$ is negative. This is particularly evident when $r = 1$:

	  $ s_(n) = sum_(i = 0)^(n) a 1^(n) = a 1^(0) + a 1^(1) + a 1^(2) +
	            dots + a 1^(n) = a + a + a + dots + a = a(n + 1) $

	- If $-1 < r < 1$, (almost) as shown in @One-over-n-goes-to-zero,
	  $display(lim_(n -> +infinity) r^(n + 1) = 0)$. Therefore,
	  $display(s_(n) = frac(a, 1 - r))$.
	- If $r lt.eq -1$, it is easy to see that ${r^(n + 1)}$ is indeterminate,
	  and therefore $sum_(n = 0)^(infinity) a r^(n)$ is in turn indeterminate.
	  This is particularly evident when $r = -1$:

	  $ s_(n) = sum_(i = 0)^(n) a (-1)^(n) = a (-1)^(0) + a (-1)^(1) +
	    a (-1)^(2) + a (-1)^(3) + dots = cancel(a) - cancel(a) + cancel(a) -
	    cancel(a) + dots $

	  This means that $s_(n)$ is either equal to $a$ if $n$ is even and equal
	  to $0$ if $n$ is odd. Therefore, the limit $display(lim_(n -> +infinity)
	  s_(n))$ does not exist.
]

#exercise[
	Prove that the series

	$ sum_(n = 1)^(infinity) frac(1, n(n + 1)) $

	converges to $1$. This series is called the *Mengoli series*.
] <Mengoli-series>
#solution[
	Notice that, for any $k in NN$ with $k > 0$:

	$ frac(1, k(k + 1)) = frac(1, k) - frac(1, k + 1) $

	It is then possible to expand the series as:

	$ sum_(n = 1)^(infinity) frac(1, n(n + 1)) &=
	  sum_(n = 1)^(infinity) frac(1, n) - frac(1, n + 1) = \
	  &= frac(1, 1) - frac(1, 1 + 1) + frac(1, 2) - frac(1, 2 + 1) +
	  frac(1, 3) - frac(1, 3 + 1) + frac(1, 4) - frac(1, 4 + 1) + dots = \
	  &= 1 - cancel(frac(1, 2)) + cancel(frac(1, 2)) - cancel(frac(1, 3)) +
	  cancel(frac(1, 3)) - cancel(frac(1, 4)) + cancel(frac(1, 4)) - frac(1, 5) + dots = \
	  &= 1 - lim_(n -> +infinity) frac(1, n + 1) =
	  1 - 0 = 1 $
]

Any series that can be rewritten as $sum_(n = 1)^(+infinity) b_(n) - b_(n + 1)$
with $b in RR$ is called a *telescopic series*. The series in @Mengoli-series
is an example of a telescopic series.

#exercise[
	Prove that the series

	$ sum_(n = 1)^(infinity) frac(1, n) $

	diverges to $+infinity$. This series is called the *harmonic series*.
] <Harmonic-series>
#solution[
	Let ${s_(n)}$ be the sequence of partial sums of the harmonic series.
	Notice that, for any $m in NN$:

	$ s_(2^(m)) = 1 + frac(1, 2) + (frac(1, 3) + frac(1, 4)) + dots +
	  (frac(1, 2^(m - 1) + 1) + dots + frac(1, 2^(m))) > 1 + frac(1, 2) +
	  frac(1, 2) + dots + frac(1, 2) = 1 + frac(m , 2) $

	Since the first brackets contain $2$ terms, the second brackets $4$
	terms, ecc... until the last brackets, that contain $2^(m - 1)$ terms.

	Therefore, $s_(2^(m)) > 1 + frac(m, 2)$, from which stems
	$display(lim_(n -> +infinity) s_(2^(m)) = +infinity)$. Also
	notice that ${s_(2^(m))}$ is a subsequence of ${s_(n)}$.

	The sequence ${s_(n)}$ is (strictly) increasing and monotone, therefore
	it is either convergent or divergent to $+infinity$. If it were convergent,
	by @Convergent-sequences-have-convergent-subsequences any of its
	subsequences would also be convergent, but since ${s_(2^(m))}$ is not,
	it cannot be convergent. Then, ${s_(n)}$ ought to diverge to $+infinity$,
	and therefore $sum_(n = 1)^(infinity) frac(1, n)$ also diverges to
	$+infinity$.
]

#theorem("Cauchy necessary condition for the convergence of series")[
	If the series $sum_(n = i)^(infinity) a_(n)$ is convergent, then
	$display(lim_(n -> +infinity) a_(n) = 0)$.
] <Cauchy-condition>
// #proof[
// To be added
// ]

Note that the opposite of @Cauchy-condition is not true, since it could be
that $display(lim_(n -> +infinity) a_(n) = 0)$ and yet the series $sum_(n =
i)^(infinity) a_(n)$ might not converge. The harmonic series, as shown in
@Harmonic-series, is one such example.

Given a series, there is no formula that can be applied to determine whether
the limit of its partial sums is a finite value, and whether it exists at all.
A different approach to determine the convergence or non convergence of a
series is to apply what is called a *convergence test*.

#theorem[
	- If the series $sum a_(n)$ and $sum b_(n)$ are convergent, the
	  series $sum (a_(n) + b_(n))$ is also convergent, and it converges
	  to $sum a_(n) + sum b_(n)$;
	- If the series $sum a_(n)$ is convergent then, given $lambda in RR$,
	  the series $sum lambda a_(n)$ is also convergent, and it converges
	  to $lambda sum a_(n)$;
	- If there exists $N in NN$ such that, for any $n gt.eq N$, $a_(n) =
	  b_(n)$, then the series $sum a_(n)$ and $sum b_(n)$ have the same
	  behaviour.
] <Convergent-series-have-linearity>
// #proof[
// To be added
// ]

#exercise[
	Study the behaviour of the series $display(sum_(n = 0)^(+infinity)
	frac(17, 6^(n)))$.
]
#solution[
	$ sum_(n = 0)^(+infinity) frac(17, 6^(n)) =
	  sum_(n = 0)^(+infinity) 17 frac(1, 6^(n)) =
	  sum_(n = 0)^(+infinity) 17 (frac(1, 6))^(n) =
	  17 sum_(n = 0)^(+infinity) (frac(1, 6))^(n) =
	  17 frac(1, 1 - frac(1, 6)) = 17 dot frac(6, 5) =
	  frac(102, 5) $

	The application of @Convergent-series-have-linearity is
	justified because $sum_(n = 0)^(+infinity) (1 slash 6)^(n)$
	is a geometric series of common ratio $1 slash 6$, that was
	proven to be convergent in @Geometric-series.
]

#lemma[
	If the terms of a series are all strictly positive, such series is either
	convergent or divergent to $+infinity$.
]
// #proof[
// To be added
// ]

#theorem("Comparison test")[
	Let $sum_(n = i)^(+infinity) a_(n)$ and $sum_(n = i)^(+infinity) b_(n)$
	be two series. Suppose that, for any $n in NN$, $0 lt.eq a_(n) lt.eq
	b_(n)$. Then:

	+ If $sum_(n = i)^(+infinity) b_(n)$ is convergent,
	  $sum_(n = i)^(+infinity) a_(n)$ is also convergent;
	+ If $sum_(n = i)^(+infinity) a_(n)$ is divergent,
	  $sum_(n = i)^(+infinity) b_(n)$ is also divergent.
] <Comparison-test>
// #proof[
// To be added
// ]

#exercise[
	Prove that the series $display(sum_(n = 1)^(+infinity) frac(1, n^(2)))$
	and $display(sum_(n = 1)^(+infinity) frac(n + 3, n^(3) + 25))$ are
	convergent.
] <Euler-series>
#solution[
	- The ratio $frac(1, n^(2))$ is always strictly positive for any
	  $n in NN$ with $n > 0$. Also, for any strictly positive $n in NN$,
	  $frac(1, n^(2)) lt.eq frac(2, n^(2) + n)$. But $frac(2, n^(2) + n) =
	  2(frac(1, n(n + 1)))$, and the series $sum_(n = 1)^(+infinity) frac(1,
	  n(n + 1))$ is known to converge, as shown in @Mengoli-series. Applying
	  @Convergent-series-have-linearity, the series $sum_(n = 1)^(+infinity)
	  frac(2, n^(2) + n)$ converges and in turn, since $0 lt.eq frac(1, n^(2))
	  lt.eq frac(2, n^(2) + n)$ for any strictly positive integer $n$, applying
	  @Comparison-test gives that $sum_(n = 1)^(+infinity) frac(1, n^(2))$
	  converges.
	- The ratio $frac(n + 3, n^(3) + 25)$ is always strictly positive for
	  any strictly positive interger $n$. It also less than $frac(4, n^(2))$
	  for any strictly positive integer $n$. In the previous point it was
	  shown that $sum_(n = 1)^(+infinity) frac(1, n^(2))$ converges, and
	  therefore applying @Convergent-series-have-linearity it can be shown
	  that $sum_(n = 1)^(+infinity) frac(4, n^(2))$ also converges. Therefore,
	  since $0 lt.eq frac(n + 3, n^(3) + 25) lt.eq frac(4, n^(2))$ for any
	  $n in NN$ strictly positive, applying @Comparison-test gives that
	  $sum_(n = 1)^(+infinity) frac(n + 3, n^(3) + 25)$ converges.
]

#theorem("Limit test")[
	Let $sum_(n = i)^(+infinity) a_(n)$ and $sum_(n = i)^(+infinity) b_(n)$
	be two series. Suppose that $a_(n) gt.eq 0$ and $b_(n) > 0$ for any $n
	in NN$, and also suppose that:

	$ lim_(n -> +infinity) frac(a_(n), b_(n)) = L $

	- If $L != 0$ and $L != +infinity$, the two series have the same
	  behaviour;
	- If $L = 0$ and $sum_(n = i)^(+infinity) b_(n)$ is convergent,
	  then $sum_(n = i)^(+infinity) a_(n)$ is also convergent;
	- If $L = +infinity$ and $sum_(n = i)^(+infinity) b_(n)$ is divergent,
	  then $sum_(n = i)^(+infinity) a_(n)$ is also divergent.
] <Limit-test>
// #proof[
// To be added
// ]

#exercise[
	Prove that the series $display(sum_(n = 1)^(+infinity)
	frac(n + 7, n^(3) - 8n))$ is convergent.
]
#solution[
	Consider the series $sum_(n = 1)^(+infinity) frac(1, n^(2))$. Since both
	this series and $sum_(n = 1)^(+infinity) frac(n + 7, n^(3) - 8n)$ have only
	positive terms, it is possible to apply @Limit-test:

	$ lim_(n -> + infinity) frac(display(frac(n + 7, n^(3) - 8n)),
	  display(frac(1, n^(2)))) = lim_(n -> + infinity)
	  frac(n^(cancel(2)) (n + 7), cancel(n)(n^(2) - 8)) =
	  lim_(n -> + infinity) frac(n^(2) + 7n, n^(2) - 8) =
	  lim_(n -> + infinity) frac(cancel(n^(2)) (1 + display(frac(7, n))),
	  cancel(n^(2)) (1 - display(frac(8, n^(2))))) = frac(1 + 0, 1 - 0) = 1 $

	Since $1 != 0$ and $1 != +infinity$ and since $sum_(n = 1)^(+infinity)
	frac(1, n^(2))$ is known to be convergent (see @Euler-series), $sum_(n =
	1)^(+infinity) frac(n + 7, n^(3) - 8n)$ is also convergent.
]

#theorem("Cauchy condensation test")[
	Let ${a_(n)}$ be a decreasing sequence of positive numbers. The series
	$sum_(n = 1)^(+infinity) a_(n)$ is convergent if and only if the series
	$sum_(n = 1)^(+infinity) 2^(n) a_(2^(n))$ is convergent.
] <Cauchy-condensation-test>
// #proof[
// To be added
// ]

A series is said to be *absolutely convergent* if the sum of the
absolute values of the summands is finite. More precisely, a series
$sum_(n = 0)^(+infinity) a_(n)$ is said to be absolutely convergent
if $sum_(n = 0)^(+infinity) |a_(n)|$ is convergent.

#theorem("Absolute convergence test")[
	If a series is absolutely convergent, it is also convergent.
] <Absolute-convergence-test>
// #proof[
// To be added
// ]

The opposite of @Absolute-convergence-test is not necessarely true, since a
series can be convergent but not absolutely convergent.

#theorem("Ratio test")[
	Let $sum_(n = 1)^(+infinity) a_(n)$ be a series. Suppose that:

	$ lim_(n -> +infinity) frac(|a_(n + 1)|, |a_(n)|) = L, space a_(n) != 0 $

	Then:

	- If $L < 1$, the series is (absolutely) convergent;
	- If $L > 1$, the series is divergent;
	- If $L = 1$, the test is inconclusive.
] <Ratio-test>
// #proof[
// To be added
// ]

#exercise[
	Prove that $display(sum_(n = 1)^(+infinity) frac(n, 5^(n)) = frac(1, 5))$
]
#solution[
	Since $display(frac(n, 5^(n)))$ is always strictly positive, @Ratio-test
	can be applied:

	$ lim_(n -> +infinity) frac(abs(display(frac(n + 1, 5^(n + 1)))),
	  abs(display(frac(n, 5^(n))))) =
	  lim_(n -> +infinity) frac(n + 1, 5 dot cancel(5^(n))) dot
	  frac(cancel(5^(n)), n) = lim_(n -> +infinity) frac(1, 5)
	  (frac(n + 1, n)) = frac(1, 5) lim_(n -> +infinity)
	  1 + frac(1, n) = frac(1, 5) (1 + 0) = frac(1, 5) $
]

#theorem("Root test")[
	Let $sum_(n = 1)^(+infinity) a_(n)$ be a series. Suppose that:

	$ lim_(n -> +infinity) root(n, |a_(n)|) = L $

	Then:

	- If $L < 1$, the series is (absolutely) convergent;
	- If $L > 1$, the series is divergent;
	- If $L = 1$, the test is inconclusive.
] <Root-test>
// #proof[
// To be added
// ]

#exercise[
	Prove that $display(sum_(n = 1)^(+infinity) (frac(1, n!))^(n) = 0)$
]
#solution[
	Applying @Root-test:

	$ lim_(n -> +infinity) root(n, abs((frac(1, n!))^(n))) =
	  lim_(n -> +infinity) ((frac(1, n!))^(cancel(n)))^(cancel(frac(1, n))) =
	  lim_(n -> +infinity) frac(1, n!) = 0 $
]

#theorem("Leibniz's test")[
	Consider a series of the form $display(sum_(n = 0)^(+infinity) (-1)^(n)
	a_(n))$. Suppose that:

	+ $a_(n)$ is always non negative;
	+ $a_(n + 1) lt.eq a_(n)$ for any $n in NN$;
	+ $display(lim_(n -> +infinity) a_(n) = 0)$.

	Then, the series is convergent.
] <Leibniz-test>
// #proof[
// To be added
// ]

#exercise[
	Prove that $display(sum_(n = 1)^(+infinity) frac((-1)^(n), n))$ is
	convergent.
]
#solution[
	Rewriting the series as $display(sum_(n = 1)^(+infinity)
	(-1)^(n) (frac(1, n)))$ and applying @Leibniz-test:

	+ $frac(1, n)$ is always non negative;
	+ $frac(1, n + 1) lt.eq frac(1, n)$ for any $n in NN$;
	+ As shown in @One-over-n-goes-to-zero, $display(lim_(n -> +infinity)
	  frac(1, n) = 0)$.

	Therefore, the series is convergent.
]

#theorem("Integral test")[
	Let $f$ be a function that is continuous, positive and decreasing
	in the interval $[N, +infinity)$. Then, the series on the left and
	the integral on the right have the same behaviour:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ sum_(n = N)^(+infinity) f(n) $],
		[$ integral_(N)^(+infinity) f(x) d x $]
	)
] <Integral-test>
// #proof[
// To be added
// ]
