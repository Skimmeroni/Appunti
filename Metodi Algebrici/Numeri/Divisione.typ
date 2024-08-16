#import "../Metodi_defs.typ": *

Dati due numeri interi $n$ e $m$, con $n > m > 0$, l'operazione di *divisione*
permette due interi q e r, chiamati rispettivamente _quoziente_ e _resto_, tali
che il prodotto fra $m$ e $q$ é il multiplo di $m$ che piú si avvicina ad $n$ per
difetto ed il resto $r = n - m q$ misura lo scarto.

#theorem[
	Siano $n$ e $m$ due numeri interi, con $m != 0$. Esiste una ed una sola coppia
	di interi $q$ ed $r$ tali per cui $n = m q + r$ e $0 lt.eq r < |m|$
] /*
#proof[
	Si supponga che $n gt.eq 0$. Fissato arbitrariamente $m$, si proceda per
	induzione su $n$:

	- Se $n = 0$, si ha $0 = m q + r$, ovvero $m q = -r$. In effetti, esiste una
	  ed una sola coppia di numeri interi $q$ ed $r$ per i quali tale uguaglianza é
	  verificata, ovvero $0, 0$. Infatti, $m dot 0 = -0 = 0$ e $0 lt.eq 0 < |m|$;
	- Assumendo che esista una ed una sola coppia di numeri interi $q$ ed $r$ tali
	  per cui $n = m q + r$ e $0 lt.eq r < |m|$, si dimostri che esista una ed una
	  sola coppia di numeri interi $q'$ ed $r'$ tali per cui $(n + 1) = m q' + r'$
	  e $0 lt.eq r' < |m|$

	  Se $n gt.eq |m|$, ovvero se $n > n − |m| gt.eq 0$, per l’ipotesi di induzione
	  esistono $q'$ e $r'$ in $ZZ$ tali che $n − |m| = m q' + r'$ con $0 lt.eq r'
	  < |m|$.

	  Allora $n = m q' + |m| + r'$ e, essendo $|m| = plus.minus m$, si ha $n = m(q'
	  plus.minus 1) + r'$ con $0 lt.eq r < |m|$.

	Per quanto riguarda l'unicitá
] */

Siano $a$ e $b$ due numeri interi. Se esiste $c in ZZ$ tale che $a = b c$,
si dice che $b$ _divide_ $a$, oppure analogamente che $a$ é _divisibile_ per
$b$. Per indicare che $b$ divide $a$ viene usata la notazione $b | a$; se
invece $b$ non divide $a$, si usa la notazione $b divides.not a$. Se $b$
divide $a$, si dice anche che $b$ é _multiplo_ di $a$. É immediato verificare
che, dato $a in ZZ$, sia $plus.minus 1$ che $plus.minus a$ sono certamente
divisori di $a$.

Siano $a, b in ZZ$ non entrambi nulli; si dice che $d in ZZ$ é un *Massimo
Comun Divisore* tra $a$ e $b$ se sono verificate entrambe le seguenti due condizioni:

+ $d | a$ e $d | b$. Ovvero, $d$ é divisore sia di $a$ che di $b$;
+ Se $c in ZZ$ é tale che $c | a$ e $c | b$, allora $c | d$. Ovvero,
  tutti i divisori di $a$ che sono anche divisori di $b$ sono anche
  divisori di $d$.

#theorem[
	Dati due numeri $a, b in ZZ$ non entrambi nulli, se $d$ e $tilde(d)$
	sono due Massimi Comun Divisori fra $a$ e $b$ allora devono essere uguali
	in modulo, ovvero deve aversi $d = plus.minus tilde(d)$.
]
#proof[
	Essendo $d$ un Massimo Comun Divisore per $a$ e $b$, deve valere
	$d | a$ e $d | b$. Inoltre, deve valere anche che se $c in ZZ$
	é tale che $c | a$ e $c | b$, allora $c | d$.

	Essendo peró anche $tilde(d)$ un Massimo Comun Divisore per $a$ e
	$b$, deve valere $tilde(d) | a$ e $tilde(d) | b$. Allora é possibile
	sostituire $c$ con $tilde(d)$ nella seconda espressione ed ottenere
	che $tilde(d) | d$.

	É peró possibile operare anche in senso contrario: essendo $tilde(d)$
	un Massimo Comun Divisore per $a$ e $b$, deve valere anche che se $c
	in ZZ$ é tale che $c | a$ e $c | b$, allora $c | tilde(d)$, e valendo
	$d | a$ e $d | b$ deve aversi che $d | tilde(d)$.

	Esistono allora due numeri $h, k in ZZ$ tali per cui $tilde(d) = h d$
	e $d = tilde(d)$. Ne segue $tilde(d) = (h k) tilde(d)$, e quindi $h k = 1$.
	Deve allora aversi $h = k = 1$ e quindi $d = tilde(d)$ oppure $h = k = -1$
	e quindi $d = -tilde(d)$.
]

Dal teorema si evince immediatamente che se $d$ é un Massimo Comun Divisore
positivo di due numeri interi $a$ e $b$, allora $d$ é univoco. Tale valore
viene indicato con $"MCD"(a, b)$.

#theorem("Esistenza ed unicitá del Massimo Comun Divisore")[
	Per una qualsiasi coppia di numeri interi $a$ e $b$ non entrambi nulli
	esiste sempre ed é univoco $d = "MCD"(a, b)$
] <MCD-exists-and-unique>
#proof[
	Innanzitutto, é immediato riconoscere che se $d = "MCD"(a, b)$, allora é
	vero anche $d = "MCD"(-a, -b)$. É altrettanto immediato riconoscere che
	$"MCD"(a, b) = "MCD"(b, a)$ per qualsiasi $a, b$. Pertanto, senza perdita
	di generalitá, é possibile assumere che $a$ e $b$ siano numeri naturali
	con $a gt.eq b$.

	Se $a = 0$ e $b != 0$ si verifica facilmente che $"MCD"(a, b) = a$; allo
	stesso modo, se $b = 0$ e $a != 0$ si ha $"MCD"(a, b) = b$. Si consideri
	pertanto il caso piú generale in cui $a != 0$ e $b != 0$. Devono allora
	esistere un quoziente $q_(1)$ ed un resto $r_(1)$ tali per cui é possibile
	eseguire la divisione:

	$ a = b q_(1) + r_(1) , 0 lt.eq r_(1) < b $

	Se $r_(1) = 0$, allora $"MCD"(a, b) = b$, perché $a = b q_(1)$ é la
	definizione stessa di $b | a$ e $q_(1)$ é arbitrario. Se cosí non é,
	é possibile ripetere l'operazione e risvolgere i calcoli con un nuovo
	resto ed un nuovo quoziente. Piú in generale:

	#set math.mat(column-gap: 2.5em, delim: none)
	$ mat(
	  & (1), & a = b q_(1) + r_(1), & r_(1) != 0;
	  & (2), & b = r_(1) q_(2) + r_(2), & r_(2) != 0;
	  & (3), & r_(1) = r_(2) q_(3) + r_(3), & r_(3) != 0;
	  & , & ..., &;
	  & (k - 1), & r_(k - 3) = r_(k - 2) q_(k - 1) + r_(k - 1), & r_(k - 1) != 0;
	  & (k), & r_(k - 2) = r_(k - 1) q_(k), &;
	) $

	Il fatto che prima o poi si giunga ad una $k$-esima iterazione in cui $r_(k) = 0$
	é garantito dal fatto che tale successione é una successione strettamente crescente
	di numeri non negativi.

	L'ultimo resto non nullo, ovvero $r_(k - 1)$, é precisamente $"MCD"(a, b)$. Per
	verificarlo, é sufficiente osservare come questo possegga entrambe le proprietá
	enunciate nella definizione di Massimo Comun Divisore:

	- Alla riga $(k)$ si ha $r_(k - 2) = r_(k - 1) q_(k)$, ovvero $r_(k - 1) | r_(k - 2)$.
	  Sostituendo la riga $(k)$ nella riga $(k - 1)$ si ha:

	  $ r_(k - 3) = r_(k - 2) q_(k - 1) + r_(k - 1) =
	                r_(k - 1) q_(k) q_(k - 1) + r_(k - 1) =
	                r_(k - 1) (q_(k) q_(k - 1) + 1) $

	  Ovvero, $r_(k - 1) | r_(k - 3)$ (Si noti come il raccoglimento é ammesso dato che
	  $r_(k - 1)$ é definito come non nullo). Risalendo di riga in riga, é facile convincersi
	  che dalla riga $(2)$ si ottiene $r_(k - 1) | r_(1)$ e $r_(k - 1) | b$. Dalla riga
	  $(1)$ segue $r_(k - 1) | a$. Avendo dimostrato che $r_(k - 1) | a$ e $r_(k - 1) | b$,
	  si ha che $r_(k - 1)$ possiede la prima proprietá dell'MCD.
	- Sia $c in ZZ - {0}$. Siano poi $a = c overline(a)$ e $b = c overline(b)$. Sostituendo nella
	  riga $(1)$ si ottiene:

	  $ a = b q_(1) + r_(1) => c overline(a) = c overline(b) q_(1) + r_(1) =>
	    r_(1) = c overline(a) - c overline(b) q_(1) => r_(1) = c (overline(a) - overline(b) q_(1)) $

	  Da cui si ha $c | r_(1)$. Ponendo $r_(1) = c overline(r_(1))$ e sostituendo nella riga
	  $(2)$, si ha:

	  $ b = r_(1) q_(2) + r_(2) => c overline(b) = c overline(r_(1)) q_(2) + r_(2) =>
	    r_(2) = c overline(b) - c overline(r_(1)) q_(2) => r_(2) = c (overline(b) - overline(r_(1)) q_(2)) $

	  Da cui si ha $c | r_(2)$. Discendendo di riga in riga ed applicando lo stesso procedimento,
	  si arriva fino a $c | r_(k - 1)$. Ma questo equivale a dire che, per un $c$ numero intero
	  generico, se $c | a$ e $c | b$, allora $c | r_(k - 1)$, e quindi $r_(k - 1)$ possiede anche
	  la seconda proprietá dell'MCD.
]

La dimostrazione del @MCD-exists-and-unique fornisce implicitamente anche un
algoritmo per calcolare, a partire da due numeri interi $a$ e $b$ non entrambi
nulli, il loro MCD. Tale algoritmo é strutturato come segue:

	+ Si calcola qual'é il piú grande intero $q$ tale per cui é possibile
	  moltiplicarlo per $b$ ottenendo un valore inferiore ad $a$;
	+ Si calcola $r$ come differenza fra $q b$ ed $a$. Se tale valore é
	  nullo, allora $q$ é MCD per $a$ e $b$, e l'algoritmo termina;
	+ $b$ diventa il nuovo $a$, mentre $r$ diventa il nuovo $b$. Dopodiché,
	  si torna al punto 1.

#example[
	L'MCD dei numeri $a = 110143$ e $b = 665$ é 19. Infatti:

	#set math.mat(delim: none)
	$ mat(
		110143 & = 665 dot 165 + 418 &;
		665 & = 418 dot 1 + 247 &;
		418 & = 247 dot 1 + 171 &;
		247 & = 171 dot 1 + 76 &;
		171 & = 76 dot 2 + 19 &;
		76 & = 19 dot 4 &;
	) $
]

#theorem("Identitá di Bézout")[
	Se $a$ e $b$ sono due numeri interi non entrambi nulli, allora esistono
	due numeri interi $x$ e $y$ tali per cui vale:

	$ a x + b y = "MCD"(a, b) $
] <Bezout>
#proof[
	Facendo riferimento al @MCD-exists-and-unique, si consideri la successione di operazioni.
	In particolare, la riga $(1)$, ovvero $a = b q_(1) + r_(1)$, puó anche essere riscritta
	come $r_(1) = a (1) + b (-q_(1))$. Sostituendo nella riga $(2)$, si ha:

	$ b = r_(1) q_(2) + r_(2) => b = (a - b q_(1)) q_(2) + r_(2) =>
	  r_(2) = b - a q_(2) + b q_(1) q_(2) => r_(2) = a (-q_(2)) + b (q_(1) q_(2) + 1) $

	In questo modo, é possibile ciascun resto come combinazione lineare di $a$ e di $b$.
	In particolare per il resto $r_(k - 1)$, che é anche l'MCD di $a$ e di $b$, esisteranno
	due valori $x$ e $y$ tali per cui é possibile esprimerlo come combinazione lineare di
	$a$ e $b$, e quindi $r_(k - 1) = "MCD"(a, b) = a x + b y$.
]

La dimostrazione del @Bezout fornisce implicitamente anche un algoritmo per calcolare,
a partire da due numeri interi $a$ e $b$ non entrambi nulli, una possibile coppia $x,
y$ di interi tali da soddisfare l'identitá per $a$ e $b$, fintanto che il loro MCD é
noto. Tale algoritmo é strutturato come segue:

+ Si esprime $r$ in funzione di $a$ e di $b$, spostando ques'ultimo a primo membro
  ed isolando $r$ a secondo membro;
+ Se $r$ é l'MCD di $a$ e di $b$, l'algoritmo termina, perché le soluzioni particolari
  cercate sono i coefficienti di $a$ e di $b$;
+ Si passa alla riga successiva e si ripete il procedimento, esprimendo i due nuovi $a$
  e $b$ in funzione dei precedenti. Si noti come questi, ad ogni iterazione, cambiano
  di segno.

#example[
	L'MCD dei numeri $a = 110143$ e $b = 665$ é 19. Una soluzione particolare che
	soddisfa l'identitá di Bézout per questa coppia é ricavata di seguito:

	#set math.mat(delim: none)
	$ mat(
		110143 & = 665 dot 165 + 418 & => & a & = & 165 b + 418 & => & a - 165 b & = & 418 &;
		665 & = 418 dot 1 + 247 & => & b & = & a - 165 b + 247 & => & 166 b - a & = & 247;
		418 & = 247 dot 1 + 171 & => & a - 165 b & = & 166 b - a + 171 & => & 2 a - 331 b & = & 171;
		247 & = 171 dot 1 + 76 & => & 166 b - a & = & 2 a - 331 b + 76 & => & 497 b - 3 a & = & 76;
		171 & = 76 dot 2 + 19 & => & 2 a - 331 b & = & 2(497 b - 3 a) + 19 & => & 8 a - 1325 b & = & 19;
	) $
]

Se due numeri interi hanno 1 come Massimo Comun Divisore, allora si dice che
tali numeri sono *coprimi* o *primi fra di loro*. Tale definizione puó essere
riformulata anche rispetto al @Bezout.

#lemma[
	Due numeri interi $a$ e $b$ sono primi fra di loro se e soltanto se esistono
	due numeri interi $x$ e $y$ tali per cui vale $a x + b y = 1$.
] <Coprime-as-Bézout>
#proof[
	Il primo verso dell'implicazione deriva direttamente dalla definizione di
	numeri coprimi. Infatti, due numeri interi $a$, e $b$ si dicono coprimi se
	il loro MCD é 1; sostituendolo nell'identitá di Bézout, si ha precisamente
	$a x + b y = 1$.

	Ció che manca da dimostrare é il secondo verso, ovvero che se per due numeri
	interi $a$ e $b$ esistono due numeri interi $x$ e $y$ tali per cui $a x + b y = 1$,
	allora $a$ e $b$ sono coprimi. Si supponga per assurdo che, se esistono $x$ e $y$,
	tali per cui $a x + b y = 1$, allora $a$ e $b$ non siano coprimi. Questo significa
	che il loro MCD non é 1, ovvero che $a x + b y != 1$, ma questo é in contraddizione
	con l'ipotesi assunta per assurdo.
]
