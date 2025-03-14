#import "../Unsupervised_definitions.typ": *

*Cluster analysis* consists in dividing a dataset into subgroups in
a reasonable manner. The idea is that member of a group should be
more similar to each other (little *intra-cluster distance*) and,
at the same time, being different from elements of other groups (big
*inter-cluster distance*).

Clustering is useful for understanding the relationship among the data
points and to summarize a data set to extract the most relevant elements.

Clustering falls into two broad categories:

- *partitional*, that splits the dataset into non-overlapping components;
- *hierarchical* that constructs a hierarchical tree of nested subgroups.

Clustering can be *exclusive* or *non exclusive*. The first means that
an object can be in two or more clusters at the same time whereas the
second means that one object must be at most in a single cluster.
A special type of non exclusive clustering is *fuzzy clustering*, where
each element is assigned a probability of being in each cluster. Clustering
can be *partial* if only a subset of the elements is actually clustered
or *complete* if all elements are taken into account.

Five orthogonal categories of clustering:

- *Well-separated clustering*, where intra-cluster distance is small and
  inter-cluster distance is big;
- *Prototype-based clustering* where each point is closer to the *prototype*
  of its cluster than to the prototypes of other clusters. Common choices
  for prototypes are the mean (*centroids*) or the median (*medioids*);
- *Contiguity-based clustering*;
- *Density-based clustering*, where there are regions of space that are
  dense (where points are close to one another), separated by regions
  that are sparse;
- *Objective-function based clustering*, where clustering is reduced to an
  optimization problem, minimizing or maximizing a given objective function.

Chosing a different distance measure induces a different result. Different
types of data have different proximity measures that are appropriate. Clusters
can have different sizes and shapes.

Cluster analysis cannot be reduced to the mere act of clustering. Infact,
clustering is one of the steps (albeit the most relevant) of cluster
analysis. The whole picture is as follows:

+ *Feature selection*, to pinpoint which attributes are actually relevant
  for the current concern;
+ *Feature extraction* to combine the extracted attributes to obtain
  information that the single attributes cannot provide;
+ The clustering itself, through the means of a *clustering algorithm*.
  Different algorithms can give different results for the same data.
  Some algorithms can even give different results for the same data if
  repeated more than once. There is no one-size-fits-all and different
  algorithms are more optimized for different data;
+ *Cluster validation* to inspect whether the result of the algorithm
  is consistent (actually represents an underlying cluster structure)
  or is artificial
+ *Results validation* to draw conclusions on the given results,
  often cross-validated with experts in that domain.
