#import "../AI_definitions.typ": *

A more general approach for tuning the parameters of the multilayer
perceptron is through the mathematical technique of *gradient descent*.
As it was the case for TLUs, the idea is to compute the error function
after a training task, zeroing the derivative of the error function and
tune the parameters of the multilayer perceptron in accord to the result.

Note that the error function is likely to have arity greater than one,
meaning that one should be computing the gradient, not the derivative.
However, it might not be possible to zero the gradient of the error
function, because it might not be solvable analytically. For this reason,
the method of gradient descent is used, computing the gradient in one
point, moving a tiny step in the opposing direction (the direction of
the gradient is the direction of growth of the function) and repeating
the process until a sufficient approximation is reached.

In the case of TLUs this wasn't possible, because the error function was
not differentiable (it consisted of plateaus). However, the error function
of a multilayer perceptron, as long as its neurons use a differentiable
activation function, is itself differentiable, meaning that this does not
constitue a problem.

Consider a multilayer perceptron with $r$ layers: let $U_(0)$ be the layer
of input neurons, $U_(1)$ to $U_(r - 2)$ the layers of hidden neurons and
$U_(r - 1)$ the layer of output neuron. The total error for a fixed learning
task $L_("fixed")$ is given by:

$ e = sum_(l in L_("fixed")) e^((l))
    = sum_(l in L_("fixed")) (o_(v 1)^((l)) - "out"_(v 1)^((l)))^(2) + dots + (o_(v m)^((l)) - "out"_(v m)^((l)))^(2) 
    = sum_(l in L_("fixed")) sum_(v in U_("out")) (o_(v)^((l)) - "out"_(v)^((l)))^(2) $

To understand how one should update the weights with respect to this
function, it is necessary to explicitly rewrite the error in term of
the weights. Assume that the multilayer perceptron has the logistic
function as activation function for its neurons and the identity
function as output function.

Consider a single neuron $u$ belonging to either an hidden or the output
layer, that is $u in U_(k)$ with $0 < k < r$. Its predecessors are given
by $"pred"(u) = {p_(1), dots, p_(n)} in U_(k - 1)$. The corresponding
vector of weights, threshold embedded, is $bold(w)_(u) = (-theta_(u),
w_(u, p_(1)), dots, w_(u, p_(n)))$. The gradient of the total error
function with respect to these weights is:

$ nabla_(bold(w)_(u)) e =
  frac(partial e, partial bold(w)_(u)) = 
  (-frac(partial e, partial theta_(u)),
   frac(partial e, partial w_(u, p_(1))),
   dots, frac(partial e, partial w_(u, p_(n)))) $

Substituting the expression for $e$ gives:

$ nabla_(bold(w)_(u)) e =
  frac(partial e, partial bold(w)_(u)) = 
  frac(partial, partial bold(w)_(u)) sum_(l in L_("fixed")) e^((l)) =
  sum_(l in L_("fixed")) frac(partial e^((l)), partial bold(w)_(u)) $

Consider a single training pattern $l$ and its error $e^((l))$. This error
depends on the weights in $bold(w)_(u)$ only via the network input

$ "net"_(u)^((l)) =
  bold(w)_(u) bold("in")_(u)^((l)) =
  bold(w)_(u) (1, "out"_(p_(1))^((l)), dots, "out"_(p_(n))^((l))) $

Applying the chain rule:

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
  &= sum_(v in U_("out")) 2 (o_(v)^((l)) - "out"_(v)^((l))) frac(partial (o_(v)^((l)) - "out"_(v)^((l))), partial "net"_(u)^((l))) bold("in")_(u)^((l)) =
  2 sum_(v in U_("out")) (o_(v)^((l)) - "out"_(v)^((l))) (cancel(frac(partial o_(v)^((l)), partial "net"_(u)^((l)))) - frac(partial "out"_(v)^((l)), partial "net"_(u)^((l)))) bold("in")_(u)^((l)) = \
  &= -2 underbrace(sum_(v in U_("out")) (o_(v)^((l)) - "out"_(v)^((l))) frac(partial "out"_(v)^((l)), partial "net"_(u)^((l))), delta_(u)^((l))) bold("in")_(u)^((l)) =
  -2 delta_(u)^((l)) bold("in")_(u)^((l)) $

Where the shorthand $delta_(u)^((l))$ is introduced for clarity. To compute
$delta_(u)^((l))$, a distinction between the output layer and the hidden
layers ought to be made.

Computing $delta_(u)^((l))$ for the output layer is particularly easy,
because clearly the outputs of the output neurons are, by definition,
independent of each other. This means that all the terms of the sum having
$v != u$ vanish, giving:

$ frac(partial e^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) =
  -2 sum_(v = u) (o_(v)^((l)) - "out"_(v)^((l))) frac(partial "out"_(v)^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) =
  -2 (o_(u)^((l)) - "out"_(u)^((l))) frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) $

This means that the weights incoming into the output neuron $u$ should be
shifted by the amount:

$ Delta_(w_(bold(u))^((l))) =
  -frac(eta, 2) (-2 (o_(u)^((l)) - "out"_(u)^((l))) frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l))) =
  eta (o_(u)^((l)) - "out"_(u)^((l))) frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) $

Where the minus sign means that one should move in the opposite direction
of the gradient in order to minimize it. The parameter $eta$ is called the
*learning rate*, and represents the lenght of the step taken in one iteration
of gradient descent. Popular choices for $eta$ are $0.1$ and $0.2$, but the
"best" choice problem domain specific.

Recall that, as stated before, this is only the weight change that results
from a single training pattern $l$. In other words, this is how weights are
adapted in online training, where the weights are adapted immediately after
each training pattern. For batch training, one has to sum the changes
described by the formula over all training patterns rather than changing
the parameters immediately, since the weights are adapted only at the end
of an epoch.

Also note that the derivative of $"out"_(u)^((l))$ with respect to
$"net"_(u)^((l))$ cannot be calculated in the general case, since
the output is computed from the activation function, which in turn
is computed from the network input function, and the shape of those
functions can vary.

#exercise[
	Consider a neuron $u$ of the output layer of a multilayer perceptron
	in a given training example $l$. Suppose that the activation function
	of choice is the logistic function with parameter $theta = 0$ and the
	output function is the identity. What would be the explicit expression
	for $Delta_(w_(bold(u))^((l)))$?
]
#solution[
	Recall that the derivative of the logistic function is equal to itself
	times one minus itself:

	$ frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) &=
	  frac(partial f_("out")("act"_(u)^((l))), partial "net"_(u)^((l))) =
	  frac(partial "act"_(u)^((l)), partial "net"_(u)^((l))) =
	  frac(partial f_("act")("net"_(u)^((l))), partial "net"_(u)^((l))) =
	  f_("act")("net"_(u)^((l))) (1 - f_("act")("net"_(u)^((l)))) = \
	  &= "act"_(u)^((l)) (1 - "act"_(u)^((l))) = "out"_(u)^((l)) (1 - "out"_(u)^((l))) $

	Which gives:

	$ Delta_(w_(bold(u))^((l))) =
	  eta (o_(u)^((l)) - "out"_(u)^((l))) frac(partial "out"_(u)^((l)), partial "net"_(u)^((l))) bold("in")_(u)^((l)) =
	  eta (o_(u)^((l)) - "out"_(u)^((l))) "out"_(u)^((l)) (1 - "out"_(u)^((l))) bold("in")_(u)^((l)) $
]
