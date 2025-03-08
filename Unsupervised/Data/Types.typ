#import "../Unsupervised_definitions.typ": *

Before data mining can be approached effectively, it is necessary to
analyze the different types of data. This is because there's no one
size fits all and different types of data require different approaches.

By *data*, or *data set* we mean a collection of *data objectes* together
with their *attributes*. Data objects are a collection of attributes,
capturing its characteristics in its entirety. Data objects are also
referred to as: _record_, _point_, _case_, _sample_, _entity_, _instance_.

An attribute is a property or a characteristic of an object that can
vary, either from one object to another or from one time to another.
Attributes are also referred to as: _variable_, _field_, _characteristic_,
_dimension_, _feature_.

There's a distinction between attributes and *attribute values*. The
latter are the value or the symbol assigned to the former for a particular
object. The same attribute can be matched to different attribute values.
Interestingly, the properties of an attribute can differ from the properties
of the attribute values associated to the same attribute.

// A measurement scale...

The most intuitive way to arrange data is to use a table. The header of
the table represent the attributes, whereas the cells contain the attribute
values. The $(i, j)$-th cell contains the attribute value assigned to the
$j$-th attribute for the $i$-th object. This requires that the objects are
arranged according to a certain order.

#exercise[
	Arrange an example of a data set in a table.
] <Example-record-data>
#solution[
	The following data set contains information on students. Each row
	contains, in order: the id of the student, the year in which they
	are at the moment and their average score.

	#align(
		center,
		table(
			columns: (auto, auto, auto, auto),
			[*Student ID*], [*Year*], [*Grade Point Average (GPA)*], [...],
			[...], [...], [...], [...],
			[1034262], [Senior], [3.24], [...],
			[1052663], [Freshman], [3.51], [...],
			[1082246], [Sophomore], [3.62], [...]
		)
	)
]

Attributes are classified into types with respect to the properties
that they possess: *nominal*, *ordinal*, *interval*. *ratio*. This
four types are arranged in a hierarchy. Each type inherits the
properties and the supported operations of the previous one.

Nominal and ordinal attributes are collectively referred to as
*categorical* or *qualitative* attributes. As the name suggests,
lack most of the properties of numbers. Even when represented by
numbers (IDs, for example), they should be treated as symbols.
Interval and ratio attributes are collectively referred to as
*quantitative* or *numeric* attributes. Quantitative attributes
are represented by numbers and have most (if not all) of the
properties of numbers.

#table(
	columns: (auto, auto, auto, auto, auto),
	table.cell(colspan: 2)[*Type*], [*Description*],
	[*Transformations*], [*Statistics and tests*],
	table.cell(rowspan: 2)[Categorical \ (qualitative)],
	[Nominal],
	[Values are just different names, they have no bearing on
	the chosen one],
	[Checking whether two values are the same or not,
	any permutation or rearrangement],
	[mode, entropy, contingency correlation, chi square test],
	[Ordinal],
	[They can be any name as long as an order relation is preserved],
	[Checking whether a value is greater or less than another, any
	monotonic function, $"new" = f("old")$],
	[median, percentiles, rank correlation, run tests, sign tests],
	table.cell(rowspan: 2)[Numeric \ (quantitative)],
	[Interval],
	[The differences between values are meaningful, they possess both
	a range and an order],
	[Any scaling and or/stretching, $"new" = a times "old" + b$ with
	$a$ and $b$ constants],
	[mean, standard deviation, Pearson’s correlation, t and F tests],
	[Ratio],
	[Both differences and ratios are meaningful. They lie on an absolute
	scale and possess both a range and an order],
	[Any scaling, $"new" = a times "old"$ with $a$ constant],
	[geometric mean, harmonic mean, percent variation]
)

Note that the properties above aren't necessarely the only ones that
those possess. They are the ones that _every_ attribute of the kind
possesses, but there could be more. Also note the fact that an attribute
type supports a certain transformation or statistic does not necessarely
entail that computing said transformation or statistic is useful.

#exercise[
	Provide some examples of data for each type.
]
#solution[
	- _Nominal_: zip codes, employee ID numbers, eye color, gender. If all
	  employee ID numbers are reassigned, it will not make any difference.
	- _Ordinal_: taste rankings, school grades, street numbers. Denoting
	  school grades as {"poor", "average", "good"}, as ${1, 2, 3}$ or as
	  ${1, 4, 9}$ has no difference.
	- _Interval_: calendar dates, temperature in Celsius or Fahrenheit.
	  The Fahrenheit and Celsius temperature scales differ in the location
	  of their zero value and the size of a degree (unit). Scaling (say,
	  doubling) or shifting (say, adding one) preserves the meaning.
	- _Ratio_: temperature in Kelvin, monetary quantities, counts, age, mass,
	  length, electrical current. Changing unit of measurement (scaling)
	  preserves the meaning, whereas shifting (say, adding one) doesn't.
]

An "orthogonal" way of distinguishing between attributes is whether they
are *discrete* or *continuous*, that is, with respect to the number of
values that they can take.

Discrete attributes have a finite or countably infinite set of possible
values, and are often represented as integer variables. A special case
of discrete attributes are *binary* attributes, that can assume only
two values (true/false, yes/no, 0/1, ecc...) and are often represented
as boolean variables.

Continuous attributes have an uncountably infinite set of possible values,
and are often represented as floating-point variables. Practically speaking,
especially in the context of computer encoding, the granularity with which
a continuous attribute can be measured is limited.

In principle, any nominal, ordinal, interval or ratio attribute can be
either discrete or continuous, even though only some combinations are
really useful (for example, it's hard to conceive an attribute that is
both nominal and continuous). In general, nominal and ordinal attributes
are either binary or discrete, whereas interval and ratio attributes are
continuous.

*Asymmetric* attributes are attributes where only the "presence" of a
value (a non-null value) is worth recording (for example, words in a
document: keeping track of unused words is worthless).
