#import "../../AI_definitions.typ": *

As it was the case for a single TLU, there is interest in having
the neural network _learn_ from examples which are the best choice
of parameters and weights in order to approximate a given function,
rather than fixing them by hand. TLUs employed a non-differentiable
function (the stepwise function) as their "activation function",
which meant that their error function had to be engineered in a
very specific way. However, multilayer perceptrons don't abide
by this restriction, and can have activation functions that are
differentiable.

The central idea is to deduce the direction in which the weights
and the parameters have to be changed at every step from the gradient
of the error function. Since the gradient gives the direction of
steepest descent, the correct direction is the opposite of the
gradient (minimizing the error instead of maximising it). At each
step, the gradient is computed, a small adjustment to the weights
and the parameters is made and the process is repeated until the
degree of approximation is satisfactory.

Consider a multilayer perceptron with $r$ layers: let $U_(0)$ be the
layer of input neurons, $U_(1)$ to $U_(r - 2)$ the layers of hidden
neurons and $U_(r - 1)$ the layer of output neuron. Let $e$ be the
total error for a fixed learning task $L_("fixed")$. To understand
how to the weights with respect to this function, it is necessary
to explicitly rewrite the error in term of the weights. Assume that
the multilayer perceptron has the logistic function as activation
function for its neurons and the identity function as output function.

Since the input layer has no weights/parameters to be adapted, consider
a single neuron $u$ belonging either to an hidden layer or to the output
layer, that is $u in U_(k)$ with $0 < k lt.eq r - 1$. Its predecessors
are given by $"pred"(u) = {p_(1), dots, p_(n)} in U_(k - 1)$. The
corresponding vector of weights, also embedding the $theta$ parameter
to ease calculations, is $bold(w)_(u) = (-theta_(u), w_(u, p_(1)), dots,
w_(u, p_(n)))$. The gradient of the total error function with respect to
these weights is:

$ nabla_(bold(w)_(u)) e =
  frac(partial e, partial bold(w)_(u)) = 
  (-frac(partial e, partial theta_(u)),
   frac(partial e, partial w_(u, p_(1))),
   dots, frac(partial e, partial w_(u, p_(n)))) $

Explicitly substituting the expression for $e$:

$ nabla_(bold(w)_(u)) e =
  frac(partial e, partial bold(w)_(u)) = 
  frac(partial, partial bold(w)_(u)) sum_(l in L_("fixed")) e^((l)) =
  sum_(l in L_("fixed")) frac(partial e^((l)), partial bold(w)_(u)) =
  sum_(l in L_("fixed")) nabla_(bold(w)_(u)) e^((l)) $

Consider a single training pattern $l$ and its error $e^((l)) =
sum_(v in U_("out")) e^((l))_(v)$. The error depends on the value
of the output of the layer, which in turn depends (also) on the
network input. However, the network input depends on the weights:

$ "net"_(u)^((l)) =
  bold(w)_(u) bold("in")_(u)^((l)) =
  bold(w)_(u) (1, "out"_(p_(1))^((l)), dots, "out"_(p_(n))^((l))) $

Which means that there's a dependency between the error and the
weights. Applying the chain rule:

$ nabla_(bold(w)_(u)) e^((l)) =
  frac(partial e^((l)), partial bold(w)_(u)) =
  frac(partial e^((l)), partial "net"_(u)^((l)))
  frac(partial "net"_(u)^((l)), partial bold(w)_(u)) =
  frac(partial e^((l)), partial "net"_(u)^((l)))
  frac(partial bold(w)_(u) bold("in")_(u)^((l)), partial bold(w)_(u)) =
  frac(partial e^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) $

Expanding the error $e^((l))$ in the first factor:

$ frac(partial e^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) &=
  frac(partial sum_(v in U_("out")) (o_(v)^((l)) - "out"_(v)^((l)))^(2), partial "net"_(u)^((l))) bold("in")_(u)^((l)) =
  sum_(v in U_("out")) frac(partial (o_(v)^((l)) - "out"_(v)^((l)))^(2), partial "net"_(u)^((l))) bold("in")_(u)^((l)) = \
  &= sum_(v in U_("out")) 2 (o_(v)^((l)) - "out"_(v)^((l))) frac(partial (o_(v)^((l)) - "out"_(v)^((l))), partial "net"_(u)^((l))) bold("in")_(u)^((l)) = \
  &= 2 sum_(v in U_("out")) (o_(v)^((l)) - "out"_(v)^((l))) (cancel(frac(partial o_(v)^((l)), partial "net"_(u)^((l)))) - frac(partial "out"_(v)^((l)), partial "net"_(u)^((l)))) bold("in")_(u)^((l)) = \
  &= -2 underbrace(sum_(v in U_("out")) (o_(v)^((l)) - "out"_(v)^((l))) frac(partial "out"_(v)^((l)), partial "net"_(u)^((l))), delta_(u)^((l))) bold("in")_(u)^((l)) = 
  -2 delta_(u)^((l)) bold("in")_(u)^((l)) $

Where the shorthand $delta_(u)^((l))$ is introduced for clarity. Note
that $partial o_(v)^((l)) slash partial "net"_(u)^((l))$ is $0$ because,
by definition, the output in the training pattern does not depend on the
network input function.

To compute $delta_(u)^((l))$, first consider the particularly favourable
case in which $u$ is an output neuron. Since the neurons in the output
layer (or in any layer, for that matter), are not connected to each other,
there is no dependency between the output of one and the network input of
another. This means that all terms of the sum except for $v = u$ are null,
because $partial "out"_(v)^((l)) slash partial "net"_(u)^((l))$ is $0$:

$ nabla_(bold(w)_(u)) e^((l)) =
  frac(partial e^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) =
  -2 sum_(v = u) (o_(v)^((l)) - "out"_(v)^((l))) frac(partial "out"_(v)^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) =
  -2 (o_(u)^((l)) - "out"_(u)^((l))) frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) $

This means that the weights coming into the output neuron $u$ should
be shifted by:

$ Delta bold(w)_(u)^((l)) =
  -frac(eta, 2) (-2 (o_(u)^((l)) - "out"_(u)^((l))) frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l))) =
  eta (o_(u)^((l)) - "out"_(u)^((l))) frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) $

Where the minus signs cancel, because the interest is in going in the
direction opposite to the gradient of the error function. The parameter
$eta$ that absorbs the factor of $2$ is called the *learning rate*, and
represents the lenght of the step taken in one iteration of gradient
descent. Popular choices for $eta$ are $0.1$ and $0.2$, but in general
the best choice is domain specific.

The above expression was referring to the weight change that results
from a single training pattern $l$. That is, this is how weights are
adapted in online training, where the weights are adapted immediately
after each example is presented to the perceptron. In the case of
batch learning the idea is the same, the difference being that one
would have to sum all partial updates over all training patterns
and then applying the resulting change at the end of each epoch,
not immediately after each evaluation.

The derivative of $partial "out"_(u)^((l)) slash partial "net"_(u)^((l))$
cannot be calculated in the general case, since the output depends on the
choice of the activation function. Suppose that the logistic function has
been chosen, and that the output function is the identity function (as it
is the case, in general). Then:

$ frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) &=
	frac(partial f_("out")("act"_(u)^((l))), partial "net"_(u)^((l))) =
	frac(partial "act"_(u)^((l)), partial "net"_(u)^((l))) =
	frac(partial f_("act")("net"_(u)^((l))), partial "net"_(u)^((l))) =
	f'_("act")("net"_(u)^((l))) = \
	&= f_("act")("net"_(u)^((l))) (1 - f_("act")("net"_(u)^((l)))) =
	"act"_(u)^((l)) (1 - "act"_(u)^((l))) = "out"_(u)^((l)) (1 - "out"_(u)^((l))) $

Which means that the adaptation should be:

$ Delta bold(w)_(u)^((l)) =
	eta (o_(u)^((l)) - "out"_(u)^((l))) frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) =
	eta (o_(u)^((l)) - "out"_(u)^((l))) "out"_(u)^((l)) (1 - "out"_(u)^((l))) bold("in")_(u)^((l)) $

Since the neuron under consideration was one belonging to the
output layer, this adaptation is the one that ought to be performed
on the weights coming into the output layer (or going out of the last
hidden layer, that is). For a $2$-layer perceptron, this would already
be sufficient. However, the fact that the activation function is
differentiable allows the same approach to be extended to all other
weights, something that a network of TLUs couldn't.

Consider a neuron $u in U$ than belongs to a hidden layer. That is
$u in U_(k)$ with $0 < k < r - 1$. In this case, the factor $partial
"out"_(v)^((l)) slash partial "net"_(u)^((l))$ that appears in the
expression for $delta^((l))_(u)$ is not $0$, because there is a
dependency between the two functions. In particular, $"out"_(v)^((l))$
depends on $"net"_(u)^((l))$ indirectly via the successors of $u$,
since they have $f_("out")^((u))(f_("act")^((u))("net"_(u)^((l))))$
as one of their inputs.

Let $"succ"(u) = {s in U | (u, s) in C} = {s_(1), dots, s_(m)} subset.eq
U_(k + 1)$, and let $"net"_(s)^((l))$ the network input (in the training
pattern $l$) of the successor $s$ of $u$. Since $"net"_(s)^((l))$ depends
(also) on $f_("out")^((u))(f_("act")^((u))("net"_(u)^((l))))$, applying
the chain rule to $partial "out"_(v)^((l)) slash partial "net"_(u)^((l))$
gives:

$ delta_(u)^((l)) =
  sum_(v in U_("out")) (o_(v)^((l)) - "out"_(v)^((l))) frac(partial "out"_(v)^((l)), partial "net"_(u)^((l))) =
  sum_(v in U_("out")) (o_(v)^((l)) - "out"_(v)^((l))) sum_(s in "succ"(u))
  frac(partial "out"_(v)^((l)), partial "net"_(s)^((l))) frac(partial "net"_(s)^((l)), partial "net"_(u)^((l))) $

Since both sums are finite, they can be rearranged:

$ delta_(u)^((l)) &=
  sum_(v in U_("out")) (o_(v)^((l)) - "out"_(v)^((l))) sum_(s in "succ"(u))
  frac(partial "out"_(v)^((l)), partial "net"_(s)^((l))) frac(partial "net"_(s)^((l)), partial "net"_(u)^((l))) = \
  &= sum_(v in U_("out")) sum_(s in "succ"(u)) (o_(v)^((l)) - "out"_(v)^((l))) 
  frac(partial "out"_(v)^((l)), partial "net"_(s)^((l))) frac(partial "net"_(s)^((l)), partial "net"_(u)^((l))) = \
  &= sum_(s in "succ"(u)) underbrace((sum_(v in U_("out")) (o_(v)^((l)) - "out"_(v)^((l))) 
  frac(partial "out"_(v)^((l)), partial "net"_(s)^((l)))), delta^((l))_(s))
  frac(partial "net"_(s)^((l)), partial "net"_(u)^((l))) =
  sum_(s in "succ"(u)) delta^((l))_(s) frac(partial "net"_(s)^((l)), partial "net"_(u)^((l))) $

The network input $"net"_(s)^((l))$ of the neuron $s$ (for the training
pattern $l$) can be written explicitly:

$ frac(partial "net"_(s)^((l)), partial "net"_(u)^((l))) =
  frac(partial, partial "net"_(u)^((l))) (bold(w)_(s) bold("in")_(s)^((l))) =
  frac(partial, partial "net"_(u)^((l)))
  ((sum_(p in "pred"(s)) w_(s, p) "out"_(p)^((l))) - theta_(s)) $

Out of all neurons $p in "pred"(s)$ there is precisely the neuron $u$,
since $s$ is one of its successors. This means that the only term of
$partial "net"_(s)^((l)) slash partial "net"_(u)^((l))$ that is not
null is the one where $p = u$, because it's the only dependency between
$"net"_(s)^((l))$ and $"net"_(u)^((l))$:

$ frac(partial "net"_(s)^((l)), partial "net"_(u)^((l))) &=
  frac(partial, partial "net"_(u)^((l)))
  ((sum_(p in "pred"(s)) w_(s, p) "out"_(p)^((l))) - theta_(s)) =
  frac(partial, partial "net"_(u)^((l)))
  ((sum_(p = u) w_(s, p) "out"_(p)^((l))) - theta_(s)) = \
  &= frac(partial ((w_(s, u) "out"_(u)^((l))) - theta_(s)), partial "net"_(u)^((l))) =
  frac(partial w_(s, u) "out"_(u)^((l)), partial "net"_(u)^((l))) -
  cancel(frac(partial theta_(s), partial "net"_(u)^((l)))) =
  w_(s, u) frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) $

// Why is theta cancelled?

Substituting in the previous expression:

$ delta_(u)^((l)) =
  sum_(s in "succ"(u)) delta^((l))_(s) frac(partial "net"_(s)^((l)), partial "net"_(u)^((l))) =
  (sum_(s in "succ"(u)) delta^((l))_(s) w_(s, u)) frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) $

Which gives the expression for $nabla_(bold(w)_(u)) e^((l))$ when the
neuron $u$ is an hidden layer:

$ nabla_(bold(w)_(u)) e^((l)) =
  -2 delta_(u)^((l)) bold("in")_(u)^((l)) =
  -2 (sum_(s in "succ"(u)) delta^((l))_(s) w_(s, u)) frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) $

Confronting this expression with the gradient for an output neuron,
the term $sum_(s in "succ"(u)) delta^((l))_(s) w_(s, u)$ plays the
role of $o_(u)^((l)) - "out"_(u)^((l))$, and indeed the expression
for $delta^((l))_(s)$ does contain $o_(u)^((l)) - "out"_(u)^((l))$.

This is because $delta^((l))_(s)$ is the error of the entire output
layer multiplied by the partial derivative of the network input of
$s$ (a successor of $u$) with respect to the network input of $u$.
In simpler terms, the error of a hidden neuron depends on the error
of its successors, and can be computed from theirs. Even better, it
could be stated that the error of the output neurons "ripples back"
to the hidden neurons, layer by layer. This is why this method of
weight adaptation is called *backpropagation*.

This gives a formula for the weight adaptation of hidden neurons:

$ Delta bold(w)_(u)^((l)) =
  -frac(eta, 2) nabla_(bold(w)_(u)) e^((l)) =
  eta (sum_(s in "succ"(u)) delta^((l))_(s) w_(s, u)) frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) $

Assuming, again, that the activation function of choice is the
logistic function and that the output function is the identity,
the explicit expression is:

$ Delta bold(w)_(u)^((l)) =
  eta (sum_(s in "succ"(u)) delta^((l))_(s) w_(s, u)) frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) =
  eta (sum_(s in "succ"(u)) delta^((l))_(s) w_(s, u)) "out"_(u)^((l)) (1 - "out"_(u)^((l))) bold("in")_(u)^((l)) $

// Extend the online learning and batch learning algorithm for multilayer perceptrons

The backpropagation algorithm allows one to train a multilayer
perceptron with training examples, but is oblivious to the "shape"
of the network. That is, the number of hidden layers and the number
of hidden neurons have to be fixed "by hand" before the training
process. For a $3$-layer perceptron, a known rule of thumb for
determining how many hidden neurons there should be is:

$ frac("number of input neurons" + "number of output neurons", 2) $

The simplest approach to find the most suitable number of hidden
neurons is to try out different configurations and see what works
best. The dataset of examples is split into two (roughly) equally
sized subsets: the _training data_ and the _validation data_. Multilayer
perceptrons with different number of neurons in the hidden layer are
trained on the training data and evaluated on the validation data (on
which the perceptrons are _not_ trained on). The process is repeated
with different splits, averaging the results per number of hidden
neurons. The perceptron with the number of hidden neuron that performs
best on the validation data is chosen, and is then re-trained with the
entire dataset. This approach is referred to as *cross-validation*.

If the number of hidden neurons is insufficient, the accuracy with
which the perceptron maps inputs to output will also be insufficient.
This happens because the error function cannot be lowered than an
acceptable threshold. This is also referred to as *underfitting*.

Since increasing the number of neurons also increases the accuracy of
the predictions, it might be tempting to naively construct multilayer
perceptrons with as many neurons as possible. Even if this were to be
computationally affordable (more neurons also means slower training,
because more weights have to be updated), it's not advisable. This is
because a perceptron that is "too focused" on a dataset might learn
not only its input-output relationship, but also the inherent biases
and errors that are present. These errors are unavoidable, because all
data is sampled from larger populations and don't represent it as a
whole, and all measurements have a finite precision.

When a multilayer perceptron is "too narrowed" on a dataset, what
happens is that trying predicting inputs that are ever so slightly
different from the training patterns result in considerable inaccuracy.
This situation is also referred to as *overfitting*. Overfitting happens
because different data have different inherent bias, and a multilayer
perceptron that is too focused on a single dataset will be prone to
incorporate also its bias.

Cross validation can effectively tame both overfitting and underfitting
because the validation data and the training data will likely distorted
in a different fashion, since the errors and deviations are random.
Both underfitting and overfitting are unfavorable, but in general the
former is worse: it is better to have a model with poor tolerance than
a model with poor performance.

An extension of cross-validation is *n-fold cross-validation*.
The technique consists in partitioning the dataset in $n$ subsets
of equal size, called *folds*. For $n$ times, one of the $n$ subsets
is chosen to be the validation data and the remaining $n - 1$ subsets
are merged into a single set, that will be the training data. Common
choices of $n$ are $5$ (_5-fold cross-validation_) and $10$
(_10-fold cross-validation_).

// Ok but what does it do?

Another approach to prevent overfitting is what's called *early
stopping*: during the training the accuracy of the multilayer
perceptron is evaluated after each epoch (or every few epochs)
on a validation data set. While the error on the training data
set should always decrease with each epoch, the error on the
validation data set should initially decrease and then increase
again as soon as overfitting sets in. When this happens, training
is terminated (hence the name early stopping) and the current
choice of parameters for the perceptron are frozen.
