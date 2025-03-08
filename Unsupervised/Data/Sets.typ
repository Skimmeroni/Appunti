#import "../Unsupervised_definitions.typ": *

It is useful to denote three characteristics that every dataset
possesses and that have an impact on which data mining technique
is used: *dimensionality*, *distribution*, *resolution*.

The dimensionality of a data set is the number of attributes that the
objects in the data set possess (not the amount of objects that constitute
it). Analyzing data with a small number of dimensions tends to be different
from analyzing data with many dimensions. This issue of scalability with
respect to dataset dimensions has its own name: _curse of dimensionality_.
For this reason, it is often useful to apply techniques of *dimensionality
reduction*.

The distribution of a data set is the frequency of occurrence of various
values or sets of values for the attributes comprising data objects. Even
though many distribution structures are fairly common (gaussian, ecc...)
it isn't always possible to employ them to capture every detail of any
dataset. This is why data mining algorithms strive to be distribution-agnostic,
that is not depending on a specific distribution in order to accomplish their
goals.

However, some general aspects of distributions often have a strong impact,
such as their *sparsity*. A data set is considered sparse if most attribute
values are null values (in the context of numerical attributes, null
attribute values are $0$s). When attributes are asymmetric, sparsity is
a pleasant feature to have since, even though the dataset might consist
of many objects, most attribute values do not need to be taken into account.
Indeed, some data mining algorithms have a feasible execution time only if
the dataset is sparse.

The resolution of a data set is to the level of detail, of "granularity",
with which its attribute values are obtained. If the resolution is too
fine, a pattern may not be visible or may drown in noise; if the resolution
is too coarse, the pattern can disappear. For example, variations in
atmospheric pressure on a scale of hours reflect the movement of storms
and other weather systems. On a scale of months, such phenomena are not
detectable.

Datasets can be grouped with respect to the way that the data is
arranged. One possible (yet partial) way of classifying data sets
in this regard is to denote it as *record data*, *graph data* or
*ordered data*.

Record data is the most intuitive way of arranging data: tables with the
attributes as headers and the attribute values stored in the cells. In
contrast to how, say, relational databases work, there's no notion of a
key (two objects with the same attribute values are not the same object)
and there is no relationship between multiple records (each record stands
for itself). Also, each record ought to have the same set of attributes,
even though some of those values might be unknown.

A special kind of record data is *transaction data*, where each record
(transaction) involves a set of items. This type of data is also called
*market basket data* because the items in each record can be thought of
as the items put in a person's basket at the mall. Transaction data can
also be viewed as a set of records whose fields are asymmetric attributes,
that is, as the existence of a certain item in each transaction.

If all the attributes in a data set are numerical, it is possible
to conceive each data object as a point in a multidimensional space,
where each dimension represents a distinct attribute. Therefore, the
table structure of record data can be nicely coerced into a $n times m$
matrix, where each of the $m$ rows represents an object and each of the
$n$ columns represents an attribute (or vice versa). This matrix is
called a *data matrix* or a *pattern matrix*; being a matrix, it is
possible to easily manipulate its data using matrix operations (like
column-wise product, for example).

A *sparse data matrix* is a special case of a data matrix where the
attributes are of the same type and are asymmetric. As a matter of
fact, transaction data is an example of a sparse binary data matrix.

#exercise[
	Provide examples for each type of record data set.
] <Examples-of-record-data-sets>
#solution[
	- A generic record data was already introduced in @Example-record-data;
	- Transaction data can be approached considering a grocery store.
	  The set of products purchased by a customer in a single shopping
	  trip constitutes a transaction, whereas the individual products
	  that they purchased are the items;
	- Any matrix of real values can act as a data matrix;
	- A common example of sparse data matrix is document data. Matrices
	  such as these, called *document-term matrices*, contain the number
	  of occurrences of each word in each document. Such attributes are
	  indeed asymmetric, since it is irrelevant to keep track of the
	  absence of a word (i.e. if its occurrency is $0$).

	#grid(
		columns: (0.45fr, 0.55fr),
		[#table(
			columns: (auto, auto),
			[*id*], [*Transaction*],
			[1], [Bread, Soda],
			[2], [Bread, Soda, Milk],
			[3], [Beer, Bread],
			[4], [Soda, Chocolate, Milk],
			[5], [Soda, Milk]
		)],
		[#table(
			columns: (auto, auto, auto, auto, auto),
			[*Length*], [*Width*], [*Depth*], [*Capacity*], [*Pressure*],
			[7.21], [9.53], [9.3], [8.66], [6.2],
			[4.10], [9.56], [3.77], [6.95], [0.39],
			[1.10], [7.18], [9.28], [0.99], [7.53]
		)]
	)

	#align(
		center,
		[#table(
			columns: (auto, auto, auto, auto, auto, auto),
			[], [*Car*], [*House*], [*Dog*], [*Book*], [*Chair*],
			[*Document 1*], [1], [7], [0], [0], [0],
			[*Document 2*], [0], [0], [7], [0], [0],
			[*Document 3*], [0], [4], [7], [1], [1],
		)]
	)
]

Data arranged into a graph allows to have a more flexible, yet harder
to manipulate, data structure. This is particularly useful when there's
interest not only in keeping track of the object attributes, but also
in the relationship that occurs between objects. That is, when the
references between objects can tell something about the data that the
objects on their own cannot.

In its most natural form, graph data represents data objects as nodes
of the graph and relationships between objects as edges. Traits of said
relationships can be encoded as properties of the edges (weight, direction,
ecc...). It is also sometimes useful to encode objects as graphs when
objects are composite, having subobjects and relationships among each
component.

#exercise[
	Provide examples for each type of graph data set.
] <Examples-of-graph-data-sets>
#solution[
	- Web pages are often represented as graphs, encoding each web page as
	  a node and the existence of a link that allows to move from one web
	  page to another as an edge. This is because the existence of a link
	  that connects two web pages can, for example, change the priority of
	  a search engine when indexing results;
	- The structure of chemical compounds can be represented by a graph,
	  where the nodes are atoms and the edges are chemical bonds. A graph
	  representation makes it possible to determine which substructures
	  occur frequently in a set of compounds and to ascertain whether the
	  presence of any of these substructures is associated with the presence
	  or absence of certain chemical properties, such as melting point or
	  heat of formation.

	#align(
		center,
		[#cetz.canvas({
			import cetz.draw: *

			set-style(
				stroke: (thickness: 1.5pt),
				circle: (radius: 0.25),
				fill: black,
			)

			circle((0, 0), name: "A1")
			circle((2, 0), name: "A2")
			circle((3, 1.5), name: "A3")
			circle((2, 3), name: "A4")
			circle((0, 3), name: "A5")
			circle((-1, 1.5), name: "A6")

			circle((-0.5, -1), name: "B1", fill: white)
			circle((2.5, -1), name: "B2", fill: white)
			circle((4, 1.5), name: "B3", fill: white)
			circle((2.5, 4), name: "B4", fill: white)
			circle((-0.5, 4), name: "B5", fill: white)
			circle((-2, 1.5), name: "B6", fill: white)

			line("A1", "A2")
			line("A2", "A3")
			line("A3", "A4")
			line("A4", "A5")
			line("A5", "A6")
			line("A6", "A1")

			line("A1", "B1")
			line("A2", "B2")
			line("A3", "B3")
			line("A4", "B4")
			line("A5", "B5")
			line("A6", "B6")
		})]
	)
]

Ordered data is data where there's interest in keeping track of the
_order_ that each object occupies with respect to the others, be it
temporal or spacial. Examples of ordered data include:

- *Sequential transaction data*, which can be thought of as transaction
  data, extended with a timestamp;
- *Time series data*, a series of measurements of the same phenomena
  taken in different periods of time. An important aspect of time series
  data is *time autocorrelation*: measurements taken in time instants
  close to each other tend to give similar results.
- *Sequence data*, sequences of individual entities where there's
  interest in the order in which they are arranged;
- *Space data*, a series of measurements of the same phenomena
  taken in different points in space. An important aspect of
  space data is *space autocorrelation*: objects that are close
  to each other (have similar coordinates) tend to also have similar
  attribute values.

#exercise[
	Provide examples for each type of ordered data set.
] <Examples-of-ordered-data-sets>
#solution[
	- Sequential transaction data can extend the example presented in
	  @Examples-of-record-data-sets by introducing the time attribute.
	  In this way, it could be possible to investigate relationships,
	  for example, between purchased items and time of the day in which
	  they bought;
	- Stock prices over time can be modelled as time series data.
	  it is reasonable to assume that the price of the same stock in
	  consecutive time frames will not change drastically;
	- The genetic information of plants and animals can be represented
	  as sequence data in the form of strings on the alphabet ${A, C, G, T}$.
	  The order in which they are arranged is indeed the most relevant aspect
	  of the data, since it determines which proteins are built;
	- Weather data (precipitation, temperature, pressure) can be represented
	  as spatial data, often displayed with the help of heatmaps. It is indeed
	  to be expected that locations on Earth close to each other will have a
	  similar, for example, average temperature during the day.

	#grid(
		columns: (0.5fr, 0.5fr),
		[#image("sine.svg")],
		[#image("heat.svg")]
	)
]
