#import "../AI_definitions.typ": *

The idea behind *clustering* is to partition a set of data points into
subgroups, or *clusters*, whose members share similar characteristics.
The simplest (and probably earliest) clustering algorithm is *K-means*,
that operates on numerical data. The algorithm partitions the given
dataset into $k$ clusters, $k$ being a parameter chosen beforehand.
The algorithm is as follows:

+ Fix the number of clusters $k$;
+ Choose $k$ random points in the dataset (called *seeds*),
  as representatives of the initial clusters. These representatives,
  that act like a "center of gravity" of their respective cluster,
  are called *centroids*;
+ Compute the *distance* between each element of the dataset and each
  centroid. Each element is assigned to the cluster whose centroid
  is the closest;
+ The centroids of each cluster are computed as the arithmetic mean
  between all elements of the cluster;
+ If a termination criteria is met, stop. Otherwise, go back to $3$.

The distance between two datapoints is computed with the help of a
*distance function*. A distance function is any function $d: RR^(n)
times RR^(n) mapsto RR^(+)$ that possesses the following properties:

+ For any $bold(x), bold(y) in RR^(n)$,
  $d(bold(x), bold(y)) = 0$ implies $bold(x) = bold(y)$;
+ For any $bold(x), bold(y) in RR^(n)$,
  $d(bold(x), bold(y)) = d(bold(y), bold(x))$ (*symmetry*);
+ For any $bold(x), bold(y), bold(z) in RR^(n)$,
  $d(bold(x), bold(y)) + d(bold(y), bold(z)) lt.eq
  d(bold(x), bold(z))$ (*triangle inequality*);

One notable family of distance functions is *Minkowski family*, defined as:

$ d_(k)(bold(x), bold(y)) = (sum_(i = 1)^(n)(x_(i) - y_(i))^(k))^(frac(1, k)) $

In particular:

- With $k = 1$, one has the *Manhattan distance*, or *city block distance*;
- With $k = 2$, one has the *Euclidean distance*;
- With $k -> infinity$, one has the *maximum distance*,
  that is $d_(infinity)(bold(x), bold(y)) = max_(i = 1)^(n) abs(x_(i) - y_(i))$

The algorithm does not specify a termination criteria. One option is
to fix a maximum number of iterations; once this number is reached,
the algorithm stops. A slightly more refined option is fix a small
value $epsilon$ and inspect how much the new centroids differ from
the previous ones: if all of them have a difference smaller than
$epsilon$, the algorithm stops. These two criteria are not mutually
exclusive, and can be employed at the same time.

The main selling point of K-means is that it's fast. The time bound for
its execution is $O(t k n)$, with $t$ being the number of iterations,
$n$ the size of the dataset and $k$ the number of clusters. Since $k$
is fixed and $t$ is either capped at a maximum or just nowhere close
to $n$, the execution time is almost linear.

However, K-means is not free from issues. Namely, it can only operate
on data points that are real numbers, because distance functions are
defined only on reals. Moreover, the number of clusters $k$ is not a
byproduct of the algorithm itself, but has to be fixed beforehand. For
any (integer) choice of $k$ the algorithm will work, but a poor choice
of $k$ might fail to capture an actual cluster structure of the dataset.
Also, K-means is very sensitive to the choice of the initial seeds: two
different choice of seeds for the same dataset can give completely different
outcomes (K-means is said to be an *unstable algorithm*). Finally, K-means
relies on the tacit assumption that the similarity between elements should
be defined in terms of their reciprocal distance, but this isn't necessarely
the case.

Despite its shortcomings, K-means (and its variants) remains one of the
most widely employed clustering algorithms, due to its simplicity and
efficiency. It can be used as a kind of "exploratory analysis" to get a
big picture view of the cluster structure of the data, before employing
algorithms that are more refined. It should be noted that there is no
one-size fits-all clustering algorithm, therefore there are situations
where K-means might actually turn out to be the best choice.
