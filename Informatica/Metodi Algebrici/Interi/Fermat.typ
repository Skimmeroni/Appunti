#import "../Metodi_defs.typ": *

#theorem("Piccolo Teorema di Fermat")[
	Sia $p in NN$ numero primo. Per qualsiasi $a in NN$ vale:

	$ a^(p) equiv a mod p $

	Inoltre, se $p$ non é divisore di $a$, vale anche:

	$ a^(p − 1) equiv 1 mod p $
] <Fermat-little-theorem>
#proof[
	/*
	Si consideri innanzitutto il caso in cui $p$ non sia divisore di $a$.
	Si studino allora le classi di resto cosí definite:

	$ {[0]_(p), [a]_(p), [2a]_(p), ..., [(p - 1)a]_(p)} $

	É possibile provare che tali classi sono tutte distinte fra loro. Si
	supponga infatti per assurdo che questo non sia vero, e che quindi
	esistano (almeno) due classi di resto dell'insieme sopra definito che
	coincidono. Siano queste $[r a]_(p) = [s a]_(p)$, con $r, s in ZZ$
	tali per cui $0 lt.eq r < p$ e $0 lt.eq s < p$. Supponendo, senza
	perdita di generalitá, $r gt.eq s$, si ha allora:

	$ [r a]_(p) = [s a]_(p) => [r a]_(p) - [s a]_(p) = [0]_(p) =>
	  [r a - s a]_(p) = [0]_(p) => [(r - s)a]_(p) = [0]_(p) $

	Ovvero, $p | (r - s) a$. Per il @Euclid-lemma, deve essere vera almeno
	una proposizione fra $p | r - s$ e $p | a$; dato che quest'ultima non
	puó essere vera per ipotesi, deve aversi $p | r - s$. I due numeri
	interi $r$ e $s$ sono stati peró definiti come positivi ed inferiori
	a $p$, pertanto $p | r - s$ puó essere vera solamente nel caso in cui
	$r - s = 0$, ovvero $r = s$. Ma allora:

	$ {[0]_(p), [a]_(p), [2a]_(p), ..., [(p - 1)a]_(p)} =
	  {[0]_(p), [1]_(p), [2]_(p), ..., [(p - 1)]_(p)} $

	Questo perché entrambi hanno esattamente $p$ classi di resto modulo $p$,
	e diventa allora possibile ridurre in modulo $p$ il primo insieme ottenendo
	il secondo.

	Poiché la classe $[0]_(p)$ compare in entrambi gli insiemi, puó essere
	eliminata matenendo valida l'uguaglianza:

	$ {[a]_(p), [2a]_(p), ..., [(p - 1)a]_(p)} =
	  {[1]_(p), [2]_(p), ..., [(p - 1)]_(p)} $

	Se i due insiemi sono uguali membro a membro, allora il prodotto degli
	elementi del primo insieme deve essere uguale al prodotto degli elementi
	del secondo insieme:

	$ [a]_(p) dot [2 a]_(p) dot ... dot [(p - 1)a]_(p) & =
	  [1]_(p) dot [2]_(p) dot ... dot [(p - 1)]_(p) => \
	  [a dot 2 a dot ... dot (p - 1)a]_(p) & =
	  [1 dot 2 dot ... dot (p - 1)]_(p) => \
	  [a^(p - 1) (p - 1)!]_(p) & =
	  [(p - 1)!]_(p) $

	Da cui si ricava, per la definizione di classe di resto,
	$a^(p - 1) (p - 1)! equiv (p - 1)! mod p$. Essendo $p$
	un numero primo, certamente non puó essere un divisore
	di $(p - 1)!$, pertanto é valido il @Cancellation-law-congruences
	e quindi é possibile semplificare come $a^(p - 1) equiv 1 mod p$.

	Si supponga ora che $p$ sia un numero primo qualsiasi. Se $p$ non
	é un divisore di $a$, é possibile applicare il @Cancellation-law-congruences
	"nell'altro verso" al risultato appena trovato. Ovvero, é possibile moltiplicare
	ambo i membri di $a^(p - 1) equiv 1 mod p$ per $p$, ottenendo $a^(p) equiv p mod p$.

	Se invece $p$ é un divisore di $a$, questo equivale a dire $a equiv 0 mod p$.
	Tuttavia, deve valere anche $a^(p) equiv 0 mod p$; per proprietá transitiva,
	$a^(p) equiv a mod p$.
	*/
]

#theorem("Teorema di Fermat-Eulero")[
	Sia $n in NN - {0}$ e sia $a$ un qualsiasi intero tale che $a$ ed $n$
	siano primi fra di loro. Allora vale:

	$ a^(phi(n)) equiv 1 mod n $
] <Euler-theorem>
#proof[
	Si consideri innanzitutto il caso in cui $n$ sia una potenza di un
	numero primo, ovvero $n = p^(m)$ con $p$ numero primo e $m$ numero
	naturale. Si proceda per induzione su $m$; il caso base si ha con
	$m = 1$:

	$ a^(phi(p^(1))) equiv 1 mod p^(1) =>
	  a^(p^(1 - 1) (p - 1)) equiv 1 mod p =>
	  a^(p - 1) equiv 1 mod p $

	Che equivale all'enunciato del @Fermat-little-theorem, e pertanto é
	verificato.

	Si consideri ora l'ipotesi induttiva: si dimostri che sia
	valido $a^(phi(p^(m))) equiv 1 mod p^(m)$ assumendo che sia
	valido $a^(phi(p^(m - 1))) equiv 1 mod p^(m - 1)$. Tale
	espressione equivale a:

	$ a^(phi(p^(m - 1))) equiv 1 mod p^(m - 1) =>
	  p^(m - 1) | a^(phi(p^(m - 1))) - 1 =>
	  a^(phi(p^(m - 1))) - 1 = p^(m - 1) b $

	Per un certo $b in ZZ$. Per il @Euler-function-primes, é
	possibile esplicitare l'esponente di $a$:

	$ a^(phi(p^(m - 1))) - 1 = p^(m - 1) b =>
	  a^(p^(m - 2) (p - 1)) - 1 = p^(m - 1) b =>
	  a^(p^(m - 2) (p - 1)) = 1 + p^(m - 1) b $

	Elevando ambo i membri alla potenza $p$, si ha:

	$ (a^(p^(m - 2) (p - 1)))^(p) = (1 + p^(m - 1) b)^(p) =>
	  a^(p^(m - 1) (p - 1)) = (1 + p^(m - 1) b)^(p) =>
	  a^(phi(p^(m))) = (1 + p^(m - 1) b)^(p) $

	Il termine $(1 + p^(m − 1) b)^(p)$ puó essere espanso usando la
	formula del binomio di Newton:

	$ (1 + p^(m - 1) b)^(p) =>
	  1 + (p^(m - 1) b)^(p) +
	  sum_(k = 1)^(p - 1) mat(p; k) (p^(m - 1) b)^(p - k) $

	Ogni addendo della sommatoria, cioè ogni termine $mat(p; k)
	(p^(m - 1) b)^(p - k)$, é un multiplo di $p^(m)$ perché
	$mat(p; k)$ é multiplo di $p$ e $(p^(m - 1) b)^(p - k)$
	é multiplo di $p^(m - 1)$, per $k = 1, ..., p - 1$.

	Inoltre, $(p^(m − 1) b)^(p)$ è un multiplo di $p^(m)$, dunque si ha:

	$ (1 + p^(m − 1) b)^(p) equiv 1 mod p^(m) $

	Da cui, per proprietá transitiva:

	$ a^(phi(p^(m))) equiv 1 mod p^(m) $

	Nel caso in cui $n$ sia un numero qualsiasi, questo puó essere
	certamente fattorizzato come $n = p_(1)^(m_(1)) p_(2)^(m_(2)) ...
	p_(r)^(m_(r))$, dove ciascun $p_(i)$ con $1 lt.eq i lt.eq r$ é un
	numero primo distinto e ciascun $m_(i)$ é un numero naturale. Per
	ciascuno di questi fattori elevati al rispettivo esponente, dovrá
	valere:

	$ a^(phi(p_(i)^(m_(i)))) equiv 1 mod p_(i)^(m_(i)) $

	Per il @Euler-function-multiplicative, si ha che ciascun
	$phi(p_(i)^(m_(i)))$ é divisore di $phi(n)$, ovvero che
	per un certo $t in ZZ$ vale $phi(n) = phi(p_(i)^(m_(i))) t$.
	Allora:

	$ a^(phi(n)) = a^(phi(p_(i)^(m_(i))) t) = (a^(phi(p_(i)^(m_(i)))))^(t)
	  equiv 1^(t) = 1 mod p_(i)^(m_(i)) $

	In altre parole, ogni $p_(i)^(m_(i))$ é divisore di $a^(phi(n)) - 1$.
	Dato che ogni $p_(i)^(m_(i))$ é potenza di un numero primo, é evidente
	come, presi due $p_(i)^(m_(i))$ e $p_(j)^(m_(j))$ qualsiasi con $i != j$,
	questi saranno coprimi. Ma allora:

	$ p_(1)^(m_(1)) p_(2)^(m_(2)) ... p_(r)^(m_(r)) | a^(phi(n)) - 1 =>
	  a^(phi(n)) equiv 1 mod p_(1)^(m_(1)) p_(2)^(m_(2)) ... p_(r)^(m_(r)) $

	Avendo peró definito $n$ come $n = p_(1)^(m_(1)) p_(2)^(m_(2)) ...
	p_(r)^(m_(r))$:

	$ a^(phi(n)) equiv 1 mod n $
]
