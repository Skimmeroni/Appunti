#import "../AI_definitions.typ": *

A *Threshold Logic Unit* (*TLU*), also known as *perceptron* or
*McCulloch-Pitts neuron* #footnote[The terminology is all over
the place: the three mathematical objects have different degree
of complexity. This is an oversimplification] is a mathematical
structure that models, in a very simplified way, how neurons
operate.

A TLU has $n$ inputs $x_(1), x_(2), dots, x_(n)$, each weighted by
a weight $w_(1), w_(2), dots, w_(n)$, that generates a single binary output
$y$. If the sum of all the inputs multiplied by their weights is a value
greater or equal than a given threshold $theta$, the output $y$ is equal
to $1$, to $0$ otherwise:

$ y = cases(1 & "if" display(sum_(i = 1)^(n) w_(i) x_(i)) gt.eq theta,
		     0 & "otherwise") $

The inputs can be collected into a single input vector $bold(x) = (x_(1),
dots, x_(n))$ and the weights into a weight vector $bold(w) = (w_(1), dots,
w_(n))$. This way, the output $y$ is equal to $1$ if the scalar product
between $bold(w)$ and $bold(x)$ is greater or equal than $theta$:

$ y = cases(1 & "if" angle.l bold(w)\, bold(x) angle.r gt.eq theta,
		     0 & "otherwise") $

#figure(
	caption: [A common way of representing a TLU. The processing unit
              is drawn as a circle, with the threshold in its center.
              Inputs are drawn as arrows entering the TLU from the left,
              with their respective weights above. The output is an arrow
              exiting the TLU from the right.],
	[#diagram(
		node-stroke: 1.5pt + blue,
		edge-stroke: 1.5pt,
		spacing: 4em,

		node((-1.75, 0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
		node((-1.75, -0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[n]])),
		node((-1.75, 0), fill: none, stroke: none, text(font: "Noto Sans", [#math.dots.v])),
		node((0, 0), text(font: "Noto Sans", [#math.theta]), radius: 2em, name: <Theta>),

		edge((-1.5, 0.5), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [w#sub[1]])),
		edge((-1.5, -0.5), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [w#sub[n]])),
		edge(<Theta>, (1.5, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
	)],	
)

The analogy between TLUs and biological neurons is straightforward. The
output of a TLU is analogous to the firing of a neuron: an output equal
to $1$ corresponds to the firing of a neuron, whereas an output equal to
$0$ corresponds to a neuron insufficiently stimulated to be firing. A
positive weight corresponds to an excitatory synapse, that increases the
amount of stimulation received by the neuron, while a negative weight
corresponds to an inhibitory synapse, that reduces the amount of stimulation.

#exercise[
	Construct a TLU with two inputs whose threshold is $+4$ and whose
	(two) weights are $+3$ and $+2$ respectively.
]
#solution[
	#figure(
		caption: [A TLU with $x_(1), x_(2)$ as inputs, $w_(1) = +3,
		          w_(2) = +2$ as weights and $theta = +4$ as threshold.],
		[#diagram(
			node-stroke: 1.5pt + blue,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((-1.75, 0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
			node((-1.75, -0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
			node((0, 0), text(font: "Noto Sans", [+4]), radius: 2em, name: <Theta>),

			edge((-1.5, 0.5), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge((-1.5, -0.5), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+3])),
			edge(<Theta>, (1.5, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
		)]
	)
]

Since the purpose of a TLU is to model the neurons in the brain, the
interest is in understanding how many mathematical functions can a TLU
encode. It is easy to construct TLUs that can compute all four basic
logical connectives: `AND`, `OR`, `NOT` and `IF...THEN`.

#figure(
	caption: [Going clockwise from top left: a TLU that computes
	          conjunction, disjunction, implication and negation.
	          In this context, the inputs $x_(1)$ and $x_(2)$ are
	          assumed to be either $0$ or $1$. Of course, there
	          are many other choices of weights and thresholds
	          that encode the same functions.],
	[#grid(
		columns: (0.5fr, 0.5fr),
		row-gutter: 30pt,
		[#diagram(
			node-stroke: 1.5pt + blue,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((-1.75, 0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
			node((-1.75, -0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
			node((0, 0), text(font: "Noto Sans", [+3]), radius: 2em, name: <Theta>),

			edge((-1.5, 0.5), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge((-1.5, -0.5), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<Theta>, (1.5, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
		)],
		[#diagram(
			node-stroke: 1.5pt + blue,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((-1.75, 0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
			node((-1.75, -0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
			node((0, 0), text(font: "Noto Sans", [+1]), radius: 2em, name: <Theta>),

			edge((-1.5, 0.5), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge((-1.5, -0.5), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<Theta>, (1.5, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
		)],
		[#diagram(
			node-stroke: 1.5pt + blue,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((-1.75, 0), fill: none, stroke: none, text(font: "Noto Sans", [x])),
			node((0, 0), text(font: "Noto Sans", [0]), radius: 2em, name: <Theta>),

			edge((-1.5, 0), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [-1])),
			edge(<Theta>, (1.5, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
		)],
		[#diagram(
			node-stroke: 1.5pt + blue,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((-1.75, 0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
			node((-1.75, -0.5), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
			node((0, 0), text(font: "Noto Sans", [-1]), radius: 2em, name: <Theta>),

			edge((-1.5, 0.5), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge((-1.5, -0.5), <Theta>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [-2])),
			edge(<Theta>, (1.5, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
		)]
	)]
)

To further investigate the capabilities of a TLU, notice how the weighted
summation that determines its output is very similar to an $n$-dimensional
linear function. That is, by substituting $gt.eq$ with $=$, one obtains
an $n$-dimensional straight line:

$ sum_(i = 1)^(n) w_(i) x_(i) = theta =>
  sum_(i = 1)^(n) w_(i) x_(i) - theta = 0 =>
  w_(1) x_(1) + w_(2) x_(2) + dots + w_(n) x_(n) - theta = 0 $

As a matter of fact, the line $sum_(i = 1)^(n) w_(i) x_(i) - theta = 0$
acts as a *decision border*, partitioning the $n$-dimensional Euclidean
hyperplane into two half-hyperplanes: one containing $n$-dimensional
points that give an output of $1$ when fed to the TLU and the other
containing points that give an output of $0$.

To deduce which of the two regions of space is which, it suffices
to inspect the coefficients of the line equation. By definition,
the weights $w_(1), dots, w_(n)$ are the coefficients of a vector
that is perpendicular to $sum_(i = 1)^(n) w_(i) x_(i) - theta = 0$.
By traslating said vector onto any point on the line, one obtains
which side of the hyperplane contains the points that give $1$ when
fed to the TLU: the one that the vector is pointing to.

More formally, two sets of points are called *linearly separable*
if there exists a linear function, called *decision function*, that
partitions the euclidean hyperplane into two half-planes, each containing
one of the two sets. A set of points is called *convex* if it's possible
to connect each point of the set with straight lines without crossing the
boundaries of the set. The *convex hull* of a set of points is its the
smallest superset that is convex. If two sets of points are both convex
and disjoint, they are linearly separable.


#figure(
	caption: [The two sets of points on the left (drawn with different
	          colors) is linearly separable. The one on the right is not],
	[#image("separable.svg")]
)

By extension, a binary function (a function that has two possible outputs)
is said to be linearly separable if the set of inputs that give the first
output and the set of inputs that give the second output are linearly
separable sets. A single TLU can therefore only encode linearly separable
functions. Indeed, `AND`, `OR`, `NOT` and `IF...THEN` are linearly separable
functions.

#figure(
	caption: [Going clockwise from top left: a cartesian plane
			  partitioned by the function of the TLU that computes
			  a TLU that computes conjunction, disjunction, implication
			  and negation.],
	[#grid(
		columns: (0.5fr, 0.5fr),
		row-gutter: 30pt,
		[#image("AND.svg")],
		[#image("OR.svg")],
		[#diagram(
			edge((-1, 0), (4, 0), stroke: 0.75pt),
			node((2.5, 0), fill: blue, "", radius: 2pt),
			node((0, 0), fill: blue, "", radius: 2pt),
			node((0, -0.25), "0"),
			node((2.5, -0.25), "1"),
			edge((1.25, 0), (0.5, 0), marks: (none, "stealth"), stroke: 1pt + blue),
			edge((1.25, -2), (1.25, 2), stroke: 1pt + blue)
		)],
		[#image("IF-THEN.svg")]
	)]
)

A single TLU can therefore model all possible binary functions if and
only if all possible binary functions are linearly separable. Unfortunately,
this is clearly not the case. For example, it is trivial to show that the
biimplication and the logical `XOR` are not linearly separable. The fact
that TLUs cannot encode basic functions as `XOR` renders them very limited
in their scope.

Even though a single TLU can do little, it is possible to connects more
TLUs together, creating a _network_ of threshold logic units. This can
be done by breaking down a complicated boolean function into approachable
functions, each representable by a TLU, and using the outputs of TLUs as
inputs of other TLUs. This way, each subsection of the network partitions
the (hyper)plane into sub-(hyper)planes that are then recollected together.
More formally: by applying a coordinate transformation, moving from the
original domain to the image domain, the set of points become linearly
separable.

#exercise[
	Construct a network of threshold logic units that encode biimplication.
]
#solution[
	One possibility is as follows:

	#figure(
		caption: [A network of TLUs that encodes the biimplication.],
		[#diagram(
			node-stroke: 1.5pt + blue,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((-1.5, 0.75), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
			node((-1.5, -0.75), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
			node((0, 0.75), text(font: "Noto Sans", [-1]), radius: 2em, name: <Theta1>),
			node((0, -0.75), text(font: "Noto Sans", [-1]), radius: 2em, name: <Theta2>),
			node((1, 0), stroke: 1.5pt + fuchsia, text(font: "Noto Sans", [+3]), radius: 2em, name: <Theta3>),

			edge((-1.25, 0.75), <Theta1>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [-2])),
			edge((-1.25, -0.75), <Theta1>, marks: (none, "latex"), label-pos: 0.4, label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge((-1.25, 0.75), <Theta2>, marks: (none, "latex"), label-pos: 0.4, label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge((-1.25, -0.75), <Theta2>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [-2])),
			edge(<Theta1>, <Theta3>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<Theta2>, <Theta3>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<Theta3>, (2, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [y]))
		)]
	)

	The idea is to deconstruct the biimplication $A <-> B$ as
	$(A -> B) and (B -> A)$. Each of the three functions (two
	single implications and one conjunction) is, when considered
	on its own, linearly separable.

	#figure(
		caption: [The euclidean plane partitioned by the two implications
		          are in blue and in red. The strip in the middle (in
		          fuchsia) and the rest of the plane are now linearly
		          separable.],
		[#image("biimplication.svg", width: 75%)]
	)
]

It can be shown that all Boolean functions with an arbitrary number of
inputs can be computed by networks of TLUs, since any Boolean function
can be rearranged in the disjunctive normal form (or conjunctive normal
form). A Boolean function in disjunctive normal form is only constituted
by a streak of `or` each constituted by `and` (potentially negated),
which are all linearly separable.

In particular, a TLU network of two layers will suffice: let $y = f(x_(1),
dots, x_(n))$ be a Boolean function of $n$ variables. It is possible to
construct a network of threshold logic units that represents $y$ applying
this algorithm:

+ Rewrite the function $y$ in disjunctive normal form:

  $ D_(f) = K_(1) or dots or K_(m) =
    (l_(1, 1) and dots and l_(1, n))
    or dots or
    (l_(m, 1) and dots and l_(m, n)) =
    or.big_(j = 1)^(m) (and.big_(i = 1)^(n) l_(j, i)) $

  Where each $l_(j, i)$ can be either non-negated (positive literal) or
  negated (negative literal)
+ For each $K_(j)$ construct a TLU having $n$ inputs (one input for each
  variable) and the following weights and threshold:

  #grid(
	columns: (0.5fr, 0.5fr),
	[$ w_(j, i) = cases(+2 "if" l_(j, i) "is a positive literal",
	                    -2 "if" l_(j, i) "is a negative literal") $],
	[$ theta_(j) = n - 1 + frac(1, 2) sum_(i = 1)^(n) w_(j, i) $]
  )
+ Create one output neuron, having $m$ inputs (equal to the number of TLUs
  created in the previous steps), threshold equal to $1$ and all weights
  equal to $2$.

/*
Intuitively, the neurons in the first layer describe an hyperplane that 
cuts the first hypercube... To then compute the disjunction...
*/

#exercise[
	Construct a TLU network for the boolean function:

	$ F(A, B, C, D) =
	  (A and B and C) or
	  (overline(A) and B and D) or
	  (A and B and overline(C) and overline(D)) $
]
#solution[
	#align(
		center,
		[#diagram(
			node-stroke: 1.5pt + blue,
			edge-stroke: 1.5pt,
			spacing: 4em,

			node((-4, +1.5), name: <D>, fill: none, stroke: none, text(font: "Noto Sans", [D])),
			node((-4, +0.5), name: <C>, fill: none, stroke: none, text(font: "Noto Sans", [C])),
			node((-4, -0.5), name: <B>, fill: none, stroke: none, text(font: "Noto Sans", [B])),
			node((-4, -1.5), name: <A>, fill: none, stroke: none, text(font: "Noto Sans", [A])),

			node((0, 1), text(font: "Noto Sans", [+6]), radius: 2em, name: <Theta1>),
			node((0, 0), text(font: "Noto Sans", [+4]), radius: 2em, name: <Theta2>),
			node((0, -1), text(font: "Noto Sans", [+3]), radius: 2em, name: <Theta3>),
			edge(<A>, <Theta1>, marks: (none, "latex"), label-pos: 0.4, label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<B>, <Theta1>, marks: (none, "latex"), label-pos: 0.2, label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<C>, <Theta1>, marks: (none, "latex"), label-pos: 0.2, label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<A>, <Theta2>, marks: (none, "latex"), label-pos: 0.4, label-angle: auto, label: text(font: "Noto Sans", [-2])),
			edge(<B>, <Theta2>, marks: (none, "latex"), label-pos: 0.2, label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<D>, <Theta2>, marks: (none, "latex"), label-pos: 0.5, label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<A>, <Theta3>, marks: (none, "latex"), label-pos: 0.4, label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<B>, <Theta3>, marks: (none, "latex"), label-pos: 0.2, label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<C>, <Theta3>, marks: (none, "latex"), label-pos: 0.2, label-angle: auto, label: text(font: "Noto Sans", [-2])),
			edge(<D>, <Theta3>, marks: (none, "latex"), label-pos: 0.4, label-angle: auto, label: text(font: "Noto Sans", [-2])),

			node((2, 0), stroke: 1.5pt + fuchsia, text(font: "Noto Sans", [+1]), radius: 2em, name: <Theta4>),
			edge(<Theta1>, <Theta4>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<Theta2>, <Theta4>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<Theta3>, <Theta4>, marks: (none, "latex"), label-angle: auto, label: text(font: "Noto Sans", [+2])),
			edge(<Theta4>, (3, 0), marks: (none, "latex"), label-pos: 1.1, label-side: center, label: text(font: "Noto Sans", [Y]))
	)])
]

The aforementioned method for constructing a TLU consists in finding an
$n$-dimensional hyperplane that separates a convex set into two subsets,
one containing values for which the TLU outputs $1$ and one containing
values for which the TLU outputs $0$. However, this method is feasible
only if the dimension of the sets is small.

First of all, if the dimension of the sets is greater than $3$, it's
impossible to give it a visual representation. Secondly, this method
requires a "visual inspection" of the set to identify the chosen
line/plane, meaning that it is hardly possible to encode the process
into an algorithm to be fed to a computer, and has to be carried out
"by hand" instead. Finally, even if the number of dimensions is small,
finding a linear separation for a set can still be tedious.

To construct an automated process that is capable of generate a TLU
given a boolean function, a different approach is needed. The idea
is to start with randomly generated values for the weights and the
threshold of the TLU, trying out the TLU with input data to see if
its outputs match the expected outputs, tuning the TLU parameters in
accord if this isn't the case and repeating the process until the
output of the TLU matches the output of the function. This process
of stepwise tuning of the TLU is also referred to as the *training*
of the TLU.

To achieve the goal of training a TLU, it is first necessary to
quantify "how much" the outputs of the TLU and the outputs of the
function to encode differ. This quantification is given by an _error
function_ $e(w_(1), dots , w_(n), theta)$, that taken in input the
$n$ weigths $w_(1), dots, w_(n)$ of a TLU and the threshold $theta$
and returns as output a weighted difference between the outputs of
the TLU and the outputs of the function. Clearly, when the output
of the error function is $0$, the original function and the encoded
function of the TLU match perfectly. The goal is therefore to reduce
the output of the function at any training step of the TLU until it
becomes $0$.

The most natural way to construct an error function would be to take
the absolute value of the difference between the outputs of the function
and the outputs of the TLU and summing them up. However, this approach
would not be feasible, because it would create a stepwise error function,
meaning that, again, only visual inspection would be able to determine
how to tune the weights and the threshold of the TLU so that the outputs
match. This is due to the fact that stepwise functions are not minimizable,
since they are not differentiable everywhere. One could try at random
possible combinations of inputs and weights until one is found that zeros
the error function, but in general this is not a feasible approach.

A better way to define such a function is to consider instead "how far"
the threshold of the TLU is exceeded for each input. This way, it becomes
possible to read "locally" where to follow along the shape of the error
function by moving, at each step, in the direction of greatest descent,
that is, with the direction of the highest slope, even when the overall
shape of the function is unknown.

There are two formulations of the training process. The first consists in
tuning the TLU with respect to the first input, then tuning the TLU with
respect to the second input, and so on until a traning process is undergone
for all inputs, then repeating from the first input if necessary: this is
referred to as *online training*. The second consists in accumulating all
the tunings for each input and applying them all at once at the end of a
training cycle: this is referred to as *batch training* and each training
cycle is also referred to as an *epoch*.

It is now possible to explicitly formulate an algorithm for the training
process of the TLU. First, one should start from this observation: if the
output of the TLU is $1$ whereas the output of the function is $0$, it must
mean that the threshold of the TLU is too low and/or the weights of the TLU
are too high. Therefore, if this happens, one should raise the threshold
and lower the weights. On the other hand, if the output of the TLU is $0$
whereas the output of the function is $1$, it must mean that the threshold
of the TLU is too high and/or the weights of the TLU are too low, and those
should be tuned accordingly.

A single training step can be formulated as follows. Let $bold(x) = (x_(1),
dots, x_(n))$ be an input vector of a TLU, $y$ the output of the function
with $bold(x)$ as input and $hat(y)$ the output of the TLU with $bold(x)$
as input. If $hat(y) != y$, then the threshold $theta$ and the weights
$bold(w) = (w_(1), dots, w_(n))$ of the TLU can be updated in accord to
the following rule, called *delta rule*, or *Widrow-Hoff rule*:

$ cases(theta & <- theta - eta (y - hat(y)),
        w_(i) & <- w_(i) + eta (y - hat(y)) x_(i)\, forall i in {1, dots, n}) $

The parameter $eta$ is called *learning rate*, and determines how much
the threshold and weights are changed: at every step, they are increased
or reduced by a factor of $eta$. It shouldn't be set either too low,
because the updates would be very slow, but should be too high either,
because the new value of the parameters might jump to another slope of
the error function.

The delta rule allows one to write out an algorithm for the training of
TLU, both following the batch training paradigm and the online training
paradigm. Let $L = ((X_(1), y_(1)), dots, (X_(m), y_(m)))$ be a set of
examples used to train the TLU; each example is constituted by an array
of binary inputs $X_(j) = (x_(1, j), dots, x_(m, j))$ and a binary output
$y_(j)$. Let $W = (w_(1), dots, w_(n))$ be a set of randomly chosen initial
weights and let $theta$ be a randomly chosen initial threshold. The two
algorithms are presented as follows:

#pseudocode(
	title: "TLU-train-online",
	parameters: ([$W = (w_(1), dots, w_(n))$],
	             [$L = ((X_(1), y_(1)), dots, (X_(m), y_(m)))$],
	             [$theta$],
	             [$eta$]),
	content: [
		let $e <- infinity$ #comment[Error]\
		while $(e != 0)$ #i #comment[Continue until error vanishes]\
			$e <- 0$\

			foreach $l_(i)$ in $L$ #i\
				let $X, y <- l_(i, 1), l_(i, 2)$ #comment[Unpack]\

				let $hat(y) <- 0$ #comment[Evaluate scalar product]\
				if $(sum_(j = 1)^(|X|) X_(j) dot W_(j) >= theta)$ #i\
					$hat(y) <- 1$#d\

				if $(hat(y) != y)$ #i #comment[Test for output mismatch]\
					$e <- e + abs(y - hat(y))$ #comment[Update error]\
					$theta <- theta - eta dot (y - hat(y))$ #comment[Update threshold]\
					foreach $w_(j)$ in $W$ #i\
						$w_(j) <- w_(j) + eta dot (y - hat(y)) dot X_(j)$ #comment[Update weights]\
	]
)

#pseudocode(
	title: "TLU-train-batch",
	parameters: ([$W = (w_(1), dots, w_(n))$],
	             [$L = ((X_(1), y_(1)), dots, (X_(m), y_(m)))$],
	             [$theta$],
	             [$eta$]),
	content: [
		let $e <- infinity$ #comment[Error]\
		while $(e != 0)$ #i #comment[Continue until error vanishes]\
			$e <- 0$\
			let $theta^(*) <- 0$ #comment[Partial threshold]\
			let $W^(*) <- (0, dots, 0)$ #comment[Partial weights]\

			foreach $l_(i)$ in $L$ #i\
				let $X, y <- l_(i, 1), l_(i, 2)$ #comment[Unpack]\
				let $hat(y) <- 0$ #comment[Evaluate scalar product]\

				if $(sum_(j = 1)^(|X|) X_(j) dot W_(j) >= theta)$ #i\
					$hat(y) <- 1$ #d\

				if $(hat(y) != y)$ #i #comment[Test for output mismatch]\
					$e <- e + abs(y - hat(y))$ #comment[Update error]\
					$theta^(*) <- theta^(*) - eta dot (y - hat(y))$ #comment[Partially update threshold]\
					foreach $w_(j)$ in $W$ #i\
						$w^(*)_(j) <- w^(*)_(j) + eta dot (y - hat(y)) dot X_(j)$ #d #d #comment[Partially update weights]\

				$theta <- theta + theta^(*)$ #comment[Update threshold]\
				$W <- W + W^(*)$ #comment[Update weights]
	]
)

#exercise[
	Using both online learning and batch learning, construct a TLU that
	computes the logical AND between two bits.
]
#solution[
	#set math.mat(delim: none)

	Let $L = (((0, 0), 1), ((0, 1), 0), ((1, 0), 0), ((1, 1), 1))$,
	$W = (0, 0)$, $theta = 0$ and $eta = 1$. The tables on the left
	and on the right denote the training of the TLU, employing online
	learning and batch learning respectively.

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ mat("Trial", "Weights", theta, "Error";
				0, (0, 0), 0, infinity;
				1, (1, 1), 0, 2;
				2, (2, 1), 1, 3;
				3, (2, 1), 2, 3;
				4, (2, 2), 2, 2;
				5, (2, 1), 3, 1;
				6, (2, 1), 3, 0) $],
		[$ mat("Trial", "Weights", theta, "Error";
				0, (0, 0), 0, infinity;
				1, (-1, -1), 3, 3;
				2, (0, 0), 2, 1;
				3, (1, 1), 1, 1;
				4, (0, 0), 3, 2;
				5, (1, 1), 2, 1;
				6, (1, 1), 2, 0) $]
	)
]

The natural question to ask is whether the training process of a TLU always
works, that is, if the function encoded in the TLU _converges_ to the actual
function. Clearly, if the function to be encoded is not lineraly separable,
the training process will never converge, since the error function will keep
oscillating and never going to $0$. However, if the function is linearly
separable, the training process does always converge.

#theorem("Convergence Theorem for the Delta Rule")[
	Let $L = ((X_(1), y_(1)), dots, (X_(m), y_(m)))$ be a set of training
	examples; each example is constituted by an array of binary inputs
	and a binary output $y_(j)$. Let:
	
	#grid(
		columns: (0.5fr, 0.5fr),
		[$ L_(0) = {(X, y) in L | y = 0} $],
		[$ L_(1) = {(X, y) in L | y = 1} $]
	)

	The subsets of $L$ containing all the training examples having output
	equal to $0$ and to $1$ respectively. If both $L_(0)$ and $L_(1)$ are
	linearly separable, meaning that there exist a vector of weights
	$W = (w_(1), dots, w_(n)) in RR^(n)$ and a threshold $theta in RR$
	such that:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ sum_(j = 1)^(n) w_(j) X_(j) < theta, space forall (X = (X_(1), dots, X_(n)), 0) in L_(0) $],
		[$ sum_(j = 1)^(n) w_(j) X_(j) gt.eq theta, space forall (X = (X_(1), dots, X_(n)), 1) in L_(1) $]
	)

	Then, the training process (either batch or online) is guaranteed
	to terminate.
]

From this basic formulation, it is possible to look for improvements.
First, note how the threshold tuning and the weights tuning are treated
separately by the delta rule, since the two updates have opposite signs
(negative and positive respectively). However, it is possible to simplify
the formula by merging the two expressions into one, turning the threshold
into an extra, "special" weight.

To do so, recall that the TLU outputs $1$ if $sum_(i = 1)^(n) w_(i) x_(i)
gt.eq theta$ and $0$ otherwise. However, this is equivalent to stating
that the TLU outputs $1$ if $sum_(i = 1)^(n) w_(i) x_(i) - theta gt.eq 0$
and $0$ otherwise. This, in turn, is equivalent to stating that the TLU
outputs $1$ if $sum_(i = 0)^(n) w_(i) x_(i) gt.eq 0$ and $0$ otherwise,
where the threshold is now $0$ and $theta$ was turned into $w_(0) x_(0)$,
a "ficticious" input and a corresponding weight. For the new and old
expressions to be equivalent, it suffices to have $x_(0)$ always equal
to $1$ and $w_(0)$ equal to $-theta$ or, equivalently, $x_(0) = -1$
and $w_(0) = theta$.

It is now possible to restate the delta rule as follows. Let $bold(x) =
(x_(0) = 1, x_(1), dots, x_(n))$ be an input vector of a TLU, $y$ the
output of the function with $bold(x)$ as input and $hat(y)$ the output
of the TLU with $bold(x)$ as input. If $hat(y) != y$, then the weights
$bold(w) = (w_(0) = -theta, w_(1), dots, w_(n))$ of the TLU can be updated
as follows:

$ w_(i) & <- w_(i) + eta (y - hat(y)) x_(i)\, forall i in {0, 1, dots, n} $

Once the training process is over, it suffices to turn back $w_(0)$ into
$theta$ and to remove the input $x_(0)$ to obtain the actual formulation
of the TLU.

A second improvement deals with the way Boolean functions are encoded.
In the original formulation, the value of false is encoded as $0$ and
the value of true is encoded as $1$. The problem of this encoding is
that false inputs cannot influence the tuning of the weights, because
the sum between weights and zero inputs is zero, slowing the training
down. The problem can be circumvented by encoding true as $+1$ and
false as $-1$, so that false inputs also contribute to the training.
This is called the *ADALINE model* (*ADAptive LINear Element*).

Having devised a training method for single TLUs, it would be interesting
to extend training to networks of TLUs. This would allow one to encode any
kind of functions, not just linearly separable functions. Unfortunately,
transferring the training process one-to-one from single TLUs to networks
of TLUs is not possible. For example, the updates carried out by the delta
rule are computed from the difference between the output of the original
function and the output of the TLU. However, the tuned output becomes
available only to the current TLU, whereas the other TLUs are oblivious
to the changes. This means that, to train a network of TLUs, a completely
different approach is required.
