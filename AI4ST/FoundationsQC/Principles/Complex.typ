#import "../FoundationsQC_definitions.typ": *

In mathematics, a *complex number* is an element of a number system that
extends the real numbers with a specific element denoted $i$, called the
*imaginary unit* and satisfying the equation $i^(2) = - 1$. The set of
complex numbers is denoted by the symbol $CC$.

Every complex number $z$ can be expressed in the form $a + b i$, where
$a$ and $b$ are real numbers and are referred to as its *real part* and
its *imaginary part*, respectively. The real part of a complex number
$z$ is denoted $Re(z)$, the imaginary part $Im(z)$. A complex number
with imaginary part equal to $0$ is simply a real number; a complex
number with real part equal to $0$ is said to be a *purely imaginary*
number.

Addition, subtraction and multiplication of complex numbers can be
naturally defined by using the rule $i^(2) = −1$ along with the
associative, commutative, and distributive laws.

A complex number $z$ can be identified with the ordered pair of real
numbers $(Re(z), Im(z))$, which may be interpreted as coordinates of
a point in a Euclidean plane with standard coordinates, which is then
called the *complex plane* or *Argand diagram*. The horizontal axis is
generally used to display the real part, with increasing values to the
right, and the imaginary part marks the vertical axis, with increasing
values upwards.

Given a complex number $z = a + i b$, the *complex conjugate* of $z$ is
the number $z^(*) = a - i b$, obtained by changing the sign of the imaginary
part of $z$. Geometrically, $z$ is the "reflection" of $z$ about the real
axis. It is trivial to see that, for any complex number $z$, $(z^(*))^(*)
= z$. A complex number is real if and only if it equals its own conjugate.

The square root of the product between a complex number $z$ and its
complex conjugate $z^(*)$ is a non negative real number called *modulus*
or *magnitude*:

$ abs(z) =
  sqrt(z dot z^(*)) =
  sqrt((Re(z) + i Im(z))(Re(z) - i Im(z))) =
  sqrt(Re(z)^(2) + Im(z)^(2)) $

By Pythagoras' theorem, $abs(z)$ is the distance from the origin to
the point representing the complex number $z$ in the complex plane.

The *argument* of $z$ (sometimes called the "phase" $phi$), denoted as
$arg(z)$, is the angle formed by the vector $(Re(z), Im(z))$ with the
positive real axis in the complex plane:

$ arg(z) = tan^(-1) (frac(Im(z), Re(z))) $

Note that any rotation of $2 k pi$ with $k in ZZ$ is equivalent to
performing no rotation at all, therefore the argument is often required
to be specified in the interval $(-pi, pi]$.

A complex number $z = a + i b$ is said to be written in *rectangular form*.
Another way to express a complex number is the *polar form*; given a complex
number $z$ with modulus $r = abs(z)$ and argument $phi = arg(z)$, the polar
form of $z$ is:

$ z = r(cos(phi) + i sin(phi)) $

A third way to express complex numbers is the *exponential form*:

$ z = r e^(i phi) $

Where the complex exponential $e^(i phi)$ is also referred to as the *phase
factor*.

The *conjugate transpose* of a matrix $A$, denoted as $A^(dagger)$, is the
matrix obtained from transposing $A$ and then applying complex conjugation
to each element of the resulting matrix:

$ A^(dagger) = A^(T^(*)) =
  mat(a_(1, 1), a_(1, 2), dots, a_(1, n);
      a_(2, 1), a_(2, 2), dots, a_(2, n);
      dots.v, dots.v, dots.down, dots.v;
      a_(m, 1), a_(m, 2), dots, a_(m, n))^(T^(*)) =
  mat(a_(1, 1)^(*), a_(2, 1)^(*), dots, a_(m, 1)^(*);
      a_(1, 2)^(*), a_(2, 2)^(*), dots, a_(m, 2)^(*);
      dots.v, dots.v, dots.down, dots.v;
      a_(1, n)^(*), a_(2, n)^(*), dots, a_(m, n)^(*)) $

#exercise[
  What is the conjugate transpose of the following matrix?

  $ A = mat(1, -2 - i, 5;
            1 + i, i, 4 - 2i) $
]
#solution[

  $ A^(dagger) =
    mat(1, -2 - i, 5;
        1 + i, i, 4 - 2i)^(dagger) =
    mat(1, 1 + i;
        -2 - i, i;
        5, 4 - 2i)^(*) =
    mat(1, 1 - i;
        -2 + i, -i;
        5, 4 + 2i) $
]

A square matrix $A$ is said to be *Hermitian* if $A^(dagger) = A$. It is
said to be *unitary* if $A^(dagger) = A^(-1)$.
