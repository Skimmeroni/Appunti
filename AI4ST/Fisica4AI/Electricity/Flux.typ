#import "../Phys4AI_definitions.typ": *

Consider a uniform electric field of vectors $arrow(E)$ and a
two-dimensional surface $A$, located in space. The orientation
of the surface can be identified by a vector $arrow(A) = arrow(n)
A$, called *area vector* or *surface vector*, where $arrow(n)$ is
a unit vector that is perpendicular to the surface. The surface
can be a physical surface or just a mathematical abstraction. Each
electric field vector $arrow(E)$ forms an angle $theta$ with $arrow(A)$.

#figure(
	caption: [The electric field vector $arrow(E)$ of a uniform electric
	          field traverses a planar surface $A$, forming an angle
	          $theta$ with $arrow(A)$],
	[#cetz.canvas({
		import cetz.draw: *
		set-style(
			content: (padding: 3pt),
			stroke: (thickness: 1.5pt),
		)

    line((0, 0), (-3, 0), (-4, 2), (-1, 2), (0, 0), close: true, fill: silver)
    line((1, 0.5), (3, 0.5), mark: (end: "stealth"), stroke: (paint: fuchsia), fill: fuchsia)
    line((0, 1.5), (2, 1.5), mark: (end: "stealth"), stroke: (paint: fuchsia), fill: fuchsia)
    line((-2, 1), (0, 1), mark: (end: "stealth"), stroke: (paint: fuchsia), fill: fuchsia)
    line((-6, 0.5), (-4, 0.5), mark: (end: "stealth"), stroke: (paint: fuchsia), fill: fuchsia)
    line((-7, 1.5), (-5, 1.5), mark: (end: "stealth"), stroke: (paint: fuchsia), fill: fuchsia)
    line((-2, 1), (-1, 3), mark: (end: "stealth"), fill: black)
    line((-2, 1), (-1.375, 2.25), mark: (end: "stealth"), stroke: (paint: fuchsia), fill: fuchsia)
    line((-2, 1), (-1.625, 0.25), mark: (end: "stealth"), stroke: (paint: fuchsia), fill: fuchsia)

    content((0, 1), $arrow(E)$, anchor: "north-west")
    content((-1.375, 2.25), $E_(perp)$, anchor: "south-east")
    content((-1.625, 0.25), $E_(parallel)$, anchor: "south-west")
    content((-2, 1), $A$, anchor: "south-east")
    content((-1.625, 1.25), $theta$)
    content((-1, 3), $arrow(A)$, anchor: "south-west")
	})]
)

The "amount" of electric field that traverses the surface is directly
proportional to the area of the surface and to the strength of the
electric field, but also depends on how the vectors $arrow(A)$ and
$arrow(E)$ are oriented. In particular, since the surface has two
dimensions and since $arrow(A)$ is always perpendicular to the surface
itself, only the component of $arrow(E)$ that is parallel to $arrow(A)$
(that is perpendicular to $A$) will traverse $A$. It is then possible
to define the *electric flux* as:

$ Phi = arrow(E) dot arrow(A) = E A cos(theta) [frac(newton metre^(2), coulomb)] $

If $theta = 0 degree$, then $cos(theta) = 1$ and therefore the electric
flux is maximum. On the other hand if $theta = 90 degree$, then $cos(theta)
= 0$ and therefore there's no flux.

//Also, $theta$ is defined in such a way
//that a positive charge would induce an electric field for which $0 lt.eq
//theta lt.eq 90 degree$ and a negative charge would induce an electric
//field for which $90 lt.eq theta lt.eq 180$. This means that the sign of
//the flux is the same as the sign of the charge.

The definition can be easily extended to the case of a non-uniform electric
field. The flux for a surface, since it's a scalar, is the sum of the fluxes
of any subsurface that constitutes it. Given a surface $A$ and a non-uniform
electric field $arrow(E)$, consider a partition of $A$ into $N$ sub-surfaces.
Given $Delta A_(i)$ to be one of such sub-surfaces, let $arrow(E)_(i)$ be
the electric field when evaluated at the surface of $Delta A_(i)$. The flux
evaluated at $i$ is:

$ Phi_(i) =
  arrow(E)_(i) dot Delta A_(i) =
  E_(i) Delta A_(i) cos(theta_(i)) $

If the total flux is the sum of each contributing sub-fluxes:

$ Phi =
  sum_(i = 1)^(N) Phi_(i) =
  sum_(i = 1)^(N) arrow(E)_(i) dot Delta arrow(A)_(i) $

Taking the limit as $N -> infinity$ and $Delta arrow(A)_(i) -> 0$:

$ Phi =
  lim_(N -> infinity) sum_(i = 1)^(N) Phi_(i) =
  lim_(N -> infinity) sum_(i = 1)^(N) arrow(E)_(i) dot Delta arrow(A)_(i) =
  integral.double_(S) arrow(E) dot d arrow(A) $

With $S$ being the shape that determines the surface integral. If the
surface is a *Gaussian surface* or *closed surface*, meaning that there's
a distinction between the regions in and out of the surface:

$ Phi = integral.surf_(S) arrow(E) dot d arrow(A) $

If the surface is a planar surface and the electric field is not uniform,
the $arrow(A)$ vector is always the same, but the $arrow(E)$ vector may
not be (both in direction and magnitude). However, the formula does not
impose that the surface ought to be planar: if the surface is arbitrarely
shaped, meaning that $arrow(A)$ varies from point to point, the formula is
just as valid. Not only that, but it doesn't even impose that the surface
has to be two-dimensional, working just as fine for three-dimensional
surfaces.

When the electric field is uniform and the surface is a planar surface,
$E$ can be moved out of the integral, obtaining the expected result:

$ Phi =
  integral.double_(S) arrow(E) dot d arrow(A) =
  integral.double_(S) E cos(theta) d A =
  E cos(theta) integral.double_(S) 1 d A =
  E A cos(theta) $

Consider the case of a uniform electric field and an arbitrarely shaped
surface in two or three dimensions. if the electric field is always
perpendicular (left) or parallel (right) to the area vector:

#grid(
  columns: (0.4fr, 0.6fr),
  [$ Phi =
     integral.double_(S) E cos(90 degree) d A =
     0 $],
  [$ Phi =
     integral.double_(S) E cos(0 degree) d A =
     E integral.double_(S) E d A =
     E A $]
)

These edge cases hint at the fact that the electric flux becomes much
easier to compute if the charge distribution has some symmetry, because
the symmetry of the electric field must match the symmetry of the charge 
distribution.

// Missing key insigths about symmetry

#exercise[
  Consider a cylinder of height $L$ and radius $R$, that contains a
  charge distribution with cylindrical symmetry. A coordinate system
  is put into place such that  the $z$ axis intersects the cylinder
  along its axis. The electric field at distance $r$ from the $z$ axis
  is given by $arrow(E)(r) = E_(0) (r^(2) slash r_(0)^(2)) hat(r)$.
  What is the flux of the cylinder?
]
#solution[
  The cylinder is constituted by three sides, two bases and one wall.
  The total flux is given by the sum of the fluxes computed for each
  side. If the electric field is perpendicular to the wall, it must
  also be parallel to the bases. This means that the contribution to
  the total flux given by the two bases is zero:

  $ Phi = Phi_("top") + Phi_("bottom") + Phi_("wall") =
    0 + 0 + Phi_("wall") = Phi_("wall") $

  The area of the wall of the cylinder is base times length, that is
  $A = 2 pi R L$. Since the electric field is always perpendicular to
  the wall and symmetric with respect to the cylinder and the $z$ axis:

  $ Phi = integral.surf_(S) arrow(E) dot d arrow(A) =
    E A = E_(0) (frac(R^(2), r_(0)^(2))) (2 pi R L) = 
    frac(2 pi R^(3) L E_(0), r_(0)^(2)) $

  //#figure(
  //  caption: [the cylinder],
  //)
]

Consider a point-like charge, "wrapped" inside a sferical surface of radius
$r$ centered in the charge itself. The electric field's direction is radial
to the charge in every point in space, hence the electric field vectors will
be perpendicular to the sphere along its entire area.

// #figure(
//  caption: [A point-like charge centered in the middle of a sferical surface.]
// )

The sphere enclosing the charge is a Gaussian surface. Since the electric 
field is perpendicular to the sphere everywhere:

$ Phi =
  integral.surf_(S) arrow(E) dot d arrow(A) =
  integral.surf_(S) E d A =
  E integral.surf_(S) d A =
  E A =
  4 pi r^(2) E $

But the electric field that traverses the sphere is the one of a point-like
charge, whose expression is a known formula:

$ Phi =
  4 pi r^(2) E =
  cancel(4 pi) cancel(r^(2)) frac(1, cancel(4 pi) epsilon_(0)) frac(q, cancel(r^(2))) =
  frac(q, epsilon_(0)) $

Interestingly, since $r^(2)$ cancels out, the expression of $Phi$ for
a sphere "wrapping" a charge does not depend on the radius of the sphere.
This is reasonable, since no electric field can be created of destroyed and
therefore the amount of electric field that traverses a sphere of radius $r$
must be the same amount that traverses a sphere of radius $r'$.

Furthermore, this result also holds also for surfaces of arbitrary
shape. This is because any shape, no matter how convoluted, can always
be approximated by many spherical sub-surfaces. The entire flux is given
by the sum of the fluxes of each sub-surface, and when such sub-surfaces
are recomposed together they reconstruct a sphere.

// #figure(
//  caption: [An arbitrary shape that contains a charge can be
//            approximated by a spherical shell.]
// )

Therefore, the cumulative fluxes of each sub-surface is the same as the
flux of a spherical surface "wrapping" the charge, which is the newly
found expression:

$ Phi = integral.surf_(S) arrow(E) dot d arrow(A) = frac(q, epsilon_(0)) $

Consider what happens instead to a surface of arbitrary shape that does
not "wrap" a charge, but is instead outside of it. Any such surface can
still be approximated to two concentric spherical surfaces, empty inside.

// #figure(
//  caption: [An arbitrary shape that does not contain a charge can be
//            approximated by two spherical shells.]
// )

The amount of electric fields that traverses one, since the two are both
Gaussian surfaces, must exit the other. In particular, the magnitude of
the flux for the two surfaces is the same, because as stated all spherical
surfaces centered in a charge have the same flux. However, the signs are
opposite, because both surfaces have their area vector pointing outward
and the direction of the electric field is always the same. That is, the
two sub-fluxes cancel out.

The same applies to a situation where there are $n$ charges, some inside
and some outside a surface of arbitrary shape. The electric field in a
given point is given by the sum of the electric field induced by each
charge. Applying the principle of superposition:

$ Phi &= integral.surf_(S) arrow(E) dot d arrow(A) =
  integral.surf_(S) (arrow(E)_(1) + arrow(E)_(2) + dots + arrow(E)_(n)) dot d arrow(A) =
  integral.surf_(S) arrow(E)_(1) dot d arrow(A) +
  arrow(E)_(2) dot d arrow(A) + dots + arrow(E)_(n) dot d arrow(A) = \
  &= integral.surf_(S) arrow(E)_(1) dot d arrow(A) +
  integral.surf_(S) arrow(E)_(2) dot d arrow(A) + dots +
  integral.surf_(S) arrow(E)_(n) dot d arrow(A) =
  Phi_(1) + Phi_(2) + dots + Phi_(n) $

Where each flux $Phi_(i)$ is either $0$ if the charge outside of
the surface and $q_(i) slash epsilon_(0)$ if the charge is inside of
the surface. This means that:

$ Phi =
  Phi_(1) + Phi_(2) + dots + Phi_(n) =
  sum_(i in "inside") Phi_(i) +
  sum_(j in "outside") Phi_(j) +
  0 + sum_(i in "inside") Phi_(i) =
  sum_(i in "inside") Phi_(i) $

Where $"inside"$ is the subset of all charges that are inside the surface.
Let $Q_("in") = sum_(i in "inside") q_(i)$ be the cumulative charge that
is contained inside the surface. The following:

$ Phi =
  integral.surf_(S) arrow(E) dot d arrow(A) =
  sum_(i in "inside") Phi_(i) =
  sum_(i in "inside") frac(q_(i), epsilon_(0)) =
  frac(sum_(i in "inside") q_(i), epsilon_(0)) =
  frac(Q_("in"), epsilon_(0)) $

Is referred to as *Gauss's Law*. This statement is even more generic than
Coulomb's Law, since it describes a property of any electric field, not
just the ones created by point-like charges.

The usefulness of Gauss's Law isn't necessarely in the law itself, but
rather on what it allows one to achieve. Since the surface with respect
to which a flux is calculated does not have to be a physical surface, but
can also just be a mathematical abstraction, if a surface is chosen with
care it is possible to compute the electric field of non-trivial charge
distributions with ease, especially if the charge distribution is symmetric.

=== Electric field outside a sphere of charge

Consider a sphere of charge $Q$ of radius $R$, where said charge is
distributed with spherical symmetry (it does not have to be uniform).
The interest is in finding the strength and direction of the electric
field in its surroundings.

Gauss's Law states that the flux for any Gaussian surface that contains
the same amount of charge is always the same. This means that the flux
of the sphere is the same of the flux any surface that "wraps" the sphere
and that does not contain any additional charges. 

/*
#figure(
  caption: [A sphere of charge, "wrapped" inside another empty sphere.],
  [cetz...]
)
*/

Clearly, the simplest choice for a "wrapping" surface is another sphere
(empty) of radius $r$ that is concentric with the sphere of charge. If
the inner sphere has spherical symmetry with respect to the charge, the
outer sphere will behave the same. Since the amount of charge in the two
spheres is the same:

$ Phi_("outer") =
  frac(Q + Q_("outer"), epsilon_(0)) =
  frac(Q + 0, epsilon_(0)) =
  frac(Q, epsilon_(0)) =
  Phi $

The electric field of the outer sphere is perpendicular to the sphere in
any point, since it is assumed to have spherical symmetry. Therefore:

$ Phi =
  integral.surf_(S) arrow(E) dot d arrow(A) =
  integral.surf_(S) E d arrow(A) =
  E integral.surf_(S) d arrow(A) =
  E A =
  4 pi r^(2) E $

Equating the two expressions:

$ frac(Q, epsilon_(0)) = 4 pi R^(2) E =>
  E = frac(1, 4 pi r^(2) epsilon_(0)) frac(Q, r^(2)) $

This expression is precisely the electric field generated by a point-like
charge at distance $r$. This means that a sphere whose charge is distributed
with spherical symmetry behaves no differently, at least outside of its
boundaries, than a point-like charge.

Also, the radius of the sphere of charge is not present in the expression,
only the radius of the outer sphere is. This means that the electric field
outside a sphere of charge, whose charge is distributed with spherical
symmetry, only depends on the amount of charge and on the spacial distance.

=== Electric field inside a sphere of charge

Consider a sphere of charge $Q$ of radius $R$, where said charge is
uniformly distributed. The interest is in finding the strength and
direction of the electric field in a point inside the sphere.

Consider any sphere or radius $r lt.eq R$ concentric with the sphere
of charge. If the main sphere has sferical distribution symmetry, this
inner sphere will behave the same.

/*
#figure(
  caption: [A sphere of charge inside another sphere of charge.],
  [cetz...]
)
*/

Applying Gauss's Law to the two spheres:

#grid(
  columns: (0.5fr, 0.5fr),
  [$ Phi_("inner") = frac(Q_("inner"), epsilon_(0)) = 4 pi r^(2) E $],
  [$ Phi = frac(Q, epsilon_(0)) = 4 pi R^(2) E $]
)

Note that $Phi_("inner") != Phi$, since the amounts of
charge $Q_("inner")$ and $Q$ are not the same (unless $r = R$).
Also, $Q_("inner")$ is not even known. However, since the charge
is assumed to be uniformly distributed, the volume charge density
is the same for both spheres:

$ rho =
  frac(Q, V) =
  frac(Q_("inner"), V_("inner")) =>
  frac(Q, cancel(frac(4, 3) pi) R^(3)) =
  frac(Q_("inner"), cancel(frac(4, 3) pi) r^(3)) =>
  frac(Q, R^(3)) = frac(Q_("inner"), r^(3)) =>
  Q_("inner") = Q frac(r^(3), R^(3)) $

Substituting in the previous expression:

$ frac(Q_("inner"), epsilon_(0)) = 4 pi r^(2) E =>
  E = frac(1, 4 pi epsilon_(0)) frac(Q_("inner"), r^(2)) =
  frac(1, 4 pi epsilon_(0)) frac(Q frac(r^(cancel(3)), R^(3)), cancel(r^(2))) =
  frac(1, 4 pi epsilon_(0)) frac(Q, R^(3)) r $

Which means that the intensity of the electric field in an inner sphere
of charge decreases linearly with distance.

#figure(
  caption: [Strength of the electric field inside a charged sphere. The
            strength increases with the radius until it reaches the boundary
            of the outer sphere, and then decreases.],
  [#image("sphere.svg", width: 75%)]
)

=== Electric field of an infinitely long rod

Consider an infinitely long rod, uniformly charged with charge
density $lambda$. The interest is in finding the strength and
direction of the electric field in a point in the surroundings
of the rod. This can be done by considering, as Gaussian surface,
a cylinder of length $L$ and radius $r$ that completely envelopes
a portion of the rod and is concentric with the cross section of
the rod.

/*
#figure(
  caption: [An infinitely extended plane of charge intersected by a cylinder.],
  [cetz...]
)
*/

The electric field is parallel to the bases of the cylinder and
perpendicular to the wall. Therefore:

$ Phi =
  Phi_("top") + Phi_("bottom") + Phi_("wall") =
  0 + 0 + E A =
  2 pi r L E $

The flux of the cylinder is also equal, by Gauss's Law, to
$Q_("inside") slash epsilon_(0)$, with $Q_("inside")$ being
the amount of charge that is enclosed by the cylinder. Equating
the two expressions:

$ Phi = 2 pi r L E = frac(Q_("inside"), epsilon_(0)) =>
  E = frac(Q_("inside"), 2 pi r L epsilon_(0)) $

The quantity $Q_("inside")$ is not known, but being the charge of
the rod uniformly distributed, $lambda = Q_("inside") slash L$.
Substituting:

$ E = frac(lambda cancel(L), 2 pi r cancel(L) epsilon_(0)) =
  frac(lambda, 2 pi r epsilon_(0)) $

Interestingly, the Gaussian surface of choice did not envelope the
entirety of the charge distribution (being infinite), but was still
sufficient to compute the electric field. Moreover, the fact that the
rod is infinite was instrumental to the mathematical derivation: if
the rod were of finite length, the electric field would not have been
perpendicular to the wall of the cylinder, hence $Phi != 2 pi r L E$.

=== Electric field of a infinite planar surface

Consider an infinitely wide planar surface, uniformly charged with charge
density $eta$. The interest is in finding the strength and direction of
the electric field in a point in the surroundings of the plane. This can
be done by considering, as Gaussian surface, a cylinder that perpendicularly
intersects the plane, so that half of the cylinder is found on each side.

/*
#figure(
  caption: [An infinitely extended plane of charge intersected by a cylinder.],
  [cetz...]
)
*/

The electric field is perpendicular to the bases of the cylinder and
parallel to the wall. Therefore, the flux through the wall is $0$ and
the flux through each base is $Phi_(b) = E A$, with $A$ being the
area of one base. The electric field traversing the two bases does so
in opposite direction, since the area vectors of the two bases are
facing each other, therefore the two fluxes add up instead of cancelling
out. This means that the total flux through the cylinder is $Phi =
2 Phi_(b) = 2 E A$.

The electric flux through the cylinder is also $Q_("inside") slash
epsilon_(0)$, with $Q_("inside")$ being the amount of charge enclosed
by the section of the cylinder. Equating the two expressions:

$ Phi = 2 E A = frac(Q_("inside"), epsilon_(0)) =>
  E = frac(Q_("inside"), 2 A epsilon_(0)) $

The quantity $Q_("inside")$ is not known, but being the charge of
the plane uniformly distributed, $eta = Q_("inside") slash A$.
Substituting:

$ E = frac(Q_("inside"), 2 A epsilon_(0)) =
  frac(eta cancel(A), 2 cancel(A) epsilon_(0)) =
  frac(eta, 2 epsilon_(0)) $
