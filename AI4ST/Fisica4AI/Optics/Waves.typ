#import "../Phys4AI_definitions.typ": *

A *wave* is defined as an organized disturbance moving in space and
in time at a given speed. The most known form of wave is the *transverse
wave*, where the displacement is _perpendicular_ to the direction in which
the wave travels. For example, a wave travels along a string in a horizontal
direction while the particles that make up the string oscillate vertically.

Most waves necessitate a _medium_, a substance whose particles are displaced
from their position of equilibrium when coming into contact with the wave and
that return to their position of equilibrium once the wave has passed. These
are called *mechanical waves*: water waves, sound waves and the vibrations
on the chords of a violin are all examples of mechanical waves. Their speed
depend on the medium and on the source that generates it, not on the wave
itself.

The waves that are the easiest to treat from a mathematical perspective are
the *one-dimensional waves*, waves that move along in a single dimension; in
the transverse wave case, this dimension is the $y$ axis. A one-dimensional
wave is entirely described by and equation that relates, for all possible
points in space and instants in time, its displacement. It is therefore a
two-variable functions in the form $D(x, t)$:

#align(
	center,
	[$D(x, t)$ = the displacement along the $y$ axis at spacial coordinates
	 $x$ and temporal coordinates $t$]
)

The most-known form of one-dimensional wave is the *sinusoidal wave*,
a wave whose source is a body that is oscillating with *simple harmonic
motion* (*SHM*). The equation of a sinusoidal wave at time $t = 0$ is:

$ D(x, 0) = A sin(2 pi frac(x, lambda) + phi_(0)) $

$A$ is the *amplitude* of the wave, and represents the highest possible
value (in modulo) of displacement that the wave can reach. $lambda$ is
the *wavelength*, and represents the distance in space between two
consecutive amplitudes. The term $phi_(0)$ is a *phase constant* that
characterizes the initial conditions.

The equation for the displacement of a sinusoidal wave is a periodic
function with period $lambda$. This can be shown as:

$ D(x + lambda, 0) &= A sin(2 pi frac(x + lambda, lambda) + phi_(0)) =
  A sin(2 pi (frac(x, lambda) + frac(cancel(lambda), cancel(lambda))) + phi_(0)) =
  A sin(2 pi frac(x, lambda) + 2 pi + phi_(0)) = \
  &= A sin((2 pi frac(x, lambda) + phi_(0)) + 2 pi) =
  A sin(2 pi frac(x, lambda) + phi_(0)) = D(x, 0) $

The *period* $T$ of a sinusoidal wave is the time needed for the value
of the displacement to move between two consecutive amplitudes. The
reciprocal of the period is the *frequency* $f$, that represents the
number of times the wave has reached a peak in one unit of time:

$ T = frac(1, f) $

There is an important relationship between the wavelength and the period
of a sinusoidal wave: each of its amplitudea travels forward a distance
of exactly one wavelength $lambda$ during a time interval of exactly one
period $T$. Because speed is distance divided by time, and the speed of
a sinusoidal wave is constant, the wave speed must be:

$ v = frac(lambda, T) = lambda f $

The velocity of a wave depends on the medium in which the wave is moving:
a medium can have more or less inertia and hence be more or less resistant
to perturbation. The frequency of a wave depends only on the source that
is generating the wave, on the number of "pulses" or "beats" that it
generate every unit of time. Hence, the wavelength of a wave depends
both on the medium and on the source.

To extend the equation to time istants different from $t = 0$, it is
sufficient to point out the fact that $D(x, t)$ is exactly $D(x - v t, 0)$.
This is because the sinusoidal wave is periodic with period $lambda$:
if the wave had displacement $D(x, t)$ at point $x$ and time $t$, then
it had the exact same displacement at position $x - v t$ when it started
moving. Therefore:

$ D(x, t) = D(x - v t, 0) = A sin(2 pi frac(x - v t, lambda) + phi_(0)) =
  A sin(2 pi (frac(x, lambda) - frac(v t, lambda)) + phi_(0)) $

Since $v slash lambda = 1 slash T$:

$ D(x, t) = A sin(2 pi (frac(x, lambda) - frac(t, T)) + phi_(0)) $

This equation is not only periodic in space with period $lambda$, but it
is also periodic in time with period $T$ (hence the name period).

It's possible to write in a more compact form of the wave equation for
sinusoidal waves by introducing two auxiliary quantities: the *angular
frequency* $w$ and the *wave number* $k$. The former is $2 pi$ multiplied
by the frequency, the latter is $2 pi$ over the wavelength:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ omega = 2 pi f = frac(2 pi, T) [second^(-1)] $],
	[$ k = frac(2 pi, lambda) [metre^(-1)] $]
)

Substituting these quantities in the sinusoidal wave equation gives:

$ D(x, t) =
  A sin(2 pi (frac(x, lambda) - frac(t, T)) + phi_(0)) =
  A sin(frac(2 pi, lambda) x - frac(2 pi, T) t + phi_(0)) =
  A sin(k x - omega t + phi_(0)) $

This is the most widely employed form of the equation.

It is often useful to depict the displacement of sinusoidal waves (and
of waves in general) graphically, but it presents a challenge. This is
due to the fact that the displacement depends both on space and on time,
hence it is not possible to represent both at the same time. The only way
forward is to set either space or time at a fixed value so that the
displacement becomes a single-valued function.

By fixing the spacial coordinate $x$ to a value $x_(0)$ and having the
temporal coordinate $t$ move freely one obtains the *history graph* of
the wave; by fixing the temporal coordinate $t$ to a value $t_(0)$ and
having the spacial coordinate $x$ move freely one obtains the *snapshot
graph*. The history graph represents the evolution of the displacement
of the wave in a single point in space with respect to time; the snapshot
graph represents the evolution of the displacement of a wave in a single
time frame with respect to space.

#exercise[
	Consider a sinusoidal wave with $A = 2 metre$, $lambda = 1.5 metre$,
	$phi_(0) = pi$ and $T = 2.5 second$. What would be its history graph
	at $x = 0$ and snapshot graph at $t = 0$?
]
#solution[
	#grid(
		columns: (0.5fr, 0.5fr),
		[#image("history_graph.svg")],
		[#image("snapshot_graph.svg")]
	)
]
