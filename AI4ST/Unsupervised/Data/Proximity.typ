#import "../Unsupervised_definitions.typ": *

Informally, the *similarity* between two data objects is a numerical
measure of the degree to which the two data objects are alike. Consequently,
the similarity of two data objects that are more alike will be higher,
whereas the similarity of two data objects that are less alike will be
lower. Similarities often fall in the interval $[0, 1]$, where $0$ means
no similarity and $1$ means complete similarity.

The *dissimilarity* between two objects is a numerical measure of the
degree to which the two objects are different. Dissimilarity of two
data objects that are more different will be higher, whereas the similarity
of two data objects that are less different will be lower. Dissimilarities
are generally bounded by $0$ on the left, whereas the right boundary varies
(common choices are $1$ and $+infinity$). Similarity and dissimilarity are
together referred to as *proximity*.

Proximity measures can be converted into one another (that is, a similarity
into a dissimilarity or vice versa), or can be normalized so that they fall
into a chosen range. This is useful, for example, when a certain algorithm
can only work with specific proximity measures.

Suppose that there is interest in normalizing a proximity measure $d$,
defined on the interval $["min"_(d), "max"_(d)]$, so that it fits in
the interval $[0, 1]$. If $"min"_(d)$ and $"max"_(d)$ are both finite,
a proximity measure $d' in [0, 1]$ can be obtained as:

$ d' = frac(d - "min"_(d), "max"_(d) - "min"_(d)) $

This is an example of a linear transformation, which preserves the relative
distances between points.

Note that mapping proximity measures to a different interval by applying
a linear transformation might entail a loss of meaning. For example, if
$"max"_(d) = +infinity$, the new proximity measure $d'$ will have larger
values "compressed" to $1$, which isn't necessarely the desired outcome.
Even worse, suppose that $d in [-1, 1]$; if the range is mapped to $[0, 1]$
by taking the absolute value, information of the sign is lost, which may
be important for some applications.

Transforming similarities to dissimilarities and vice versa is also
relatively straightforward, although the issue of preserving the meaning
is still present. If a similarity $s$ is mapped to $[0, 1]$, it can be
changed to a dissimilarity $d$ mapped to the same interval as $d = 1 - s$.
Vice versa, a dissimilarity $d in [0, 1]$ can be changed to a similarity
$s in [0, 1]$ as $s = 1 - d$. Another approach is to change a similarity
into a dissimilarity or vice versa by simply changing its sign.

In general, any monotonic decreasing function can be used to convert
dissimilarities to similarities, or vice versa. Of course, other factors
also must be considered when transforming similarities to dissimilarities,
or vice versa, or when transforming the values of a proximity measure to a
new scale. Preservation of meaning, distortion of scale, and requirements
of data analysis tools have been mentioned, but this list is certainly not
exhaustive.

The proximity of objects is typically defined by combining the proximities
of individual attributes. Therefore, the simplest situation to model is the
one where each object is described by a single attribute. The similarity
and dissimilarity of an attribute can be computed by exploiting the
comparison operators that its class provides.

Nominal attributes only support checking whether two are the same or not.
Therefore, the only thing that can be said about two nominal attribute
values is whether they have the same value (maximum similarity, minimum
dissimilarity) or whether their value differs (minimum similarity, maximum
dissimilarity). It is customary to define similarity between two nominal
attribute values as $1$ if they are equal and $0$ if they are not, and
dissimilarities as $1$ if they are different and $0$ if they are not.

#grid(
	columns: (0.5fr, 0.5fr),
	[$ d(x, y) = cases(0 "if" x = y, 1 "if" x != y) $],
	[$ s(x, y) = cases(1 "if" x = y, 0 "if" x != y) $]
)

Ordinal attributes support checking for equality but also support
ordering. Therefore, it is possible to define a notion of "closeness"
by mapping each value to consecutive integers starting from $0$ or
$1$. Dissimilarity $d$ can then be defined as the difference between
the corresponding values, normalized to $[0, 1]$ with respect to the
number of attributes $n$. Similarity $s$ can be defined from dissimilarity
as $s = 1 - d$. Note that this definition entails that the "steps" between
each possible value of the attribute are of equal size, but this isn't
necessarely the case.

#grid(
	columns: (0.5fr, 0.5fr),
	[$ d(x, y) = frac(abs(x - y), n - 1) $],
	[$ s(x, y) = 1 - d(x, y) $]
)

For interval or ratio attributes, the natural measure of dissimilarity
between two objects is the absolute difference of their values. This makes
sense because both attributes support arbitrary scaling. The similarity of
interval or ratio attributes is typically expressed by transforming a
dissimilarity into a similarity, as stated previously, by applying any
monotonic decreasing function.

#grid(
	columns: (0.3fr, 0.7fr),
	[$ d(x, y) = abs(x - y) $],
	[$ s(x, y) = -d(x, y) "or" 1 + frac(1, d(x, y)) "or" e^(d(x, y)) "or"
	   frac(d(x, y) - "min"_(d), "max"_(d) - "min"_(d)) "or" dots $]
)

=== Dissimilarities

The terms "dissimilarity" and "*distance*" are often used interchangeably,
even though the latter is a special case of the former. In particular, a
distance is defined as any function $d: RR times RR -> RR$ that possesses
(at least) the following properties:

- $d(x, y) gt.eq 0$ for all $x, y$ (non negativity);
- $d(x, y) = 0$ if and only if $x = y$;
- $d(x, y) = d(y, x)$ for all $x, y$ (simmetry);
- $d(x, z) lt.eq d(x, y) + d(y, z)$ for all $x, y, z$ (triangular inequality).

Measures that satisfy all three properties are known as *metrics*. Some
sources use the term "distance" only for dissimilarity measures that satisfy
these properties, but that practice is often violated.

Given a distance function $d$ and a data set containing $m$ objects, it
is possible to construct a *distance matrix* as the $m times m$ matrix
$D[i, j]$ where each cell $(i, j)$ contains the distance between the
$i$-th element of the dataset and the $j$-th element:

$ D[i, j] = mat(0, , , , ;
                d(2, 1), 0, , , ;
                d(3, 1), d(3, 2), 0, , ;
                dots.v, dots.v, dots.down, dots.down, ;
                d(m, 1), d(m, 2), dots, dots, 0) $

The matrix has $0$s along the diagonal because of the first property of
distances. It also symmetric, due to the third property of distances,
hence why only half the matrix is depicted.

The most intuitive notion of distance is the *Euclidean distance*, defined as:

$ d(bold(x), bold(y)) = sqrt(sum_(i = 1)^(n) (x_(i) - y_(i))^(2)) $

Where $n$ is the number of dimensions and $x_(i), y_(i)$ are the $i$-th
attribute value of objects $x$ and $y$ respectively.

A somewhat simpler distance is the *Manhattan distance* (also known as
*taxicab distance* or *city block distance*), defined as:

$ d(bold(x), bold(y)) = sum_(i = 1)^(n) abs(x_(i) - y_(i)) $

Related to the Manhattan distance is the *Hamming distance*, given by
the number of elements that are equal between two vectors:

$ d(bold(x), bold(y)) = sum_(i = 1)^(n) delta_(i, j) "where"
  delta_(i, j) = cases(1 "if" x_(i) = y_(i), 0 "otherwise") $

In the case of binary vectors, this is simply equivalent to the `XOR`
between the two.

#exercise[
	Compute three distance matrices of the following dataset, one for
	each distance (Euclidean, Manhattan, Hamming):

	
	#align(
		center,
		table(
			columns: (auto, auto, auto),
			[], [*X*], [*Y*],
			[*E1*], [0], [2],
			[*E2*], [2], [0],
			[*E3*], [3], [1],
			[*E4*], [5], [1]
		)
	)
]
#solution[
	#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		[$ underbracket(mat(0, , , ;
		                    2.83, 0, , ;
		                    3.16, 1.41, 0, ;
		                    5.10, 3.16, 2.00, 0),
		                "Euclidean") $],
		[$ underbracket(mat(0, , , ;
		                    4, 0, , ;
		                    4, 2, 0, ;
		                    6, 4, 2, 0),
		                "Manhattan") $],
		[$ underbracket(mat(0, , , ;
		                    2, 0, , ;
		                    2, 2, 0, ;
		                    2, 2, 1, 0),
		                "Hamming") $]
	)
]

Both the Manhattan and the Euclidean distance are generalized by
the *Minkowski distance*:

$ d(bold(x), bold(y)) = root(R, sum_(i = 1)^(n) (abs(x_(i) - y_(i)))^(R)) $

Where the parameter $R$ influences the nature of the result. In
particular:

- When $R = 1$, the Minkowski distance reduces to the Manhattan distance
  (for this reason, also called *L1 norm*);
- When $R = 2$, the Minkowski distance reduce to the Euclidean distance
  (for this reason, also called *L2 norm*);
- When $R -> +infinity$, the resulting distance is called the *supremum
  distance*, also known as the *L#sub[#math.infinity] norm* or the
  *L#sub[max] norm*. This is given by the maximum difference between
  any attribute of the objects:

  $ d(bold(x), bold(y)) = lim_(R -> +infinity)
    root(R, sum_(i = 1)^(n) (abs(x_(i) - y_(i)))^(R)) =
    limits("arg max")_(i) (x_(i) - y_(i)) $

Note that the Minkowski distance (and, by extension, all the distances from
its family) are not invariant with respect to _scaling_ and to _shifting_.
That is, if $bold(x)$, $bold(y)$ or both are modified by multiplying its
value by a costant and/or by adding a constant the new objects do not have
the same value of the Minkwoski distance as they had before.

It should also be noted that the Minkowski distance and its derivatives
treat each attribute equally relevant in the computation of the distance.
Sometimes, there are situations where one attribute should have more
influence on the final result than others. The problem can be solved by
introducing, for each $i$-th attribute, a weight $w_(i)$ in the computation
of the Minkowski distance:

$ d(bold(x), bold(y)) = root(R, sum_(i = 1)^(n) w_(i) (abs(x_(i) - y_(i)))^(R)) $

/*
An important issue with distance measures is how to handle the situation
when attributes do not have the same range of values. (This situation is often
described by saying that “the variables have different scales.”) In a previous
example, Euclidean distance was used to measure the distance between
people based on two attributes: age and income. Unless these two attributes
are standardized, the distance between two people will be dominated by
income.
A related issue is how to compute distance when there is correlation between
some of the attributes, perhaps in addition to differences in the ranges of
values. A generalization of Euclidean distance, the Mahalanobis distance, is
useful when attributes are correlated, have different ranges of values (different
variances), and the distribution of the data is approximately Gaussian
(normal). Correlated variables have a large impact on standard distance
measures since a change in any of the correlated variables is reflected in a
change in all the correlated variables. Specifically, the Mahalanobis distance
between two objects (vectors) x and y is defined as
where 
 is the inverse of the covariance matrix of the data. Note that the
covariance matrix  is the matrix whose 
 entry is the covariance of the 
and 
 attributes as defined by Equation 2.11
.

The Mahalanobis distance uses a completely different approach

$ d(overline(x), overline(y)) =
  sqrt((overline(x) - overline(y))^(T) Sigma^(-1) (overline(x) - overline(y))) $

Where $Sigma^(-1)$ is the inverse of the covariance distance

This distance is a notion of spacial distance combined with a notion of
direction along which the data is spread.

#exercise[]
#solution[]
*/

=== Similarities

For similarities, the triangle inequality (or the analogous property)
typically does not hold, but symmetry and positivity do. To be explicit,
if $s(x, y)$ is the similarity between objects $x$ and $y$, then the
typical properties of similarities are:

- $0 lt.eq s(x, y) lt.eq 1 $ for all $x, y$;
- $s(x, y) = 1$ if and only if $x = y$;
- $s(x, y) = s(y, x)$ for all $x, y$ (simmetry);

There is no general analog of the triangle inequality for similarity
measures. It is sometimes possible, however, to show that a similarity
measure can easily be converted to a metric distance. Also, for specific
similarity measures, it is possible to derive mathematical bounds on the
similarity between two objects that are similar in spirit to the triangle
inequality.

Similarity measures between objects that contain only binary attributes
are called *similarity coefficients*, and typically have values between
$0$ and $1$. A value of $1$ indicates that the two objects are completely
similar, while a value of $0$ indicates that the objects are not at all
similar. There are many rationales for why one coefficient is better than
another in specific instances.

Let $bold(x)$ and $bold(y)$ be two objects that consist of $n$ binary
attributes. It is possible to define four frequencies as follows:

#grid(
	columns: (0.5fr, 0.5fr),
	[$f_(00) =$ number of attributes where $x$ is $0$ and $y$ is $0$ \
	 $f_(10) =$ number of attributes where $x$ is $1$ and $y$ is $0$],
	[$f_(01) =$ number of attributes where $x$ is $0$ and $y$ is $1$ \
	 $f_(11) =$ number of attributes where $x$ is $1$ and $y$ is $1$],
)

An example of similarity coefficient is *simple matching coefficient*
(*SMC*), defined as:

$ "SMC" = frac("number of matching attribute values",
  "number of attributes") = frac(f_(11) + f_(00),
  f_(01) + f_(10) + f_(11) + f_(00)) $

Another similarity coefficient is the *Jaccard coefficient* (*J*),
defined as:

$ "J" = frac("number of non-zero matching attribute values",
  "number of non-zero attributes") = frac(f_(11),
  f_(01) + f_(10) + f_(11)) $

The difference between the two coefficients is the way that they handle
$0$-valued attributes. The simple matching coefficient treats both $0$
and $1$ values equally, and therefore is a reasonable choice when both
values are of interest. On the other hand, the Jaccard coeffcient only
takes into account $1$-valued attributes, and is therefore useful for
asymmetric attributes where $0$ values are irrelevant.

#exercise[
	Compute both the simple matching coefficient and the Jaccard
	coefficient for the following binary vectors:

	#grid(
		columns: (0.5fr, 0.5fr),
		$ x = (1, 0, 0, 0, 0, 0, 0, 0, 0) $,
		$ y = (0, 0, 0, 0, 0, 0, 0, 0, 1) $
	)
]
#solution[
	Note that:

	#grid(
		columns: (0.25fr, 0.25fr, 0.25fr, 0.25fr),
		[$ f_(00) = 7 $],
		[$ f_(01) = 2 $],
		[$ f_(10) = 1 $],
		[$ f_(11) = 0 $]
	)

	Therefore:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ "SMC" = frac(0 + 7, 2 + 1 + 0 + 7) = 0.7 $],
		[$ "J" = frac(0, 2 + 1 + 0) = 0 $]
	)
]

Document-term matrices tend to be very sparse, since it's much more
likely for two documents to not share words than for them to be sharing
words. Therefore, data such as these need a similarity coefficient that
does not take into account $0$-valued attributes, because otherwise the
results would be very spurious, but that also works for attributes that
aren't binary-valued.

A similarity coefficient having both of these characteristics is the
*cosine similarity*. Given two document vectors $bold(x)$ and $bold(y)$,
the cosine similarity between the two is given by:

$ cos(bold(x), bold(y)) = frac(angle.l bold(x)\, bold(y) angle.r,
  abs(abs(bold(x))) space abs(abs(bold(y)))) $

Where $angle.l angle.r$ denotes the scalar product and $abs(abs(space))$
denotes the norm. The cosine similarity is invariant with respect to
scaling, but not with respect to shifting.

The name "cosine" comes from the fact that the cosine similarity between
two document vectors is simply the cosine of the angle formed by the two
vectors if represented in an hyper-plane. If the cosine similarity of two
document vectors is $1$, the two are parallel, and therefore share every
word, whereas if its $0$ the two are perpendicular and therefore share no
word.

#exercise[
	Compute the cosine similarity of these two document vectors:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ bold(x) = (3, 2, 0, 5, 0, 0, 0, 2, 0, 0) $],
		[$ bold(y) = (6, 4, 0, 10, 0, 0, 0, 4, 0, 0) $]
	)
]
#solution[
	$ cos(bold(x), bold(y)) =
	  frac(angle.l (3, 2, 0, 5, 0, 0, 0, 2, 0, 0)\,
	               (6, 4, 0, 10, 0, 0, 0, 4, 0, 0) angle.r,
	  abs(abs((3, 2, 0, 5, 0, 0, 0, 2, 0, 0))) space
	  abs(abs((6, 4, 0, 10, 0, 0, 0, 4, 0, 0)))) =
	  frac(84, 84) = 1 $

	This means that the two share every word. This can also be hinted
	at by the fact that the second vector is just two times the first.
]

*Correlation* is frequently used to measure the linear relationship
between two sets of values that are observed together. Even though
correlation is generally computed with respect to datasets, it's
still reasonable to compute it with respect to two objects, treating
each attribute as the value of a population. The term "correlation"
is sometimes used to mean the relationship between two sets of values
that are observed together, even though correlation is one of the
possible measures of the latter.

The most common measure of correlation is the *Pearson correlation
coefficient*, defined as:

$ rho = "Corr"(bold(x), bold(y)) =
  frac("Cov"(bold(x), bold(y)), "SD"(bold(x)) "SD"(bold(y))) =
  frac(S_(bold(x) bold(y)), S_(bold(x)) S_(bold(y))) $

Where $bold(x)$ and $bold(y)$ are two $n$-dimensional vectors,
$"Cov"(bold(x), bold(y))$ is the covariance between the two and
$"SD"(bold(x))$ and $"SD"(bold(y))$ are the respective variances.
These quantities can be explicited as:

#grid(
	columns: (0.33fr, 0.33fr, 0.33fr),
	[$ S_(bold(x) bold(y)) = frac(1, n - 1) sum_(i = 1)^(n) (x_(i) - overline(x))(y_(i) - overline(y)) $],
	[$ S_(bold(x)) = frac(1, n - 1) sum_(i = 1)^(n) (x_(i) - overline(x))^(2) $],
	[$ S_(bold(y)) = frac(1, n - 1) sum_(i = 1)^(n) (y_(i) - overline(y))^(2) $]
)

The value of the coefficient is always in the interval $[-1, 1]$. The
closer the value is to $plus.minus 1$, the better the data is approximately
linearly distributed. If the value of the coefficient is close to $0$, the
worse the distribution of the data can be approximated by a linear function.

Note that, if $rho approx 0$, it does not necessarely mean that the two have
no correlation; they might, but it's not linearly distributed. A graphical
inspection can be obtained through a scatterplot. Is should also be stressed
that correlation does not imply causation.

An interesting property of the Pearson coefficient is that it is invariant
both with respect to scaling and with respect to shifting.

#exercise[
	Compute the Pearson correlation coefficient between these two vectors:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ bold(x) = (1, 2, 4, 3, 0, 0, 0) $],
		[$ bold(y) = (1, 2, 3, 4, 0, 0, 0) $]
	)
]
#solution[
	First of all, note that:

	$ overline(x) = overline(y) =
	  frac(1 + 2 + 3 + 4 + 0 + 0 + 0, 7) approx 1.43 $

	Then:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ S_(bold(x) bold(y)) = frac(sum_(i = 1)^(7) (x_(i) - 1.43)(y_(i) - 1.43), 6) approx 2.45 $],
		[$ S_(bold(x)) = S_(bold(y)) = frac(sum_(i = 1)^(7) (y_(i) - 1.43)^(2), 6) approx 1.62 $]
	)

	Which gives:

	$ rho = frac(S_(bold(x) bold(y)), S_(bold(x)) S_(bold(y))) =
	  frac(2.45, 1.62 dot 1.62) approx 0.93 $
]

When a linear relationship fails to describe similarity between two
objects, an alternative is provided by information theory in the form
of *mutual information*. Let $X$ be a discrete random variable, whose
possible values are $\{x_(1), dots, x_(n)\}$. The *entropy* of $X$ is
defined as:

$ H(X) = - sum_(i = 1)^(n) P(X = x_(i)) log_(2) P(X = x_(i)) $

Where $P(X = x_(i))$ denotes the probability that the random variable
$X$ takes the value $x_(i)$.

Information relates to possible outcomes of an event. The information of an
outcome is inversely proportional to its certainty: if an event is certain,
it has zero information. Entropy denotes the amount of uncertainty is given
by a random variable; when the entropy is $0$, there's absolute certainty.

Entropy can be extended to data sets by computing it on the possible
attribute values of its data objects. Consider two sets of values, $X$
and $Y$, which occur in pairs $(X, Y)$. Assume that $X$ and $Y$ are
discrete, that is, $X$ can take $m$ distinct values $\{x_(1), x_(2),
dots, x_(m)\}$ and $Y$ can take $n$ distinct values $\{y_(1), y_(2),
dots, y_(n)\}$. The *joint entropy* of $X$ and $Y$ is given by:

$ H(X, Y) = - sum_(i = 1)^(n) P(X = x_(i) and Y = y_(i))
  log_(2) P(X = x_(i) and Y = y_(i)) $

*Mutual information* is used to measure the similarity between two sets
of paired values. It's a measure of how much information one set of
values provides about the other. If two sets of values are independent
the mutual information is 0, because one does not tell anything about
the other.

$ I(X, Y) = H(X) + H(Y) - H(X, Y) $

/*
#exercise[
	Compute the mutual information with respect to these datasets
]
#solution[]
*/

The previous definitions of similarity were presented under the assumption
that all attributes were of the same types; in a more realistic scenario,
this isn't the case. It is possible to circumvent the problem by computing
the similarity between each attribute separately, using measures appropriate
for their respective type, and then combining them together.

The most intuitive approach in this direction consists in computing the
average of the similarities between each attribute. Unfortunately, this
approach does not work well if some of the attributes are asymmetric.
The easiest way to fix this problem is to omit asymmetric attributes
from the similarity calculation when their values are 0 for both of the
objects whose similarity is being computed. A similar approach also works
well for handling missing values.

Let $bold(x)$ and $bold(y)$ two objects, whose attributes have different
types. The aforementioned approach to computing the similarity between the
two is summarized in the following algorithm (a similar approach could be
taken for dissimilarities):

+ For the $i$-th attribute, compute the similarity $s_(i)(bold(x), bold(y))$,
  normalized to $[0, 1]$;
+ Define an indicator variable $delta_(i)$ for the $i$-th attribute, whose
  value is:

  - 0 if the $i$-th attribute is an asymmetric attribute and both objects
    have a value of $0$, or if the value of the attribute of one of the
    object is missing;
  - 1 otherwise.
+ Compute the overall similarity as:

  $ s(bold(x), bold(y)) =
    frac(sum_(i = 1)^(n) delta_(i) s_(i)(bold(x), bold(y)),
         sum_(i = 1)^(n) delta_(i)) $

Of course, if there's interest in giving different influence to the
attributes on the final result, it is possible to introduce weights:

$ s(bold(x), bold(y)) =
  frac(sum_(i = 1)^(n) w_(i) delta_(i) s_(i)(bold(x), bold(y)),
       sum_(i = 1)^(n) w_(i) delta_(i)) $

/*
A few general observations may be helpful. First, the type of proximity
measure should fit the type of data. For many types of dense, continuous
data, metric distance measures such as Euclidean distance are often used.
Proximity between continuous attributes is most often expressed in terms of
differences, and distance measures provide a well-defined way of combining
these differences into an overall proximity measure. Although attributes can
have different scales and be of differing importance, these issues can often be
dealt with as described earlier, such as normalization and weighting of
attributes.
For sparse data, which often consists of asymmetric attributes, we typically
employ similarity measures that ignore 0–0 matches. Conceptually, this
reflects the fact that, for a pair of complex objects, similarity depends on the
number of characteristics they both share, rather than the number of
characteristics they both lack. The cosine, Jaccard, and extended Jaccard
measures are appropriate for such data.
There are other characteristics of data vectors that often need to be
considered. Invariance to scaling (multiplication) and to translation (addition)
were previously discussed with respect to Euclidean distance and the cosine
and correlation measures. The practical implications of such considerations
are that, for example, cosine is more suitable for sparse document data where
only scaling is important, while correlation works better for time series, where
both scaling and translation are important. Euclidean distance or other types
of Minkowski distance are most appropriate when two data vectors are to
match as closely as possible across all components (features).
In some cases, transformation or normalization of the data is needed to obtain
a proper similarity measure. For instance, time series can have trends or
periodic patterns that significantly impact similarity. Also, a proper computation
of similarity often requires that time lags be taken into account. Finally, two
time series may be similar only over specific periods of time. For example,
there is a strong relationship between temperature and the use of natural gas,
but only during the heating season.
Practical consideration can also be important. Sometimes, one or more
proximity measures are already in use in a particular field, and thus, others
will have answered the question of which proximity measures should be used.
Other times, the software package or clustering algorithm being used can
drastically limit the choices. If efficiency is a concern, then we may want to
choose a proximity measure that has a property, such as the triangle
inequality, that can be used to reduce the number of proximity calculations.
(See Exercise 25
.)
However, if common practice or practical restrictions do not dictate a choice,
then the proper choice of a proximity measure can be a time-consuming task
that requires careful consideration of both domain knowledge and the purpose
for which the measure is being used. A number of different similarity
measures may need to be evaluated to see which ones produce results that
make the most sense.

The correct choice of a proximity depends on the domain of the problem.
Nice properties to have:

simmetry
noise tolerance and outlier tolerance
not related to a specific pattern (linear, exponential, ecc...)
*/
