#import "../Fisica_defs.typ": *

Per descrivere i fenomeni naturali è necessario *misurare* i vari aspetti
che li caratterizzano. Ogni *misura* è associata ad una *grandezza fisica*:
le leggi della fisica sono espresse da relazioni matematiche fra le grandezze
fisiche.

Se si vuole comunicare i risultati di una misura a qualcuno che voglia
riprodurla è necessario definire una “unità campione” comune, che sia
valida per entrambe le parti. Una qualunque unità campione deve essere
facilmente disponibile e deve possedere una qualche proprietà che permetta
una misura affidabile e riproducibile. Lo stesso campione, utilizzato da
misuratori diversi per effettuare la stessa misura in un posto qualunque
dell'Universo, deve dare sempre lo stesso risultato in ogni occasione.
Inoltre, i campioni non devono cambiare o deformarsi nel tempo.

I campioni utilizzati nella fisica sono stati standardizzati dalla
comunitá scientifica, e continuano a venire rifiniti per essere il
piú precisi possibile. Questi campioni nella fisica sono chiamati
*unitá di misura*. Esistono differenti insiemi di unitá di misura,
ma quello piú importante ed adottato é il *Sistema Internazionale*
(abbreviato *SI*), costituito da sette unitá di misura *fontamentali*
che vengono fra loro combinate per generare unitá di misura composite.
Le unitá fondamentali del SI sono le seguenti:

#align(center,
	[#table(
		columns: 3,
		[*Grandezza*], [*Unitá di misura*], [*Simbolo*],
		[Lunghezza], [Metro], [$unit(metre)$],
		[Massa], [Chilogrammo], [$unit(kilogram)$],
		[Tempo], [Secondo], [$unit(second)$],
		[Temperatura], [Kelvin], [$unit(kelvin)$],
		[Corrente elettrica], [Ampere], [$unit(ampere)$],
		[Quantitá di materia], [Mole], [$unit(mole)$],
		[Intensitá luminosa], [Candela], [$unit(candela)$]
	)]
)

Il modo in cui il campionamento delle unitá di misura viene effettuato é
variegato. Ad esempio:

- Il metro é fissato alla distanza percorsa dalla luce nel vuoto in un tempo
  di $1299792458 unit(second)$. Questo sia perché la luce ha sempre la stessa
  velocitá, sia perché la luce é uguale a sé stessa dovunque nell'Universo;
- Il chilogrammo é fissato come la massa di un lega metallica tenuta sotto
  strettissime condizioni di sicurezza;
- Il secondo é fissato come $9192631770$ volte il periodo delle vibrazioni di
  un atomo di cesio-133, grazie all'alta precisione degli orologi atomici.

Oltre alle unitá SI di base, vengono anche usati i loro multipli e
sottomultipli. Per comoditá, vengono usati solamente i multipli e
sottomultipli delle decine di ordini di grandezza, e vengono chiamate
anteponendo alle unitá di base dei prefissi, quali:

#grid(
	columns: (0.5fr, 0.5fr),
	[#align(center,
		table(
			columns: 3,
			[*Potenza*], [*Prefisso*], [*Abbreviazione*],
			[$10^(-24)$], [yocto], [y],
			[$10^(-21)$], [zepto], [z],
			[$10^(-18)$], [atto], [a],
			[$10^(-15)$], [femto], [f],
			[$10^(-12)$], [pico], [p],
			[$10^(-9)$], [nano], [n],
			[$10^(-6)$], [micro], [$mu$],
			[$10^(-3)$], [milli], [m],
			[$10^(-2)$], [centi], [c],
			[$10^(-1)$], [deci], [d]
	))],
	[#align(center,
		table(
			columns: 3,
			[*Potenza*], [*Prefisso*], [*Abbreviazione*],
			[$10^(3)$], [kilo], [k],
			[$10^(6)$], [mega], [M],
			[$10^(9)$], [giga], [G],
			[$10^(12)$], [tera], [T],
			[$10^(15)$], [peta], [P],
			[$10^(18)$], [exa], [E],
			[$10^(21)$], [zetta], [Z],
			[$10^(24)$], [yotta], [Y]
	))]
)

Le grandezze scientifiche possono essere suddivise in due grandi
macrocategorie: le *grandezze scalari* e le *grandezze vettoriali*.
Le prime sono definite soltanto da un valore numerico, mentre le
seconde sono definite da un vettore orientato e dal suo modulo.
Una seconda distinzione (non mutualmente esclusiva con la precedente)
é quella tra le *grandezze quantizzate* e le *grandezze continue*.
Una grandezza quantizzata é una grandezza che puó assumere solo
valori multipli di una unitá elementare detta *quanto*, mentre
una grandezza continua é una grandezza che puó assumere ogni valore
reale possibile.

In fisica i valori delle misurazioni sono in genere espressi in una
notazione particolare, detta *notazione scientifica*. Per riscrivere
un valore nella notazione scientifica occorre dividerlo per una potenza
di dieci tale che il numero sia ridotto ad una sola cifra non decimale,
per poi moltiplicarlo per la potenza stessa. Questa notazione é molto
efficiente perché nella fisica é molto frequente che sia necessario
riportare dei valori con moltissime cifre, e la notazione scientifica
permette di esprimere un valore in maniera compatta senza perderne in
accuratezza.

#exercise[
	Convertire le seguenti grandezze in notazione scientifica: $0.0086
	unit(metre)$, $725555 unit(second)$, $0.00000000069 unit(kilogram)$.
]
#solution[
	#grid(
		columns: (0.3fr, 0.3fr, 0.4fr),
		[$ 0.0086 unit(metre) = 8.6 times 10^(-3) unit(metre) $],
		[$ 725555 unit(second) = 7.255555 times 10^(6) unit(second) $],
		[$ 0.00000000069 unit(kilogram) = 6.9 times 10^(-10) unit(kilogram) $]
	)
]
