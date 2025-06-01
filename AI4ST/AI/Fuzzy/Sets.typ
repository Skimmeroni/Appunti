#import "../AI_definitions.typ": *

Boolean logic assumes that any proposition can be given a truth value
of either _true_ or _false_, or $1$ or $0$, with no room for ambiguity
in between. Technically speaking, given a set $X$ of propositions, the
subset $M subset.eq X$ of true propositions is constructed from $X$ by
its *characteristic function* $I_(M)$:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ I_(M) : X mapsto [0, 1], I_(M) = cases(1 & "if" x in M, 0 & "otherwise") $],
	[$ M = {x | x in X, I_(M)(x) = 1} $]
)

#exercise[
	Consider the set of natural numbers $NN$. Let $M subset.eq NN_(0)$
	be the set of even natural numbers. What would be its characteristic
	function?
]
#solution[
	It can be written as $I_(M)(x) = (x + 1) mod 2$, since the remainder
	of the division between an even number and $2$ is $0$ whereas the
	remainder of the division between an odd number and $2$ is $1$.
]

However, modelling everyday life human propositions this way will most
likely be unfruitful. Fixing thresholds for determining whether a certain
proposition is true or false is most likely impossible, both because they
hardly exist and, even if they do, they are not agreed upon, and depend
either from context to context or from person to person. Also, natural
language widely employs adverbs such as somewhat, likely, almost, ecc...
that aren't really reflected in binary logic and that induce a blurred
line between truth and falseness. Finally, it should be noted that it
would make little sense, in everyday life, to treat truth values are
threshold overcomings: people just have "hunches", yet this doesn't (and
shouldn't) stop one from giving nuanced definitions of true and false.

#exercise[
	Is there an example of natural language propositions for whom is
	hard to assign a binary truth value?
]
#solution[
	Consider the definition of "hot". It is hard to state if the
	proposition _the weather is hot_ is either true or false, since
	there is no set definition of what it means for the wheather to
	be hot. That is, there really isn't an indicator function for
	"hotness".

	The problem could seemingly be sidestep by fixing a certain threshold
	and formulating the indicator function of "hotness" as, say:

	$ I_(H)(w) = cases(1 & "if the temperature is greater or equal than 25 degrees", 0 & "otherwise") $

	However, this approach would poorly model reality for at least three
	reasons:

	- The cutoff point of $25$ degrees, or any cutoff point for that matter,
	  is chosen completely arbitrarely. In reality, every person has its own
	  way of determining if the weather is or isn't hot;
	- This would mean that if the temperature is $24.9$ degrees the weather
	  should be considered just as cold as it would be if the temperature
	  was $0$ degrees, or any temperature below $25$ degrees;
	- Even if it were possible to unambiguously agree upon a cutoff point,
	  it would still be impractical, since no one states that the weather
	  is hot by checking the temperature, it is just an intuitive feeling.
]

The idea behind fuzzy sets is to introduce the idea of "partial" membership.
That is, in contrast to classical logic where an element either is or is
not a member of a set, elements of a fuzzy set have a number assigned that
quantifies "how much" they belong to said set.

More formally, let $X$ be a set. A *fuzzy subset* $mu$ of $X$, or simply a
*fuzzy set* $mu$ of $X$, is a mapping $mu: X mapsto [0, 1]$ that assigns to
each member $x in X$ a *degree of membership* $mu(x)$ to the fuzzy set $mu$.
The set of all fuzzy sets for a given set $X$ (the "power set" of fuzzy
sets) is denoted as $cal(F)(X)$.

When $mu(x) = 1$, it means that $x$ has complete membership with respect to
$mu$, whereas if $mu(x) = 0$ it means that $x$ has complete non-membership
with respect to $mu$. Characteristic functions can therefore be considered
as special cases of fuzzy sets, having only $0$ and $1$ as possible outputs.

Even though values of $0$ and $1$ for $mu(x)$ have a reasonable ontological
interpretation, a value $mu(x) in (0, 1)$ begs the question: what does it
mean, exactly, for an element to be partially a member of a set? It might
seem natural to interpret $mu(x)$ as a probability value, since the range
of possible values is $[0, 1]$. That is, to interpret $mu(x)$ as a probability
distribution that assigns a probability $mu(x)$ to each $x in X$ of finding
$x$ in the set $mu$.

However, giving such interpretation would be wrong both from a mathematical
perspective and an onthological perspective. First of all, $mu(x)$ does
not validate (in general) all the axioms of probability, for example
$integral_(-infinity)^(+infinity) mu(x) d x$ might not be equal to $1$.
Even if fuzzy sets were to be restricted to only consider functions that
satisfy the Kolmogorov axioms, it would still be ill-advised to interpret
fuzzy sets as probabilities: fuzzy sets model how closely a property or
a statement is satisfied, whereas probability models the certainty of an
event to happen or not.

The most used interpretations of fuzzy sets are the following three:

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

#exercise[
	Consider two bottles of water, $A$ and $B$. Bottle $A$ has a $0.0004$
	probability of actually being a bottle of chlorine, whereas bottle $B$
	has a degree of membership of $0.0004$ with respect to the fuzzy set
	of chlorine bottles. Are the two the same?
]
#solution[
	No. Having a probability of $0.0004$ of being a bottle of chlorine
	could be interpreted as, out of $10000$ identically sampled bottles,
	$4$ contain (only) chlorine and $9996$ contain (only) water. Having
	a degree of membership of $0.0004$ with respect to the fuzzy set of
	chlorine bottles could be interpreted as the statement "bottle $B$
	contains chlorine" matching the definition "a bottle containing
	chlorine" with a degree of $0.0004$, meaning that bottle $B$ has
	almost nothing in common with a bottle of chlorine, containing a
	lot of water and an infinitesimal amount of chlorine.
]

If the universe set $X = {x_(1), dots, x_(n)}$ is a discrete set,
to represent a fuzzy set $mu$ it is sufficient to list each member
$x_(i)$ of $X$ together with its degree of membership $mu(x_(i))$.
That is, $mu = {(x_(1), mu(x_(1))), (x_(2), mu(x_(2))), dots, (x_(n)
mu(x_(n)))}$, meaning that $x_(1)$ belongs to $mu$ with $mu(x_(1))$
degree, $x_(2)$ belongs to $mu$ with $mu(x_(2))$ degree, ecc...

On the other hand, continuous fuzzy sets are tricky. A continuous
fuzzy set $mu$ is identified by a degree of membership $mu(x)$ that
is a continuous function, having codomain $[0, 1] subset RR$. The
most intuitive representation of a continuous fuzzy set consists in
drawing the graph of its degree of membership function: this
representation is also referred to as its *vertical representation*.

Out of all continuous fuzzy sets, the main interest lies in *convex
fuzzy sets*, that best model natural language. Convex fuzzy sets are
fuzzy sets having a degree of membership function that is monotonically
increasing up to a certain point and monotonically decreasing after said
point. Note that a fuzzy set being convex does not entail that its degree
of membership function is also a convex functions; indeed, such functions
are concave functions. Examples of functions with these characteristics are:

-	#grid(
		columns: (0.3fr, 0.36fr, 0.33fr),
		[*Triangular functions*
		$ Lambda_(a, b, c) : RR mapsto [0, 1] $
		with $a < b < c$ and $a, b, c in RR$.],
		[$ Lambda_(a, b, c)(x) = cases(frac(x - a, b - a) & "if" a lt.eq x < b,
									frac(c - x, c - b) & "if" b lt.eq x lt.eq c,
									0 & "otherwise") $],
		[#image("fuzzy_triangular.svg")]
	 )
-	#grid(
		columns: (0.3fr, 0.36fr, 0.33fr),
		[*Trapezoidal functions*
		$ Pi_(a, b, c, d) : RR mapsto [0, 1] $
		with $a < b lt.eq c < d$ and \ $a, b, c, d in RR$.
		$a = b = -infinity$ and $c = d = +infinity$ are also
		valid.],
		[$ Pi_(a, b, c, d)(x) = cases(frac(x - a, b - a) & "if" a lt.eq x < b,
									1 & "if" b lt.eq x < c,
									frac(d - x, d - c) & "if" c lt.eq x lt.eq d,
									0 & "otherwise") $],
		[#image("fuzzy_trapezoidal.svg")]
 	)
-	#grid(
		columns: (0.3fr, 0.36fr, 0.33fr),
		[*Bell-shaped functions*
		$ Omega_(a, b) : RR mapsto [0, 1] $
		with $a, b in RR$.],
		[$ Omega_(a, b)(x) = e^(-(frac(x - a, b))^(2)) $],
		[#image("fuzzy_bell.svg")]
 	)

The vertical representation of fuzzy sets presents some issues, mainly
that storing fuzzy sets encoded as functions in a computer would be both
impractical and inefficient. Also, manipulating fuzzy sets (computing
intersections, unions, ecc...) becomes cumbersome. For these reasons,
the vertical representation should be limited to illustration purposes.
Another representation, called *horizontal representation*, employs
so-called $alpha$-cuts.

Given a universe set $X$ and a fuzzy set $mu in cal(F)(X)$, let $alpha$
be any number between $0$ and $1$. The subset $[mu]_(alpha) = {x in X |
mu(x) gt.eq alpha}$ is referred to as the $alpha$*-level set* of $mu$,
or $alpha$*-cut* of $mu$. Similarly, the subset $[mu]_(underline(alpha))
= {x in X | mu(x) < alpha}$ is referred to as the *strict* $alpha$*-level
set* of $mu$, or *strict* $alpha$*-cut* of $mu$. That is, the $alpha$-cut
of a fuzzy set is the subset that contains all its elements having degree
of membership greater or equal than $alpha$.

$alpha$-cuts of convex fuzzy sets are peculiar because they are always
convex sets. On the other hand, $alpha$-cuts of non-convex fuzzy sets
can be a union of more than one disjointed interval. It is also possible
to use this property as a definition: a fuzzy set is convex if and only
if all of its $alpha$-cuts convex sets.

$alpha$-cuts uniquely identify fuzzy sets: if all the $alpha$-cuts of a
fuzzy set $mu$ are known, the degree of membership $mu(x)$ of an element
$x$ can be computed as:

$ mu(x) = sup{alpha in [0, 1] | x in [mu]_(alpha)} $

Of course, it would be pointless to store all the $alpha$-cuts of
a fuzzy set, since it would be no different than storing the entire
degree of membership function. However, discretizing the set of all
$alpha$-cuts into a discrete subset ${[mu]_(alpha_(1)), [mu]_(alpha_(2)),
dots, [mu]_(alpha_(k))}$ is sufficient to reconstruct the entire fuzzy
set with a surprising degree of accuracy:

$ mu(x) approx max{alpha in {alpha_(1), alpha_(2), dots, alpha_(k)} | x in [mu]_(alpha)} $

#exercise[
	What would be the vertical and horizontal representation of the
	following degree of membership function?

	$ mu(x) = cases(x - 1 & "if" 1 lt.eq x < 2,
	                -frac(3, 8) x + frac(7, 4) & "if" 2 lt.eq x < 4,
	                frac(1, 8) x - frac(1, 4) & "if" 4 lt.eq x < 6,
	                frac(1, 2) & "if" 6 lt.eq x < 7,
	                -frac(1, 2) x + 4 & "if" 7 lt.eq x < 8,
	                0 & "otherwise") $
]
#solution[
	#grid(
		columns: (0.5fr, 0.5fr),
		[#image("vertical.svg")],
		[#image("horizontal.svg")]
	)
]

Formally, given a certain number of $alpha$-cuts, the original membership
function can be reconstructed by taking the _upper envelope_ of said cuts.

#theorem("Representation theorem")[
	Given $mu in cal(F)(X)$ a fuzzy set over a universe set $X$:

	$ [mu]_(0) = sup_(alpha in [0, 1]) {min(alpha, chi_([mu]_(alpha))(x))},
	  space "where" chi_([mu]_(alpha))(x) =
	  cases(1 & "if" x in [mu]_(alpha), 0 & "otherwise") $
]
// #proof[
//
// ]

$alpha$-cuts can be stored in real memory in the form of linked lists. Each
disjointed interval of each $alpha$-cut is stored in a separate node of the
list, and the nodes are linked together in ascending order. Each list (each
$alpha$-cut) has also a pointer to following list (following $alpha$-cut).

#figure(
	caption: [Linked list representation of $alpha$-cuts],
	[#diagram(
			node-stroke: 1.5pt,
			edge-stroke: 1.5pt,
			node-shape: rect,
			spacing: 4em,

			node((0, 0), text(font: "Noto Sans", [#math.circle.filled.big]), radius: 1.5em, name: <A1>),
			node((0.5, 0), text(font: "Noto Sans", [#math.circle.filled.big]), radius: 1.5em, name: <A2>),
			node((1.5, 0), text(font: "Noto Sans", [(#math.alpha#sub[11]]), radius: 1.5em, name: <A3>),
			node((2, 0), text(font: "Noto Sans", [#math.alpha#sub[11])]), radius: 1.5em, name: <A4>),
			node((2.5, 0), text(font: "Noto Sans", [#math.circle.filled.big]), radius: 1.5em, name: <A5>),
			node((3.5, 0), stroke: 0pt, text(font: "Noto Sans", [#math.dots]), radius: 1.5em, name: <A6>),
			node((4.5, 0), text(font: "Noto Sans", [(#math.alpha#sub[1m]]), radius: 1.5em, name: <A7>),
			node((5, 0), text(font: "Noto Sans", [#math.alpha#sub[1m])]), radius: 1.5em, name: <A8>),
			node((5.5, 0), text(font: "Noto Sans", [nil]), radius: 1.5em, name: <A9>),

			edge(<A2>, <A3>, marks: (none, "latex")),
			edge(<A5>, <A6>, marks: (none, "latex")),
			edge(<A6>, <A7>, marks: (none, "latex")),

			node((0, 0.75), text(font: "Noto Sans", [#math.circle.filled.big]), radius: 1.5em, name: <B1>),
			node((0.5, 0.75), text(font: "Noto Sans", [#math.circle.filled.big]), radius: 1.5em, name: <B2>),
			node((1.5, 0.75), text(font: "Noto Sans", [(#math.alpha#sub[21]]), radius: 1.5em, name: <B3>),
			node((2, 0.75), text(font: "Noto Sans", [#math.alpha#sub[21])]), radius: 1.5em, name: <B4>),
			node((2.5, 0.75), text(font: "Noto Sans", [#math.circle.filled.big]), radius: 1.5em, name: <B5>),
			node((3.5, 0.75), stroke: 0pt, text(font: "Noto Sans", [#math.dots]), radius: 1.5em, name: <B6>),
			node((4.5, 0.75), text(font: "Noto Sans", [(#math.alpha#sub[2n]]), radius: 1.5em, name: <B7>),
			node((5, 0.75), text(font: "Noto Sans", [#math.alpha#sub[2n])]), radius: 1.5em, name: <B8>),
			node((5.5, 0.75), text(font: "Noto Sans", [nil]), radius: 1.5em, name: <B9>),
		
			edge(<B2>, <B3>, marks: (none, "latex")),
			edge(<B5>, <B6>, marks: (none, "latex")),
			edge(<B6>, <B7>, marks: (none, "latex")),

			edge(<A1>, <B1>, marks: (none, "latex")),
			node((0, 1.5), stroke: 0pt, text(font: "Noto Sans", [#math.dots]), radius: 1.5em, name: <C1>),
			edge(<B1>, <C1>, marks: (none, "latex")),

			
		)]
)

/* How to rebuild the envelope? */

#lemma[
	Given $mu in cal(F)(X)$ a fuzzy set over a universe set $X$,
	$[mu]_(0) = X$.
]
// #proof[
//
// ]

#lemma[
	Let $mu in cal(F)(X)$ be a fuzzy set over a universe set $X$,
	and let $alpha, beta in [0, 1]$. If $alpha < beta$, then
	$[mu]_(alpha) supset.eq [mu]_(beta)$.
]
// #proof[
//
// ]

#lemma[
	Let $mu in cal(F)(X)$ be a fuzzy set over a universe set $X$.
	For any $alpha, beta in [0, 1]$, $inter.big_(alpha: alpha < beta)
	[mu]_(alpha) = [mu]_(beta)$.
]
// #proof[
//
// ]

The *support* of a fuzzy set $mu in cal(F)(X)$ is the (standard) set that
contains all of its members having non-zero degree of membership:

$ S(mu) = [mu]_(underline(0)) = {x in X | mu(x) > 0} $

The *core* of a fuzzy set $mu in cal(F)(X)$ is the (standard) set that
contains all of its members having membership exactly equal to $1$:

$ C(mu) = [mu]_(1) = {x in X | mu(x) = 1} $

The *height* of a fuzzy set $mu in cal(F)(X)$ is the highest degree of
membership obtained by any element of said set:

$ h(mu) = sup_(x in X) {mu(x)} $
