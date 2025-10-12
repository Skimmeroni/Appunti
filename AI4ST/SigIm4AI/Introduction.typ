#import "SI4AI_definitions.typ": *

A *signal* is defined as "something" that carries information. In general,
this "something" is a pattern of variations of a physical quantity that
can be manipulated, stored, or transmitted by physical processes. Sadly,
this definition is not particularly informative, since it encompasses
a wide range of eterogeneous physical phenomena. A notable property of
signals is that they can be represented or encoded in many equivalent
ways, convertible into one another.

The most natural language to describe signals is mathematics.
Signals can have one or more than one dimension, depending on
how many variables are needed to describe them. Some examples
of one-dimensional signals are:

- Sound, like music or human speech;
- A sensor's output, like those of a thermal sensor or of a motion sensor;
- Physiological signals, like EEGs;
- Financial data, like market trends and exchange rates.

#figure(
	image("eeg.png"),
	caption: [EEG of a mouse during different stages of sleep.
	         [#link("https://commons.wikimedia.org/w/index.php?curid=44033654")[Original image]
	          by Andrii Cherninskyi, licensed under
	          #link("https://creativecommons.org/licenses/by-sa/4.0")[CC BY-SA 4.0].]],
)

#figure(
	image("rate.png"),
	caption: [Bitcoin/US Dollar exchange date from 2014 to 2024.
	         [#link("https://commons.wikimedia.org/w/index.php?curid=156272632")[Original image]
	          by Wikideas1, licensed under
	          #link("https://creativecommons.org/publicdomain/zero/1.0")[CC0].
	          Original file in `webp` format.]],
)

From one dimensional signals it is possible to generalize to
multidimensional signals. Examples of two dimensional signals
are images (photographs, thermal captures, radiographies, ...).
Examples of three dimensional signals are 3D models (point
clouds, meshes, ...).

A *system* is any process or apparatus that has a signal as input,
performs some manipulation on such signal and then returns another
signal as output. The output signal can be the original signal but
in a different representation or a completely different signal
altogether.

Many signals, such as sound, are naturally thought of as a pattern of
variations in time. The evolution of a signal with respect to time is
described by what's called the *time waveform*, a function $s(t)$ with
a single independent variable $t$, representing time, and whose output
is a displacement or disturbance of sort. $s(t)$ can be of arbitrary
complexity, and may not be possible to write it as a closed-form
expression, but it exists nonetheless. As a matter of fact, it is
possible to directly refer to a signal by its waveform.

#figure(
	caption: [The plot of a continuous time signal.],
	[#let t = lilaq.linspace(-5, 10, num: 500)
	 #lilaq.diagram(
		width: 12cm,
		height: 6cm,
		xlabel: $t$,
		ylabel: $s(t)$,
		lilaq.plot(stroke: 1.25pt, mark-size: 0pt, t, t => 6 * calc.cos(0.3 * calc.pi * t) +
                                                       2 * calc.cos(1.2 * calc.pi * t) +
                                                       2 * calc.cos(1.8 * calc.pi * t)))
	]
) <Signal>

Most real-world signals vary continuously, meaning that their time
waveform has the entire number line as its domain. For this reason
they are called *continuous time signals*. However, most systems and
in particular all digital systems cannot operate with continuous
quantities, only discrete quantities. For this reason, it is convenient
to convert a continuous time signal into a *discrete time signal*, by
quantizing or discretizing its wave form.

The most intuitive way to quantize a time signal is by sampling it
at isolated, equally spaced points in time #footnote[It's also possible
to have unequally spaced samples, but the mathematical underpinning is
hard to tackle.]. The newly obtained signal is still a function $s$ of
time, but having $ZZ$ instead of $RR$ as domain. To distinguish between
a continuous time waveform and a discrete time waveform, the latter uses
square brackets instead of round brackets. $s[n]$ is related to $s(n)$
in the following way:

$ s[t] =
  cases(s(n T_(s)) & "if" n in ZZ,
        "undefined" & "otherwise") $

Where $T_(s)$ is the *sampling period*, the time interval between one
instance of sampling and the next. Without knowing what the sampling
period is, $s[n]$ is a mere vector of numbers with no semantics.

#figure(
	caption: [The signal in @Signal, sampled with a sampling period of $0.06$],
	[#let t = lilaq.linspace(-5, 10, num: 250)
	 #lilaq.diagram(
		width: 12cm,
		height: 6cm,
		xlabel: $t$,
		ylabel: $s(t)$,
		lilaq.plot(stroke: 0pt, mark-size: 3pt, t, t => 6 * calc.cos(0.3 * calc.pi * t) +
                                                       2 * calc.cos(1.2 * calc.pi * t) +
                                                       2 * calc.cos(1.8 * calc.pi * t)))
	]
)

Quantizing a signal necessarely entail a loss of information, because
all (countably infinite) points between two sampled time instants are
lost. However, if the number of sampled points is sufficient, the
original signal can be reconstructed with a surprinsingly high degree
of accuracy. The sampling period should not be too small, or the number
of points would require too much memory to be stored. There has to be
some tradeoff between sampling accuracy (quality) and space occupied
(quantity). There is no silver bullet when choosing a sampling period:
the choice is problem-dependent.

Not all signals can be thought of as being time dependent. For example,
(still) images clearly do not depend on time. A better representation
for an image would be a function of two independent variables $p(x, y)$,
representing the spatial coordinates. The output of the function is the
intensity of the color, having chosen an appropriate encoding. As for
signals depending on time, sampling is also possible for images.

Systems, not only signals, can be represented as functions. Consider
a system that has continuous signals both as argument and as return
value: this is referred to as a *continuous-time system*. A one-dimensional
continuous-time system can be represented as a function $Tau$ that has a
continuous signal $x(t)$ as input and another continuous signal $y(t)$ as
output:

$ y(t) = Tau {x(t)} $

Consider instead a system that has discrete signals both as argument
and as return value: this is referred to as a *discrete-time system*.
A one-dimensional discrete-time system can be represented as a function
$Tau$ that has a discrete signal $x(t)$ as input and another discrete
signal $y(t)$ as output:

$ y[n] = Tau {x[n]} $

Alongside the mathematical representation, systems are also represented
using *block diagrams*, diagrams where the each rectangle (block) denotes
a sub-component of a system and the arrows denote the flow of operation.
To represent a continuous-time system that has a one-dimensional signal
$x(t)$ as input and another one-dimensional signal $y(t)$ as output, one
would do the following:

#figure(
    caption: [Block diagram representation of $Tau {x(t)}$.],
    diagram(
			node-stroke: 1.5pt,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((0, 0), shape: rect, [$T{dot}$], name: <Tau>),
			edge((-1, 0), <Tau>, marks: (none, "stealth"), label: $x(t)$),
			edge(<Tau>, (1, 0), marks: (none, "stealth"), label-pos: 1, label: $y(t) = Tau {x(t)}$),
    )
)

One example of a system is a *sampler*: a sampler has a continuous
signal as input and, given a certain sampling period, returns the
vector of sampled points as output. A sampler is often referred to
as an *ideal continuous-to-discrete converter* because no real-world
sampler can possibly compute the value of the signal at each point
in time with perfect accuracy (it is still a valid theoretical model,
however). The block diagram representation of a sampler would look
like this:

#figure(
    caption: [Block diagram representation of a sampler.],
    diagram(
			node-stroke: 1.5pt,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((0, 0), shape: rect, [Ideal \ C-to-D \ Converter], name: <Tau>),
			edge((-1, 0), <Tau>, marks: (none, "stealth"), label: $x(t)$),
			edge(<Tau>, (1, 0), marks: (none, "stealth"), label-pos: 1, label: $x(n) = x(n T_(s))$),
			edge((0, 1), <Tau>, marks: (none, "stealth"), label: $T_(s)$)
    )
)

//Two classes of compression: lossy (some information is discarded) and lossless (almost no information is discarded).
