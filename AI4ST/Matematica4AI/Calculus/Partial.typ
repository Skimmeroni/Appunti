#import "../Math4AI_definitions.typ": *

Let $f(x_(1), x_(2), dots, x_(n)) : RR^(n) -> RR$ be a function of $n$
arguments that returns a single value. For each of its $i$-th argument
it is possible to define the *partial derivative* with respect to $x_(i)$
as:

$ frac(partial f, partial x_(i)) = lim_(h -> 0)
  frac(f(x_(1), x_(2), dots, x_(i) + h, dots, x_(n)) -
  f(x_(1), x_(2), dots, x_(i), dots, x_(n)), h) $

That is, a partial derivative of a $f : RR^(n) -> RR$ function is "regular"
derivative that is computed with respect to a single variable, treating
all other variables as they were constants. Of course, as any regular
derivative, a partial derivative may or may not exist.

A partial derivative, as a "regular" derivative, describes the rate of
change of the function. The difference is that a function of $n$ variables
has $n$ distinct directions, and its $i$-th partial derivative describes
the rate of change of the function along the $i$-th axis.

#exercise[
  Compute both partial derivatives of the function $f(x, y) = sin(frac(x, 1 + y))$.
]
#solution[
  $ frac(partial f, partial x) sin(frac(x, 1 + y)) =
    cos(frac(x, 1 + y)) (frac(partial f, partial x) (frac(x, 1 + y))) =
    cos(frac(x, 1 + y)) (frac(1, 1 + y)) (frac(partial f, partial x) (x)) =
    frac(cos(frac(x, 1 + y)), 1 + y) $

  $ frac(partial f, partial y) sin(frac(x, 1 + y)) =
    cos(frac(x, 1 + y)) (frac(partial f, partial y) (frac(x, 1 + y))) =
    cos(frac(x, 1 + y)) x (frac(partial f, partial y) (frac(1, 1 + y))) =
    frac(-x cos(frac(x, 1 + y)), (1 + y)^(2)) $
]

It is possible to compute a partial derivative more than one time. That is
to say, a partial derivative can be computed with respect to the result of
applying a partial derivative.

For example, to denote that to the function $f$ is first applied a partial
derivative with respect to the variable $x_(i)$ and then, to the result, is
applied a partial derivative with respect to another variable $x_(j)$, the
notation $partial^(2) f slash partial x_(j) partial x_(i)$ is used. Notice
how, in accord to the way function composition works, the order of derivation
is from right to left.

Said notation can be extended to the case of computing a partial derivative
for $k$ times. When a partial derivative is computed with respect to the
same variable more than once, it is possible to use the shortand notation
$partial^(k) f slash partial x_(i)^(k)$, meaning that a partial derivative
of $f$ is taken with respect to $x_(i)$, to which a partial derivative with
respect to $x_(i)$ is applied, to which a partial derivative with respect to
$x_(i)$ is applied, ecc...

#exercise[
  Find all second partial derivatives of $f(x, y) = x^(3) + x^(2)y^(3) - 2y^(2)$.
] <Example-on-partial-derivatives>
#proof[
  The two first partial derivatives are:

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ frac(partial f, partial x) (x^(3) + x^(2)y^(3) - 2y^(2)) = 3x^(2) + 2x y^(3) $],
    [$ frac(partial f, partial y) (x^(3) + x^(2)y^(3) - 2y^(2)) = 3y^(2) x^(2) - 4y $]
  )

  From those, it is possible to compute four second partial derivatives:

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ frac(partial^(2) f, partial^(2) x) (3x^(2) + 2x y^(3)) = 6x + 2y^(3) $],
    [$ frac(partial^(2) f, partial x partial y) (3y^(2) x^(2)) - 4y = 6x y^(2) $]
  )

  #grid(
    columns: (0.5fr, 0.5fr),
    [$ frac(partial^(2) f, partial y partial x) (3x^(2) + 2x y^(3)) = 6x y^(2) $],
    [$ frac(partial^(2) f, partial^(2) y) (3y^(2) x^(2) - 4y) = 6x^(2) y - 4 $]
  )
]

Notice how in @Example-on-partial-derivatives, taking the partial derivative
of the function first with respect to $x$ and then with respect to $y$
is the same as taking the derivative with respect to $y$ and then to $x$.
This isn't always the case, and instead happens only when the function
satisfies certain conditions.

#theorem("Schwartz's theorem")[
  Let $f$ be a function defined as $f(x_(1), dots, x_(n)) : A subset.eq
  RR^(n) -> RR$, and let $bold(p) = (p_(1), dots, p_(n)) in RR^(n)$ be
  a point. If some neighborhood of $bold(p)$ is contained in $A$ and $f$
  has continuous partial derivatives in said neighborhood, then, for any
  $i, j in {1, dots, n}$:

  $ frac(partial^(2) f, partial x_(i) partial x_(j)) f(bold(p)) = 
    frac(partial^(2) f, partial x_(j) partial x_(i)) f(bold(p)) $
]

#exercise[
  Given $f = sin(3x + y z)$, compute $partial^(4) f slash partial z
  partial y partial^(2) x$.
]
#solution[
  $ frac(partial f, partial x) (sin(3x + y z)) =
    cos(3x + y z) frac(partial f, partial x) (3x + y z) =
    3cos(3x + y z) \ 
    
    frac(partial f, partial x) (3cos(3x + y z)) =
    -3sin(3x + y z) frac(partial f, partial x) (3x + y z) =
    -9sin(3x + y z) \

    frac(partial f, partial y) (-9sin(3x + y z)) =
    -9cos(3x + y z) frac(partial f, partial y) (3x + y z) =
    -9z cos(3x + y z) \
    
    frac(partial f, partial z) (-9z cos(3x + y z)) =
    -9 cos(3x + y z) - 9z frac(partial f, partial z) (cos(3x + y z)) =
    9y z sin(3x + y z) -9 cos(3x + y z) $

  Summing up:

  $ frac(partial^(4) f, partial z partial y partial^(2) x) (sin(3x + y z)) =
    9y z sin(3x + y z) -9 cos(3x + y z) $
]

As stated, a partial derivative describes the rate of change of the
function along the $i$-th axis in the $n$-dimensional plane. Since
each axis is described by a unit vector, a derivative along the $i$-th
axis can be conceived as the rate of change of the function along the
direction described by the $i$-th unit vector. Since any direction can
be described by a vector, it is possible to compute a derivative of a
function along any arbitrary direction, not just the ones described by
the $n$ unit vectors.

Let $f: A subset RR^(n) -> RR$ be a function, $bold(v) in RR^(n)$ a non-null
vector and $bold(c)$ a point in $A$. $f$ is said to have *directional
derivative* along $bold(v)$ in $bold(c)$, denoted as $D_(bold(v)) f(bold(c))$
if the following limit exists:

$ D_(bold(v)) f(bold(c)) =
  lim_(h -> 0) frac(f(bold(c) + h bold(v)) - f(bold(c)), h) =
  lim_(h -> 0) frac(f(c_(1) + h v_(1), c_(2) + h v_(2), dots, c_(n) + h v_(n)) -
  f(c_(1), c_(2), dots, c_(n)), h) $

If $bold(v)$ is the $i$-th unit vector, the directional derivative is just
a partial derivative with respect to the $i$-th variable.

Let $f(x_(1), dots, x_(n)): A subset RR^(n) -> RR$ be a function and let
$bold(p)$ be a point in $A$. The *gradient* of $f$ in $bold(p)$, denoted
as $nabla_(f) (bold(p))$, is a column vector whose components are the first
partial derivatives of $f$, arranged from the first to the $n$-th:

$ nabla_(f) (bold(p)) = mat(delim: "[",
  display(frac(partial f, partial x_(1)));
  display(frac(partial f, partial x_(2)));
  dots.v;
  display(frac(partial f, partial x_(n)))) =
  mat(delim: "[",
  display(frac(partial f, partial x_(1))),
  display(frac(partial f, partial x_(2))),
  dots,
  display(frac(partial f, partial x_(n))))^(T) =
  frac(partial f, partial x_(1)) hat(i)_(1) +
  frac(partial f, partial x_(2)) hat(i)_(n) +
  dots +
  frac(partial f, partial x_(n)) hat(i)_(n) $

The gradient of a ($n$-valued) scalar function is actually a special case of
a more generic matrix of a ($n$-valued) vectorial function, called *Jacobian
matrix*:

$ bold(J)_(f) (bold(p)) = mat(delim: "[",
  display(frac(partial bold(f), partial x_(1))),
  dots,
  display(frac(partial bold(f), partial x_(n)))) =
  mat(delim: "[",
  nabla_(f_(1))^(T) (bold(p));
  dots.v;
  nabla_(f_(n))^(T) (bold(p))) $

// Relationship between the gradient vector and the directional derivative

The gradient vector is strongly related to maxima and minima of a function.

#theorem[
  If a function has a local maximum or minimum in a point and all partial
  derivatives in said point exist, the gradient in said point is zero.
] <Gradient-maxima-minima>
// #proof[
// Could be added?
// ]

Any point whose gradient is zero is called a *critical point* or
*stationary point*. Note that, while @Gradient-maxima-minima guarantees
that maxima and minima are also critical points, the converse is not
necessarely true. In particular, a critical point that is neither a
maximum or a minimum is called a *saddle point*.

Similarly to the gradient, the second partial derivatives of $f$ can be
arranged in a matrix, called *Hessian matrix* and denoted as $H_(f)$:

$ H_(f) = mat(delim: "[",
  display(frac(partial^(2) f, partial^(2) x_(1))),
  display(frac(partial^(2) f, partial x_(2) partial x_(1))),
  dots,
  display(frac(partial^(2) f, partial x_(n) partial x_(1)));
  display(frac(partial^(2) f, partial x_(1) partial x_(2))),
  display(frac(partial^(2) f, partial^(2) x_(2))),
  dots,
  display(frac(partial^(2) f, partial x_(n) partial x_(2)));
  dots.v, dots.v, dots.down, dots.v;
  display(frac(partial^(2) f, partial x_(1) partial x_(n))),
  display(frac(partial^(2) f, partial x_(2) partial x_(n))),
  dots,
  display(frac(partial^(2) f, partial^(2) x_(n)))) $

The Hessian matrix is strongly related the natures of a critical point of a
function.

#theorem("Second derivative test for functions having more than one variable")[
  Consider the function $f : A subset.eq RR^(n) -> RR$, twice (or more)
  differentiable. Let $bold(p)$ be a critical point of $f$, and let
  $H_(f) (bold(p))$ be the Hessian matrix of $f$ at $bold(p)$. Then:

  - If $H_(f) (bold(p))$ is positive definite, $bold(p)$ is a local minimum;
  - If $H_(f) (bold(p))$ is negative definite, $bold(p)$ is a local maximum;
  - If $H_(f) (bold(p))$ has at least a positive eigenvalue, a negative
    eigenvalue and no eigenvalue is zero, $bold(p)$ is a saddle point;
  - If none of the above is true, the test is inconclusive.
] <Hessian-critical-points>
// #proof[
// Could be added?
// ]
