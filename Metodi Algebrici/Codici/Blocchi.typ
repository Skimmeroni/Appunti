#import "../Metodi_defs.typ": *

Sia $A_(q) = {x_(1), x_(2), ..., x_(q)}$ un insieme finito di cardinalità
$q$, con $q gt.eq 2$. Prende il nome di *codice a blocchi* un qualunque
sottoinsieme non vuoto $C$ di $A_(q)^(n)$. In particolare:

- $A_(q)$ viene detto _alfabeto_ di $C$;
- $A_(q)^(n)$ viene detto _spazio delle parole_ di lunghezza $n$
  (nell'alfabeto $A_(q)$);
- Una *parola* del codice $C$ è una qualsiasi $n$-upla ordinata di
  simboli dell'alfabeto $A_(q)$;
- $n$ viene anche chiamata _lunghezza_ del codice;
- La cardinalità di $C$ viene chiamata _grandezza_ del codice.

La notazione matematica per le $n$-uple ordinate sarebbe $(x_(1), x_(2),
..., x_(n))$, ma per semplicitá verranno omesse sia le parentesi, sia le
virgole. Inoltre, spesso si ha $A_(q) = {0, 1}$, perché l'interesse
della trasmissione dei segnali é prettamente informatico.

#example[
	Si consideri l'alfabeto $A_(q) = {0, 1}$. Il codice $C$ sull'alfabeto
	$A_(q)$ riportato di seguito é di lunghezza $3$ e di grandezza (numero
	di parole) $3$:

	#grid(
		columns: (0.3fr, 0.7fr),
		[
			$ C = {001, 010, 100} $
		],
		[
			$ A^(3)_(q) = A_(q) times A_(q) times A_(q) =
			  {000, 001, 010, 011, 100, 101, 110, 111} $
		]
	)
]

Si supponga di aver inviato una parola $p = (x_(1), ..., x_(n))$ e di aver
ricevuto una parola $p' = (y_(1), ..., y_(n))$. Se queste differiscono,
allora significa che si é in presenza di un errore. Per semplicitá, si
considerino solamente errori di primo tipo, ovvero che uno o piú simboli
di $p$ non corrispondano ai rispettivi simboli in $p'$. Il numero di errori
verrá conteggiato in base al numero di coppie di simboli che differiscono
(una coppia di simboli diversi é un errore, due coppie di simboli diversi
sono due errori, ecc...). Si assuma inoltre che gli errori siano _eventi
indipendenti_, ovvero che se $x_(i) != y_(i)$ per una certa posizione $i$
questo non influenza il verificarsi di un errore in un'altra posizione
$j != i$.

Per misurare quanto $p$ e $p'$ sono "dissimili", é necessario introdurre
una misura di _distanza_. La forma di distanza maggiormente utilizzata in
questo contesto é la *distanza di Hamming*:

$ d: A_(q)^(n) times A_(q)^(n) |-> RR, space
  d(p, p') = |{i: x_(i) != y_(i)}| $

Ovvero, la distanza di Hamming é pari al numero di simboli delle due
parole nella stessa posizione che differiscono (a prescindere da quali
siano i simboli in questione). Dato che in questo contesto verrá sempre
usata la distanza di Hamming come forma di distanza, si sottointenderá
con il solo termine "distanza" la distanza di Hamming.

Essendo una distanza, la distanza di Hamming gode, per qualsiasi parola
sull'alfabeto $A_(q)$, delle seguenti quattro proprietá:

+ $d(p, p') = d(p', p)$;
+ $d(p, p') = 0$ se e soltanto se $p = p'$;
+ $d(p, p') gt.eq 0$;
+ É verificata la *disuguaglianza triangolare*, ovvero
  $d(p, p') lt.eq d(p, p'') + d(p'', p')$.

Dato un codice $C subset.eq A_(q)^(n)$, si dice *distanza minima* di $C$
il minimo delle distanze tra due parole distinte di $C$:

$ d(C) = min{d(p, p') : p, p' in C, p != p'} $

#example[
	Sia $A_(2) = {0, 1}$ un alfabeto. Sia poi $C = {000, 001, 010, 100,
	111}$ un codice su $A_(2)$ di lunghezza $3$. Le distanze fra ciascuna
	coppia di parole di $C$, escludendo le coppie ripetute e le distanze
	fra ciascuna parola e sé stessa, sono:

	#set math.mat(delim:none, column-gap: 1.5em)
	$ mat(
		d(000, 001) = 1, d(000, 010) = 1, d(000, 100) = 1, d(000, 111) = 3,
		d(001, 010) = 2; d(001, 100) = 2, d(001, 111) = 2, d(010, 100) = 2,
		d(010, 111) = 2, d(100, 111) = 2
	) $

	Pertanto, $d(C) = 1$.
]

Si assuma che due entitá abbiano a disposizione il medesimo codice, e
che l'una invii all'altra una parola. Si supponga che tale parola ricevuta
non sia presente nel codice; se ne deduce che questa sia stata danneggiata
durante la trasmissione. La parola che é ragionevole assumere sia stata
inviata in origine é quella presente nel codice che maggiormente somiglia
a quella ricevuta, fintanto che la differenza fra le due é sufficientemente
piccola. Tale principio viene detto *principio di massima verosimiglianza*.

Si supponga di avere a disposizione un codice $C$ e di aver ricevuto
la parola $w in A_(q)^(n)$. Il codice $C$ *corregge* la parola $w$ se
e soltanto se esiste una ed una sola parola in $C$ a distanza minima
da $w$, cioè se e soltanto se esiste una ed una sola $x in C$ tale per
cui $d(x, w) = min{d(y, w) : y in C}$. In tal caso, $w$ viene corretta
con $x$.

Si noti come non sia garantito che la correzione del codice restituisca
la parola che é stata effettivamente inviata. Infatti, la parola ricevuta
viene corretta (se necessario) con la parola che meno dista da questa, ma
se il canale di comunicazione é particolarmente rumoroso la parola ricevuta
potrebbe differire profondamente da quella originale, e molto piú simile
ad una parola diversa. Inoltre, non é nemmeno garantito che la parola del
codice con minima distanza da quella ricevuta sia sempre una sola, perché
potrebbero esistere piú parole con la medesima distanza minima.

#example[
	Sia $C = {000000, 111111, 222222}$ un codice di lunghezza $6$
	sull'alfabeto $A_(3) = {0, 1, 2}$. Si supponga che Alice invii
	a Bob la parola $000000$, e che Bob corregga la parola ricevuta
	impiegando il principio di massima verosimiglianza.

	- Si supponga che Bob riceva la parola $001102$. Poiché:

	  $	d(000000, 001102) = 3, d(111111, 001102) = 4, d(222222, 001102) = 5 $

	  Bob corregge (correttamente) la parola ricevuta con $000000$.

	- Si supponga che Bob riceva la parola $022220$. Poiché:

	  $ d(000000, 022220) = 4, d(111111, 022220) = 6, d(222222, 022220) = 2 $

	  Bob corregge (erroneamente) la parola ricevuta con $222222$.

	- Si supponga che Bob riceva la parola $000111$. Poiché:

	  $ d(000000, 000111) = 3, d(111111, 000111) = 3, d(222222, 000111) = 6 $

	  Bob non é in grado di correggere la parola ricevuta, perché esistono
	  piú parole con la stessa distanza da questa.
]

Un codice $C subset.eq A_(q)^(n)$ si dice $k$-*rivelatore* se $k$ è il numero
massimo di errori che è in grado di rivelare.

#theorem[
	Un codice $C subset.eq A_(q)^(n)$ è $k$-rivelatore se e soltanto se
	$d(C) = k + 1$.
]
#proof[
	Si supponga che $d(C) = k + 1$. Sia $p$ la parola inviata, e sia $p'$
	la parola ricevuta. Sia poi $t$ il numero di errori subiti da $p$ durante
	la trasmissione, ovvero $d(p, p') = t$. Si distinguono due casi:
	- $t < k$. Allora $d(p, p') = t < k < k + 1 = d(C) = min{d(w, w') : w,
	  w' in C, w != w'}$. Questo significa che $p' in.not C$, e che quindi
	  i $t$ errori vengono rivelati. Essendo $t < k$, a maggior ragione i
	  $k$ errori verranno tutti rivelati;
	- $t gt.eq k$. Allora $d(p, p') = t gt.eq k = d(C) - 1 = min{d(w, w') :
	  w, w' in C, w != w'} - 1$. Questo significa che potrebbe aversi $p'
	  in C$, e che quindi possa esistere un errore fra i $t$ che non viene
	  rivelato. Essendo $t gt.eq k$, non vi é garanzia che tutti i $k$ errori
	  verranno rivelati.

	Si ha quindi che $C$ é $k$-rivelatore. Viceversa, sia $k$ il massimo
	numero di errori che $C$ é in grado di rivelare. Ogni parola $p'' in
	C$ distinta da $p$ deve differire da questa in almeno $k + 1$ componenti,
	pertanto si ha $d(C) gt.eq k + 1$. Inoltre, poichè $C$ rivela $k$ errori
	ma non $k + 1$, devono esistere due parole $w, w' in C$ tali per cui
	$d(w, w') = k + 1$. Ne consegue che $d(C) = k + 1$.
]

#corollary[
	Un codice $C subset.eq A_(q)^(n)$ rivela $t$ errori se e solo se
	$d(C) gt.eq t + 1$.
]
#proof[
	Il codice $C$ rivela $t$ errori se e solo se alterando una parola
	di $C$ in $r lt.eq t$ componenti non si ottiene un'altra parola di
	$C$. Questo avviene se e solo se due parole di $C$ distano almeno
	$t + 1$.
]

Un codice $C subset.eq A_(q)^(n)$ si dice $h$-*correttore* se $h$ è il numero
massimo di errori che è in grado di correggere.

#theorem[
	Ogni codice $C subset.eq A_(q)^(n)$ é
	$floor(frac(d(C) - 1, 2))$-correttore.
] <Min-distance-is-correcting>
#proof[
	Siano $p, p' in C$ rispettivamente la parola trasmessa e la
	parola ricevuta, con $t$ numero di errori subiti da $p$ durante
	la trasmissione. Si supponga poi $t lt.eq floor(frac(d(C) - 1, 2))$.
	Affinché $C$ sia $floor(frac(d(C) - 1, 2))$-correttore, la parola
	$p$ che viene scelta come correzione per $p'$ deve essere l'unica
	e sola parola in $C$ che dista da $p'$ meno di tutte. In altre
	parole, qualsiasi parola $p''$ distinta da $p$ dev'essere piú
	distante da $p'$ di quanto $p'$ disti da $p$. Formalmente:

	$ forall p'' in C, p'' != p space "si ha" space
	  d(p'', p') > d(p, p') = t $

	Avendo supposto $t lt.eq floor(frac(d(C) - 1, 2))$, questo equivale
	a dimostrare che:

	$ forall p'' in C, p'' != p space "si ha" space
	  d(p'', p') > floor(frac(d(C) - 1, 2)) $

	Si supponga per assurdo che questo non sia vero, e che esista quindi
	una parola $p''' in C$ distinta da $p$ tale per cui $d(p''', p') lt.eq
	floor(frac(d(C) - 1, 2))$. Applicando la disuguaglianza triangolare,
	si ha:

	$ d(p''', p) lt.eq d(p''', p') + d(p', p) lt.eq
	  floor(frac(d(C) - 1, 2)) + floor(frac(d(C) - 1, 2)) =
	  2floor(frac(d(C) - 1, 2)) $

	Per definizione di arrotondamento per difetto, $floor(a) =
	a - epsilon$ con $epsilon in RR$ tale che $0 lt.eq epsilon
	< 1$. Si ha quindi:

	$ d(p''', p) lt.eq 2(frac(d(C) - 1, 2) - epsilon) =
	  frac(cancel(2) (d(C) - 1), cancel(2)) - 2epsilon =
	  d(C) - 1 - 2epsilon lt.eq d(C) $

	Questo peró non é possibile, perché per ipotesi $d(C)$ é la minima
	distanza fra due parole in $C$. Pertanto, occorre assumere che $p'''$
	non possa esistere.
]

#corollary[
	Un codice $C subset.eq A_(q)^(n)$ corregge $t$ errori se e solo se
	$d(C) gt.eq 2 t + 1$.
]
// #proof[
// Dimostrabile, da aggiungere
// ]
