#import "../../AI_definitions.typ": *

Hopfield networks are well-suited for implementing *associative memory*.
Associative memory models the way the brain recollects memories when
presented with known information. The idea is to use stable states of
a Hopfield network to encode information (patterns): when a pattern is
presented to the network, its update process will lead the network to
the stable state that is the closest to the pattern. In this context a
training pattern is a ordered vector of activations.

// FIXME: messy

To do so, consider the simplest possible scenario of constructing
a Hopfield network of $n$ neurons that stores exactly one pattern
$bold(p)$. To store $bold(p)$ into the network, its threshold and
its weights have to be chosen in such a way that $bold(p)$ is a
stable state for the network. Stated otherwise, when $bold(p)$ is
presented to the network its update phase must change nothing, and
enter in an indefinite loop immediately. More formally, this requires:

$ S(bold(W) bold(p) - bold(theta)) = bold(p) $

Where $S : RR^(n) mapsto {+1, -1}^(n)$ is an "extended" (modified) Heaviside
function, that applies the (modified) Heaviside function to each activation
in the pattern one by one. That is:

$ S(bold(p)) = (overline(H) (p_(1), theta), overline(H) (p_(2), theta), dots, overline(H) (p_(n), theta)) $

If choosing $bold(theta) = bold(0)$, meaning that all $theta$ parameters
are set to $0$, then any matrix $bold(W)$ for which it exists $c in RR^(+)$
such that:

$ bold(W) bold(p) = c bold(p) $

Would satisfy $S(bold(W) bold(p)) = bold(p)$. This is because $bold(p)$
and $c bold(p)$ have the same sign, hence applying $S$ to them (that is,
applying $overline(H) (p_(i), 0)$ to each $i$-th component one by one)
would give the same result.

Notice how $c$ in the expression $bold(W) bold(p) = c bold(p)$ is an
eigenvalue of $bold(W)$. A matrix that is guaranteed to have $c$ as
eigenvalue is and $bold(p)$ as the corresponding eigenvector is:

$ bold(W) = bold(p) bold(p)^(T) - bold(I)_(n) $

// FIXME: not clear why

This matrix is symmetric and has $0$ on the diagonal, which qualifies
it as a possible matrix for a Hopfield network. Substituting:

$ bold(W) bold(p) =
  (bold(p) bold(p)^(T) - bold(I)_(n)) bold(p) =
  bold(p) bold(p)^(T) bold(p) - bold(I)_(n) bold(p) =
  bold(p) bold(p)^(T) bold(p) - bold(p) $

Notice how $bold(p)^(T) bold(p)$ is just the square norm of $bold(p)$
(the inner product of $bold(p)$ with itself). Since by definition each
component of $bold(p)$ is $plus.minus 1$:

$ bold(p)^(T) bold(p) =
  p_(1) p_(1) + dots + p_(n) p_(n) =
  p_(1)^(2) + dots + p_(n)^(2) =
  (plus.minus 1)^(2) + dots + (plus.minus 1)^(2) =
  1 + dots + 1 = n $

Substituting:

$ bold(W) bold(p) =
  bold(p) bold(p)^(T) bold(p) - bold(p) =
  bold(p) n - bold(p) =
  (n - 1) bold(p) $

Which gives $c = n - 1$, since $bold(W) bold(p) = c bold(p)$. This means
that by choosing $bold(theta) = bold(0)$ and $bold(W)$ that has $bold(p)$
as eigenvector and $c$ as the corresponding eigenvalue, the resulting
Hopfield network will have $bold(p)$ as a stable state. Also notice how,
since $n$ is an integer that has to be at least $2$, $c = n - 1$ is indeed
a strictly positive number.

Writing $W$ explicitly:

$ bold(W) &=
  bold(p) bold(p)^(T) - bold(I)_(n) =
  vec("act"_(u_(1)), "act"_(u_(2)), dots.v, "act"_(u_(n)))
  mat("act"_(u_(1)), "act"_(u_(2)), dots, "act"_(u_(n))) -
  mat(1, 0, dots, 0;
      0, 1, dots, 0;
      dots.v, dots.v, dots.down, dots.v;
      0, 0, dots, 1) = \
  &= mat(("act"_(u_(1)))^(2) - 1, "act"_(u_(1)) "act"_(u_(2)), dots, "act"_(u_(1)) "act"_(u_(n));
       "act"_(u_(2)) "act"_(u_(1)), ("act"_(u_(2)))^(2) - 1, dots, "act"_(u_(2)) "act"_(u_(n));
       dots.v, dots.v, dots.down, dots.v;
       "act"_(u_(n)) "act"_(u_(1)), "act"_(u_(n)) "act"_(u_(2)), dots, ("act"_(u_(n)))^(2) - 1) $

Since all activations are either $+1$ or $-1$:

$ w_(u_(i), u_(j)) =
  cases(0 & "if" i = j,
        +1 & "if" i != j and "act"_(u_(i)) = "act"_(u_(j)),
        -1 & "if" i != j and "act"_(u_(i)) != "act"_(u_(j))) $

This rule is also known as the *Hebbian learning rule*. Originally,
this rule was derived from a biological analogy: the connection between
two neurons that are synchronously active is strengthened. This is
captured by the maxima _neurons that fire together, wire together_.

Note how storing a pattern $bold(p)$ in a Hopfield network always
results in also storing its "anti-pattern" $-bold(p)$ (a pattern
with the same magnitudes but with opposite signs). This is because:

$ bold(W) bold(p) = (n - 1) bold(p) =>
  -bold(W) bold(p) = -(n - 1) bold(p) =>
  bold(W) (-bold(p)) = (n - 1) (-bold(p)) $

If multiple patterns $bold(p)_(1), dots, bold(p)_(m)$ with $m < n$, are
to be stored in the network, a matrix $bold(W)_(i)$ can be determined as
above for each $i$-th pattern and the final matrix $bold(W)$ is the sum
of all said matrices:

$ bold(W) = sum_(i = 1)^(m) bold(W)_(i) =
  sum_(i = 1)^(m) (bold(p)_(i) bold(p)_(i)^(T) - bold(I)_(n)) =
  (sum_(i = 1)^(m) bold(p)_(i) bold(p)_(i)^(T)) - m bold(I)_(n) $

Consider the particularly favourable case of the pattern vectors forming
an orthogonal set, meaning that:

$ angle.l bold(p)_(i), bold(p)_(j) angle.r =
  bold(p)_(i)^(T) bold(p)_(j) =
  cases(0 & "if" i != j, norm(bold(p)_(i))^(2) & "if" i = j) =
  cases(0 & "if" i != j, n & "if" i = j) $

For an arbitrary pattern $bold(p)_(j)$ from an orthogonal set, one has:

$ bold(W) bold(p)_(j) &=
  ((sum_(i = 1)^(m) bold(p)_(i) bold(p)_(i)^(T)) - m bold(I)_(n)) bold(p)_(j) =
  (sum_(i = 1)^(m) bold(p)_(i) bold(p)_(i)^(T)) bold(p)_(j) - m bold(I)_(n) bold(p)_(j) =
  (sum_(i = 1)^(m) bold(p)_(i) (bold(p)_(i)^(T) bold(p)_(j))) - m bold(p)_(j) = \
  &= bold(p)_(1) (bold(p)_(1)^(T) bold(p)_(j)) + bold(p)_(2) (bold(p)_(2)^(T) bold(p)_(j)) +
  dots + bold(p)_(j) (bold(p)_(j)^(T) bold(p)_(j)) + dots + bold(p)_(n) (bold(p)_(n)^(T) bold(p)_(j)) - m bold(p)_(j) = \
  &= bold(p)_(1) dot 0 + bold(p)_(2) dot 0 + dots + bold(p)_(j) dot n + dots + bold(p)_(n) dot 0 - m bold(p)_(j) =
  n bold(p)_(j) - m bold(p)_(j) = (n - m) bold(p)_(j) $

And since $(n - m) > 0$, the pattern $bold(p)_(j)$ is indeed a stable
state. This means that for an Hopfield network of $n$ neurons, it is
possible to store at most $m = n - 1$ patterns (and their anti-patterns),
as long as they form an orthogonal set. Considering that a Hopfield
network has $2^(n)$ states, the amount of information that it can store
is actually pretty small compared to its size.

In practice, patterns are very unlikely to form an orthogonal set. If
they don't, then the expression reads:

$ bold(W) bold(p)_(j) &=
  (sum_(i = 1)^(m) bold(p)_(i) (bold(p)_(i)^(T) bold(p)_(j))) - m bold(p)_(j) = 
  bold(p)_(j) (bold(p)_(j)^(T) bold(p)_(j)) + (sum_(i = 1 \ i != j)^(m) bold(p)_(i) (bold(p)_(i)^(T) bold(p)_(j))) - m bold(p)_(j) = \
  &= n bold(p)_(j) + (sum_(i = 1 \ i != j)^(m) bold(p)_(i) (bold(p)_(i)^(T) bold(p)_(j))) - m bold(p)_(j) = 
  (n - m) bold(p)_(j) + underbrace(sum_(i = 1 \ i != j)^(m) bold(p)_(i) (bold(p)_(i)^(T) bold(p)_(j)), delta) $

If $n - m > 0$ and $delta$ is sufficiently small, $bold(p)_(j)$ might
still be a stable state, but there is no guarantee. This is the case
when the patterns are "almost" orthogonal, meaning that they have a
small scalar product. A larger number of patterns to store means a 
larger value of $delta$ (on average), meaning that the more patterns
are to be stored with the same number of neurons, the harder it becomes
to fit them.

// FIXME: why?

This means that not only the theoretical upper limit of storable patterns
in a Hopfield network of $n$ neurons is $n - 1$, but this limit is even
lower in practice.

#exercise[
    Construct a Hopfield network that can encode the two
    patterns $bold(p)_(1) = mat(+1, +1, -1, -1)^(T)$ and 
    $bold(p)_(2) = mat(-1, +1, -1, +1)^(T)$.
]
#solution[
    $ bold(W) &=
      sum_(i = 1)^(2) bold(W)_(i) =
      (sum_(i = 1)^(2) bold(p)_(i) bold(p)_(i)^(T)) - 2 bold(I)_(4) =
      bold(p)_(1) bold(p)_(1)^(T) + bold(p)_(2) bold(p)_(2)^(T) - 2 bold(I)_(4) = \
      &= vec(+1, +1, -1, -1) mat(+1, +1, -1, -1)^(T) +
         vec(-1, +1, -1, +1) mat(-1, +1, -1, +1)^(T) +
         mat(-2, 0, 0, 0; 0, -2, 0, 0; 0, 0, -2, 0; 0, 0, 0, -2) = \
      &= mat(+1, +1, -1, -1; +1, +1, -1, -1; -1, -1, +1, +1; -1, -1, +1, +1) +
         mat(+1, -1, +1, -1; -1, +1, -1, +1; +1, -1, +1, -1; -1, +1, -1, +1) +
         mat(-2, 0, 0, 0; 0, -2, 0, 0; 0, 0, -2, 0; 0, 0, 0, -2) =
         mat(0, 0, 0, -2; 0, 0, -2, 0; 0, -2, 0, 0; -2, 0, 0, 0) $

    The two patterns are eigenvectors of this matrix:

    $ bold(W) bold(p)_(1) =
      mat(0, 0, 0, -2; 0, 0, -2, 0; 0, -2, 0, 0; -2, 0, 0, 0) vec(+1, +1, -1, -1) =
      vec((-2) (-1), (-2) (-1), (-2) (+1), (-2) (+1)) =
      vec(+2, +2, -2, -2) = 2 vec(+1, +1, -1, -1) = 2 bold(p)_(1) $

    $ bold(W) bold(p)_(2) =
      mat(0, 0, 0, -2; 0, 0, -2, 0; 0, -2, 0, 0; -2, 0, 0, 0) vec(-1, +1, -1, +1) =
      vec((-2) (+1), (-2) (-1), (-2) (+1), (-2) (-1)) =
      vec(-2, +2, -2, +2) = 2 vec(-1, +1, -1, +1) = 2 bold(p)_(2) $

    Since $2 > 0$, both patterns result in stable states.

    #figure(
        caption: [The Hopfield network of interest.],
        diagram(
                node-stroke: 1.5pt + blue,
                edge-stroke: 1.5pt,
                spacing: 4em,

                node((0, -1.75), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[1]])),
                node((1, -1.75), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[2]])),
                node((2, -1.75), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[3]])),
                node((3, -1.75), fill: none, stroke: none, text(font: "Noto Sans", [x#sub[4]])),

                node((0, 0), text(font: "Noto Sans", [0]), radius: 2em, name: <N1>),
                node((1, 0), text(font: "Noto Sans", [0]), radius: 2em, name: <N2>),
                node((2, 0), text(font: "Noto Sans", [0]), radius: 2em, name: <N3>),
                node((3, 0), text(font: "Noto Sans", [0]), radius: 2em, name: <N4>),

                node((0, 1.75), fill: none, stroke: none, text(font: "Noto Sans", [y#sub[1]])),
                node((1, 1.75), fill: none, stroke: none, text(font: "Noto Sans", [y#sub[2]])),
                node((2, 1.75), fill: none, stroke: none, text(font: "Noto Sans", [y#sub[3]])),
                node((3, 1.75), fill: none, stroke: none, text(font: "Noto Sans", [y#sub[4]])),

                edge(<N1>, <N2>, marks: (none, "latex"), label-angle: auto, bend: -30deg, label: text(font: "Noto Sans", [0])),
                edge(<N1>, <N3>, marks: (none, "latex"), label-angle: auto, label-pos: 0.4, bend: -45deg, label: text(font: "Noto Sans", [0])),
                edge(<N1>, <N4>, marks: (none, "latex"), label-angle: auto, bend: -55deg, label: text(font: "Noto Sans", [-2])),
                edge(<N2>, <N1>, marks: (none, "latex"), label-angle: auto, bend: -30deg, label: text(font: "Noto Sans", [0])),
                edge(<N2>, <N3>, marks: (none, "latex"), label-angle: auto, bend: -30deg, label: text(font: "Noto Sans", [-2])),
                edge(<N2>, <N4>, marks: (none, "latex"), label-angle: auto, label-pos: 0.4, bend: -45deg, label: text(font: "Noto Sans", [0])),
                edge(<N3>, <N1>, marks: (none, "latex"), label-angle: auto, label-pos: 0.4, bend: -45deg, label: text(font: "Noto Sans", [0])),
                edge(<N3>, <N2>, marks: (none, "latex"), label-angle: auto, bend: -30deg, label: text(font: "Noto Sans", [-2])),
                edge(<N3>, <N4>, marks: (none, "latex"), label-angle: auto, bend: -30deg, label: text(font: "Noto Sans", [0])),
                edge(<N4>, <N1>, marks: (none, "latex"), label-angle: auto, bend: -55deg, label: text(font: "Noto Sans", [-2])),
                edge(<N4>, <N2>, marks: (none, "latex"), label-angle: auto, label-pos: 0.4, bend: -45deg, label: text(font: "Noto Sans", [0])),
                edge(<N4>, <N3>, marks: (none, "latex"), label-angle: auto, bend: -30deg, label: text(font: "Noto Sans", [0])),

                edge((0, -1.75), <N1>, marks: (none, "latex")),
                edge((1, -1.75), <N2>, marks: (none, "latex")),
                edge((2, -1.75), <N3>, marks: (none, "latex")),
                edge((3, -1.75), <N4>, marks: (none, "latex")),
                edge(<N1>, (0, 1.75), marks: (none, "latex")),
                edge(<N2>, (1, 1.75), marks: (none, "latex")),
                edge(<N3>, (2, 1.75), marks: (none, "latex")),
                edge(<N4>, (3, 1.75), marks: (none, "latex"))
        )
    )
]
