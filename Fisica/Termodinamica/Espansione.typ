#import "../Fisica_defs.typ": *

I corpi fisici, se la loro temperatura viene aumentata, aumentano anche
di lunghezza e di volume. Questo perché, essendo la temperatura legata
all'energia cinetica media degli atomi del corpo, un aumento dell'una
corrisponde ad un aumento dell'altra, e quindi gli atomi possono muoversi
piú lontano l'uno dagli altri. Questo fenomeno prende il nome di *espansione
termica*.

Si consideri un corpo unidimensionale di lunghezza $L_(i)$, inizialmente
a temperatura $T_(i)$. Si supponga di aumentarne la temperatura, passando
ad un nuovo valore $T_(f)$; la lunghezza aumenterá fino a raggiungere
un nuovo valore $L_(f)$. La differenza fra i due valori di lunghezza e la
differenza fra i due valori di temperatura sono due quantitá legate dalla
seguente equazione:

$ L_(f) - L_(i) = L_(i) alpha (T_(f) - T_(i)) =>
  Delta L = L_(i) alpha Delta T $

Dove $alpha$ é un coefficiente che prende il *coefficiente di espansione
lineare*. Tale coefficiente ha per unitá di misura $1 slash kelvin$ e
dipende dal materiale di cui il corpo é costituito. Sebbene il valore
del coefficiente dipenda dalla temperatura, per piccole variazioni é
possibile assimilare tale valore ad una costante.

Se ad un corpo tridimensionale viene aumentata la temperatura, tale
corpo subisce espansione termica lungo tutte e tre le dimensioni. É
pertanto possibile applicare l'equazione precedente a tutte e tre
le dimensioni separatamente, mantenendo la medesima temperatura e
la medesima costante $alpha$:

#grid(
	columns: (0.33fr, 0.33fr, 0.33fr),
	[$ Delta L_(x) = L_(i, x) alpha Delta T $],
	[$ Delta L_(y) = L_(i, y) alpha Delta T $],
	[$ Delta L_(z) = L_(i, z) alpha Delta T $]
)

Oltre all'espansione in lunghezza, i corpi fisici aumentano anche in
volume con l'aumento della temperatura. In particolare, per i corpi
allo stato liquido, questa espansione é l'unica di effettivo interesse,
perché i liquidi non hanno forma definita.

Si consideri un corpo di volume $V_(i)$, inizialmente a temperatura
$T_(i)$. Si supponga di aumentarne la temperatura, passando ad un
nuovo valore $T_(f)$; il volume aumenterá fino a raggiungere un nuovo
valore $V_(f)$. La differenza fra i due valori di volume e la differenza
fra i due valori di temperatura sono legate dalla seguente equazione:

$ V_(f) - V_(i) = V_(i) beta (T_(f) - T_(i)) =>
  Delta V = V_(i) beta Delta T $

Dove $beta$ é un coefficiente chiamato *coefficiente di espansione
volumetrica*. I due coefficienti $beta$ e $alpha$ sono legati dalla
seguente equazione:

$ beta = 3 alpha $
