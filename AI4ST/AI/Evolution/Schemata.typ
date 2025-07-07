#import "../AI_definitions.typ": *

*Genetic algorithms* are a class of evolutionary algorithms having
solutions encoded as binary strings and where the solutions lack any
high-level structure or semantic. That is, what the binary strings
actually represent and what constraint such representation were to
entail are irrelevant #footnote[Technically speaking, any evolutionary
algorithm, when run on a computer, must be encoded as binary objects,
since computers store information in binary format. The difference
between any evolutionary algorithm and a genetic algorithm is that
the former manipulates bit strings directly as part of its definition.].
The term genetic algorithm bears its name from the structure of DNA,
the most basic component of life, since it's described entirely by
just four nucleotides: A, C, G, T.

#algo(
	title: "Generic-Genetic-Algorithm",
	parameters: ([$f : RR^(n) -> RR$: function, $mu$: integer (population size),
	              $p_(x), p_(m)$: real, $epsilon$: termination criteria],),
	stroke: 0pt,
	indent-guides: 1pt + gray,
	fill: none,
	[
		pop #math.arrow.l a random sequence of $mu$ bit strings \
		for $i in {1, dots, mu}$ #i \
			pop[i].fitness #math.arrow.l $f$(pop[i]) #d \
		do #i \
			chosen #math.arrow.l select $mu$ individuals from pop with roulette wheel selection \
			newpop $<- emptyset$ \
			for $i in {1, dots, mu slash 2}$ #i \
				$u <-$ a value sampled from $U ∼ (0, 1)$ \
				if ($u lt.eq p_(x)$) #i \
					#smallcaps("One-Point-Crossover") (chosen[2i - 1], chosen[2i]) #d \
				#smallcaps("Bit-Mutation") (chosen[2i - 1], $p_(m)$) \
				#smallcaps("Bit-Mutation") (chosen[2i], $p_(m)$) \
				newpop #math.arrow.l newpop $union$ {chosen[2i - 1], chosen[2i]} #d \
			pop #math.arrow.l newpop \
			for $i in {1, dots, mu}$ #i \
				pop[i].fitness #math.arrow.l $f$(pop[i]) #d#d \
		while(not($epsilon$)) \
		best #math.arrow.l pop[0] \
		for $i in {1, dots, mu}$ #i \
			if (pop[i].fitness > best.fitness) #i \
				best #math.arrow.l pop[i] #d#d \
		return best
	]
)

Genetic algorithms are much simpler than evolutionary algorithms, infact so
approachable that it's relatively straightforward to prove their convergence.
That is, it is possible to give a mathematical proof of the fact that,
after an arbitrary number of iterations and for a certain set of chosen
parameters, a genetic algorithm will certainly yield an optimal solution.

Without loss of generality, it can be assumed that the genetic operators
and the selection method used in any genetic algorithms are the ones found
above, roulette-wheel selection and bit-mutation. To simplify even further,
it can be assumed that the population size $mu$ is always an even number,
so that the population can be split in two without one remaining, and that
the chromosomes have a fixed length $L$.

A *schema* $h$ is a string of $L$ characters over the alphabet ${0, 1,
*}$, that is $h in {0, 1, *}^(L)$. A binary chromosome $c in {0, 1}^(L)$
is said to *match* a schema $h$, written as $c lt.tri h$, if each
of its characters is equal to the character in $h$ occupying the same
position. A chromosome $c$ that does not match a schema $h$ is written
as $c lt.tri.not h$. The $*$ character, called the *wildcard symbol*,
is always equal to both $0$ and $1$.

#exercise[
	Consider the schema $h =$ `**0*11*10*` and the two chromosomes $c_(1) =$
	`1100111100` and $c_(2) =$ `1111111111`. Do the two match the schema?
]
#solution[
	$c_(1)$ matches $h$, since all $0$s and $1$s are in the same position
	in both. $c_(2)$ does not match $h$ since, for example, the third bit
	of $c_(2)$ is $1$ while the third bit of $h$ is $0$.
]

The number of all possible (binary) chromosomes is $2^(L)$, whereas the
number of all possible schemata is $3^(L)$. Every chromosome matches:

$ sum_(i = 0)^(L) binom(L, i) = sum_(i = 0)^(L) frac(L!, (L - i)! i!) =
  frac(L!, (L - 0)! 0!) + frac(L!, (L - 1)! 1!) + dots + frac(L!, (L - L)! L!) =
  2^(L) $

distinct schemata. This is because taking any schemata that matches the
chromosome and exchanging an arbitrary number of bits with '$*$' returns
a schemata that is still matched. This means that observing a single
chromosome corresponds to observing many more schemata at the same time.

From the schemata matches by a single chromosome, the interest is in
finding how many schemata are matched, on average, by and entire population.
In principle, a population of size $mu$ could match $mu 2^(L)$ distinct
schemata, but the actual number of matched schemata is much smaller, since
many chromosomes might actually be duplicates.

In order to carry out our plan of tracking the evolution of chromosomes
that match a schema, one has to examine how selection and applying genetic
operators influence these chromosomes. This is done in three steps. In the
first step, the analysis focuses on the effect of selection, in the second
step the effect of one-point crossover, and in the third step the effect of
bit mutation. The transition from a population at time $t$ to the next
generation at time $t + 1$ can be split into four steps:

- The starting population itself, at time $t$;
- The starting population after applying selection, at time $t + Delta t_(s)$;
- The starting population after applying selection and crossover, at time
  $t + Delta t_(s) + Delta t_(x)$;
- The starting population after applying selection, crossover and mutation,
  at time $t + Delta t_(s) + Delta t_(x) + Delta t_(m)$. After applying
  selection, crossover and mutation the starting population has become the
  new generation, therefore $t + Delta t_(s) + Delta t_(x) + Delta t_(m) =
  t + 1$.

The expected number of chromosomes by a population at time $t$ that
match a schema $h$ is denoted as $N(h, t)$. The interest is in finding
the relationship between $N(h, t)$ and $N(h, t + 1)$, that is, how
evolving a population across the generations changes (on average) the
number of chromosomes that match a certain schema.

The first step involves considering the effect of selection on the
number of chromosomes that match a schema. Recall that the expected
number of offspring generated by a chromosome $s$ in a population
$mu$ with roulette-wheel selection as selection method is $mu dot
f_("rel")(s)$. In particular, this also means that each chromosome
$s$ that matches $h$ will have an average offspring size of $mu dot
f_("rel")(s)$. Therefore:

$ N(h, t + Delta t_(s)) = sum_(s in P(t), s lt.tri h) mu dot f_("rel")^((t))(s) $

Where the apex $t$ denotes that the number of offspring of $s$ depends on
which iteration is considered.

Expressing this number as a sum of contributions of the individual
chromosomes can be misleading. For this reason, it is preferable to
rewrite the expression as:

$ N(h, t + Delta t_(s)) =
  mu sum_(s in P(t), s lt.tri h) f_("rel")^((t))(s) =
  (mu N(h, t)) frac(sum_(s in P(t), s lt.tri h) f_("rel")^((t))(s), N(h, t)) =
  mu N(h, t) f_("rel")^((t))(h) $

Where $f_("rel")^((t))(h)$ is called *mean relative fitness*. Substituting
the explicit expression for the relative fitness in $mu f_("rel")^((t))(h)$
gives:

$ mu f_("rel")^((t))(h) &=
  mu (frac(sum_(s in P(t), s lt.tri h) f_("rel")^((t))(s), N(h, t))) =
  mu (frac(sum_(s in P(t), s lt.tri h) frac(f_("abs")(s), sum_(s' in P(t)) f_("abs")(s')), N(h, t))) =
  frac(mu (sum_(s in P(t), s lt.tri h) f_("abs")(s)), N(h, t) (sum_(s' in P(t)) f_("abs")(s'))) = \
  &= frac(frac(sum_(s in P(t), s lt.tri h) f_("abs")(s), N(h, t)), frac(sum_(s' in P(t)) f_("abs")(s'), mu)) =
  frac(overline(f_(t)(h)), overline(f_(t))) $

$overline(f_(t)(h))$, the ratio of all the fitness contributions of the
chromosome that match $h$ in generation $t$ and the expected number of
chromosomes that match $h$ in generation $t$ is the mean fitness of the
chromosomes that match $h$ in generation $t$. $overline(f_(t))$, the ratio
of all the fitness contributions of the chromosome of generation $t$ and
the size of the population is simply the mean fitness of all chromosomes
in generation $t$.

The expected number of chromosomes that match $h$ in generation $t$ can
therefore be written as:

$ N(h, t + Delta t_(s)) =
  N(h, t) mu f_("rel")^((t))(h) =
  N(h, t) frac(overline(f_(t)(h)), overline(f_(t))) $

The second step involves considering the effect of genetic operators on
the number of chromosomes that match a schema. Since the genetic operator
under consideration is one-point-crossover, this entails finding the
probability that applying one-point-crossover to chromosomes that match
$h$ results in chromosomes that still match $h$.

More specifically, consider two chromosomes $c_(1)$ and $c_(2)$ and a
schema $h$. Suppose that $c_(1)$ matches $h$, and that one-point-crossover
is applied obtaining two new chromosomes $c_(1)'$ and $c_(2)'$. If
$c_(1)'$ has inherited from $c_(1)$ the exact same bits that correspond
to non-wildcard bits in $h$, then there's guarantee that $c_(1)'$ will
also match $h$, no matter which bits are inherited from $c_(2)$.

#exercise[
	Consider the schema $h =$ `***0*1*1**` and the two chromosomes
	$c_(1) =$ `0000011111` and $c_(2) =$ `1111100000`. Do they match
	the schema? If one-point-crossover is applied with cutoff point
	$5$, do the resulting chromosomes match the schema? And with cutoff
	point $3$?
]
#solution[
	$c_(1)$ matches the schema while $c_(2)$ does not (due to a
	mismatch in the fourth position). With cutoff point $5$, the
	resulting chromosomes are $c_(1)' =$ `1111111111` and $c_(2)' =$
	`0000000000`; neither match the schema. With cutoff point $3$,
	the resulting chromosomes are $c_(1)' =$ `1110011111` and $c_(2)' =$
	`0001100000`; the first matches the schema, the second doesn't.
	Notice how choosing cutoff point $3$ preserves all the bits in
	$c_(1)$ that correspond to non-wildcard bits in $h$, hence $c_(1)'$
	was guaranteed to match $h$.
]

On the other hand, if $c_(1)'$ does not inherit from $c_(1)$ the exact
same bits corresponding to non-wildcards in $h$, then there's still a
chance for $c_(1)'$ to match $h$, even though there's no guarantee. In
particular, this happens if the bits inherited from $c_(2)$ are equal
to the corresponding bits in $h$. It is also entirely possible for two
chromosome that don't match a schema to generate a chromosome that matches
the schema, if the two parent chromosomes partially match a schema and the
two partial matches are combined into a complete match.

#exercise[
	Consider the schema $h =$ `***0*1*1**` and the two chromosomes
	$c_(1) =$ `0001011111` and $c_(2) =$ `1110100100`. Do they match
	the schema? If one-point-crossover is applied with cutoff point
	$5$, do the resulting chromosomes match the schema? Consider the
	two chromosomes $c_(2)$ and $c_(3) =$ `0000011111`. Do they match
	the schema? If one-point-crossover is applied with cutoff point
	$5$, do the resulting chromosomes match the schema?
]
#solution[
	Neither $c_(1)$ or $c_(2)$ match the schema. With cutoff point $5$,
	the resulting chromosomes are $c_(1)' =$ `1110111111` and $c_(2)' =$
	`0001000100`; the first matches the schema, the second doesn't. On
	the other hand, $c_(3)$ matches the schema, while $c_(2)$ does not.
	With cutoff point $5$, the resulting chromosomes are $c_(3)' =$
	`1110111111` and $c_(2)' =$ `0000000100`; the first matches the
	schema, the second doesn't.
]

For this reason, it becomes evident that the choice of the cutoff
point has great influence on whether the resulting chromosomes will
match or not match the schema matched by their parents. In particular,
the critical subsection of a chromosome is the one that does not correspond
to wildcard bits in the schema. It is then useful to introduce a quantity
called *defining length* of a schema $h$, denoted as $"deflen"(h)$, defined
as the difference between the position of the last and the first non-wilcard
element of $h$.

#exercise[
	What is the defining length of $h =$ `**0*11*10*`?
]
#solution[
	The first non-wilcard bit of $h$ is a $0$ in the third position,
	whereas the last non-wildcard bit of $h$ is a $0$ in the ninth
	position. Therefore $"deflen"(h) = 9 - 3 = 6$.
]

The defining lenght of a schema determines which choices of the cutoff
points are "safe", meaning that they guarantee that a matching parent
will produce a matching childer. In particular, any choice of the cutoff
point between $1$ and $"deflen"(h) - 1$ and between $"deflen"(h)$ and
$L - 1$ is safe, since they are constituted exclusively by wildcards
that will match anyway. Since in one-point-crossover all choices of cutoff
point are equally likely, the probability that the chosen cutoff point
is not "safe" is $frac("deflen"(h), L - 1)$, and the probability that the
chosen cutoff point is "safe" is $1 - frac("deflen"(h), L - 1)$.

Summing up, to derive an expression of $N(h, t + Delta t_(s) + Delta t_(x))$
it is necessary to consider four possibilities:

- A chromosome does not undergo crossover, therefore its matching status
  with respect to the schema is the same;
- A chromosome does undergo crossover, and the cutoff point lies in such
  a way that all non-wildcard characters are transfered to the offspring,
  hence the matching status of the parent is itself inherited by the
  offspring;
- A chromosome does undergo crossover, and the cutoff point lies in
  such a way that only some non-wildcard characters are transfered to
  the offspring, but not all of them. However, the resulting chromosome
  still matches the schema, because the subchromosome inherited by the
  other parent also happens to match the subschema;
- A chromosome does undergo crossover, and even though both parents do
  not match a schema their offspring does because their partial matches
  are combined.

Let $p_(x)$ be the probability that a chromosome will undergo crossover
(the same for all chromosomes), and let $p_("loss")$ be the probability
that a chromosome that matches $h$ undergoes crossover and turns into a
chromosome that does not match $h$ anymore. The four quantities above
are combined as follows:

$ N(h, t + Delta t_(s) + Delta t_(x)) = A + B + C =
  underbrace((1 - p_(x)) N(h, t + Delta t_(s)), A) +
  underbrace(p_(x) N(h, t + Delta t_(s)) (1 - p_("loss")), B) + C $

Where:

- $A$ is the expected number of chromosomes that matched $h$ and do not
  undergo crossover, hence will certainly still match $h$;
- $B$ is the expected number of chromosomes that matched $h$, underwent
  crossover and whose resulting offspring manages to match $h$;
- $C$ is the expected number of chromosomes that did not match $h$ before
  crossover but whose offspring does.

Of course, it is impossible to know $C$ with the data at hand. Therefore,
a closed form expression for $N(h, t + Delta t_(s) + Delta t_(x))$ cannot
be obtained, but it's still possible to find a lower bound (being $C$
positive, $A + B + C lt.eq A + B$).

The next step is finding an expression for $p_("loss")$. As stated above,
a chromosome can result in a mismatch after applying one-point-crossover
either if the cutoff point is not "safe", even though the opposite is not
necessarely true, since an "unsafe" cut can still result in chromosomes
that match. Therefore, $p_("loss")$ is given by the difference between
two probabilities, $p_("unsafe")$ and $p_("manage")$, representing the two
hereby described situations. Since $p_("manage")$ is close to impossible to
estimate, it is again necessary to resort to an upper bound of $p_("loss")$
and compute just $p_("unsafe")$.

A loss of a match is possible if two conditions are satisfied at the same
time: the cut is "unsafe" (obviously) and the second parent does not match
the schema. The upper bound for $p_("loss")$ is therefore:

$ p_("loss") = p_("unsafe") - p_("manage") =>
  p_("loss") lt.eq p_("unsafe") =>
  p_("loss") lt.eq frac("deflen"(h), L - 1) dot (1 - frac(N(h, t + Delta t_(s)), mu)) $

Where the two product terms correspond to the probabilities of the two
conditions discussed above. Plugging this expression in the previous
equation:

$ N(h, t + Delta t_(s) + Delta t_(x)) & gt.eq (1 - p_(x)) N(h, t + Delta t_(s)) +
  p_(x) N(h, t + Delta t_(s)) (1 - p_("loss")) \
  & = (1 - p_(x)) N(h, t + Delta t_(s)) + p_(x) N(h, t + Delta t_(s)) (1 - frac("deflen"(h), L - 1) (1 - frac(N(h, t + Delta t_(s)), mu))) \
  & = N(h, t + Delta t_(s)) (1 - p_(x) + p_(x) (1 - frac("deflen"(h), L - 1) (1 - frac(N(h, t + Delta t_(s)), mu)))) \
  & = N(h, t + Delta t_(s)) (1 - cancel(p_(x)) + cancel(p_(x)) - p_(x) frac("deflen"(h), L - 1) (1 - frac(N(h, t + Delta t_(s)), mu))) \
  & = N(h, t) frac(overline(f_(t)(h)), overline(f_(t))) (1 - p_(x) frac("deflen"(h), L - 1) (1 - frac(N(h, t) frac(overline(f_(t)(h)), overline(f_(t))), mu))) \
  & = N(h, t) frac(overline(f_(t)(h)), overline(f_(t))) (1 - p_(x) frac("deflen"(h), L - 1) (1 - frac(N(h, t), mu) frac(overline(f_(t)(h)), overline(f_(t))))) $

Note the presence of an inequality instead of an equality, since the $C$
term was neglected and for $p_("loss")$ an upper bound was computed.

The third step involves considering the effect of mutations on the number
of chromosomes that match a schema. Clearly, flipping a bit that is paired
to a non-wildcard character in a schema reverses the matching status. On
the other hand, flipping a bit that is paired to a wildcard character in
a schema has no effect on the matching status.

Therefore, a chromosome matching a schema that undergoes mutation will
maintain its mutation status if and only if all of its flipped bits are
those paired to wildcard characters of the schema. Equivalently, a chromosome
preserves its matching status after mutation if and only if no bits that are
paired to non-wildcard characters are flipped. Since all bit flips happen
independently of the others, the probability of preserving matching status
after mutation is $(1 - p_(m))^("ord"(h))$, where $p_(m)$ is the probability
of one bit to be flipped and $"ord"(h)$, called the *order* of the schema,
is the number of non-wildcard characters of $h$.

The expression of $N(h, t + Delta t_(s) + Delta t_(x) + Delta t_(m))$
can therefore be written as:

$ N(h, t + Delta t_(s) + Delta t_(x) + Delta t_(m)) =
  N(h, t + 1) = N(h, t + Delta t_(s) + Delta t_(x)) (1 - p_(m))^("ord"(h)) $

Substituting the explicit expression for $N(h, t + Delta t_(s) +
Delta t_(x))$, one gets the so-called *schema theorem*:

$ N(h, t + 1) gt.eq N(h, t) underbrace(frac(overline(f_(t)(h)), overline(f_(t)))
                    (1 - p_(x) frac("deflen"(h), L - 1) (1 - frac(N(h, t), mu) frac(overline(f_(t)(h)), overline(f_(t)))))
                    (1 - p_(m))^("ord"(h)), g(h, t)) $

The schema theorem states that the average number of chromosomes that
matches a certain schema $h$ is multiplied by a factor of $g(h, t)$ at
every generation. If $g(h, t)$ is greater than $1$, the average number
of matching chromosomes will increase, if $g(h, t)$ is smaller than
$1$, the average number of matching chromosomes will decrease. Being
the population size constant, the number of matching chromosomes cannot
decrease for all schemata, since at least one schema must be matched by
an individual of the population. Therefore, there's at least one schema
that increases the number of matching chromosomes after each generation.

The importance of the schema theorem lies in the fact that it can be
exploited to find for which schemata $g(h, t)$ grows particularly
quickly. This is because the size of $g(h, t)$ corresponds to the
amount of chromosome "chunks" that are inspected, and in turn an high
value of $g(h, t)$ corresponds to an effective exploration of the search
space.

The expression of $g(h, t)$ is constituted by a product of three terms,
therefore an high value of $g(h, t)$ is obtained when all three terms
are high as well. In particular:

- The term on the left is a fraction, and the dependence on $h$ is in
  the numerator. Therefore, the numerator should be high;
- The term in the middle is a polynomial, where the dependence on $h$
  is found as numerator of three fractions. Therefore, the numerators
  should be high;
- The term on the right is an exponentiation of a number between $0$ and
  $1$ and the dependence on $h$ is in the exponent, therefore the exponent
  should be small.

Summing up, valuable schemata should have: high mean fitness, small defining
length and low order. Such schemata are also called *building blocks*, due
to which the schema theorem is sometimes also referred to as the *building
block hypothesis*: the evolutionary search focuses on promising building
blocks of solution candidates.

It should be noted that the schema theorem is an oversimplification, since
many details are not taken into account. For example, it does not consider
epistasis, where a gene expression is blocked by another, but assumes all
genes to be mostly independent. Also, $N(h, t)$ refers to the average number
of matching chromosomes, meaning that the theorem is valid only if the
population size is very large (close to infinity, that is). Finally,
$N(h, t)$ does not depend only on the schema $h$, but also on the time $t$,
hence drawing conclusions from a single generation shift to any generation
shift is questionable.
