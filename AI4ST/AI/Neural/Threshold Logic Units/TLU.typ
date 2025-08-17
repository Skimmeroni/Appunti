#import "../../AI_definitions.typ": *

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

It is easy to construct TLUs that can compute all four basic
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

Since the purpose of a TLU is to model the neurons in the brain,
there is clear interest is in understanding if a TLU can encode
any possible function or, if this were not to be the case, which
functions can be encoded.

First of all, notice how the weighted summation that determines its
output is very similar to an $n$-dimensional linear function. That
is, by substituting $gt.eq$ with $=$, one obtains an $n$-dimensional
straight line:

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

This is easier to visualize if the number of dimensions (the number
of inputs to the TLU) is $3$ or less, since it's possible to graph
the decision border on a cartesian plane.

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
	          colors) is linearly separable. The ones on the right are
	          not],
	[#image("separable.svg")]
)

By extension, a binary function (a function that has two possible outputs)
is said to be linearly separable if the set of inputs that give the first
output and the set of inputs that give the second output are linearly
separable sets.

Therefore, a single TLU can only encode linearly separable functions;
indeed, `AND`, `OR`, `NOT` and `IF...THEN` are linearly separable
functions. Unfortunately, not all (binary) functions are linearly
separable: it is trivial to show, for example, that the biimplication
and the logical `XOR` are not linearly separable. This means that a
single TLU has (very) limited capabilities, because it can't encode
all possible functions.

The TLUs described so far have all been constructed with the goal of
embedding a function, fixing the parameters (thresholds and weights)
"by hand". What would be more useful is having a TLU that can "deduce"
the function without knowing its closed-form expression and simply by
knowing how to map inputs to outputs. Even more interesting would be
a TLU that can adjust its parameters "on its own", only based on the
input-output pairs that it is presented with.

This would make a TLUs an even fitter model of human cognition: the TLU
_learns_ from its input-output pairs as a human learns from experience.
Indeed, such a process exists, and can be described as such:

+ Start with a TLU having randomly generated values for the weights and
  the threshold;
+ Test the results given to see if this matches the expected outputs.
  If it doesn't, tune the TLU parameters in accord;
+ If the output of the TLU always matches the outputs in the data, stop.
  Otherwise, go back to from the previous point.

This process of tuning the parameters of a TLU one step at a time is also
referred to as the *training* of the network.

The first step for constructing a learning process for a TLU is in
quantifying "how much" the outputs of the TLU and the expected outputs
differ. This quantification is given by an _error function_ $e(w_(1),
dots, w_(n), theta)$, that taken in input the $n$ weigths $w_(1), dots,
w_(n)$ of a TLU and the threshold $theta$ and returns as output a
weighted difference between the outputs of the TLU and the expected
outputs. Clearly, when the error function results is $0$, the expected
and given outputs match perfectly. The goal is therefore to reduce
step-by-step the value given by the error function until it reaches
$0$ (or gets sufficiently close).

The most intuitive way to construct this function would be to take
the absolute value of the difference between the outputs of the function
and the outputs of the TLU and summing all of them. However, this would
create a stepwise error function, making it impossible to adjust the
parameters automatically. A stepwise function is made of "plateaus", in
which the function evaluates to the same value: aside from the points
along a border, there is no way of inspecting the "neighborhood" of a
point to know where to move to decrease the error.

A better way would be considering "how far" the threshold of the TLU is
exceeded for each input. This way, it becomes possible to read "locally"
where to follow along the shape of the error function by moving, at each
step, in the direction of greatest descent, that is, with the direction
of the highest slope, even when the overall shape of the function is
unknown.

/* Add an example */

There are two main formulations of the training process. The
first consists in going one input-output pair at a time, tuning
the parameters where needed and restarting from the first if
necessary. This is referred to as *online training*. The second
consists in accumulating the tunings needed for each input and
applying them all at once at the end of a training cycle. this
is referred to as *batch training* and each training cycle is
also referred to as an *epoch*. Both approaches are valid and
have strengths and weaknesses on their own.

As for how to tune the parameters, one should start from this simple
observation. If the output of the TLU is $1$ and the output in the
input-output pair is $0$, it must mean that either the threshold has
been set too low and/or the weights have been set too high. Therefore,
if this is the case, one should raise the threshold and/or lower the
weights in order for the TLU to match the expected output. On the other
hand, if the output of the TLU is $0$ and the expected output is $1$,
it must mean that the threshold has been set too high and or/ the weights
have been set too low. If this is the case, one should lower the threshold
and/or raise the weights. Of course, if the output of the TLU matches the
expected output, there is no need for tuning its parameters.

What remains to be done is to define how exactly this parameter tuning
should be performed. Consider a TLU having $n$ weights $bold(w) = (w_(1),
dots, w_(n))$ and a threshold $theta$. Let $(bold(x), y) = ((x_(1), dots,
x_(n)), y)$ be an input-output pair that is to be presented to the TLU.
Let $hat(y)$ be output of the TLU when given $bold(x)$ as input. If
$hat(y) != y$, the parameters of the TLU can be updated in accord to
the following rule, called *delta rule*, or *Widrow-Hoff rule*:

$ cases(theta & <- theta - eta (y - hat(y)),
        w_(1) & <- w_(1) + eta (y - hat(y)) x_(1),
        w_(2) & <- w_(2) + eta (y - hat(y)) x_(2),
        dots,
        w_(n) & <- w_(n) + eta (y - hat(y)) x_(n)) $

The parameter $eta$ is called *learning rate*, and determines how much
the parameters are changed. At every step, the parameters are either
increased or decreased by a factor of $eta$. The choice of $eta$ is
arbitrary: it shouldn't be set too low, because the training process
would take too many steps, but shouldn't be set too high either, because
the new value of the parameters might jump to another slope of the error
function.

As stated, the update of the threshold and of the weights has to be done
in opposite directions, which is why the delta rule treats them separately.
However, it's possible to simplify the formula by turning the threshold
into an extra weight and introducing an extra input.

To do so, recall that the output of a TLU is $1$ if $bold(w), bold(x)
angle.r gt.eq theta$ and $0$ otherwise. This is the same as having
output $1$ if $bold(w), bold(x) angle.r - theta gt.eq 0$ and $0$
otherwise by moving $theta$ to the left hand side. Let $x_(0)$ an
extra input that is always equal to $1$: the expression can be rewritten
as outputting $1$ if $bold(w), bold(x) angle.r - x_(0) theta gt.eq 0$
and $0$ otherwise, since $x_(0)$ has no influence on the update of
$theta$. By renaming $theta = w_(0)$, one has that the output of the
TLU is $1$ if $sum_(i = 0)^(n) w_(i) x_(i) gt.eq 0$ and $0$ otherwise.
In this formulation, the $theta$ is always $0$ and can be ignored.

It is now possible to restate the delta rule as follows. Consider a
TLU having $n$ weights $bold(w) = (w_(1), dots, w_(n))$ and a threshold
$theta$. Rewrite the weights as $bold(w) = (w_(0) = -theta, w_(1), dots,
w_(n))$ and set the threshold to $0$. Let $(bold(x), y) = ((x_(0) = 1,
x_(1), dots, x_(n)), y)$ be an input-output pair that is to be presented
to the TLU, with an extra ficticious input $x_(0)$. Let $hat(y)$ be output
of the TLU when given $bold(x)$ as input. If $hat(y) != y$, the parameters
of the TLU are updated as:

$ w_(i) & <- w_(i) + eta (y - hat(y)) x_(i)\, forall i in {0, 1, dots, n} $

Once the training process is over, if one so desires, it suffices to turn
$-w_(0)$ back into $theta$ and to remove the input $x_(0)$ to obtain the
original formulation of the TLU.

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

Both algorithms don't turn thresholds into weights just for clarity
of explanation, but it would be trivial to edit them to introduce
said variation.

#exercise[
	Using both online learning and batch learning, construct a TLU that
	computes the logical AND between two bits.
]
#solution[
	#set math.mat(delim: none)

	Let $L = (((0, 0), 1), ((0, 1), 0), ((1, 0), 0), ((1, 1), 1))$,
	$W = (0, 0)$, $theta = 0$ and $eta = 1$. The tables on the left
	and on the right denote the training of the TLU, employing online
	learning and batch learning respectively #footnote[These have been
	computed with the Python snippet present in this folder.].

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

The natural question to ask is whether the training process of a TLU
always works, that is, if the function encoded in the TLU _converges_
to the actual input-output mapping. As stated, threshold logic units
can only encode functions that are linearly separable, therefore it is
to be expected that the training process won't converge when presented
with an input-output pair coming from non-linearly separable function.
This is indeed the case, and what happens instead is that the error
function oscillates without never reaching $0$. However, if the function
is linearly separable, the training process is guaranteed to converge.

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
		[$ sum_(j = 1)^(n) w_(j) X_(j) < theta, space forall (X, 0) in L_(0) $],
		[$ sum_(j = 1)^(n) w_(j) X_(j) gt.eq theta, space forall (X, 1) in L_(1) $]
	)

	Then, the training process (either batch or online) is guaranteed
	to terminate.
] <Convergence-Theorem-Delta-Rule>
// #proof[
// Apparently, it's not too far-fetched
// ]

The delta rule can be improved upon even further by observing that
inputs of $0$ are problematic. Infact, note that the expression for
updating the weights depends on the input, and if the input is $0$
the entire expression is $0$. This means that, effectively, if the
input is $0$ there is never an update, even if it necessary. This
doesn't impact the correctness of the process (which will always
converge, as stated in @Convergence-Theorem-Delta-Rule) but slows
it down unnecessarely. The problem can be circumvented by using
$1$ and $-1$ instead of $1$ and $0$ as boolean values, so that
false inputs don't make the expression go to $0$ and hence contribute
meaningfully to the training. This is referred to as the *ADALINE
model* (*ADAptive LINear Element*). 
