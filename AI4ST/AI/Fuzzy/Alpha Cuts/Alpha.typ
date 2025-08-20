#import "../../AI_definitions.typ": *

The vertical representation of fuzzy sets presents some issues, mainly
that storing fuzzy sets encoded as functions in a computer would be both
impractical and inefficient. Also, manipulating fuzzy sets (computing
intersections, unions, ecc...) becomes cumbersome. For these reasons,
the vertical representation should be limited to illustration purposes.

Given a universe set $U$ and a fuzzy set $mu in cal(F)(U)$, let $alpha$
be any number between $0$ and $1$. The subset $[mu]_(alpha) = {x in U |
mu(x) gt.eq alpha}$ is referred to as the $alpha$*-level set* of $mu$,
or $alpha$*-cut* of $mu$. That is, the $alpha$-cut of a fuzzy set is the
subset that contains all the elements having degree of membership greater
or equal than $alpha$. By definition, $[mu]_(0)$ is just the entire universe.

In a similar fashion, the subset $[mu]_(underline(alpha)) = {x in U |
mu(x) > alpha}$ is referred to as the *strict* $alpha$*-level set* of
$mu$, or *strict* $alpha$*-cut* of $mu$.

$alpha$-cuts are used in the *horizontal representation* of fuzzy sets,
that consists in picking a subset of $alpha$-cuts and drawing only those,
instead of the entire function. Each $alpha$-cut is represented as a
straight line of height $[mu]_(alpha)$.

#exercise[
	What would be the horizontal representation of the fuzzy set with the
	following membership function?

	$ mu(x) = cases(x - 1 & "if" 1 lt.eq x < 2,
	                -frac(3, 8) x + frac(7, 4) & "if" 2 lt.eq x < 4,
	                frac(1, 8) x - frac(1, 4) & "if" 4 lt.eq x < 6,
	                frac(1, 2) & "if" 6 lt.eq x < 7,
	                -frac(1, 2) x + 4 & "if" 7 lt.eq x < 8,
	                0 & "otherwise") $

	As $alpha$ use $0, 0.15, 0.30, 0.45, 0.60, 0.75, 0.90$.
]
#solution[
	#figure(
		caption: [The $alpha$-cuts of the given fuzzy set. The membership
		          function is drawn as a dashed line.],
		[#image("alpha.svg", width: 66%)]
	)
]

$alpha$-cuts of convex fuzzy sets are peculiar because they are always
convex sets. On the other hand, $alpha$-cuts of non-convex fuzzy sets
may be a union of more than one disjointed interval. It is also possible
to use this property as a definition: a fuzzy set is convex if and only
if all of its $alpha$-cuts are convex sets.

$alpha$-cuts can uniquely identify fuzzy sets. By definition, the degree
of membership $mu(x)$ of an element $x$ is the highest possible value of
$alpha$ giving an $alpha$-cut that contains $x$:

$ mu(x) = sup{alpha in [0, 1] | x in [mu]_(alpha)} $

Of course, actually storing all possible $alpha$-cuts of a fuzzy
set would be no improvement over storing the expression of the entire
membership function. However, discretizing the set of all $alpha$-cuts
into a subset ${[mu]_(alpha_(1)), [mu]_(alpha_(2)), dots, [mu]_(alpha_(k))}$
is sufficient to approximate the entire fuzzy set:

$ mu(x) approx max{alpha in {alpha_(1), alpha_(2), dots, alpha_(k)} | x in [mu]_(alpha)} $

Formally speaking, given a certain number of $alpha$-cuts, the original
membership function can be reconstructed by taking the _upper envelope_
of said cuts. Both the number of $alpha$ values and which values to choose
are decided arbitrarely (more values, better precision). A common choice
is $0.25, 0.50, 0.75, 1$.

/* How to rebuild the envelope? */

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

#theorem("Representation theorem")[
	Given $mu in cal(F)(U)$ a fuzzy set over a universe set $U$:

	$ [mu]_(0) = sup_(alpha in [0, 1]) {min(alpha, chi_([mu]_(alpha))(x))},
	  space "where" chi_([mu]_(alpha))(x) =
	  cases(1 & "if" x in [mu]_(alpha), 0 & "otherwise") $
]
// #proof[
//
// ]

#lemma[
	Let $mu in cal(F)(U)$ be a fuzzy set over a universe set $U$,
	and let $alpha, beta in [0, 1]$. If $alpha < beta$, then
	$[mu]_(alpha) supset.eq [mu]_(beta)$.
]
// #proof[
//
// ]

#lemma[
	Let $mu in cal(F)(U)$ be a fuzzy set over a universe set $U$.
	For any $alpha, beta in [0, 1]$, $inter.big_(alpha: alpha < beta)
	[mu]_(alpha) = [mu]_(beta)$.
]
// #proof[
//
// ]
