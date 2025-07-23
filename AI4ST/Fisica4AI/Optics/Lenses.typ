#import "../Phys4AI_definitions.typ": *

*Mirrors* are the simplest form of surfaces for which light undergoes
specular reflection. The light coming from a self-sustaining light source
(a lamp, the Sun, ecc...) hits any object, undergoes diffuse reflection,
is reflected from the mirror and reaches an observer.

The image of an object as it appears in a mirror, its *virtual image*,
can be thought of as being "on the other side" of the mirror, whose
light rays "merge" with the original light rays and moving in a straight
line instead of being reflected. Note how the virtual image, as the name
suggests, doesn't actually exist: it is not "behind" the mirror, it is
just a geometrical construction that explains this apparent optical
illusion.

It is a known empirical fact that, for any mirror, the virtual image of
an object is specular to the object itself with respect to the mirror.
That is, if the object is on the left of an observer, the virtual image
is also to the left of the observer (to the right of the mirror) and vice
versa.

#figure(
	caption: [An object in a mirror is reflected as it does because the
	          light rays that it reflects are equivalent to light rays
	          emitted directly from the virtual image. The virtual and
	          original image are specular.],
	[#cetz.canvas({
		import cetz.draw: *
		set-style(
			content: (padding: 3pt),
			stroke: (thickness: 1.25pt),
			fill: black
		)

		rect((0, 0), (0.5, 5), stroke: (thickness: 0pt), fill: aqua)
		line((0, 0), (0, 5), stroke: (thickness: 1.5pt), name: "mirror")
		content(("mirror.start", 87.5%, "mirror.end"), "mirror", angle: "mirror.end", anchor: "south", padding: 0.1)

		content((-4, 4.5), text(size: 30pt, [#emoji.apple.red]), name: "o")
		line("o", (0, 2))
		line("o", (0, 2.25))
		line("o", (0, 2.5))
		content("o", "Original image", anchor: "north", padding: 1)

		content((4, 4.5), text(size: 30pt, [#emoji.apple.red]), name: "v")
		line("v", (0, 2), stroke: (dash: "dashed"))
		line("v", (0, 2.25), stroke: (dash: "dashed"))
		line("v", (0, 2.5), stroke: (dash: "dashed"))
		content("v", "Virtual image", anchor: "north", padding: 1)

		line((0, 2), (-2, 0.75), mark: (end: "stealth"))
		line((0, 2.25), (-2, 1.125), mark: (end: "stealth"))
		line((0, 2.5), (-2, 1.5), mark: (end: "stealth"))
		content((-2, 1.125), text(size: 30pt, [#emoji.eye]), anchor: "east")
		content((-2.875, 1.125), "Observer", anchor: "north", padding: 1)
	})]
)

This phenomena can be interpreted assuming Fermat's principle. Not only that,
but Fermat's principle also explains why, during reflection, the angles of
incidence and of refraction are the same.

Consider a light ray travelling from a point $A$ to a mirror and reflected
to a point $B$. Let $B'$ be the point that is at the same distance from the
mirror as it is $B$. Let $C$ be the intersection between the surface of the
mirror and the segment $overline(A B')$. Let $H$ be the intersection between
the surface of the mirror and the segment $overline(B B')$. Let $K$ be the
intersection between $A$ and the projection of $A$ on the surface of the
mirror.

#figure(
	caption: [The geometrical setup for deriving the law of reflection.
	          $C$ is the intersection between $overline(A B')$ and the
	          mirror, $H$ is the intersection between $overline(B B')$
	          and the mirror. $P$ and $Q$ are alternative candidate
	          points of reflection other than $C$, chosen at random.],
	[#cetz.canvas({
		import cetz.draw: *
		set-style(content: (padding: 3pt))

		line((-1, 0), (11, 0), stroke: (thickness: 1.5pt))
		content((1, 2.5), $A$, anchor: "south-east")
		line((1, 2.5), (1, 0))
		content((1, 0), $K$, anchor: "south-east")
		content((9, 1.5), $B$, anchor: "south-west")
		content((9, -1.5), $B'$, anchor: "north-west")
		line((9, 1.5), (9, -1.5))
		content((9, 0), $H$, anchor: "south-west")

		content((6, 0), $C$, anchor: "north-east")
		line((1, 2.5), (6, 0))
		line((6, 0), (9, -1.5))
		line((6, 0), (9, 1.5))
		line((6, 3), (6, -2), stroke: (thickness: 1.5pt, dash: "dashed"))
		content((6, 2), $O$, anchor: "west")
		content((6, 0), $theta_(i)$, anchor: "south-east", padding: 0.3)
		content((6, 0), $theta_(r)$, anchor: "south-west", padding: 0.3)

		content((2, 0), $P$, anchor: "north-east")
		line((1, 2.5), (2, 0), stroke: (dash: "dotted"))
		line((2, 0), (9, -1.5), stroke: (dash: "dotted"))
		line((2, 0), (9, 1.5), stroke: (dash: "dotted"))

		content((8.5, 0), $Q$, anchor: "north-east")
		line((1, 2.5), (8.5, 0), stroke: (dash: "dotted"))
		line((8.5, 0), (9, -1.5), stroke: (dash: "dotted"))
		line((8.5, 0), (9, 1.5), stroke: (dash: "dotted"))
	})]
)

Consider any point $P$ along the surface of the mirror. By construction,
the angles $B hat(H) P$ and $B' hat(H) P$ are both right angles, and the
segments $overline(B H)$ and $overline(B' H)$ have the same length. The
triangles $B P H$ and $B' P H$ are therefore congruent, since they share
one side ($overline(P H)$), one side is equal to the other and the angle
that liest between them is of the same size. In turn, this means that
$B P B'$ is an isosceles triangle, therefore $overline(P B)$ and
$overline(P B')$ have the same length and the angles $P hat(B) H$ and
$P hat(B') H$ have the same size.

Since, for any point $P$ along the surface of the mirror, $norm(overline(P B))
= norm(overline(P B'))$, the total length of the path that goes from $A$ to
$P$ to $B$ is the same as the total length of the path that goes from $A$ to
$P$ to $B'$. Of course, the shortest possible path that goes from $A$ to $P$
to $B'$ is the one where light moves in a straight line. That is, the
shortest path is the one where the points $A$, $P$ and $B'$ are aligned,
which by construction is the one where $P = C$.

Since light moves at constant speed, the shortest path in terms of time
is also the shortest path in terms of distance, and vice versa (note that
this does not work with refraction, because light changes speed when going
from one medium to another). Therefore, the path of shortest time is the
one that goes from $A$ to $C$ to $B'$, which takes just as much as the one
that goes from $A$ to $C$ to $B$.

Since by construction $overline(A K)$ and $overline(B' H)$ are parallel
(being both perpendicular to the mirror), $C hat(A) K tilde.equiv C
hat(B') H$. As already stated, $C hat(B) H tilde.equiv C hat(B') H$,
therefore by transitive property $C hat(B) H tilde.equiv C hat(A) K$.
Since by construction $overline(A K)$, $overline(B H)$ and $overline(C O)$
are all parallel to each other, $C hat(A) K tilde.equiv theta_(i)$ and
$C hat(B) H tilde.equiv theta_(r)$. Finally, since $C hat(B) H tilde.equiv
C hat(A) K$, $theta_(i) tilde.equiv theta_(r)$.

Virtual images produced by reflection are (almost) perfect copies of
the original, mainatining the same proportions and the same distance
from the mirror. Virtual images produced by refraction are not, however:
when light rays are refracted, their path is distorted, creating a virtual
image that does not coincide with the original image.

Consider an object placed in a medium with index of refraction $n_(1)$
and an observer placed in a medium with index of refraction $n_(2)$.
Suppose, without loss of generality, that $n_(1) > n_(2)$. The observer
is able to see the object either because light from a source hits it and
undergoes diffuse reflection or because the object is itself a source of
light. In any case, light rays move from the object to the observer, but
when transitioning from the first medium to the second medium undergoes
refraction. The observed object is found by tracing the light rays
backwards, but since the incoming rays were deflected away from the
normal due to refraction, their point of juncture is not the original
object, but a point closer to the threshold. This means that the observer
will perceive the object to be closer than it really is.

#figure(
	caption: [],
	[#cetz.canvas({
		import cetz.draw: *
		set-style(content: (padding: 3pt))

		line((-0.5, 0), (8, 0), stroke: (thickness: 1.5pt))
		line((6, 3), (6, -3), stroke: (thickness: 1.5pt))
		content((6, 0), $O$, anchor: "south-west")

		line((1, 0), (6, 1.5), mark: (end: "stealth"), fill: black)
		line((1, 0), (6, -1.5), mark: (end: "stealth"), fill: black)
		line((6, 1.5), (4.5, 0), stroke: (dash: "dashed"))
		line((6, -1.5), (4.5, 0), stroke: (dash: "dashed"))
		line((6, 1.5), (7, 2.5), mark: (end: "stealth"), fill: black)
		line((6, -1.5), (7, -2.5), mark: (end: "stealth"), fill: black)
		line((4.5, 1.5), (7.5, 1.5), stroke: (dash: "dashed"))
		line((4.5, -1.5), (7.5, -1.5), stroke: (dash: "dashed"))
		content((1, 0), $P$, anchor: "south")
		content((4.5, 0), $P'$, anchor: "south")
		content((6, 1.5), $H$, anchor: "south-east")
		content((6, -1.5), $K$, anchor: "north-east")
	})]
)

A *lens* is a transparent object that uses refraction at curved surfaces to
form an image from diverging light rays. That is, a lens receives incident
light rays as "input" from an object and "outputs" light rays that create a
copy of the object. Most lenses fall into two categories: *converging* and
*diverging* lenses. Converging lenses bend the light rays towards the optical
axis, diverging rays bend light away from the optical axis.

The light rays outgoing from a lens all intersect at a point called the
*focal point*. The focal point of a lens depends only and exclusively on
the lens itself (on the material that is built of, on its shape, ecc...),
not on the incoming light. The focal point of a converging lens is on the
other side of the object, it's the point where all outgoing light rays
converge (hence the name). The focal point of a diverging lens is on the
same side of the object, and represent the mathematical construction that
interprets the point where such light rays originate from. The distance of
the focal point from the lens is called the *focal length* $f$ of the lens.

// An image of a converging lens and an image of a diverging lens.
