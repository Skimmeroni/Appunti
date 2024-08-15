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

#example[
	Si supponga che Bob voglia inviare ad Alice un messaggio, occultandolo
	usando il sistema crittografico RSA. Si assuma innanzitutto che entrambi
	sappiano che la conversione carattere/numero venga fatta con unitá di
	grandezza $1$ mediante questo schema:

	#align(
		center,
		table(
			columns: 22,
			[A],  [B],  [C],  [D],  [E],  [F],  [G],  [H],  [I],  [L],  [M],
			[N],  [O],  [P],  [Q],  [R],  [S],  [T],  [U],  [V],  [Z],  [#math.qed],
			[2],  [3],  [4],  [5],  [6],  [7],  [8],  [9],  [29], [31], [12],
			[13], [14], [37], [16], [17], [18], [19], [43], [21], [22], [23]
		)
	)

	Alice sceglie i numeri primi $p = 5$ e $q = 11$. A partire da questi,
	Alice calcola:

	$ N = p q = 55 space space space phi(N) = phi(55) = phi(5) dot phi(11) =
	  (5 - 1) dot (11 - 1) = 40 $

	Alice sceglie poi il numero $r = 37$ tale che $r < phi(N)$ e
	$"MCD"(r, phi(N)) = "MCD"(37, 40) = 1$. A partire da questi,
	Alice calcola due interi $s$ e $t$ per i quali $37 s + 40 t = 1$,
	mediante l'algoritmo di Euclide:

	#set math.mat(delim: none)
	#grid(
		columns: (0.5fr, 0.5fr),
		[
			$ mat(
				40 &= 37 dot 1 + 3;
				37 &= 3 dot 12 + 1;
				3 &= 3 dot 1 + 0;
			) $
		],
		[
			$ mat(
				3 &= 40 − 37;
				1 &= 37 − 12 dot 3 = 37 − 12(40 − 37) ;
				  &= −12 dot 40 + 13 dot 37;
			) $
		]
	)

	Ottenendo $t = −12$ e $s = 13$. A questo punto, Alice ha ricavato la
	chiave di cifratura $(N, r) = (55, 37)$, e la rende pubblica.

	Bob legge le informazioni rese pubbliche da Alice e le spedisce il
	messaggio seguente:

	#align(
		center,
		table(
			columns: 15,
			[26], [7], [21], [9], [52], [7], [52], [41],
			[23], [28], [24], [7], [18], [49], [7]
		)
	)

	Alice decodifica ciascuna unitá del messaggio a parire dall'equivalenza
	$b = a^(s) mod N$:

	$ mat(
		26^(13) mod 55 &= 31, 7^(13)  mod 55 &= 2,  21^(13) mod 55 &= 21,
		9^(13)  mod 55 &= 14, 52^(13) mod 55 &= 17;
		7^(13)  mod 55 &= 2,  52^(13) mod 55 &= 17, 41^(13) mod 55 &= 6,
		23^(13) mod 55 &= 23, 28^(13) mod 55 &= 18;
		24^(13) mod 55 &= 19, 7^(13)  mod 55 &= 2,  18^(13) mod 55 &= 13,
		49^(13) mod 55 &= 4,  7^(13)  mod 55 &= 2;
	) $

	Il messaggio decodificato é quindi:

	#align(
		center,
		table(
			columns: 15,
			[31], [2], [21], [14], [17], [2], [17], [6],
			[23], [18], [19], [2], [13], [4], [2]
		)
	)

	Convertendo ordinatamente ciascuna unitá da numero a carattere, si
	ottiene:

	#align(
		center,
		table(
			columns: 15,
			[L], [A], [V], [O], [R], [A], [R], [E],
			[#math.qed], [S], [T], [A], [N], [C], [A]
		)
	)
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
