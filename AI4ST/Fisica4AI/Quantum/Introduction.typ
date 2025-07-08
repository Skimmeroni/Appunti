#import "../Phys4AI_definitions.typ": *

*Quantum mechanics* was a new paradigm developed in stages to answer
questions that classical physics was unable to answer. In particular,
it is a framework that is necessary to model reality at very small
scales (atoms and molecules).

The first staple point of quantum mechanics is the idea that energy
is not a _continuous_ quantity, but is instead a _discrete_ quantity,
that is, an integer multiple of a fixed elementary value.

The fundamental physical constant that regulates the size of this
fundamental energy bit is called the *Planck constant*, denoted as $h$:

$ h = 6.626 times 10^(-34) joule dot second $

Since this value is very small, on large scales energy appears
continuous, because the "steps" between different energy values
are infinitesimal and become relevant only on small scales.

The second staple point of quantum mechanics is that the difference
between particles and waves becomes blurred. In this sense, it is
possible for matter particles to exhibit wave-like properties and
it is possible for waves to exhibit particle-like properties.

=== Black body radiation

The first problem that quantum mechanics aided in solving is the
description of the emitted radiation of a *black body*. A black
body is an idealized physical body that is capable of absorbing
any electromagnetic radiation, regardless of its frequency or
angle of incidence, and that therefore emits back energy only
and exclusively because of this absorbtion.

The spectrum of all the frequencies of electromagnetic radiations
emitted from a black body, also referred to as *emission spectrum*,
is given by:

$ I(f) = frac(d^(4) E, d theta d A cos (theta) d t d f) =
  frac(d^(4) Phi, d theta d A cos(theta) d f) $

Where $E$ is the energy, $A$ is the surface area, $theta$ is the
angle of emission, $t$ is the timem $f$ is the frequency and $Phi$
is the flux. Since $A$ and $theta$ are effectively chosen by the
experimenter, and are therefore always known, the only variable
at play is the frequency (or the wavelength, which is just its
reciprocal).

Experimentally, the emission spectrum forms a curved shape with a
peak at a certain wavelenght $lambda_("max")$. It is possible to
explicitly define the relationship between these two quantities
as follows:

$ I(f, T) = frac(2 pi h f^(3), c^(2)) frac(1, exp(frac(h f, k_(B) T)) - 1) $

Where $T$ is the temperature, $h$ is the Planck constant and $k_(B)$
is the *Boltzmann constant*:

$ k_(B) = 1.38 times 10^(-23) joule / kelvin $

The total energy emitted by the black body is given by:

$ E_("tot") = sigma T^(4) $

Where $sigma$ is the *Stefan-Boltzmann constant*:

$ sigma 5.67 times 10^(-8) frac(watt, metre^(2) kelvin^(4)) $

The formula suggests an intuitive result, mainly that the amount of
energy emitted increases as the temperature increases, as vice versa.

It can be shown that the value of $lambda_("max")$ is inversely
proportional to the temperature.

It is to be expected that the aforementioned equation for
$I(f, T)$ were to be derived from Maxwell equations. Interestingly,
there is no way to do so. To derive the expression for $I(f, T)$ it
is necessary to assume that each particle acts as an harmonic oscillator
that emits energy is chunks, not as a continuous stream.

Given a certain frequency, a single chunk of energy $delta E$ is given
by:

$ delta E = h f $

=== Photoelectric effect

The second phenomena that quantum mechanics aided in explaining was the
*photoelectric effect*. This phenomena is the expulsion of electrons,
called _photoelectrons_, from a piece of metal when hit by light. This
happens because the energy given to the plate by the light is sufficient
to break the bond that links electrons to their nucleus, and are thus
ejected.

It is possible to experimentally determine the number of electrons that
are ejected from the plate and their energy with respect to the light
frequency and intensity, and then derive from Maxwell equations the
corresponding equations and see if the results match.

In the framework of classical mechanics, the energy transfer from light
to electrons is no different than heating an object. This process requires
time, so it is expected that when the plate is illuminated there should be
some delay before the plate starts emitting electrons. Whan happens instead
is that the electrons are emitted immediately, as soon as the plate is hit.

It should also be reasonable that an higher light intensity would correspond
to an higher energy of the photoelectrons. Instead, the intensity of the
light has no influence on the energy of the photoelectrons, which is instead
proportional to the frequency of the light.

The third puzzling observation is that the photoelectric effect only happens
when the incoming light has a frequency equal or above a certain threshold,
specific for each metal. In classical mechanics this has no explanation,
since the photoelectric effect should happen, albeit with different degree
of intensity, when employing light of any frequency.

The quantum explanation is instead to assume that light is composed of
elementary massless particles called *photons*, whose energy is given
by the black body harmonic oscillator model. If this is the case, all
three issues are solved, because:

+ If each electron is hit by photons one by one, there's no need to wait
  for the body to absorb energy, since energy absorbtion is "one-shot".
  Therefore, the electron explusion is instantaneous; 
+ Since $E = h f$, energy is indeed dependent on the frequency;
+ If the absorbed energy is insufficient, the electron is immediately
  recaptured by the charge of the nucleus. Being the energy dependent
  on the frequency, this explains the existence of a frequency threshold. 

=== Gasses and radiation

When a gas is traversed by light, it is expected that the overall resulting
frequency of the light is lowered, but preserved. In a similar fashion, when
light is induced to emit light (by a sparkle), it is expected that every
frequency is emitted. What is observed instead is that, for each gas, only
specific frequencies are emitted/preserved.

The nuclear model of the atom was tested in an experiment by Rutherford.
Of course, it is not possible to study atoms simply with a microscope,
because the scale is too small even for the greatest magnifier. An
alternative approach is to employ electric charges, since both electrons
and protons are charged.

An extremely thin plate of gold is used as a probe. Gold is used because it
is both very dens and very soft, and is therefore possible to craft extremely
thin plates. A radioactive source emits alpha particles (which are just helium
nuclei). A detector entirely surrounds the plate, so that it is possible to
observe where (and if) alpha particles are deflected. What happens is that
some particles, albeit in small number, are indeed deflected, sometimes with
great angle, whereas in a non-nuclei model of the atom all particles would
have stroke through.

The proper model of the atom was worked out by Rutherford, who imagined
the atom as an incredibly dense nucleus of positive charges with electrons
orbiting around it, so that the electromagnetic force between the two acts
as a centripetal force. The deflection of the alpha particles are then caused
by the electromagnetic repulsion of the nuclei when alpha particles get
too close to them.

The problem with the model is that the electron orbiting around the nucleus,
in order to be able to maintain its orbit, would emit radiation, which in
turn means it would gradually loose angular momentum until it would spiral
onto the nucleus. Even assuming this to be true, the time for this to happen
would be too narrow for matter to exist.

A solution was to assume that the electron does indeed orbit around the
nucleus, but can only find itself at very specific distances from it. For
this to be possible, it is necessary to assume that the angular momentum
of the electron is quantized, according to the formula:

$ abs(p) = m v r = n frac(h, 2 pi) "with" n in NN $

In particular, the energy of the electron can be found by employing
Coulomb's Law and the expression for the electric potential:

$ E = K + U = - frac(1, 4 pi epsilon_(0)) frac(e^(2), 2 r) $

Where $e$ is the electric charge of the electron and $r$ is its
distance from the nucleus.

Being the energy quantized, the only non constant member of the
equation, $r$, must also be quantized. This means that $r$ cannot
be lower than a certain threshold, which is determined as $0.53
times 10^(-10) metre$.

Each possible value of energy that an electron can possess is called
an *energy level*. Each time an electron exchanges energy with the
environment, it hops from one energy level to another. In particular,
by releasing energy it goes down one level, by absorbing energy it
goes up one level.

Let $E_(0)$ be the lowest possible energy level (the one associated to
($r = 0.53 times 10^(-10) metre$). It is possible to relate the energy
of a generic level $n$ with respect to $E_(0)$:

$ E_(n) = frac(k e^(2), 2 n^(2) E_(0)) $

Since $E = h f$, this explains why gasses can absorb/release only
certain frequencies, because they are the ones that match the (fixed)
energy amounts needed for electrons to move.
