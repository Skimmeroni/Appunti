#import "../../Stats4AI_definitions.typ": *

Some specific discrete random variables have been studied extensively, mostly
because they model very well many phenomena in the real world. For this reason,
such random variables have proper names. To denote that a random variable $X$
has the same distribution as a known random variable $F$, the notation $X
tilde F$ is used.

=== Bernoulli random variable

Consider an experiment that has only two possible and mutually exclusive
outcomes, a "positive" outcome and a "negative" outcome: yes/no, true/false,
heads/tails, even/odd, up/down, ecc... A "positive" outcome is referred to
as a _success_, a "negative" outcome as a _failure_. Experiments such as
these are called *Bernoulli experiments*. A random variable that maps a
success to $1$ and a failure $0$ is called *Bernoulli random variable*.

A discrete random variable $X$ is distributed as a Bernoulli random
variable of parameter $p in [0, 1]$ (denoted as $X tilde B(p)$) if
it can only take on the values $0$ or $1$, with probabilities $p$
and $1 - p$ respectively:

$ p(x) = P(X = x) =
  cases(p & "if" x = 1, 1 - p & "if" x = 0,
	    0 & "otherwise") $

#figure(
	caption: [Probability mass function of a Bernoulli random variable,
	          with three different choices for the parameter $p$.],
	image("bernoulli_PMF.svg", width: 75%)
)

To show that the pmf of a random variable $X tilde B(p)$ is a valid pmf,
note that $D(X) = {0, 1}$. Both $P(X = 0)$ and $P(X = 1)$ are non negative,
and $P(X = 0) + P(X = 1) = p(0) + p(1) = p + 1 - p = 1$.

The cdf for $X tilde B(p)$ is obtained in a very similar way: $F(0) =
P(X lt.eq 0) = p(0) = 1 - p$ and $F(1) = (X lt.eq 1) = p(0) + p(1) =
p + 1 - p = 1$. This gives:

$ F(x) = P(X lt.eq x) =
  cases(0 & "if" x < 0,
	    1 - p & "if" 0 lt.eq x < 1,
	    1 & "if" x gt.eq 1) $

#figure(
	caption: [Cumulative distribution function of a Bernoulli random variable,
	          with three different choices for the parameter $p$.],
	image("bernoulli_CDF.svg", width: 75%)
)

#theorem[
	The expected value and variance of a random variable $X tilde B(p)$ are
	as follows:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ E(X) = p $],
		[$ V(X) = p(1 - p) $]
	)
] <Expected-value-variance-Bernoulli>
#proof[
	#grid(
		columns: (0.4fr, 0.6fr),
		[$ E(X) &= 0 dot (1 - p) + 1 dot p = \
		        &= 0 + p = \
		        &= p $],
		[$ V(X) &= (0 - p)^(2) dot (1 - p) + (1 - p)^(2) dot p = \
		        &= p^(2)(1 - p) + p(1 - p)^(2) = \
		        &= p(1 - p)(cancel(p) + 1 - cancel(p)) = \
		        &= p(1 - p) $]
	)
]

=== Binomial random variable

Consider an experiment having the following structure:

- The experiment consists of a sequence of $n$ smaller experiments,
  called *trials*;
- Each trial can result either in a success or in a failure, with
  the two being mutually exclusive;
- Each trial is independent of the others;
- The probability $p$ of a trial to result in a success is the same
  for all trials. The same holds for failures.

Experiments such as these are called *binomial experiments*. A random
variable that maps each outcome of the experiment as a whole to the
number of trials of the experiment that resulted in a success is called
a *binomial random variable*.

To construct a binomial random variable, notice how each trial of
a binomial experiment is just a Bernoulli experiment, that can be
modelled by a Bernoulli random variable. Also, recall that the
"positive" outcome for a Bernoulli experiment corresponds to a
Bernoulli random variable taking on the value $1$. This means that
the number of trials that resulted in a success is just the sum of
all the outcomes of the Bernoulli variables.

Let $Y_(1), Y_(2), dots, Y_(n)$ be $n$ independent Bernoulli random
variables, all having the same parameter $p$. Let $X$ be the random
variable defined as the sum of all said variables:

$ X = sum_(i = 1)^(n) Y_(i) = Y_(1) + Y_(2) + dots + Y_(n) $

The random variable $X$ defined as such is distributed as a
binomial random variable of parameters $p$ and $n$ (denoted
as $X tilde "Binom"(n, p)$). Since each $Y_(i)$ has support
$D(Y_(i)) = {0, 1}$, the sum of $n$ such variables can be
any integer value from $0$ to $n$. This means that $D(X) =
{0, 1, dots, n}$.

The pdf of a random variable $X tilde "Binom"(n, p)$ can be derived
using combinatorics. $X$ maps the event "a sequence of $n$ independent
Bernoulli random variables where $x$ variables took on $1$ and $n - x$
variables took on $0$" to the number $x$. However, there is more than
one sequence such as these: as a matter of fact, there are $binom(n, x)$
of them. The probability of $x$ independent Bernoulli random variables
to take on $1$ is $p^(x)$, and the probability of the remaining $n - x$
variables to take on $0$ is $p^(n - x)$. Since each sequence with the
same number of "positive" and "negative" outcomes is equally likely:

$ p(x) = P(X = x) =
  cases(display(binom(n, x)) p^(x)(1 - p)^(n - x) & "if" x in NN and x lt.eq n,
        0 & "otherwise") $

#figure(
	caption: [Probability mass function of a binomial random variable,
	          with three different choices for the parameters $p$ and $n$.],
	image("binomial_PMF.svg", width: 75%)
)

To show that the pmf of a random variable $X tilde "Binom"(p)$ is a valid
pmf, first note how all probabilities are non negative. Secondly, the fact
that the sum of all probabilities equals $1$ results from applying the
Binomial theorem:

$ sum_(x in D(X)) binom(n, x) p^(x)(1 - p)^(n - x) =
  sum_(x = 0)^(n) binom(n, x) p^(x)(1 - p)^(n - x) =
  (cancel(p) + (1 - cancel(p)))^(n) =
  1^(n) =
  1 $

This is where the Binomial random variable takes its name. As for the cdf,
it is given by applying the definition:

$ F(x) = P(X lt.eq x) = sum_(k in NN, k lt.eq x) binom(n, k) p^(k) (1 - p)^(n - k) $

#figure(
	caption: [Cumulative distribution function of a binomial random variable,
	          with three different choices for the parameters $p$ and $n$.],
	image("binomial_CDF.svg", width: 75%)
)

#theorem[
	The expected value and variance of a random variable $X tilde "Binom"(p, n)$
	are as follows:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ E(X) = n p $],
		[$ V(X) = n p(1 - p) $]
	)
] <Expected-value-variance-Binomial>
#proof[
	From the definition of expected value:

	$ E(X) =
	  sum_(x = 0)^(n) x binom(n, x) p^(x)(1 - p)^(n - x) =
	  sum_(x = 1)^(n) x binom(n, x) p^(x)(1 - p)^(n - x) $

	With $x = 0$ being excluded since it gives no contribution to the sum.
	From the properties of the binomial, one has:

	$ E(X) =
	  sum_(x = 1)^(n) x binom(n, x) p^(x)(1 - p)^(n - x) =
	  sum_(x = 1)^(n) n binom(n - 1, x - 1) p^(x)(1 - p)^(n - x) $

	Moving a factor of $n p$ out of the sum:

	$ E(X) &=
	  sum_(x = 1)^(n) n binom(n - 1, x - 1) p^(x)(1 - p)^(n - x) =
	  sum_(x = 1)^(n) n binom(n - 1, x - 1) p p^(x - 1) (1 - p)^(n - x) = \
	  & =n p sum_(x = 1)^(n) binom(n - 1, x - 1) p^(x - 1) (1 - p)^(n - x) $

	Expanding the sum and setting $n - 1 = b$ and $x - 1 = a$:

	$ E(X) &=
	  n p sum_(x = 1)^(n) binom(n - 1, x - 1) p^(x - 1) (1 - p)^(n - x) =
	  n p sum_(x = 1)^(n) binom(n - 1, x - 1) p^(x - 1) (1 - p)^(n - x + 1 - 1) = \
	  &= n p sum_(x = 1)^(n) binom(n - 1, x - 1) p^(x - 1) (1 - p)^((n - 1) - (x - 1)) = 
	  n p sum_(a = 0)^(b) binom(b, a) p^(a) (1 - p)^(b - a) $

	Applying the Binomial Theorem to the sum on the right:

	$ E(X) =
	  n p sum_(a = 0)^(b) binom(b, a) p^(a) (1 - p)^(b - a) =
	  n p (cancel(p) + (1 - cancel(p)))^(b) =
	  n p (1)^(b) =
	  n p $

	The expected value of the square of a binomial random variable can
	be obtained by following similar steps. Starting out the same:

	$ E(X^(2)) &=
	  sum_(x = 0)^(n) x^(2) binom(n, x) p^(x)(1 - p)^(n - x) =
	  sum_(x = 0)^(n) n x binom(n - 1, x - 1) p^(x)(1 - p)^(n - x) = \
	  &= n p sum_(x = 0)^(n) x binom(n - 1, x - 1) p^(x - 1) (1 - p)^(n - x) =
	  n p sum_(x = 0)^(n) x binom(n - 1, x - 1) p^(x - 1) (1 - p)^((n - 1) - (x - 1)) $

	Let $i = x - 1$ and $j = n - 1$:

	$ E(X^(2)) &=
	  n p sum_(x = 0)^(n) x binom(n - 1, x - 1) p^(x - 1) (1 - p)^((n - 1) - (x - 1)) =
	  n p sum_(i = 0)^(j) (i + 1) binom(j, i) p^(i) (1 - p)^(j - i) = \
	  &= n p sum_(i = 0)^(j) i binom(j, i) p^(i) (1 - p)^(j - i) + n p sum_(i = 0)^(j) binom(j, i) p^(i) (1 - p)^(j - i) $

	Splitting the sum into two is justified because both sums are finite.
	Applying the Binomial Theorem to the sum on the right:

	$ E(X^(2)) &=
	  n p sum_(i = 0)^(j) i binom(j, i) p^(i) (1 - p)^(j - i) + n p sum_(i = 0)^(j) binom(j, i) p^(i) (1 - p)^(j - i) = \
	  &= n p sum_(i = 0)^(j) i binom(j, i) p^(i) (1 - p)^(j - i) + n p (cancel(p) + (1 - cancel(p))) = 
	  n p + n p sum_(i = 0)^(j) i binom(j, i) p^(i) (1 - p)^(j - i) $


	Repeating the same steps:

	$ E(X^(2)) &=
	  n p + n p sum_(i = 0)^(j) i binom(j, i) p^(i) (1 - p)^(j - i) = 
	  n p + n p sum_(i = 1)^(j) j binom(j - 1, i - 1) p^(i)(1 - p)^(j - i) = \
	  &= n p + n p j p sum_(i = 1)^(j) binom(j - 1, i - 1) p^(i - 1)(1 - p)^(j - i) = \
	  &= n p + n (n - 1) p^(2) sum_(i = 1)^(j) binom(j - 1, i - 1) p^(i - 1)(1 - p)^((j - 1) - (i - 1)) = \
	  &= n p + n (n - 1) p^(2) sum_(a = 0)^(b) binom(b, a) p^(a) (1 - p)^(b - a) =
	  n p + n (n - 1) p^(2) $

	Applying @Alternative-form-for-variance:

	$ V(X) &= E(X^(2)) - (E(X))^(2) =
	  n p + n (n - 1) p^(2) - (n p)^(2) =
	  n p + cancel(n^(2) p^(2)) - n p^(2) - cancel(n^(2) p^(2)) = \
	  &= n p - n p^(2) =
	  n p (1 - p) $
]

=== Negative binomial random variable

Consider an experiment having the following structure:

- The experiment consists of a sequence of trials;
- Each trial can result either in a success or in a failure,
  with the two being mutually exclusive;
- Each trial is independent of the others;
- The probability $p$ of a trial to result in a success is the same
  for all trials. The same holds for failures.
- The trials are repeated indefinitely until $r - 1$ trials result
  in a success. That is, the experiment is stopped right before the
  $r$-th success.

A random variable $X$ that maps each outcome of the experiment as a whole
to the number of trials of the experiment that resulted in a failure
before reaching $r$ successes is called a *negative binomial random
variable*, denoted as $X tilde "NB"(r, p)$.

As the name suggests, a negative binomial random variable is related
to the binomial random variable: the idea behind its construction is
similar, but while the binomial random variable counts successes the
negative binomial counts failures. Moreover, binomial random variables
model an experiment where the number of trials is fixed, which is why
their support is a finite set. On the other hand, the number of trials
necessary to get to $r$ successes is unkown, which means that the support
of a negative binomial random variable is countably infinite.

The pdf of a negative binomial random variable $X tilde "NB"(r, p)$
is also derived using combinatorics. $X$ maps the event "a sequence
of $x + r - 1$ independent Bernoulli random variables where $x$ took
on $0$ and $r - 1$ took on $1$" to the number $x$. The number of
sequences with these characteristics is $binom(x + r - 1, r - 1)$.
Since each trial is independent of the others, the probability of
having exactly $x$ trials resulting in a failure is $(1 - p)^(x)$,
and the probability of having exactly $r$ trials to result in a
success is $p^(r)$.

$ p(x) = P(X = x) = cases(display(binom(x + r - 1, r - 1)) p^(r)(1 - p)^(x) &
  "if" x in NN, 0 & "otherwise") $

#figure(
	caption: [Probability mass function of a negative binomial random
	          variable, with three different choices for the parameters
	          $p$ and $r$.],
	image("negativebinomial_PMF.svg", width: 75%)
)

// How about the cdf?

#theorem[
	The expected value and variance of a random variable $X tilde "NB"(r, p)$
	are as follows:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ E(X) = frac(r(1 - p), p) $],
		[$ V(X) = frac(r(1 - p), p^(2)) $]
	)
] <Expected-value-variance-Negative-binomial>
// #proof[
// The only feasible way to prove it is through the linearity of the
// expected value.
// ]

=== Hypergeometric random variable

Consider an experiment that consists in extracting from a population of
$N$ individuals a random sample of size $n$ without replacement, meaning
that the same individual cannot be chosen more than once. Each individual
of the population is characterized either by a success or by a failure:
in particular, $M$ individuals are characterized by a success and $N - M$
by a failure. The random variable $X$ that maps each sample (each outcome)
to the number of individuals in the sample characterized by a success is
called a *hypergeometric random variable*, denoted as $X tilde H(n, N, M)$.

The pdf an hypergeometric random variable $X tilde H(n, N, M)$ is derived
using combinatorics. First, the number of possible samples of size $n$ that
can be drawn out of a population of size $N$ (with $n < N$) is $binom(N, n)$.
Each of these $binom(N, n)$ possible samples is one element of the sample
space.

The number of groups of size $x$ that can be formed out of $M$ individuals
is $binom(M, x)$: this is the number of samples in which $x$ individuals
are characterized by a success. Similarly, the number of groups of size
$n - x$ that can be formed out of $M - N$ individuals is $binom(M, x)$,
which is the number of samples in which $n - x$ individuals are characterized
by a failure.

$X$ maps the event "a sample of size $n$ where $x$ individuals out of $M$
are characterized by a success and $n - x$ out of $N - M$ by a failure" to
the number $x$. This means that an event mapped by $x$ must consist of $x$
out $M$ successes _and_ $n - x$ out of $N - M$ failures at the same time.
Since both events are independent, the two are merged by a multiplication.
To obtain the probability of getting both, since each event is assumed to
be equally likely, this product is to be divided by $binom(N, n)$, the size
of the sample space. The final result is:

$ p(x) = P(X = x) =
  cases(frac(display(binom(M, x) binom(N - M, n - x)), display(binom(N, n)))
  & "if" x in NN and max(0, n - N + M) lt.eq x lt.eq min(n, M),
  0 & "otherwise") $

The constraint on the right ensures that the size of the sample cannot
exceede the size of the population.

#figure(
	caption: [Probability mass function of a hypergeometric random
	          variable, with three different choices for the parameters
	          $n$, $N$ and $M$.],
	image("hypergeometric_PMF.svg", width: 75%)
)

// How about the cdf?

#exercise[
	A university IT office received $20$ service orders for issues with
	printers, out of which $8$ were laser printers and $12$ were inkjet
	printers. A sample of $5$ of these service orders were selected to
	perform a customer satisfaction survey. What is the probability that,
	out of those $5$, $2$ were inkjet printers?
]
#solution[
	It is possible to model this situation with an hypergeometric random
	variable. Since the outcome of interest is the one related to inkjet
	printers, the parameters of said variable $X$ will be $5$ for the
	sample size, $20$ for the population size and $12$ for the favorable
	population size. Therefore, $X tilde (5, 20, 12)$. Evaluating the pdf
	for $X = 2$ gives:

	$ p(2) = P(X = 2) &= frac(display(binom(12, 2) binom(20 - 12, 5 - 2)),
	  display(binom(20, 5))) = frac(display(frac(12!, 2! (12 - 2)!))
	  display(frac(8!, 3! (8 - 3)!)), display(frac(20!, 5! (20 - 5)!))) = \
	  &= frac(display(frac(12 dot 11 dot cancel(10!), 2 dot cancel(10!)))
	  display(frac(8 dot 7 dot 6 dot cancel(5!), 6 dot cancel(5!))),
	  display(frac(20 dot 19 dot 18 dot 17 dot 16 dot cancel(15!),
	  120 dot cancel(15!)))) = frac(22176, 93024) approx 0.238 $
]

#theorem[
	The expected value and variance of a random variable $X tilde H(n, N, M)$
	are as follows:

	#grid(
		columns: (0.4fr, 0.6fr),
		[$ E(X) = frac(n M, N) $],
		[$ V(X) = frac(n M, N) (frac(N - n, N - 1)) (1 - frac(M, N)) $]
	)
] <Expected-value-variance-Hypergeometric>
// #proof[
// Most likely not feasible
// ]

The hypergeometric distribution is distinguished from the binomial
distribution because the trials are not independent, since each time
an individual is "inspected" it is removed from the sample. Therefore,
the probability of choosing a certain individual over another also
depends on which is the current trial. By contrast, in the binomial
distribution each trial is independent from the others.

Also, notice how the ratio $M slash N$ represents the probability
of choosing an individual out of the entire population that is
characterized by a success. This is reminiscent of the $p$ parameter
of a binomial distribution. Indeed, substituting $M slash N$ with $p$
in the expected value and variance of an hypergeometric distribution
gives:

#grid(
	columns: (0.4fr, 0.6fr),
	[$ E(X) = n p $],
	[$ V(X) = n p (1 - p) frac(N - n, N - 1) $]
)

The expected value is identical to the one of a binomial random
variable (@Expected-value-variance-Binomial), while the variance
differs for a factor $(N - n) slash (N - 1)$. Since this factor,
called *finite population correction factor*, is always less than
$1$, the variance of an hypergeometric random variable will always
be smaller than a binomial random variable where $p = M slash N$.

=== Geometric random variable

Consider an experiment having the following structure:

- The experiment consists of a sequence of trials;
- Each trial can result either in a success or in a failure,
  with the two being mutually exclusive;
- Each trial is independent of the others;
- The probability $p$ of a trial to result in a success is the same
  for all trials. The same holds for failures.
- The trials are repeated indefinitely until a trial results in a
  success.

A random variable $X$ that maps each outcome of the experiment as a whole
to the number of trials of the experiment that resulted in a failure before
reaching a success is called a *geometric random variable*, denoted as $X
tilde G(p)$.

Deriving the pdf of such variable is straightforward: the probability of
obtaining a single success is $p$, while the probability of obtaining
$x$ failures is $(1 - p)^(x)$. Since both events are independent, the
probability of obtaining both is their product. This gives:

$ p(x) = P(X = x) =
  cases(p(1 - p)^(x) & "if" x in NN,
        0 & "otherwise") $

#figure(
	caption: [Probability mass function of a geometric random variable,
	          with three different choices for the parameter $p$.],
	image("geometric_PMF.svg", width: 75%)
)

To show that the pmf of a random variable $X tilde G(p)$ is a valid
pmf, first note how all probabilities are non negative. Secondly, the
fact that the sum of all probabilities equals $1$ results from exploiting
the properties of geometric series:

$ sum_(x in D(X)) p(1 - p)^(x) =
  sum_(x = 0)^(infinity) p(1 - p)^(x) =
  p sum_(x = 0)^(infinity) (1 - p)^(x) =
  p (frac(1, 1 - (1 - p))) =
  frac(p, cancel(1) - cancel(1) + p) =
  frac(cancel(p), cancel(p)) =
  1 $

This is where the geometric random variable takes its name. As for the cdf,
it is given by applying the definition:

$ F(x) = P(X lt.eq x) = sum_(k in NN, k lt.eq x) p(1 - p)^(k) $

#figure(
	caption: [Cumulative distribution function of a geometric random variable,
	          with three different choices for the parameter $p$.],
	image("geometric_CDF.svg", width: 75%)
)

Another fairly obvious way to derive the pdf is to observe how a geometric
random variable is a special case of a negative binomial random variable
with the $r$ parameter set to $1$.

A geometric distribution $X tilde G(p)$ has a property called *memorylessness*,
expressed mathematically as $P(X > x + y | X > y) = P(X > x)$ with $x$ and $y$
positive integers. In other words, the number of attempts necessary for an
experiment to have a specific result does not depend on the previous ones.

#theorem[
	The expected value and variance of a random variable $X tilde G(p)$ are as
	follows:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ E(X) = frac(1 - p, p) $],
		[$ V(X) = frac(1 - p, p^(2)) $]
	)
] <Expected-value-variance-Geometric>
#proof[
	By writing the expression for the expected value as:

	$ E(X) = sum_(x = 0)^(infinity) x p(1 - p)^(x) =
	         sum_(x = 1)^(infinity) x p(1 - p)^(x) =
	         p sum_(x = 1)^(infinity) x (1 - p)^(x) =
	         p (1 - p) sum_(x = 1)^(infinity) x (1 - p)^(x - 1) $

	The sum is the derivative of the geometric series:

	$ E(X) = p (1 - p) sum_(x = 1)^(infinity) x (1 - p)^(x - 1) =
	         cancel(p) (1 - p) frac(1, p^(cancel(2))) = frac(1 - p, p) $

	A similar approach is followed for computing $E(X^(2))$.
	Rearranging the expression for $E(X^(2))$:

	$ E(X^(2)) &= sum_(x = 0)^(infinity) x^(2) p(1 - p)^(x) =
	          sum_(x = 1)^(infinity) x^(2) p(1 - p)^(x) =
	          p sum_(x = 1)^(infinity) x (x + 1 - 1) (1 - p)^(x) = \
	       &= p sum_(x = 1)^(infinity) (x(x + 1) - x) (1 - p)^(x) = 
	          p sum_(x = 1)^(infinity) x(x + 1) (1 - p)^(x) - x (1 - p)^(x) = \
	       &= p sum_(x = 1)^(infinity) x(x + 1) (1 - p)^(x) - p sum_(x = 1)^(infinity) x (1 - p)^(x) = \
	       &= p (1 - p) sum_(x = 1)^(infinity) x(x + 1) (1 - p)^(x - 1) - p (1 - p) sum_(x = 1)^(infinity) x (1 - p)^(x - 1) $

	Splitting the sum into two is justified because both sums are
	convergent. Again, the sum is the derivative of the geometric
	series:

	$ E(X^(2)) &= p (1 - p) sum_(x = 1)^(infinity) x(x + 1) (1 - p)^(x - 1) - p (1 - p) sum_(x = 1)^(infinity) x (1 - p)^(x - 1) = \
	           &= cancel(p) (1 - p) frac(2, p^(cancel(3))) - frac(1 - p, p) = 
	              frac(2 (1 - p), p^(2)) - frac(p(1 - p), p^(2)) = frac((2 - p)(1 - p), p^(2)) $

	Then, applying @Alternative-form-for-variance:

	$ V(X) &= E(X^(2)) - (E(X))^(2) =
	  frac((2 - p)(1 - p), p^(2)) - (frac(1 - p, p))^(2) = \
	  &= frac(2 - 2p - p + p^(2), p^(2)) - frac(1 + p^(2) - 2p, p^(2)) = 
	  frac(2 - 3p + cancel(p^(2)) - 1 - cancel(p^(2)) + 2p, p^(2)) =
	  frac(1 - p, p^(2)) $
]

=== Poisson random variable

The previous random variables were all derived from an experiment.
On the other hand, *Poisson random variables* are derived from other
random variables. A random variable $X$ that is distributed as a
Poisson random variable with parameter $lambda$ (denoted as $X tilde
"Pois"(lambda)$) has the following pdf:

$ p(x) = P(X = x) =
  cases(display(frac(lambda^(x), x!) e^(-lambda)) & "if" x in NN,
	    0 & "otherwise") $

#figure(
	caption: [Probability mass function of a Poisson random variable,
	          with three different choices for the parameter $lambda$.],
	image("poisson_PMF.svg", width: 75%)
)

To show that the pmf of a random variable $X tilde "Pois"(lambda)$ is a
valid pmf, first note how all probabilities are non negative. Secondly,
the fact that the sum of all probabilities equals $1$ comes from the fact
that $lambda^(x) slash x!$ is the Taylor expansion for the exponential
function:

$ sum_(x in D(X)) frac(lambda^(x), x!) e^(-lambda) =
  sum_(x = 0)^(infinity) frac(lambda^(x), x!) e^(-lambda) =
  e^(-lambda) sum_(x = 0)^(infinity) frac(lambda^(x), x!) =
  e^(-lambda) e^(lambda) =
  e^(-cancel(lambda) + cancel(lambda)) =
  e^(0) = 1 $

As for the cdf, following the definition:

$ F(x) = P(X lt.eq x) = sum_(k in NN, k lt.eq x) frac(lambda^(k), k!) e^(-lambda) $

#figure(
	caption: [Cumulative distribution function of a Poisson random variable,
	          with three different choices for the parameter $lambda$.],
	image("poisson_CDF.svg", width: 75%)
)

#theorem[
	The expected value and variance of a random variable $X tilde
	"Pois"(lambda)$ are as follows:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ E(X) = lambda $],
		[$ V(X) = lambda $]
	)
] <Expected-value-variance-Poisson>
#proof[
	From the definition of expected value:

	$ E(X) =
	  sum_(x = 0)^(infinity) x frac(lambda^(x), x!) e^(-lambda) =
	  sum_(x = 1)^(infinity) x frac(lambda^(x), x!) e^(-lambda) =
	  e^(-lambda) sum_(x = 1)^(infinity) cancel(x) frac(lambda lambda^(x - 1), cancel(x) (x - 1)!) =
	  lambda e^(-lambda) sum_(x = 1)^(infinity) frac(lambda^(x - 1), (x - 1)!) $

	By performing the substitution $y = x - 1$, one obtains 
	the Taylor expansion for the exponential function:

	$ E(X) =
	  lambda e^(-lambda) sum_(x = 1)^(infinity) frac(lambda^(x - 1), (x - 1)!) =
	  lambda e^(-lambda) sum_(y = 0)^(infinity) frac(lambda^(y), y!) =
	  lambda cancel(e^(-lambda)) cancel(e^(lambda)) =
	  lambda $

	As for $E(X^(2))$:

	$ E(X^(2)) =
	  sum_(x = 0)^(infinity) x^(2) frac(lambda^(x), x!) e^(-lambda) =
	  sum_(x = 1)^(infinity) x^(2) frac(lambda^(x), x!) e^(-lambda) =
	  e^(-lambda) sum_(x = 1)^(infinity) x^(cancel(2)) frac(lambda lambda^(x - 1), cancel(x) (x - 1)!) =
	  lambda e^(-lambda) sum_(x = 1)^(infinity) x frac(lambda^(x - 1), (x - 1)!) $

	By algebraic manipulation:

	$ E(X^(2)) &=
	  lambda e^(-lambda) sum_(x = 1)^(infinity) x frac(lambda^(x - 1), (x - 1)!) =
	  lambda e^(-lambda) sum_(x = 1)^(infinity) ((x - 1) + 1) frac(lambda^(x - 1), (x - 1)!) = \
	  &= lambda e^(-lambda) sum_(x = 1)^(infinity) (x - 1) frac(lambda^(x - 1), (x - 1)!) + frac(lambda^(x - 1), (x - 1)!) = \
	  &= lambda e^(-lambda) sum_(x = 1)^(infinity) (x - 1) frac(lambda^(x - 1), (x - 1)!) + lambda e^(-lambda) sum_(x = 1)^(infinity) frac(lambda^(x - 1), (x - 1)!) $

	The same approach is followed:

	$ E(X^(2)) &=
	  lambda e^(-lambda) sum_(x = 1)^(infinity) (x - 1) frac(lambda^(x - 1), (x - 1)!) + lambda e^(-lambda) sum_(x = 1)^(infinity) frac(lambda^(x - 1), (x - 1)!) =
	  lambda e^(-lambda) sum_(y = 0)^(infinity) y frac(lambda^(y), y!) + lambda cancel(e^(-lambda)) cancel(e^(lambda)) = \
	  &= lambda + lambda e^(-lambda) sum_(y = 1)^(infinity) y frac(lambda^(y), y!) =
	  lambda + lambda e^(-lambda) sum_(y = 1)^(infinity) cancel(y) frac(lambda lambda^(y - 1), cancel(y) (y - 1)!) =
	  lambda + lambda^(2) e^(-lambda) sum_(y = 1)^(infinity) frac(lambda^(y - 1), (y - 1)!) = \
	  &= lambda + lambda^(2) e^(-lambda) sum_(z = 0)^(infinity) frac(lambda^(z), z!) = 
	  lambda + lambda^(2) cancel(e^(-lambda)) cancel(e^(lambda)) = lambda + lambda^(2) $

	Then, applying @Alternative-form-for-variance:

	$ V(X) =
	  E(X^(2)) - (E(X))^(2) =
	  lambda + lambda^(2) - (lambda)^(2) =
	  lambda + cancel(lambda^(2)) - cancel(lambda^(2)) =
	  lambda $
]

#exercise[
	Let $X$ be the number of traps occurring in a particular type of
	transistor. Suppose $X tilde "Pois"(2)$; what is the probability of
	retrieving $3$ traps? What is the probability of retrieving $3$ or
	less traps?
]
#solution[
	$ p(3) = P(X = 3) = frac(2^(3), 3!) e^(-2) = frac(8, 6) e^(-2) approx 0.18 $

	$ F(3) = P(X lt.eq 3) &= sum_(k in NN, k lt.eq 3) frac(2^(k), k!) e^(-2) =
	          frac(2^(0), 0!) e^(-2) + frac(2^(1), 1!) e^(-2) + frac(2^(2), 2!) e^(-2) + frac(2^(3), 3!) e^(-2) = \
	          &= e^(-2) (frac(1, 1) + frac(2, 1) + frac(4, 2) + frac(8, 6)) =
	          e^(-2) frac(19, 3) approx 0.86 $
]

The most intuitive way to derive the Poisson random variable is from
the binomial random variable. Consider the random variable $Y tilde
"Binom"(n, p)$: by applying the double limit $n -> infinity, p -> 0$
while keeping the product $n p$ constant, the resulting random variable
is a Poisson random variable with parameter $lambda = n p$.

Stated otherwise, this means that a random variable $X tilde "Pois"(lambda)$
is a valid model for a binomial experiment when the population size $n$
is very large and the probability $p$ of the trials is very small, with
$lambda = n p$. As a rule of thumb, a Poisson random variable matches the
predictions of a binomial random variable when $n > 50$ and $n p < 5$.

A very important application of the Poisson distribution arises in
connection with the occurrence of events of some type over time:
the number of heartbeats in a minute, the number clicks of a Geiger
counter in a second, the number of visits to a website in a day, ecc...
Consider the following assumptions:

+ There exist a parameter $alpha > 0$ such that for any short time
  interval of length $Delta t$, the probability that exactly one
  event occurs is $alpha Delta t dot o(Delta t)$, with $o(Delta t)$
  being a little-o of $Delta t$. Stated otherwise, the probability
  of a single event happening in a time slice is roughly proportional
  to the length of the slice;
+ The probability of more than one event occurring during $Delta t$ is
  $o(Delta t)$. In other words, the probability of $k$ events happening
  in the same time slice decreases very rapidly with $k$;
+ The number of events occurring during the time interval $Delta t$ is
  independent of the number that occur prior to this time interval.

Let $P_(k)(Delta t)$ be the probability of $k$ events to occur in a
given time slice $Delta t$. Its expression is well modeled by:

$ P_(k)(Delta t) = frac((alpha Delta t)^(k), k!) e^(-alpha Delta t) $

Which is the pmf of a Poisson random variable with parameter
$lambda = alpha Delta t$. The occurrence of events over time
as described is called a *Poisson process* and the parameter
$alpha$ specifies the _rate_ of said process.
