#import "../AI_definitions.typ": *

*Neurons* are first and foremost studied by neurobiology and neurophyisiology.
The interest of artificial intelligence is to mimic the way biological
neurons work, so that the same model can be applied to non-living beings.  
In particular, the interest is to study the way living beings collect
information through senses, the way they process this collected information
and the way they learn from experience.   

Neurons have a a core in the form of the nucleus that receives information
from other neurons collected information. When the nucleus receives a
sufficient aumount of stimulation, it releases back information on nearby
neurons. The connection between the simulated neuron and the stimulating
one is called *synapsis*; an excited neuron induces the synapsis to release
chemicals called *neurotransmitters*, received from the *dendrites* of the
receiving neuron.

If a neuron receives enough stimulation from its dendrites, it decides
to send in turn a signal to other neurons through an electric signal.
The *axon* propagate the electric stimulus from the dendrites to the
nucleus. When a neuron sends an electric signal, we say that the neuron
_fired_.

A real computer cannot, as is, completely capture the complexity of a real
brain.

#figure(
	image("neuron.png", width: 80%),
	caption: [Schematic image of a neuron.
	          By BruceBlaus,
	          #link("https://creativecommons.org/licenses/by/3.0/legalcode.en")[CC BY 3.0],
	          via Wikimedia Commons.
	          #link("https://commons.wikimedia.org/w/index.php?curid=28761830")[original image]],
)

Advantages of neural networks:

- High parallelism, which entails speedup;
- Fault tolerance, even if a large part of the network is
  failing the overall network might still work (not always,
  but close to);
- If some neurons get degraded, we slowly loose our capabilities,
  but never abruptly. Failing nodes can be phased slowly.

In first approximation, any living being has an input facility (smell,
touch, taste), which deliver information to a neuron pool connected to
an output. The idea is to have a model that approximates this structure
but without the "living being" part.

