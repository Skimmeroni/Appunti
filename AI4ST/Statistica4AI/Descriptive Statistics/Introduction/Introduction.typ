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
many features, which may or may not be of interest.

Any feature whose value can change from object to object in the population
and that is relevant with respect to the statistical enquiry is called a
*variable*. Variables are generally denoted with uppercase letters. For
a variable $X$, the set $D(X)$ that contains all possible values that $X$
can take is called the *support* of $X$.

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

The different values that are attained by each element are called
*observations*. Observations are denoted with the lowercase counterpart
of the symbol used for the variable. That is, if $X$ is a variable, then
$x_(1), x_(2), dots, x_(n)$ are the $n$ observations in a sample, ordered
with a certain criteria: $x_(1)$ is the value of $X$ observed for the
first element of the sample, $x_(2)$ is the value of $X$ for the second
element, ecc...

Variables are classified into *numerical* variables and *categorical*
variables. Numerical variables can either be *discrete* or *continuous*.
Numerical variables are discrete if their support is either a finite set
or a countably infinite set. Numerical variables are continuous if their
support is a uncountably infinite set.

Categorical variables can either be *ordinal* or *nominal*. Categorical
variables are ordinal if the set of its possible values obeys an objective
hierarchy or ordering of sort, otherwhise are called nominal. Categorical
variables can exist in a continuum, but are much more likely to take finite
values.

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

The most straightforward way to organize the collected observations is
to arrange them into a table, with each row representing the observation
for a single element and each column representing one of the variables.
The $i,j$-th entry of this table represents the observation of the $j$-th
variable of the $i$-th individual.

This tabulated structure, the starting point for any statistical
enquiry, is also referred to as a *dataset*. A *univariate* data
set consists of a (tabulated) collection of observations on a single
variable of a sample or population. If the variables are two, the
dataset is *bivariate*. If the variables are three or more, the
dataset is *multivariate*.

#figure(
	caption: [Small portion of the known `Iris`
	          #link("https://archive.ics.uci.edu/ml/machine-learning-databases/iris/iris.data")[dataset]
	          by Ronald Fisher. This dataset contains information regarding
	          three species of flowers, _Iris Setosa_, _Iris Versicolor_
	          and _Iris Virginica_. The first and second column contain,
	          respectively, the length and the width of the petal of the
	          flower (in centimetres), while the third column contains the
	          species of the flower. This is an example of multivariate
	          dataset, with two numerical variables and a categorical
	          variable.],
	table(
		columns: 3,
		table.header([*Petal Length*], [*Petal Width*], [*Species*]),
		..csv("iris.csv").flatten()
	)
) <Iris>

A known graphical representation of bivariate numerical datasets is
the *scatter plot*. A scatter plot is made up by of dots drawn in a
two-dimensional Cartesian plane; each dot represents an object in
the sample and its $x, y$ coordinates are the observations of the
respective variables for that element. A scatter plot gives an
insight on how the data is "spread out" in space.

A scatter plot is also possible when the number of variables is
three. If all three variables are numerical, it entails drawing
a three-dimensional Cartesian plane and each point would have
$x, y, z$ coordinates, one for each variable. A three-dimensional
scatter plot is very hard to read however, which is why it is not
so common.

If instead the three variables are two numerical and one categorical,
a scatter plot is effective. The idea is to draw a two-dimensional
Cartesian plane, assigning the $x, y$ coordinates to the two numerical
variables, and representing the categorical variable either by drawing
dots of different colors or dots of different shapes.
 
#exercise[
	Draw a scatter plot of @Iris.
]
#solution[
	#figure(
		caption: [Scatterplot of @Iris. The two numerical variables occupy
		          the $x$ and $y$ axes, while the categorical variable (the
		          species) is mapped to the color of the dots.],
		image("scatter.svg", width: 75%)
	)
]
