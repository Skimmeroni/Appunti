#import "../AI_definitions.typ": *

The way in which a multilayer perceptron approximates a given function
bares striking similarity to the *method of least squares*, also known
as *regression*, which is used to determine the polynomial function that
best approximates the relationship between variables in a dataset.

Let $(X, Y) = {(x_(1), y_(1)), dots, (x_(n), y_(n))}$ be a dataset of
$n$ points. Suppose that the relationship between $X$ and $Y$ can be
approximated reasonably well by a straight line in the form $y = a +
b x$, meaning that $y_(i) approx a + b x_(i)$ for any $(x_(i), y_(i))$.
The straight line $y = a + b x$ is also called the *regression line*.

Let $y_(i)$ be the true value for the $Y$ variable for the $i$-th
element, and let $hat(y)_(i) = a + b x_(i)$ be the estimated value
for the $Y$ variable employing a straight line of parameters $a$
and $b$. The error of approximation between $y_(i)$ and $hat(y)_(i)$
is given by the distance between the two points on the cartesian plane.

This distance can be quantified by the squared difference of the two
quantities: $(hat(y)_(i) - y_(i))^(2)$. The interest is to have this
distance minimized across the entire dataset, which means that the sum
of all such distances:

$ F(a, b) =
  sum_(i = 1)^(n) (hat(y)_(i) - y_(i))^(2) =
  sum_(i = 1)^(n) (a + b x_(i) - y_(i))^(2) $

Should be as small as possible. Taking the partial derivative of $F(a, b)$
with respect to $a$:

$ frac(partial F, partial a) F(a, b) &=
  frac(partial F, partial a) sum_(i = 1)^(n) (a + b x_(i) - y_(i))^(2) =
  sum_(i = 1)^(n) frac(partial F, partial a) (a + b x_(i) - y_(i))^(2) =
  sum_(i = 1)^(n) 2(a + b x_(i) - y_(i)) frac(partial F, partial a) (a + b x_(i) - y_(i)) = \
  &= 2 sum_(i = 1)^(n) (a + b x_(i) - y_(i)) (frac(partial F, partial a) a + frac(partial F, partial a) b x_(i) - frac(partial F, partial a) y_(i)) = 
  2 sum_(i = 1)^(n) a + b x_(i) - y_(i) $

And with respect to $b$:

$ frac(partial F, partial b) F(a, b) &=
  frac(partial F, partial b) sum_(i = 1)^(n) (a + b x_(i) - y_(i))^(2) =
  sum_(i = 1)^(n) frac(partial F, partial b) (a + b x_(i) - y_(i))^(2) =
  sum_(i = 1)^(n) 2(a + b x_(i) - y_(i)) frac(partial F, partial b) (a + b x_(i) - y_(i)) = \
  &= 2 sum_(i = 1)^(n) (a + b x_(i) - y_(i)) (frac(partial F, partial b) a + frac(partial F, partial b) b x_(i) - frac(partial F, partial b) y_(i)) = 
  2 sum_(i = 1)^(n) (a + b x_(i) - y_(i)) x_(i) $

Setting them equal to $0$ and rearranging the expressions:

$ cancel(2) sum_(i = 1)^(n) a + b x_(i) - y_(i) = 0 =>
  sum_(i = 1)^(n) a + sum_(i = 1)^(n) b x_(i) - sum_(i = 1)^(n) y_(i) = 0 =>
  n a + b sum_(i = 1)^(n) x_(i) = sum_(i = 1)^(n) y_(i) $

$ cancel(2) sum_(i = 1)^(n) (a + b x_(i) - y_(i)) x_(i) = 0 =>
  sum_(i = 1)^(n) a x_(i) + sum_(i = 1)^(n) b x^(2)_(i) - sum_(i = 1)^(n) x_(i) y_(i) = 0 =>
  a sum_(i = 1)^(n) x_(i) + b sum_(i = 1)^(n) x^(2)_(i) = sum_(i = 1)^(n) x_(i) y_(i) $

Allows one to retrieve the so-called *normal equations*, a linear equation
system with two equations and two unknowns $a$ and $b$:

#grid(
	columns: (0.5fr, 0.5fr),
	[$ n a + b sum_(i = 1)^(n) x_(i) = sum_(i = 1)^(n) y_(i) $],
	[$ a sum_(i = 1)^(n) x_(i) + b sum_(i = 1)^(n) x^(2)_(i) = sum_(i = 1)^(n) x_(i) y_(i) $]
)

The system has exactly one solution as long as all points do not lie on
the same line.

The same approach can be extended to the case of approximating functions
that aren't straight lines, but a polynomial of arbitrary degree $m$.

Suppose that a dataset $(X, Y) = {(x_(1), y_(1)), dots, (x_(n), y_(n))}$
of $n$ points has its relationship well approximated by a $m$ degree
*regression polynomial* $y = a_(0) + a_(1) x + dots + a_(m) x^(m)$,
meaning that $y_(i) approx a_(0) + a_(1) x_(i) + dots + a_(m) x^(m)_(i)$
for any $(x_(i), y_(i))$. The error can be quantified as always by the
sum of square differences:

$ F(a_(0), a_(1), dots, a_(m)) =
  sum_(i = 1)^(n) (hat(y)_(i) - y_(i))^(2) =
  sum_(i = 1)^(n) (a_(0) + a_(1) x_(i) + dots + a_(m) x^(m)_(i) - y_(i))^(2) $

Setting all partial derivatives equal to $0$:

#grid(
	columns: (0.3fr, 0.3fr, 0.1fr, 0.3fr),
	[$ frac(partial F, partial a_(0)) F(a_(0), a_(1), dots, a_(m)) = 0 $],
	[$ frac(partial F, partial a_(1)) F(a_(0), a_(1), dots, a_(m)) = 0 $],
	[$ dots $],
	[$ frac(partial F, partial a_(m)) F(a_(0), a_(1), dots, a_(m)) = 0 $]
)

Rearranging, one obtains $n$ equations in $n$ unkowns:

$ n a_(0) + a_(1) sum_(i = 1)^(n) x_(i) + dots + a_(m) sum_(i = 1)^(n) x_(i)^(m) &= sum_(i = 1)^(n) y_(i) \
  n a_(0) sum_(i = 1)^(n) x_(i) + a_(1) sum_(i = 1)^(n) x_(i)^(2) + dots + a_(m) sum_(i = 1)^(n) x_(i)^(m + 1) &= sum_(i = 1)^(n) x_(i) y_(i) \
  & dots.v \
  n a_(0) sum_(i = 1)^(n) x_(i)^(m) + a_(1) sum_(i = 1)^(n) x_(i)^(m + 1) + dots + a_(m) sum_(i = 1)^(n) x_(i)^(2m) &= sum_(i = 1)^(n) x_(i)^(m) y_(i) $

The system has exactly one solution as long as all points do not lie on
the same polynomial of degree smaller or equal than $m$.

The approach can be extended to the case of finding a regression line
for a function of any arity. Suppose that a dataset

$ (X_(1), dots, X_(m), Y) = {(x_(1, 1), x_(2, 1), dots, x_(m, 1), y_(1)),
                          (x_(1, 2), x_(2, 2), dots, x_(m, 2), y_(2)), dots,
                          (x_(1, n), x_(2, n), dots, x_(m, n), y_(n))} $

of $n$ $m$-dimensional points has the relationship between $X_(1), dots,
X_(m)$ and $Y$ well approximated by a $m$-dimensional linear function

$ y = a_(0) + a_(1) x_(1) + a_(2) x_(2) + dots + a_(m) x^(m) = a_(0) + sum_(k = 1)^(m) a_(k) x_(k) $

The error is quantified by the function:

$ F(arrow(a)) = (bold(X) arrow(a) - arrow(y))^(T) (bold(X) arrow(a) - arrow(y)) 
  space "with" bold(X) = mat(1, x_(1, 1), dots, x_(m, 1);
                             dots.v, dots.v, dots.down, dots.v;
                             1, x_(1, n), dots, x_(m, n)),
  arrow(y) = vec(y_(1), dots, y_(n)),
  arrow(a) = vec(a_(0), a_(1), dots, a_(m)) $

Instead of minimizing the derivative, one has to minimize the gradient:

$ nabla_(arrow(a)) F(arrow(a)) =
  nabla_(arrow(a)) (bold(X) arrow(a) - arrow(y))^(T) (bold(X) arrow(a) - arrow(y)) =
  arrow(0) $

Which gives a system of equations:

$ bold(X)^(T) bold(X) arrow(a) = bold(X)^(T) arrow(y) =>
arrow(a) = (bold(X)^(T) bold(X))^(-1) bold(X)^(T) arrow(y) $

That has solutions unless $bold(X)^(T) bold(X)$ is a singular matrix.

It should also be noted that it's possible to extend the techniques used
to find linear relationships to non-linear ones. For example, suppose that
the relationship between two variables $X$ and $Y$ of a dataset can be well
approximated by a function $y = a x^(b)$. Taking the logarithm on both sides
gives $ln(y) = ln(a) + b ln(x)$. This means that, taking the logarithms of
both $x$ and $y$, one is in the situation of having to find a regression
line.

This is particularly helpful for the tuning of the multilayer perceptron
parameters, since the activation function that they use are non-linear.
For example, suppose that the chosen activation function is the logistic
function:

$ y = frac(Y, 1 + e^(a + b x)) $

Where $Y, a, b$ are constants to be determined. If it's possible to
"linearize" the function so that it's possible to apply the method of
least squares to find the optimal values for these constants, then it's
possible to find a *regression curve* carrying the optimal values for
the original datapoints. If that's the case, it becomes possible to
optimize the parameters of a two layer perceptron with a single input,
since the value of $a$ is the bias value of the output neuron and the
value of $b$ is the weight of the input.

The "linearization" can be performed as follows:

$ y = frac(Y, 1 + e^(a + b x)) =>
  frac(1, y) = frac(1 + e^(a + b x), Y) =>
  frac(Y, y) = 1 + e^(a + b x) =>
  frac(Y - y, y) = e^(a + b x) =>
  ln(frac(Y - y, y)) = a + b x $

This transformation is also known as *logit transformation*. By finding
a regression line for the data points whose $y$ variable is transformed
according to left hand side of the equation, one (indirectly) obtains a
regression curve for the original data points.

#exercise[
  Consider the dataset ${(1, 0.4), (2, 1.0), (3, 3.0), (4, 5.0), (5, 5.6)}$.
  Setting $Y = 6$, find the regression curve.
]
#solution[
  Each value of $y$ is scaled as $tilde(y) = ln((Y - y) slash y)$.
  This gives the new set of points ${(1, 2.64), (2, 1.61), (3, 0.00),
  (4, -1.61), (5, -2.64)}$. Noting that:

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ sum_(i = 1)^(n) x_(i) &= 1 + 2 + 3 + 4 + 5 = 15 \
       sum_(i = 1)^(n) x^(2)_(i) &= 1^(2) + 2^(2) + 3^(2) + 4^(2) + 5^(2) = 55 $],
    [$ sum_(i = 1)^(n) tilde(y)_(i) &= 2.64 + 1.61 + 0.00 - 1.61 - 2.64 = 0 \
       sum_(i = 1)^(n) x_(i) tilde(y)_(i) &= 1 dot 2.64 + 2 dot 1.61 + 3 dot 0.00 \
       & - 4 dot 1.61 - 5 dot 2.64 approx -13.78 $]
  )

  Leads to the following system of equations:

  $ cases(5 a + 15 b = 0, 15 a + 55 b = -13.78) =>
    cases(a = -3 b, 15 dot (-3 b) + 55 b = -13.78) =>
    cases(a = -3 dot (-1.38), b = -1.38) =>
    cases(a = 4.14, b = -1.38) $

  Which gives the following regression line and, by extension,
  regression curve:

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ tilde(y) = 4.14 - 1.38 x $
     #image("logit1.svg")],
    [$ hat(y) = frac(6, 1 + e^(4.14 - 1.38 x)) $
     #image("logit2.svg")]
  )

  The resulting regression curve for the original data can be computed
  by a neuron with one input $x$ having $f_("net")(x) = -1.38x$ as network
  input function, $f_("act")("net") = 1 slash (1 + e^(−("net" − 4.14)))$
  as activation function and $f_("out")("act") = 6 "act"$ as output function.
]

Of course, the same approach can be used to find the optimized parameters
of a two layer perceptron with more than one input. The problem with this
approach is that the sum of square errors cannot be extended to multilayer
perceptrons with more than two layers, because the layers in the middle
cannot be taken into account.
