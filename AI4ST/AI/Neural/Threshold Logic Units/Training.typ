#import "../../AI_definitions.typ": *

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
// FIXME: apparently, it's not too far-fetched
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
