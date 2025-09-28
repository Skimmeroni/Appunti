#import "../Math4AI_definitions.typ": *

Any linear equation, meaning any equation in the following form:

$ a_(1) x_(1) + a_(2) x_(2) + dots + a_(n) x_(n) = b $

Has a geometric representation as an $n$-dimensional hyperplane
in the $n$-dimensional space. That is to say, any $n$-dimensional
tuple $(x_(1), x_(2), dots, x_(n)$ that solves the equation
represents a point in the $n$-dimensional space that lies on the
hyperplane specified by the equation. Another way to frame it is
that any $n$-dimensional vector $underline(x) = (x_(1), x_(2),
dots, x_(n)$ whose components solve the equation has its "tip"
lying on the hyperplane.

If $n = 2$ or $n = 3$, it's possible to draw the hyperplane in a
Cartesian system of coordinates. With $n = 2$, where all vectors
$underline(a)$ and $underline(x)$ belong to $RR^(2)$, the hyperplane
is just a straight line. With $n = 3$, where all vectors $underline(a)$
and $underline(x)$ belong to $RR^(3)$, the hyperplane is a "proper"
plane. Representing a line/plane/hyperplane line using an equation
in the form $a_(1) x_(1) + dots + a_(n) x_(n) = b$ is referred to
as its *Cartesian representation* or *Cartesian form*.

#figure(
	caption: [With $n = 2$, hyperplanes are straight lines. The vector
	          $underline(x_(1))$ identifies a point lying on the straight
	          line in black, the vector $underline(x_(2))$ does not.],
	diagram(
		edge-stroke: 0.75pt,
		spacing: 3em,

		edge((-1, 0), (4.5, 0), marks: (none, "stealth"), label-pos: 1, $x$),
		edge((0, 3), (0, -2.5), marks: (none, "stealth"), label-pos: 1, $y$),
		edge((0, 0), (2, 1), marks: (none, "stealth"), label-pos: 0.85, label-angle: auto, stroke: 1pt + blue, $underline(x)_(1)$),
		edge((0, 0), (2, -0.5), marks: (none, "stealth"), label-pos: 0.9, label-angle: auto, stroke: 1pt + blue, $underline(x)_(2)$),
		edge((1, 2.5), (3.5, -1.25), stroke: 1pt)
	)
)

To substantiate this claim, follow this argument. First consider the
case $b = 0$: the $n$-tuple $(0, 0, dots, 0)$ is obviously a solution to
the equation. Moreover, an expression $a_(1) x_(1) + dots + a_(n) x_(n)$
is nothing more than the scalar product between the vector $underline(a)
= (a_(1), dots, a_(n))^(T)$ and the vector $underline(x) = (x_(1), dots,
x_(n))^(T)$. Since it was assumed that $angle.l underline(a), underline(x)
angle.r = 0$, it must mean that the two are perpendicular. $underline(a)$
is the vector of coordinates, which is always fixed, while $underline(x)$
is the vector of unkowns. To change $underline(x)$ into $underline(x')$
such that $angle.l underline(a), underline(x') angle.r = 0$ still holds,
the only way is to have $underline(x') = k underline(x)$ for some $k in RR$.
Multiplying a vector by a scalar does not change its direction, only its
length, which is why all possible $k underline(x)$ lie on the same hyperplane.

#exercise[
	Consider $n = 2$. What is the equation of the straight line $a_(1) x_(1)
	= a_(2) x_(2) = 0$ that is perpendicular to $underline(a) = vec(-3, -2)$.
]
#solution[
	The straight line has the equation $-3x_(1) -2x_(2) = 0$.

	#figure(
		caption: [Having fixed $underline(a) = vec(-3, -2)$, all possible
				$underline(x_(i))$ that are perpendicular to $underline(a)$
				and include $(0, 0)$ lie on the same straight line.],
		diagram(
			edge-stroke: 0.75pt,
			spacing: 3em,

			edge((-4, 0), (4, 0), marks: (none, "stealth"), label-pos: 1, $x$),
			edge((0, 3), (0, -4), marks: (none, "stealth"), label-pos: 1, $y$),
			edge((-2, 3), (2.5, -3.75), stroke: 1pt),
			edge((0, 0), (-3, -2), marks: (none, "stealth"), label-pos: 1, label-angle: auto, stroke: 1pt + fuchsia, $underline(a)$),
			edge((0, 0), (-1.5, 2.25), marks: (none, "stealth"), label-pos: 1, label-angle: auto, stroke: 1pt + blue, $underline(x_(1))$),
			edge((0, 0), (-1, 1.5), marks: (none, "stealth"), label-pos: 1, label-angle: auto, stroke: 1pt + blue, $underline(x_(2))$),
			edge((0, 0), (0.75, -1.125), marks: (none, "stealth"), label-pos: 1, label-angle: auto, stroke: 1pt + blue, $underline(x_(3))$),
			edge((0, 0), (1.5, -2.25), marks: (none, "stealth"), label-pos: 1, label-angle: auto, stroke: 1pt + blue, $underline(x_(4))$),
			edge((0, 0), (2, -3), marks: (none, "stealth"), label-pos: 1, label-angle: auto, stroke: 1pt + blue, $underline(x_(5))$)
		)
	)
]

Consider now the more general case $b != 0$. Clearly, the tuple $(0, 0,
dots, 0)$ cannot be a solution to the equation. Suppose that the generic
tuple $underline(x)^(p) = (x_(1)^(p), x_(2)^(p), dots, x_(n)^(p))$
is a solution to the equation. This means that:

$ a_(1) x_(1)^(p) + a_(2) x_(2)^(p) + dots + a_(n) x_(n)^(p) = b $

And therefore:

$ a_(1) x_(1) + a_(2) x_(2) + dots + a_(n) x_(n) =
  a_(1) x_(1)^(p) + a_(2) x_(2)^(p) + dots + a_(n) x_(n)^(p) $

Grouping the terms:

$ a_(1) (x_(1) - x_(1)^(p)) + a_(2) (x_(2) - x_(2)^(p)) + dots + a_(n) (x_(n) - x_(n)^(p)) = 0 $

Falling back to the previous case, but with $underline(x) -
underline(x)^(p)$ instead of $underline(x)$. That is, a vector
$underline(x)$ lies on the hyperplane defined by $underline(a)$
and $underline(x)^(p)$ if $angle.l underline(a), underline(x) -
underline(x)^(p) angle.r = 0$. The difference with the $b = 0$ case
is that now, to fully specify an hyperplane, a vector $underline(a)$
and a vector $underline(x)^(p)$ both need to be known: in the $b = 0$
case, choosing $underline(x)^(p) = (0, 0, dots, 0)^(T)$ is guaranteed
to work.

#exercise[
	Consider $n = 2$. What is the equation of the straight line $a_(1) x_(1)
	= a_(2) x_(2) = b$ that is perpendicular to $underline(a) = vec(-3, -2)$
	knowing that $underline(x)^(p) = vec(3, 0.5)$ is a solution?
]
#solution[
	The straight line has the equation $-3(x_(1) - 3) -2(x_(2) - frac(1, 2)) = 0$.

	#figure(
		caption: [Having fixed $underline(a) = vec(-3, -2)$, and $underline(x)^(p)
				= vec(3, 0.5)$, a generic vector $underline(x)$ belongs to the
				straight line specified by $underline(a)$ and $underline(x)^(p)$
				if the vector $underline(x) - underline(x)^(p)$ is perpendicular
				to $underline(a)$],
		diagram(
			edge-stroke: 0.75pt,
			spacing: 3em,

			edge((-4, 0), (4, 0), marks: (none, "stealth"), label-pos: 1, $x$),
			edge((0, 3.5), (0, -3), marks: (none, "stealth"), label-pos: 1, $y$),
			edge((0, 0), (-3, -2), marks: (none, "stealth"), label-pos: 0.9, label-angle: auto, stroke: 1pt + fuchsia, $underline(a)$),
			edge((0, 0), (2, 1), marks: (none, "stealth"), label-pos: 0.85, label-angle: auto, stroke: 1pt, $underline(x)$),
			edge((0, 0), (3, -0.5), marks: (none, "stealth"), label-pos: 0.9, label-angle: auto, stroke: 1pt + lime, $underline(x)^(p)$),
			edge((0, 0), (-3, 0.5), marks: (none, "stealth"), label-pos: 1.25, label-angle: auto, dash: "dashed"),
			edge((0, 0), (-1, 1.5), marks: (none, "stealth"), label-pos: 0.65, label-angle: auto, stroke: 1pt + blue, $underline(x) - underline(x)^(p)$),
			edge((2, 1), (-1, 1.5), dash: "dashed"),
			edge((-3, 0.5), (-1, 1.5), dash: "dashed"),
			edge((0.5, 3.25), (4.5, -2.75), stroke: 1pt)
		)
	)
]

Notice how, for the same hyperplane, an infinite number of possible
Cartesian representation can be given. Multiplying the perpendicular
vector $underline(a)$ by a scalar or choosing any other solution of
the equation as the vector $underline(x)^(p)$ does not change which
hyperplane is being represented.

The cartesian representation is not the only way to represent
an hyperplane. An alternative representation is the *parametric
representation*, or *parametric form*. The parametric representation
of an hyperplane requires a point belonging to the hyperplane (a
vector whose "tip" lies on the hyperplane) and a vector parallel
to the hyperplane.

More specifically, let $underline(v)$ be a vector parallel to an
$n$-dimensional plane, $t in RR$ a real number and $underline(x)^(p)$
a vector representing a point in space that is known to lie to such
plane. The parametric representation of the hyperplane is (the three
expressions are equivalent):

#grid(
	columns: (0.33fr, 0.33fr, 0.33fr),
	$ underline(x) = underline(x)^(p) + underline(v) t $,
	$ vec(x_(1), x_(2), dots.v, x_(n)) =
	  vec(x_(1)^(p), x_(2)^(p), dots.v, x_(n)^(p)) + vec(v_(1), v_(2), dots.v, v_(n)) t $,
	$ cases(x_(1) = x_(1)^(p) + v_(1) t,
	        x_(2) = x_(2)^(p) + v_(2) t,
	        dots.v,
	        x_(n) = x_(n)^(p) + v_(n) t) $
)

With $t$ being the _parameter_ of the representation. This is because, by
moving $underline(x)^(p)$ to the left:

$ vec(x_(1), x_(2), dots.v, x_(n)) - vec(x_(1)^(p), x_(2)^(p), dots.v, x_(n)^(p)) =
  vec(v_(1), v_(2), dots.v, v_(n)) t $

And isolating $underline(v)$:

$ frac(1, t) vec(x_(1) - x_(1)^(p), x_(2) - x_(2)^(p), dots.v, x_(n) - x_(n)^(p)) =
  vec(v_(1), v_(2), dots.v, v_(n)) $

One has that the vector on the left is the vector on the right "scaled"
by $1 slash t$, to which it is parallel by definition. As it was the
case for the Cartesian representation, the same hyperplane has infinitely
many equivalent parametric representations.

#exercise[
	Consider $n = 2$. What is the equation of the straight line $a_(1) x_(1)
	= a_(2) x_(2) = b$ that is parallel to $underline(v) = vec(-3, -2)$
	knowing that $underline(x)^(p) = vec(2, 0.5)$ is a solution?
]
#solution[
	The straight line has the equation
	$display(cases(x_(1) = 2 - 3t, x_(2) = display(frac(1, 2)) -2t))$

	#figure(
		caption: [Having fixed $underline(v) = vec(-3, -2)$, and
		          $underline(x)^(p) = vec(2, 0.5)$, a generic
		          vector $underline(x)$ belongs to the straight
		          line specified by $underline(v)$ and $underline(x)^(p)$
				  if the vector $underline(x) - underline(x)^(p)$ is
				  parallel to $underline(v)$],
		diagram(
			edge-stroke: 0.75pt,
			spacing: 3em,

			edge((-4, 0), (4, 0), marks: (none, "stealth"), label-pos: 1, $x$),
			edge((0, 1), (0, -3.5), marks: (none, "stealth"), label-pos: 1, $y$),
			edge((0, 0), (-3, -2), marks: (none, "stealth"), label-pos: 0.9, label-angle: auto, stroke: 1pt + fuchsia, $underline(v)$),
			edge((0, 0), (2, -0.5), marks: (none, "stealth"), label-pos: 1.1, label-angle: auto, stroke: 1pt + lime, $underline(x)^(p)$),
			edge((0, 0), (0.5, -1.5), marks: (none, "stealth"), label-pos: 1.2, label-angle: auto, stroke: 1pt, $underline(x)$),
			edge((-1, -2.5), (3.5, 0.5), stroke: 1pt),
			edge((-1.5, -1), (0.5, -1.5), dash: "dashed")
		)
	)
]

The Cartesian representation and the parametric representation
can be converted into one another. To obtain the Cartesian
representation of an hyperplane from its parametric representation,
it is sufficient to "substitute away" the parameter $t$. To obtain
the parametric representation from the Cartesian representation,
one of the coordinates of $underline(x)^(p)$ is set to be equal
to $t$ and the other coordinates are solved as a function of $t$.

The solutions to a system of equations are the tuples that solve all
equations at the same time. This means that the solution to a system
of equations where the equations are hyperplanes are the points of
intersection between the hyperplanes, because are the points that
lie on all of them at the same time. Moreover, if the system has no
solution, then the hyperplanes are parallel to each other, since they
have no point of intersection.
