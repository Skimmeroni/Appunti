#import "../AI_definitions.typ": *

Evolutionary algorithms operate on chromosomes made up of strings.
Logical predicates are nothing but strings with a semantic attached
to it. Therefore, it is possible to generate logical predicates
using evolutionary techniques.

Such techniques encompass what is called *genetic programming*:
applying the principles of evolution to functional terms or entire
computer programs to find, through an evolutionary-like algorithm,
the one that addresses a particular purpose. In general, this
entails starting from a set of inputs and outputs, and trying
different possible functional terms or programs that map each
inputs to its output. The program of interest is the one that
is capable of matching every single input to the respective output.

The chromosomes of genetic programming are called *genetic programs*.
Each genetic program is a functional term or a program. Since computer
programs and logical statements with the same semantic can have more
or less components, genetic programs are allowed (and expected) to have
different lenghts. This is different from most evolutionary algorithms,
where the length of a chromosome is fixed.

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

Notice how this way of writing logical formulas is somewhat different
than the usual notation, especially for operators having arity equal
to $2$, of terminal-function-terminal. That is, instead of having
something like $3 + 5$ or $a => b$ one has $+ (3, 5)$ and $=> (a, b)$.
The notation of well-formed formulas in genetic programming is what's
called *prefix notation*: even though it may be less readable, it is
much easier to manipulate (terms are arranged into a stack, their
number is predictable). Also, any expression written in prefix notation
can be converted into an equivalent expression in "standard" notation,
therefore there's no loss of expressiveness.

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
]

Symbolic expressions are represented using *parse trees*. A parse tree
is a tree data structure where each node encodes one and only component
(a terminal or a function) of a given symbolic expression. Terminal
symbols are the leaves, functions are the inner nodes and each edge
connects a function to one of its arguments. The root of a parse tree
is, in general, a function, even though one could have a parse tree
with a single terminal and nothing else, which would be the root (such
degenerate cases are not considered, however). A subtree with a given
root represents a subexpression having such root as the operator and
its children as its arguments. The height of the node in the tree
represents the order of preference in which the expression is to be
evaluated: the higher, the earlier.

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

Another important property is the *completeness* of the sets $cal(F)$
and $cal(T)$ with respect to the expressions they represent. That is,
the two sets should contain a sufficient number of elements to be able
to generate every possible expression of the language. This is because
genetic programming is a mere ricombination of "building blocks", not
the creation of those "blocks" themselves. If the building blocks at
hand cannot construct an expression with a given semantic, such expression
will never come to life.

Finding the smallest set of functions and terminals that can generate
every expression of a language is an NP-hard problem. Therefore, $cal(F)$
will most likely be bigger than necessary, with expressions with the same
semantic that have more than one syntactic representation. This is not an
issue, however, since introducing more functions can simplify expressions
and increase their readability.

#exercise[
	Is it possible to find a smaller set of functions than
	$cal(F) = {and, or, =>, not}$ for the formal language of
	zeroeth-order logic?
]
#solution[
	Yes. A set such as $cal(F') = {and, not}$ would be sufficient.
	This is because both $or$ and $=>$ can be rewritten only using
	functions from $cal(F')$:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ P or Q equiv not((not P) and (not Q)) $],
		[$ P => Q equiv not(P and (not Q)) $])

	However, this would make manipulating expressions much more cumbersome,
	which is why $cal(F) = {and, or, =>, not}$ is a much more convenient
	choice.
]

A good symbolic expression that solves the problem at hand is no
different than applying an evolutionary algorithm, constructing
a random initial population of symbolic expressions. Such expressions
are encoded as parse trees, since from an algorithmic standpoint they
are much easier to manipulate than, say, bare strings, especially for
computing its fitness.

The fitness of each parse tree (of each symbolic expression) is evaluated
by a fitness function. The fitness of a symbolic expression represents how
well the genetic program maps the inputs to the expected output, or how
many inputs are mapped correctly. The symbolic expressions with higher
fitness will (tend to) mutate and produce offspring applying genetic
operators, the symbolic expressions with lower fitness will (tend to) die
out in the generations.

Randomly generating chromosomes for genetic programming has to be done
with caution, since it must abide by the rules defined in the grammar.
An ill-defined parse tree is a waste at best and a source of defective
offspring at worst. The best and simplest course of action to follow
the (naturally) recursive definition for well-formed formulas. To make
sure that the procedure terminates, one could set a maximum number of
nodes of the parse tree and/or a maximum depth; when such threshold is
reached, all remaining branches are closed with terminal symbols, and
aren't expanded further.

#pseudocode(
	title: "GP-Initialize-Grow",
	parameters: ([$d$], [$d_("max")$],),
	content: [
		if $(d = 0)$ #i \
			$n <-$ a random function sampled from $cal(F)$ #d #comment[Avoid single-term expressions] \
		else if $(d gt.eq d_("max"))$ #i \
			$n <-$ a random term sampled from $cal(T)$ #comment[Close branch when] \
			#d #comment[maximum size is reached] \
		else #i \
			$n <-$ a random element sampled from $cal(T) union cal(F)$ #d #comment[Open branch] \
		foreach $c$ in arguments of $n$ #i \
			$c <-$ #smallcaps("GP-Initialize-Grow") ($d + 1, d_("max")$) #d #comment[Expand branches recursively] \
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
			$n <-$ a random term sampled from $cal(T)$ #comment[Close branch when] \
			#d #comment[maximum size is reached] \
		else #i \
			$n <-$ a random element sampled from $cal(F)$ #comment[Always start with a function] \
			#d #comment[So that max size is always reached] \
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

Editing can be incorporated in the application of the genetic
operators themselves (mutation and/or crossover), in order to
obtain genetic operators that don't generate introns, hence
reducing the number of wasterful computations. One example is
*brood recombination*: brood recombination creates many children
from the same two parents by applying a crossover operator with
different parameters. Only the best child of the brood enters
the next generation. This method is particularly useful if
combined with a fitness penalty, because then it favors children
that achieve the same result with less complex chromosomes.

Another operator is *intelligent recombination*, a form of
recombination that chooses the crossover points selectively
in such a way to prevent, or at least to mitigate, the creation
of introns. A third method consists in introducing slight changes
in the evaluation function such that what are considered introns
now can be "reactived", in the sense that the newly modified
fitness function assigns a nonzero weight to that subtree,
potentially leading to its elimination.

All these forms of intron prevention are still quite expensive, and
rely on using ad-hoc genetic operators. In general, the cost of
introducing intron prevention outweights its benefits, and is not
worth it. It is actually much more common to keep the introns in
the parse trees of the population, even if this reduces performance,
and only prune the parse tree of the best solution found at the end
of the process.

=== Applying genetic programming: the $n times 1$ multiplexor problem

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

#figure(
	caption: [On the left, a schematic representation of a $2 times 1$
	          multiplexor. On the right, the corresponding truth table.],
	[#grid(
		columns: (0.5fr, 0.5fr),
		[#cetz.canvas({
			import cetz.draw: *
			set-style(
				content: (padding: 3pt),
				stroke: (thickness: 1.5pt),
			)

			line((0, 0), (1, 1), (1, 3), (0, 4), (0, 0), fill: aqua, close: true)
			line((-1, 1), (0, 1))
			line((-1, 3), (0, 3))
			line((1, 2), (2, 2))
			line((0.5, -0.5), (0.5, 0.5))

			content((-1, 1), $I_(1)$, anchor: "east")
			content((-1, 3), $I_(2)$, anchor: "east")
			content((2, 2), $O_(1)$, anchor: "west")
			content((0.5, -0.5), $S_(1)$, anchor: "north")
		})],
		[#table(columns: (auto, auto, auto, auto),
		        table.header([*Selector*], [*Input 1*], [*Input 2*], [*Output*]),
		        [$0$], [$0$], [$0$], [$0$],
		        [$0$], [$0$], [$1$], [$0$],
		        [$0$], [$1$], [$0$], [$1$],
		        [$0$], [$1$], [$1$], [$1$],
		        [$1$], [$0$], [$0$], [$0$],
		        [$1$], [$0$], [$1$], [$1$],
		        [$1$], [$1$], [$0$], [$0$],
		        [$1$], [$1$], [$1$], [$1$])]
	)]
)

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
