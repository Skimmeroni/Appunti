#import "../Phys4AI_definitions.typ": *

Modelling electrostatic interaction as a force is fine for simpler
situations. However, the model falls short for more complex scenarios.
For example, consider a charge in motion: according to the force model,
a second charge that is under the influence of the first should have
the force acting upon it change istantaneously. This should happed no
matter what their distance is, even if were to be the diameter of
the entire Universe. This raises the question on how can two quantities
change across time and space with no delay.

A different approach is modelling electrostatic interaction as particles
under the influence of a *field*. A field is physical quantity that
originates from a particle, called the _source_, and that extends and
spreads its influence across all space. A field is said to _mediate_ the
action of a force, meaning that a particle that comes into contact with
the field experiences the effect of the force "through" the field. This
way, the interaction between a particle and the force remains local,
since the field "propagates" the effect of the force from the source
to the target. Furthermore, it's not difficult to imagine this propagation
to take a finite time, in constrast to the supposed istantaneous effect
of a changing force.

In mathematics, a field describes a function that assigns a vector to every
point in space. In physics, a field conveys the idea that a physical entity
exists, not necessarely to the same degree, in every point in space. It's
possible to construct a field for any force: for example, gravity has its
own field, the _gravitational field_; a mass that comes into contact with
the gravitational field experiences the gravitational force of the source
(another mass) that induced it. The gravitational field exists across all
space, but it's stronger the closer to the source.

The *electric field* is the field produced by a point-like charge
other charges that come into contact with the field experience the
electrostatic force that the charge that created it is exerting upon
them. Let $q$ be the charge that generates the field and let $q'$ be
the charge that comes into contact with said field, called the *probe
charge*; the electric field that it experiences is:

$ arrow(E) = frac(arrow(F)_("onto" q'), q') =
  frac(1, 4 pi epsilon_(0)) frac(q cancel(q'), cancel(q') r^(2)) hat(r)_(q, q') =
  frac(1, 4 pi epsilon_(0)) frac(q, r^(2)) hat(r)_(q, q') [frac(newton, coulomb)] $

$arrow(E)$ is a vector, and can be manipulated like any other vector
can. Its magnitude $E$ is also referred to as the _intensity_ or the
_strength_ of the electric field:

$ E = frac(F_("onto" q'), q') = frac(1, 4 pi epsilon_(0)) frac(abs(q), r^(2)) [frac(newton, coulomb)] $

Since the direction of $hat(r)_(q, q')$ is always the same, the direction
of the electric field entirely depends on the charge of the source: if the
source is positively charged, the field is directed outwards (sign does
not change), if the source is negatively charged, the field is directed
inwards (sign is flipped). This means that the force $arrow(F)_("onto" q')
= q' arrow(E)$ that the field is propagating onto $q'$ might not have the
same direction as $arrow(E)$.

Stated otherwise, if the strength of the electric field at a point in
space is $arrow(E)$, a particle with charge $q'$ experiences an electric
force $arrow(F)_("onto" q') = q' arrow(E)$. In particular, the force on
a positive charge is in the direction of the field, whereas the force
on a negative charge is opposite the direction of the field.

Being the magnitude of the electric force inversely proportional to the
square of the distance between the charges, the strength of the electric
field is also inversely proportional to the distance between the source
and the probe. Placing a probe charge further and further away from the
source gives a weaker and weaker effect of the (mediated) electrostatic
force, as expected.

An electric field is often represented graphically using the so-called
*field diagram*. A field diagram contains some of the vectors that
constitute the electric field in space. Their amount and length should
match the properties of the electric field: denser and longer patches
close to the charge and lighter and shorter patches away from the
charge. Clearly, since an electric field permeates the entire space,
it's not possible to draw it in its entirety.

#figure(
	caption: [On the left, the field diagram of a positive charge, with
	          the electric field pointing outward. On the right, the
	          field diagram of a negative charge, with the electric field
	          pointing inward. Of course, only a handful of vector are
	          drawn. The tail of each vector, not its head, represents the
	          point in space in which the electric field is computed.],
	[#grid(
		columns: (0.5fr, 0.5fr),
		[#cetz.canvas({
			import cetz.draw: *
			set-style(
				content: (padding: 3pt),
				stroke: (thickness: 1.25pt),
			)

			circle((0, 0), radius: 0.375, name: "q", fill: rgb("#ffacab"), stroke: (paint: red))
			content("q", text(size: 20pt, fill: red, [+]))
			line((0, 1), (0, 3), mark: (end: "stealth"), stroke: (paint: red), fill: red)
			line((0, -1), (0, -3), mark: (end: "stealth"), stroke: (paint: red), fill: red)
			line((1, 0), (3, 0), mark: (end: "stealth"), stroke: (paint: red), fill: red)
			line((-1, 0), (-3, 0), mark: (end: "stealth"), stroke: (paint: red), fill: red)

			circle((0, 1), radius: 0.1, fill: white)
			circle((0, -1), radius: 0.1, fill: white)
			circle((1, 0), radius: 0.1, fill: white)
			circle((-1, 0), radius: 0.1, fill: white)
			
			line((-1, -1), (-2, -2), mark: (end: "stealth"), stroke: (paint: red), fill: red)
			line((1, -1), (2, -2), mark: (end: "stealth"), stroke: (paint: red), fill: red)
			line((-1, 1), (-2, 2), mark: (end: "stealth"), stroke: (paint: red), fill: red)
			line((1, 1), (2, 2), mark: (end: "stealth"), stroke: (paint: red), fill: red)

			circle((-1, -1), radius: 0.1, fill: white)
			circle((1, -1), radius: 0.1, fill: white)
			circle((-1, 1), radius: 0.1, fill: white)
			circle((1, 1), radius: 0.1, fill: white)
		})],
		[#cetz.canvas({
			import cetz.draw: *
			set-style(
				content: (padding: 3pt),
				stroke: (thickness: 1.25pt),
			)

			circle((0, 0), radius: 0.375, name: "q", fill: aqua, stroke: (paint: blue))
			content("q", text(size: 20pt, fill: blue, [-]))

			line((0, 1), (0, 3), mark: (start: "stealth"), stroke: (paint: blue), fill: blue)
			line((0, -1), (0, -3), mark: (start: "stealth"), stroke: (paint: blue), fill: blue)
			line((1, 0), (3, 0), mark: (start: "stealth"), stroke: (paint: blue), fill: blue)
			line((-1, 0), (-3, 0), mark: (start: "stealth"), stroke: (paint: blue), fill: blue)

			circle((0, 3), radius: 0.1, fill: white)
			circle((0, -3), radius: 0.1, fill: white)
			circle((3, 0), radius: 0.1, fill: white)
			circle((-3, 0), radius: 0.1, fill: white)

			line((-1, -1), (-2, -2), mark: (start: "stealth"), stroke: (paint: blue), fill: blue)
			line((1, -1), (2, -2), mark: (start: "stealth"), stroke: (paint: blue), fill: blue)
			line((-1, 1), (-2, 2), mark: (start: "stealth"), stroke: (paint: blue), fill: blue)
			line((1, 1), (2, 2), mark: (start: "stealth"), stroke: (paint: blue), fill: blue)

			circle((-2, -2), radius: 0.1, fill: white)
			circle((2, -2), radius: 0.1, fill: white)
			circle((-2, 2), radius: 0.1, fill: white)
			circle((2, 2), radius: 0.1, fill: white)
		})]
	)]
)

Despite appearing in the equation for the electric field, the probe
charge $q'$ does not influence the strength of the field in any way.
The field is created by a source, not by the probe charge. The probe
charge is only used to "probe" (hence the name) the strength of the
electric field in the point in space in which it is found. One can
immagine "mapping" the entire space moving the probe charge around
and computing the strength of the field in each coordinate.

Note that the probe charge is itself a charge, and can itself act as
a source of an electric field. One should assume that the charge of
the probe charge is so negligible in comparison to the charge of the
source that the probe does not influence the source in any meaningful
way. Also, just like a mass does not feel its own weight, a charge does
not feel its own electric field, only others charges' ones.

#exercise[
	A $num(-1.0E-9) coulomb$ charged particle is located at the origin.
	Points $1$, $2$, and $3$ have coordinates $(1 centi metre, 0 centi
	metre)$, $(0 centi metre, 1 centi metre)$, and $(1 centi metre, 1
	centi metre)$, respectively. What is the electric field (magnitude
	and direction) in these three points?
]
#solution[
	Point $1$ and point $2$ dist $1 centi metre$ from the source of the
	electric field, while point $3$ dists $sqrt((1 centi metre)^(2) +
	(1 centi metre)^(2)) = sqrt(2) centi metre$ from the source. The
	values of the electric field in the three points are:

	$ arrow(E)_(1) &=
	  frac(1, 4 pi epsilon_(0)) frac(q, r^(2)_(1)) hat(r)_(1) =
	  frac(1, 4 pi dot num(8.85E-12) coulomb^(2) slash newton metre^(2))
	  frac(num(-1.0E-9) coulomb, (num(+1.0E-2) metre)^(2)) hat(r)_(1) =
	  num(-9.0E+4) newton slash coulomb hat(r)_(1) \
	  arrow(E)_(2) &=
	  frac(1, 4 pi epsilon_(0)) frac(q, r^(2)_(2)) hat(r)_(2) =
	  frac(1, 4 pi dot num(8.85E-12) coulomb^(2) slash newton metre^(2))
	  frac(num(-1.0E-9) coulomb, (num(+1.0E-2) metre)^(2)) hat(r)_(2) =
	  num(-9.0E+4) newton slash coulomb hat(r)_(2) \
	  arrow(E)_(3) &=
	  frac(1, 4 pi epsilon_(0)) frac(q, r^(2)_(3)) hat(r)_(3) =
	  frac(1, 4 pi dot num(8.85E-12) coulomb^(2) slash newton metre^(2))
	  frac(num(-1.0E-9) coulomb, (num(+1.4E-2) metre)^(2)) hat(r)_(3) =
	  num(-4.5E+4) newton slash coulomb hat(r)_(3) $

	The first and second particle lie on the $x$ and $y$ axis,
	respectively. The third particle forms and angle with the
	$x$ axis equal to $theta = arctan(1 slash 1) = 45 degree$.
	Separating the two components:

	$ E_(3, x) = E_(3, y) =
	  sin(theta) norm(arrow(E)_(3)) =
	  sin(45 degree) dot num(4.5E+4) newton slash coulomb approx
	  num(3.2E+4) newton slash coulomb $

	Therefore:

	#grid(
		columns: (0.27fr, 0.27fr, 0.46fr),
		[$ arrow(E)_(1) = num(-9.0E+4) newton slash coulomb hat(i) $],
		[$ arrow(E)_(2) = num(-9.0E+4) newton slash coulomb hat(j) $],
		[$ arrow(E)_(3) = num(-3.2E+4) newton slash coulomb hat(i) num(-3.2E+4) newton slash coulomb hat(j) $]
	)

	#figure(
		caption: [The electric field under examination.],
		[#cetz.canvas({
			import cetz.draw: *
			set-style(
				content: (padding: 3pt),
				stroke: (thickness: 1.25pt),
			)

			circle((0, 0), radius: 0.375, name: "q", fill: aqua, stroke: (paint: blue))
			circle((4, 0), radius: 0.125, name: "p1", fill: white)
			circle((0, 4), radius: 0.125, name: "p2", fill: white)
			circle((4, 4), radius: 0.125, name: "p3", fill: white)
			content("q", text(size: 20pt, fill: blue, [-]))

			line("p1", ("q", 50%, "p1"), stroke: (paint: blue), mark: ("end": "stealth"), fill: blue, name: "E1")
			line("p2", ("q", 50%, "p2"), stroke: (paint: blue), mark: ("end": "stealth"), fill: blue, name: "E2")
			line("p3", ("q", 75%, "p3"), stroke: (paint: blue), mark: ("end": "stealth"), fill: blue, name: "E3")

			line("E1.end", "q", stroke: (dash: "dashed"))
			line("E2.end", "q", stroke: (dash: "dashed"))
			line("E3.end", "q", stroke: (dash: "dashed"))

			content(("p1", 25%, "q"), $arrow(E)_(1)$, anchor: "south")
			content(("p2", 25%, "q"), $arrow(E)_(2)$, angle: "p2", anchor: "south")
			content(("p3", 12.5%, "q"), $arrow(E)_(3)$, angle: "p3", anchor: "south")
		})]
	)
]

Like forces, electric fields obey the principle of superposition: if $n$
electrostatic forces $arrow(F)_(1 "on" q'), dots, arrow(F)_(n "on" q')$
are acting upon a charge $q$, the net force is the vector sum of all
forces $arrow(F)_("on" q')$. Each force is mediated by its own electric
field $arrow(E)_(1), dots, arrow(E)_(n)$, and the net electric field
$arrow(E)$ is:

$ arrow(E) = frac(arrow(F)_("on" q'), q') =
  frac(sum_(i = 1)^(n) arrow(F)_(i "on" q'), q') =
  frac(arrow(F)_(1 "on" q'), q') + dots +
  frac(arrow(F)_(n "on" q'), q') =
  arrow(E)_(1) + dots + arrow(E)_(n) = sum_(i = 1)^(n) arrow(E)_(i) $

Two equal but opposite charges separated by a small distance form an
*electric dipole*. An electric dipole can be _permanent_, if the charges
are kept at a distance by another force (such as in polar molecules) or
it can be _induced_ if created by an external electric field (the dipole
stops existing when the external field is removed).

An electric dipole has net zero electric charge, since the two opposing
forces cancel out. However, its electric field is not necessarely zero:
closer to the positive charge there's a positive electric field, closer
to the negative charge there's a negative electric field.

Suppose that an electric dipole constituted by two charges $+q$ and
$-q$ is centered on the $y$ axis, with the positive charge at coordinates
$(0, +s slash 2)$ and the negative charge at coordinates $(0, -s slash 2)$.
Consider a point in space $(0, y)$: this point dists $y + s slash 2$ from
the negative charge and $y - s slash 2$ from the positive charge. Since
only the $y$ axis is being considered, there's only a $y$ component and
no $x$ component. The electric field of the dipole in $(0, y)$ is:

$ arrow(E)_(y) &=
  arrow(E)_(y+) + arrow(E)_(y-) =
  frac(1, 4 pi epsilon_(0)) frac(q, (y - frac(1, 2) s)^(2)) +
  frac(1, 4 pi epsilon_(0)) frac(-q, (y + frac(1, 2) s)^(2)) =
  frac(q, 4 pi epsilon_(0)) (frac(1, (y - frac(1, 2) s)^(2)) - frac(1, (y + frac(1, 2) s)^(2))) = \
  &= frac(q, 4 pi epsilon_(0)) (frac((y + frac(1, 2) s)^(2) - (y - frac(1, 2) s)^(2), (y - frac(1, 2) s)^(2)(y + frac(1, 2) s)^(2))) = 
  frac(q, 4 pi epsilon_(0)) (frac(cancel(y^(2)) + cancel(frac(1, 4) s^(2)) + s y - cancel(y^(2)) - cancel(frac(1, 4) s^(2)) + s y, (y - frac(1, 2) s)^(2)(y + frac(1, 2) s)^(2))) = \
  &= frac(q, 4 pi epsilon_(0)) (frac(2 s y, (y - frac(1, 2) s)^(2)(y + frac(1, 2) s)^(2))) $

In general, the distance between the two charges of the dipole is
negligible with respect to the distance between the dipole and the
point in space in which to compute the electric field. Therefore,
$y plus.minus s slash 2 approx y$:

$ arrow(E)_(y) =
  frac(q, 4 pi epsilon_(0)) (frac(2 s y, (y - frac(1, 2) s)^(2)(y + frac(1, 2) s)^(2))) 
  approx frac(q, 4 pi epsilon_(0)) (frac(2 s cancel(y), y^(cancel(2))y^(2))) =
  frac(1, 4 pi epsilon_(0)) (frac(2 q s, y^(3))) $

This is also referred to as the _far field_ of the dipole.

The expression can rewritten in a more compact form by introducing the
*dipole moment* $arrow(p) = q s arrow(h)$, where $arrow(h)$ is a unit
vector that goes from the negative to the positive charge. $arrow(h)$
gives the orientation of the dipole and the dipole moment magnitude
$q s$ determines the electric field strength. Substituting this
expression in the previous one gives:

$ arrow(E)_(y) = - frac(1, 4 pi epsilon_(0)) (frac(2 arrow(p), r^(3))) $

Where $r$ is the distance from the point in space to the center of the
dipole. Note that the electric field generated by the dipole has the
same orientation as the dipole moment.

#figure(
	caption: [An electric dipole. The net charge is zero, but the
	          net electric field is not.],
	[#cetz.canvas({
		import cetz.draw: *
		set-style(
			content: (padding: 3pt),
			stroke: (thickness: 1.25pt),
		)

		line((0, 4), (0, -4), stroke: (thickness: 1pt, dash: "dashed"))
		line((-2, 0), (2, 0), stroke: (thickness: 1pt, dash: "dashed"))

		circle((0, 2), radius: 0.375, name: "q1", fill: rgb("#ffacab"), stroke: (paint: red))
		circle((0, -2), radius: 0.375, name: "q2", fill: aqua, stroke: (paint: blue))
		content("q1", text(size: 20pt, fill: red, [+]))
		content("q2", text(size: 20pt, fill: blue, [-]))

		line((2, 0), (2, -2), mark: (end: "stealth"), fill: black)
		line((2, 0), (3, -1), mark: (end: "stealth"), stroke: (paint: red), fill: red)
		line((2, 0), (1, -1), mark: (end: "stealth"), stroke: (paint: blue), fill: blue)
		line((-2, 0), (-3, -1), mark: (end: "stealth"), stroke: (paint: red), fill: red)
		line((-2, 0), (-1, -1), mark: (end: "stealth"), stroke: (paint: blue), fill: blue)
		line((-2, 0), (-2, -2), mark: (end: "stealth"), fill: black)
		line((0, 4), (0, 3.5), mark: (end: "stealth"), stroke: (paint: blue), fill: blue)
		line((0, 4), (0, 5.5), mark: (end: "stealth"), stroke: (paint: red), fill: red)
		line((0, 4), (0, 5), mark: (end: "stealth"), fill: black)
		line((0, -4), (0, -2.5), mark: (end: "stealth"), stroke: (paint: blue), fill: blue)
		line((0, -4), (0, -4.5), mark: (end: "stealth"), stroke: (paint: red), fill: red)
		line((0, -4), (0, -3), mark: (end: "stealth"), fill: black)
		circle((0, 4), radius: 0.125, fill: white)
		circle((-2, 0), radius: 0.125, fill: white)
		circle((2, 0), radius: 0.125, fill: white)
		circle((0, -4), radius: 0.125, fill: white)

		content((3, -1), $E_(+)$, anchor: "north")
		content((2, -2), $E$, anchor: "north")
		content((1, -1), $E_(-)$, anchor: "north")
		content((-3, -1), $E_(+)$, anchor: "north")
		content((-2, -2), $E$, anchor: "north")
		content((-1, -1), $E_(-)$, anchor: "north")
		content((0, 3.5), $E_(-)$, anchor: "west")
		content((0, 5.5), $E_(+)$, anchor: "west")
		content((0, 5), $E$, anchor: "east")
		content((0, -2.5), $E_(-)$, anchor: "east")
		content((0, -4.5), $E_(+)$, anchor: "east")
		content((0, -3), $E$, anchor: "west")
	})]
)

Drawing the electric field vectors is one of the possible graphical
representations of the electric field. Another way, especially useful
when multiple charges are involved at once, is to draw the so-called
*electric field lines*. Electric field lines are continuous never
intersecting curves tangent to the electric field vectors, that
start on positive charges and end on negative charges. The number of
lines drawn is arbitrary, but should to some extent match the strength
of the electric field: a region of space where the electric field is
strong should contain more lines that a region of space where the
electric field is weak.

#figure(
	caption: [The electric field lines of an electric dipole. Each line
	          is tangent in every point to the electric field vectors.],
	[#cetz.canvas({
		import cetz.draw: *
		set-style(
			content: (padding: 3pt),
			stroke: (thickness: 1.25pt),
		)

		hobby((-1, 0), (0, -0.25), (1, 0))
		hobby((-1, 0), (0, 0.25), (1, 0))
		hobby((-1, 0), (0, 0.75), (1, 0))
		hobby((-1, 0), (0, -0.75), (1, 0))
		hobby((-1, 0), (0, 1.25), (1, 0))
		hobby((-1, 0), (0, -1.25), (1, 0))
		hobby((-1, 0), (0, 2), (1, 0))
		hobby((-1, 0), (0, -2), (1, 0))

		hobby((-1, 0), (-2, -0.25), (-3, -0.75))
		hobby((-1, 0), (-2, 0.25), (-3, 0.75))
		hobby((-1, 0), (-2, 0.75), (-3, 2))
		hobby((-1, 0), (-2, -0.75), (-3, -2))

		hobby((1, 0), (2, -0.25), (3, -0.75))
		hobby((1, 0), (2, 0.25), (3, 0.75))
		hobby((1, 0), (2, 0.75), (3, 2))
		hobby((1, 0), (2, -0.75), (3, -2))

		circle((-1, 0), radius: 0.375, name: "q1", fill: rgb("#ffacab"), stroke: (paint: red))
		circle((1, 0), radius: 0.375, name: "q2", fill: aqua, stroke: (paint: blue))
		content("q1", text(size: 20pt, fill: red, [+]))
		content("q2", text(size: 20pt, fill: blue, [-]))
	})]
)

Having calculated the electric field of point-like particles, it is
possible to extend what has been said to macroscopic objects. When
studying the charge of such objects, it makes more sense to consider
the object charged in a continuous rather than a discrete fashion,
since the size of an electron is much smaller than any macroscopic
distance.

For one-dimensional, two-dimensional and three-dimensional objects,
it's possible to relate the total amount of charge $Q$ that they
contain and the amount of space that they occupy. The *linear charge
density*, *surface charge density* and *volume charge density* are
defined as:

#grid(
	columns: (0.33fr, 0.33fr, 0.33fr),
	[$ lambda = frac(Q, L) $],
	[$ eta = frac(Q, A) $],
	[$ rho = frac(Q, V) $]
)

Where $L$, $A$ and $V$ are defined, respectively, as the length of a
one-dimensional object, the surface of a two-dimensional object and
the volume of a three-dimensional object. Of course, the equations
assume that the ratio of total charge by length/area/volume is the
same across the entire object, otherwise there would be a spacial
dependency of sort. That is, the equations assume that the charge is
_uniformly distributed_ across the object.

/*
#figure(
	caption: [From left to right, a uniformly distributed charge
	          on a one-dimensional rod, two-dimensional rectangle
	          and three-dimensional sphere.],
	#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		[],
		[],
		[]
	)
)
*/

To compute the charge of a uniformly-distributed object, the
standard method is to divide the total charge $Q$ into a large
amount of small and identical "sub-charges" $Delta Q_(1), Delta
Q_(2), dots, Delta Q_(N)$. If all those charges are summed together,
they reconstruct the original charge. This is allowed because the
object is assumed to be uniformly charged: partitioning the object
in any equally-sized $N$ "sub-objects" will assign an equal amount
of "sub-charge" to each "sub-object". When $N -> infinity$ and
$Delta Q_(i) -> 0$:

$ Q = lim_(Delta Q -> 0) sum_(i = 1)^(+infinity) Delta Q_(i) = integral_("object") d Q $

Where the expression under the integral and the surface of integration
depend on the shape of the object at hand.

Consider a uniformly charged one-dimensional rod of length $L$. Suppose
that its extremes are located at coordinates $0$ and $L$ and its total
charge is $Q$. It's possible to partition the rod into $N$ sub-rods of
length $d x$, each having charge $Delta Q$ proportional to the linear
charge density $lambda$, that is $Delta Q = lambda Delta x$. Summing
up all $lambda Delta x$, one reconstructs the charge of the entire rod.
With $N -> infinity$ and $Delta Q -> 0$:

$ Q = lim_(Delta Q -> 0) sum_(i = 1)^(infinity) Delta Q =
      lim_(Delta x -> 0) sum_(i = 1)^(infinity) lambda Delta x =
      lim_(Delta x -> 0) lambda sum_(i = 1)^(infinity) Delta x =
      lambda integral_(0)^(L) d x $

Where $lambda$ can be moved out of the integral since being constant does
not depend on $x$. The expression can also be extended to the case of a
non-uniform charge, meaning that $lambda$ depends on $x$, as long as the
expression of $lambda$ is known.

This approach is possible because the charge is replaced with the charge
density. Integrals are mathematical operators that manipulate objects in
a system of coordinates; since electric charge is a scalar quantity,
integrating over charge is meaningless. On the other hand, integrating
over distance/area/volume is not.

The approach used to compute the charge of an object can be employed for
computing the electric field generated by an object.

=== Electric field of a charged rod

Consider a charged rod of length $L$, whose charges are uniformly
distributed along its length. Suppose that the rod is placed along
the $y$ axis of an hypothetical system of coordinates, and that the
$x$ axis bisects the rod in two sub-rods of length $L slash 2$.

Consider a point $P$ on the $x$ axis at coordinates $(x, 0)$. The
electric field in $P$ is the superposition of the electric fields
generated by each charge that constitutes the rod. The rod can be
partitioned into $N$ infinitesimally small sub-rods, each modelled
as a point-like source with charge $Delta Q = lambda Delta y = 
(Q slash L) Delta y$.

#figure(
	caption: [An electrically charged rod of length $L$, whose charge is
	          uniformly distributed. The point $P$ dists $r$ from the middle
	          of the rod and $r_(i)$ from the $i$-th sub-rod, forming an angle
	          $theta_(i)$. The electric field can either point inward (blue)
	          or outward (red) depending on the sign of the source charge.],
	[#cetz.canvas({
		import cetz.draw: *
		set-style(
			content: (padding: 3pt),
			stroke: (thickness: 1.5pt),
		)

		line((0, 2.5), (5, 2.5), stroke: (thickness: 1pt), mark: (end: "stealth"), fill: black)
		line((0.25, -1), (0.25, 6), stroke: (thickness: 1pt), mark: (end: "stealth"), fill: black)

		rect((0, 0), (0.5, 5), fill: white)
		rect((0, 4), (0.5, 4.5), fill: gradient.linear(red, blue, angle: 0deg))

		content((0, 0), $L slash 2$, anchor: "north-east")
		content((0, 5), $-L slash 2$, anchor: "south-east")
		content((5, 2.5), $x$, anchor: "south-west")
		content((0, 6), $y$, anchor: "south-east")
		line((-0.25, 2.5), (-0.25, 4.25), stroke: (thickness: 1pt), mark: (start: "|", end: "|"), name: "yi")
		line((0.75, 4), (0.75, 4.5), stroke: (thickness: 1pt), mark: (start: "|", end: "|"), name: "deltay")
		content(("yi.start", 50%, "yi.end"), angle: "yi.end", $y_(i)$, anchor: "south")
		content(("deltay.start", 50%, "deltay.end"), angle: "deltay.start", $Delta y$, anchor: "south")
		circle((4, 2.5), radius: 0.05, fill: black)
		line((4, 2.5), (0.25, 4.25), stroke: (dash: "dashed", thickness: 1pt), name: "ri")
		content(("ri.start", 50%, "ri.end"), angle: "ri.start", $r_(i)$, anchor: "south")
		content((4, 2.5), $P$, anchor: "north-east")
		content((3, 2.5), $theta_(i)$, anchor: "south-east")

		line("ri.start", ("ri.start", 25%, "ri.end"), mark: (end: "stealth"), stroke: (dash: "dashed", paint: blue), fill: blue)
		line("ri.start", ("ri.end", 125%, "ri.start"), mark: (end: "stealth"), stroke: (dash: "dashed", paint: red), fill: red)
	})]
)

The distance from the $i$-th charge and $P$ is $r_(i)$, which forms
an angle $theta_(i)$ with the $x$ axis. The $i$-charge dists $y_(i)$
from the origin. The electric field induced by the $i$-th charge is:

$ arrow(E)_(i) = frac(1, 4 pi epsilon_(0)) frac(Delta Q, r_(i)^(2)) arrow(r)_(i) $

The cumulative electric charge is given by summing all contributions:

$ arrow(E) = sum_(i = 1)^(N) arrow(E)_(i) =
  sum_(i = 1)^(N) frac(1, 4 pi epsilon_(0)) frac(Delta Q, r_(i)^(2)) arrow(r)_(i) =
  frac(1, 4 pi epsilon_(0)) sum_(i = 1)^(N) frac(Delta Q, r_(i)^(2)) arrow(r)_(i) $

Each $arrow(E)_(i)$ has both an $x$ and a $y$ component. However, the $y$
component of $arrow(E)_(i)$ has the same magnitude but opposite sign of
the $y$ component of $arrow(E)_(-i)$, the $i$-th charge on the other side
of the $x$ axis. This means that only the $x$ component is actually relevant.
Therefore:

$ arrow(E) =
  sum_(i = 1)^(N) arrow(E)_(i) cos(theta_(i)) + arrow(E)_(i) sin(theta_(i)) =
  sum_(i = 1)^(N) arrow(E)_(i) cos(theta_(i)) + 0 =
  frac(hat(i), 4 pi epsilon_(0)) sum_(i = 1)^(N) frac(Delta Q, r_(i)^(2)) cos(theta_(i)) $

$r_(i)$ is the hypothenuse of the triangle formed with $y_(i)$ and
$x$, therefore $r_(i)^(2) = y_(i)^(2) + x^(2)$. For the same reason,
$cos(theta_(i)) = x slash r_(i)$. Substituting:

$ arrow(E) =
  frac(hat(i), 4 pi epsilon_(0)) sum_(i = 1)^(N) frac(Delta Q, y_(i)^(2) + x^(2)) frac(x, sqrt(y_(i)^(2) + x^(2))) =
  frac(hat(i), 4 pi epsilon_(0)) sum_(i = 1)^(N) frac(x Delta Q, (y_(i)^(2) + x^(2))^(3 slash 2)) $

Substituting $Delta Q$ with $(Q slash L) Delta y$:

$ arrow(E) =
  frac(hat(i), 4 pi epsilon_(0)) sum_(i = 1)^(N) frac(x Delta Q, (y_(i)^(2) + x^(2))^(3 slash 2)) =
  frac(hat(i), 4 pi epsilon_(0)) sum_(i = 1)^(N) frac(x Q Delta y, L (y_(i)^(2) + x^(2))^(3 slash 2)) =
  frac(Q hat(i), 4 pi epsilon_(0) L) sum_(i = 1)^(N) frac(x Delta y, (y_(i)^(2) + x^(2))^(3 slash 2)) $

By imposing $N -> infinity$, then each segment $Delta y$ becomes
the infinitesimally small segment $d y$, while the discrete position
$y_(i)$ is superseded by the continuous integration variable $y$. The
terms of summation $i = 1$ and $i = N$ are superseded by the extremes
of integration $y = -L slash 2$ and $y = L slash 2$:

$ arrow(E) =
  frac(Q hat(i), 4 pi epsilon_(0) L) lim_(N -> infinity) sum_(i = 1)^(N) frac(x Delta y, (y_(i)^(2) + x^(2))^(3 slash 2)) =
  frac(Q hat(i), 4 pi epsilon_(0) L) integral_(-L slash 2)^(L slash 2) frac(x d y, (y^(2) + x^(2))^(3 slash 2)) $

Solving the integral:

$ arrow(E)
  &= frac(Q hat(i), 4 pi epsilon_(0) L) integral_(-L slash 2)^(L slash 2) frac(x d y, (y^(2) + x^(2))^(3 slash 2)) =
     frac(x Q hat(i), 4 pi epsilon_(0) L) integral_(-L slash 2)^(L slash 2) frac(1, (y^(2) + x^(2))^(3 slash 2)) d y = \
  &= frac(x Q hat(i), 4 pi epsilon_(0) L) [frac(y, x^(2) sqrt(y^(2) + x^(2)))]^(L slash 2)_(-L slash 2) = 
     frac(x Q hat(i), 4 pi epsilon_(0) L) (frac(L slash 2, x^(2) sqrt((L slash 2)^(2) + x^(2))) - frac(-L slash 2, x^(2) sqrt((L slash 2)^(2) + x^(2)))) = \
  &= frac(cancel(x) Q hat(i), 8 pi epsilon_(0) L x^(cancel(2))) (frac(L, sqrt((L slash 2)^(2) + x^(2))) + frac(L, sqrt((L slash 2)^(2) + x^(2)))) =
     frac(Q hat(i), 8 pi epsilon_(0) cancel(L) x) frac(2 cancel(L), sqrt((L slash 2)^(2) + x^(2))) = \
  &= frac(hat(i), 4 pi epsilon_(0)) frac(Q, x sqrt((L slash 2)^(2) + x^(2))) $

As long as one considers a point along the perpendicular axis of the rod,
the choice of the coordinate system is irrelevant. Therefore, the coordinate
$x$ can be substituted with the distance $r$ from $P$ to the centre of the
rod:

$ arrow(E) = frac(1, 4 pi epsilon_(0)) frac(Q, r sqrt((L slash 2)^(2) + r^(2))) hat(i) $

In the limiting case of a point that is far enough from the rod that its
length becomes negligible, the rod should behave like a single point charge
concentrated in its centre. Imposing $L -> 0$:

$ lim_(L -> 0) arrow(E) =
  lim_(L -> 0) frac(1, 4 pi epsilon_(0)) frac(Q, r sqrt((L slash 2)^(2) + r^(2))) hat(i) =
  frac(1, 4 pi epsilon_(0)) frac(Q, r sqrt((0 slash 2)^(2) + r^(2))) hat(i) =
  frac(1, 4 pi epsilon_(0)) frac(Q, r sqrt(r^(2))) hat(i) =
  frac(1, 4 pi epsilon_(0)) frac(Q, r^(2)) hat(i) $

Which is precisely the expression of the electric field of a point-like
particle. This also implies that, as expected, a point infinitely far
away from the rod should experience no electric field.

Another limiting case of interest is the one where the rod is infinitely
long. Taking the limit as $L -> infinity$:

$ lim_(L -> infinity) arrow(E) =
  lim_(L -> infinity) frac(1, 4 pi epsilon_(0)) frac(Q, r sqrt((L slash 2)^(2) + r^(2))) hat(i) =
  frac(1, 4 pi epsilon_(0)) frac(Q, r sqrt(infinity^(2) + r^(2))) hat(i) =
  frac(1, 4 pi epsilon_(0)) frac(Q, infinity) hat(i) = 
  frac(hat(i), 4 pi epsilon_(0)) dot 0 = 0 $

This is reasonable, since an infinitely long rod "spreads out" the charge
along its length, to the point where the electric field becomes negligible.

However, consider the case of a rod that is extended to infinity while
maintaining the charge density constant. Factoring out $(L slash 2)^(2)$:

$ arrow(E) &=
  frac(1, 4 pi epsilon_(0)) frac(Q, r sqrt((L slash 2)^(2) + r^(2))) hat(i) =
  frac(1, 4 pi epsilon_(0)) frac(Q, r sqrt((L slash 2)^(2) (1 + 4 r^(2) slash L^(2)))) hat(i) =
  frac(1, 4 pi epsilon_(0)) frac(Q, r (L slash 2) sqrt((1 + 4 r^(2) slash L^(2)))) hat(i) = \
  &= frac(1, 4 pi epsilon_(0)) frac(2 Q, r L sqrt((1 + 4 r^(2) slash L^(2)))) hat(i) =
  frac(1, 4 pi epsilon_(0)) frac(2 lambda, r sqrt((1 + 4 r^(2) slash L^(2)))) hat(i) $

Taking the limit as $L -> infinity$:

$ lim_(L -> infinity) arrow(E) =
  lim_(L -> infinity) frac(1, 4 pi epsilon_(0)) frac(2 lambda, r sqrt((1 + 4 r^(2) slash L^(2)))) hat(i) =
  frac(1, 4 pi epsilon_(0)) frac(2 lambda, r sqrt((1 + 4 r^(2) slash infinity^(2)))) hat(i) =
  frac(1, 4 pi epsilon_(0)) frac(2 lambda, r) hat(i) $

In this limiting case, the electric field is everywhere parallel to the
$x$ axis. Unlike a point charge, for which the electric field decreases
quadratically with the distance, the electric field of infinitely long
charged rod decreases linearly.

=== Electric field of a charged ring

Consider a two-dimensional empty ring of radius $R$, whose charge is
uniformly distributed along its perimeter. Suppose that a system of
coordinates is fixed so that the center of the ring is in the origin
and the ring lies on the $x, y$ plane.

Consider a point $P$ on the $z$ axis at coordinates $(0, 0, z)$. The
electric field in $P$ is the superposition of the electric fields
generated by each charge that constitutes the ring. The ring can
be partitioned into $N$ infinitesimally small arcs, each modelled
as a point-like source with charge $Delta Q = lambda Delta y = 
(Q slash L) Delta y$.

#figure(
	caption: [An electrically charged ring of length $r$, whose charge is
	          uniformly distributed. The point $P$ dists $r$ from any point
	          on the ring, forming an angle $theta$. The electric field can
	          either point inward (blue) or outward (red) depending on the
	          sign of the source charge.],
	[#cetz.canvas({
		import cetz.draw: *
		set-style(
			content: (padding: 3pt),
			stroke: (thickness: 1.5pt),
		)

		circle((0, 0), radius: (1.5, 2), name: "ring1")
		circle((0, 0), radius: (1.25, 1.75), fill: white, name: "ring2")
		line((name: "ring2", anchor: 10deg), (name: "ring1", anchor: 10deg), (name: "ring1", anchor: 30deg), (name: "ring2", anchor: 30deg), (name: "ring2", anchor: 10deg), fill: gradient.linear(red, blue, angle: 90deg))
		line((0, 0), ((name: "ring2", anchor: 20deg), 50%, (name: "ring1", anchor: 20deg)), name: "midpoint")

		line((0, -3), (0, 3), stroke: (thickness: 1pt), mark: (end: "stealth"), fill: black)
		line((-5, 2), (5, -2), stroke: (thickness: 1pt), mark: (end: "stealth"), fill: black, name: "z")
		line((-5, 0), (5, 0), stroke: (thickness: 1pt), mark: (end: "stealth"), fill: black)
		line(("z.start", 90%, "z.end"), "midpoint.end", stroke: (dash: "dashed"), name: "r")	
		content((5, 0), $x$, anchor: "south-west")
		content((0, 3), $y$, anchor: "south-west")
		content((5, -2), $z$, anchor: "north-west")
		content(("midpoint.start", 50%, "midpoint.end"), $R$, angle: "midpoint.end", anchor: "south")
		content(("r.start", 50%, "r.end"), $r$, angle: "r.start", anchor: "south")
		circle(("z.start", 90%, "z.end"), radius: 0.05, fill: black)
		content(("z.start", 90%, "z.end"), $P$, anchor: "north-east")
		content(("z.start", 75%, "z.end"), $theta$, anchor: "south-west")
		line("r.start", ("r.start", 25%, "r.end"), mark: (end: "stealth"), stroke: (dash: "dashed", paint: blue), fill: blue)
		line("r.start", ("r.end", 125%, "r.start"), mark: (end: "stealth"), stroke: (dash: "dashed", paint: red), fill: red)
	})]
)

The distance from the $i$-th charge and $P$ is $r_(i)$, which forms
an angle $theta_(i)$ with the $x$ axis. The $i$-charge dists $y_(i)$
from the origin. The electric field induced by the $i$-th charge is:

$ arrow(E)_(i) = frac(1, 4 pi epsilon_(0)) frac(Delta Q, r_(i)^(2)) arrow(r)_(i) $

The cumulative electric charge is given by summing all contributions:

$ arrow(E) = sum_(i = 1)^(N) arrow(E)_(i) =
  sum_(i = 1)^(N) frac(1, 4 pi epsilon_(0)) frac(Delta Q, r_(i)^(2)) arrow(r)_(i) =
  frac(1, 4 pi epsilon_(0)) sum_(i = 1)^(N) frac(Delta Q, r_(i)^(2)) arrow(r)_(i) $

Each $arrow(E)_(i)$ has an $x$, $y$ and $z$ component. However, the
$x$ and $y$ components of $arrow(E)_(i)$ cancel out with the $x$ and
$y$ components of $arrow(E)_(-i)$. This means that only the $z$ component
is actually relevant. Therefore:

$ arrow(E) =
  sum_(i = 1)^(N) arrow(E)_(i) cos(theta_(i)) =
  frac(hat(k), 4 pi epsilon_(0)) sum_(i = 1)^(N) frac(Delta Q, r_(i)^(2)) cos(theta_(i)) $

Where $theta_(i)$ is the angle between $r_(i)$ and the $x, y$ plane.
$P$ forms with the ring a cone of which it is the tip and having the
ring as its base. By definition, this means that both the distance between
$P$ and any point on the ring and the angle formed with the $x, y$ plane
are always the same. Therefore, the $i$ subscript can be dropped:

$ arrow(E) =
  frac(hat(k), 4 pi epsilon_(0)) sum_(i = 1)^(N) frac(Delta Q, r_(i)^(2)) cos(theta_(i)) =
  frac(hat(k), 4 pi epsilon_(0)) sum_(i = 1)^(N) frac(Delta Q, r^(2)) cos(theta) =
  frac(hat(k), 4 pi epsilon_(0)) frac(cos(theta), r^(2)) sum_(i = 1)^(N) Delta Q $

Notice how the sum of all the infinitesimal charges is just the entire
charge itself, which gives:

$ arrow(E) =
  frac(hat(k), 4 pi epsilon_(0)) frac(cos(theta), r^(2)) sum_(i = 1)^(N) Delta Q =
  frac(1, 4 pi epsilon_(0)) frac(cos(theta), r^(2)) Q hat(k) $

$r$ is the hypothenuse of the triangle formed with $R$ and
$z$, therefore $r^(2) = z^(2) + R^(2)$. For the same reason,
$cos(theta) = z slash r$. Substituting:

$ arrow(E) =
  frac(1, 4 pi epsilon_(0)) frac(cos(theta), r^(2)) Q hat(k) =
  frac(1, 4 pi epsilon_(0)) frac(z, sqrt(z^(2) + R^(2)) (z^(2) + R^(2))) Q hat(k) =
  frac(1, 4 pi epsilon_(0)) frac(z Q, (z^(2) + R^(2))^(frac(3, 2))) hat(k) $

From the expression, it is clear that the strength electric field in the
centre of the ring is zero. This is due to the fact that each charge on
the ring cancels the charge on the opposite side. Similarly, the strength
of the electric field if the radius of the ring is extended to infinity
is zero.

Consider the magnitude of the electric field $arrow(E)$. Its derivative is:

$ frac(d, d z) E &=
  frac(d, d z) (frac(1, 4 pi epsilon_(0)) frac(abs(z Q), (z^(2) + R^(2))^(frac(3, 2)))) = 
  frac(abs(Q), 4 pi epsilon_(0)) frac(d, d z) (frac(abs(z), (z^(2) + R^(2))^(frac(3, 2)))) = \
  &= frac(abs(Q), 4 pi epsilon_(0)) frac((frac(d, d z) abs(z)) (z^(2) + R^(2))^(frac(3, 2)) - abs(z) frac(d, d z) (z^(2) + R^(2))^(frac(3, 2)), (z^(2) + R^(2))^(3)) = \
  &= frac(abs(Q), 4 pi epsilon_(0)) frac(frac(z, abs(z)) (z^(2) + R^(2))^(frac(3, 2)) - abs(z) frac(3, 2) sqrt(z^(2) + R^(2)) frac(d, d z) (z^(2) + R^(2)), (z^(2) + R^(2))^(3)) = \
  &= frac(abs(Q), 4 pi epsilon_(0)) frac(frac(z, abs(z)) (z^(2) + R^(2))^(frac(3, 2)) - abs(z) frac(3, cancel(2)) sqrt(z^(2) + R^(2)) cancel(2)z, (z^(2) + R^(2))^(3)) =
     frac(abs(Q), 4 pi epsilon_(0)) frac(z (z^(2) + R^(2))^(frac(3, 2)) - 3 z abs(z)^(2) (z^(2) + R^(2))^(frac(1, 2)), abs(z) (z^(2) + R^(2))^(3)) = \
  &= frac(abs(Q), 4 pi epsilon_(0)) frac(z (z^(2) + R^(2))^(2) - 3 z^(3) (z^(2) + R^(2)), abs(z) (z^(2) + R^(2))^(frac(7, 2))) =
     frac(abs(Q), 4 pi epsilon_(0)) frac(z (z^(2) + R^(2)) - 3 z^(3), abs(z) (z^(2) + R^(2))^(frac(5, 2))) = \
  &= frac(abs(Q), 4 pi epsilon_(0)) frac(z^(3) + z R^(2) - 3 z^(3), abs(z) (z^(2) + R^(2))^(frac(5, 2))) =
     frac(abs(Q), 4 pi epsilon_(0)) frac(z(z^(2) + R^(2) - 3 z^(2)), abs(z) (z^(2) + R^(2))^(frac(5, 2))) = 
     frac(abs(Q), 4 pi epsilon_(0)) frac(z(R^(2) - 2 z^(2)), abs(z) (R^(2) + z^(2))^(frac(5, 2))) $

Setting it to $0$:

$ frac(d, d z) E = 0 =>
  cancel(frac(abs(Q), 4 pi epsilon_(0))) frac(z(R^(2) - 2 z^(2)), abs(z) (R^(2) + z^(2))^(frac(5, 2))) = 0 => 
  frac(z(R^(2) - 2 z^(2)), cancel(abs(z) (R^(2) + z^(2))^(frac(5, 2)))) = 0 => 
  z(R^(2) - 2 z^(2)) = 0 $

The solution $z = 0$ is not valid, but the other solution is:

$ R^(2) - 2 z^(2) = 0 =>
  2 z^(2) = R^(2) =>
  z^(2) = frac(R^(2), 2) => 
  abs(z) = frac(R, sqrt(2)) $

Since the magnitude of a vector cannot be negative, the strength of
the electric field is maximum at $z = plus.minus R slash sqrt(2)$.

=== Electric field of a charged disk

Consider a two-dimensional filled disk of radius $R$, whose charge
is uniformly distributed along its area. Suppose that a system of
coordinates is fixed so that the center of the disk is in the origin
and the ring lies on the $x, y$ plane.

Consider a point $P$ on the $z$ axis at coordinates $(0, 0, z)$. The
electric field in $P$ is the superposition of the electric fields
generated by each charge that constitutes the disk. The disk can
be partitioned into $N$ concentric rings of infinitesimal width.
This way, the electric field in $P$ is the sum of all the contribution
given by each ring.

#figure(
	caption: [An electrically charged disk of length $r$, whose charge is
	          uniformly distributed. The point $P$ dists $r_(i)$ from any
	          point on the $i$-th ring.],
	[#cetz.canvas({
		import cetz.draw: *
		set-style(
			content: (padding: 3pt),
			stroke: (thickness: 1.5pt),
		)

		circle((0, 0), radius: (2, 2.5), name: "out")
		circle((0, 0), radius: (1.5, 2), name: "ringi", fill: gradient.linear(red, blue))
		circle((0, 0), radius: (1.25, 1.75), name: "ring", fill: white)
		line((0, 0), ((name: "ringi", anchor: 20deg), 50%, (name: "ring", anchor: 20deg)), name: "midpoint")
		line((0, 0), (name: "out", anchor: 135deg), name: "radius")

		line((0, -3), (0, 3), stroke: (thickness: 1pt), mark: (end: "stealth"), fill: black)
		line((-5, 2), (5, -2), stroke: (thickness: 1pt), mark: (end: "stealth"), fill: black, name: "z")
		line((-5, 0), (5, 0), stroke: (thickness: 1pt), mark: (end: "stealth"), fill: black)
		content((5, 0), $x$, anchor: "south-west")
		content((0, 3), $y$, anchor: "south-west")
		content((5, -2), $z$, anchor: "north-west")
		content(("midpoint.start", 65%, "midpoint.end"), $r_(i)$, angle: "midpoint.end", anchor: "south")
		content(("radius.start", 45%, "radius.end"), $R$, angle: "radius.start", anchor: "south")
		circle(("z.start", 90%, "z.end"), radius: 0.05, fill: black)
		content(("z.start", 90%, "z.end"), $P$, anchor: "north-east")
		line(("z.start", 90%, "z.end"), "z.end", mark: (end: "stealth"), stroke: (dash: "dashed", paint: red), fill: red)
		line(("z.start", 90%, "z.end"), ("z.start", 80%, "z.end"), mark: (end: "stealth"), stroke: (dash: "dashed", paint: blue), fill: blue)
	})]
)

The contribution given by the $i$-th ring is:

$ arrow(E)_(i) = frac(1, 4 pi epsilon_(0)) frac(z Delta Q_(i), (z^(2) + r_(i)^(2))^(frac(3, 2))) hat(k) $

Where $r_(i)$ is the radius of the $i$-th ring and $Delta Q_(i)$ is the
total charge (uniformly distributed) of the $i$-th ring. The cumulative
electric field in $P$ is therefore:

$ arrow(E) = sum_(i = 1)^(N) arrow(E)_(i) =
  sum_(i = 1)^(N) frac(1, 4 pi epsilon_(0)) frac(z Delta Q_(i), (z^(2) + r_(i)^(2))^(frac(3, 2))) hat(k) =
  frac(z hat(k), 4 pi epsilon_(0)) sum_(i = 1)^(N) frac(Delta Q_(i), (z^(2) + r_(i)^(2))^(frac(3, 2))) $

The charge $Delta Q_(i)$ is equal to $eta Delta A_(i)$, where $Delta
A_(i)$ is the area of the $i$-th ring of infinitesimal width. The width
of such ring is the circumference of the ring, which is $2 pi r_(i)$,
times its "thickness", which is $Delta r$. Therefore, $Delta Q_(i) =
2 pi eta r_(i) Delta r$. Substituting:

$ arrow(E) =
  frac(z hat(k), 4 pi epsilon_(0)) sum_(i = 1)^(N) frac(Delta Q_(i), (z^(2) + r_(i)^(2))^(frac(3, 2))) =
  frac(z hat(k), 4 pi epsilon_(0)) sum_(i = 1)^(N) frac(2 pi eta r_(i) Delta r, (z^(2) + r_(i)^(2))^(frac(3, 2))) =
  frac(eta z hat(k), 2 epsilon_(0)) sum_(i = 1)^(N) frac(r_(i) Delta r, (z^(2) + r_(i)^(2))^(frac(3, 2))) $

By imposing $N -> infinity$, then each width $Delta r$ becomes the
infinitesimally small width $d r$, while the discrete radius $r_(i)$
is superseded by the continuous integration variable $r$. The terms of
summation $i = 1$ and $i = N$ are superseded by the extremes of integration
$r = 0$ and $r = R$:

$ arrow(E) =
  frac(eta z hat(k), 2 epsilon_(0)) sum_(i = 1)^(N) frac(r_(i) Delta r, (z^(2) + r_(i)^(2))^(frac(3, 2))) =
  frac(eta z hat(k), 2 epsilon_(0)) integral_(0)^(R) frac(r d r, (z^(2) + r^(2))^(frac(3, 2))) $

Let $z^(2) + r^(2) = u$. Taking the derivative on both sides gives
$2 r d r = d u$. When $r = 0$, $u$ is equal to $z^(2)$, whereas when
$r = R$ $u$ is equal to $z^(2) + R^(2)$. Performing the substitution:

$ arrow(E) &=
  frac(eta z hat(k), 2 epsilon_(0)) integral_(0)^(R) frac(r d r, (z^(2) + r^(2))^(frac(3, 2))) =
  frac(eta z hat(k), 2 epsilon_(0)) frac(1, 2) integral_(0)^(R) frac(2 r d r, (z^(2) + r^(2))^(frac(3, 2))) =
  frac(eta z hat(k), 4 epsilon_(0)) integral_(0)^(R) (z^(2) + r^(2))^(-frac(3, 2)) 2 r d r = \
  &= frac(eta z hat(k), 4 epsilon_(0)) integral_(z^(2))^(z^(2) + R^(2)) u^(-frac(3, 2)) d u =
  frac(eta z hat(k), 4 epsilon_(0)) [frac(u^(-frac(1, 2)), -frac(1, 2))]_(z^(2))^(z^(2) + R^(2)) =
  frac(eta z hat(k), 4 epsilon_(0)) [frac(-2, sqrt(u))]_(z^(2))^(z^(2) + R^(2)) =
  frac(eta z hat(k), 4 epsilon_(0)) (frac(-2, sqrt(z^(2) + R^(2))) - frac(-2, sqrt(z^(2)))) \
  &= frac(cancel(2) eta z, cancel(4) epsilon_(0)) (frac(1, abs(z)) - frac(1, sqrt(z^(2) + R^(2)))) hat(k) =
  frac(eta, 2 epsilon_(0)) (frac(z, abs(z)) - frac(z, sqrt(z^(2) + R^(2)))) hat(k) $

A limiting case of interest is the one where the point $P$ is so far
away from the disk that the disk behaves like a single point-like charge
concentrated in its centre. When $z -> infinity$, the intensity of the
electric field becomes zero. However, factoring $z^(2)$ out of the square
root and dropping the absolute value:

$ arrow(E) &=
  frac(eta, 2 epsilon_(0)) (frac(z, abs(z)) - frac(z, sqrt(z^(2) + R^(2)))) hat(k) =
  frac(eta, 2 epsilon_(0)) (frac(cancel(z), cancel(z)) - frac(z, sqrt(z^(2)(1 + frac(R^(2), z^(2)))))) hat(k) =
  frac(eta, 2 epsilon_(0)) (1 - frac(cancel(z), cancel(z) sqrt((1 + frac(R^(2), z^(2)))))) hat(k) = \
  &= frac(eta, 2 epsilon_(0)) (1 - frac(1, sqrt(1 + frac(R^(2), z^(2))))) hat(k) =
  frac(eta, 2 epsilon_(0)) (1 - (1 + frac(R^(2), z^(2)))^(-frac(1, 2))) hat(k) $

Applying the binomial approximation:

$ arrow(E) &=
  frac(eta, 2 epsilon_(0)) (1 - (1 + frac(R^(2), z^(2)))^(-frac(1, 2))) hat(k) approx
  frac(eta, 2 epsilon_(0)) (1 - (1 - frac(1, 2) frac(R^(2), z^(2)))) hat(k) =
  frac(eta, 2 epsilon_(0)) (cancel(1) - cancel(1) + frac(1, 2) frac(R^(2), z^(2))) hat(k) = \
  &= frac(eta R^(2), 4 z^(2) epsilon_(0)) hat(k) =
  frac(Q cancel(R^(2)), pi cancel(R^(2)) 4 z^(2) epsilon_(0)) hat(k) =
  frac(1, 4 pi epsilon_(0)) frac(Q, z^(2)) hat(k) $

Which is the expected result.
