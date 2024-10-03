#import "../Stats4AI_definitions.typ": *

As already stated, Kolmogorov axioms define the properties of probability
but do not offer a method for assigning them to events. The simplest
approaches, such as assigning the same probability to each event, are
far to weak to model reality. A more powerful concept to be introduced
which can help model probability is the *random variable*.

A random variable can be conceived as a mapping from the sample space
to the real line. In other words, a random variable is a function that
assigns a probability to any possible event of the sample space. Given
a sample space $cal(S)$, a random variable $X$ for such sample space is
defined as $X : cal(S) |-> RR$, and the probability of such variable
to assume a certain value $x$ of the sample space is denoted as $P(X = x)$.

// ADD AN EXAMPLE OF A RANDOM VARIABLE

Random variables fall in two broader categories: *discrete* and *continuous*.
A random variable is said to be discrete if the set of values it can assume
is either finite or countably infinite. A random variable is said to be
continuous if the two following properties apply:

+ Its set of possible values consists either of all numbers in a
  single (possibly infinite) interval on the real line or all numbers
  in a disjoint union of such intervals;
+ The probability of the random variable to assume a specific value is
  always zero.

The *probability mass function* (abbreviated as pmf) of a discrete random
variable $X$, denoted as $p(X)$, is a function that assigns a probability
to each possible value that such random variable can assume. More formally,
given a random variable $X$, for each value $x$ of its sample space the pmf
of $X$ is defined as:

$ p(x) = P(X = x) = P(omega: omega in cal(S), X(omega) = x) $

// Example goes here

The *cumulative distribution function* (abbreviated as cdf) of a discrete
random variable $X$, denoted as $F(X)$, is defined as the probability of
such random variable to assume a value less than or equal to a threshold.
More formally, given a random variable $X$, for each value $x$ of its sample
space the cdf of $X$ is defined as:

$ F(c) = P(X lt.eq x) = sum_(y: y lt.eq x) p(y) $

// Example goes here, OneNote one, with graphs and such

Some specific random variables have been studied extensively, mostly because
they model very well many phenomena in the real world. For this reason, such
random variables have proper names.

A (discrete) random variable that can only assume the values $0$ and $1$ is
called a *Bernoulli random variable*.
