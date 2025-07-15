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

The ether hypothesis had some ground, since Maxwell's Equations
invalidated Galilean coordinate transformations. That is, when
observing the same experiment involving light from different frames
of reference, the results would be different, even if the frames are
inertial. This means that it's possible to rely on Maxwell's Equations
to tell apart which system is moving with respect to the other in an
"absolute" sense, and "absolute" motion is explicitly forbidden in
Newtonian/Galilean mechanics.

If this hypothesis were to be true, the contradiction would be solved,
even though this would elevate the ether's reference frame as a "special"
reference frame, in which motion is absolute. Given an inertial frame of
reference $S$, let $v$ be the velocity with which $S$ moves with respect
to the frame of reference of the ether. If it were to be possible to
compute $v$, now the speed of light measured with respect to $S$ would
now be $c + v$ (or $c - v$, depending on the direction), as expected.

The ether hypothesis was short-lived, however, since it became clear
that no such substance exists. Even before experimental evidence proved
the hypothesis wrong, it could hardly be possible for this ether to exist,
since it would be something that is present in the entire Universe and yet
being barely noticeable. 

The most famous experiment that put the existence of the ether into question
was the *Michelson and Morley experiment*.

// The experiment...

A different approach was the one followed by Einstein, in its *special
theory of relativity*: the name "special" comes from the fact that the
theory concerns itself only with inertial frames of reference, hence
"special" as in "special case". The theory is based on only two postulates:

- *Principle of relativity*. All physical laws are the same with respect
  to any inertial frame of reference. This is an extension of the Galilean
  Principle of Relativity, which states that (just) the laws of mechanics
  are the same with respect to any inertial frame of reference;
- *Constant speed of light*. As predicted by the Maxwell Equations, the
  speed of light is a universal constant, that holds the same value in
  any inertial frame of reference.

With these two assumptions, it is possible to construct a theory that is
consistent and solves (almost) all contradictions between mechanics and
electromagnetism. It introduces, however, many seemingly paradoxical
consequences.

First of all, it is necessary to let go of the notion of having a "global"
time that flows at the same pace for any reference frame. This is the case
in Galilean transformations, where the time variable $t$ in a given
(inertial) reference frame does not change when considering the same
even in a different (inertial) reference frame.

Consider an experimental setup where two sources of light, one facing
the other, are placed vertically at a given distance $L$. The two sources
are kept fixed in place, so that they either both stand still or they both
have to move at the same speed. Whenever one source captures a photon emitted
by the other, it sends a photon back.

If the apparatus is standing still, both from the frame of reference of an
external observer and from the frame of reference of the light source, the
photon has to travel along a straight line to start from one source, reach
the other source and go back to the original source.

If, on the other hand, the apparatus is moving at constant velocity (for
simplicity, only along the left-right axis) with respect to an external
observer, the two frames of reference paint a different picture. For the
frame of reference of the source, the path traced by the photon is still
a vertical line, since it's moving along at constant speed. On the other
hand, from the frame of reference of an external observer the path traced
by the photon is two incident lines, since both the photon _and_ the
apparatus are moving.

#figure(
	caption: [The apparatus consists in two facing sources of light exchanging
	photons. When the apparatus is still (left), the distance that a photon has
	to travel to go from its source to the other source and back to its original
	source is $2L$. When the apparatus is moving (right) the light has to travel a
	a distance longer than $2L$ to go back and forth, when observed from an
	external frame of reference.],
	[#grid(
		columns: (0.35fr, 0.65fr),
		[#cetz.canvas({
			import cetz.draw: *
			set-style(
				stroke: (thickness: 1.25pt),
				circle: (radius: 0.25),
				content: (padding: 2pt),
				fill: black
			)

			line((0, 0), (2, 0))
			line((0, 4), (2, 4))
			line((2.5, 0), (2.5, 4), mark: (start: "|", end: "|", width: 0.375cm), stroke: 0.5pt, name: "length")
			content(("length.start", 50%, "length.end"), $L$, angle: "length.end", anchor: "north", padding: 0.1)

			line((1, 0), (1, 4), stroke: (thickness: 0pt), name: "phantom")
			content(("phantom.start", 15%, "phantom.end"), text(size: 20pt, fill: blue, [#math.arrow.r.long.squiggly]), angle: "phantom.end", padding: 0.1)
			content(("phantom.end", 15%, "phantom.start"), text(size: 20pt, fill: blue, [#math.arrow.l.long.squiggly]), angle: "phantom.end", padding: 0.1)
		})],
		[#cetz.canvas({
			import cetz.draw: *
			set-style(
				stroke: (thickness: 1.25pt),
				circle: (radius: 0.25),
				content: (padding: 2pt),
			)

			line((0, 0), (2, 0))
			line((0, 4), (2, 4))
			line((3, 0), (5, 0))
			line((3, 4), (5, 4))
			line((6, 0), (8, 0))
			line((6, 4), (8, 4))

			line((1, 4.5), (7, 4.5), mark: (start: "|", end: "|", width: 0.375cm), stroke: 0.5pt, name: "speed")
			content(("speed.start", 50%, "speed.end"), $v Delta t$, angle: "speed.end", padding: 0.1, anchor: "south")			
			line((1, 0), (4, 4), stroke: (dash: "dashed", paint: silver), name: "direction1")
			line((4, 4), (7, 0), stroke: (dash: "dashed", paint: silver), name: "direction2")
			content(("direction1.start", 50%, "direction1.end"), text(size: 20pt, fill: blue, [#math.arrow.r.long.squiggly]), angle: "direction1.end", padding: 0.1, anchor: "south")
			content(("direction2.start", 50%, "direction2.end"), text(size: 20pt, fill: blue, [#math.arrow.r.long.squiggly]), angle: "direction2.end", padding: 0.1, anchor: "south")
		
			line((2, -0.5), (6, -0.5), mark: (end: "stealth", fill: black), name: "velocity")
			content(("velocity.start", 50%, "velocity.end"), $v$, angle: "velocity.end", padding: 0.1, anchor: "north")
		})]
	)]
)

Let $v$ be the velocity with which the apparatus is moving with respect to
an external observer. Let $t_(0)$ be the time frame in which the photon
starts moving from its original source and let $t_(f)$ be the time frame
in which the photon has returned to its source. Let then $Delta t = t_(f)
- t_(0)$ be the time interval in which the photon moves.

In a Newtonian setting, the velocity of the photon when the apparatus is
still would be $c$ (as predicted by Maxwell's Equations), both in the frame
of reference of the source and in the frame of reference of an external
observer. On the other hand, when the apparatus is moving the velocity
would be $c$ in in the frame of reference of the source and $c + v$ in
the frame of reference of an external observer. Also, the time interval
$Delta t$ would be the same in both frames of reference and in both
situations.

However, if Einstein's First Postulate is to be taken into account, the
velocity for both frames of reference when the apparatus is moving has
to be $c$. The distance travelled by the moving apparatus (with respect
to an external observer) is $v Delta t$, the velocity of the apparatus
multiplied by the time the photon has taken to go back and forth once.
The distance between the two light sources is still $L$, so the distance
$d$ travelled by the photon with respect to an external observer can be
computed applying Pythagoras' Theorem:

$ frac(d, 2) = sqrt((frac(v Delta t, 2))^(2) + L^(2)) =>
  frac(d^(2), 4) = frac(v^(2) (Delta t)^(2), 4) + L^(2) =>
  d^(2) = v^(2) (Delta t)^(2) + 4 L^(2) $

With respect to the frame of reference of the source, the photon still
travels along a straight line of length $L$ at (constant) velocity $c$.
However, since the velocity of the photon must be $c$ for any observer
and any inertial frame of reference, the length $L$ must be equal to
$c Delta t'$, where $Delta t'$ is a time interval having different
size with respect to $Delta t$:

$ d^(2) = v^(2) (Delta t)^(2) + 4 L^(2) =
          v^(2) (Delta t)^(2) + c^(2) (Delta t')^(2) $

Where the factor of $4$ was included directly into the new time $Delta t'$,
being a dummy variable.

Since the distance $d$ must also be equal to $c Delta t$:

$ c^(2) (Delta t)^(2) = v^(2) (Delta t)^(2) + c^(2) (Delta t')^(2) =>
   c^(2) (Delta t')^(2) = (c^(2) - v^(2)) (Delta t)^(2) $

Solving for $Delta t$:

$ (Delta t)^(2) = (frac(c^(2), c^(2) - v^(2))) (Delta t')^(2) =>
  Delta t = Delta t' sqrt(frac(c^(2), c^(2) - v^(2))) => 
  Delta t = Delta t' frac(1, sqrt(1 - frac(v^(2), c^(2)))) =>
  Delta t = gamma Delta t' $

Where $gamma = 1 slash sqrt(1 - frac(v^(2), c^(2)))$ is also referred
to as *Lorentz's factor*. This result does not hold just for this
experimental setup, but for any pair of inertial frames of reference
where one is moving at a constant speed with respect to the other.

The equation implicitly states that no velocity can be greater than
the speed of light, in any inertial frame of reference. If this wasn't
the case, the fraction $v^(2) slash c^(2)$ could become greater than $1$,
potentially resulting in a value of $gamma$ (and of $Delta t'$) that is
a complex number. Since time intervals are necessarely real numbers,
any velocity must be smaller than $c$, which also implies that $gamma$
is always greater or equal than $1$.

This means that time effectively runs faster or slower depending on the
frame of reference in which events are observed. In particular, when two
inertial frames of referenece are at rest with respect to each other
($v = 0$), then $gamma = 1$, meaning that time flows at the same pace
in both reference frames. On the other hand, as $v$ approaches $c$, then
$gamma$ approaches $+infinity$, meaning that as velocity increases as time
slows down with respect to a frame of reference of an external observer.

Since the time observed in a frame of reference at rest with respect to
the events is the smallest time interval than can be observed, being
$gamma = 1$ the smallest possible value of $gamma$, this time interval
is also referred to as *proper time*. It should be noted that all measured
times in all inertial frames of reference moving at any constant speed are
equally valid observations of the same phenomena. The name "proper time"
refers to the fact that, since the observer is itself not moving, there
is no "distorsion" induced by velocity when measuring time.

#exercise[
	What would be an analogy?
]
#solution[
	The Moon, when observed from the Earth, appears to be no wider than a
	couple of centimetres. However, the _real_ width of the Moon is roughly
	$3.5 times 10^(6) metre$, which is orders of magnitude larger. This
	happens because the distance from which a phenomena is observed modifies
	its apparent proportions: the _real_ width of the Moon is the one observed
	when being close to it, because it's the least "distorting" point of view.
	This does not mean that the width of the Moon observed by the Earth is
	_wrong_, just that its point of view is more biased. In the same fashion,
	proper time describes a phenomena with the least bias, and hence it is
	understood to be the _real_ temporal description.
]

The phenomenon of time moving at slower pace in external frames of
reference is called *time dilation*. Time dilation is an observable
property of time and space, and it has real physical consequences.
Any real-world process that can be observed, from supernovas to aging,
is subjected to time dilation: a person ages faster or slower based
on which frame of reference they are observed, for example.

#exercise[
	Suppose that an observer standing still is watching an alien spaceship
	passing by left-to-right at $85 percent$ the speed of light. If the
	time interval from when the spaceship is first sighted by the observer
	to when it is right in front of them is, from its reference frame,
	$2$ minutes, how much time is passed in the same time frame in the
	frame of reference of the spaceship?
]
#solution[
	If $v = 85 percent c$, then $v^(2) slash c^(2)$ is $(0.85)^(2) approx
	0.73$, which gives a Lorentz's Factor of $1 slash sqrt(1 - 0.73) approx
	2$. If the time interval in the reference frame of the observer is
	$2 minute$, the time interval in the reference frame of the spaceship
	(the proper time) is $2 minute slash 2 = 1 minute$.
]

It should be noted, however, that $gamma$ scales incredibly slowly with
velocity, and only velocities that are very close to the speed of light
can yield a value of $gamma$ large enough to measure significative time
offsets.

#figure(
	caption: [Value of $gamma$ with respect to different values of
			  velocity. As can be appreciated, $gamma$ becomes noticeable
			  only at incredibly high values of $c$ ($gamma$ is displayed
			  in logarithmic scale).],
	[#image("gamma.svg", width: 87.5%)]
)

Also, since most real-world phenomena have a velocity that is no where
near the speed of light, taking into account the $gamma$ factor is not
necessary, because $gamma approx 1$ and hence $Delta t' approx Delta t$.
This is why Newtonian mechanics is still a reasonable model for
interpreting reality when working at slow velocities.

#exercise[
	Fastest human-made space probes have a velocity of roughly
	$200 kilo meter slash second$. If one such probe were to be
	observed from an inertial frame of reference, what would be
	the Lorentz's Factor?
]
#solution[
	The speed of the probe is roughly $0.0006$ times the speed of
	light. Hence:

	$ gamma = frac(1, sqrt(1 - frac(v^(2), c^(2)))) =
	  frac(1, sqrt(1 - (frac(6 times 10^(-4) cancel(c), cancel(c)))^(2))) =
	  frac(1, sqrt(1 - 3.6 times 10^(-8))) approx
	  1.00000018 $
]

The fact that the flow of time varies with different frames of reference
also implies that lenghts vary with different frames of reference. That
is, the same object can be observed to be longer or shorter depending on
which frame of reference it is observed.

Consider, again, two inertial frames of reference, where one is moving
with respect to the other in the left-right direction at constant speed
$v$. Suppose that the first measures a certain time interval $Delta t$
when moving from point $A$ to point $B$, travelling a certain distance
$L$. Being a constant uniform motion, $L = v Delta t'$.

The second frame of reference will instead measure a different time
interval $Delta t$ when moving from $B$ to $A$. If the travelled
distance were to be the same as the distance observed in the other
frame of reference, one would have $L = v Delta t$, since the velocity
is the same (in modulo) for both inertial frames of reference. This
would mean $v Delta t = v Delta t'$, which entails $Delta t = Delta t'$.
This is not possible, however, since by construction the two frames of
reference are moving with respect to each other.

It is therefore necessary to assume that the second frame of reference
actually observed a distance of $L' = v Delta t$, with $L'$ being
different from $L$. Recalling that $Delta t' = gamma Delta t$:

$ L' = v Delta t = v frac(Delta t', gamma) = frac(L, gamma) $

This is also referred to as *length contraction*, or *Lorentz's
contraction*. Analogously to how proper time was defined, *proper
length* is a length measured from the frame of reference of an
external observer, which is also the longest possible.

Note that, this way, special theory of relativity presents a remarkable
symmetric: a frame of reference at rest with a moving body will measure
proper time but not proper distance, whereas a frame of reference external
to the moving body will measure proper distance but not proper time. In
particular, in the first frame of reference both time and space are shorter,
in the second both time and space al longer.

It should be noted that, even in Special Relativity, some physical
quantities are invariant among different frames of reference. First,
note that length contraction happens only along the direction of motion,
not along all direction. Consider two apparatuses such as the two mirror
example, moving with respect to each other and with respect to a third,
external frame of reference at velocities $v_(1)$ and $v_(2)$.

Assume that both apparatuses start in the same condition and in the same
spacial coordinates. An observer in the external frame of reference would
observe the photon in the first apparatus travel $frac(1, 2) Delta x_(1)
metre$ in the $x$ direction and $frac(1, 2) c Delta t_(1) metre$ in the
$y$ direction, while observing the photon in the second apparatus travel
$frac(1, 2) Delta x_(2) metre$ in the $x$ direction and $frac(1, 2) c
Delta t_(2) metre$ in the $y$ direction. In both cases, the height $L$
is the same; applying Pythagoras' Theorem:

$ L^(2) = (frac(1, 2) c Delta t_(1))^(2) - (frac(1, 2) Delta x_(1))^(2) =
  (frac(1, 2) c Delta t_(2))^(2) - (frac(1, 2) Delta x_(2))^(2) $

Cancelling the $frac(1, 2)$ factor:

$ c^(2) Delta t_(1)^(2) - Delta x_(1)^(2) = c^(2) Delta t_(2)^(2) - Delta x_(2)^(2) $

The quantity $c^(2) Delta t^(2) - Delta x^(2)$, also called the *spacetime
interval*, is the same in any frame of reference.

Special relativity introduces another seemingly counterintuitive
result: two events can or cannot appear to be simultaneous depending
on the frame of reference in which they are observed. This is because
the act of _observing_ is itself dependent on the speed of light: be
it a measuring instrument or the human eye, _observing_ a phenomena
entails capturing a light beam carrying the information associated
to said phenomena, moving from the phenomena to the observer. Since
this movement happens at the speed of light (that is, is not istantaneous),
there is necessarely a delay. Also, since the speed of light is always
the same in any inertial frame of reference, changing frame of reference
also potentially changes the distance that the light has to travel and
therefore the perceived time frame at which an event is observed.

Consider two inertial reference frames, one moving with respect to the
other at velocity $v$. Suppose that one of the two frames is centered
in the middle of two events, that happen simultaneously. This means
that the light wave carrying the information associated to the two events
reaches the observer in said frame of reference (moving at speed $c$)
reach the observer in the same time frame. The other reference frame,
having to take into account the movement of the frame of reference, will
not perceive both events happening simultaneously: one will be perceived
before the other. 

#figure(
	caption: [In both situations, both events (a camera flash)
	are synchronized so that they happen simultaneously. In the
	first situation, an external observer lies exactly in the
	middle of the two, and therefore will always observe the two
	events simultaneously. In the second situation, the observer
	is closer to the of the two, and therefore will observe one
	(the closest) before the other.],
	[#grid(
		columns: (0.5fr, 0.5fr),
		[#cetz.canvas({
			import cetz.draw: *
			set-style(
				stroke: (dash: "dashed", thickness: 1.25pt),
				circle: (radius: 0.25),
				content: (padding: 2pt),
			)

			line((0, 0), (1.75, -1), name: "left")
			line((4, 0), (2.25, -1), name: "right")
			content("left.start", anchor: "south-east", text(size: 20pt, [#emoji.camera.flash]))
			content("right.start", anchor: "south-west", text(size: 20pt, [#emoji.camera.flash]))
			content((2.1, -1.25), text(size: 20pt, [#emoji.eye]))
		})],
		[#cetz.canvas({
			import cetz.draw: *
			set-style(
				stroke: (dash: "dashed", thickness: 1.25pt),
				circle: (radius: 0.25),
				content: (padding: 2pt),
			)

			line((0, 0), (2.875, -1), name: "left")
			line((4, 0), (3.125, -1), name: "right")
			content("left.start", anchor: "south-east", text(size: 20pt, [#emoji.camera]))
			content("right.start", anchor: "south-west", text(size: 20pt, [#emoji.camera.flash]))
			content((3.1, -1.25), text(size: 20pt, [#emoji.eye]))
		})]
	)]
)

#exercise[
	Muons are subatomic particles created in the upper atmosphere when
	cosmic rays collide with air molecules. Muons are unstable particles
	that have an half-life of $1.5 micro second$, meaning that, given a
	sample of muons, each $1.5 micro second$ roughly half the sample size
	decays into other smaller particles. Their speed is very close to the
	speed of light, and their presence on Earth's surface can be easily
	detected with ad-hoc particle detectors.

	The upper atmosphere is about $60 kilo metre$ above sea level, and
	the speed of a muon is about $0.9997 c$. The time that a muon takes
	to travel from the atmosphere to the Earth's surface moving at constant
	speed straight in a downward direction (without decaying) is:

	$ Delta t approx frac(h, c) = frac(6 times 10^(4) metre,
	  3 times 10^(8) metre slash second) = 2 times 10^(-4) second =
	  200 micro second $

	Since $200 micro second slash 1.5 micro second$ is $133$, it means that
	a muon that were to take such path would have to "dodge" decaying $133$
	times in a row. Since the probability of decaying (and of not-decaying)
	is always $0.5$, the probability for a muon to reach the Earth without
	having decayed would be $(0.5)^(133) approx 10^(-40)$.

	This would mean that, every $10^(40)$ muons, only a single muon would
	reach the Earth's surface. However, experimental data contradicts such
	observation, since around $10 percent$ of the muons created in the upper
	atmosphere are detected on Earth. How can this be?
]
#solution[
	This apparent paradox can be solved by taking Special Relativity into
	account. From the muon's frame of reference, it is the Earth that is
	moving towards it at speed $0.9997 c$: if an observer in the frame of
	reference of the Earth's surface measures a (dilated) time of $200
	micro second$, the muon observes a (proper time) of:

	$ Delta t = frac(Delta t', gamma) =
  	200 micro second sqrt(1 - frac(v^(2), c^(2))) =
	  200 micro second sqrt(1 - (0.9997)^(2)) =
	  (0.0245 dot 200) micro second = 
	  4.9 micro second $

	Which gives an half-life of $4.9 micro second slash 1.5 micro
	second approx 3.3$. This means that the "true" probability of
	a muon to reach the Earth's surface is $(0.5)^(3.3) approx 0.1$,
	as confirmed by empirical evidence.
]

Galilean transformations allow one to convert a set of coordinates and
velocities that are relative to a given frame of reference $S$ to a set
of coordinates relative to a different frame of reference $S'$. There
is clearly interest in extending Galilean transformations to account
for the phenomena of Special Relativity: such an extension should abide
to three constraints:

+ Fall back to Galilean transformations at low speeds;
+ Take into account both transformations in space and transformations in time;
+ Ensure that the speed of light remains the same in all reference frames.

An "educated guess" would be an expression of the form:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ x' = A(x - v t) $],
	[$ x = A(x' + v t') $]
)

Where $A$ is a to-be-determined constant that goes to $1$ as the speed
$v$ goes to $0$. To determine it, assume that both reference frames $S$
and $S'$ start in the same position $x = x' = 0$ and start in the same
time frame $t = t' = 0$.

An event happens at coordinates $(x, t)$ with respect to $S$ and at
coordinates $(x', t')$ with respect to $S'$. The information carried
by such events travels at the speed of light for a distance of $x = c t$
in $S$ and $x' = c t'$ in $S'$. Substituting in the previous expressions:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ c t' = A(c t - v t) = A t(c - v) $],
	[$ c t = A(c t' + v t') = A t'(c + v) $]
)

The first expression gives $t' = A t(1 - frac(v, c))$. Substituting into
the second:

$ c t =
  A t'(c + v) =
  A (A t(1 - frac(v, c))) (c + v) =
  A^(2) t (c - cancel(v) + cancel(v) - frac(v^(2), c)) =
  A^(2) t (c - frac(v^(2), c)) $

Solving for $A$:

$ c cancel(t) = A^(2) cancel(t) (c - frac(v^(2), c)) =>
  c^(2) = A^(2) (c^(2) - v^(2)) =>
  A = sqrt(frac(c^(2), c^(2) - v^(2))) =
  sqrt(frac(1, 1 - frac(v^(2), c^(2)))) $

Which is exactly the value $y$. An equation for time can be obtained in a
similar fashion. In total, one obtains two systems of four equations each,
called *Lorentz transformations*, that act as the relativistic counterpart
to the Galilean transformations:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ cases(x' = gamma (x - v t), y' = y, z' = z, t' = gamma (t - frac(v, c^(2))) x) $],
	[$ cases(x = gamma (x' + v t'), y = y', z = z', t = gamma (t' + frac(v, c^(2))) x') $]
)

When the velocity $v$ is much smaller than $c$, $gamma$ is close to $1$
and the ratio $v x slash c^(2)$ is close to $0$, hence "falling back" to
the Galilean transformations.

The last step in deriving the Lorentz transformations is an expression
for velocities. The definition of velocity in the Galilean laws of motion
is the derivative of space over the derivative of time. Carrying it out:

$ u' = frac(d x', d t') =
  frac(d (gamma(x - v t)), d (gamma (t - v x slash c^(2)))) =
  frac(cancel(gamma) d(x - v t), cancel(gamma) d (t - v x slash c^(2))) =
  frac(d x - v d t, d t - (v slash c^(2)) d x) =
  frac(frac(d x, d t) - v, 1 - (v slash c^(2)) frac(d x, d t)) $

But $d x slash d t$ is just $u$, giving:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ u' = frac(u - v, 1 - frac(v, c^(2)) u) $],
	[$ u = frac(u' + v, 1 + frac(v, c^(2)) u') $]
)

When $v$ is noticeably smaller than $c$, the ratio $v slash c^(2)$
is infinitesimal, hence giving the same results as the Galilean
transformations $u' = u - v$ and $u = u' + v$. Also, when $v = c$:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ u' = frac(u - c, 1 - frac(cancel(c), c^(cancel(2))) u) =
	        frac(u - c, 1 - frac(u, c)) =
	        c frac(cancel(u - c), cancel(c - u)) = -c $],
	[$ u = frac(u' + c, 1 + frac(cancel(c), c^(cancel(2))) u') =
	       frac(u' + c, 1 + frac(u', c)) =
	       c frac(cancel(u' + c), cancel(c + u')) = c $]
)

Hence preserving the constancy of the speed of light in all reference
frames.

Having introduced the relativistic $gamma$ factor also requires one to
properly adapt not just Newtonian laws of motion, but also the definition
of other physical quantities that depend on velocity, such as kinetic
energy and momentum.

The classical definition of momentum is of mass times velocity; momentum
is an important quantity in classical physics because it is always conserved.
However, it can be shown that blindly applying such definition to particles
where the Lorentz transformations are applied does not work, meaning that
different frames of reference give different value of the momentum. So either
momentum conservation should be abandoned, or the definition of momentum
ought to be revisited.

Out of the two, the second is much more plausible. First, the definition
of momentum of a particle is, as stated, mass times velocity, or mass times
space over time. However, different frames of reference are associated to
different time intervals and different lengths: the frame of reference of
choice should be the one centered in the particle, since it's the one
associated to proper time.

Let $u = Delta x slash Delta t$ be the velocity of a particle in a
frame of reference external to said particle. Let $Delta tau$ be the
time measured in the frame of reference of the particle to describe
the interlude of the same events described by $Delta t$. Define the
momentum of a particle with respect to its own frame of reference to
be $p = m u$. Given that $Delta tau = Delta t slash gamma$:

$ p = m u = m frac(Delta x, Delta tau) =
  m frac(Delta x, Delta t slash gamma) = 
  gamma m frac(Delta x, Delta t) = 
  gamma m u $

This is the expression for the relativistic momentum of a particle when
observed to have velocity $u$ from a given frame of reference. It can be
proven that, as long as Lorentz transformations are used to transition
from a frame of reference to another, the law of conservation of momentum
still holds.

It is however important to note that the $gamma$ factor that appears in
the expression for the relativistic momentum is somewhat different from
the gamma factor that appears in the Lorentz transformations. The latter
influences the velocity of a frame of reference with respect to another,
the former influences the velocity of the particle _itself_ with respect
to the frame of reference in which it is observed. For this reason, to
avoid distinction, the formula is sometimes written as $p = gamma_(p) m u$,
where the pedix $p$ stands for "particle".

Velocity also appears in the expression for Newtonian kinetic energy,
$K = frac(1, 2) m u^(2)$. Since $p = m u$, the expression can also be
written as $K = p^(2) slash 2 m$. Having extended momentum to the
relativistic case and its law of conservation, it is necessary to do
the same with energy.

Consider a particle travelling a distance $Delta x$ in a time $Delta t$,
as observed from a given frame of reference $S$. As stated earlier, the
spacetime interval $c^(2) Delta^(2) t - Delta^(2) x$ is invariant
with respect to the frames of reference. Let $Delta tau$ be the time
interval describing the same event when measured from the frame of
reference of the particle itself.

Multiplying the expression for the spacetime interval by $(m slash Delta
tau)^(2)$ gives:

$ (c^(2) Delta^(2) t - Delta^(2) x) (frac(m, Delta tau))^(2) =
  frac(m^(2), Delta^(2) tau) c^(2) Delta^(2) t - frac(m^(2), Delta^(2) tau) Delta^(2) x =
  m^(2) c^(2) frac(Delta^(2) t, Delta^(2) tau) - m^(2) frac(Delta^(2) x, Delta^(2) tau) =
  (m c)^(2) (frac(Delta t, Delta tau))^(2) - p^(2) $

Now the expression refers to the relativistic momentum of the same
particle when observed from two different reference frames. This
quantity is also invariant, since both $m$ and $Delta tau$ are
constants.

Substituting $Delta t = gamma_(p) Delta tau$ and multiplying by $c^(2)$
gives:

$ c^(2)((m c)^(2) (frac(Delta t, Delta tau))^(2) - p^(2)) =
  c^(2)(m c)^(2) (frac(gamma_(p) cancel(Delta tau), cancel(Delta tau)))^(2) - c^(2) p^(2) =
  c^(2)(gamma_(p) m c)^(2) - c^(2) p^(2) = (gamma_(p) m c^(2))^(2) - (p c)^(2) $

Since this quantity is invariant with respect to any frame of reference,
computing it with respect to one frame of reference gives the value for
any frame of reference. The most comfortable frame of reference to choose
is the one of the particle itself, where $gamma_(p) = 1$ and $p = 0$:

$ (1 dot m c^(2))^(2) - (0 dot c)^(2) = (m c^(2))^(2) - 0^(2) = (m c^(2))^(2) $

Giving:

$ (gamma_(p) m c^(2))^(2) - (p c)^(2) = (m c^(2))^(2) $

The expression involves three terms: $gamma_(p) m c^(2)$, $p c$ and
$m c^(2)$ (all three squared). The second term is the (non relativistic)
momentum of a particle multiplied by the speed of light, whereas the
third term is its mass multiplied by the speed of light. Both of these
are constants, since mass cannot change and momentum $p$ is the one
associated to a specific frame of reference, the one of the particle
itself.

The first term is much more interesting, however. Since $gamma_(p)$ has
no dimension, it has the same unit of measurement as $m c^(2)$: mass times
velocity squared is energy. It is also not constant, since $gamma_(p)$
depends on the relative velocity of the particle. Applying binomial
expansion:

$ gamma_(p) m c^(2) =
  frac(m c^(2), sqrt(1 - frac(u^(2), c^(2)))) approx
  (1 + frac(1, 2) frac(u^(2), c^(2))) m c^(2) =
  m c^(2) + frac(1, 2) m u^(2) $

The second term is clearly the (non relativistic) kinetic energy of the
particle, whereas the first is a form of energy that does not depend on
any property of the particle (its velocity, its position, ecc...) except
for its mass. That is, simply by "existing" (almost all particles have a
mass) a body possesses a form of energy.

This means that $gamma_(p) m c^(2)$ represents the total energy of the
particle. The total energy is given by a relativistic kinetic energy and
a *rest energy*:

$ E = m c^(2) + (gamma_(p) - 1) m c^(2) = E_(0) + K $

Since the relativistic kinetic energy depends on $gamma_(p)$, it means
that it's impossible for a particle's energy to grow indefinitely.

When $p$ or $u$ are $0$, meaning that the particle is at rest, one has
$E = m c^(2)$, which is a known result: the *mass-energy equivalence*.

This expression has meaning only for particles that have a mass; for
massless particles like photons, it is convenient to substitute the
newly found expression in the second expression, to get:

$ E^(2) - (p c)^(2) = E_(0)^(2) => E = sqrt((p c)^(2) + E_(0)^(2)) $

In the case of massless particles, it is sufficient to set $E_(0) = 0$
(since they have no mass, and hence no rest energy) to get $E = p c$.
This implies an interesting result: it's possible to assign momentum
to particles that have no mass. Also, even if all having mass equal to
$0$, massless particles moving at different velocities can have different
momenta.

// The mass-energy equivalence has an important consequence: mass and
// energy can turn into each other. Mass and energy may not be conserved
// on their own, but mass and energy considered together are. This is
// also known as the conservation of mass-energy.
