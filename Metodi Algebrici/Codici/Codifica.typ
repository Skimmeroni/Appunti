#import "../Metodi_defs.typ": *

*Codificare* un messaggio consiste semplicemente nell'associare ad
un vettore $m in Z_(p)^(k)$ (il messaggio in chiaro) una parola in
$C subset.eq ZZ_(p)^(k)$ (il messaggio cifrato). La codifica di $m$
rispetto ad una matrice generatrice $G$ é data da $m G$, che come
giá visto appartiene a $C$.

D'altro canto, *decodificare* un messaggio consiste nel ricostruire
a ritroso $m in Z_(p)^(k)$ a partire dalla parola in $C subset.eq
ZZ_(p)^(k)$ associata. Si noti come debba venire anche messa in
conto la possibilitá che si siano verificati degli errori durante
la trasmissione, pertanto per determinare quale sia la parola in
$C$ associata ad $m$ non basta svolgere il prodotto matriciale
all'inverso. Si costruisca pertanto una matrice come segue:

#line(length: 100%)
+ Si inizializzi una matrice (vuota) $Sigma = (sigma_(i,j))$;
+ Si inizializzi un insieme $Delta$ al valore $ZZ_(p)^(n) - C$;
+ Si inizializzi un indice $i$ al valore $1$;
+ Si inseriscano nella prima riga di $Sigma$ le parole di $C$.
  La parola nulla (che é sempre presente in qualsiasi $C$) deve
  essere obbligatoriamente posta in $sigma_(1, 1)$, mentre le
  altre parole possono essere inserite in ordine qualsiasi.
+ Si ponga in $sigma_(i, 1)$ una qualsiasi delle parole di
  $ZZ_(p)^(n)$ che hanno peso minimo tra le parole di $Delta$;
+ In ciascuna cella $sigma_(i, j)$ con $0 lt.eq j lt.eq n$ si
  inserisca la parola $sigma_(i, 1) + sigma_(1, j)$;
+ Si sostituisca $Delta$ con $Delta - {sigma_(i, j) : 0 lt.eq j lt.eq n}$;
+ Se $Delta$ non é l'insieme vuoto, $i$ viene incrementato di $1$
  e l'algoritmo riprende dal punto 5, altrimenti termina.
#line(length: 100%)

Quando viene ricevuta la parola $y in ZZ_(p)^(n)$, tale parola viene corretta
con la parola di $C$ che in $Sigma$ appartiene alla stessa colonna di $y$.

#example[
	Sia $C in ZZ_(2)^(4) = {0000, 1110, 1011, 0101}$ un codice, e sia
	$y = 1111$ la parola da decodificare (e correggere). Si costruisca
	una matrice $Sigma$ come presentato nell'algoritmo. Si ha:

	$ Delta = ZZ_(2)^(4) - C = {0001, 0010, 0100, 1000, 1001, 1010, 1100,
	  0110, 0011, 1101, 0111, 1111} $

	La prima riga é data dalle parole di $C$, ponendo $sigma_(1,1) = 0000$
	e disponendo le altre a piacere. Siano queste disposte ordinatamente
	come $1011, 0101, 1110$.

	Per quanto riguarda la seconda riga, si osservi come le parole in
	$Delta$ con distanza minima sono $0001$, $0010$, $0100$ e $1000$.
	Si scelga $1000$. Si ha quindi che le parole della seconda riga
	sono, ordinatamente:

	#set math.mat(column-gap: 2em)
	$ mat(
	  1000 + 0000 = 1000,
	  1000 + 1011 = 0011,
	  1000 + 0101 = 1101,
	  1000 + 1110 = 0110
	) $

	Si ha poi $Delta := Delta - {1000, 0011, 1101, 0110} =
	{0001, 0010, 0100, 1001, 1010, 1100, 0111, 1111}$

	Per quanto riguarda la terza riga, si osservi come le parole in
	$Delta$ con distanza minima sono $0001$, $0010$, $0100$. Si scelga
	$0100$. Si ha quindi che le parole della terza riga sono, ordinatamente:

	$ mat(
	  0100 + 0000 = 0100,
	  0100 + 1011 = 1111,
	  0100 + 0101 = 0001,
	  0100 + 1110 = 1010
	) $

	Si ha poi $Delta := Delta - {0100, 1111, 0001, 1010} =
	{0010, 1001, 0111, 1100}$

	Per quanto riguarda la quarta riga, si osservi come la parola in
	$Delta$ con distanza minima é $0010$. Si ha quindi che le parole
	della quarta riga sono, ordinatamente:

	$ mat(
	  0010 + 0000 = 0010,
	  0010 + 1011 = 1001,
	  0010 + 0101 = 0111,
	  0010 + 1110 = 1100
	) $

	Si ha poi $Delta := Delta - {0010, 1001, 1100, 0111} = {}$, e
	l'algoritmo termina. La matrice risultante é:

	#set math.mat(column-gap: 1em)
	$ mat(
		0000, 1011, 0101, 1110;
		1000, 0011, 1101, 0110;
		0100, 1111, 0001, 1010;
		0010, 1001, 0111, 1100;
	) $

	Trovandosi $y$ nella seconda colonna, questa viene corretta con $1011$.
]

Siano $C_(1)$ e $C_(2)$ due codici lineari in $ZZ_(p)^(n)$ di stessa
dimensione. Si dice che $C_(1)$ e $C_(2)$ sono *equivalenti* se è possibile
ottenere tutte le parole di uno a partire da quelle dell'altro applicando:

+ Una permutazione delle posizioni $1, 2, ..., n$ a tutte le parole;
+ La moltiplicazione dei simboli che compaiono in una data posizione
  per un elemento non nullo $lambda in ZZ_(p)$ a tutte le parole;

Di conseguenza, due matrici generatrici $G_(1)$ e $G_(2)$ in $"Mat"(k
times n, ZZ_(p))$ danno luogo a due codici lineari equivalenti se una
delle due può essere ottenuta dall'altra tramite un numero finito delle
seguenti operazioni:

+ Scambiare due righe;
+ Moltiplicare gli elementi di una riga per un elemento non nullo di
  $ZZ_(p)$;
+ Sommare a una riga un'altra riga moltiplicata per un elemento non
  nullo di $ZZ_(p)$;
+ Permutare le colonne;
+ Moltiplicare gli elementi di una colonna per un elemento non nullo
  di $ZZ_(p)$.

Dove le prime tre operazioni corrispondono a cambiare la base del codice
mentre le ultime due corrispondono alle operazioni nella definizione di
codici equivalenti.

Sia $C subset.eq ZZ_(p)^(n)$ un codice lineare di dimensione $k$. Dato
che esistono diverse matrici che generano $C$, é ragionevole sceglierne
una che renda i calcoli piú agevoli possibili. In particolare, si
consideri la matrice del tipo:

$ S = mat(
	1, 0, dots, 0,
	Lambda_(1, k + 1), Lambda_(1, k + 2), dots, Lambda_(1, k + n);
	0, 1, dots, 0,
	Lambda_(2, k + 1), Lambda_(2, k + 2), dots, Lambda_(2, k + n);
	dots.v, dots, dots.down, dots.v, dots.v, dots, dots.down, dots.v;
	0, 0, dots, 1,
	Lambda_(k, k + 1), Lambda_(k, k + 2), dots, Lambda_(k, k + n);
  ) $

Per indicare una matrice in questa forma, detta *forma standard*,
si usa la notazione $S = (I_(k) | A)$.

Per convincersi che le matrici in forma standard sono effettivamente
vantaggiose, si osservi come:

$ m S &= mat(m_(1), m_(2), dots, m_(k)) mat(
	  1, 0, dots, 0,
	  Lambda_(1, k + 1), Lambda_(1, k + 2), dots, Lambda_(1, k + n);
	  0, 1, dots, 0,
	  Lambda_(2, k + 1), Lambda_(2, k + 2), dots, Lambda_(2, k + n);
	  dots.v, dots, dots.down, dots.v, dots.v, dots, dots.down, dots.v;
	  0, 0, dots, 1,
	  Lambda_(k, k + 1), Lambda_(k, k + 2), dots, Lambda_(k, k + n);
	  ) = \
	  &= mat(m_(1), m_(2), dots, m_(k),
	  sum_(i = 1)^(k) m_(i) Lambda_(i, k + 1), dots,
	  sum_(i = 1)^(k) m_(i) Lambda_(i, k + n)) $

Ovvero, dove le prime $k$ componenti della codifica coincidono con i primi
$k$ elementi del messaggio originale e la ridondanza è tutta nelle ultime
componenti. Dunque se nella trasmissione non occorrono errori la parola
ricevuta viene facilmente decodificata: basta considerare le prime $k$
componenti per ottenere $m$.
