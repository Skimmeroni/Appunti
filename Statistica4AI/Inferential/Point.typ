#import "../Stats4AI_definitions.typ": *

As stated, the interest of inferential statistics is to draw
conclusions on the distribution of the population from a sample.
In particular, even if the distribution of the population is known,
its parameters ($p$ for a Bernoulli, $lambda$ for an exponential,
$sigma$ for a normal, ecc...) might not. It could therefore be
interesting to approximate said parameters from the retrieved sample.

Any statistic defined with the intention of estimating a parameter
$theta$ is called an *estimator* of $theta$, and is therefore a
random variable. Any particular value of an estimator of $theta$
is called *esteem*, and is denoted as $hat(theta)$. The idea is to
approximate the value of $theta$ from the values of a sample in the
form $X_(1), X_(2), dots, X_(n)$.

For most parameters of all distributions, there's a vast amount of
estimators, each having pros and cons. In particular, there's a class
of estimators called *Maximum Likelihood Estimators* (*MLE*) that are
often employed in statistics. Estimators of this class are obtained
from maximizing a specific function called _likelihood function_.

Let $X_(1), X_(2), dots, X_(n)$ be a random sample, and let
$f(x_(1), x_(2), dots, x_(n))$ be the joint probability mass
function (or probability density function, if they are continuous)
of the sample. The function $f(x_(1), x_(2), dots, x_(n) | theta)$
can therefore be conceived as the _degree of certainty_ associated
with the events "The value of $X_(1)$ is $x_(1)$", "The value of
$X_(2)$ is $x_(2)$", $dots$, "The value of $X_(n)$ is $x_(n)$"
happening all together knowing that the value of the parameter
is indeed $theta$.

$ f(x_(1), x_(2), dots, x_(n) | theta) =
  P(X_(1) = x_(1), X_(2) = x_(2), dots, X_(n) = x_(n) | theta) $

It is therefore reasonable to assume that a good value for $theta$
is the value $hat(theta)$ that maximizes the function $f(x_(1), x_(2),
dots, x_(n) | theta)$ when the values of $X_(1), dots, X_(n)$ are
$x_(1), dots, x_(n)$. In other words, taking the derivative of
$f(x_(1), x_(2), dots, x_(n) | theta)$ with respect to $theta$
and equating it to $0$. This function is called the *likelihood
function*.

In maximizing the likelihood function, it is sometimes useful to make
use of the property that $f(x_(1), x_(2), dots, x_(n) | theta)$ and
$log(f(x_(1), x_(2), dots, x_(n) | theta))$ have the same maxima. This
means that it is possible to obtain $hat(theta)$ by maximizing this
second function, called *log-likelihood function*.

#lemma[
	Let $X_(1), X_(2), dots, X_(n)$ be a random sample of a population
	that is Bernoulli distributed. The parameter $p$ can be estimated
	with the following MLE:

	$ d(X_(1), X_(2), dots, X_(n)) = frac(1, n) sum_(i = 1)^(n) X_(i) $
] <Estimator-for-Bernoulli-distribution>
#proof[
	By definition of Bernoulli variable of parameter $p$,
	$P(X_(i) = 1) = p$ and $P(X_(i) = 0) = 1 - p$. In a more
	compact form, it can be written as:

	$ P(X_(i) = k) = p^(k) (1 - p)^(1 - k) "with" k = 0, 1 $

	Since the random variables in a random sample are independent:

	$ f(x_(1), x_(2), dots, x_(n) | p) =
	  P(X_(1) = x_(1), X_(2) = x_(2), dots, X_(n) = x_(n) | p) = \
	  p^(x_(1)) (1 - p)^(1 - x_(1)) dot
	  p^(x_(2)) (1 - p)^(1 - x_(2)) dot (dots) dot 
	  p^(x_(n)) (1 - p)^(1 - x_(n)) = 
	  p^(sum_(i = 1)^(n) x_(i)) (1 - p)^(n - sum_(i = 1)^(n) x_(i)) $

	Taking the logarithm gives:

	$ log(f(x_(1), x_(2), dots, x_(n) | p)) =
	  log(p^(sum_(i = 1)^(n) x_(i))
	  (1 - p)^(n - sum_(i = 1)^(n) x_(i))) = \
	  log(p^(sum_(i = 1)^(n) x_(i))) +
	  log((1 - p)^(n - sum_(i = 1)^(n) x_(i))) =
	  log(p) (sum_(i = 1)^(n) x_(i)) +
	  log(1 - p) (n - sum_(i = 1)^(n) x_(i)) $

	Taking the derivative with respect to $p$ and equating it to $0$:
	
	$ frac(d, d p) (log(p) (sum_(i = 1)^(n) x_(i)) +
	  log(1 - p) (n - sum_(i = 1)^(n) x_(i))) = 0 => 
	  frac(d, d p) (log(p) (sum_(i = 1)^(n) x_(i))) + \
	  frac(d, d p) (log(1 - p) (n - sum_(i = 1)^(n) x_(i))) = 0 => 
	  (sum_(i = 1)^(n) x_(i)) frac(d, d p) (log(p)) + 
	  (n - sum_(i = 1)^(n) x_(i)) frac(d, d p) (log(1 - p)) = 0 => \
	  (sum_(i = 1)^(n) x_(i)) frac(1, p) -
	  (n - sum_(i = 1)^(n) x_(i)) frac(1, 1 - p) = 0 $

	Denoting with $hat(p)$ the value for the specific realization of
	$p$ when $X_(1) = x_(1) and X_(2) = x_(2) and dots and X_(n) =
	x_(n)$ gives:

	$ (sum_(i = 1)^(n) x_(i)) frac(1, hat(p)) - frac(n, 1 - hat(p)) +
	  (sum_(i = 1)^(n) x_(i)) frac(1, 1 - hat(p)) = 0 =>
	  (sum_(i = 1)^(n) x_(i)) (frac(1, hat(p)) + frac(1, 1 - hat(p))) -
	  frac(n, 1 - hat(p)) = 0 => \
	  (sum_(i = 1)^(n) x_(i)) (frac(1, hat(p)(1 - hat(p)))) -
	  frac(n, 1 - hat(p)) = 0 => (sum_(i = 1)^(n) x_(i)) (frac(1, hat(p))) -
	  n = 0 => hat(p) = frac(1, n) sum_(i = 1)^(n) x_(i) $
]

#lemma[
	Let $X_(1), X_(2), dots, X_(n)$ be a random sample of a population
	that is Poisson distributed. The parameter $lambda$ can be estimated
	with the following MLE:

	$ d(X_(1), X_(2), dots, X_(n)) = frac(1, n) sum_(i = 1)^(n) X_(i) $
] <Estimator-for-Poisson-distribution>
#proof[
	By definition of Bernoulli variable of parameter $lambda$,
	$P(X_(i) = x_(i)) = lambda^(x_(i)) e^(-lambda) slash x_(i) !$.
	Being all variables independent:

	$ f(x_(1), x_(2), dots, x_(n) | lambda) =
	  P(X_(1) = x_(1), X_(2) = x_(2), dots, X_(n) = x_(n) | lambda) = \
	  frac(lambda^(x_(1)) e^(-lambda), x_(1) !) dot 
	  frac(lambda^(x_(2)) e^(-lambda), x_(2) !) dot dots dot
	  frac(lambda^(x_(n)) e^(-lambda), x_(n) !) = e^(-n lambda)
	  frac(lambda^(sum_(i = 1)^(n) x_(i)), product_(i = 1)^(n) x_(i) !)
	  $

	Taking the logarithm gives:

	$ log(f(x_(1), x_(2), dots, x_(n) | lambda)) =
	  log(e^(-n lambda) frac(lambda^(sum_(i = 1)^(n) x_(i)),
	  product_(i = 1)^(n) x_(i) !)) = log(e^(-n lambda)) +
	  log(frac(lambda^(sum_(i = 1)^(n) x_(i)),
	  product_(i = 1)^(n) x_(i) !)) = \
	  log(e^(-n lambda)) + log(lambda^(sum_(i = 1)^(n) x_(i))) -
	  log(product_(i = 1)^(n) x_(i) !) =
	  (-n lambda) log(e) + (sum_(i = 1)^(n) x_(i)) log(lambda) -
	  log(product_(i = 1)^(n) x_(i) !) = \
	  -n lambda + log(lambda) sum_(i = 1)^(n) x_(i) -
	  sum_(i = 1)^(n) log(x_(i) !) $

	Taking the derivative with respect to $lambda$ and equating
	it to $0$:

	$ frac(d, d lambda) (-n lambda + log(lambda) sum_(i = 1)^(n) x_(i) -
	  sum_(i = 1)^(n) log(x_(i) !)) = 0 =>
	  frac(d, d lambda) (-n lambda) +
	  frac(d, d lambda) (log(lambda) sum_(i = 1)^(n) x_(i)) - \
	  frac(d, d lambda) (sum_(i = 1)^(n) log(x_(i) !)) = 0 => 
	  -n frac(d, d lambda) (lambda) + (sum_(i = 1)^(n) x_(i))
	  frac(d, d lambda) (log(lambda)) - 0 = 0 =>
	  -n + (sum_(i = 1)^(n) x_(i)) frac(1, lambda) = 0 $

	Denoting with $hat(lambda)$ the value for the specific
	realization of $lambda$ when $X_(1) = x_(1) and X_(2) =
	x_(2) and dots and X_(n) = x_(n)$ gives:

	$ -n + (sum_(i = 1)^(n) x_(i)) frac(1, hat(lambda)) = 0 =>
	  -n hat(lambda) + sum_(i = 1)^(n) x_(i) = 0 => 
	  sum_(i = 1)^(n) x_(i) = n hat(lambda) => 
	  hat(lambda) = frac(1, n) sum_(i = 1)^(n) x_(i) $
]

#lemma[
	Let $X_(1), X_(2), dots, X_(n)$ be a random sample of a population
	that is normally distributed. The parameters $mu$ and $sigma$
	can be estimated with the following MLE:

	$ d(X_(1), X_(2), dots, X_(n)) = {overline(X),
	  S sqrt(frac(n - 1, n))} $
] <Estimators-for-normal-distribution>
#proof[
	By definition of Normal variable of parameters $mu$ and $sigma$:

	$ P(X_(i) = x_(i)) = frac(1, sqrt(2 pi) sigma)
	  exp(-frac((x_(i) - mu)^(2), 2 sigma^(2))) $

	Being all variables independent:

	$ f(x_(1), x_(2), dots, x_(n) | mu, sigma) =
	  P(X_(1) = x_(1), X_(2) = x_(2), dots, X_(n) = x_(n) | mu, sigma)
	  = product_(i = 1)^(n) frac(1, sqrt(2 pi) sigma)
	  exp(-frac((x_(i) - mu)^(2), 2 sigma^(2))) = \
	  (frac(1, sqrt(2 pi) sigma))^(n) product_(i = 1)^(n)
	  exp(-frac((x_(i) - mu)^(2), 2 sigma^(2))) =
	  (frac(1, sqrt(2 pi) sigma))^(n) 
	  exp(-frac(1, 2 sigma^(2)) sum_(i = 1)^(n) (x_(i) - mu)^(2)) $

	Taking the logarithm gives:

	$ log(f(x_(1), x_(2), dots, x_(n) | mu, sigma)) =
	  log((frac(1, sqrt(2 pi) sigma))^(n) 
	  exp(-frac(1, 2 sigma^(2)) sum_(i = 1)^(n) (x_(i) - mu)^(2))) =
	  log((frac(1, sqrt(2 pi) sigma))^(n)) + \
	  log(exp(-frac(1, 2 sigma^(2)) sum_(i = 1)^(n) (x_(i) - mu)^(2)))
	  = n log(frac(1, sqrt(2 pi) sigma)) + 
	  (-frac(1, 2 sigma^(2)) sum_(i = 1)^(n) (x_(i) - mu)^(2)) log(e)
	  = \ -n log(sqrt(2 pi) sigma)
	  -frac(1, 2 sigma^(2)) sum_(i = 1)^(n) (x_(i) - mu)^(2) =
	  -frac(n, 2) log(2 pi) -n log(sigma)
	  -frac(1, 2 sigma^(2)) sum_(i = 1)^(n) (x_(i) - mu)^(2) $

	Taking the partial derivative with respect to $mu$ and equating it
	to $0$ gives:

	$ frac(d, d mu) (-frac(n, 2) log(2 pi) -n log(sigma)
	  -frac(1, 2 sigma^(2)) sum_(i = 1)^(n) (x_(i) - mu)^(2)) = 0 =>
	  frac(d, d mu) (-frac(n, 2) log(2 pi)) + frac(d, d mu)
	  (-n log(sigma)) + \ frac(d, d mu) (-frac(1, 2 sigma^(2))
	  sum_(i = 1)^(n) (x_(i) - mu)^(2)) = 0 => 0 + 0
	  cancel(-frac(1, 2 sigma^(2))) frac(d, d mu) (sum_(i = 1)^(n)
	  (x_(i) - mu)^(2)) = 0 => sum_(i = 1)^(n) frac(d, d mu)
	  (x_(i) - mu)^(2) = 0 => \ sum_(i = 1)^(n) 2(x_(i) - mu)
	  frac(d, d mu) (x_(i) - mu) = 0 => sum_(i = 1)^(n) -2(x_(i) - mu)
	  = 0 => sum_(i = 1)^(n) (x_(i) - mu) = 0 $

	Denoting with $hat(mu)$ the value for the specific realization of
	$mu$ when $X_(1) = x_(1) and X_(2) = x_(2) and dots and X_(n) =
	x_(n)$ gives:

	$ sum_(i = 1)^(n) (x_(i) - hat(mu)) = 0 => (x_(1) - hat(mu)) +
	  + dots + (x_(n) - hat(mu)) = 0 => -n hat(mu) + sum_(i = 1)^(n)
	  x_(i) = 0 => hat(mu) = frac(1, n) sum_(i = 1)^(n) x_(i) =
	  overline(x) $

	Taking the partial derivative with respect to $sigma$ and equating
	it to $0$ gives:

	$ frac(d, d sigma) (-frac(n, 2) log(2 pi) -n log(sigma)
	  -frac(1, 2 sigma^(2)) sum_(i = 1)^(n) (x_(i) - mu)^(2)) = 0 =>
	  frac(d, d sigma) (-frac(n, 2) log(2 pi)) + frac(d, d sigma)
	  (-n log(sigma)) + \ frac(d, d sigma) (-frac(1, 2 sigma^(2))
	  sum_(i = 1)^(n) (x_(i) - mu)^(2)) = 0 => 0 -n frac(d, d sigma)
	  (log(sigma)) - (sum_(i = 1)^(n) (x_(i) - mu)^(2))
	  frac(d, d sigma) (frac(1, 2 sigma^(2))) = 0 => \ -frac(n, sigma)
	  + frac(1, sigma^(3)) sum_(i = 1)^(n) (x_(i) - mu)^(2) = 0 $

	Denoting with $hat(sigma)$ the value for the specific realization
	of $sigma$ when $X_(1) = x_(1) and X_(2) = x_(2) and dots and X_(n)
	= x_(n)$ gives:

	$ -frac(n, hat(sigma)) + frac(1, hat(sigma)^(3)) sum_(i = 1)^(n)
	  (x_(i) - hat(mu))^(2) = 0 => n hat(sigma)^(2) =
	  sum_(i = 1)^(n) (x_(i) - overline(x))^(2) => hat(sigma) = 
	  sqrt(frac(1, n) sum_(i = 1)^(n) (x_(i) - overline(x))^(2)) => \
	  hat(sigma) = sqrt(frac(1, n)) s sqrt(n - 1) =>
	  hat(sigma) = s sqrt(frac(n - 1, n)) $
]

When choosing an estimator for a parameter $theta$, it is possible to
inspect the candidates and "rank" them with respect to some properties
that an estimator is expected to have.

Given a generic parameter $theta$, let $hat(theta)$ be one of its
estimators, retrieved from the values of a random sample $X_(1), X_(2),
dots, X_(n)$. One property that is favorable for $hat(theta)$ to have
is *correctness*; an estimator is said to be correct if its expected
value is the parameter itself. In other words, an estimator is correct
if its distribution is "centered" on the true value of the parameter
that it estimates:

$ E[hat(theta)] = theta $

Another favorable property is *consistency*. An estimator is said to be
consistent if, the greater the size of the sample, the smaller is the
difference between the estimation and the real value:

$ lim_(n -> +infinity) P(abs(hat(theta) - theta) lt.eq epsilon) = 1 
  "for any" epsilon > 0 $

#theorem[
	Let $X_(1), X_(2), dots, X_(n)$ be a random sample extracted from
	a population, and let $hat(theta)$ be a correct estimator for an
	unknown parameter $theta$ of said population. If the following holds:

	$ lim_(n -> +infinity) V(hat(theta)) = 0 $

	then $hat(theta)$ is also consistent.
] <Correct-estimator-low-variance-is-consistent>
// #proof[
// Not a chanche
// ]

#lemma[
	Let $X_(1), X_(2), dots, X_(n)$ be a random sample extracted from
	a normally distributed population. The estimators $hat(mu)$ and
	$hat(sigma)$, that estimate $mu$ and $sigma$ respectively, are both
	correct and consistent.
]
#proof[
	From @Estimators-for-normal-distribution, recall that:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ hat(mu) = overline(X) $],
		[$ hat(sigma)^(2) = S^(2) frac(n - 1, n) $]
	)

	As stated in @Expected-value-and-variance-of-sample-mean,
	$E(overline(X)) = mu$. Since $overline(X) = hat(mu)$, by
	transitive property $E(hat(mu)) = mu$, which means that 
	$hat(mu)$ is correct. Applying
	@Correct-estimator-low-variance-is-consistent gives:

	$ lim_(n -> +infinity) V(hat(mu)) =
	  lim_(n -> +infinity) V(overline(X)) =
	  lim_(n -> +infinity) frac(sigma^(2), n) =
	  frac(sigma^(2), +infinity) = 0 $

	Which means that $hat(mu)$ is also consistent.

	// Add a section concerning $sigma^(2)$
]
