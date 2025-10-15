#import "SI4AI_definitions.typ": *

Signals can have an arbitrary complicated equation, but such equations
can be constructed from the ground up starting from simple building blocks
#footnote[Note that, again, there is no difference between a signal and
the equation that models it, because the equation captures all information
related to the signal. As a matter of fact, the expressions "the signal
having equation $s(t)$" and "the signal $s(t)$" are equivalent].

The simplest one-dimensional continuous time signals are the *sinusoidal
signals*, or *sinusoids* for short. The equation describing a sinusoidal
signal has the following general form:

$ s(t) = A cos(omega t + phi) $

Where $cos$ is the trigonometric cosine function. Note that sinusoids
are periodical functions (the cosine function multiplied by a constant),
hence $s(t) = s(t + 2 pi)$ for any time instant $t$. As for the other
components:

- $A$ is the *amplitude*, the maximum value that the signal can attain
  (the height of any "spike"). Since $cos$ oscillates between $+1$ and
  $-1$, a sinusoid oscillates between $-A$ and $+A$;
- $omega$ is the *radian frequency*, the number of oscillations that
  the signal makes every $2 pi$ seconds;
- $phi$ is the *phase*, the displacement from $0$.

The radian frequency is the *cyclic frequency*, or just *frequency*
for short, multiplied by $2 pi$. The frequency $f$ is the number of
oscillations that the signal makes every second. The *period* $T$ is
the time the signal takes to make an entire oscillation. The frequency
and the period are the reciprocal of each other.

#grid(
    columns: (0.5fr, 0.5fr),
    [$ f = 2 pi omega $],
    [$ T = frac(1, f) = frac(2 pi, omega) $]
)

Notice that choosing $f = 0$ gives a perfectly valid sinusoid: a constant
function equal to its amplitude (since $cos(0) = 1$). In the context of
signals, a sinusoid having frequency $0$ is often called DC (as in "direct
current").

#figure(
	caption: [Plot of the sinusoidal signal $s(t) = 5 cos(0.3 pi t + 1.5 pi)$.],
    [#let t = lilaq.linspace(-5, 10, num: 500)
     #lilaq.diagram(
        width: 12cm,
        height: 6cm,
        xlabel: $t$,
        ylabel: $s(t)$,
        lilaq.plot(stroke: 1.25pt, mark-size: 0pt, t, t => 5 * calc.cos(0.3 * calc.pi * t + 1.5 * calc.pi))
    )]
)

#figure(
	caption: [Plot of the sinusoidal signal $s(t) = 3 cos(3 pi t - 0.5 pi)$.],
    [#let t = lilaq.linspace(-5, 10, num: 1500)
     #lilaq.diagram(
        width: 12cm,
        height: 6cm,
        xlabel: $t$,
        ylabel: $s(t)$,
        lilaq.plot(stroke: 1.25pt, mark-size: 0pt, t, t => 3 * calc.cos(3 * calc.pi * t - 0.5 * calc.pi))
    )]
)

#figure(
	caption: [Plot of the sinusoidal signal $s(t) = cos(0) = 1$ (A valid sinusoid nonetheless).],
    [#let t = lilaq.linspace(-5, 10, num: 10)
     #lilaq.diagram(
        width: 12cm,
        height: 6cm,
        xlabel: $t$,
        ylabel: $s(t)$,
        lilaq.plot(stroke: 1.25pt, mark-size: 0pt, t, t => calc.cos(0))
    )]
)

Technically speaking, it's also possible to use the sine instead of
the cosine to construct sinusoidal signals, since $sin(omega t) =
cos(omega t - pi slash 2)$ for any $omega$ and $t$. However, the
cosine often takes precedence because $cos(0) = 1$, while $sin(0) = 0$,
making it much easier in computations.

Plotting a sinusoidal function is relatively straightforward, since
knowing its shape inside a single period gives the shape of the entire
function. Knowing the expression of a sinusoid $A cos(omega t + phi)$,
to plot it it is necessary to:

- Compute its period;
- Find any value of $t$ that results in a peak;
- Find any value of $t$ that results in $0$;

Since $omega$ is known, the period $T$ is just $2 pi slash omega$. To
find any $t$ that results in a peak, let it be $t_(p)$, it suffices to
observe how the peaks of a sinusoid are equal to their amplitude. This
means that $t_(p)$ is given by imposing $s(t_(p)) = A$:

$ cancel(A) = cancel(A) cos(omega t_(p) + phi) =>
  cos(omega t_(p) + phi) = 1 =>
  omega t_(p) + phi = 2 pi k
  space "with" k in ZZ $

Since there is no difference in choosing one peak over another, the
simplest choice is $k = 0$. Solving for $t_(p)$:

$ omega t_(p) + phi = 2 pi 0 =>
  omega t_(p) + phi = 0 =>
  t_(p) = -frac(phi, omega) $

To find a $t$ that results in $0$, let it be $t_(c)$, it suffices to
impose $s(t_(c)) = 0$ and solve for $t_(c)$:

$ 0 = A cos(omega t_(c) + phi) =>
  cos(omega t_(c) + phi) = 0 =>
  omega t_(c) + phi = frac(pi, 2) + 2 pi k
  space "with" k in ZZ $

Choosing $k = 0$ once again:

$ omega t_(c) + phi = frac(pi, 2) + 2 pi 0 =>
  omega t_(c) + phi = frac(pi, 2) =>
  omega t_(c) = frac(pi, 2) - phi =>
  t_(c) = frac(pi, 2 omega) - frac(phi, omega) $

But $-phi slash omega$ is the time resulting in a peak. Moreover, since
$omega = 2 pi f$:

$ t_(c) = frac(pi, 2 omega) - frac(phi, omega) =
  frac(cancel(pi), 4 cancel(pi) f) + t_(p) =
  frac(1, 4 f) + t_(p) =
  frac(T, 4) + t_(p) $

#exercise[
    Plot the sinusoid $s(t) = 20 cos(0.6 pi t - 0.4 pi)$
]
#solution[
    The period is given by:

    $ T = frac(2 pi, omega) =
      frac(2 cancel(pi), 0.6 cancel(pi)) =
      frac(2, 0.6) approx 3.333 $

    The time resulting in a peak is given by:

    $ t_(p) = -frac(phi, omega) =
    -frac(-0.4 cancel(pi), 0.6 cancel(pi)) =
    frac(0.4, 0.6) approx 0.666 $

    The time resulting in a $0$ crossing is given by:

    $ t_(c) = frac(T, 4) + t_(p) =
      frac(3.333, 4) + 0.666 approx
      0.834 + 0.666 = 1.5 $

    #figure(
        caption: [Plot of the sinusoidal signal $s(t) = 20 cos(0.6 pi t - 0.4 pi)$.],
        [#let t = lilaq.linspace(-5, 10, num: 500)
         #lilaq.diagram(
            width: 12cm,
            height: 6cm,
            xlabel: $t$,
            ylabel: $s(t)$,
            lilaq.plot(stroke: 1.25pt, mark-size: 0pt, t, t => 20 * calc.cos(0.6 * calc.pi * t - 0.4 * calc.pi))
        )]
    )
]

Note that sketching any sinusoid by hand can be done with continuous
strokes, while plotting it with a computer necessarely requires a
discretization of the sinusoid. A digital plot is nothing but the
quantized sinusoid with a sampling period so small that the function
appears continuous.

If the equation of a sinusoid is known, there is no need to introduce
a system convert from continuous to discrete: it is sufficient to
evaluate the function at sufficiently many distinct and equally
spaced time instants. Given a sinusoid $s(t) = A cos(omega t + phi)$
and a sampling period $T_(s)$, the vector of samples is given by solving
$s(n T_(s)) = A cos(omega n T_(s) + phi)$ for a sufficient number of $n$.

In general, a computer plotting device performs what's called a *linear
interpolation*, connecting adjacent points with a straight line: for
sufficiently small segments, a straight line and a smooth curve are
indistinguishable. Intuitively, having a greater number of points will
result in a better approximation. In turn, a smaller sampling period
will increase the number of points, because more points can "fit" into
one period. This also means that a sinusoid with a smaller period (higher
frequency) requires a smaller sampling period to achieve the same accuracy.
As it will be clear later, there are techniques that go beyond linear
interpolation and that, under the right assumptions, can reconstruct
the original sinusoid with perfect accuracy.

#figure(
	caption: [Plot of $s(t) = 5 cos(0.3 pi t + 1.5 pi)$ with three different
	          choices of the sampling period.],
    [#let t1 = lilaq.linspace(-5, 10, num: 15)
     #let t2 = lilaq.linspace(-5, 10, num: 35)
     #let t3 = lilaq.linspace(-5, 10, num: 100)
     #lilaq.diagram(
        width: 12cm,
        height: 6cm,
        xlabel: $t$,
        ylabel: $s(t)$,
        lilaq.plot(stroke: 1.25pt, mark-size: 8pt, t1, t1 => 5 * calc.cos(0.3 * calc.pi * t1 + 1.5 * calc.pi)))
     #lilaq.diagram(
        width: 12cm,
        height: 6cm,
        xlabel: $t$,
        ylabel: $s(t)$,
        lilaq.plot(stroke: 1.25pt, mark-size: 8pt, t2, t2 => 5 * calc.cos(0.3 * calc.pi * t2 + 1.5 * calc.pi)))
     #lilaq.diagram(
        width: 12cm,
        height: 6cm,
        xlabel: $t$,
        ylabel: $s(t)$,
        lilaq.plot(stroke: 1.25pt, mark-size: 8pt, t3, t3 => 5 * calc.cos(0.3 * calc.pi * t3 + 1.5 * calc.pi)))
    ]
)

// FIXME: time shifting is absent

If so desired, it's also possible to go the other way around, from the
plot of a sinusoid to its equation. To do so:

- Determine the period, which is the time interval between any two points
  having the same value of $s(t)$. The simplest choices are either two
  adjacent $0$ crossings or two adjacent peaks;
- Compute the radian frequency from the period as $2 pi slash T$;
- Determine the amplitude, which is just the height of any peak;
- Compute the phase by using the formula $t = - phi slash omega$
  backwards, solving for $phi$ instead of $t$. The value of $t$
  is $t_(p)$, the time instant closest to $0$ that results in a
  peak.

#exercise[
    What is the equation of the following sinusoid?

    #figure(
        caption: [Plot of a sinusoid, whose equation is to be determined.],
        [#let t = lilaq.linspace(-5, 10, num: 500)
         #lilaq.diagram(
            width: 12cm,
            height: 6cm,
            xlabel: $t$,
            ylabel: $s(t)$,
            lilaq.plot(stroke: 1.25pt, mark-size: 0pt, t, t => 3.5 * calc.cos(0.7 * calc.pi * t - 0.875 * calc.pi)))
        ]
    )
]
#solution[
    - The sinusoid has its first peak (starting from $0$) at about
      $1.25$ and its second peak at about $4.1$, hence its period
      is $4.1 - 1.25 = 2.85$;
    - Its radian frequency is $2 pi slash 2.85 approx 0.7 pi$;
    - The amplitude is about $3.5$;
    - The phase is given by $phi = -omega t_(p) = -0.7pi dot 1.25 = -0.875$.

    Which means that the sought for equation is:

    $ s(t) = 3.5 cos(0.7 pi t - 0.875 pi) $
]

Most real waves can hardly be modeled by a simple sinusoid functions,
since some attenuation over time or over distance has to be taken into
account. Given a real value $alpha$ that represents the dampening of
the strength of the signal, a more accurate waveform has the following
equation:

$ s(t) = A(t) cos(omega t + phi) = A e^(-t slash alpha) cos(omega t + phi) $

Where the amplitude has now a time dependence, instead of being a constant.
Since the negative exponential is a decreasing function, the amplitude of
the signal will decrease over time.

#figure(
    caption: [In blue, the plot of the sinusoidal signal $s(t) = 20 e^(-t slash 5)
              cos(0.6 pi t - 0.4 pi)$, using a sampling period of $T_(s) = 0.03$.
              In orange, the time-dependent amplitude $A(t) = 20 e^(-t slash 5)$.],
    [#let t = lilaq.linspace(-5, 10, num: 500)
     #lilaq.diagram(
        width: 12cm,
        height: 6cm,
        xlabel: $t$,
        ylabel: $s(t)$,
        lilaq.plot(stroke: 1.25pt, mark-size: 0pt, t, t => 20 * calc.exp(-t / 5) * calc.cos(0.6 * calc.pi * t - 0.4 * calc.pi)),
        lilaq.plot(stroke: 1.25pt, mark-size: 0pt, t, t => 20 * calc.exp(-t / 5))
    )]
)

Another way to construct elaborate signals is to sum more sinusoids.
The problem of summing sinusoids is that computing the sum of cosines
(or sines, for that matter) is tedious. However, it's possible to
rewrite the sinusoid in a slightly different form that aides in
performing mathematical manipulations.

Recall how a complex number in polar form can be converted into the
exponential form #footnote[It is customary to use $j$ instead of $i$
to denote the imaginary unit when dealing with signals, because $i$
is often used to denote the intensity of a signal. This notation is
commonplace in all fields of engineering.]:

$ r e^(j theta) = r cos(theta) + r j sin(theta) $

Given an amplitude $A$, a radian frequency $omega_(0)$ and a phase $phi$,
a *complex exponential signal* is defined as:

// FIXME: why the 0 in pedix?

$ z(t) =
  A e^(j (omega_(0) t + phi)) =
  A cos(omega_(0) t + phi) + A j sin(omega_(0) t + phi) $

Whose magnitude is the constant $A$ and whose argument is the
time-dependent expression $omega_(0) t + phi$. Both the real
part and the imaginary part of the complex number represent a
sinusoid; the two sinusoids have the same amplitude and frequency,
differing only by a phase factor of $pi slash 2$. This is because:

$ z(t) =
  A cos(omega_(0) t + phi) + A j sin(omega_(0) t + phi) =
  A cos(omega_(0) t + phi) + A j cos(omega_(0) t + phi - frac(pi, 2)) $

In particular, notice how:

$ s(t) =
  Re{z(t)} =
  Re{A e^(j (omega_(0) t + phi))} =
  A cos(omega_(0) t + phi) $

Which means that the sinusoids so far considered are just the real part
of complex exponential signals.

#figure(
	caption: [Plot of the complex exponential $z(t) = 5 cos(0.3 pi t +
	          1.5 pi) + 5 j cos(0.3 pi t + 1.5 pi - 0.5 pi)$, with both
	          the real part and the imaginary part. The two differ by
	          $pi slash 2$.],
    [#let t = lilaq.linspace(-5, 10, num: 500)
     #lilaq.diagram(
        width: 12cm,
        height: 6cm,
        xlabel: $t$,
        ylabel: $s(t)$,
        lilaq.plot(stroke: 1.25pt, label: "real part", mark-size: 0pt, t, t => 5 * calc.cos(0.3 * calc.pi * t + 1.5 * calc.pi)),
        lilaq.plot(stroke: 1.25pt, label: "imaginary part", mark-size: 0pt, t, t => 5 * calc.cos(0.3 * calc.pi * t + 1.5 * calc.pi - 0.5 * calc.pi)))
    ]
)

Recall that the geometric interpretation of the multiplication of two
complex numbers is a rotation in the complex plane (angles are added
and magnitudes are scaled). The complex exponential signal $z(t)$ can
be written as the product of two complex numbers:

$ z(t) =
  A e^(j (omega_(0) t + phi)) =
  A e^(j omega_(0) t + j phi) =
  A e^(j omega_(0) t) e^(j phi) =
  X e^(j omega_(0) t) $

Where $X = A e^(j phi)$ is called the *complex amplitude*, or *phasor*
#footnote[The term phasor is common in electrical circuit theory]. This
means that $z(t)$ is the product of a complex constant (the phasor) and
a complex-valued function dependent on time $e^(j omega_(0) t)$.

By writing $theta(t) = omega_(0) t + phi$, that is by expliciting the
time dependence of the angle, it's also possible to write a complex
exponential signal as:

$ z(t) = X e^(j omega_(0) t) = A e^(j theta(t)) $

At a given time instant $t$, the value of the complex exponential
signal $z(t)$ is a complex number whose magnitude is $A$ and
whose angle is $theta(t)$.

Consider the representation of $z(t) = A e^(j theta(t))$ in the complex
plane: as $t$ increases, the complex number only changes in angle but
not in magnitude, as the time dependency is only present in the angle.
This means that the corresponding vector in the complex plane keeps
rotating without ever changing in magnitude. This is why a complex
exponential signal is also called *rotating phasor*.

The "speed" at which the vector rotates, meaning how much area of the
plane is traversed as time increases, depends on the radian frequency
$omega_(0)$: the higher $omega_(0)$, the "faster" the rotation. Moreover,
the sign of the radian frequency determines the direction of the rotation:
if $omega_(0)$ is positive, the rotation is counterclockwise, since the
angle $theta$ increases; if $omega_(0)$ is negative, the rotation is
clockwise, since the angle $theta$ decreases. Rotating phasors are said
to have *positive frequency* if they rotate counterclockwise, and *negative
frequency* if they rotate clockwise.

A rotating phasor makes one complete revolution every time the angle
$theta(t)$ changes by $2 pi$ radians. The time it takes to make one
revolution is also equal to the period $T_(0)$ of the complex exponential
signal, so:

$ omega_(0) T_(0) = (2 pi f_(0)) T_(0) = 2 pi
  => T_(0) = frac(1, f_(0)) $

Notice that the phase $phi$ defines where the phasor is pointing when
$t = 0$.

#figure(
    caption: [From the complex exponential signal $z(t) = 5 e^(j (0.3 pi t
              + 1.5 pi))$, discarding the phasor one gets $e^(j 0.3 pi t)$.],
    lilaq.diagram(
        width: 12cm,
        height: 6cm,
        lilaq.place(0.587, 0.809, align: left, pad(1em)[$z(t = 1)$]),
        lilaq.place(-0.951, 0.309, align: right, pad(1em)[$z(t = 3)$]),
        lilaq.place(0.809, -0.587, align: left, pad(1em)[$z(t = 6)$]),
        lilaq.line((0, 0), (0.587, 0.809), tip: tiptoe.stealth, stroke: blue),
        lilaq.line((0, 0), (-0.951, 0.309), tip: tiptoe.stealth, stroke: blue),
        lilaq.line((0, 0), (0.809, -0.587), tip: tiptoe.stealth, stroke: blue)
    )
)

As already hinted at, complex exponential signals allow one to compute
the sum of sinusoids with ease. This is remarkably true when summing
sinusoids having the same radian frequency.

#theorem("Phasor addition rule")[
    Let $A_(k) cos(omega_(0) t + phi_(k))$ with $k in {1, 2, dots, n}$
    be a family of $n$ sinusoids, all having the same radian frequency.
    Then their sum is still a sinusoid. In particular:

    $ sum_(k = 1)^(n) A_(k) cos(omega_(0) t + phi_(k)) = A cos(omega_(0) t + phi) $

    Where:

    #grid(
        columns: (0.5fr, 0.5fr),
        $ A = norm(sum_(k = 1)^(n) A_(k) e^(j phi_(k))) $,
        $ phi = arg(sum_(k = 1)^(n) A_(k) e^(j phi_(k))) $
    )
] <Phasor-addition-rule>
#proof[
    Recall that, for any sinusoid:

    $ A cos(omega_(0) t + phi) = Re{A e^(j (omega_(0) t + phi))} $

    Then:

    $ sum_(k = 1)^(n) A_(k) cos(omega_(0) t + phi_(k)) =
      sum_(k = 1)^(n) Re{A_(k) e^(j (omega_(0) t + phi_(k)))} =
      sum_(k = 1)^(n) Re{A_(k) e^(j omega_(0) t) e^(j phi_(k))} $

    But the sum of the real part of $n$ complex numbers is the real
    part of their sum, hence:

    $ sum_(k = 1)^(n) A_(k) cos(omega_(0) t + phi_(k)) &=
      sum_(k = 1)^(n) Re{A_(k) e^(j omega_(0) t) e^(j phi_(k))} =
      Re{sum_(k = 1)^(n) A_(k) e^(j omega_(0) t) e^(j phi_(k))} = \
      &= Re{e^(j omega_(0) t) sum_(k = 1)^(n) A_(k) e^(j phi_(k))} $

    The sum of complex numbers is itself a complex number.
    With $display(A e^(j phi) = sum_(k = 1)^(n) A_(k) e^(j phi_(k)))$:

    $ sum_(k = 1)^(n) A_(k) cos(omega_(0) t + phi_(k)) &=
      Re{e^(j omega_(0) t) sum_(k = 1)^(n) A_(k) e^(j phi_(k))} =
      Re{e^(j omega_(0) t) A e^(j phi)} = \
      &= Re{A e^(j (omega_(0) t + phi))} = 
      A cos(omega_(0) t + phi) $
]

The only caveat to using @Phasor-addition-rule is that the sum
$sum_(k = 1)^(n) A_(k) e^(j phi_(k))$, in order to be computed,
requires the $k$ phasors to be converted in rectangular form.

#exercise[
    Compute the sum of the two sinusoids:

    #grid(
        columns: (0.5fr, 0.5fr),
        $ s_(1)(t) = 1.7 cos(20 pi t + frac(70 pi, 180)) $,
        $ s_(2)(t) = 1.9 cos(20 pi t + frac(200 pi, 180)) $
    )
]
#solution[
    $s_(1)(t)$ and $s_(2)(t)$, written as the real part of a complex
    exponential, are:

    $ s_(1)(t) &=
      Re{1.7 e^(j (20 pi t + 70 pi slash 180))} =
      Re{1.7 e^(j 20 pi t) e^(j 70 pi slash 180)} \
      s_(2)(t) &=
      Re{1.9 e^(j (20 pi t + 200 pi slash 180))} =
      Re{1.9 e^(j 20 pi t) e^(j 200 pi slash 180)} $

    Which gives the two phasors:

    $ X_(1) &=
      1.7 e^(j frac(70 pi, 180)) =
      1.7 (cos(frac(70 pi, 180)) + j sin(frac(70 pi, 180))) approx
      1.7 (0.34 + j 0.94) =
      0.58 + j 1.60 \
      X_(2) &=
      1.9 e^(j frac(200 pi, 180)) =
      1.9 (cos(frac(200 pi, 180)) + j sin(frac(200 pi, 180))) approx
      1.9 (-0.94 - j 0.34) =
      -1.79 - j 0.65 $

    And their sum is:

    $ X =
      X_(1) + X_(2) =
      (0.58 + j 1.60) + (-1.79 - j 0.65) =
      -1.21 + j 0.95 $

    #figure(
        caption: [The two phasors $X_(1)$ and $X_(2)$ and their sum $X$,
                  plotted on the complex plane.],
        lilaq.diagram(
            width: 9cm,
            height: 6cm,
            lilaq.place(0.58, 1.60, align: left, pad(1em)[$X_(1)$]),
            lilaq.place(-1.79, -0.65, align: right, pad(1em)[$X_(2)$]),
            lilaq.place(-1.21, 0.95, align: right, pad(1em)[$X$]),
            lilaq.line((0, 0), (0.58, 1.60), tip: tiptoe.stealth, stroke: blue),
            lilaq.line((0, 0), (-1.79, -0.65), tip: tiptoe.stealth, stroke: blue),
            lilaq.line((0, 0), (-1.21, 0.95), tip: tiptoe.stealth, stroke: fuchsia),
            lilaq.line((0.58, 1.60), (-1.21, 0.95), stroke: (paint: blue, dash: "dashed")),
            lilaq.line((-1.79, -0.65), (-1.21, 0.95), stroke: (paint: blue, dash: "dashed"))
        )
    )

    The magnitude and the argument of $X$ are:

    #grid(
        columns: (0.5fr, 0.5fr),
        $ norm(X) = sqrt((-1.21)^(2) + (0.95)^(2)) approx 1.54 $,
        $ arg(X) = tan^(-1)(frac(0.95, -1.21)) approx frac(142 pi, 180) $
    )

    Which means that:

    $ s(t) = s_(1)(t) + s_(2)(t) = 1.54 cos(20 pi t + frac(142 pi, 180)) $

    #figure(
        caption: [Plot of the sinusoids $s_(1)(t) = 1.7 cos(20 pi t +
                70 pi slash 180)$ and $s_(2)(t) = 1.9 cos(20 pi t +
                200 pi slash 180)$ and of their sum $s(t) = 1.54
                cos(20 pi t + 142 pi slash 180)$.],
        [#let t = lilaq.linspace(-0.1, 0.1, num: 500)
         #lilaq.diagram(
            width: 12cm,
            height: 6cm,
            xlabel: $t$,
            ylabel: $s(t)$,
            lilaq.plot(stroke: 1.25pt + rgb(62, 144, 217, 50), label: [$s_(1)(t)$], mark-size: 0pt, t, t => 1.7 * calc.cos(20 * calc.pi * t + (70 * calc.pi) / 180)),
            lilaq.plot(stroke: 1.25pt + rgb(254, 169, 14, 50), label: [$s_(2)(t)$], mark-size: 0pt, t, t => 1.9 * calc.cos(20 * calc.pi * t + (200 * calc.pi) / 180)),
            lilaq.plot(stroke: 1.25pt + fuchsia, label: [$s(t)$], mark-size: 0pt, t, t => 1.54 * calc.cos(20 * calc.pi * t + (142 * calc.pi) / 180)))
        ]
    )
]

// EXTRA: if there are more than one signal to be summed?
// You can convert the expression into a system of equations
// and solve it with Gaussian elminination
