#import "../AI_definitions.typ": *

*Genetic programming* is a set of techniques that apply the principles
of evolution to functional terms or entire computer programs to find,
through an evolutionary-like algorithm, the one that addresses a particular
purpose. In general, this purpose entails finding the functional terms or
program that best matches an input to an expected output. The chromosomes
of genetic programming, called *genetic programs*, are functional terms
and programs, and are allowed to have different lenghts.

Each genetic program is expressed in a *formal language*, whose elements
are constructed from two sets: a set $cal(F)$ of *function symbols and
operators* and a set $cal(T)$ of *terminal symbols* (constants and
variables). The choice of $cal(T)$ and $cal(F)$ is program-dependent.
Parenthesis can also be introduced to specify the order in which functions
are to be applied.

#exercise[
	What would be the set of terms and functions for the formal language
	of zeroeth-order logic?
]
#solution[
	#grid(
		columns: (0.5fr, 0.5fr),
		[$ cal(F) = {and, or, not, =>} $],
		[$ cal(T) = {a, b, c, dots, 0, 1} $]
	)
]

Each element of a language, called *symbolic expression* is therefore a
member of $cal(G) subset.eq (cal(F) union cal(T) union {(, )})^(*)$. Out
of all possible combinations of terms, functions and parenthesis, the
symbolic expressions of interest are the so-called *well-formed formulas*
(*WFFs*), that abide by a set of rules defined in a *grammar*. Well-formed
formulas are defined recursively as follows:

- A single constant is a well-formed formula;
- A single variable is a well-formed formula;
- If $w_(1), dots, w_(n)$ are $n$ WFFs and $f$ is a $n$-ary function in
  $cal(F)$, then $f(w_(1), dots, w_(n))$ is a well-formed formula;
- Nothing else is a well-formed formula.

#exercise[
	What would be the well-formed formulas for the formal language of
	zeroeth-order logic?
]
#solution[
	- $0$ is a well-formed formula;
	- $1$ is a well-formed formula;
	- Any variable ($a, b, c, dots$) is a well-formed formula;
	- If $X$ and $Y$ are two well-formed formulas, then $and(X, Y)$ is a well-formed formula;
	- If $X$ and $Y$ are two well-formed formulas, then $or(X, Y)$ is a well-formed formula;
	- If $X$ and $Y$ are two well-formed formulas, then $=>(X, Y)$ is a well-formed formula;
	- If $X$ is a well-formed formula, then $not(X)$ is a well-formed formula;
	- Nothing else is a well-formed formula.

	Note how the application of $and, or, =>$ is generally written as
	$(X and Y), (X or Y), (X => Y)$, and not as $and(X, Y), or(X, Y),
	=>(X, Y)$. This notation, called *prefix notation*, is simpler to
	manipulate and is equivalent to the most-used notation, even though
	less readable.
]

Symbolic expressions are represented using *parse trees*, a tree where
each node contains a term or a function, and the edges represent the
application of a function to a well-formed formula; the number of children
of each node in the tree represents the number of arguments to which the
function is applied.

#exercise[
	Consider the symbolic expressions $=>(and (a, b), not(or(c, 0)))$
	and $and(not(a), or)$ of the formal language of zeroeth-order logic.
	Are they well-formed formulas? Draw their parse tree.
]
#solution[
	The first symbolic expression is a well-formed formula, the second
	is not.

	#align(
		center,
		[#grid(
			columns: (0.5fr, 0.5fr),
			[#syntree(
				terminal: (fill: blue),
				"[$=>$ [$and$ [a] [b]] [$not$ [$or$ [c] [0]]]]")
			],
			[#syntree(
				terminal: (fill: blue),
				"[$and$ [$not$ [a]] [$or$]]")
			]
		)]
	)
]

A desirable property of $cal(F)$ is that all the functions that it
contains are total functions, meaning that they accept any possible
input value of their domain. Examples of functions that are not total
functions are the division (which is undefined when the second operand
is $0$) and the logarithm (which is undefined for negative numbers).
If this is not the case, genetic programs might not be able to complete
their execution. The issue can either be solved by:

- Restricting the domain introducing additional constraints, so that the
  function won't ever have an input whose output is undefined. For example,
  preventing $0$ for being the input of a division;
- Introducing a penalty factor, as it was done in evolutionary computing,
  so that faulty chromosomes die out;
- Employing a *protected* version of function that return "nice" values in
  the presence of troublesome inputs. For example, modifying the logarithm
  so that it returns $log(x)$ if $x$ is positive (as expected) and $0$ if
  $x$ is negative.

Along the same line, if the function is supposed to accept values from
multiple distinct subdomains, it can be adapted by changing the meaning
of the data types as needed. One known example is the convention used
by C and C++ when dealing with booleans. A C/C++ function that accepts
a boolean parameter that receives a non-boolean parameter interprets it
as follows: the number $0$ is converted into `false`, anything else (a
`char`, a non-zero number, ecc...) into `true`.

Another important property is the *completeness* of the sets $cal(F)$ and
$cal(T)$ with respect to the expressions they represent. That is, the two
sets should contain a sufficient number of elements to be able to generate
every possible expression of the language. Finding the smallest set of
functions that can generate every expression of a language is an NP-hard
problem, therefore $cal(F)$ tends to be bigger than necessary. This is not
an issue, however, since introducing more functions can simplify expressions
and increase their readability.

#exercise[
	Is it possible to find a smaller set of functions than
	$cal(F) = {and, or, =>, not}$ for the formal language of
	zeroeth-order logic?
]
#solution[
	Yes. A set such as $cal(F) = {=>, not}$ would be sufficient,
	since expressions containing $and$ and $or$ could be converted
	into expressions with just $=>$ and $not$. The set $cal(F) =
	{and, not}$ would also suffice. However, this would make
	manipulating expressions much more cumbersome, therefore it
	is much more convenient to use ${and, or, =>, not}$.
]

A good symbolic expression that solves the problem at hand is no
different than applying an evolutionary algorithm: a random initial
population of symbolic expressions is constructed, which is then
evaluated by a fitness function. The symbolic expressions with higher
fitness will (tend to) mutate and produce offspring applying genetic
operators, the symbolic expressions with lower fitness will (tend to)
die out in the generations. The fitness of a symbolic expression
represents how well the genetic program maps the input to the expected
output.

Randomly generating a chromosome for genetic programming (that is, a
random symbolic expression) has to be done with caution, since it has
to respect the rules defined in the grammar. The simplest approach to
do so is to follow the recursive definition for well-formed formulas.
Since it is also convenient for the later evaluation of genetic programs,
it's actually better to generate the parse tree corresponding to an
expression, rather than a sequence of symbols. To make sure that the
procedure terminates, one could set a maximum number of nodes of the
parse tree and/or a maximum depth; when such threshold is reached, all
remaining branches are closed with terminal symbols, and aren't expanded
further.

#pseudocode(
	title: "GP-Initialize-Grow",
	parameters: ([$d$], [$d_("max")$],),
	content: [
		if $(d = 0)$ #i \
			$n <-$ a random function sampled from $cal(F)$ #d #comment[Avoid expressions with a single term] \
		else if $(d gt.eq d_("max"))$ #i \
			$n <-$ a random term sampled from $cal(T)$ #d #comment[Close the branch due to max size reached] \
		else #i \
			$n <-$ a random element sampled from $cal(T) union cal(F)$ #d #comment[Open the branch] \
		foreach $c$ in arguments of $n$ #i \
			$c <-$ #smallcaps("GP-Initialize-Grow") ($d + 1, d_("max")$) #d #comment[Expand the branches recursively] \
		return $n$ \
	]
)

A common extention of the algorithm would be not to assign the same
probability to each element drawn from $cal(T)$ and $cal(F)$, but to
weight the probabilities differently. This way, both the complexity
and the size of the parse tree can be controlled to some extent.

Another slight variation is what's called "full" initialization,
where the maximum tree height $d_("max")$ is always reached, whereas
in the previous algorithm a branch could close long before $d_("max")$
is reached (this is because a terminal symbol could be drawn at any step).

#pseudocode(
	title: "GP-Initialize-Full",
	parameters: ([$d$], [$d_("max")$],),
	content: [
		if $(d gt.eq d_("max"))$ #i \
			$n <-$ a random term sampled from $cal(T)$ #d #comment[Close the branch due to max size reached] \
		else #i \
			$n <-$ a random element sampled from $cal(F)$ #comment[Always start with a function] \
			#d #comment[This way, max size will always be reached] \
		foreach $c$ in arguments of $n$ #i \
			$c <-$ #smallcaps("GP-Initialize-Full") ($d + 1, d_("max")$) #d #comment[Expand the branches recursively] \
		return $n$ \
	]
)

A more refined method of initialization is what's called "ramped
half-and-half" initialization, where the maximum tree depth varies
between iteration combining both the "grow" and the "full" initialization.
This way, the population becomes representative of as many tree shapes,
complexities and depths as possible.

#pseudocode(
	title: "GP-Initialize-Half-And-Half",
	parameters: ([$mu$], [$d_("max")$],),
	content: [
		$P <- emptyset$ #comment[Population starts empty] \
		for $i = 1$ to $d_("max")$ do #i \
			for $j = 1$ to $2 dot d_("max")$ do #i \
				$P <- P union $ #smallcaps("GP-Initialize-Grow") $(0, i)$ \
				$P <- P union $ #smallcaps("GP-Initialize-Full") $(0, i)$ #d #d \
		return $P$ \
	]
)

As of any evolutionary algorithm, a population evolves and increases
its fitness by applying genetic operators. For example, applying crossover
to two symbolic expressions means exchanging one subexpression (that is,
one parse subtree) of the first with a subexpression of the second, and
vice versa.

Applying mutation to a symbolic expression entails replacing a subexpression
of a symbolic expression with a randomly generated subexpression. Again, one
should be careful in applying mutation to genetic programs, since blindly
substituting a subexpression with another can render the symbolic expression
not a well-formed formula anymore. This can be prevented by randomly choosing
a node in the parse tree, delete all nodes descending from said node and
expanding the truncated branch applying an initalization algorithm like
presented above. The algorithm can also be tuned to set a very small maximum
depth, so that the newly formed branch has length comparable to the original,
and does not introduce too much randomness.

However, if the population is sufficiently large and diversified, there's
no need to apply both mutation and crossover: crossover alone is guaranteed
to generate arbitrarely different individuals. This is because genetic
programs come in very different sizes and depths (evolutionary algorithms
deal with chromosomes of fixed lenght), hence recombining two genetic
programs can generate individuals that are completely different from their
parents, even if said parents are similar or, in extreme cases, identical.

Genetic programming has a tendency to "clutter" the solutions, even optimal
solutions, with needless subexpressions. For example, in the case of Boolean
formulas, a subexpression such as $or(x, not(x))$ is tautological, thererore
inserting it in any Boolean formula won't change its meaning, but for the
same reason it is also completely useless. (sub)Expressions such as these
are called *introns*, in analogy to the sections of DNA that don't encode
any information, either because they can never be activated (most likely a
leftover of a previous stage of evolution) or because they are actually
meaningless (also called _junk DNA_).

Introns can be introduced in a genetic program by a mutation or
a ricombination. They are particularly problematic because, since
adding one does not alter the semantics of a symbolic expression,
it also means that is does not alter its fitness. Therefore, from
the point of view of a "naive" algorithm, adding an intron does not
worsen the candidate solution #footnote[In nature this wouldn't be
the case, since a DNA more "cluttered" with introns also makes it
harder to replicate. Therefore, the presence of extra introns in the
DNA of a living being could entail a loss of fitness.]. The simplest
countermeasure would be lowering the fitness of genetic programs (of
parse trees) that are particularly long, but this could also penalize
valid solutions.

A better approach is what's called *editing*. Editing is a special
genetic operator that, instead of introducing new genes in an individual,
"prunes" and simplifies the already existing chromosome. Editing is
divided into *general editing* and *special editing*. General editing
constists in substituting a subexpression with its result, either because
it's only made up of constants or because it depends on variables that
are aren't in the subexpression. Special editing consists in applying
equivalences that don't change the meaning of the subexpression, but
make it shorter and/or more readable.

#exercise[
	What would be an example of general and special editing for
	the formal language of zeroeth-order logic?
]
#solution[
	One example of general editing would be substituting $or(x, not(x))$,
	the expression hinted at before, with $1$, since it's a tautology.
	One example of special editing would be applying De Morgan's Law(s),
	such as rewriting $(not (or (a, b)))$ as $(and (not a), (not b))$
	(or viceversa).
]

Editing can be incorporated in the application of the genetic operators
themselves (mutation and/or crossover), in order to reduce the number of
wasterful computations. However, it is much more common to apply it only
to the solution that has been found.

Other methods that have been suggested to reduce the creation of introns
are modified genetic operators like *brood recombination*. This operator
creates many children from the same two parents by applying a crossover
operator with different parameters. Only the best child of the brood enters
the next generation. This method is particularly useful if combined with
a fitness penalty, because then it favors children that achieve the same
result with simpler means (that is, with a less complex chromosome).
*Intelligent recombination* chooses crossover points purposefully, which
can help to prevent the creation of introns.

An example of genetic programming is solving the $n times 1$ *multiplexor
problem*. A multiplexor is a device that has $n$ data inputs, $log_(2)(n)$
address lines inputs and $1$ output. The output of the multiplexor is
given by the data input "chosen" by the address lines: if the value of
the selectors is $i$ (in binary), then the output of the multiplexor is
the value of the $i$-th data input. The possible number of input combinations
is $2^(n + log_(2)(n))$. Solving the problem entails having an $n times 1$
multiplexor given as a "black box" and finding a symbolic expression of
the Boolean function that describes it #footnote[The multiplexor problem
can actually be solved analytically with little effort (when $n$ is small,
at least), hence it should be seen just as a paradigmatic example.].

The set of symbols chosen for solving the problem is $cal(T) = {d_(0),
d_(1), dots, d_(n), s_(0), s_(1), dots, s_(log_(2)(n))}$, where the
$d_(i)$ symbols are the $n$ data inputs and the $s_(i)$ symbols are
the $log_(2)(n)$ address lines inputs. The set of functions is $cal(F)
= {"and", "or", "not", "if"}$: $"and"$ and $"or"$ have two arguments,
$"not"$ has one argument and $"if"$ has three arguments (the condition,
what to do if the condition is true, what to do otherwise). Since it is
assumed that the inputs will always be Boolean values, the functions are
domain complete. Also, the chosen set of functions is sufficient to generate
all possible Boolean functions.

With $M = 2^(n + log_(2)(n))$, a simple choice of the fitness function
can be $M - sum_(i = 0)^(M) e_(i)$, where $e_(i)$ is the error for the
$i$-th input. That is, $e_(i) = 0$ if the computed output for the $i$-th
matches the desired output for the configuration and $e_(i) = 1$ otherwise.
A termination criteria would stopping the procedure when an individual with
fitness equal to $M$ is found, meaning that is perfectly matches each
configuration with its expected input.
