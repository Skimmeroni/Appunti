#import "../Phys4AI_definitions.typ": *

The basis of the ray model of light is the observation that, in
everyday life experience, light travels in straight lines, or
_rays_, that bounce and/or traverse objects that they encounter.

The ray model is an oversimplification, whose range of validity
is confined to the cases where light traverses apertures (lenses,
mirrors, and holes) that are very large compared to its wavelength.
In this case, light (rays) traverses the aperture without disturbance;
if the aperture is shrunk too much, the passage of light would be
distorted beyond the capabilities of the ray model, and phenomena
such as _diffraction_ would emerge.

A *light ray* is defined as an abstract line (does not represent
any actual, phyisical quantity) emitted from a _source_, moving in
the same direction as the electromagnetic field of light. Any narrow
beam of light, no matter how narrow, is actually a bundle of parallel
light rays close together. *Lasers*, even though still constituted by
many parallel light rays, is as good as an approximation can be of
a single, isolated light ray.

Light rays are represented graphically as, as said, straight lines.
However, the light as a ray model presupposes that light beams are
constituted by an infinite number of rays, hence it is not possible
to draw them all. The idea is to draw only a handful of lines, each
consistent with the way the rays are spreading, restricting the focus
to the lines that are actually worth taking into consideration.

The two main ways light rays are drawn is as rays emitted by a source,
going in every direction, or as a bundle of parallel lines moving in the
same direction. Source-like points make sense when dealing with objects
that are close-by, not only actual light sources but also surfaces that
deflect the incoming light to the surroundings. Parallel rays make sense
when dealing with very precise sources like lasers or when dealing with
far away objects, such as stars, whose incoming light is so distant that
the rays arriving at an observer are essentially parallel to each other.

#figure(
	caption: [A point-like source emitting rays in every direction (left)
	          and a beam-like bundle of parallel rays (right)],
	[#grid(
		columns: (0.5fr, 0.5fr),
		[#cetz.canvas({
			import cetz.draw: *
			set-style(content: (padding: 3pt), stroke: (thickness: 1.5pt))
			line((0, 0), (3, 0), mark: (start: "stealth", end: "stealth"), fill: black)
			line((0.5, 1), (2.5, -1), mark: (start: "stealth", end: "stealth"), fill: black)
			line((1.5, 1.5), (1.5, -1.5), mark: (start: "stealth", end: "stealth"), fill: black)
			line((0.5, -1), (2.5, 1), mark: (start: "stealth", end: "stealth"), fill: black)
		})],
		[#cetz.canvas({
			import cetz.draw: *
			set-style(content: (padding: 3pt), stroke: (thickness: 1.5pt), fill: black)
			line((0, 0), (5, 0), mark: (end: "stealth"))
			line((0, 0.5), (5, 0.5), mark: (end: "stealth"))
			line((0, 1), (5, 1), mark: (end: "stealth"))
			line((0, 1.5), (5, 1.5), mark: (end: "stealth"))
			line((0, 2), (5, 2), mark: (end: "stealth"))
		})]
	)]
)

The first phenomena that the ray model of light describes is *reflection*:
light rays that bounce back from surfaces that they come into contact with.
The image of oneself in front of a mirror and the image of the sky mirrored
in the water of a pond are examples of reflection. The act of "seeing"
itself requires reflection: an observed object is actually the light
that it reflected coming into contact with the human eye.

Reflection from a flat, smooth surface, such as a mirror or a piece of
polished metal, is called *specular reflection*. It can be observed
experimentally that any ray of light hitting a surface that induces
specular reflection forms an angle with the normal of the surface (the
perpendicular axis drawn in its middle), called *angle of incidence*,
that is congruent to the angle formed by the reflected ray with the
normal, called *angle of reflection*. It can also be shown that the
incoming (incident) ray and the outgoing (reflected) ray are equiplanar.
This is referred to as the *law of reflection*.

It is customary to graphically represent specular reflection from a
surface in a two-dimensional picture, showing a single ray. This is
because, even though the number of rays is infinite and each ray hits
the reflecting surface in different points across the surface, the
angles of incidence and reflection are the same for all rays.

#figure(
	caption: [A graphical representation of reflection. $theta_(i)$
	          and $theta_(r)$ are the same angle.],
	[#cetz.canvas({
		import cetz.draw: *
		set-style(content: (padding: 3pt), stroke: (thickness: 1.5pt))

		rect((0, -2), (10, -3), fill: aqua, stroke: (thickness: 0pt))

		line((0, -2), (10, -2))
		content((), "threshold", anchor: "south-east")
		line((5, -3), (5, 3), stroke: (dash: "dashed"))
		content((), "normal", angle: 90deg, anchor: "south-east")

		line((1, 2.5), (5, -2), mark: (end: "stealth"), fill: black)
		content((1, 2.5), $P$, anchor: "south-east")
		line((5, -2), (9, 2.5), mark: (end: "stealth"), fill: black)
		content((9, 2.5), $Q$, anchor: "south-west")

		content((5, -2), $O$, anchor: "north-east")
		arc((5, -1.25), start: 90deg, stop: 150deg, radius: 0.5, name: "i")
		arc((5, -1.25), start: 90deg, stop: 30deg, radius: 0.5, name: "r")

		content(("i.start", 50%, "i.end"), angle: "i.start", $theta_(i)$, anchor: "south", padding: 7.5pt)
		content(("r.start", 50%, "r.end"), angle: "r.end", $theta_(r)$, anchor: "south", padding: 7.5pt)
	})]
)

Most forms of reflection are not specular reflection, but *diffuse
reflection*. Under diffuse reflection, the law of reflection still
holds, but each incident light ray (even though all parallel to each
other) is reflected with different angle. Diffuse reflection happens
when the surface that is hit is "rough", meaning that it presents
irregularities whose size is comparable to the wavelength of incident
light. Diffuse reflection is the process that allows most real-world
objects to be visually perceived.

#figure(
	caption: [Diffuse reflection on a bumpy surface.],
	[#cetz.canvas({
		import cetz.draw: *
		set-style(content: (padding: 3pt), stroke: (thickness: 1.5pt))

		line((0, -2), (1, -1.75), (1, -2), (2, -1.75), (2, -2), (3, -1.75), (3, -2),
		     (4, -1.75), (4, -2), (5, -1.75), (5, -2), (6, -1.75), (6, -2), (7, -1.75),
		     (7, -2), (8, -1.75), (8, -2), (9, -1.75), (9, -2), (10, -1.75), (10, -3),
		     (0, -3), (0, -2), fill: aqua, stroke: (thickness: 0pt))

		line((0, -2), (1, -1.75), (1, -2), (2, -1.75), (2, -2), (3, -1.75), (3, -2),
		     (4, -1.75), (4, -2), (5, -1.75), (5, -2), (6, -1.75), (6, -2), (7, -1.75),
		     (7, -2), (8, -1.75), (8, -2), (9, -1.75), (9, -2), (10, -1.75))

		line((1, 2.5), (5, -2), mark: (end: "stealth"), fill: black)
		line((5, -2), (9, 2.5), mark: (end: "stealth"), fill: black)

		line((2, 2.5), (6, -2), mark: (end: "stealth"), fill: black)
		line((6, -2), (0, 0), mark: (end: "stealth"), fill: black)

		line((3, 2.5), (7, -2), mark: (end: "stealth"), fill: black)
		line((7, -2), (6, 2.5), mark: (end: "stealth"), fill: black)

		line((4, 2.5), (8, -2), mark: (end: "stealth"), fill: black)
		line((8, -2), (2.5, 2.5), mark: (end: "stealth"), fill: black)

		line((5, 2.5), (9, -2), mark: (end: "stealth"), fill: black)
		line((9, -2), (10, 1), mark: (end: "stealth"), fill: black)
	})]
)

Light waves travel with speed $c$ in a vacuum, but they slow down as
they pass through transparent materials such as water or glass. The
slowdown is a consequence of interactions between the electromagnetic
field of the wave and the electrons in the material. The speed of light
waves traversing a transparent material is characterized by the material's
*index of refraction* $n$, defined as:

$ n = frac(c, v) = frac("speed of light in a vacuum", "speed of light in the material") $

Clearly, denser materials will have an higher index of refraction, since
there are more electrons with which the light wave will interact, lowering
its speed. Also, the speed of light in a vacuum is as fast as light waves
can go, therefore $n gt.eq 1$; in the one and only case in which light
is moving through a vacuum, $n = 1$.

Since traversing a material slows down a light wave, and since velocity
is wavelength times frequency, one of the two (or both) has to change as
well. For mechanical waves, the frequency is only dependent on the source,
and the same holds for electromagnetic waves; the frequency does not change
as the wave moves from one material to another. This means that only the
wavelength changes.

In particular, consider a light wave that moves from a vacuum to a material
with index of refraction $n$. In the vacuum, its speed is $c = lambda f$;
in the material, its speed is $v = lambda' f'$. Being the two frequencies
the same:

$ v = lambda' f' =>
  frac(c, n) = lambda' f' =>
  frac(cancel(c), n) = lambda' frac(cancel(c), lambda) =>
  frac(1, n) = frac(lambda', lambda) =>
  n = frac(lambda, lambda') $

#figure(
	caption: [When a light wave moves from a media to another, its frequency
	          stays the same, but its wavelength (and speed) changes.],
	[#image("transition.svg", width: 75%)]
)

Another phenomena that is understood in terms of the light as a ray
model is *refraction*. Refraction happens when light, or part of the
light, traverses the source instead of bouncing back, meaning that is
transitions from travelling through a medium to a different medium
#footnote[Note that light is always characterized by the oscillations
of an electromagnetic field, not the traversed medium.]. In general,
refraction happens in tandem with reflection.

When light undergoes refraction, its traversing rays form an angle with
the normal with the surface called *angle of refraction*. The angle of
incidence and the angle of refraction are not equal, as the direction
of the incident light ray and the refracted light ray are not equal.
Again, all rays are refracted on the surface at different points but
with the same angles and the same directions, hence it can be described
by taking into account a single ray.

#figure(
	caption: [A graphical representation of refraction. $theta_(1)$
	          and $theta_(2)$ are different angles.],
	[#cetz.canvas({
		import cetz.draw: *
		set-style(content: (padding: 3pt))

		rect((0, 0), (10, -3), fill: aqua, stroke: (thickness: 0pt))
		content((10, 3), text([index $n_(1)$ \ velocity $v_(1)$]), anchor: "north-east")
		content((0, -3), text([index $n_(2)$ \ velocity $v_(2)$]), anchor: "south-west")

		line((0, 0), (10, 0), stroke: (thickness: 1.5pt))
		content((), "threshold", anchor: "south-east")
		line((6, 3), (6, -3), stroke: (thickness: 1.5pt, dash: "dashed"))
		content((), "normal", angle: 90deg, anchor: "south-west")

		line((1, 2.5), (6, 0), stroke: (thickness: 1.5pt, paint: red), mark: (end: "stealth"), fill: red)
		content((1, 2.5), $P$, anchor: "south-east")
		line((6, 0), (9, -2.5), stroke: (thickness: 1.5pt, paint: red), mark: (end: "stealth"), fill: red)
		content((9, -2.5), $Q$, anchor: "north-west")

		content((6, 0), $O$, anchor: "north-east")
		arc((6, 0.5), start: 90deg, stop: 155deg, radius: 0.5, name: "b")
		arc((6, -0.5), start: 270deg, stop: 320deg, radius: 0.5, name: "d")

		content(("b.start", 50%, "b.end"), angle: "b.start", $theta_(1)$, anchor: "south", padding: 7.5pt)
		content(("d.start", 50%, "d.end"), angle: "d.end", $theta_(2)$, anchor: "north", padding: 7.5pt)
	})]
)

Consider light rays moving from a medium $A$ with index of refraction
$n$ to a medium $B$ with index of refraction $n'$, being refracted. The
direction of the light rays (if they move from medium $A$ to medium $B$
or from $B$ to $A$), are irrelevant. Light will form two angles, the
angle of incidence $theta$ and the angle of refraction $theta'$. These
two angles are related by the following empirical law, called *Snell's
law*:

$ n sin(theta) = n' sin(theta') $

From Snell's law, the following conclusion can be drawn:
 
- When a ray is transmitted into a material with a higher index of
  refraction, it bends _towards_ the normal;
- When a ray is transmitted into a material with a lower index of
  refraction, it bends _away_ from the normal.

Even though Snell's law was devised originally as an empirical law, it
can be derived by assuming an even more fundamental principle: the *Fermat
Principle*. This principle states that light rays, in any circumstance,
always travel along the path that requires the least time to be traversed.

// To derive the Law of Reflection, it is first necessary to describe a property
// of mirror

To derive Snell's law, consider a light ray that moves from a medium to
another. Let $A$ be the starting point (lying in the first medium) and
let $B$ be the arrival point (lying in the second medium). Somewhere
along the space between $A$ and $B$, the ray will reach the boundary
between the two mediums: let $O$ be the crossing point. Assuming the
validity of Fermat's Principle, out of all possible $O$ crossing points
the one of interest is the one that minimizes the time needed for the
ray to go from $A$ to $O$ and from $O$ to $B$.

Let $H$ and $K$ be, respectively, the projections of $A$ and $B$
on the boundary between the two media. Since the speed of light in
a medium is constant, let $v_(1) = c slash n_(1)$ be the speed of
the light ray when traversing the first medium and let $v_(2) =
c slash n_(2)$ be the speed of the light ray when traversing the
second medium. Let $theta_(1)$ and $theta_(2)$ be, respectively,
the angle of incidence and of refraction.

Since the spacial coordinates of $A$ and $B$ are fixed at $(x_(A), y_(A))$
and $(x_(B), y_(B))$ respectively, the length of the segment $overline(H K)$
drawn along the boundary is known: let such length be $L$. The choice of
the $O$ point depends entirely on the choice of the length of the segments
$underline(O H)$ and $underline(O K)$; since the sum of their length is
known to be $L$ and the length of one is $L$ minus the length of the other,
only one of the two length has to be specified. Arbitrarely, let the length
of $underline(O H)$ be the unknown $x$ and let the length of $underline(O K)$
be equal to $L - x$.

#figure(
	caption: [The geometrical setup for deriving the Snell's law.],
	[#cetz.canvas({
		import cetz.draw: *
		set-style(content: (padding: 3pt))

		line((1, 0), (1, 2.5), (6, 0), fill: silver)
		content((1, 2.5), $A$, anchor: "south-east")
		content((1, 0), $H$, anchor: "north")
		line((6, 0), (9, -2.5), (9, 0), fill: silver)
		content((9, -2.5), $B$, anchor: "north-west")
		content((9, 0), $K$, anchor: "south")

		line((0, 0), (10, 0), stroke: (thickness: 1.5pt))
		line((6, 2.5), (6, -2.5), stroke: (thickness: 1.5pt, dash: "dashed"))

		content((6, 0), $O$, anchor: "north-east")
		arc((6, 0.5), start: 90deg, stop: 180deg, radius: 0.5, name: "a")
		arc((6, 0.4), start: 90deg, stop: 155deg, radius: 0.4, name: "b")
		arc((6, -0.5), start: 270deg, stop: 360deg, radius: 0.5, name: "c")
		arc((6, -0.4), start: 270deg, stop: 320deg, radius: 0.4, name: "d")

		content(("b.start", 50%, "b.end"), angle: "b.start", $theta_(1)$, anchor: "south", padding: 7.5pt)
		content(("d.start", 50%, "d.end"), angle: "d.end", $theta_(2)$, anchor: "north", padding: 7.5pt)
	})]
)

The segments $overline(O A)$ and $overline(O B)$ play the role of
the hypothenuse for the right angle triangles $A O H$ and $B O K$,
respectively. This means that:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ norm(overline(O A)) =
	   sqrt(norm(underline(A H))^(2) + norm(underline(O H))^(2)) =
	   sqrt(y_(A)^(2) + x^(2)) $],
	[$ norm(overline(O B)) =
	   sqrt(norm(underline(B K))^(2) + norm(underline(O K))^(2)) =
	   sqrt(y_(B)^(2) + (L - x)^(2)) $]
)

Let $t_(1)$ be the time needed for the light to go from $A$ to $O$ and let
$t_(2)$ be the time needed for the light to go from $O$ to $B$. Since time
is space over velocity, these times are the ratio between the lengths of
$overline(O A)$ and $overline(O B)$ respectively and the speed of light in
each medium. The total time that the light has to take for going from $A$
to $B$ is $T = t_(1) + t_(2)$. Using the newlyfound expression for these
two lengths:

$ T(x) = t_(1)(x) + t_(2)(x) = frac(sqrt(y_(A)^(2) + x^(2)), v_(1)) + frac(sqrt(y_(B)^(2) + (L - x)^(2)), v_(2)) $

The expression is to be minimized. To do so, it is first necessary to
compute its derivative (with respect to $x$):

$ frac(d T, d x) &=
  frac(d T, d x) (frac(sqrt(y_(A)^(2) + x^(2)), v_(1)) + frac(sqrt(y_(B)^(2) + (L - x)^(2)), v_(2)))
  = frac(frac(d T, d x) (sqrt(y_(A)^(2) + x^(2))), v_(1)) + frac(frac(d T, d x) (sqrt(y_(B)^(2) + (L - x)^(2))), v_(2)) = \
  &= frac(frac(1, 2) (y_(A)^(2) + x^(2))^(-frac(1, 2)), v_(1)) (frac(d T, d x) (y_(A)^(2) + x^(2))) + frac(frac(1, 2) (y_(B)^(2) + (L - x)^(2))^(- frac(1, 2)), v_(2)) (frac(d T, d x) (y_(B)^(2) + (L - x)^(2))) = \
  &= frac(frac(d T, d x) (y_(A)^(2) + x^(2)), 2 v_(1) sqrt(y_(A)^(2) + x^(2))) + frac(frac(d T, d x) (y_(B)^(2) + (L - x)^(2)), 2 v_(2) sqrt(y_(B)^(2) + (L - x)^(2))) =
  frac(frac(d T, d x) (y_(A)^(2)) + frac(d T, d x) (x^(2)), 2 v_(1) sqrt(y_(A)^(2) + x^(2))) + frac(frac(d T, d x) (y_(B)^(2)) + frac(d T, d x) ((L - x)^(2)), 2 v_(2) sqrt(y_(B)^(2) + (L - x)^(2))) = \
  &= frac(cancel(2) x, cancel(2) v_(1) sqrt(y_(A)^(2) + x^(2))) + frac(cancel(2) (L - x) frac(d T, d x) (L - x), cancel(2) v_(2) sqrt(y_(B)^(2) + (L - x)^(2))) =
  frac(x, v_(1) sqrt(y_(A)^(2) + x^(2))) - frac(L - x, v_(2) sqrt(y_(B)^(2) + (L - x)^(2))) $

Setting the expression equal to $0$:

$ frac(x, v_(1) sqrt(y_(A)^(2) + x^(2))) - frac(L - x, v_(2) sqrt(y_(B)^(2) + (L - x)^(2))) = 0 =>
  frac(x, v_(1) sqrt(y_(A)^(2) + x^(2))) = frac(L - x, v_(2) sqrt(y_(B)^(2) + (L - x)^(2))) $

Multiplying both sides by $c$:

$ frac(c, v_(1)) frac(x, sqrt(y_(A)^(2) + x^(2))) = frac(c, v_(2)) frac(L - x, sqrt(y_(B)^(2) + (L - x)^(2))) =>
  frac(n_(1) x, sqrt(y_(A)^(2) + x^(2))) = frac(n_(2) (L - x), sqrt(y_(B)^(2) + (L - x)^(2))) $

Notice how the expressions $x slash sqrt(y_(A)^(2) + x^(2))$ and
$L - x slash sqrt(y_(B)^(2) + (L - x)^(2))$ are the ratio between
the adjacent side and the hypothenuse of, respectively, the triangles
$A O H$ and $B O K$. These correspond to the cosines of the angles
$frac(pi, 2) - theta_(1)$ and $frac(pi, 2) - theta_(2)$, where the
$pi slash 2$ shift denotes the fact that the angles under consideration
are the ones _complementary_ to the incidence and refraction angles,
not the angles themselves. Which gives:

$ n_(1) underbrace((frac(x, sqrt(y_(A)^(2) + x^(2)))), cos(frac(pi, 2) - theta_(1))) =
  n_(2) underbrace((frac((L - x), sqrt(y_(B)^(2) + (L - x)^(2)))), cos(frac(pi, 2) - theta_(2))) =>
  n_(1) cos(frac(pi, 2) - theta_(1)) = n_(2) cos(frac(pi, 2) - theta_(2)) $

But since $cos(frac(pi, 2) - alpha) = sin(alpha)$ for any angle $alpha$:

$ n_(1) sin(theta_(1)) = n_(2) sin(theta_(2)) $

Which is precisely Snell's law.

Consider a light beam crossing the boundary between two media with index
of refraction $n_(1)$ and $n_(2)$ respectively. Assuming $n_(1) > n_(2)$,
due to Snell's law, the refracted light ray will be bent away from the
normal. If one were to increase the angle of incidence, keeping both
indices the same, the resulting refracted ray will be bent more and more.

At some *critical angle* $theta_(c)$, the refracted ray will be exactly
parallel to the boundary between the two media. This angle can be found
easily by observing how a refracted light ray parallel to the boundary
is, by definition, perpendicular to the normal, that is, when the angle
of refraction is $pi slash 2$. Substituting $theta_(2) = pi slash 2$ in
Snell's law:

$ n_(1) sin(theta_(c)) = n_(2) sin(frac(pi, 2)) =>
  n_(1) sin(theta_(c)) = n_(2) dot 1 =>
  sin(theta_(c)) = frac(n_(2), n_(1)) $

Any incidence angle that is greater than the critical angle will result
in no refracted ray at all, since the incident beam is entirely reflected.
light rays that experience no refraction and only reflection due to having
an incidence angle greater than the critical angle experience the so-called
*total internal reflection*.

#figure(
	caption: [A graphical representation of total internal reflection.
	          The more the angle of reflaction increases, the further
	          the refracted ray is deflected away from the normal. At
	          certain angle, the refracted ray (in purple) is perfectly
	          parallel to the threshold between the two media; any
	          higher angle will result in reflection and no refraction.],
	[#cetz.canvas({
		import cetz.draw: *
		set-style(content: (padding: 3pt))

		rect((0, 0), (10, -3), fill: aqua, stroke: (thickness: 0pt))
		content((10, -2), text([index $n_(1)$ \ velocity $v_(1)$]), anchor: "north-east")
		content((0, 2), text([index $n_(2)$ \ velocity $v_(2)$]), anchor: "south-west")

		line((10, 0), (0, 0), stroke: (thickness: 1.5pt))
		content((), "threshold", anchor: "south-west")

		content((1, -2.5), $P$, anchor: "north-east")
		line((1, -2.5), (2, 0), stroke: (thickness: 1.5pt, paint: red), mark: (end: "stealth"), fill: red)
		line((2, 0), (4, 2.5), stroke: (thickness: 1.5pt, paint: red), mark: (end: "stealth"), fill: red)
		line((1, -2.5), (3.5, 0), stroke: (thickness: 1.5pt, paint: red), mark: (end: "stealth"), fill: red)
		line((3.5, 0), (7.5, 2), stroke: (thickness: 1.5pt, paint: red), mark: (end: "stealth"), fill: red)
		line((1, -2.5), (5, 0), stroke: (thickness: 1.5pt, paint: red), mark: (end: "stealth"), fill: red)
		line((5, 0), (9, 1), stroke: (thickness: 1.5pt, paint: red), mark: (end: "stealth"), fill: red)
		line((1, -2.5), (6.5, 0), stroke: (thickness: 1.5pt, paint: fuchsia), mark: (end: "stealth"), fill: fuchsia)
		line((6.5, 0), (9, 0), stroke: (thickness: 1.5pt, paint: fuchsia), mark: (end: "stealth"), fill: fuchsia)
		line((1, -2.5), (8, 0), stroke: (thickness: 1.5pt, paint: red), mark: (end: "stealth"), fill: red)
		line((8, 0), (10, -1), stroke: (thickness: 1.5pt, paint: red), mark: (end: "stealth"), fill: red)
	})]
)

The name total internal reflection comes from the fact that, in general,
light is never either only refracted or only reflected, but is both. The
amount of light that is refracted vanishes as the angle of incidence
increases: beyond the critical angle, there is no refraction at all.

Also note that total internal reflection is possible only if light goes
from a medium with a greater index of refraction to a medium with a
smaller index of refraction. In this case, light will always be partially
reflected and partially refracted.

The most notable application of total internal reflection is light (and
information) transmission through *optic fiber* cables. The simplest model
of an optic fiber cable is a tube made of glass where light enters from
one end and exits from the other end bouncing inside the tube.

This happens because light is reflected along the boundary between the
glass of the tube and the outer air. In particular, when light enters
the tube, its angle of incidence is specifically tuned to be greater
than the critical angle, in order for the light to undergo total internal
reflection so that no light is refracted (hence lost). The light rays are
below the critical angle (almost perpendicular to the cross section of the
tube, actually) when they reach the end of the fiber, thus they refract
out without difficulty and can be detected.

This model is far too simplistic for real-world applications, since the
air-glass boundary is unreliable: it is still prone to refraction and the
tiniest scratch or bruise on the surface of the glass would have it leak
light. For this reason, most commercial realizations of an optic fiber
cable are constituted by a small-diameter glass tube, called the _core_,
nested inside a bigger layer of glass _cladding_. The glasses used for
the core and the cladding are specifically designed so that $n_("core")
> n_("cladding")$, guaranteeing total internal reflection, and to absorb
as little light as possible. The boundary between the two is more reliable
and not exposed to the environment; to maximize its durability, the cladding
is often wrapped inside one or more layers of plastic.

#figure(
	caption: [Typical structure of a fiber optic cable, with a core (1),
	          a cladding (2) and two protective plastic caps (3, 4). 
			  [#link("https://commons.wikimedia.org/w/index.php?curid=6561199")[Original image]
	          by #link("https://commons.wikimedia.org/wiki/User:Benchill")[Benchill],
	          licensed under the #link("https://creativecommons.org/licenses/by-sa/3.0/")[CC BY-SA 3.0] license,
	          based on #link("https://commons.wikimedia.org/wiki/File:Singlemode_fibre_structure.png")[earlier work]
	          by #link("https://commons.wikimedia.org/wiki/User:DrBob")[Bob Mellish]]],
	[#image("fiber.svg", width: 33%)]
)

Reflection and refraction were also employed in the first attempt to
measure the speed of light from Earth #footnote[Earlier attempts, dating
two centuries back, used the rotation period of celestial bodies.]. This
is also referred to as *Fizeau's experiment*, from the name of its author.

The experimental apparatus consists of a light source, whose light rays
reach a glass surface set at $45 degree$ that reflects and refracts in
roughly equal amount. The reflected portion of light is ignored, whereas
the refracted portion encounters a spinning toothed wheel: each tooth and
each gap are equally spaced, and speed of the wheel can be controlled by
the experimenter. If light hits one of the tooth gets blocked, if it hits
one of the gaps it passes through. A mirror then reflects the light back
to the original glass surface, encountering the wheel once again on its
path, being refracted and reflected. The refracted portion of light is
discarded, the reflected portion is observed.

#figure(
	caption: [A graphical representation of Fizeau's experimental apparatus:
	          a light source (1) emitting light that is refracted by a glass
	          surface (2), moving over a spinning wheel (3) to a mirror (4)
	          and then back to the glass surface, whose reflection of light
	          is collected (5).
	          [#link("https://commons.wikimedia.org/w/index.php?curid=89913086")[Original image]
	          by #link("https://commons.wikimedia.org/wiki/User:Д.Ильин")[Д.Ильин],
	          licensed under the #link("https://creativecommons.org/publicdomain/zero/1.0/")[CC0] license,
	          based on #link("https://commons.wikimedia.org/wiki/File:Fizeau.JPG")[earlier work]
	          by #link("https://commons.wikimedia.org/wiki/User:Brews_ohare")[Brews_ohare]]],
	[#image("fizeau.svg", width: 50%)]
)

In the starting condition, the wheel is at rest and the light source is
aligned with one of the gaps of the wheel; after coming back from the
mirror, it will be detected. The speed of the wheel is then increased
over and over: the reflected light will become dimmer and dimmer, because
more and more light rays will hit the teeth of the wheel when coming back
from the mirror.

After reaching a sufficient speed, there will be no incoming reflected
light at all, since the wheel and the light will be perfectly synchronized:
the light will come back from the mirror to the wheel in the exact same
time as a teeth of the wheel will replace the gap that the light used to
pass through. If speed is increased even further, the light and the wheel
will become once again desynchronized, and the reflected light will become
visible once again. When no reflected light can be detected, it must mean
that the time that light takes for a round trip (from the wheel to the
mirror and back) is the same as the time the wheel takes to rotate for
the length of a tooth.

Fizeau's original apparatus had a wheel of $720$ teeth, and the distance
between the wheel and the mirror was $8633 metre$. Fizeau observed that
reflected light disappeared when the wheel was spinning at a frequency of
$12.6 second^(-1)$. If the wheel rotates for the exact length of a tooth,
the rotated angle is of $pi slash 720$. Since $theta = 2 pi f t$, the time
taken for the rotation has to be:

$ t = frac(theta, 2 pi f) =
  frac(frac(cancel(pi), 720), 2 dot cancel(pi) dot 12.6 second^(-1)) =
  frac(1, 18114.0 second^(-1)) = num(5.5E-5) second $

Light has to travel from the wheel to the mirror and back, so the length
of the whole path is twice the distance between the mirror and the wheel.
Being velocity equal to distance over time:

$ c = frac(d, t) = frac(2 dot 8633 metre, num(5.5E-5) second)
  approx 313357531.7 metre slash second $

Which is about $4.5 percent$ bigger than the current accepted value.
