#import "../Metodi_defs.typ": *

Sia $bb(N)$ un insieme non vuoto, in cui si fissa un elemento detto _zero_,
indicato con 0, ed una funzione $+$ da $bb(N)$ in $bb(N)$. Indicata con $a^(+)$
l'immagine di $a$ tramite $+$ al variare di $a in bb(N)$, si dice che $a^(+)$
é _elemento successivo_, o _successore_, di $a$. Si assuma che per l'insieme
$bb(N)$ valgano i seguenti assiomi, detti *Assiomi di Peano*:

+ $0 != a^(+)$ $forall a in bb(N)$. Ovvero, non esiste alcun elemento di
  $bb(N)$ avente 0 come successore;
+ La funzione $+$ é iniettiva. Ovvero, non esistono due $a_(1), a_(2) in S$
  distinti che abbiano uno stesso $a^(+)$ come successore;
+ Se $S subset.eq bb(N), 0 in S$ e $s^(+) in S$ $forall s in S$,
  allora $S = bb(N)$. Ovvero, se $S$ é un sottoinsieme anche
  improprio di $bb(N)$ che contiene (almeno) 0 e che, per ciascun
  elemento di $S$, ne contiene anche l'immagine tramite $+$, allora
  $S$ e $bb(N)$ sono lo stesso insieme.

L'insieme $bb(N)$ cosí definito prende il nome di *insieme dei numeri naturali*.

#principle("Principio del buon ordinamento")[
	Sia $S$ un sottoinsieme non vuoto di $bb(Z)$ limitato inferiormente
	(esiste un $n_(0) in bb(Z)$ tale che $s gt.eq n_(0)$, $forall s in S$).
	Allora $S$ ha minimo, ovvero esiste un $m in S$ tale che $s gt.eq m$,
	$forall s in S$.
]

#theorem("Teorema di Ricorrenza")[
	Dati un insieme $S$, un elemento $a$ di $S$ ed una funzione $phi.alt$ da $S$ in
	sé stesso, esiste una ed una sola funzione $f: bb(N) -> S$ tale che

	$ f(0) = a, f(n^(+)) = phi.alt(f(n)) $
] /*
#proof[
		Sia $X$ il prodotto cartesiano di $bb(N)$ e $S$. Si consideri l'insieme
		$Gamma subset.eq cal(P) (X)$, costituito dai sottoinsiemi $U$ di $X$ che
		godono delle seguenti proprietá:

		+ $(0, a) in U$;
		+ Se $(n, b) in U$ allora anche $(n^(+), phi.alt(b)) in U$.
]

Ogni funzione definita a partire da tale teorema viene detta _definita per ricorrenza_.
In particolare, le due operazioni principali che é possibile definire per ricorrenza
sull'insieme $bb(N)$ sono la *somma* ed il *prodotto*.
*/

// Definizione dell'insieme $bb(Z)$

#principle("Principio di induzione")[
	Dato un numero fissato $n_(0) in bb(Z)$, sia $P(n)$ una proposizione
	dipendente da $n in bb(Z)$, con $n gt.eq n_(0)$. Si supponga che siano
	verificate le seguenti ipotesi:

	- $P(n_(0))$ é vera;
	- $forall n$, supponendo che sia vera $P(n)$ é possibile dimostrare che
	  lo sia anche $P(n + 1)$.

	Allora $P(n)$ é vera $forall n in bb(Z)$
]

#example[Principio di induzione][
	Si consideri la seguente proposizione, dipendente da $n$:

	$ sum_(i = 1)^(n) (2i - 1) = n^(2), forall n gt.eq 1 $

	É possibile applicarvi il principio di induzione ponendo
	$n_(0) = 1$. Nello specifico:

	- $P(1)$ é vera. Infatti, $sum_(i = 1)^(1) (2i - 1) = (2 dot.op 1)
	  - 1 = 2 - 1 = 1$ e $1^(2) = 1$;
	- Supponendo che sia vera $P(n)$, si dimostri che é vera $P(n + 1)$,
	  ovvero che sia vera $sum_(i = 1)^(n + 1) (2i - 1) = (n + 1)^(2)$.
	  Si ha:

	  $ sum_(i = 1)^(n + 1) (2i - 1) = (2(n + 1) - 1) + sum_(i = 1)^(n) (2i - 1) =
	  2n + 1 + sum_(i = 1)^(n) (2i - 1) = 2n + 1 + n^(2) $

	  Che é peró proprio la formula per il calcolo del quadrato di binomio.
	  Pertanto $n^(2) + 1 + 2n = (n + 1)^(2) = sum_(i = 1)^(n + 1) (2i - 1)$

	Essendo verificate entrambe le ipotesi del principio di induzione, si ha
	che $P(n)$ é vera $forall n gt.eq 1$
]

Il principio di induzione puó essere riespresso in termini diversi.

#principle("Principio di induzione forte")[
	Dato un numero fissato $n_(0) in bb(Z)$, sia $P(n)$ una proposizione
	dipendente da $n in bb(Z)$, con $n gt.eq n_(0)$. Si supponga che siano
	verificate le seguenti ipotesi:

	- $P(n_(0))$ é vera;
	- $forall m$ tale che $n_(0) lt.eq m < n$, supponendo che sia vera $P(m)$
	  é possibile dimostrare che lo sia anche $P(n)$.

	Allora $P(n)$ é vera $forall n in bb(Z)$
]

L'aggettivo _forte_ non sta ad indicare che il principio di induzione forte
abbia un maggior potere espressivo del principio di induzione "standard";
indica semplicemente che si basa su una ipotesi (la seconda) piú forte di
quella usata dalla formulazione precedente. Infatti, una dimostrazione
compiuta mediante una delle due forme del principio di induzione puó essere
convertita in una dimostrazione analoga compiuta nell'altra forma.

#theorem[
	Il principio di induzione, il principio di induzione forte
	ed il principio del buon ordinamento sono equivalenti.
]

#proof[
	La dimostrazione si compone di tre parti.

	+ Assumendo come vero il principio di induzione, si dimostri la
	  validitá del principio di induzione forte. Sia pertanto $P(n)$
	  una proposizione dipendente da $n$ e sia $n_(0) in bb(Z)$ un
	  valore fissato. Si supponga che siano verificate le seguenti
	  ipotesi:

		- $P(n_(0))$ é vera;
		- $forall m$ tale che $n_(0) lt.eq m < n$, supponendo che sia
		  vera $P(m)$ é possibile dimostrare che lo sia anche $P(n)$.

	  In particolare, dunque, se $P(n - 1)$ é vera allora $P(n)$ é vera.
	  Il principio di induzione implica quindi che $P(n)$ é vera per ogni
	  $n gt.eq n_(0)$;
	+ Assumendo come vero il principio di induzione forte, si dimostri
	  la validitá del principio del buon ordinamento. Sia pertanto $S
	  subset.eq bb(Z)$ un sottoinsieme non nullo dei numeri interi
	  inferiormente limitato da $n_(0)$. Si supponga per assurdo il
	  principio del buon ordinamento non sia valido, ovvero che $S$ non
	  ammetta minimo. Si consideri la proposizione $P(n)$ dipendente da $n$:

	  #align(center)[_Non esiste alcun numero intero minore o uguale ad_ $n$ _che appartenga ad_ $S$]

	  É possibile applicare a $P(n)$ il principio di induzione forte. La
	  prima ipotesi é verificata, perché se $n_(0)$ appartenesse ad $S$,
	  essendone il limite inferiore, allora ne sarebbe necessariamente
	  anche il minimo.

	  Sia dunque $n$ un intero maggiore di $n_(0)$. Si assuma allora
	  che $forall m$ tale che $n_(0) lt.eq m < n$, supponendo che sia
	  vera $P(m)$ é possibile dimostrare che lo sia anche $P(n)$. Si
	  supponga che $P(n)$ sia falsa: esiste allora qualche $t lt.eq n,
	  t in S$. Ma questo non é possibile, perché $forall t in bb(Z),
	  n_(0) lt.eq t lt.eq n$ si suppone $P(t)$ vera, e quindi $t in.not
	  S$. Occorre allora dedurre che $S$ ammetta minimo, e quindi se si
	  assume come valido il principio di induzione forte allora é valido
	  il principio del buon ordinamento.

	+ Assumendo come vero il principio del buon ordinamento, si dimostri
	  la validitá del principio di induzione. Dato un numero fissato $n_(0)
	  in bb(Z)$, sia $P(n)$ una proposizione dipendente da $n in bb(Z)$,
	  con $n gt.eq n_(0)$. Si supponga che siano verificate le seguenti ipotesi:

		- $P(n_(0))$ é vera;
		- $forall n$, supponendo che sia vera $P(n)$ é possibile dimostrare
		  che lo sia anche $P(n + 1)$.

	  Si consideri l'insieme $S subset.eq bb(Z)$ costituito da tutti gli $n
	  gt.eq n_(0)$ per i quali $P(n)$ é falsa. Se il principio di induzione
	  fosse verificato, tale insieme dovrebbe essere l'insieme vuoto. Si
	  assuma per assurdo che tale insieme non sia vuoto: per il principio
	  del buon ordinamento tale insieme deve ammettere un minimo, sia questo
	  $m$, tale per cui $P(m)$ é falsa.

	  Dato che l'insieme contiene solo interi $n$ tali per cui $n gt.eq n_(0)$
	  (ma non tutti), dovrá aversi che $m > n_(0)$, ovvero che $m - 1 gt.eq
	  n_(0)$. Ma allora $P(m - 1)$ deve essere vera, perché altrimenti si avrebbe
	  $m - 1 in S$ ed $m$ non sarebbe il minimo di $S$. Applicando la seconda
	  ipotesi sopra definita, si ha che $P(m + 1 - 1) = P(m)$ é vera, ma questo
	  é in contraddizione con quanto evidenziato in precedenza. Occorre allora
	  dedurre che se si assume come valido il principio del buon ordinamento,
	  allora é valido il principio di induzione forte.
]
