#import "../Metodi_defs.typ": *

Calcolare $a^(m) mod n$ "a mano" puó richiedere molto tempo, specialmente
se i numeri in questione sono molto grandi. É peró possibile velocizzare
il procedimento impiegando il *metodo dei quadrati ripetuti*, di seguito
discusso.

Si scriva l'esponente $m$ in base due, ottenendo $m = sum_(i = 0)^(k - 1)
d_(i) 2^(i)$, dove ciascun $d_(i)$ é la $i$-esima cifra della rappresentazione.
Si costruisca poi una tabella come quella seguente:

$ mat(
	space,   c_(0) & = 1;
	d_(k - 1), c_(1) & equiv c_(0)^(2) dot a^(d_(k - 1)) mod n;
	d_(k - 2), c_(2) & equiv c_(1)^(2) dot a^(d_(k - 2)) mod n;
	dots.v, & dots.v ;
	d_(1),     c_(k - 1) & equiv c_(k - 2)^(2) dot a^(d_(1)) mod n;
	d_(0),     c_(k) & equiv c_(k - 1)^(2) dot a^(d_(0)) mod n;
	delim: "[",
	augment: #1
) $

Risulta $a^(m) equiv c_(k) mod n$.

#example[
	Si voglia calcolare $3^(90) mod 91$. Si ha $90_(10) = 1011010_(2)$. Si ha:

	$ mat(
		space, c_(0) & = 1;
		1, c_(1) & equiv 1^(2) dot 3^(1) = 3 mod 91;
		0, c_(2) & equiv 3^(2) dot 3^(0) = 9 mod 91;
		1, c_(3) & equiv 9^(2) dot 3^(1) = 273 equiv -30 mod 91;
		1, c_(4) & equiv (-30)^(2) dot 3^(1) = 2700 equiv -30 mod 91;
		0, c_(5) & equiv (-30)^(2) dot 3^(0) = 900 equiv -10 mod 91;
		1, c_(6) & equiv (-10)^(2) dot 3^(1) = 300 equiv 27 mod 91;
		0, c_(7) & equiv (27)^(2) dot 3^(0) = 729 equiv 1 mod 91;
		delim: "[",
		augment: #1
	) $

	Risulta $3^(90) equiv 1 mod 91$
]
