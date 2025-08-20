#import "../../AI_definitions.typ": *

Standard set theory assumes that _elements_ (facts and objects of the
world) belong or do not belong to _sets_ (collections of objects). That
is, there is a clear and unambiguous rule that asserts whether or not
an element is part of a set.

Mathematically, this is represented with a so-called *characteristic
function*: let $U$ be the set that, by definition, contains every
element of potential interest (also called the *universe set*, or
just the *universe*). Let $A$ be a subset of $U$; the characteristic
function $chi_(A): U mapsto {0, 1}$ is defined as:
	
$ chi_(A)(x) = cases(1 & "if" x in A, 0 & "if" x in.not A) $

This means that each set can be identified unambiguously with a function.

#exercise[
	Consider the set of natural numbers $NN$. Let $NN_("even") subset.eq NN$
	be the set of even natural numbers. What would be its characteristic
	function?
]
#solution[
	Dividing an even integer by $2$ gives a remainder of $0$, while dividing
	an odd integer by $2$ gives a remainder of $1$. Adding $1$ to the number
	gives the opposite result, because the successor of an even number is odd
	and the successor of an odd number is even. Therefore, one possibility is
	$chi_(NN_("even"))(x) = (x + 1) mod 2$, with $x in NN$.
]

Standard set theory and propositional/predicative logic are better suited to
model mathematical statements: a triangle _is_ a three-sided shape, seven
_is not_ divisible by three, $pi$ _belongs_ to $RR$, ecc... This is possible
because assertions in math are, indeed, unambiguously true or false. Also,
it is assumed that one is given "perfect" and "unbound" knowledge about the
statements at hand. Finally, logic and set theory do not rely on natural
language, but on a very restricted abstract formalism.

However, this approach is ill-suited to tackle most real-world phenomena and,
most importantly, to model human reasoning. Even though there are subsets in
real life where a characteristic function can be defined with no ambiguity
(the subset of people that are married, the subset of animals that are dogs,
ecc...), this is most likely not the case.

Human reasoning has to be carried out through natural language, which
is spurious and context-dependent: adverbs such as _somewhat_, _likely_,
_almost_, ecc... blur the line between truthness and falsehood. Whether
or not an element should belong to a set or not is often not agreed upon,
varying from context to context and/or from person to person. Also, being
human cognition limited, reasoning has to rely on imperfect knowledge.
However, it's still possible to make (imperfect) logical deductions even
in the face of partial knowledge, assigning approximate truth values to
propositions.

#exercise[
	Let $U$ be the set of all people. Let $X$ be the set of people that
	are _tall_. What would be its characteristic function?
]
#solution[
	Using classical set theory, the only way to model "tallness" would be
	through the following indicator function:

	$ chi_("tall")(h) = cases(1 & "if" h gt.eq H, 0 & "if" h < H) $

	Where $H$ is a fixed threshold that discriminates between people that
	are tall and people that are not tall. However, this would poorly model
	reality for at least three reasons:

	- The choice of $H$ is not agreed upon, and would have to be chosen
	  rather arbitrarely;
	- Any person whose height is in the range $[0, H)$ is "just as" short,
	  whereas any person whose height is in the range $[H, +infinity)$ is
	  "just as" tall. This oversimplifies a more nuanced and realistic
	  definition of "tallness";
	- Even if $H$ were to be determined unambiguously, it would still make
	  the classification impractical. In general, no one actually measures
	  the height of a person before concluding of whether they are tall or
	  not, mostly relying on instinct instead.
]

These considerations suggest the need for subsets whose membership is 
spurious. Instead of having a characteristic function whose outputs are
either $1$ (complete membership) or $0$ (no membership), a function whose
output is a number that quantifies "how much" an element belongs to a set.
That is, introducing a notion of _partial membership_ to sets.

More formally, let $U$ be a universe set. A *fuzzy subset* $mu$ of $U$,
or simply a *fuzzy set* $mu$ of $U$, is a set of pairs defined as:

$ mu = {(x, mu(x)) | x in U} $

Where $mu(x): U mapsto [0, 1]$ is a function, called *membership function*,
that assigns to each member $x in U$ a *degree of membership* $mu(x)$ to
the set $mu$. The set of all fuzzy sets that can be constructed out of a
universe $U$ (the "power set" of fuzzy sets) is denoted as $cal(F)(U)$.

Given a certain $x in U$, if $mu(x) in (0, 1)$ it means that $x$ belongs
to the fuzzy set "only to some extent": the closer to $1$, the "more" it
belongs, the closer to $0$, the "less" it belongs. In particular, if
$mu(x) = 1$ then $x$ has absolute and unambiguous membership, whereas if
$mu(x) = 0$ then $x$ has no membership at all.

A "standard" set (a set that is not fuzzy, that is) can therefore be
seen as a special case of a fuzzy set where its membership function
(the characteristic function) is always either $0$ or $1$. It is
customary to use the term *crisp set* to refer to sets that are not
fuzzy.

#exercise[
	What is a possible membership function for the fuzzy set of tall
	people?
] <Fuzzy-height>
#solution[
	It is reasonable to consider a person to be unambiguously tall if
	their height is $2$ metres or more, and to consider a person to be
	unambiguously short if their height is $1.6$ metres or less. The
	issue arises for heights in the $(1.6, 2)$ interval; are people
	with an height of $1.8$ metres tall? The simplest choice would be
	a straight line:

	$ mu(x) = cases(1 & "if" x > 2,
	                frac(5, 2) x - 4 & "if" x lt.eq 1.6 lt.eq 2,
				    0 & "if" x < 1.6) $
]

Note that fuzzy sets, even though they better model imprecise knowledge,
aren't enough on their own. That is, there's still the need to find a
membership function for the fuzzy set that adequately addresses the task
at hand. The choice of the membership function is subjective and context
dependent, and in general is not an empirical finding. As a matter of fact,
the choice of membership function in @Fuzzy-height was as good as any.
However, the flexibility of a membership function allows one to "tune"
it to improve the model and make incremental adjustments.

If the universe set $U = {x_(1), dots, x_(n)}$ is a discrete set,
to represent a fuzzy set $mu$ it is sufficient to list each member
$x_(i)$ of $U$ together with its degree of membership $mu(x_(i))$.
That is, $mu = {(x_(1), mu(x_(1))), (x_(2), mu(x_(2))), dots, (x_(n)
mu(x_(n)))}$.

Another way to represent a fuzzy set, particularly useful if the
universe set is continuous, is simply graphing its membership
function. This representation is also referred to as the *vertical
representation* of the fuzzy set.

#exercise[
	What would be the vertical representation of @Fuzzy-height?
]
#figure(
	caption: [The vertical representation of the fuzzy set.],
	[#image("height.svg", width: 66%)]
)

In general, the explicit expression of a fuzzy set (as a set of pairs)
is hardly ever used, because it is cumbersome to manipulate and poorly
integrates with crisp sets. Even worse, different sources use different
constructions for defining a fuzzy set. Some refer to the membership
function as the fuzzy set itself, some define a fuzzy set as a pair
$(U, mu)$, with $U$ being the universe and $mu$ being the membership
function. The simplest and least ambiguous way to refer and to use a
fuzzy set is to refer to its membership function.

Crisp sets $A$ and $B$ can be manipulated with the known set operators
of *union*, *intersection* and *complement*:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ A union B = {x in U | x in A or x in B} $],
	[$ chi_(A union B)(x) = max{chi_(A)(x), chi_(B)(x)} $]
)

#grid(
	columns: (0.5fr, 0.5fr),
	[$ A inter B = {x in U | x in A and x in B} $],
	[$ chi_(A inter B)(x) = min{chi_(A)(x), chi_(B)(x)} $]
)

#grid(
	columns: (0.5fr, 0.5fr),
	[$ overline(A) = {x in U | x in.not A} $],
	[$ chi_(overline(A))(x) = 1 - chi_(A)(x) $]
)

Fuzzy sets $cal(A)$ and $cal(B)$ can be manipulated in the exact same
way, since these operators extend naturally. The membership functions
of $cal(A) union cal(B)$, $cal(A) inter cal(B)$ and $overline(cal(A))$
are given by:

#grid(
	columns: (0.37fr, 0.37fr, 0.26fr),
	[$ mu_(cal(A) union cal(B))(x) = max{mu_(cal(A))(x), mu_(cal(B))(x)} $],
	[$ mu_(cal(A) inter cal(B))(x) = min{mu_(cal(A))(x), mu_(cal(B))(x)} $],
	[$ mu_(overline(cal(A)))(x) = 1 - mu_(cal(A))(x) $]
)

This is just one (the simplest) of the many possible ways to extend set
operators to fuzzy sets. Other choices, better suited for different
models, will be explored later on.

Out of all continuous fuzzy sets, the main interest lies in *convex
fuzzy sets*, that best model natural language. Convex fuzzy sets are
fuzzy sets having a degree of membership function that is monotonically
increasing up to a certain point and monotonically decreasing after
said point. Ironically, the membership function of a convex fuzzy set
is a concave function, not a convex function.

Especially when building applications, one should consider convex
fuzzy sets whose membership function can be specified uniquely by
a few parameters, so that they are easy to tune. One example are
*triangular functions*:

#grid(
	columns: (0.6fr, 0.4fr),
	[$ Lambda_(a, b, c): RR mapsto [0, 1] "with" a < b < c "and" a, b, c in RR $],
	[$ Lambda_(a, b, c)(x) = cases(frac(x - a, b - a) & "if" a lt.eq x < b,
								   frac(c - x, c - b) & "if" b lt.eq x lt.eq c,
								   0 & "otherwise") $]
)

#figure(
	caption: [Plot of the triangular function $Lambda_(1.5, 2.25, 3)$.],
	[#image("fuzzy_triangular.svg", width: 66%)]
)

Triangular functions are a special case of *trapezoidal functions*:

#grid(
	columns: (0.6fr, 0.4fr),
	[$ Pi_(a, b, c, d): RR mapsto [0, 1] "with" a < b lt.eq c < d and a, b, c, d in RR $
	 $a = b = -infinity$ and $c = d = +infinity$ are also valid],
	[$ Pi_(a, b, c, d)(x) = cases(frac(x - a, b - a) & "if" a lt.eq x < b,
								  1 & "if" b lt.eq x < c,
								  frac(d - x, d - c) & "if" c lt.eq x lt.eq d,
								  0 & "otherwise") $]
)

#figure(
	caption: [Plot of the trapezoidal function $Pi_(1, 2, 3, 4)$.],
	[#image("fuzzy_trapezoid.svg", width: 66%)]
)

Another class of functions are the *bell-shaped functions*:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ Omega_(a, b) : RR mapsto [0, 1] "with" a, b in RR $],
	[$ Omega_(a, b)(x) = e^(-(frac(x - a, b))^(2)) $]
)

#figure(
	caption: [Plot of the bell-shaped function $Omega_(2.5, 1)$.],
	[#image("fuzzy_gauss.svg", width: 66%)]
)

The *support* of a fuzzy set $mu in cal(F)(U)$ is the (crisp) set that
contains all the elements of $U$ having non-zero degree of membership
in $mu$:

$ S(mu) = {x in U | mu(x) > 0} $

The *core* of a fuzzy set $mu in cal(F)(U)$ is the (crisp) set that
contains all the elements of $U$ having membership equal to $1$:

$ C(mu) = {x in U | mu(x) = 1} $

The *height* of a fuzzy set $mu in cal(F)(U)$ is the highest degree
of membership obtained by any element of said set:

$ h(mu) = sup{x in U | mu(x)} $

Even though the $[0, 1]$ codomain could suggest so, fuzzy membership
has little to do with probability theory. That is, the value $mu(x)$
does not represent the probability that the element $x in U$ belongs
to $mu$, or that a random sample of $U$ results in an element of $mu$.
Fuzzy sets model how closely a property or a statement is satisfied,
whereas probability models the certainty of an event to happen or not
#footnote[It should also be noted that $mu(x)$ does not necessarely
comply with the three Kolmogorov axioms for probability. For example,
$integral_(-infinity)^(+infinity) mu(x) d x$ might not be equal to
$1$.]. Specifically, fuzzy sets have three main onthological
interpretations:

- *Similarity*. A fuzzy set represents the degree of proximity between a
  an element and another, used to set the scale. Given a reference object
  that certainly and unambiguously belongs to the fuzzy set, the degree of
  membership between a given object and a reference object is therefore
  reduced to the similarity between the two: the greater the similarity,
  the higher the membership degree. If the similarity can be expressed
  mathematically, it can be formulated as a distance. Popular with fuzzy
  clustering and fuzzy control.
- *Preference*. A fuzzy set represents the degree of preference in favour of
  one object over another, or the feasibility of choosing one over another.
  Preference can be formulated as a utility function or as a cost function,
  leading one to choose the member of the fuzzy set with the lowest cost or
  the highest utility. Popular with fuzzy decision making theory and fuzzy
  optimization
- *Possibility*. A fuzzy set represents how reasonable is for an event
  to happen based on the current knowledge state, ranging from completely
  implausible ($mu(x) = 0$) to completely reasonable ($mu(x) = 1$). Note
  the difference between this formulation and probability theory: $mu(x)
  = 0$ does not mean that $x$ will never happen, as $mu(x) = 1$ does not
  mean that $x$ will always happen. What they really represent is the
  degree of "surprise" if they were to happen. Popular with fuzzy artificial
  intelligence.

@Probability-or-fuzzy clarifies the difference between probability and
fuzzy set membership.

#exercise[
	Let $B$ be the set of all bottles of $1$ litre capacity. Consider the
	two following statements:

	- Choosing a random bottle out of $B$, the probability of finding a
	  bottle of water is $0.999$, while the probability of finding a bottle
	  of (liquified) caffeine is $0.001$;
	- The degree of membership of a bottle in $B$ with respect to the fuzzy
	  set of water bottles is $0.999$, while the degree of membership with
	  respect to the fuzzy set of (liquified) caffeine bottles is $0.001$.

	Supposing that one bottle has to be drunk, and that one of the two
	statements must be true. Which one would be the safest?
] <Probability-or-fuzzy>
#solution[
	Having a probability of $0.001$ of being a bottle of caffeine could
	be interpreted as, out of $1000$ identically sampled bottles, roughly
	$1$ contains only and exclusively caffeine (and roughly $999$ contain
	only water). Having a degree of membership of $0.001$ with respect to
	the fuzzy set of caffeine bottles can be interpreted as a bottle in
	$B$ matching the definition "this bottle contains only caffeine" with
	a degree of $0.001$. That is, a bottle in $B$ would be $0.001$ litres
	(one gram) of caffeine and $0.999$ litres of water. Knowing that the
	lethal dose of caffeine for an adult individual is about ten grams
	#footnote[#link("https://www.fda.gov/consumers/consumer-updates/spilling-beans-how-much-caffeine-too-much")],
	the safest choice would be the second. This is because in the first
	case there's a $0.1 percent$ chance of drinking one litre of caffeine
	(far more than ten grams) while in the second case there's a $100
	percent$ chance of drinking one gram of caffeine. That is, one chance
	out of a thousand of dying against no chance at all.
]
