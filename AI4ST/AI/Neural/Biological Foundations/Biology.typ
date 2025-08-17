#import "../../AI_definitions.typ": *

The goal (or dream?) of artificial intelligence is to reproduce into
silicon the way humans and animals think, their intelligence, their
cognitive capabilities, their ability to learn from experience. To do
so, it is necessary to analyse the apparatus responsible for cognition
and decision making: the *nervous system*. The nervous system comprises
the *sensory systems*, responsible for gathering information from the
outside (smell, sight, sound, ecc...), the *motory system*, responsible
for motion, and the *brain*, that gathers and centralises inputs from
the nervous system to elaborate.

The fundamental component of the nervous system is the *neuron*, a cell
that collects and transmits electrical activity. A neuron #footnote[Not
all neurons have the same, identical structure. This isn't particularly
relevant, however: the interest isn't in describing the nervous system
in detail, but to device an abstract representation of a neuron that
can be implemented in a computer.] is constituted by a central body
called *soma* that contains the nucleus, many small ramifications called
*dendrites* and a long extension called *axon*. Neurons are connected
with each other in an intricate structure and communicate with each other.
The axon of a neuron is almost attached (very close, but not touching) to
the dendrites of its neighboring neurons. The point of (almost) contact
between an axon and the dendrites is called a *synapse*.

#figure(
	image("neuron.png", width: 80%),
	caption: [Schematic representation of a neuron.
	          [#link("https://commons.wikimedia.org/w/index.php?curid=28761830")[Original image]
		  by BruceBlaus, licensed under
	          #link("https://creativecommons.org/licenses/by/3.0/legalcode.en")[CC BY 3.0].]],
)

Neurons communicate with the ones they are attached with using
electricity. More specifically, this is done by releasing through
the synapse by the terminal section of the axon certain chemicals,
called *neurotransmitters*. These act on the membrane of the receiving
dendrite and change its polarization (there's a slight potential
difference between the inside and the outside of the cell membrane
of the neuron). Depending on the type of the released neurotransmitter,
the potential difference may be reduced or increased on the side of the
dendrite. Synapses that reduce the potential difference are called
*excitatory*, those that increase it are called *inhibitory*.

The potential difference in a single neuron is close to be negligible,
but the cumulative potential difference of thousands of neurons
connected together is sufficient to stimulate the axon of a neuron
to propagate the difference to its neighbors. Simply put: if a neuron
receives sufficient amount of "stimulation", meaning that a certain
"stimulation threshold" is reached, then it will release said
"stimulation" towards its neighbors and restore its equilibrium
state. The number of impulses that a neuron transmits per second
is also referred to as its *firing rate*.

The connections between neurons are fixed at one's birth. Neurons are
a class of cell that never undergoes division. That is, the number of
neurons in the nervous system either decreases or remains the same,
it's (almost) impossible to replace a damaged or dead neuron with a
new one. As a matter of fact, the neurons in the brain slowly and slowly
degrade almost as one is born, until one by one they all die.

This (heavily) simplified description of the nervous system still hints
at some advantages that an architecture built on this model could offer:

- The nervous system is _inherently parallel_: different sections of the
  system can work independently of each other and at the same time;
- The nervous system is _fault tolerant_: if a neuron stops working for
  some reason, its neighbors can still operate, and the overall system
  is still functional;
- The nervous system has _slow phase-out_: neurons slowly loose their
  capabilities, not abruptly. There is time for the architecture to
  accomodate the change.
