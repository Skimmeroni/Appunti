#import "../Stats4AI_definitions.typ": *

A point estimate is not indicative of how reliable said estimation is. 
Also, since the value of a point estimate depends on the values of the 
sample drawn, there's no indication on why one value should be preferred 
over another, and no estimation will ever be exactly equal to the "true" 
value.

An alternative to reporting a single value for the parameter to be 
estimated is to report an _interval_ of plausible values, an *interval 
estimate* or *confidence interval* (*CI* for short) endowed with a 
measure of its reliability.

To illustrate how a confidence interval is constructed, it is useful to 
start from a very simple (and unrealistic) situation and then introduce 
more and more complications.

The simplest scenario is the one where the parameter of interest is 
the population mean (the "true" mean), the population is known to be 
normally distributed and the value of the population standard deviation 
(the "true" standard deviation) is known.

Let $X_(1), X_(2), dots, X_(n)$ be the random variables denoting the 
observations and $x_(1), x_(2), dots, x_(n)$ be their realizations,
resulting from a random sample having normal distribution with known
mean $mu$ and unknown standard deviation $sigma$. Then, irrespective 
of the sample size $n$, the sample mean $overline(X)$ is normally 
distributed with expected value $mu$ and standard deviation
$frac(sigma, sqrt(n))$.

// Ok, but why? The sum of normal random variables is itself a normal
// random variable, but...

Standardizing the sample mean allows to express it in terms of the 
population mean and standard deviation:

$ Z = frac(overline(X) - mu, frac(sigma, sqrt(n))) = 
  frac(sqrt(n)(overline(X) - mu), sigma) $
  
Suppose one requires the value of $Z$ to possess a probability of $95 
percent$. The value for the standard normal random variable with said
percentage is $1.96$. Therefore:

$ P(-1.96 < frac(sqrt(n)(overline(X) - mu), sigma) < 1.96) = 0.95 =>
  P(-1.96 (frac(sigma, sqrt(n))) < overline(X) - mu < 
  1.96 (frac(sigma, sqrt(n)))) = 0.95 => \ P(-1.96 (frac(sigma, sqrt(n))) 
  - overline(X) < - mu < 1.96 (frac(sigma, sqrt(n))) - overline(X)) = 0.95 => 
  P(overline(X) - 1.96 (frac(sigma, sqrt(n))) < mu < 
  overline(X) + 1.96 (frac(sigma, sqrt(n)))) = 0.95 $
  
// Ok, but why the -1.96?

The interval $(overline(X) - 1.96 (frac(sigma, sqrt(n))), overline(X) + 
1.96 (frac(sigma, sqrt(n))))$ is called a *confidence interval at* $95 
percent$. The value of $95 percent$ is called the *level of confidence*,
while the value $2 dot 1.96 (frac(sigma, sqrt(n)))$ is the *width* of the 
interval. Such interval is a random interval because its endpoints depend 
on $overline(X)$, which is a random variable.

After drawing the sample and collecting the realizations $X_(1) = x_(1), X_(2) 
= x_(2), dots, X_(n) = x_(n)$, it is possible to compute the (realization of 
the) sample mean $overline(x)$, obtaining an _actual_ interval.

#exercise[
	Industrial engineers study ergonomics to design keyboards that are 
	comfortable to use and make people using them as productive as possible.
	Assume that a sample of $n = 31$ trained typists was selected and of 
	them gave their evaluation of the best keyboard height. The sample 
	average resulted in $overline(x) = 80$ cm while the population mean,
	denoted by $mu$, is unknown. Assuming that the population standard 
	deviation is known and equal to $2$ cm, derive a confidence interval
	at $95 percent$.
]
#solution[
	$ (80 - 1.96 (frac(2, sqrt(31))), 80 + 1.96 (frac(2, sqrt(31)))) approx
	  (80 - 1.96 dot 0.36, 80 + 1.96 dot 0.36) approx (79.3, 80.7) $
]

It would be wrong to interpret a $95 percent$ confidence for $mu$ as the 
probability that $mu$ lies in $(overline(X) - 1.96 (frac(sigma, sqrt(n))), 
overline(X) + 1.96 (frac(sigma, sqrt(n))))$. The correct interpretation
for a $95 percent$ confidence is that, by obtaining an interval from a 
drawn sample, there's a $95 percent$ chanche that said interval will 
contain $mu$ somewhere.

// Ok, but why?

The choice of $95 percent$ is, of course, arbitrary. In general, any
percentage can be chosen by picking a quantile $alpha$. A $100(1 - alpha)
percent$ confidence interval for the mean $mu$ of a normal population 
when the value of $sigma$ is known is given by #footnote[The notation 
for the quantile is very confusing. In some literature it is denoted as 
$z_(alpha slash 2)$ and in others is $z_(1 - alpha slash 2)$.]:

// More investigation on the notation

$ P(overline(x) - z_(1 - alpha slash 2) (frac(sigma, sqrt(n))) < mu < 
  overline(x) + z_(1 - alpha slash 2) (frac(sigma, sqrt(n)))) = 1 - alpha $
 
#exercise[
	A production process for engine control housing units underwent a 
	modification such that previously the hole diameter for bushing on
	the housing was distributed as a normal random variable with unknown
	mean and standard deviation $0.1$ mm. It is believed that the modification
	did not alter the distribution of the hole diameter and the value of the
	standard deviation, while the mean might have changed. A sample of $n = 40$
	housing units is selected and the hole diameter has been measured for each
	unit, obtaining a sample mean of $overline(x) = 5.426$ mm. Construct a
	confidence interval for the average true diameter with confidence level
	of $90 percent$.
]
#solution[
	If $90 percent$ is $1 - alpha$, then $alpha$ is $0.1$. By looking at the 
	tables it is possible to derive a value for $z_(0.95)$ of $1.645$

	$ (overline(x) - z_(1 - alpha slash 2) (frac(sigma, sqrt(n))) < mu < 
	  overline(x) + z_(1 - alpha slash 2) (frac(sigma, sqrt(n)))) = 
	  (5.426 - z_(0.95) (frac(0.1, sqrt(40))) < mu < 5.426 + 
	  z_(0.95) (frac(0.1, sqrt(40)))) = \ (5.426 - 1.645 dot 0.016 
	  < mu < 5.426 + 1.645 dot 0.016) = (5.4, 5.452) $
]

The choice of a certain confidence level induces a certain interval size: 
if the confidence level is increased, the value of the quantile is also 
increased. This means that if the probability that the interval obtained
from the sample contains the real value of the parameter is increased, the
size of the interval is also increased. In other words, a gain in reliability
entails a loss of precision, and it's not possible to be both precise and
reliable.

If one is to explicitly pick both a confidence level and an interval size, it 
is the necessary to derive the sample size. If the size of the interval is 
denoted by $w$, it is possible to derive it by rearranging the expression of
the width:

$ w = 2 z_(1 - alpha slash 2) (frac(sigma, sqrt(n))) => 
  w sqrt(n) = 2 z_(1 - alpha slash 2) sigma =>
  sqrt(n) = frac(2 z_(1 - alpha slash 2) sigma, w) =>
  n = (frac(2 z_(1 - alpha slash 2) sigma, w))^(2) $

To get a reasonable result, the value of $n$ may or may not have to be ceiled.

#exercise[
	Suppose that the response time to a particular computer program is
	distributed as a normal random variable with unknown mean and standard 
	deviation $25$ $mu$ m. When a new operating system is installed, 
	there's interest in estimating the true average response time $mu$ for
	such new environment. What sample size is needed to ensure that the
	confidence level is $95 percent$ and has width $10$ $mu$ s?.
]
#solution[
	$ n = (frac(2 z_(0.995) sigma, w))^(2) 
	  = (frac(2 dot 1.96 dot 25, 10))^(2) =
	  (1.96 dot 5)^(2) approx 97 $	
]

Consider a more general case where $X_(1), X_(2), dots, X_(n)$ are the random 
variables denoting the observations and $x_(1), x_(2), dots, x_(n)$ be their 
realizations, resulting from a random sample having unknown distribution with 
unknown mean $mu$ and unknown standard deviation $sigma$.

// Central Limit Theorem?

Even though the distribution of the $X_(i)$ variable is unknown, if the 
sample size is sufficiently large, it is possible to apply the Central 
Limit Theorem and derive that their sum has a normal distribution (no 
matter the distribution of $X_(i)$). Also, the "real" standard deviation
can still be substituted with its estimator $s$. Standardizing:

$ Z = frac(overline(X) - mu, frac(s, sqrt(n))) = 
  frac(sqrt(n)(overline(X) - mu), s) $

By picking a value of $alpha$ and deriving a quantile $z_(1 - alpha slash 2)$,
it is possible to construct a confidence interval with confidence level 
$100(1 - alpha) percent$ and the associated probability:

$ P(-z_(1 - alpha slash 2) < frac(sqrt(n)(overline(X) - mu), s) < 
  z_(1 - alpha slash 2)) = 1 - alpha => P(-z_(1 - alpha slash 2) dot s < 
  sqrt(n)(overline(X) - mu) < z_(1 - alpha slash 2) dot s) = 1 - alpha => \
  P(-z_(1 - alpha slash 2) (frac(s, sqrt(n))) < overline(X) - mu < 
  z_(1 - alpha slash 2) (frac(s, sqrt(n)))) = 1 - alpha => 
  P(-z_(1 - alpha slash 2) (frac(s, sqrt(n))) - overline(X) < 
  - mu < z_(1 - alpha slash 2) (frac(s, sqrt(n))) - overline(X)) = 1 - alpha => \
  P(overline(X) - z_(1 - alpha slash 2) (frac(s, sqrt(n))) < mu < 
  overline(X) + z_(1 - alpha slash 2) (frac(s, sqrt(n)))) = 1 - alpha $

The large sample intervals $overline(X) plus.minus z_(1 - alpha slash 2) dot 
s slash sqrt(n)$ are a special case of a general large sample confidence 
interval for a parameter $theta$. Suppose that $hat(theta)$, an estimator for
$theta$, has the three following properties:

+ It is normally distributed;
+ It's *unbiased*, meaning that $mu_(hat(theta)) = theta$;
+ $sigma_(hat(theta))$ the standard deviation of $hat(theta)$, 
  is a known value.

For example, if $theta$ is the (population) mean $mu$, the estimator
$hat(theta) = overline(X)$ possesses all three properties, since it is
normally distributed, it is unbiased and the value of $sigma_(hat(theta))$
is known to be $sigma slash sqrt(n)$. Standardizing $theta$ gives:

$ Z = frac(hat(theta) - mu_(hat(theta)), sigma_(hat(theta))) = 
  frac(hat(theta) - theta, sigma_(hat(theta))) $
  
By picking a value of $alpha$ and deriving a quantile $z_(1 - alpha slash 2)$,
it is possible to construct a confidence interval with confidence level 
$100(1 - alpha) percent$ and the associated probability:

$ P(-z_(1 - alpha slash 2) < frac(hat(theta) - theta, sigma_(hat(theta))) <
  z_(1 - alpha slash 2)) approx 1 - alpha $

#exercise[
	Let $B tilde "Binom"(n, p)$, with both parameters unknown. Derive an 
	estimator $hat(p)$ for $p$ and a confidence interval for $hat(p)$ by
	performing a random sampling.
]
#solution[
	Let $X_(1), X_(2), dots, X_(k)$ be the random variables corresponding
	to the sampling. If $k << n$, each $X_(i)$ is itself distributed as a
	binomial distribution. Recall that:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ E(X) = n p $],
		[$ "SD"(X) = sqrt(n p (1 - p)) $]
	)

	If $overline(X)$ is an estimator of $E(X)$, and $E(X) = n p$, 
	then a natural choice for an estimator for $p$ is $overline(p) 
	= overline(X) slash n$. Since $overline(X)$ is normally distributed, 
	then $overline(X) slash n$ is also normally distributed (dividing 
	by $n$ is a linear transformation). Also, $E(hat(p)) = p$ and the 
	expression for $sigma_(hat(theta))$ is known, because $sigma_(hat(theta)) =
	sqrt(p (1 - p) slash n)$. Standardizing, gives:

	$ P(-z_(1 - alpha slash 2) < frac(hat(p) - p, sqrt(p (1 - p) slash n)) < 
	  z_(1 - alpha slash 2)) approx 1 - alpha $

	From which it is possible to derive a confidence interval:

	$ -z_(1 - alpha slash 2) < frac(hat(p) - p, sqrt(p (1 - p) slash n)) < 
	  z_(1 - alpha slash 2) => -z_(1 - alpha slash 2) sqrt(frac(p (1 - p), n)) 
	  < hat(p) - p < z_(1 - alpha slash 2) sqrt(frac(p (1 - p), n)) => \
	  hat(p) - z_(1 - alpha slash 2) sqrt(frac(p (1 - p), n)) < p < 
	  hat(p) + z_(1 - alpha slash 2) sqrt(frac(p (1 - p), n)) => 
	  hat(p) plus.minus z_(1 - alpha slash 2) sqrt(frac(p (1 - p), n)) $

	// This does not resonate: why is there p instead of hat(p)?
]

As long as the population size $n$ is large, the CLT can be applied to
aid the calculations. But if the size of the sample is small, it cannot
be applied. In particular, with $n$ being small, the random variable 
$sqrt(n)(overline(X) - mu) slash s$ is more "unstable" and spread out
than a standard normal distribution.

When $overline(X)$ is the mean of a random sample of (small) size $n$
retrieved from a normal distribution with (unknown) mean $mu$ and
(unknown) standard deviation $sigma$, the random variable defined as:

$ T = frac(overline(X) - mu, s slash sqrt(n)) = 
  frac(sqrt(n) (overline(X) - mu), S) $

Is distributed as a Student $t$ distribution with $n - 1$ degrees of 
freedom. A confidence interval with confidence level $100 (1 - alpha)
percent$ can then be constructed as:

$ (overline(x) - t_(1 - alpha slash 2, t - 1) dot frac(s, sqrt(n)),
  overline(x) + t_(1 - alpha slash 2, t - 1) dot frac(s, sqrt(n))) $
