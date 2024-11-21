#import "../Stats4AI_definitions.typ": *

*Combinatorics* is an area of mathematics primarily concerned with counting,
that is the enumeration of the possible arrangements or configurations of
specified structures.

The most important building block of combinatorics is the *fundamental
principle of counting*. Consider an experiment having $n$ components,
with each $i$-th component having $x_(i)$ possible outcomes. The number
of outcomes of the experiment as a whole is given by:

$ product_(i = 1)^(n) x_(i) = x_(1) dot x_(2) dot (dots) dot x_(n) $

#exercise[
	Consider an experiment consisting in the toss of a coin followed
	by the roll of a die. How many outcomes does this experiment have?
]
#solution[
	A coin toss has two possible outcomes, while the roll of a die has
	six. Therefore, the experiment as a whole has $6 dot 2 = 12$ possible
	outcomes. Indeed:

	#grid(
		columns: (0.4fr, 0.6fr),
		[$ Omega_(1) = {H, T} $
		 $ Omega_(2) = {1, 2, 3, 4, 5, 6} $],
		[$ Omega = {{H, 1}, {T, 1}, {H, 2}, {T, 2}, {H, 3}, {T, 3}, \
				   {H, 4}, {T, 4}, {H, 5}, {T, 5}, {H, 6}, {T, 6}} $]
	)
]

Starting from the fundamental principle of counting, it is possible to
describe many common counting situations.

A *sequence with repetition* is a situation dealing with ordered sequences
of $k$ elements (possibly repeated) chosen among $n$, such that:

$ n dot n dot n dot (dots) dot n = n^(k) $

#exercise[
	What are the possible arrangements of birthdays of three people?
]
#solution[
	A year is consituted of $365$ days, so the birthdays of three people
	can be arranged in $365 dot 365 dot 365 = 365^(3) = 48627125$ possible
	ways.
]

A *sequence without repetition* is a situation dealing with ordered sequences
of $k$ elements (none repeated) chosen among $n$ with $k lt.eq n$, such that:

$ n dot (n - 1) dot (n - 2) dot (dots) dot (n - k + 1) = frac(n!, (n - k)!) $

#exercise[
	In how many ways is it possible to arrange the birthdays of $23$ people
	such that no two people have birthday the same day?
]
#solution[
$ frac(n!, (n - k)!) = frac(365!, (365 - 23)!) = frac(365!, 342!) =
  frac(365 dot 364 dot (dots) dot 344 dot 343 dot cancel(342!), cancel(342!))
  approx 4.22 times 10^(58) $
]

A *permutation* is a situation dealing with ordered sequences of $k$
elements (none repeated) chosen among $n$ with $k = n$, such that:

$ n dot (n - 1) dot (n - 2) dot (dots) dot 2 dot 1 = n! $

#exercise[
	In how many ways is it possible to arrange a deck of playing cards?
]
#solution[
	$ 52! = 52 dot 51 dot 50 dot (dots) dot 2 dot 1 approx 8.06 times 10^(67) $
]

A *combination* is a situation dealing with unordered sequences of $k$
elements (none repeated) chosen among $n$ with $k lt.eq n$, such that:

$ binom(n, k) = frac(n!, k! (n - k)!) =
  frac(n dot (n - 1) dot (n - 2) dot (dots) dot (n - k + 1), k!) $

#exercise[
	In how many ways is it possible to arrange $20$ people in groups of $4$?
]
#solution[
	This is a combination, since the ways each group is arranged is irrelevant:

	$ binom(20, 4) = frac(20!, 4! (20 - 4)!) = frac(20!, 4! dot 16!) =
	  frac(20 dot 19 dot 18 dot 17 dot cancel(16!), 4! dot cancel(16!)) =
	  frac(20 dot 19 dot 18 dot 17, 24) = frac(116280, 24) = 4845 $
]
