#import "../Metodi_defs.typ": *

Sia $C$ un codice lineare in $ZZ_(p)^(n)$ di dimensione $k$, e sia $H$
una matrice di controllo per $C$. Dato un vettore $x in ZZ_(p)^(n)$, il
vettore $s = x(H^(t)) in ZZ_(p)^(n − k)$ viene detta *sindrome* di $x$.

Si noti come se il vettore $x$ ha per sindrome il vettore nullo, si
ricade nel @Control-matrix-product-null.

#theorem[
	Sia $C$ un codice lineare in $ZZ_(p)^(n)$ di dimensione $k$, e sia
	$H$ una matrice di controllo per $C$. Siano poi $x, y in ZZ_(p)^(n)$
	due vettori. La relazione

	$ y in x + C = {x + c : c in C} $

	É vera se e soltanto se $x$ e $y$ hanno la stessa sindrome.
]
#proof[
	Enunciare che $y$ appartiene a $x + C$ equivale ad enunciare che $y =
	x + c$ con $c in C$, e viceversa. Spostando $x$ a primo membro, si ha
	$y - x = c$. Moltiplicando ambo i membri per $H^(t)$, si ha $(y − x)
	H^(t) = c H^(t)$. Per il @Control-matrix-product-null, dato che per
	costruzione $c$ appartiene a $C$, si ha $c H^(t) = underline(0)$.
	Valendo $(y − x)H^(t) = c H^(t)$ e $c H^(t) = underline(0)$, per
	proprietá transitiva si ha $(y − x)H^(t) = underline(0)$. Svolgendo
	il prodotto restituisce $y H^(t) − x H^(t) = underline(0)$, ovvero
	$y H^(t) = x H^(t)$. Si noti peró come $y H^(t)$ e $x H^(t)$ siano
	rispettivamente la sindrome di $y$ e di $x$, pertanto il teorema é
	provato.
]

É possibile utilizzare la sindrome dei vettori per semplificare lo schema
di decodifica visto in precedenza. Si supponga di conoscere la sindrome di
ciascuna parola $a_(i)$ della matrice $Sigma = (sigma_(i, j))$. Dato $y$ il
messaggio ricevuto, la decodifica può essere operata come segue:

- Si calcola la sindrome $s = y(H^(t))$ di $y$;
- Se $s = overline(0)$, allora si ricade nel @Control-matrix-product-null,
  e quindi il messaggio é stato trasmesso senza errori (appartenendo a $C$);
- Se invece $s != overline(0)$, si determina l'elemento $a_(i)$ avente la
  stessa sindrome di $y$ e si decodifica quest'ultimo con $y − a_(i)$.

#example[
	Sia $C in ZZ_(2)^(4)$ il codice avente matrice di controllo:

	$ H = mat(
	  0, 1, 1, 0;
	  1, 1, 0, 1) $

	In $ZZ_(2)^(4)$ si hanno $a_(2) = 1000$, $a_(3) = 0100$, e
	$a_(4) = 0010$, aventi sindrome:

	#grid(
		columns: (0.33fr, 0.33fr, 0.33fr),
		[$ s_(2) = a_(2) H^(t) = mat(0, 1) $],
		[$ s_(3) = a_(3) H^(t) = mat(1, 1) $],
		[$ s_(4) = a_(4) H^(t) = mat(1, 0) $]
	)

	Sia $y = 0101$ il messaggio ricevuto, avente sindone:

	$ s = y H^(t) = mat(0, 1, 0, 1) mat(0, 1, 1, 0; 1, 1, 0, 1)^(t) =
	  mat(0, 1, 0, 1) mat(0, 1; 1, 1; 1, 0; 0, 1) = mat(0 + 1 + 0 + 0,
	  0 + 1 + 0 + 1) = mat(1, 0) $

	Poichè $s = s_(4)$ $y$ viene corretto con $y − a_(4) = 0101 − 0010
	= 0111$.
]

Sia $C in ZZ_(p)^(n)$ un codice lineare $1$-correttore. Si supponga che
venga trasmessa la parola $x$ (appartenente a $C$) e che il messaggio
ricevuto sia $y$ (non necessariamente appartenente a $C$). I due messaggi
sono uguali a meno di un certo errore $e$, pertanto é possibile scrivere
$y = x + e$. Essendo $C$ un codice $1$-correttore, $e$ deve essere un
vettore composto da soli termini nulli tranne uno, pertanto é possibile
scrivere $e = (0, dots, e_(i), dots, 0)$.

Per il @Control-matrix-product-null si ha $x (H^(t)) = underline(0)$,
in quanto $x in C$. Pertanto:

$ y(H^(t)) = (x + e)(H^(t)) = x(H^(t)) + e(H^(t)) = underline(0) + e(H^(t))
  = e(H^(t)) $

Ovvero, $y$ ed $e$ hanno la stessa sindrome. Si ha allora:

$ e(H^(t))&=
  mat(0, dots, e_(i), dots, 0)
  mat(
	h_(1, 1), h_(1, 2), dots, h_(1, n);
	h_(2, 1), h_(2, 2), dots, h_(2, n);
	dots.v, dots.v, dots.down, dots.v;
	h_(n - k, 1), h_(n - k, 2), dots, h_(n - k, n))^(t) =
  mat(0, dots, e_(i), dots, 0)
  mat(
	h_(1, 1), h_(2, 1), dots, h_(n - k, 1);
	h_(1, 2), h_(2, 2), dots, h_(n - k, 2);
	dots.v, dots.v, dots.down, dots.v;
	h_(1, n), h_(2, n), dots, h_(n - k, n)) = \ &=
  mat(0 dot h_(1, 1) + dots + e_(i) dot h_(1, i) + dots + 0 dot h_(1, n),
	dots, 0 dot h_(n - k, 1) + dots + e_(i) dot h_(n - k, i) + dots +
	0 dot h_(n - k, n)) = \ &=
  mat(e_(i) h_(1, i), e_(i) h_(2, i), dots, e_(i) h_(n − k, i)) =
  e_(i) underbrace(mat(h_(1, i), h_(2, i), dots, h_(n − k, i)), i-"esima"
  "colonna" "di" H) $

La sindrome di $e$ è quindi dato dal prodotto matriciale fra l'elemento
non nullo $e_(i)$ di $e$, che restituisce la "grandezza" dell'errore, e
la colonna di $H$ corrispondente alla componente in cui è subentrato
l'errore. Il vettore $y$ viene quindi corretto come:

$ x = y − e = (y_(1), dots, y_(i), dots, y_(n)) − (0, dots, e_(i), dots, 0)
  = (y_(1), dots, y_(i) − e_(i), dots, y_(n)) $

Riassumendo, la decodifica mediante codici $1$-correttori avviene come segue:

+ Viene calcolata la sindrome $y(H^(t)) = s$ del vettore $y$ ricevuto;
+ Se $s = underline(0)$, allora $y$ non ha errori, e coincide quindi con
  il messaggio inviato;
+ Se $s != underline(0)$ si confronta $s$ con ogni colonna di $H$;
+ Se $s$ è multiplo della $i$-esima colonna di $H$ secondo lo scalare
  $e_(i)$ allora l'errore è $e = (0, dots, e_(i), dots, 0)$ e $y$ viene
  decodificato con $x = y − e$.

#example[
	Sia $C$ il codice su $ZZ_(3)$, e sia $H$ una sua matrice di controllo:

	#grid(
		columns: (0.5fr, 0.5fr),
		[$ H =
		  mat(
		  2, 0, 0, 1, 1;
		  0, 2, 0, 0, 2;
		  0, 0, 1, 2, 0) $],
		[$ H^(t) =
		  mat(2, 0, 0;
		  0, 2, 0;
		  0, 0, 1;
		  1, 0, 2;
		  1, 2, 0) $]
	)

	Si supponga che venga trasmessa la parola $x = (10110)$ e che la parola
	ricevuta sia $y = (10010)$. Si ha:

	$ y(H^(t)) =
	  mat(1, 0, 0, 1, 0)
	  mat(2, 0, 0;
		  0, 2, 0;
		  0, 0, 1;
		  1, 0, 2;
		  1, 2, 0) =
	  mat(1 dot 2 + 0 dot 0 + 0 dot 0 + 1 dot 1 + 0 dot 1;
		  1 dot 0 + 0 dot 2 + 0 dot 0 + 1 dot 0 + 0 dot 2;
		  1 dot 0 + 0 dot 0 + 0 dot 1 + 1 dot 2 + 0 dot 0)^(t) =
	  mat(0, 0, 2) = 2 mat(0, 0, 1) $

	L'errore é quindi nella terza componente. $y$ viene quindi corretto come:

	$ y − e = mat(1, 0, 0, 1, 0) − mat(0, 0, 2, 0, 0) = mat(1, 0, 1, 1, 0) $
]
