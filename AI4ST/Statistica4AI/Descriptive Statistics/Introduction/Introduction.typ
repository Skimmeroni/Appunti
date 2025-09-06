#import "../../Stats4AI_definitions.typ": *

*Descriptive statistics* instructs how to make intelligent judgments
and informed decisions in the presence of uncertainty and variation.

Collections of facts are called *data*: descriptive statistics provides
methods for organizing, summarizing and drawing conclusions based on
information contained in the data. This is done through graphical
representations, called *plots*, or through *summary measures*,
numbers that can capture on their own an aspect of the entire data.

A statistical enquiry will typically focus on a well-defined collection
of objects, a *population*. A population can be constituted by a finite
or infinite number of objects. Each object in the population possesses
many features, which may or may not be of interest. Any feature whose
value can change from object to object in the population and that is
relevant with respect to the statistical enquiry is called a *variable*.

When the value of all variables is known for all objects in the population,
this is referred to as *census*. In most situations, a census is impossible
to obtain, either because it would be too expensive or too time consuming
to do so or because the population is made of infinitely many objects. If
this is the case, a solution is to extract a subset of the population,
called *sample*, and operate on such sample. A sample should not be too
small, otherwise it might fail to capture all the nuances of the population,
but not too big, or it would be hard to manipulate.

#exercise[
	Suppose there's interest in analyzing an aspect of the population that
	lives in a certain town. Being impractical to ask each person, the idea
	is to extract a reasonably sized sample. Which of the two approaches
	here presented is preferable?

	- Picking each person entering an elementary school in a day;
	- Picking each person entering a supermarket in a day.
]
#solution[
	The second one, because it is more likely to capture as many different
	people as possible.
]

Variables are classified into *numerical* variables and *categorical*
variables. Numerical variables can either be *discrete* or *continuous*.
Numerical variables are discrete if the set of its possible values is
either finite or countably infinite. Numerical variables are continuous
if the set of its possible values is uncountably infinite. Categorical
variables can either be *ordinal* or *nominal*. Categorical variables
are ordinal if the set of its possible values obeys an objective hierarchy
or ordering of sort, otherwhise are called *nominal*.

#exercise[
	Provide an example for each of the four types of variables.
]
#solution[
	- A numerical discrete variable is the number of items sold in a
	  store, since such number is necessarely an integer (it's not
	  possible to sell half an item, or three quarters of an item);
	- A numerical continuous variable is the temperature measured with
	  a thermometer, since this value is a real number;
	- A categorical ordinal variable is the level of satisfaction of
	  a customer ("very good", "good", "ok", "bad", ecc...). This is
	  because, despite not being numbers, it's still possible to arrange
	  them in an hierarchy ("very good" is higher than "good", "ok" is
	  higher than "bad", ecc...);
	- A categorical nominal variable is the color of a dress, since it's
	  impossible to state (objectively) that a certain color is "better"
	  or "greater" or "higher" than another.
]

The most immediate representation of the variables in a sample is
to tabulate them, constructing a table that lists, for each object
in the sample, which is the value of each variable. This tabulated
structure, the starting point for any statistical enquiry, is also
referred to as a *dataset*.

#figure(
	caption: [Small portion of the known `Iris`
	          #link("https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data")[dataset]
	          by Ronald Fisher. This dataset contains information regarding
	          three species of flowers, _Iris Setosa_, _Iris Versicolor_
	          and _Iris Virginica_. The first and second column contain,
	          respectively, the length and the width of the petal of the
	          flower (in centimetres), while the third column contains the
	          species of the flower. The table has been split into two due
	          to limited space.],
	table(
		columns: 6,
		stroke: none,
		table.header([*Petal Length*], [*Petal Width*], [*Species*],
		             [*Petal Length*], [*Petal Width*], [*Species*]),
		..csv("iris.csv").flatten()
	)
) <Iris>

If the number of variables is two and are both numerical, a known
graphical representation of the variables is through a *scatter
plot*. A scatter plot is constituted by a series of dots in a
two-dimensional Cartesian plane; each dot represents an object
in the sample and the $x, y$ coordinate of each point are its
values of the two variables. A scatter plot shows "at a glance"
how two-dimensional data is distributed.

A scatter plot is also possible, but less common, when the number
of (numerical) variables is three, considering a three-dimensional
Cartesian plane where the $x, y, z$ coordinates are the values
of the three variables for each object. If the third variable is
categorical, the scatter plot can be simplified by maintaining the
two-dimensional Cartesian plane and representing the third variable
either by the color of the dot or the shape of the dot.
 
#exercise[
	Draw a scatter plot of @Iris.
]
#solution[
	#figure(
		caption: [Scatterplot of @Iris],
		image("scatter.svg", width: 75%)
	)
]
