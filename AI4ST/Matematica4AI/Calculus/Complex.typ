#import "../Math4AI_definitions.typ": *

In mathematics, a *complex number* is an element of a number system
that extends the real numbers with a specific element denoted $i$,
called the *imaginary unit* #footnote[In the field of electrical
engineering, the imaginary unit is denoted as $j$, since $i$ is often
reserved to the current of an electric circuit.] and satisfying the
equation $i^(2) = - 1$. The set of complex numbers is denoted by the
symbol $CC$.

There are multiple way to express a complex number. The most intuitive
one is the *rectangular form*, or *algebraic form*. A complex number
written in such form is a number $z = a + i b$, where $i$ is the imaginary
unit and $a$ and $b$ are real numbers. The number $a$ is the *real part*
of the complex number $z = a + i b$, $b$ is the *imaginary part*. The two
are also denoted as $Re(z)$ and $Im(z)$, respectively. A complex number
with imaginary part equal to $0$ is just a real number; a complex number
with real part equal to $0$ is said to be a *purely imaginary* number.

#exercise[
    What are the roots of the polynomial $z^(2) + 6z + 25$?
]
#solution[
    $ z =
      frac(-6 plus.minus sqrt(36 - 4 dot 1 dot 25), 2) =
      frac(-6 plus.minus sqrt(-64), 2) =
      frac(-6 plus.minus sqrt(64) sqrt(-1), 2) =
      frac(-6 plus.minus 8 i, 2) =
      -3 plus.minus 4 i $
]

Addition, subtraction, multiplication and division of complex numbers
can be naturally defined by using the rule $i^(2) = −1$ along with the
associative, commutative, and distributive laws.

$ z_(1) + z_(2) &=
  (a_(1) + i b_(1)) + (a_(2) + i b_(2)) =
  a_(1) + a_(2) + i (b_(1) + b_(2)) \
  z_(1) - z_(2) &=
  (a_(1) + i b_(1)) - (a_(2) + i b_(2)) =
  a_(1) - a_(2) + i (b_(1) - b_(2)) \
  z_(1) z_(2) &=
  (a_(1) + i b_(1))(a_(2) + i b_(2)) =
  a_(1) a_(2) + i a_(1) b_(2) + i a_(2) b_(1) + i^(2) b_(1) b_(2) =
  a_(1) a_(2) - b_(1) b_(2) + i (a_(1) b_(2) + a_(2) b_(1)) \
  frac(z_(1), z_(2)) &=
  frac(a_(1) + i b_(1), a_(2) + i b_(2)) =
  frac((a_(1) + i b_(1))(a_(2) - i b_(2)), (a_(2) + i b_(2))(a_(2) - i b_(2))) =
  frac(a_(1) a_(2) - b_(1) b_(2) + i (a_(1) b_(2) + a_(2) b_(1)), a_(2)^(2) - b_(2)^(2)) $

A complex number $z$ can be identified with the ordered pair of real
numbers $(Re(z), Im(z))$, which may be interpreted as coordinates of
a point in a Cartesian plane, or, equivalently, as a two-dimensional
vector. This Cartesian plane is referred to as the *complex plane*
or the *Argand diagram*. The horizontal axis of the complex plane
is reserved for the real part, the vertical axis for the imaginary
part. This representation is also called the *Cartesian form* of the
complex number.

#figure(
	caption: [A complex number depicted in the complex plane.],
	diagram(
		edge-stroke: 0.75pt,
		spacing: 3em,

		edge((-1, 0), (5, 0), marks: (none, "stealth"), label-pos: 0.85, label-angle: auto, label: "Real axis"),
		edge((0, 1), (0, -3), marks: (none, "stealth"), label-pos: 0.66, label-angle: auto, label: "Imaginary axis"),
		edge((0, 0), (3, -1), marks: (none, "stealth"), label-pos: 0.95, stroke: 1pt + blue, $(Re(z), Im(z))$)
	)
)

This also implies that standard vector operation, vector sum and
multiplication by a scalar, have the expected result. The vector
resulting from the sum is given by applying the Parallelogram Law,
while multiplying a complex number by a scalar (a real, non complex
number) scales the vector while preserving its direction.

Given a complex number $z = a + i b$, the *complex conjugate* of $z$ is
the number $z^(*) = a - i b$, obtained by changing the sign of the imaginary
part of $z$. Geometrically, $z$ is the "reflection" of $z$ about the real
axis. It is trivial to see that, for any complex number $z$, $(z^(*))^(*)
= z$. A complex number is real if and only if it equals its own conjugate.

#figure(
	caption: [The complex conjugate $z^(*)$ of a complex number $z$ is
	          symmetric to $z$ with respect to the real axis.],
	diagram(
		edge-stroke: 0.75pt,
		spacing: 3em,

		edge((-1, 0), (5, 0), marks: (none, "stealth"), label-pos: 0.85, label-angle: auto, label: "Real axis"),
		edge((0, 1.5), (0, -3), marks: (none, "stealth"), label-pos: 0.7, label-angle: auto, label: "Imaginary axis"),
		edge((0, 0), (3, -1), marks: (none, "stealth"), label-pos: 0.95, stroke: 1pt + blue),
		edge((0, 0), (3, 1), marks: (none, "stealth"), label-pos: 0.95, stroke: 1pt + fuchsia),
		node((3, -1), $(Re(z), Im(z))$),
		node((3, 1), $(Re(z), -Im(z))$)
	)
)

Having a vector representation, it's possible to assign a length and
an angle with the $x$ axis (the real axis) to any complex number. The
length of the vector associated to a complex number $z$ is also referred
to as the *modulus* or *magnitude* of $z$, and is equal to $sqrt(Re(z)^(2)
+ Im(z)^(2))$. Another way to compute the modulus is:

$ abs(z) =
  sqrt(z dot z^(*)) =
  sqrt((Re(z) + i Im(z))(Re(z) - i Im(z))) =
  sqrt(Re(z)^(2) + Im(z)^(2)) $

When there is no ambiguity on which complex number is being referred to,
the modulus of a complex number is denoted as $r$.

The angle formed by the vector $(Re(z), Im(z))$ with the real axis in the
complex plane is referred to as the *argument*, or *phase*, of $z$:

$ arg(z) = arctan (frac(Im(z), Re(z))) $

When there is no ambiguity on which complex number is being referred to,
the argument of a complex number is denoted as $phi$.

Note that $phi = arctan (Im(z) slash Re(z))$ also implies that $phi +
2 k pi = arctan (Im(z) slash Re(z))$ for any $k in ZZ$. Therefore, it
is generally assumed that the angle $phi$ is restricted to the interval
$(-pi, pi]$.

#figure(
	caption: [The argument and magnitude of a complex number.],
	diagram(
		edge-stroke: 0.75pt,
		spacing: 3em,

		edge((-1, 0), (5.5, 0), marks: (none, "stealth"), label-pos: 0.9, label-angle: auto, label: "Real axis"),
		edge((0, 1), (0, -3), marks: (none, "stealth"), label-pos: 0.66, label-angle: auto, label: "Imaginary axis"),
		edge((0, 0), (4, -2), marks: (none, "stealth"), label-pos: 0.5, label-angle: auto, stroke: 1pt + blue, $abs(z) = r$),
        node((4, -2), $(Re(z), Im(z))$),
        edge((1, 0), (0.85, -0.4), bend: -30deg, label-pos: 0.53, stroke: blue, $arg(z) = phi$)
	)
)

As it is the case for any vector, a complex number can be identified using
polar coordinates, from its angle (phase) and its norm (magnitude). Given
a complex number $z$ with modulus $r = abs(z)$ and argument $phi = arg(z)$,
the *polar form* of $z$ is:

$ z = r (cos(phi) + i sin(phi)) $

Converting a complex number from its polar form to its rectangular
form is simple, since this just requires to explicitly solve the
sine and cosine. Converting a complex number from its rectangular
form to its polar form is slightly more tedious, since it requires
to compute its modulus and its argument.

By trigonometry, the standard coordinates of a complex number $r(cos(phi)
+ i sin(phi))$ in the complex plane are $(r cos(phi), r sin(phi))$. In polar
coordinates the notation $r angle phi$ can be used.

#exercise[
    What is the complex number $z = display(-frac(3 sqrt(3), 2)) +
    i display(frac(3, 2))$ in polar form?
]
#solution[
    The magnitude of $z$ is:

    $ abs(z) =
      sqrt(Re(z)^(2) + Im(z)^(2)) =
      sqrt((frac(-3 sqrt(3), 2))^(2) + (frac(3, 2))^(2)) =
      sqrt(frac(27, 4) + frac(9, 4)) =
      sqrt(frac(36, 4)) =
      3 $

    As for its argument:

    $ arg(z) =
      arctan (frac(Im(z), Re(z))) =
      arctan (frac(cancel(display(frac(3, 2))), -sqrt(3) cancel(display(frac(3, 2))))) =
      arctan (-frac(sqrt(3), 3)) =
      frac(5, 6) pi $

    The complex number $z$ in polar form is then
    $z = 3(cos(5 pi slash 6) + i sin(5 pi slash 6))$.

    #figure(
        caption: [The complex number $z$ depicted in the complex plane using polar
                  coordinates.],
        diagram(
            edge-stroke: 0.75pt,
            spacing: 3em,

            edge((-2.5, 0), (1.5, 0), marks: (none, "stealth"), label-pos: 1, label: $x$),
            edge((0, 1), (0, -2), marks: (none, "stealth"), label-pos: 1, label: $y$),
            edge((0, 0), (-2, -1), marks: (none, "stealth"), label-pos: 0.5, label-angle: auto, stroke: 1pt + blue, $3$),
            edge((0.5, 0), (-0.5, -0.2), bend: -30deg, label-pos: 0.3, stroke: blue, $frac(5 pi, 6)$),
            node((-2, -1), $3 angle frac(5 pi, 6)$),
            edge((-2, -0.8), (0, -0.8), dash: "dashed", stroke: blue, $frac(3 sqrt(3), 2)$),
            edge((-1.625, -0.8), (-1.625, 0), dash: "dashed", stroke: blue, $frac(3, 2)$),
        )
    )
]

Adding or subtracting two complex numbers in polar form requires
an intermediate conversion in rectangular form. On the other hand,
multiplying and dividing complex numbers in polar form is much easier,
because it only requires to multiply/divide the moduli and add/subtract
the angles:

$ z_(1) z_(2) &=
  (r_(1) (cos(phi_(1)) + i sin(phi_(1)))) (r_(2) (cos(phi_(2)) + i sin(phi_(2)))) = \
  &= r_(1) r_(2) (cos(phi_(1)) cos(phi_(2)) + i cos(phi_(1)) sin(phi_(2)) + i sin(phi_(1)) cos(phi_(2)) - sin(phi_(1)) sin(phi_(2))) = \
  &= r_(1) r_(2) (cos(phi_(1) + phi_(2)) + i sin(phi_(1) + phi_(2))) \
  frac(z_(1), z_(2)) &=
  frac(r_(1) (cos(phi_(1)) + i sin(phi_(1))), r_(2) (cos(phi_(2)) + i sin(phi_(2)))) =
  frac(r_(1), r_(2)) frac((cos(phi_(1)) + i sin(phi_(1)))(cos(phi_(2)) - i sin(phi_(2))), (cos(phi_(2)) + i sin(phi_(2)))(cos(phi_(2)) - i sin(phi_(2)))) = \  
  &= frac(r_(1), r_(2)) frac((cos(phi_(1)) + i sin(phi_(1)))(cos(phi_(2)) - i sin(phi_(2))), cos^(2)(phi_(2)) - i^(2) sin^(2)(phi_(2))) = \  
  &= frac(r_(1), r_(2)) frac(cos(phi_(1)) cos(phi_(2)) - i cos(phi_(1)) sin(phi_(2)) + i sin(phi_(1)) cos(phi_(2)) + sin(phi_(1)) sin(phi_(2)), cos^(2)(phi_(2)) + sin^(2)(phi_(2))) = \  
  &= frac(r_(1), r_(2)) (cos(phi_(1) - phi_(2)) + i sin(phi_(1) - phi_(2))) = \  
  z^(*) &=
  (r (cos(phi) + i sin(phi)))^(*) =
  r^(*) (cos(phi) + i sin(phi))^(*) =
  r (cos(phi) - i sin(phi)) $

A third way to express a complex number is as a complex power of $e$.
Given a complex number $z$ with modulus $r$ and argument $phi$, the
*exponential form* of $z$ is:

$ z = r e^(i phi) $

Where the complex exponential $e^(i phi)$ is also referred to as the *phase
factor*. The formula that allows one to move between the exponential form
and the polar form:

$ r e^(i phi) = r (cos(phi) + i sin(phi)) $

Is known as the *Euler's formula*.

#exercise[
    What is the complex number $z = 2 e^(i frac(pi, 3))$ in polar form?
    And in rectangular form?
]
#solution[
    Since $r = 3$ and $phi = pi slash 3$, the polar form of $z$ is:

    $ z = 2 (cos(frac(pi, 3)) + i sin(frac(pi, 3))) $

    The rectangular form of $z$ is given by explicitly solving:

    $ z =
      2 (cos(frac(pi, 3)) + i sin(frac(pi, 3))) =
      cancel(2) (frac(1, cancel(2)) + i frac(sqrt(3), cancel(2))) =
      1 + i sqrt(3) $
]

As it was the case for the polar form, adding or subtracting complex
numbers in exponential form is tedious while multiplying or dividing
them is trivial:

$ z_(1) z_(2) &=
  (r_(1) e^(i phi_(1))) (r_(2) e^(i phi_(2))) =
  r_(1) r_(2) e^(i phi_(1)) e^(i phi_(2)) =
  r_(1) r_(2) e^(i (phi_(1) + phi_(2))) \
  frac(z_(1), z_(2)) &=
  frac(r_(1) e^(i phi_(1)), r_(2) e^(i phi_(2))) =
  frac(r_(1), r_(2)) frac(e^(i phi_(1)), e^(i phi_(2))) =
  frac(r_(1), r_(2)) e^(i (phi_(1) - phi_(2))) \
  z^(*) &=
  (r e^(i phi))^(*) =
  r^(*) (e^(i phi))^(*) =
  r e^(-i phi) $

Raising a complex number to the $n$-th power is no different than
raising a real number to the $n$-th power. Computing the $n$-th power
of a complex number in algebraic form requires lots of calculations.
Knowing *De Moivre's Formula*:

$ (cos(theta) + i sin(theta))^(n) = cos(n theta) + i sin(n theta) $

It becomes much easier to compute the $n$-th power of a complex number,
if such number is in polar form:

$ z^(n) =
  (r (cos(phi) + i sin(phi)))^(n) =
  r^(n) (cos(phi) + i sin(phi))^(n) =
  r^(n) (cos(n phi) + i sin(n phi)) $

If the number is in exponential form, it is just as trivial:

$ z^(n) =
  (r e^(i phi))^(n) =
  r^(n) (e^(i phi))^(n) =
  r^(n) e^(i (n phi)) $

One notable feature of complex numbers is that the $n$-th root is a
*multivalued function*, meaning that it returns more than one value.
In particular, extracting the $n$-th root out of a complex number
results in $n$ distinct complex numbers.

Given the complex number $z^(n) = 1$, the $n$ results of the expression
$root(n, z^(n))$, also known as the *n-th roots of unity*, are given by:

$ root(n, 1) = e^(i (2 pi l slash n)) space "with" space l in {0, 1, dots, n - 1} $

Consider the more general case of $z^(n) = c$, with $c$ complex
constant $c = abs(c) e ^(i theta)$. If $e^(i (2 pi l slash n))$
with $l in {0, 1, dots, n - 1}$ is the result of $root(n, 1)$,
then:

$ z^(n) = r^(n) e^(i (n phi)) = abs(c) e ^(i theta) e^(i (2 pi l)) $

The magnitude and the proper complex ought to be equated separately.
The expression $r^(n) = abs(c)$ gives $r = root(n, abs(c))$. As for
the second expression:

$ e^(i (n phi)) = e^(i theta) e^(i (2 pi l)) =>
  e^(i (n phi)) = e^(i (theta + 2 pi l)) =>
  i (n phi) = i (theta + 2 pi l) =>
  phi = frac(theta, n) + frac(2 pi l, n) $

With $l in {0, 1, dots, n - 1}$. Thus the $n$ roots all have the same
magnitude, but their angles are equally spaced with a difference of
$2 pi slash n$ between each adjacent pair.

#exercise[
    What is the result of $root(3, 2 - 2 i sqrt(3))$?
]
#solution[
    The complex number in exponential form is $2 e^(-i frac(pi, 3))$.
    The magnitude of the resulting number is $root(3, 2)$. As for the
    angles:

    $ phi_(1) &=
      frac(display(-frac(pi, 3)), 3) + frac(2 pi dot 0, 3) =
      -frac(pi, 9) \
      phi_(2) &= 
      frac(display(-frac(pi, 3)), 3) + frac(2 pi dot 1, 3) =
      -frac(pi, 9) + frac(2 pi, 3) =
      frac(5 pi, 9) \
      phi_(3) &= 
      frac(display(-frac(pi, 3)), 3) + frac(2 pi dot 2, 3) =
      -frac(pi, 9) + frac(4 pi, 3) =
      frac(11 pi, 9) =
      -frac(7 pi, 9) $

    Hence the $3$ solutions are:

    #grid(
        columns: (0.33fr, 0.33fr, 0.33fr),
        [$ z_(1) = root(3, 2) e^(-i frac(pi, 9)) $],
        [$ z_(2) = root(3, 2) e^(i frac(5 pi, 9)) $],
        [$ z_(3) = root(3, 2) e^(-i frac(7 pi, 9)) $]
    )

    #figure(
        caption: [The three roots on the complex plane. Notice the fact that
                  they are equally spaced.],
        diagram(
            edge-stroke: 0.75pt,
            spacing: 3em,

            edge((-2, 0), (2, 0), marks: (none, "stealth"), label-pos: 1, label: $x$),
            edge((0, 2), (0, -2), marks: (none, "stealth"), label-pos: 1, label: $y$),
            edge((0, 0), (1.18, 0.43), marks: (none, "stealth"), label-pos: 1.1, stroke: 1pt + blue, $z_(1)$),
            edge((0, 0), (-0.21, -1.24), marks: (none, "stealth"), label-pos: 0.9, stroke: 1pt + blue, $z_(2)$),
            edge((0, 0), (-0.96, 0.80), marks: (none, "stealth"), label-pos: 1, stroke: 1pt + blue, $z_(3)$),
        )
    )
]

The fourth way to express a complex number is the *matrix form*. Given a 
complex number $z = a + i b$, it can be written as a $2 times 2$ matrix
as follows:

$ a + i b = mat(a, -b; b, a) $

It is also possible to transition immediately from the exponential form to
the matrix form:

$ r e^(i phi) = r mat(cos(theta), -sin(theta); sin(theta), cos(theta)) =
  r cos(theta) mat(1, 0; 0, 1) + r sin(theta) mat(0, -1; 1, 0) $

Which also means that the real unit and the imaginary unit are simply:

#grid(
  columns: (0.5fr, 0.5fr),
  [$ 1 = mat(1, 0; 0, 1) $],
  [$ i = mat(0, -1; 1, 0) $]
)

The matrix form hints at the geometric meaning of the product between
complex numbers: any complex number in matrix form is a rotation matrix.
This is no coincidence, since multiplying any number by a complex number
corresponds to a rotation in the complex plane.

The complex conjugate of a complex number in matrix form is simply its
matrix transpose. For example, to show that $z z^(*) = a^(2) + b^(2)$:

$ z z^(*) &=
  mat(a, -b; b, a) mat(a, -b; b, a)^(T) =
  mat(a, -b; b, a) mat(a, b; -b, a) =
  mat(a a + (-b)(-b), a b + (-b)a; b a + a (-b), b b + a a) = \
  &= mat(a^(2) + b^(2), cancel(a b) - cancel(a b);
      cancel(a b) - cancel(a b), a^(2) + b^(2)) =
  mat(a^(2) + b^(2), 0; 0, a^(2) + b^(2))
  = (a^(2) + b^(2)) mat(1, 0; 0, 1)
  = a^(2) + b^(2) $

The inverse of a matrix representing a complex number is the reciprocal of
the number itself. Given a complex number $z = mat(a, -b; b, a)$:

$ mat(a, -b; b, a)^(-1) = frac(1, a^(2) + b^(2)) mat(a, b; -b, a) = 
  frac(cancel(z^(*)), z cancel(z^(*))) = frac(1, z) $
