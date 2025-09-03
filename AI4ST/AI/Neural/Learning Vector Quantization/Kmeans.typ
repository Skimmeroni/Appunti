#import "../../AI_definitions.typ": *

The neural network models presented so far were designed to solve
fixed learning tasks: approximating a function given input-output
pairs of training examples. There are also neural networks designed
to solve free learning tasks, also known as *clustering*. Clustering
consists in dividing a set of data points into subgroups, or *clusters*,
whose members share similar characteristics.

Among the different forms of clustering, *partitional clustering*
attempts to divide the datapoints into partitions, creating a
tessellation of the input space. If the interest is in assigning
to each point its own partition (the number of clusters matches
the size of the data), a visual representation of partitional
clustering is given by the so-called *Voronoi diagram*:

#figure(
    caption: [Example of a Voronoi diagram for $10$ data points.],
    [#image("voronoi.svg", width: 75%)]
)

The simplest (and likely earliest) partitional clustering algorithm is
*K-means*. The algorithm is as follows:

+ Fix the number of clusters $k$;
+ Choose $k$ random points in the dataset (called *seeds*),
  as representatives of the initial clusters. These representatives,
  that act like a "center of gravity" of their respective cluster,
  are called *centroids*;
+ Compute the distance between each element of the dataset and each
  centroid. Each element is assigned to the cluster whose centroid
  is the closest;
+ The centroids of each cluster are computed as the arithmetic mean
  between all elements of the cluster;
+ If a termination criteria is met, stop. Otherwise, go back to $3$.

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

#figure(
    caption: [K-means, with the $k$ parameter equal to $2$, applied to
              the `faithful` dataset. This dataset records data related
              to the eruptions of the
              #link("https://en.wikipedia.org/wiki/Old_Faithful")[Old Faithful geyser]
              in Yellowstone National Park. Each datum has two dimensions:
              the time for which each eruption lasted and the time elapsed
              between consequent eruptions. Choosing $k = 2$ properly
              captures the structure of the dataset, since there are
              two clear data clouds with few points in between.],
    [#image("geyser.svg", width: 75%)]
)
