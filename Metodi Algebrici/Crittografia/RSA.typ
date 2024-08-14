#import "../Metodi_defs.typ": *

*RSA* é un esempio di sistema crittografico asimmetrico. Siano Alice e Bob
due entitá che hanno intenzione di comunicare scambiandosi messaggi senza
che terze parti possano conoscerne il contenuto (ovvero, anche ammesso che
possano intercettare il messaggio, non possano decifrarlo). Si assuma che
Alice sia il ricevente e Bob il mittente. La cifratura e decifratura di
messaggi mediante RSA puó essere descritta sotto forma di algoritmo:

+ Alice sceglie una coppia di numeri primi distinti, siano questi $p$ e $q$;
+ Alice calcola il loro prodotto $N = p q$ ed il valore di $phi(N)$,
  che per le proprietá di tale funzione é semplicemente $(p - 1)(q - 1)$;
+ Alice sceglie un numero casuale $r$ tale che sia coprimo con $phi(N)$ e
  piú piccolo di quest'ultimo;
+ Alice calcola l'identitá di Bézout per $r$ e $phi(N)$, ovvero determina
  una coppia di numeri interi $s$ e $t$ tali per cui $r s + phi(N) t = 1$;
+ Alice rende pubblica la chiave di cifratura $(N, r)$, mentre tiene per
  sé i numeri $p$, $q$ e $phi(N)$, cosí come la chiave di decifratura $(N, s)$;
+ Sia il messaggio che Bob vuole mandare ad Alice il numero intero $b$
  compreso fra $0$ ed $N$. Bob legge la chiave di cifratura di Alice ed
  invia ad Alice il numero $a = b^(r) mod N$;
+ Alice riceve $a$ e ricostruisce il messaggio $b$ originale come $b =
  a^(s) mod N$;

#theorem("Correttezza dell'algoritmo RSA")[
	L'algoritmo RSA é corretto. Ovvero, il messaggio decifrato da Alice
	coincide sempre con il messaggio inviato da Bob.
]
#proof[
	Si consideri il caso in cui $b$ ed $N$ siano coprimi. Dovendo esistere
	$s$ e $t$ tali per cui $r s + phi(N) t = 1$, si ha:

	$ b = b^(1) mod N = b^(r s + phi(N) t) mod N =
	  (b^(r s)) (b^(phi(N) t)) mod N = ((b^(r))^(s) mod N)
	  ((b^(phi(N)))^(t) mod N) $

	Per il @Euler-theorem, si ha $b^(phi(N)) equiv 1 mod N$, in quanto
	$b$ e $N$ sono stati assunti coprimi per ipotesi, ed a maggior ragione
	$(b^(phi(N)))^(t) equiv 1 mod N$. Pertanto:

	$ ((b^(r))^(s) mod N) ((b^(phi(N)))^(t) mod N) =
	  ((b^(r))^(s) mod N) (1 mod N) = a^(s) mod N $

	Si consideri invece il caso in cui $b$ ed $N$ non siano coprimi.
	Essendo $N$ il prodotto di due numeri primi distinti $p$ e $q$
	ed avendo scelto come inferiore ad $N$, $b$ deve essere multiplo
	o di $p$ o di $q$. Si assuma, senza perdita di generalitá, che
	$b$ sia multiplo di $p$, ovvero che esista un $q in bb(Z)$ maggiore
	di $k$ tale per cui $b = k p$. Essendo $p$ e $q$ primi ed avendo
	assunto che $b$ sia multiplo di $q$, deve aversi che $q$ e $b$
	siano coprimi. Per il @Euler-theorem, deve valere $b^(phi(q)) equiv
	1 mod q$, dove $phi(q) = q - 1$ per il @Euler-function-single-prime.
	Si ha poi:

	$ b^(phi(N)) = b^(phi(p q)) = b^((q − 1)(p − 1)) =
	  (b^(q − 1))^(p − 1) equiv b^(−t phi(N)) equiv 1 mod q $

	La congruenza $b^(-t phi(N)) equiv 1 mod q$ equivale a $b^(-t phi(N)) =
	1 + w q$ per un certo $w in bb(Z)$. Si ha:

	$ b^(-t phi(N)) = 1 + w q => b^(1 -t phi(N)) = b + b w q =>
	  b^(1 -t phi(N)) = b + w k N => b^(r s) = b + w k N equiv b mod N $

	Ovvero, anche in questo caso:

	$ a^(s) mod N = (b^(r))^(s) mod N = b^(r s) mod N = b $
]

La funzione di cifratura dell'algoritmo RSA é effettivamente una one-way
function perché per conoscere il termine $s$ della chiave di decifratura
é necessario risolvere $r s + phi(N) t = 1$, che a sua volta richiede di
calcolare $phi(N)$. Il problema é che, per le proprietá della funzione
di Eulero, tale valore é facile da calcolare solamente se é nota la
fattorizzazione in numeri primi di $N$, e tale informazione é nota
solamente ad Alice. Sebbene sarebbe tecnicamente possibile determinare
la fattorizzazione in numeri primi di qualsiasi intero, realisticamente
questo richiede tempi troppo lunghi, specialmente se l'intero in questione
é molto grande #footnote[A dire il vero, non é mai stato dimostrato che
non possa esistere un algoritmo in grado di calcolare velocemente la
fattorizzazione in numeri primi. Per tale motivo, al momento questa é
soltanto una congettura.].
