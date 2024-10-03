#import "../Stats4AI_definitions.typ": *

The discipline of statistics instructs how to make intelligent judgments
and informed decisions in the presence of uncertainty and variation.

Collections of facts are called *data*: statistics provides methods
for organizing, summarizing and drawing conclusions based on information
contained in the data.

A statistical enquiry will typically focus on a well-defined collection of
objects constituting a *population*. When desired information is available
for all objects in the population, a *census* is available.

In general, such a situation is hardly possible, either because it would be
too expensive or too time consuming to do so or simply because the population
has an infinite amount of members. A more reasonable approach is to extract
a subset of the population, called *sample* that is both sufficiently small
to be able to work with and sufficiently large to capture all the nuances of
the population as a whole.

// Provide an example

Each object of the population possesses many features, some of which may
or may not be of interest. Any feature whose value might change from object
to object in the population and that has relevance with respect to a
statistical enquiry is called a *variable*.

Variables are generally distinct in *numerical* variables and *categorical*
variables. Numerical variables are distinct in *discrete* and *continuous*.
Numerical variables are discrete if the set of its possible values is either
finite or countably infinite. Numerical variables are continuous if the
set of its possible values is uncountably infinite. Categorical variables
are distinct in *ordinal* and *nominal*. Categorical variables are ordinal
if the set of its possible values obeys an objective hierarchy or ordering
of some sort, otherwhise are called *nominal*.

#exercise[
	Provide an example for each of the four types of variables.
]
#solution[
	- A numerical discrete variable could be the number of items sold in a
	  store, since such number is necessarely an integer (it's not possible
	  to sell, say, half an item, or three quarters of an item). Another
	  example is the number of attempts necessary to win the lottery: it
	  could be infinite, but it's still countable;
	- A numerical continuous variable could be the temperature measured in
	  a certain meteorological station, since such value is a real number
	  (it could be approximated to an integer, but it would entail losing
	  much informaton);
	- A categorical ordinal variable could be the ranks in an army, such
	  as general, private, captain, etcetera. Such ranks can be arranged
	  in a (very) strict hierarchy, for example corporal is lower than
	  general while corporal is higher than private;
	- A categorical nominal variable could be the colors of a dress.
	  It would make little sense to say that, for example, red scores
	  higher than green or that pink scores lower than blue, at least
	  in an objective way.
]

When referring to "statistics", it often entails two distinct concepts.
The first one is *descriptive statistics*, that consists in summarizing
and describing the data, in general through graphical representations
(called *plots*) or through *summary measures*, numbers that on their
own represent an aspect of the data as a whole.

The second one is *inferential statistics*, that consists in drawing
conclusions about the population as a whole from the sample extracted
from such population. In this case, a sampling is a means to an end,
not an end in itself.

Given a discrete numerical variable $x$, let $x_(1), x_(2), dots, x_(n)$
be the observations collected from the sample of such variable, with $n$
being the cardinality of the sample. The *sample mean* $overline(x)$ is
a summary measure that describes its average value, and is calculated as:

$ overline(x) = frac(x_(1) + x_(2) + dots + x_(n), n) =
  frac(sum_(i = 1)^(n) x_(i), n) $

Given a discrete numerical variable $x$, let $x_(1), x_(2), dots, x_(n)$,
be the observations collected from the sample of such variable, arranged
from lowest to highest (including duplicates). The *sample median* $tilde(x)$
is a summary measure that describes the central value, and is calculated as
either the middle value of such sequence if $n$ is odd or the average of the
two middle values if $n$ is even:

$ tilde(x) = cases(
	"The" (frac(n + 1, 2))^("th") "value if" n "is odd",
	"The average of the" (frac(n, 2))^("th") "and the"
	(frac(n, 2) + 1)^("th") "value if" n "is even") $

The *sample variance* $s^(2)$ is a summary measure that describes how "spread
out" are the values of the sample, or equivalently how close its values are to
the sample mean, and is defined as:

$ s^(2) = frac(sum_(i = 1)^(n) (x_(i) - overline(x))^(2), n - 1) =
  frac(n sum_(i = 1)^(n) x_(i)^(2) - (sum_(i = 1)^(n) x_(i))^(2), n(n - 1)) $

The *sample standard deviation* is defined as the square root of the sample
variance:

$ s = sqrt(s^(2)) $

#theorem[
	Given a discrete numerical variable $x$, let $x_(1), x_(2), dots, x_(n)$,
	be the observations collected from the sample of such variable, and let
	$c$ be a numerical constant. Then:

	+ If, for each $1 lt.eq i lt.eq n$, the $y$ variable is constructed as
	  $y_(i) = x_(i) + c$, it is true that $s^(2)_(y) = s^(2)_(x)$;
	+ If, for each $1 lt.eq i lt.eq n$, the $y$ variable is constructed as
	  $y_(i) = c x_(i)$, it is true that $s^(2)_(y) = c^(2) s^(2)_(x)$;

	Where $s^(2)_(x)$ is the sample variance of the "original" variable $x$
	and $s^(2)_(y)$ is the sample variance of the "transformed" variable $y$.
]
// #proof[
//	To be added
// ]
