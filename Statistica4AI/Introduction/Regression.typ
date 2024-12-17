#import "../Stats4AI_definitions.typ": *

The simplest deterministic mathematical relationship between two variables $x$
and $y$ is a linear relationship of the form $y = beta_(0) + beta_(1) x$. The
set of pairs $(x, y) = (x, beta_(0) + beta_(1) x)$ determines a straight line
in the cartesian plane having slope $beta_(1)$ and $y$-intercept $beta_(0)$.
The assumption that said relationship holds is called the *linear model*;
the evaluation of the attendibility of the linear model is called *regression
analysis*.

If the two variables are not deterministically related, then for a fixed
value of $x$, there is some uncertainty in the value of $y$. Suppose that
$x_(i)$ and $y_(i)$ are the $i$-th pair drawn; the value observed for
$y_(i)$ will most likely be different from $Y_(i) = beta_(0) + beta_(1) x_(i)$,
the value for $y_(i)$ retrieved from the equation. This means that each
variable $Y_(i)$ can be conceived as a random variable, whose value depends
on the value of $x_(i)$.

More generally, the variable whose value is fixed by the experimenter, in
this case $x$, is called the *independent variable*, *predictor variable*,
or *explanatory variable*. The variable whose value depends on $x$ is denoted
with $y$ or $Y$ depending on whether the value retrieved from the data or the
random variable is being referred to. This variable is called the *dependent
variable* or the *response variable*.

Suppose that $beta_(0)$ and $beta_(1)$ are known. Denote with $epsilon$ the
*random deviation*, or *random error*, that is the difference between the
observed and the predicted value for the second variable. The value of $Y$ is
given by the following *model equation*:

$ Y = beta_(0) + beta_(1) x + epsilon $

If $epsilon$ were a null term, each observed pair $(x, y)$ would precisely
fall on the line $y = beta_(0) + beta_(1) x$, call the *true regression line*
or *population regression line*. Since $epsilon$ is in general not null, the
observed pair $(x, y)$ will most likely fall either above $(epsilon > 0)$ or
below $(epsilon < 0)$ the true regression line. The smaller the $epsilon$, the
better the model.

A powerful insight into the linear dependence of two variables is given by the
*scatter plot*. This plot denotes each couple $(x_(i), y_(i))$ as points on a
cartesian plane. If the points are distributed roughly as a straight line, it
means that the value of $y_(i)$ can be predicted with reasonable prediction by
the value of $x_(i)$.

#exercise[
	Consider the following dataset:

	#table(
		columns: 20,
		stroke: none,
		..csv("example1.csv").flatten()
	)

	Draw a scatter plot and draw some conclusions.
] <Regression-example-1>
#solution[
	#figure(image("example1.svg", width: 50%))

	The distribution of the points on the plane is roughly line-shaped.
	Therefore, the predictions $Y$ will be really close to the retrieved
	values $y$.
]

In the context of inferential statistics, the pairs $(x_(1), y_(1)), dots,
(x_(n), y_(n))$ are values extracted from two populations (assuming with
random sampling), and therefore the values of $beta_(0)$ and $beta_(1)$
are not known a priori, and have instead to be estimated with respect to
the values of the sample.

Since the values of $Y$ and $epsilon$ depend on the value of $x$, each $Y_(i)$
and $epsilon_(i)$ can be conceived as random variables. To be able to estimate
the values of $beta_(0)$ and $beta_(1)$ it is reasonable to take the following
hypotheses for granted:

- Each $epsilon_(i)$ is an i.i.d normal random variable (this also means that
  each $Y_(i)$ is i.i.d, but not necessarely normal);
- $E(epsilon_(i)) = 0$ for each $i in {1, 2, dots, n}$;
- $V(epsilon_(i)) = sigma^(2)$ for each $i in {1, 2, dots, n}$.

Let $b_(0)$ and $b_(1)$ be any estimate (no matter how reasonable they
are) for $beta_(0)$ and $beta_(1)$ respectively. Denote by $b_(0) + b_(1) x$
the value of the $Y$ variable retrieved by using said estimates for the
equation. Out of all $(b_(0), b_(1))$ couples, the estimates that are of
interest are the ones that best represent the actual (unknown) values of
$beta_(0)$ and $beta_(1)$.

It is reasonable to assume that the best estimates for the two coefficients
are the ones that minimize the distance between the each $Y_(i)$ and each
$y_(i)$. Keeping in mind how the (Euclidean) distance is computed and summing
all of the $n$ distances together, gives:

$ f(b_(0), b_(1)) =
  sum_(i = 1)^(n) (y_(i) - (b_(0) + b_(1) x_(i)))^(2) =
  sum_(i = 1)^(n) (y_(i) - b_(0) - b_(1) x_(i))^(2) $

The point estimates of $beta_(0)$ and $beta_(1)$, denoted by $hat(beta)_(0)$
and $hat(beta)_(1)$, are called the *least square estimates*, and are the
choices of $beta_(0)$ and $beta_(1)$ that minimize the function $f(b_(0),
b_(1))$. The *estimated regression line*, or *least square line*, is the
linear equation whose coefficients are $hat(beta)_(0)$ and $hat(beta)_(1)$.

Those coefficients can be retrieved by computing the partial derivatives of
$f(b_(0), b_(1))$ with respect to both variables and setting them equal to $0$:

$ frac(diff f(b_(0), b_(1)), diff b_(0))
  (sum_(i = 1)^(n) (y_(i) - b_(0) - b_(1) x_(i))^(2)) = 0 =>
  sum_(i = 1)^(n) frac(diff f(b_(0), b_(1)), diff b_(0))
  ((y_(i) - b_(0) - b_(1) x_(i))^(2)) = 0 => \
  sum_(i = 1)^(n) 2 (y_(i) - b_(0) - b_(1) x_(i))
  frac(diff f(b_(0), b_(1)), diff b_(0)) (y_(i) - b_(0) - b_(1) x_(i)) = 0 =>
  sum_(i = 1)^(n) 2 (y_(i) - b_(0) - b_(1) x_(i))
  frac(diff f(b_(0), b_(1)), diff b_(0)) (0 - 1 + 0) = 0 => \
  -2 sum_(i = 1)^(n) y_(i) - b_(0) - b_(1) x_(i) = 0 =>
  sum_(i = 1)^(n) y_(i) - b_(0) - b_(1) x_(i) = 0 $

$ frac(diff f(b_(0), b_(1)), diff b_(1))
  (sum_(i = 1)^(n) (y_(i) - b_(0) - b_(1) x_(i))^(2)) = 0 =>
  sum_(i = 1)^(n) frac(diff f(b_(0), b_(1)), diff b_(1))
  ((y_(i) - b_(0) - b_(1) x_(i))^(2)) = 0 => \
  sum_(i = 1)^(n) 2 (y_(i) - b_(0) - b_(1) x_(i))
  frac(diff f(b_(0), b_(1)), diff b_(1)) (y_(i) - b_(0) - b_(1) x_(i)) = 0 =>
  sum_(i = 1)^(n) 2 (y_(i) - b_(0) - b_(1) x_(i))
  frac(diff f(b_(0), b_(1)), diff b_(1)) (0 + 0 - x_(i)) = 0 => \
  -2 sum_(i = 1)^(n) x_(i)(y_(i) - b_(0) - b_(1) x_(i)) = 0 =>
  sum_(i = 1)^(n) x_(i)(y_(i) - b_(0) - b_(1) x_(i)) = 0 $

Extracting the two equations, called *normal equations*, and solving for
$b_(0)$ and $b_(1)$, gives the two point estimators $hat(beta)_(0)$ and
$hat(beta)_(1)$:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ hat(beta)_(1) =
	   frac(sum_(i = 1)^(n) (x_(i) - overline(x))(y_(i) - overline(y)),
	        sum_(i = 1)^(n) (x_(i) - overline(x))^(2)) =
	   frac(S_(x y), S_(x x)) $],
	[$ hat(beta)_(0) = frac(sum_(i = 1)^(n) y_(i) -
	   hat(beta)_(1) sum_(i = 1)^(n) x_(i), n) =
	   overline(y) - hat(beta)_(1) overline(x) $]
)

#theorem[
	The estimators $hat(beta)_(0)$ and $hat(beta)_(1)$ are correct estimators
	for $beta_(0)$ and $beta_(1)$.
]

#theorem("Gauss-Markov Theorem")[
	The estimators $hat(beta)_(0)$ and $hat(beta)_(1)$ are the estimators
	for $beta_(0)$ and $beta_(1)$ having the smallest sample variance.
]

#exercise[
	Consider @Regression-example-1. Compute the estimates of $hat(beta)_(0)$
	and $hat(beta)_(1)$ and draw the corresponding estimated regression line.
] <Regression-example-2>
#solution[
	Computing $overline(x)$ and $overline(y)$ gives:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ overline(x) = frac(0.40 + 0.48 + dots + 1.60, 20) =
		   frac(21.16, 20) approx 1.06 $],
		[$ overline(y) = frac(1.02 + 0.88 + dots + 4.92, 20) =
		   frac(57.07, 20) approx 2.86 $]
	)

	Computing $S_(x y)$ and $S_(x x)$ gives:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ S_(x y) = sum_(i = 1)^(n) (x_(i) - 1.06)
		   (y_(i) - 2.86) approx 9.08 $],
		[$ S_(x x) = sum_(i = 1)^(n) (x_(i) - 1.06)^(2) approx 2.88 $]
	)

	The estimation of $hat(beta)_(0)$ and $hat(beta)_(1)$ is therefore:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ hat(beta)_(1) = frac(9.08, 2.88) approx 3.15 $],
		[$ hat(beta)_(0) = 2.86 - frac(9.08, 2.88) dot 1.06 approx -0.48 $]
	)

	The estimated regression line is $y = -0.48 + 3.15x$. Plotting it gives:

	#figure(image("example2.svg", width: 50%))
]

The estimated regression line can be used to make predictions about values
of $y$ fixing a value of $x$, even if it's not present in the sample. Chosen
a certain $x'$, the value $hat(beta)_(0) + hat(beta)_(1) x'$ gives the point
estimate of the expected value of $Y$ when $x = x'$. It should be noted that,
since the values of $hat(beta)_(0)$ and $hat(beta)_(1)$ depend on the values
of the sample, the value $hat(beta)_(0) + hat(beta)_(1) x'$ will be a more
and more inaccurate prediction for $E(Y)$ as the chosen $x'$ is further and
further away from the range of the sample.

#exercise[
	Consider the estimated regression line from @Regression-example-2.
	Compute the prediction for $y'$ when $x' = 1.25$ and when $x' = 10$
] <Regression-example-3>
#solution[
	#grid(
		columns: (0.5fr, 0.5fr),
		[$ y' = -0.48 + 3.15 dot 1.25 = 3.46 $],
		[$ y' = -0.48 + 3.15 dot 10 = 31.02 $]
	)

	Even though the first prediction might be reasonable, the other one is
	much less reliable
]

The parameter $sigma^(2)$, the variance of the random error, determines the
amount of variability inherent in the regression model. A large $sigma^(2)$
will lead to observed pairs $(x_(i), y_(i))$ that fall far from the true
regression line, while a small $sigma^(2)$ will lead to observed pairs close
to the line.

An estimate of $sigma^(2)$ will be used in confidence interval formulas
and hypothesis-testing procedures. Because the equation of the true line
is unknown, the estimate is based on the extent to which the sample
observations deviate from the estimated line. Many large deviations from
said line suggest a large $sigma^(2)$, whereas small deviations suggest a
small $sigma^(2)$.

The *fitted values* of $y$, or *predicted values* of $y$, denoted
as $hat(y)_(1)$, $hat(y)_(2)$, $dots$, $hat(y)_(n)$, are obtained
by substituting $x_(1)$, $x_(2)$, $dots$, $x_(n)$ into the equation
of the estimated regression line: $hat(y)_(1) = hat(beta)_(0) +
hat(beta)_(1) x_(1)$, $hat(y)_(2) = hat(beta)_(0) + hat(beta)_(1) x_(2)$,
$dots$, $hat(y)_(n) = hat(beta)_(0) + hat(beta)_(1) x_(n)$. The *residuals*
are the differences between the observed value and the predicted value of
$y$: $y_(1) - hat(y)_(1)$, $y_(2) - hat(y)_(2)$, $dots$, $y_(n) - hat(y)_(n)$.

The residual $y_(i) - hat(y)_(i)$ corresponds to the vertical deviation
between the point $(x_(i), y_(i))$ and the least squares line, a positive
number if the point lies above the line and a negative number if it lies
below. If the residuals are all small (in absolute value), then most
observations for $y$ can be explained by the linear relationship between
$x$ and $y$ (the ones unexplained can be conceived as noise), whereas many
large residuals suggests that the linear relationship between $x$ and $y$
can explain very little observations for $y$.

#exercise[
	Consider the dataset shown in @Regression-example-1. Compute the fitted
	values and the residuals.
] <Regression-example-4>
#solution[
	#align(
		center,
		table(
			columns: 5,
			[*Observation*], [*Observed X*], [*Observed Y*],
			[*Fitted Y*], [*Residue*],
			..csv("example4.csv").flatten()
		)
	)
]

Since $sigma^(2)$ is itself a parameter of the linear model, and since it
is necessarely unknown (it is estimated from the sample), it ought to be
estimated. In regression analysis, the estimation of $sigma^(2)$ is computed
from summing and squaring the residuals. Define the *error sum of squares*,
denoted as SSE, as:

$ "SSE" = sum_(i = 1)^(n) (y_(i) - hat(y)_(i))^(2) =
  sum_(i = 1)^(n) (y_(i) - hat(beta)_(0) - hat(beta)_(1) x_(i))^(2) =
  sum_(i = 1)^(n) y^(2)_(i) - hat(beta)_(0) sum_(i = 1)^(n) y_(i) -
  hat(beta)_(1) sum_(i = 1)^(n) x_(i) y_(i) = S_(y y) - hat(beta)_(1) S_(x y) $

Denoting with $hat(sigma)^(2)$ the estimator for $sigma^(2)$:

$ hat(sigma)^(2) = frac("SSE", n - 2) $

The $n - 2$ term comes from the fact that both $hat(beta)_(0)$ and
$hat(beta)_(1)$ are estimators themselves, and therefore a degree
of freedom is lost for each. Replacing each $y_(i)$ in the formula
for $hat(sigma)^(2)$ by the random variable $Y_(i)$ gives the estimator
$S^(2)$. Very roughly, it represents the size of a typical vertical
deviation within the sample from the estimated regression line.

#lemma[
	$S^(2)$ is an unbiased estimator for $sigma^(2)$.
]
//#proof[
//	To be added
//]

SSE can be interpreted as a measure of how much variation in $y$ is left
unexplained by the model; that is, how much cannot be attributed to a
linear relationship. If $"SSE" = 0$, then the model perfectly describes
the relationship between the two variables in the data. A quantitative
measure of the total amount of variation in observed $y$ values is given
by the *total sum of squares*, SST for short:

$ "SST" = S_(y y) = sum_(i = 1)^(n) (y_(i) - overline(y))^(2) =
  "SSE" + hat(beta)_(1) S_(x y) $

SST is the sum of squared deviations between the observed $y$ values
and their mean (the sample mean), whereas SSE is the sum of squared
deviations between the observed $y$ values and the fitted $y$ values.
Whereas SSE represents the average vertical difference between the
$(x, y)$ pairs and the estimated regression line, SST represents the
average horizontal difference between the $(x, y)$ pairs and the
straight line $f(x) = overline(y)$.

// Add a plot such as the one on page 504

Since SSE is the cumulative distance between the sample points and
the estimated regression line, by definition there can be no line
whose cumulative distance between itself and those points is smaller.
Therefore, unless the estimated regression line and the line $f(x) =
overline(y)$ coincide, SSE is strictly smaller than SST.

For this reason, the ratio $"SSE" slash "SST"$, is necessarely a number
lying in the $(0, 1]$ interval. This ratio represents the proportion
of total variation of the $y$ variable that cannot be explained by the
regression model, whereas $1$ minus said ratio (a number still lying
in the $(0, 1]$ interval) represents the proportion of total variation
of the $y$ variable that can be explained by the regression model.
The value is also known as the *coefficient of determination*:

$ r^(2) = 1 - frac("SSE", "SST") $

The higher the value of $r^(2)$, the better the linear regression
model is. If the value of $r^(2)$ is particularly low, one should
investigate whether another regression model is more appropriate
for the data at hand.
