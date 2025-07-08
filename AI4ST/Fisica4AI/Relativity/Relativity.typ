#import "../Phys4AI_definitions.typ": *

The two most successful physical theories of the 19th century, (classical)
mechanics and electromagnetism, stood the test of time and work almost
seamlessly hand in hand. There is however one troublesome aspect that,
when taken into account, has the two theories completely at odds: light.

Maxwell's Equations for electromagnetism, in accord to the experimental
results, predict that light should travel with speed:

$ c &= frac(1, sqrt(epsilon_(0) mu_(0))) =
	frac(1, sqrt((8.854 times 10^(-12) farad slash meter)(1.256 times 10^(-6) newton slash ampere^(2)))) = \
	&= frac(1, sqrt(11.120 times 10^(-18) (second^(cancel(4)) dot cancel(ampere^(2)) dot cancel(kilogram) dot cancel(meter) dot cancel(second^(-2)) slash cancel(kilogram) dot meter^(2) dot cancel(meter) dot cancel(ampere^(2))))) = \
	&= frac(1, sqrt(11.120 times 10^(-18) second^(2) slash meter^(2))) = 
	frac(1, 3.334 times 10^(-9) second slash meter) approx 3.000 times 10^(8) meter slash second $

That is, light apparently moves at speed $c$ in any circumstance. This is
problematic, because mechanics postulates that there is no such thing as
an "absolute velocity": all velocities depend on the reference frame from
which they are observed, as the principle of Galilean relativity states.

Consider two inertial reference frames, $S$ and $S'$, where $S'$ is moving
at constant speed $v$ (along the $x$ axis) with respect to $S$. Suppose that
a beam of light were to be travelling at speed $c$ (again, along the $x$
axis) with respect to $S$; then, applying Galilean relativity, one would
expect the light beam to travel at velocity $c - v$ with respect to $S'$.
However, when measuring the speed of the light beam with respect to $S'$
one still finds that it moves with speed $c$.

#figure(
	caption: [With respect to an inertial frame of reference $S$, a light
	          beam (in blue) moves with velocity $c$. With respect to
	          another inertial frame of reference $S'$, that is moving
	          with respect to $S$ at constant velocity $v$, it would be
	          assumed that the light beam would travel with velocity
	          $v - c$ with respect to $S'$. However, this is not the
	          case: the light beam moves at velocity $c$ both with respect
	          to $S$ and with respect to $S'$.],
	[#cetz.canvas({
		import cetz.draw: *
		set-style(
			stroke: (thickness: 1.25pt),
			circle: (radius: 0.25),
			content: (padding: 2pt),
			fill: black
		)

		content((0, 0), $ S $, anchor: "north-east")
		line((0, 0), (0, 3.5), mark: (end: "stealth"))
		content((), $ y $, anchor: "south")
		line((0, 0), (6, 0), mark: (end: "stealth"))
		content((), $ x $, anchor: "west")
		hobby((0.5, 1.75), (1, 1.5), (1.5, 1.75), (2, 1.5), (2.5, 1.75), (3, 1.5), (3.5, 1.75), (4, 1.5), (4.5, 1.75), fill: none, omega: 1, stroke: blue)
		line((1, 1), (4, 1), mark: (end: "stealth"), stroke: green, fill: green)
		content((2.5, 1), $ c $, anchor: "north")

		content((8, 0), $ S' $, anchor: "north-east")
		line((8, 0), (8, 3.5), mark: (end: "stealth"))
		content((), $ y $, anchor: "south")
		line((8, 0), (14, 0), mark: (end: "stealth"))
		content((), $ x $, anchor: "west")
		line((8, 2.5), (9, 2.5), mark: (end: "stealth"), stroke: red, fill: red)
		content((8.5, 2.5), $ v $, anchor: "north")
		hobby((9.5, 1.75), (10, 1.5), (10.5, 1.75), (11, 1.5), (11.5, 1.75), (12, 1.5), (12.5, 1.75), (13, 1.5), (13.5, 1.75), fill: none, omega: 1, stroke: blue)
		line((10, 1), (13, 1), mark: (end: "stealth"), stroke: green, fill: green)
		content((11, 1), $ cancel(cross: #true, c - v) $, anchor: "north")
		content((12, 1), $ c $, anchor: "north")
	})]
)

Also, despite its accomplishments, Maxwell Equations left a question opened:
how could light travel in the absence of a medium? Light was understood to
be a wave, and each wave needed a medium through which they propagate (like
air is the medium through which sound propagates, or water is the medium
through which water waves propagate). However, how can light travel, for
example, from the Sun to the Earth with nothing but empty space in between?

One hypothesis that was advanced early on to reconcile the two theories
and, at the same time, to solve this conundrum, was to postulate that the
entire Universe is permeated by a peculiar substance called *luminiferous
ether*, or just *ether*. This ether would be the medium through which light
propagates, and the speed of light is constant when measured with respect
to the "special" frame of reference of the ether. Stated otherwise, the
value of $c$ that arises from Maxwell equations does not refer to the
speed of light "per se", but the value measured with respect to this
priviledged frame of reference.

If this were to be true, the contradiction would be solved, since the
Galilean principle of relativity now works again. Given an inertial
frame of reference $S$, let $v$ be the velocity with which $S$ moves
with respect to the frame of reference of the ether. If it were to be
possible to compute $v$, now the speed of light measured with respect
to $S$ would now be $c + v$ (or $c - v$, depending on the direction),
as expected.

The ether hypothesis was short-lived, however, since it became clear
that no such substance exists. Even before experimental evidence proved
the hypothesis wrong, it could hardly be possible for this ether to exist,
since it would be something that is present in the entire Universe and yet
being barely noticeable. Another problem was more of an epistemological
issue: why would the laws of mechanics have to elevate one frame of reference
(the one of the ether) above the others? Why would this work for light waves,
but not for sound waves, for example?

The most famous experiment that put the existence of the ether into question
was the *Michelson and Morley experiment*.

// The experiment...

A different approach was the one followed by Einstein, in its *special
theory of relativity*: the name "special" comes from the fact that the
theory concerns itself only with inertial frames of reference, hence
"special" as in "special case". The theory is based on only two postulates:

- *Principle of relativity*. All physical laws (not just the laws of
  mechanics) are the same with respect with any frame of reference;
- *Constant speed of light*. As correctly predicted by the Maxwell
  Equations, the speed of light is constant in any frame of reference.

With these two assumptions, it is possible to construct a theory that is
consistent and solves (almost) all contradictions between mechanics and
electromagnetism. It introduces, however, many seemingly paradoxical
consequences.

// Time dilation
// Events are no more simultaneous
// Length contraction
