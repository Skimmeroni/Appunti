#import "../../AI_definitions.typ": *

The knowledge that an artificial neural networks captures in the
training process is difficult to understand. This is because it
is effectively stored as matrices, that on their own don't have
a particular semantic. Moreover, when the number of dimensions
grows, it becomes impossible to give the neural network a geometrical
interpretation.

To some extent, it is by design that a neural network is hard to
inspect. After all, neural networks are often "fire and forget"
computational devices, that perform complex computations without
the need to carry it out by hand or to understand how it was done.
However, it can sometimes be beneficial to get a glimpse inside
the operations of a neural network.

*Sensitivity analysis* is a technique used to evaluate the influence
that each input has on the output of a neural network. That is, how
much the output changes if one of the inputs were to be changed by
the same order of magnitude. For each input neuron $u$, it's possible
to assign a sensitivity $s(u)$ as sum, over all training patterns,
of the partial derivative of the output of each output neuron with
respect to the external input of the input neuron $u$, divided by
the size of the patterns. That is:

$ s(u) = frac(1, abs(L_("fixed"))) sum_(l in L_("fixed")) sum_(v in U_("out"))
  frac(partial "out"_(v)^((l)), partial "ext"_(u)^((l))) $

The rationale behind this quantity is that, since a derivative is by
definition a rate of change, computing the sum of the partial derivatives
of the outputs with respect to the inputs one has the rate of change
between the latter and the former. Once this quantity is known, it is
for example possible to simplify the network by removing the inputs with
the least influence, reducing the dimensionality of the problem.

To obtain an explicit expression for $s(u)$, it is first of all necessary
to describe the dependency between $"out"_(v)$ and $"ext"_(u)$.
Clearly, since $u$ comes before $v$, the output of $v$ does depend to some
extent to the output of $u$. Moreover, the output of $v$ depends on the
network input of $v$. This gives:

$ frac(partial "out"_(v), partial "ext"_(u)) =
  frac(partial "out"_(v), partial "out"_(u))
  frac(partial "out"_(u), partial "ext"_(u)) =
  frac(partial "out"_(v), partial "net"_(v))
  frac(partial "net"_(v), partial "out"_(u))
  frac(partial "out"_(u), partial "ext"_(u)) $

Since input neurons transmit their external input unchanged, the term
$partial "out"_(u) slash partial "ext"_(u)$ is just $1$. As for the
second term:

$ frac(partial "net"_(v), partial "out"_(u)) =
  frac(partial, partial "out"_(u)) sum_(p in "pred"(v)) w_(v, p) "out"_(p) =
  sum_(p in "pred"(v)) w_(v, p) frac(partial "out"_(p), partial "out"_(u)) $

In the favourable case of $v$ being a neuron in the first hidden layer,
the formula can be simplified noticeably, since there is no dependency
on the output of previous neurons, just on the weight that connects $u$
to $v$:

$ frac(partial "net"_(v), partial "out"_(u)) =
  frac(partial "out"_(v), partial "net"_(v))
  sum_(p in "pred"(v)) w_(v, p) frac(partial "out"_(p), partial "out"_(u)) =
  frac(partial "out"_(v), partial "net"_(v))
  sum_(p = u) w_(v, u) frac(partial "out"_(u), partial "out"_(u)) =
  frac(partial "out"_(v), partial "net"_(v))
  w_(v, u) $

This serves as a starting point for the recursion.
Substituting the general result in the previous expression:

$ frac(partial "out"_(v), partial "ext"_(u)) =
  frac(partial "out"_(v), partial "net"_(v))
  frac(partial "net"_(v), partial "out"_(u))
  cancel(frac(partial "out"_(u), partial "ext"_(u))) =
  frac(partial "out"_(v), partial "net"_(v))
  sum_(p in "pred"(v)) w_(v, p) frac(partial "out"_(p), partial "out"_(u)) $

Assuming to use the logistic function as activation function,
$partial "out"_(v) slash partial "net"_(v)$ is just $"out"_(v)
(1 - "out"_(v))$. This gives:

#grid(
    columns: (0.45fr, 0.55fr),
    [$ frac(partial "net"_(v), partial "out"_(u)) =
       "out"_(v)(1 - "out"_(v)) w_(v, u) $],
    [$ frac(partial "out"_(v), partial "ext"_(u)) =
       "out"_(v)(1 - "out"_(v))
       sum_(p in "pred"(v)) w_(v, p) frac(partial "out"_(p), partial "out"_(u)) $]
)

Giving the recursive formula:

$ s(u) =
  cases(display(frac(1, abs(L_("fixed")))) display(sum_(l in L_("fixed"))) display(sum_(v in U_("out")))
  "out"_(v)(1 - "out"_(v)) w_(v, u),
  display(frac(1, abs(L_("fixed")))) display(sum_(l in L_("fixed"))) display(sum_(v in U_("out")))
  "out"_(v)(1 - "out"_(v))
  display(sum_(p in "pred"(v))) w_(v, p) display(frac(partial "out"_(p)^((l)), partial "out"_(u)^((l))))) $
