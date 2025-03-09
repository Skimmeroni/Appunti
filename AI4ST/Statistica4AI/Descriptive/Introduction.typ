#import "../Stats4AI_definitions.typ": *

*Descriptive statistics* instructs how to make intelligent judgments
and informed decisions in the presence of uncertainty and variation.

Collections of facts are called *data*: descriptive statistics provides
methods for organizing, summarizing and drawing conclusions based on
information contained in the data. This is done through graphical
representations, called *plots*, or through *summary measures*,
numbers that on their own represent an aspect of the data as a whole.

A statistical enquiry will typically focus on a well-defined collection
of objects constituting a *population*. When desired information is
available for all objects in the population, a *census* is available.

In general, such a situation is hardly possible, either because it would be
too expensive or too time consuming to do so or simply because the population
has an infinite amount of members. A more reasonable approach is to extract
a subset of the population, called *sample* that is both sufficiently small
to be able to work with and sufficiently large to capture all the nuances of
the population as a whole.

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

Each object of the population possesses many features, some of which may
or may not be of interest. Any feature whose value might change from object
to object in the population and that has relevance with respect to a
statistical enquiry is called a *variable*.

Variables are generally distinct in *numerical* variables and *categorical*
variables. Numerical variables are distinct in *discrete* and *continuous*.
Numerical variables are discrete if the set of its possible values is either
finite or countably infinite. Numerical variables are continuous if the
set of its possible values is uncountably infinite. Categorical variables
are distinct in *ordinal* and *nominal*. Categorical variables are ordinal
if the set of its possible values obeys an objective hierarchy or ordering
of some sort, otherwhise are called *nominal*.

#exercise[
	Provide an example for each of the four types of variables.
]
#solution[
	- A numerical discrete variable could be the number of items sold in a
	  store, since such number is necessarely an integer (it's not possible
	  to sell, say, half an item, or three quarters of an item). Another
	  example is the number of attempts necessary to win the lottery: it
	  could be infinite, but it's still countable;
	- A numerical continuous variable could be the temperature measured in
	  a certain meteorological station, since such value is a real number
	  (it could be approximated to an integer, but it would entail losing
	  much informaton);
	- A categorical ordinal variable could be the ranks in an army, such
	  as general, private, captain, etcetera. Such ranks can be arranged
	  in a (very) strict hierarchy, for example corporal is lower than
	  general while corporal is higher than private;
	- A categorical nominal variable could be the colors of a dress.
	  It would make little sense to say that, for example, red scores
	  higher than green or that pink scores lower than blue, at least
	  in an objective way.
]
