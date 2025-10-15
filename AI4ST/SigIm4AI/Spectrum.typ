#import "SI4AI_definitions.typ": *

The most general and powerful method for producing new signals from
sinusoids is the _additive linear combination_ (a linear combination
that can include a scalar constant). A wide class of signals can be
represented in the form:

$ x(t) = A_(0) + sum_(k = 1)^(n) A_(k) cos(2 pi f_(k) t + phi_(k)) $

Where the amplitude, frequency and phase of each signal can differ.
Or, expliciting the phasors and setting $A_(0) = X_(0)$ for clarity:

$ x(t) =
  X_(0) + sum_(k = 1)^(n) Re{A_(k) e^(j phi_(k)) e^(j 2 pi f_(k) t)} =
  X_(0) + sum_(k = 1)^(n) Re{X_(k) e^(j 2 pi f_(k) t)} $

As stated, this formula has the advantage of simplifying calculations
when having to sum multiple sinusoids. However, it introduces the need
to extract a real part out of a complex number. A different way to write
a sinusoid as the sum of complex number without having to distinguish
between a real and an imaginary part is hinted at by the inverse Euler
formula for the cosine:

$ cos(theta) =
  frac(e^(j theta) + e^(-j theta), 2) =
  frac(e^(j theta) + (e^(j theta))^(*), 2) $

Since a sinusoid is in the form $s(t) = A cos(omega_(0) t + phi)$,
it's also possible to write is as:

$ s(t) &=
  A cos(omega_(0) t + phi) =
  A (frac(e^(j (omega_(0) t + phi)) + e^(-j (omega_(0) t + phi)), 2)) =
  frac(A, 2) e^(j (omega_(0) t + phi)) + frac(A, 2) e^(-j (omega_(0) t + phi)) = \
  &= frac(A, 2) e^(j omega_(0) t) e^(j phi) + frac(A, 2) e^(-j omega_(0) t) e^(-j phi) =
  frac(1, 2) X e^(j omega_(0) t) + frac(1, 2) (X e^(j omega_(0) t))^(*) =
  frac(1, 2) z(t) + frac(1, 2) z^(*)(t) = Re{z(t)} $

This formula has an interesting interpretation. The sinusoid $s(t)$
is actually composed of a positive frequency complex exponential
$frac(1, 2) X e^(j omega_(0) t)$ and a negative frequency complex
exponential $frac(1, 2) (X e^(j omega_(0) t))^(*)$. The two have
the same amplitude, the same phase in modulus and the same radian
frequency in modulus. In other words, any sinusoid can be represented
as the sum of two complex rotating phasors that are rotating in opposite
directions (the angles have opposite sign) starting from phasors that are
complex conjugates of each other.

A negative radian frequency implies a negative cyclical frequency. It's
possible to make sense of a negative frequency by interpreting the sign
of the frequency as the direction in which the wave is moving with respect
to a given frame of reference. If the frequency is positive, the wave is
moving _towards_ the observer, if the frequency is negative, the wave is
moving _away_ from the observer.

Using this formula to express a sum of sinusoids:

$ x(t) = X_(0) + sum_(k = 1)^(n) frac(X_(k), 2) e^(j 2 pi f_(k) t) + (frac(X_(k), 2) e^(j 2 pi f_(k) t))^(*) $

Where each sinusoid is decomposed into the real part of the sum of
two rotating phasors having the same frequency in magnitude but
opposite in sign, rotating in opposite direction.

The *spectrum* of a signal is its representation as a sum of multiple
sinusoids. In particular, the last equation is called the *two-sided
representation* of a signal because it uses $n$ positive frequencies
along with the corresponding $n$ complex amplitudes and $n$ negative
frequencies along with the corresponding $n$ complex amplitudes, plus
the constant term $X_(0)$. Specifically, the two-sided representation
of a signal is the set of pairs:

$ {(0, X_(0)), (f_(1), frac(1, 2) X_(1)), (-f_(1), frac(1, 2) X^(*)_(1)),
   dots, (f_(n), frac(1, 2) X_(n)), (-f_(n), frac(1, 2) X^(*)_(n))} $

Where each pair $(f_(k), frac(1, 2) X_(k))$ denotes one contribution to
the total, with its frequency and phasor.

It is common to refer to the spectrum as the *frequency-domain
representation* of the signal, which encapsulates the smallest
amount of information needed to reconstruct it. In contrast, the
*time-domain representation* gives the values of the time waveform
itself, its explicit form. When the spectrum of a signal is small,
meaning that it doesn't have that many components, it is referred
to as a *sparse* spectrum.

#exercise[
    What is the spectrum of the following signal?

    $ x(t) = 10 + 14 cos(200 pi t − frac(pi, 3)) + 8 cos(500 pi t + frac(pi, 2)) $
] <Spectrum>
#solution[
    Writing the second and third term of the sum as the real part of a
    rotating phasor:

    $ s_(1) &=
      14 cos(200 pi t − frac(pi, 3)) =
      Re{14 e^(j (200 pi t − pi slash 3))} =
      Re{14 e^(j 200 pi t) e^(−j pi slash 3)} \
      s_(2) &=
      8 cos(500 pi t + frac(pi, 2)) =
      Re{8 e^(j (500 pi t + pi slash 2))} =
      Re{8 e^(j 500 pi t) e^(j pi slash 2)} $

    Which gives the two phasors $X_(1) = 14 e^(−j pi slash 3)$ and
    $X_(2) = 8 e^(j pi slash 2)$. The two frequencies are:

    #grid(
        columns: (0.5fr, 0.5fr),
        $ f_(1) = frac(omega_(1), 2 pi) = frac(200 cancel(pi), 2 cancel(pi)) = 100 $,
        $ f_(2) = frac(omega_(2), 2 pi) = frac(500 cancel(pi), 2 cancel(pi)) = 250 $
    )

    Giving the spectrum:

    $ {(0, 10), (100, 7 e^(−j pi slash 3)), (-100, 7 e^(j pi slash 3)),
       (250, 4 e^(j pi slash 2)), (-250, 4 e^(-j pi slash 2))} $

    Or, written as a sum:

    $ x(t) = 10 + 7 e^(−j pi slash 3) e^(j 2 pi (100) t) +
                  7 e^(j pi slash 3) e^(j 2 pi (-100) t) +
                  4 e^(j pi slash 2) e^(j 2 pi (250) t) +
                  4 e^(-j pi slash 2) e^(j 2 pi (-250) t) $
]

To simplify the notation, it is useful to introduce the following
convention:

$ a_(k) = cases(A_(0) & "if" k = 0, frac(1, 2) A_(k) e^(j phi_(k)) & "if" k != 0) $

Which allows one to rewrite the two half-phasors sum representation as a
sum that involves a single term:

$ x(t) =
  X_(0) + sum_(k = 1)^(n) frac(X_(k), 2) e^(j 2 pi f_(k) t) + (frac(X_(k), 2) e^(j 2 pi f_(k) t))^(*) =
  sum_(k = -n)^(n) a_(k) e^(j 2 pi f_(k) t) $

Assuming $f_(0) = 0$, $X_(-k) = X^(*)_(k)$ and $f_(-k) = -f_(k)$.

Enumerating the $n$ pairs $(f_(k), a_(k))$ is not particularly
informative. A useful representation of a sum of sinusoids is
the *spectrum plot*, a stem plot where each stem is positioned
in correspondence with the frequency $f_(k)$ of the $k$-th pair
and the length of the stem is proportional (or equal) to the
magnitude of $a_(k)$. Each stem is also referred to as a *spectral
line* and is also labeled with the value of $a_(k)$ itself.
Spectra of signals comprised of individual sinusoids, and not
of a sum of sinusoids, are often called *line spectra*.

#exercise[
    What is the spectrum plot of the sinusoidal signal in @Spectrum?
] <Spectrum-plot>
#solution[
    #figure(
        caption: [Spectrum plot of $x(t) = 10 + 14 cos(200 pi t − frac(pi, 3)) + 8 cos(500 pi t + frac(pi, 2))$.],
        [
         #lilaq.diagram(
         width: 12cm,
         height: 6cm,
         xlabel: $f$,
         ylabel: $norm(a)$,
         lilaq.place(-250, 4, align: left, pad(1em)[$4 e^(-j pi slash 2)$]),
         lilaq.place(-100, 7, align: left, pad(1em)[$7 e^(j pi slash 3)$]),
         lilaq.place(0, 10, align: left, pad(1em)[$10$]),
         lilaq.place(100, 7, align: left, pad(1em)[$7 e^(−j pi slash 3)$]),
         lilaq.place(250, 4, align: left, pad(1em)[$4 e^(j pi slash 2)$]),
         lilaq.stem(
            (-250, -100, 0, 100, 250),
            (4, 7, 10, 7, 4),
            stroke: 1.25pt,
            mark-size: 8pt
         )
         )
        ]
    )
]

This plot makes it easy to see the relative location of the frequencies
and the relative amplitudes of the sinusoidal components. Moreover, it
entirely captures the information necessary to encode a sum of sinusoids:
the sum itself can be reconstructed from the information present in the
plot.

In a spectrum like @Spectrum-plot the complex amplitude of each negative
frequency component is the complex conjugate of the complex amplitude at
the corresponding positive frequency component. This property is called
*conjugate symmetry* and arises whenever $x(t)$ is a real signal. This is
because any real number can be written as the sum of two complex numbers,
one being the complex conjugate of the other, due to the inverse Euler
formula.

Once a signal has been encoded as a spectrum, it becomes much easier
to manipulate, in particular when applying time-domain operations.
Since the spectrum consists of a set of frequency/complex amplitude
pairs $S = {(f_(k), a_(k))}$, operating on a signal $x(t)$ in the
time domain might influence only its frequencies, only its amplitudes
or both the frequencies and the amplitudes.

The simplest example of spectrum property is scaling a signal $x(t)$ by
a constant $gamma$: all amplitudes are scaled by $gamma$, while the
frequencies remain unchanged:

$ gamma x(t) =
  gamma sum_(k = -n)^(n) a_(k) e^(j 2 pi f_(k) t) =
  sum_(k = -n)^(n) (gamma a_(k)) e^(j 2 pi f_(k) t) $

Another simple spectrum property is adding a constant $c$; this constant
is grouped with the old DC forming a new, shifted, DC, while the other
components remain unchanged:

$ c + x(t) =
  c + sum_(k = -n)^(n) a_(k) e^(j 2 pi f_(k) t) =
  (sum_(k = -n)^(-1) a_(k) e^(j 2 pi f_(k) t)) + (c + a_(0)) + (sum_(k = 1)^(n) a_(k) e^(j 2 pi f_(k) t)) $

Obviously, if the signal had no DC, the constant $c$ becomes the DC.

Summing two signals (two spectra) is also trivial, even for signals that
do not share the same frequencies. The resulting spectrum is the sum of
the individual terms of the two spectra:

$ x_(1)(t) + x_(2)(t) =
  sum_(k = -n)^(n) a_(1, k) e^(j 2 pi f_(1, k) t) +
  sum_(k = -n)^(n) a_(2, k) e^(j 2 pi f_(2, k) t) $

If the resulting sum happens to have duplicate frequencies, the terms can
be merged together summing their phasors using @Phasor-addition-rule.

#exercise[
    Compute the sum of the following signals, expressed in spectrum form.

    $ x_(1)(t) &= 10 +
                  7 e^(−j pi slash 3) e^(j 2 pi (100) t) +
                  7 e^(j pi slash 3) e^(j 2 pi (-100) t) +
                  4 e^(j pi slash 2) e^(j 2 pi (250) t) +
                  4 e^(-j pi slash 2) e^(j 2 pi (-250) t) \
      x_(2)(t) &= 3 e^(−j pi slash 6) e^(j 2 pi (100) t) +
                  3 e^(j pi slash 6) e^(j 2 pi (-100) t) +
                  5 e^(j pi slash 4) e^(j 2 pi (200) t) +
                  5 e^(-j pi slash 4) e^(j 2 pi (-200) t) $
]
#solution[
    The two shared frequencies can be merged using @Phasor-addition-rule:

    $ 7 e^(-j pi slash 3) + 3 e^(−j pi slash 6) &=
      7(cos(-frac(pi, 3)) + j sin(-frac(pi, 3))) +
      3(cos(-frac(pi, 6)) + j sin(-frac(pi, 6))) = \
      &= 3.500 - 6.062 j + 2.598 - 1.500 j approx
      9.7 e^(-j 100 pi slash 352) \
      7 e^(j pi slash 3) + 3 e^(j pi slash 6) &=
      7(cos(frac(pi, 3)) + j sin(frac(pi, 3))) +
      3(cos(frac(pi, 6)) + j sin(frac(pi, 6))) = \
      &= 3.500 + 6.062 j + 2.598 + 1.500 j approx
      9.7 e^(j 100 pi slash 352) $

    Which gives:

    $ x_(1)(t) + x_(2)(t) &= 10 +
                            9.7 e^(−j 100 pi slash 352) e^(j 2 pi (100) t) +
                            9.7 e^(j 100 pi slash 352) e^(j 2 pi (-100) t) +
                            5 e^(j pi slash 4) e^(j 2 pi (200) t) + \
                            & 5 e^(-j pi slash 4) e^(j 2 pi (-200) t) +
                            4 e^(j pi slash 2) e^(j 2 pi (250) t) +
                            4 e^(-j pi slash 2) e^(j 2 pi (-250) t) $

    #figure(
        caption: [Spectrum plot of $x_(1)(t) + x_(2)(t)$.],
        [
         #lilaq.diagram(
         width: 12cm,
         height: 6cm,
         xlabel: $f$,
         ylabel: $norm(a)$,
         lilaq.place(-250, 4, align: right, pad(1em)[$4 e^(-j pi slash 2)$]),
         lilaq.place(-200, 5, align: right, pad(1em)[$5 e^(-j pi slash 4)$]),
         lilaq.place(-100, 9.7, align: right, pad(1em)[$9.7 e^(-j 100 pi slash 352)$]),
         lilaq.place(0, 10, align: left, pad(1em)[$10$]),
         lilaq.place(100, 9.7, align: left, pad(1em)[$9.7 e^(j 100 pi slash 352)$]),
         lilaq.place(200, 5, align: left, pad(1em)[$5 e^(j pi slash 4)$]),
         lilaq.place(250, 4, align: left, pad(1em)[$4 e^(j pi slash 2)$]),
         lilaq.stem(
            (-250, -200, -100, 0, 100, 200, 250),
            (4, 5, 9.7, 10, 9.7, 5, 4),
            stroke: 1.25pt,
            mark-size: 8pt
         )
         )
        ]
    )
]

Performing time shifting on a signal in spectrum form does not
change the frequencies, but each $k$-th phasor is multiplied by
a factor of $e^(-j 2 pi f_(k) tau)$:

$ x(t - tau) =
  sum_(k = -n)^(n) a_(k) e^(j 2 pi f_(k) (t - tau)) =
  sum_(k = -n)^(n) a_(k) e^(j 2 pi f_(k) t - j 2 pi f_(k) tau) =
  sum_(k = -n)^(n) (a_(k) e^(-j 2 pi f_(k) tau)) e^(j 2 pi f_(k) t) $

Computing the derivative with respect to time on a signal in spectrum
form does not change the frequencies, but each $k$-th phasor is multiplied
by a factor of $j 2 pi f_(k)$:

$ frac(d, d t) x(t) &=
  frac(d, d t) sum_(k = -n)^(n) a_(k) e^(j 2 pi f_(k) t) =
  sum_(k = -n)^(n) frac(d, d t) (a_(k) e^(j 2 pi f_(k) t)) =
  sum_(k = -n)^(n) a_(k) frac(d, d t) (e^(j 2 pi f_(k) t)) = \
  &= sum_(k = -n)^(n) a_(k) e^(j 2 pi f_(k) t) (frac(d, d t) (j 2 pi f_(k) t)) = 
  sum_(k = -n)^(n) (a_(k) j 2 pi f_(k)) e^(j 2 pi f_(k) t) $

If a signal has a spectrum in the form ${(a_(k), f_(k))}$, multiplying it
by a complex exponential $A e^(i phi) e^(j 2 pi f t)$ turns its spectrum
into ${(a_(k) A e^(i phi), f_(k) + f)}$:

$ A e^(i phi) e^(j 2 pi f t) x(t) =
  A e^(i phi) e^(j 2 pi f t) sum_(k = -n)^(n) a_(k) e^(j 2 pi f_(k) t) =
  sum_(k = -n)^(n) (a_(k) A e^(i phi)) e^(j 2 pi (f_(k) + f) t) $

This frequency shifting happens because multiplying exponentials is done
by summing their exponents. Note that the result of the multiplication
might not be a real signal, meaning that conjugate symmetry might not hold.

#exercise[
    Multiply the signal $x(t)$ by $C = 2 e^(j pi slash 2) e^(j 2 pi (9) t)$.

    $ x(t) = 10 + 7 e^(−j pi slash 3) e^(j 2 pi (10) t) + 7 e^(j pi slash 3) e^(j 2 pi (-10) t) $
]
#solution[
    $ C x(t) &=
      2 e^(j pi slash 2) e^(j 2 pi (9) t) (10 + 7 e^(−j pi slash 3) e^(j 2 pi (10) t) + 7 e^(j pi slash 3) e^(j 2 pi (-10) t)) = \
      &= 20 e^(j pi slash 2) e^(j 2 pi (9) t) +
      2 e^(j pi slash 2) e^(j 2 pi (9) t) 7 e^(−j pi slash 3) e^(j 2 pi (10) t) +
      2 e^(j pi slash 2) e^(j 2 pi (9) t) 7 e^(j pi slash 3) e^(j 2 pi (-10) t) = \
      &= 20 e^(j pi slash 2) e^(j 2 pi (9) t) +
      14 e^(j pi slash 6) e^(j 2 pi (19) t) +
      14 e^(j 5 pi slash 6) e^(j 2 pi (-1) t) $

    #figure(
        caption: [In blue, the spectrum plot of $x(t)$. In orange, the
                  spectrum plot of $C x(t)$. Notice how $C x(t)$ does
                  not possess the property of conjugate symmetry.],
        [
         #lilaq.diagram(
         width: 12cm,
         height: 6cm,
         xlabel: $f$,
         ylabel: $norm(a)$,
         lilaq.place(-1, 14, align: right, pad(1em)[$14 e^(j 5 pi slash 6)$]),
         lilaq.place(9, 20, align: right, pad(1em)[$20 e^(j pi slash 2)$]),
         lilaq.place(19, 14, align: right, pad(1em)[$14 e^(j pi slash 6)$]),
         lilaq.place(-10, 7, align: left, pad(1em)[$7 e^(-j pi slash 3)$]),
         lilaq.place(0, 10, align: left, pad(1em)[$10$]),
         lilaq.place(10, 7, align: left, pad(1em)[$7 e^(j pi slash 3)$]),
         lilaq.stem(
            (-10, 0, 10),
            (7, 10, 7),
            stroke: 1.25pt,
            mark-size: 8pt
         ),
         lilaq.stem(
            (-1, 9, 19),
            (14, 20, 14),
            stroke: 1.25pt,
            mark-size: 8pt
         )
         )
        ]
    )
]

If a signal $x(t)$ in spectrum form is multiplied by a real sinusoid
$A cos(2 pi f t + phi)$, something remarkable happens. Recall that
any real sinusoid (any real number, for that matter) can be broken
down as the sum of a complex number and its complex conjugate:

$ x(t) A cos(2 pi f t + phi) =
  x(t) frac(1, 2) A e^(j phi) e^(j 2 pi f t) + x(t) frac(1, 2) A e^(-j phi) e^(-j 2 pi f t) $

This means that it's necessary to apply the frequency scaling twice,
one for each complex exponential hereby constructed:

$ A cos(2 pi f t + phi) x(t) &=
  A cos(2 pi f t + phi) sum_(k = -n)^(n) a_(k) e^(j 2 pi f_(k) t) = \
  &= (frac(1, 2) A e^(j phi) e^(j 2 pi f t) sum_(k = -n)^(n) a_(k) e^(j 2 pi f_(k) t)) +
  (frac(1, 2) A e^(-j phi) e^(-j 2 pi f t) sum_(k = -n)^(n) a_(k) e^(j 2 pi f_(k) t)) = \
  &= sum_(k = -n)^(n) (a_(k) frac(1, 2) A e^(i phi)) e^(j 2 pi (f_(k) + f) t) +
  sum_(k = -n)^(n) (a_(k) frac(1, 2) A e^(-i phi)) e^(j 2 pi (f_(k) - f) t) $

Multiplying a signal by a real sinusoid effectively doubles the number
of components: each component is both upscaled and shifted to the right
and downscaled and shifted to the left.

#exercise[
    Multiply the signal $x(t)$ by $C = 2 cos(2 pi (12) t + pi slash 4)$.

    $ x(t) = 10 + 7 e^(−j pi slash 3) e^(j 2 pi (10) t) + 7 e^(j pi slash 3) e^(j 2 pi (-10) t) $
]
#solution[
    $C$ can be written as:

    $ C = 2 cos(2 pi (12) t + pi slash 4) =
      e^(j pi slash 4) e^(j 2 pi (12) t) + e^(-j pi slash 4) e^(-j 2 pi (12) t) $

    Hence:

    $ C x(t) =&
      (e^(j pi slash 4) e^(j 2 pi (12) t) + e^(-j pi slash 4) e^(-j 2 pi (12) t))
      (10 + 7 e^(−j pi slash 3) e^(j 2 pi (10) t) + 7 e^(j pi slash 3) e^(j 2 pi (-10) t)) = \
      & e^(j pi slash 4) e^(j 2 pi (12) t) (10 + 7 e^(−j pi slash 3) e^(j 2 pi (10) t) + 7 e^(j pi slash 3) e^(j 2 pi (-10) t)) + \
      & e^(-j pi slash 4) e^(-j 2 pi (12) t) (10 + 7 e^(−j pi slash 3) e^(j 2 pi (10) t) + 7 e^(j pi slash 3) e^(j 2 pi (-10) t)) = \
      & 10 e^(j pi slash 4) e^(j 2 pi (12) t) +
        7 e^(-j pi slash 12) e^(j 2 pi (22) t) +
        7 e^(j 7 pi slash 12) e^(j 2 pi (2) t) + \
      & 10 e^(-j pi slash 4) e^(j 2 pi (-12) t) + 
        7 e^(-j 7 pi slash 12) e^(j 2 pi (-2) t) +
        7 e^(j pi slash 12) e^(j 2 pi (-22) t) $

    In the more compact notation:

      $ {(-22, 7 e^(j pi slash 12)), (22, 7 e^(-j pi slash 12)),
         (12, 10 e^(j pi slash 4)), (-12, 10 e^(-j pi slash 4)),
         (2, 7 e^(j 7 pi slash 12)), (-2, 7 e^(-j 7 pi slash 12))} $

    #figure(
        caption: [In blue, the spectrum plot of $x(t)$. In orange, the
                  spectrum plot of $C x(t)$. Notice how $C x(t)$ does
                  not possess the property of conjugate symmetry.],
        [
         #lilaq.diagram(
         width: 12cm,
         height: 6cm,
         xlabel: $f$,
         ylabel: $norm(a)$,
         lilaq.place(-22, 7, align: right, pad(1em)[$7 e^(j pi slash 12)$]),
         lilaq.place(-12, 10, align: right, pad(1em)[$10 e^(-j pi slash 4)$]),
         lilaq.place(-2, 7, align: right, pad(1em)[$7 e^(-j 7 pi slash 12)$]),
         lilaq.place(2, 7, align: left, pad(1em)[$7 e^(j 7 pi slash 12)$]),
         lilaq.place(12, 10, align: left, pad(1em)[$10 e^(j pi slash 4)$]),
         lilaq.place(22, 7, align: left, pad(1em)[$7 e^(-j pi slash 12)$]),
         lilaq.stem(
            (-22, -12, -2, 2, 12, 22),
            (7, 10, 7, 7, 10, 7),
            stroke: 1.25pt,
            mark-size: 8pt
         )
         )
        ]
    )
]

Note that when the frequency of the sinusoid is greater than the largest
frequency in the spectrum of the signal, the upshifted and downshifted
spectra do not overlap.
