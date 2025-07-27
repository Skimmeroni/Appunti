#import "../Phys4AI_definitions.typ": *

The charge of an object is measured in *Coulomb* (symbol $coulomb$); the
fundamental charge is equal to:

$ e = num(1.60E-19) coulomb $

The electrostatic force that exists between two point-like charged objects
can be quantified by a formula, known as *Coulomb's Law*:

$ F_(1 "on" 2) = F_(2 "on" 1) = frac(1, 4 pi epsilon_(0)) frac(abs(q_(1)) abs(q_(2)), r^(2)) $

Where $q_(1)$ and $q_(2)$ are the charges of the two particles, $r$ is
the distance between them and $epsilon_(0)$ is a constant, known as the
*permittivity of free space*. Its value is:

$ epsilon_(0) = num(8.85E-12) coulomb^(2) slash newton metre^(2) $

Since $4 pi$ is itself constant, the expression $1 slash 4 pi epsilon_(0)$
is itself a constant, called the *electrostatic constant*. Said constant
is sometimes written as $K$, whose value is:

$ K = num(8.99E+9) newton metre^(2) slash coulomb^(2) $

The expression above refers to the magnitude of the electrostatic force.
The vectors of the electrostatic force are directed along the line joining
the two charges: they are repulsive for two charges of the same sign and
attractive for two charges of opposite sign:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ arrow(F)_(1 "on" 2) = frac(1, 4 pi epsilon_(0)) frac(q_(1) q_(2), r^(2)) hat(r)_(1, 2) $],
	[$ arrow(F)_(2 "on" 1) = frac(1, 4 pi epsilon_(0)) frac(q_(1) q_(2), r^(2)) hat(r)_(2, 1) $]
)

Where $hat(r)$ is the vector of length $1$ that matches the direction of
the force with the tail in the target charge and the tip pointing outwards.
Note the absence of the absolute value on the charges: if both charges are
positive or negative, $arrow(F)$ will point outward, since its sign stays
the same. If the charges have different signs, the minus sign will make
$arrow(F)$ point inward. In both cases, this matches the way that positive
and negative charges attract and repel.

#figure(
	caption: [On the left, two positive electric charges push each other
	          away, since their charge is of the same sign. On the right,
	          two negative electric charges push each other away for the
	          same reason. In the middle, a positive and a negative electric
	          charge are drawn closer to each other, since their charge is
	          of the same sign.],
	[#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		[#cetz.canvas({
			import cetz.draw: *
			set-style(
				content: (padding: 3pt),
				stroke: (thickness: 1.25pt),
			)

			circle((0, -1), radius: 0.375, name: "q1", fill: rgb("#ffacab"), stroke: (paint: red))
			circle((2, 1), radius: 0.375, name: "q2", fill: rgb("#ffacab"), stroke: (paint: red))
			content("q1", text(size: 20pt, fill: red, [+]))
			content("q2", text(size: 20pt, fill: red, [+]))
			content("q1", $q_(1)$, anchor: "south-east", padding: 0.3)
			content("q2", $q_(2)$, anchor: "north-west", padding: 0.3)
			line("q1", "q2", stroke: (thickness: 0.75pt, dash: "dashed"))
			content(("q1", 50%, "q2"), $r$, angle: "q2", anchor: "south")
			line("q1", (-1, -2), mark: (end: "stealth"), fill: black)
			line("q2", (3, 2), mark: (end: "stealth"), fill: black)
			content((-1, -2), $arrow(F)_(2 "on" 1)$, anchor: "north-west")
			content((3, 2), $arrow(F)_(1 "on" 2)$, anchor: "south-east")
		})],
		[#cetz.canvas({
			import cetz.draw: *
			set-style(
				content: (padding: 3pt),
				stroke: (thickness: 1.25pt),
			)

			circle((-0.5, -1.5), radius: 0.375, name: "q1", fill: rgb("#ffacab"), stroke: (paint: red))
			circle((2.5, 1.5), radius: 0.375, name: "q2", fill: aqua, stroke: (paint: blue))
			content("q1", text(size: 20pt, fill: red, [+]))
			content("q2", text(size: 20pt, fill: blue, [-]))
			content("q1", $q_(1)$, anchor: "south-east", padding: 0.3)
			content("q2", $q_(2)$, anchor: "north-west", padding: 0.3)
			line("q1", "q2", stroke: (thickness: 0.75pt, dash: "dashed"))
			content(("q1", 50%, "q2"), $r$, angle: "q2", anchor: "south")
			line("q1", (0.5, -0.5), mark: (end: "stealth"), fill: black)
			line("q2", (1.5, 0.5), mark: (end: "stealth"), fill: black)
			content((0.5, -0.5), $arrow(F)_(2 "on" 1)$, anchor: "south-east")
			content((1.5, 0.5), $arrow(F)_(1 "on" 2)$, anchor: "north-west")
		})],
		[#cetz.canvas({
			import cetz.draw: *
			set-style(
				content: (padding: 3pt),
				stroke: (thickness: 1.25pt),
			)

			circle((0, -1), radius: 0.375, name: "q1", fill: aqua, stroke: (paint: blue))
			circle((2, 1), radius: 0.375, name: "q2", fill: aqua, stroke: (paint: blue))
			content("q1", text(size: 20pt, fill: blue, [-]))
			content("q2", text(size: 20pt, fill: blue, [-]))
			content("q1", $q_(1)$, anchor: "south-east", padding: 0.3)
			content("q2", $q_(2)$, anchor: "north-west", padding: 0.3)
			line("q1", "q2", stroke: (thickness: 0.75pt, dash: "dashed"))
			content(("q1", 50%, "q2"), $r$, angle: "q2", anchor: "south")
			line("q1", (-1, -2), mark: (end: "stealth"), fill: black)
			line("q2", (3, 2), mark: (end: "stealth"), fill: black)
			content((-1, -2), $arrow(F)_(2 "on" 1)$, anchor: "north-west")
			content((3, 2), $arrow(F)_(1 "on" 2)$, anchor: "south-east")
		})]
	)]
)

Electrostatic force is no different than any other force, therefore
the superposition principle holds: the net electrostatic force in a
system is given by the sum of the electrostatic forces of the single
components. Superposition also holds between a mixture of electrostatic
and any other forces.

#exercise[
	Three charges $q_(1), q_(2), q_(3)$ are arranged in a triangle at the
	following coordinates: $(0.0 centi metre, 0.0 centi metre)$, $(5.0 centi
	metre, 0.0 centi metre)$, $(0,0 centi metre, 10.0 centi metre)$. Their
	charges are, respectively: $q_(1) = -50 nano coulomb$, $q_(2) = +50
	nano coulomb$, $q_(3) = +30 nano coulomb$. What is the net force
	acting upon the third charge?
]
#solution[
	Since (electrostatic) forces can be superimposed, the resulting force
	acting upon the third charge is the vector sum between the force coming
	from the first charge and the force coming from the second charge.

	The distance from the second charge to the third charge can be obtained
	by applying Pythagoras' Theorem:

	$ r_(2, 3) =
	  sqrt(r_(1, 3)^(2) + r_(1, 2)^(2)) = 
	  sqrt((5.0 centi metre)^(2) + (10.0 centi metre)^(2)) = 
	  sqrt(125.0 centi metre^(2)) approx
	  11.2 centi metre $

	The magnitude of the force acting on the third charge from the first
	charge is given by:

	$ F_(1 "on" 3) = frac(1, 4 pi dot num(8.85E-12) coulomb^(2) slash newton metre^(2))
	        (frac(abs(num(+30E-9) coulomb) dot abs(num(-50E-9) coulomb), 0.100 metre^(2))) =
	        num(+1.35E-3) newton $

	The magnitude of the force acting on the third charge from the second
	charge is given by:

	$ F_(2 "on" 3) = frac(1, 4 pi dot num(8.85E-12) coulomb^(2) slash newton metre^(2))
	        (frac(abs(num(+30E-9) coulomb) dot abs(num(+50E-9) coulomb), 0.112 metre^(2))) =
	        num(+1.08E-3) newton $

	Consider a system of coordinates centered on the third charge. The
	force $arrow(F)_(1 "on" 3)$ points directly downward, since it has
	no component along the $x$-axis and its $y$-component is negative.
	Therefore:

	$ arrow(F)_(1 "on" 3) =
	  arrow(F)_(1 "on" 3, x) + arrow(F)_(1 "on" 3, y) =
	  num(-1.35E-3) hat(j) newton $

	The force $arrow(F)_(2 "on" 3)$ points north-west, since it has
	a negative $x$ component and a positive $y$ component. The angle
	$theta$ between $arrow(F)_(2 "on" 3)$ and the coordinate system is:

	$ theta =
	  arctan(frac("opposite side", "adjacent side")) =
	  arctan(frac(10.0 centi metre, 5.0 centi metre)) =
	  arctan(2.0) approx 63.4 degree $

	Which means that the magnitude of the two components of
	$arrow(F)_(2 "on" 3)$ along the $x$ and $y$ axis are:

	$ F_(2 "on" 3, x) &= cos(theta) F_(2, "on" 3) = cos(63.4 degree) num(+1.08E-3) newton = num(+4.83E-4) newton \
	  F_(2 "on" 3, y) &= sin(theta) F_(2, "on" 3) = sin(63.4 degree) num(+1.08E-3) newton = num(+9.66E-4) newton $

	Which gives:

	$ arrow(F)_(2 "on" 3) =
	  arrow(F)_(2 "on" 3, x) + arrow(F)_(2 "on" 3, y) =
	  num(-4.83E-4) hat(i) newton + num(+9.66E-4) hat(j) newton $

	The net electrostatic force acting upon the third charge is therefore:

	$ arrow(F)_(3) &=
	  arrow(F)_(1 "on" 3) + arrow(F)_(2 "on" 3) =
	  num(-1.35E-3) hat(j) newton - num(+4.83E-4) hat(i) newton + num(+9.66E-4) hat(j) newton = \
	  &= num(-4.83E-4) hat(i) newton num(-3.84E-4) hat(j) newton $

	Of magnitude:

	$ F_(3) = sqrt(F_(3, x)^(2) + F_(3, y)^(2)) =
	  sqrt((num(+4.83E-4) newton)^(2) + (num(+3.84E-4) newton)^(2))
	  = num(+6.20E-4) newton $

	Since both components of the net force are negative, $F_(3)$ points
	south-west. In particular, the angle between $F_(3)$ and the $x$ axis
	is:

	$ phi.alt =
	  arctan(frac("opposite side", "adjacent side")) =
	  arctan(frac(num(+3.84E-4) newton, num(+4.83E-4) newton)) =
	  arctan(0.79) approx 38.5 degree $

	#figure(
		caption: [On the left, a graphical representation of the disposition
		          of the three charges. On the right, the forces acting upon
		          the $q_(3)$ charge.],
		[#grid(
			columns: (0.5fr, 0.5fr),
			[#cetz.canvas({
				import cetz.draw: *
				set-style(
					content: (padding: 3pt),
					stroke: (thickness: 1.25pt),
				)

				circle((0, 0), radius: 0.375, name: "q1", fill: aqua, stroke: (paint: blue))
				circle((2.5, 0), radius: 0.375, name: "q2", fill: rgb("#ffacab"), stroke: (paint: red))
				circle((0, 5), radius: 0.375, name: "q3", fill: rgb("#ffacab"), stroke: (paint: red))
				content("q1", text(size: 20pt, fill: blue, [-]))
				content("q2", text(size: 20pt, fill: red, [+]))
				content("q3", text(size: 20pt, fill: red, [+]))
				line("q1", "q2", stroke: (dash: "dashed"))
				line("q2", "q3", stroke: (dash: "dashed"))
				line("q1", "q3", stroke: (dash: "dashed"))

				content("q1", $q_(1) = -50 nano coulomb$, anchor: "north-east", padding: 0.4)
				content("q2", $q_(2) = +50 nano coulomb$, anchor: "north-west", padding: 0.4)
				content("q3", $q_(3) = +30 nano coulomb$, anchor: "south-east", padding: 0.4)

				content(("q1", 50%, "q2"), $5.0 centi metre$, anchor: "north")
				content(("q2", 50%, "q3"), $11.2 centi metre$, angle: "q2", anchor: "south")
				content(("q1", 50%, "q3"), $10.0 centi metre$, angle: "q3", anchor: "south")
			})],
			[#cetz.canvas({
				import cetz.draw: *
				set-style(
					stroke: (thickness: 1.5pt),
					padding: 0.1
				)

				line((0, 0), (0, 2), mark: (end: "stealth"), stroke: (paint: red, dash: "dashed"), fill: red)
				line((0, 0), (-1, 0), mark: (end: "stealth"), stroke: (paint: red, dash: "dashed"), fill: red)
				line((0, 0), (-1, 2), mark: (end: "stealth"), stroke: (paint: red), fill: red)
				line((0, 0), (0, -2.875), mark: (end: "stealth"), stroke: (paint: blue), fill: blue)
				line((0, 0), (-1, -0.875), mark: (end: "stealth"), stroke: (paint: black), fill: black)
				line((-1, 2), (-1, -0.875), (0, -2.875), stroke: (dash: "dashed"))
				circle((0, 0), fill: white, radius: 0.1)

				content((0, -2.875), $arrow(F)_(1 "on" 3)$, anchor: "north")
				content((-1, 2), $arrow(F)_(2 "on" 3)$, anchor: "south-east")
				content((-1, 0), $arrow(F)_(2 "on" 3, x)$, anchor: "east")
				content((0, 2), $arrow(F)_(2 "on" 3, y)$, anchor: "south")
				content((-1, -0.875), $arrow(F)_(3)$, anchor: "north-east")
				content((0, 0), $q_(3)$, anchor: "north-west")
				content((-0.375, 0.25), $theta$)
				content((-0.625, -0.25), $phi.alt$)
			})],
		)]
	)
]

Coulomb's Law shares some similarities with Newton's Law for gravity:
both have the two properties of the object at the numerator multiplied
together, both are proportional to a constant and both are inversely
proportional to the distance of the two objects. Also, both laws work
assuming that the objects are point-like, meaning that their other
properties (mass, volume, shape, ecc...) are negligible with respect
to their reciprocal distance.

However, while gravity is always an attractive force, electrostatic
force exists both in an attractive and in a repulsive fashion. Also,
the gravitational constant $G$ is much (much) smaller than the
electrostatic constant $K$, meaning that charges and masses of
the same order of magnitude, the electrostatic force is incredibly
stronger than gravity.

#exercise[
	The mass of a proton is $num(1.67E-27) kilo gram$, while the mass
	of an electron is $num(9.11E-31) kilo gram$. What is the ratio
	between the gravitational force between an electron and a proton
	and the electrostatic force between an electron and a proton that
	are $1 metre$ apart? Assume an electron 
]
#solution[
	$ F_(e) &= frac(1, 4 pi dot num(8.85E-12) coulomb^(2) slash newton metre^(2))
	          (frac(abs(num(1.60E-19) coulomb) dot abs(num(1.60E-19) coulomb), 1 metre^(2)))
	        = num(2.30E-28) newton \
	  F_(g) &= num(6.67E-11) metre^(3) kilo gram^(-1) s^(-2)
	          (frac(num(1.67E-27) kilo gram dot num(9.11E-31) kilo gram, 1 metre^(2)))
			= num(1.01E-67) newton $

	Which means that the electrostatic force between the two is greater
	than the gravitational force between the two by a factor of:

	$ frac(F_(e), F_(g)) =
	  frac(num(2.30E-28) newton, num(1.01E-67) newton) approx
	  num(2.27E+39) $
]

It is possible to extend the calculation of the charge of point-like
particles to macroscopic objects. In this case, it makes more sense
to consider the object charged in a continuous rather than a discrete
fashion, since the size of an electron is much smaller than any macroscopic
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

#figure(
	caption: [From left to right, a uniformly distributed charge
	          on a one-dimensional rod, two-dimensional rectangle
	          and three-dimensional sphere.],
	[#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		[#cetz.canvas({
			import cetz.draw: *
			set-style(
				content: (padding: 3pt),
				stroke: (thickness: 1.5pt),
			)

			rect((0.25, 0), (3.75, 0.5), stroke: (paint: blue), fill: aqua)
			for i in (0.5, 1, 1.5, 2, 2.5, 3, 3.5) {
				content((i, 0.25), text(size: 20pt, fill: blue, [-]))				
			}
		})],
		[#cetz.canvas({
			import cetz.draw: *
			set-style(
				content: (padding: 3pt),
				stroke: (thickness: 1.5pt),
			)

			rect((0.25, 0.25), (3.75, 3.25), stroke: (paint: red), fill: rgb("#ffacab"))
			for i in (0.5, 1, 1.5, 2, 2.5, 3, 3.5) {
				for j in (0.5, 1, 1.5, 2, 2.5, 3) {
					content((i, j), text(size: 20pt, fill: red, [+]))
				}
			}
		})],
		[#cetz.canvas({
			import cetz.draw: *
			set-style(
				content: (padding: 3pt),
				stroke: (thickness: 1.5pt),
			)

			circle((0, 0), radius: 1.5, stroke: (paint: blue), fill: aqua)
			circle((0, 0), radius: (1.5, 0.5), stroke: (dash: "dashed", thickness: 0.5pt))
			for i in (-1.25, -0.75, -0.25, 0.25, 0.75, 1.25) {
				content((0, i), text(size: 20pt, fill: blue, [-]))				
			}
			for i in (-1.25, -0.75, -0.25, 0.25, 0.75, 1.25) {
				content((0.5, i), text(size: 20pt, fill: blue, [-]))				
				content((-0.5, i), text(size: 20pt, fill: blue, [-]))				
			}
			for i in (-0.75, -0.25, 0.25, 0.75) {
				content((1, i), text(size: 20pt, fill: blue, [-]))				
				content((-1, i), text(size: 20pt, fill: blue, [-]))				
			}
		})]
	)]
)

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
over distance/area/volume is valid.
