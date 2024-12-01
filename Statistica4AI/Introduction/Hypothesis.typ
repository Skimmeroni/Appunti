#import "../Stats4AI_definitions.typ": *

A parameter can be estimated either by a single number (point 
estimate) or by an interval of admissible values (a confidence 
interval). However, the objective of an investigation can also
be putting a claim concerning the parameter to the test, and see
if such claim is plausible or not. The methods for accomplishing
this comprise the part of statistical inference called *hypothesis
testing*.

A *statistical hypothesis* is an assertion concerning the value 
of a single parameter (_"The value of this parameter is 0.5"_, 
_"The value of this parameter is lower than 3"_, ...), the 
value of several parameters (_"Parameter one is greater than 
parameter two"_, _"Parameters one and two are equal"_, ...), 
or about the form of a probability distribution (_"This sample 
was drawn from a normal distribution"_, _"This sample was drawn 
from a Poisson distribution"_, ...). 

In any hypothesis testing problem, there are two mutually exclusive
hypothesis under consideration: one is the one that is thought to be
true, called the *null hypothesis*, and the other is its logical
complement, called the *alternative hypothesis*. The null hypothesis 
is often denoted as $H_(0)$, while the alternative hypothesis as 
$H_(a)$ or $H_(1)$. The objective is to decide, based on the 
information collected from a sample, which of the two is to be taken.

The alternative hypothesis should be taken into account if and only
if the test says that the sample contradicts the null hypothesis
with enough margin, and stick with the null hypothesis otherwise. 
If the sample is in line with the null hypothesis, this does not 
necessarely mean that the null hypothesis is true, it just means 
that there is not enough evidence to disprove it.

The simplest structure of a null hypothesis is $H_(0): theta = 
theta_(0)$. That is to say, the hypothesis is stating that the
parameter $theta$ is equal to the specific value $theta_(0)$.
In this case, the alternative hypothesis is stating one of the
following:

- $theta$ is greater than $theta_(0)$, 
  that is $H_(a): theta > theta_(0)$
- $theta$ is less than $theta_(0)$, 
  that is $H_(a): theta < theta_(0)$
- $theta$ is different from $theta_(0)$, 
  that is $H_(a): theta != theta_(0)$

The first two are called *unilateral*, while the last one is called
*bilateral*.

In an hypothesis testing problem, the rejection or confirmation of 
the null hypothesis is decided with respect to a *test statistic*. 
This statistic is a function of the sample data (a random variable) 
whose value obtained from the sample should be very different with 
respect to whether the null hypotesis is assumed to be true or to 
be false. If the value of the test statistic deviates decisively
from the values expected from the null hypothesis, then the null
hypothesis is rejected in favour of the alternative hypothesis. 
If the value of the test statistic is consistent with what is
stated in the null hypothesis, then the null hypothesis is not 
rejected.

The issue is that a null hypothesis of the form $H_(0): theta = 
theta_(0)$ will never be confirmed with exact precision from the
sample data, because the value of $theta$ extracted from the
sample will always be different from sample to sample. Therefore,
the null hypothesis ought to be rejected when the value of $theta$
retrieved from the sample deviates from $theta_(0)$ only within a
small margin.

Such "closeness" to $theta_(0)$ is quantified in the *p-value*. Such
value is the probability, calculated assuming that the null hypothesis
is true, of obtaining a value of the test statistic at least as
contradictory to what is stated in $H_(0)$ as the value calculated
from the sample. A conclusion is reached by picking a number $alpha$
called *significance level*, reasonably close to $0$: $H_(0)$ is 
rejected in favour of $H_(a)$ if the p-value is less than or equal to
the level of significance, whereas $H_(0)$ will not be rejected if the
p-value is greater than the level of significance. Even though $alpha$
can be any value, it is customary to pick either $0.05$, $0.01$, 
$0.001$ or $0.1$.

The idea is that if the probability that the value of the test 
statistic computed from the sample is so extreme under the null
hypothesis is very low, then such value cannot be justified by
a fluctuation in the data, but ought to be interpreted as the 
null hypothesis poorly interpreting the scenario.

As stated before, if the data does not provide enough evidence to 
disprove the null hypothesis it does not necessarely mean that the
null hypothesis is true: the data could be the result of a sample
having very biased (unlikely, but still possible) outcome, that 
happened to agree with the null hypothesis. The values of the sample 
might also be biased in the other sense, appearing to favour the 
rejection of the null hypothesis simply because the sample was
extremely favorable. 

In both cases, a mistake is made. These two scenarios are summed up as:

- *Type I error*: rejecting $H_(0)$ even though it's true;
- *Type II error*: not rejecting $H_(0)$ even though it's false.

#theorem[
	In an hypothesis test, the probability of incurring in a type I 
	error is equal to the level of significance of the test.
] <Alpha-is-type-I-error-probability>
#proof[
	Let $Y$ be the test statistic, with cdf given by $F$ when $H_(0)$
	is true. Suppose that $Y$ has a continuos distribution over some
	interval, such that $F$ is strictly increasing over such interval.
	If this is the case, $F^(-1)$ is well defined.

	Consider the case in which only values of $Y$ are smaller than 
	the computed value $y$ are more contradictory to $H_(0)$ than 
	$y$ itself. Then:

	$ "p-value" = P("A value for the test statistic at least as
	  contradictory to the null hypothesis is obtained" | H_(0)) = 
	  F(y) $

	Before having the sample data:

	$ P("Type I Error") = P("p-value" lt.eq alpha | H_(0)) = 
	  P(F(y) lt.eq alpha) = P[F^(-1)(F(y)) lt.eq F^(-1)(alpha)] = \
	  P[Y lt.eq F^(-1)(alpha)] = P[Y lt.eq F^(-1)(alpha)] = 
	  F[F^(-1)(alpha)] = alpha $

	The case in which only values of $Y$ are greater than the computed 
	value $y$ are more contradictory to $H_(0)$ than $y$ itself is 
	analogous. The bilateral case is also analogous.

	The theorem still holds for $Y$ being a discrete distribution as 
	long as it is possible to provide a well defined inverse function
	of the cdf.
]

A formula for computing the probability of committing a type II error
(often denoted with $beta$) depends on the test statistic, and isn't 
always available.

If the probability of committing one of the two errors decreases, 
the probability of committing the other increases. Therefore, there's 
a tradeoff to be made. Out of the two errors, the type I error is 
generally considered to be more problematic than the type II error,
because rejecting an hypothesis generally mean establishing an entire
new framework, while not rejecting an hypothesis simply means keeping
things as they are #footnote[This is analogous to a trial: it is 
better to absolve a criminal than to condemn an innocent.].

=== Z tests about $mu$, known $sigma$

Let $X_(1), dots, X_(n)$ be a random sample retrieved from a normal 
distribution with mean value $mu$ and (known) standard deviation 
$sigma$. Then, since the sum of normal distributions is itself normal,
the sample mean $overline(X)$ is normally distributed with expected
value $mu$ and standard deviation $sigma slash sqrt(n)$. 

Let $H_(0): mu = mu_(0)$, where $mu_(0)$ is referred to as the *null 
value*. The alternative hypothesis can either be $H_(1): mu > mu_(0)$,
$H_(1): mu < mu_(0)$ or $H_(1): mu != mu_(0)$. $overline(X)$ can be 
standardized to get $Z = (overline(X) - mu_(0) slash (sigma slash 
sqrt(n)))$.

When $H_(0)$ is true, $mu_(overline(X)) = mu_(0)$. The statistic 
$Z$ is a natural measure of the distance between $overline(X)$, 
the estimator of $mu$, and its expected value when $H_(0)$ is 
true ($mu_(overline(X))$). If the realization $overline(x)$ of 
the sample mean $overline(X)$ considerably exceeds $mu_(0)$ in 
a direction consistent with $H_(1)$, there is sufficient evidence 
to reject $H_(0)$.

Let $H_(1): mu > mu_(0)$. The null hypothesis ought to be rejected 
if a very large value $z = (overline(x) - mu_(0) slash (sigma slash 
sqrt(n)))$ from $Z$ is retrieved. If this is the case, this implies 
that any value exceeding $z$ is even more inconsistent with $H_(0)$ 
than $z$ itself. The p-value of the test is therefore the probability 
of retrieving a value for $Z$ greater or equal than $z$ assuming 
$H_(0)$ to be true.

#exercise[
	In a certain city, it has been calculated $10$ years ago that the
	amount of toxins in a battery of water is distributed with mean 
	$mu_(0) = 2.0$ g. A random sample of $51$ batteries gave a sample 
	mean of $2.06$ g and a sample standard deviation of $0.141$ g. The 
	two hypothesis are as follows:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ H_(0): mu = mu_(0) $],
		[$ H_(1): mu > mu_(0) $]
	)

	Does this data provide compelling evidence that the claim 
	$mu = 2.0$ g still holds true to this day? Use a significance
	level of $alpha = 0.01$.
]
#solution[
	Since the distribution of the population is not known and the 
	standard deviation of the population is also not known, it is
	possible to apply the CLT and get:
	
	$ Z = frac(overline(X) - mu_(0), S slash sqrt(n)) = 
	  frac(2 - 2.06, 1.41 slash sqrt(51)) = 3.04 $

	Which is the standardized version of $overline(X)$ assuming the
	null hypothesis to be true. This means that the evidence obtained
	from the data is roughly $3$ standard deviation larger than the
	expected value under $H_(0)$. The p-value is given by:

	$ p = P(Z gt.eq 3.04) = 1 - Phi(3.04) = 1 - 0.9988 = 0.0012 $

	Which is lower than the chosen $alpha$ (and extremely low in 
	general). Therefore, the null hypothesis ought to be rejected.
]

Let $H_(1): mu < mu_(0)$. The null hypothesis ought to be rejected 
if a very small value $z = (overline(x) - mu_(0) slash (sigma slash 
sqrt(n)))$ from $Z$ is retrieved. If this is the case, this implies 
that any value lower than $z$ is even more inconsistent with $H_(0)$ 
than $z$ itself. The p-value of the test is therefore the probability 
of retrieving a value for $Z$ smaller or equal than $z$ assuming 
$H_(0)$ to be true.

Let $H_(1): mu != mu_(0)$. The null hypothesis ought to be rejected 
if a very small or very large value $z = (overline(x) - mu_(0) slash 
(sigma slash sqrt(n)))$ from $Z$ is retrieved. If this is the case, 
this implies that any value lower than $z$ in the first case and a
value greater than $z$ in the second case is even more inconsistent 
with $H_(0)$ than $z$ itself. The p-value of the test is therefore 
the probability of retrieving a value for $abs(Z)$ greater or equal 
than $z$ assuming $H_(0)$ to be true.

The z tests with known $sigma$ are among the few for which there are
simple formulas for computing $beta$, the probability of a type II 
error to occur. Let $H_(1): mu > mu_(0)$, and let $mu'$ be any value
of $mu$ that exceeds $mu_(0)$. If $H_(0)$ is not rejected when $mu
= mu'$ then, by definition, a type II error occurred. Denote with
$beta(mu')$ the probability of not rejecting $H_(0)$ when $mu = mu'$.
This results in:

$ beta(mu') = P(H_(0) "is not rejected when" mu = mu') = 
  P(overline(X) < mu_(0) + z_(alpha) dot sigma slash sqrt(n) 
  "when" mu = mu') = \ P(frac(overline(X) - mu', sigma slash 
  sqrt(n)) < z_(alpha) + frac(mu_(0) - mu', sigma slash sqrt(n)) 
  "when" mu = mu') = Phi(z_(alpha) + frac(mu_(0) - mu', sigma slash 
  sqrt(n))) $

In the case of $H_(1): mu < mu_(0)$, it is easy to see that:

$ beta(mu') = 1 - Phi(-z_(alpha) + frac(mu_(0) - mu', sigma slash 
  sqrt(n))) $

In the same fashion, if $H_(1): mu != mu_(0)$ then:

$ beta(mu') = Phi(z_(alpha slash 2) + frac(mu_(0) - mu', sigma slash 
  sqrt(n))) - Phi(-z_(alpha slash 2) + frac(mu_(0) - mu', sigma slash 
  sqrt(n))) $

// Add an example

When the alternative hypothesis is either $H_(1): mu > mu_(0)$ or 
$H_(1): mu < mu_(0)$, the sample size $n$ should be chosen to satisfy:

$ Phi(z_(alpha) + frac(mu_(0) - mu', sigma slash sqrt(n))) = 
  Phi(-z_(beta)) = beta $

This is because $-z_(beta)$ represents the $z$ critical value that 
captures lower-tail area $beta$. Solving for $n$ gives:

$ n = [frac(sigma(z_(alpha) + z_(beta)), mu_(0) - mu')]^(2) $

In the case of $H_(1): mu != mu_(0)$, it is still possible to retrieve
an approximate solution:

$ n = [frac(sigma(z_(alpha slash 2) + z_(beta)), mu_(0) - mu')]^(2) $

// === T test, $sigma$ unknown, small sample size, normal distribution
