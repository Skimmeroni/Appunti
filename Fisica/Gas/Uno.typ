#import "../Fisica_defs.typ": *

Lo studio dei gas permette di meglio descrivere il modo in cui calore e
lavoro possono essere scambiati fra un sistema e l'ambiente esterno. Si
consideri pertanto un gas ideale, contenuto in un recipiente deformabile
di volume $V_(i)$ alla pressione $p_(i)$ e alla temperatura $T_(i)$.
Questa situazione descrive lo _stato iniziale_. Si ha interesse ad agire
sul gas affinché questo raggiunga un nuovo stato, chiamato _stato finale_,
caratterizzato da dei propri valori di volume, pressione e temperatura,
rispettivamente $V_(f)$, $p_(f)$ e $T_(f)$.

Il processo di modifica di dello stato di un gas prende il nome di
*processo termodinamico* o *trasformazione termodinamica*. Affinché
un processo di questo tipo possa avvenire, é necessario che avvenga
un trasferimento di energia fra il gas e l'ambiente, sotto forma di
calore o di lavoro. In particolare, il calore é positivo se viene
fornito dall'esterno al gas, e negativo se ceduto dal gas all'esterno,
mentre il lavoro é positivo se é compiuto dal gas verso l'esterno e
negativo se compiuto dall'esterno verso il gas. A differenza di pressione,
volume e temperatura, che descrivono lo stato in cui il gas si trova in
un certo istante, calore e lavoro descrivono il _passaggio_ del gas da
uno stato all'altro, e sono pertanto chiamate *variabili di scambio*.

Si supponga di voler aumentare il volume del (recipiente del) gas
riducendo la forza con cui il recipiente é tenuto fermo. Questo
induce il gas a spingere le pareti del recipiente verso l'esterno
con forza $arrow(F)$ di un certo scarto $d arrow(s)$. Assumendo che
tale scarto sia molto piccolo, é possibile pensare che la forza che
il gas imprime sia costante per tutto il processo. Il modulo della
forza é uguale al prodotto fra la pressione del gas e l'area su cui
questo preme, pertanto il lavoro compiuto dal gas in un istante
infinitesimo é dato da:

$ d W = arrow(F) dot d arrow(s) = p A d s = p A d s = p d V $

Integrando, si ha il lavoro compiuto dal gas lungo tutto il processo:

$ W = integral d W = integral^(V_(f))_(V_(i)) p d V $

Si noti come tale espressione, per quanto corretta, é difficilmente
calcolabile cosí com'é, perché il modo in cui la pressione di un gas
varia rispetto alle variazioni di volume é in genere ignota.

In generale, quando un gas o un qualsiasi sistema fisico passa da uno
stato all'altro, il calore assorbito/ceduto ed il lavoro compiuto/subito
dipendono solamente dalla natura del processo. É peró possibile osservare
empiricamente qualcosa di piú forte, ovvero che la differenza $Q - W$ é
la medesima per qualsiasi processo e dipende solamente dagli stati
iniziali e finali, non dagli stati intermedi che sono stati necessari per
raggiungerlo. Tale quantitá viene chiamata *energia interna*:

$ Delta E_("int") = E_("int", "f") - E_("int", "i") = Q - W $

Questo concetto é riassunto dal *primo principio della termodinamica*:
la quantitá di energia interna di un sistema fisico aumenta se vi viene
fornito calore $Q$ e diminuisce se questo compie un lavoro $W$. Di fatto,
il primo principio della termodinamica é una generalizzazione del principio
di conservazione dell'energia a sistemi non isolati: sistemi fisici possono
"comunicare" con l'esterno scambiando calore e/o lavoro. Si noti come il
lavoro che compare nell'equazione é quello che é compiuto _dal_ sistema,
non quello che viene compiuto _sul_ sistema, e pertanto ha segno negativo.

#exercise[
	Un sistema termodinamico compie un lavoro di $220 joule$, perdendo
	$500 joule$ di energia interna. Quanta energia viene ceduta dal
	sistema sotto forma di calore?
]
#solution[
	La variazione dell'energia interna é negativa, perché il sistema sta
	perdendo energia. Anche il lavoro é peró negativo, perché é compiuto
	dal sistema. Pertanto:

	$ Delta E_("int") = Q - W =>
	  Q = Delta E_("int") + W = -500 joule + (-220 joule) = -720 joule $

	Che ha segno negativo, in accordo con il fatto che il calore viene
	ceduto.
]
