#import "../Fisica_defs.typ": *

Il principio zero della termodinamica assicura che l'essere in
equilibrio termico é una proprietá transitiva, ma non descrive
_perché_ tale equilibrio avvenga. In particolare, l'equilibrio
termico viene raggiunto perché fra due corpi a temperatura
(inizialmente) diversa avviene un trasferimento di energia
termica; tale trasferimento di energia prende il nome di
*calore*, indicato con $Q$ #footnote[Sebbene siano talvolta
usati in maniera intercambiabile nel gergo comune, _calore_ e
_temperatura_ sono due concetti distinti, per quanto legati.].

Essendo un trasferimento di energia, il calore $Q$ ha segno
positivo quando un corpo o un sistema fisico guadagna energi
interna (l'energia é trasferita dall'esterno del sistema al
sistema), mentre ha segno negativo quando un corpo o un sistema
fisico perde energia interna (l'energia é trasferita dal sistema
all'esterno del sistema). Naturalmente, a meno di compiere un
intervento esterno, il flusso del calore avviene sempre dall'entitá
con la temperatura piú alta a quello con la temperatura piú bassa.

Per il medesimo motivo, l'unitá di misura del calore é il Joule.
Tuttavia, esiste un'altra unitá di misura spesso utilizzata chiamata
*caloria*; una caloria rappresenta l'ammontare di energia (termica)
necessario a far passare la temperatura di $1 gram$ di acqua da $14.5
degreeCelsius$ a $15.5 degreeCelsius$. Una caloria ed un Joule possono
essere convertite l'una nell'altra a partire dalla seguente legge:

$ 1 "caloria" = 4.1868 joule $

La variazione di temperatura $Delta T$ indotta dall'aumento o dalla
perdita di energia termica da parte di un corpo sotto forma di calore
$Q$ sono proporzionalmente legate dalla seguente legge:

$ Q = C Delta T = C (T_(f) - T_(i)) $

Dove $T_(i)$ e $T_(f)$ sono la temperatura del corpo rispettivamente
prima e dopo il trasferimento di calore.

La costante di proporzionalitá $C$ prende il nome di *capacitá termica*,
e viene misurata in $joule slash kelvin$. Si osserva che la capacitá
termica di due corpi costituiti dallo stesso materiale é proporzionale
solamente alla loro massa. Puó pertanto essere utile definire una capacitá
termica rispetto all'unitá di massa, modificando l'equazione precedente
come:

$ Q = c m Delta T = c m (T_(f) - T_(i)) $

Dove $m$ é la massa dell'oggetto e $c$ é una costante, chiamata *calore
specifico*, univoca per ciascun materiale e misurata in $joule / kilogram
dot kelvin$. Il calore specifico rappresenta quanto un materiale sia
"suscettibile" all'aumento della temperatura per effetto del calore.
Sebbene il calore specifico di un oggetto dipenda anche dalla temperatura,
nella maggior parte dei casi puó essere approssimato costante.

#exercise[
	Viene sparato un proiettile d'argento con velocitá iniziale di
	$200 metre / second$ contro un bersaglio. Sapendo che il calore
	specifico dell'argento é $234 joule / kilogram dot kelvin$ ed
	assumendo che tutta l'energia interna prodotta dall'urto rimanga
	nel proiettile, di quanto varia la sua temperatura?
]
#solution[
	Il sistema proiettile bersaglio puó essere schematizzato come
	isolato. Pertanto, l'energia cinetica del proiettile é interamente
	convertita in energia termica del bersaglio all'impatto, trasferita
	per mezzo del calore:

	$ Q = K =>
	  c cancel(m) Delta T = frac(1, 2) cancel(m) v^(2) =>
	  c Delta T = frac(1, 2) v^(2) =>
	  Delta T = frac(v^(2), 2 c) =
	  frac((200 metre / second)^(2), 2 dot 234 joule / kilogram dot kelvin) approx
	  85 kelvin $
]

La precedente equazione permette di mettere in relazione il calore di
due corpi $A$ e $B$ in un sistema isolato che si trovano all'equilibrio
termico. In una situazione di questo tipo, tutta l'energia termica (sotto
forma di calore) persa dall'uno é interamente assorbita dall'altro.
Assumendo, senza perditá di generalitá, che $A$ sia il corpo che cede
energia e $B$ quello che la guadagna, si ha:

$ -Q_(A) = +Q_(B) $

Sostituendo da ambo le parti l'equazione per il calore specifico:

$ -c_(A) m_(A) (T_(f, A) - T_(i, A)) = c_(B) m_(B) (T_(f, B) - T_(i, B)) $

Dove i pedici $A$ e $B$ si riferiscono al calore specifico, alla massa
e alla temperatura iniziale rispettivamente dei corpi $A$ e $B$. Avendo
peró assunto che ci si trova all'equilibrio termico, le due temperature
finali $T_(f, A)$ e $T_(f, B)$ coincidono, pertanto:

$ -c_(A) m_(A) (T_(f) - T_(i, A)) = c_(B) m_(B) (T_(f) - T_(i, B)) $

Riscrivendo l'equazione rispetto a $T_(f)$:

$ -c_(A) m_(A) T_(f) + c_(A) m_(A) T_(i, A) =
  c_(B) m_(B) T_(f) - c_(B) m_(B) T_(i, B) => \
  -c_(A) m_(A) T_(f) - c_(B) m_(B) T_(f) =
  - c_(A) m_(A) T_(i, A) - c_(B) m_(B) T_(i, B) => \
  c_(A) m_(A) T_(f) + c_(B) m_(B) T_(f) =
  c_(A) m_(A) T_(i, A) + c_(B) m_(B) T_(i, B) => \
  (c_(A) m_(A) + c_(B) m_(B)) T_(f) =
  c_(A) m_(A) T_(i, A) + c_(B) m_(B) T_(i, B) => \
  T_(f) = frac(c_(A) m_(A) T_(i, A) + c_(B) m_(B) T_(i, B), c_(A) m_(A) + c_(B) m_(B)) $

#exercise[
	Un lingotto di un metallo sconosciuto di massa $0.050 kilogram$,
	inizialmente alla temperatura di $200.0 degreeCelsius$, viene
	posto in una vasca piena d'acqua di massa $0.400 kilogram$ ed
	inizialmente alla temperatura di $20.0 degreeCelsius$. Quando
	il sistema lingotto-vasca (assunto come sistema isolato) raggiunge
	l'equilibrio termico, la temperatura del sistema é $22.4 degreeCelsius$.
	Qual'é il calore specifico del metallo?
]
#solution[
	L'acqua ha una temperatura iniziale inferiore a quella del metallo,
	pertanto il calore fluisce dal metallo all'acqua. Isolando l'equazione
	rispetto al calore specifico del metallo:

	$ -c_("metallo") m_("metallo") (T_(f) - T_(i, "metallo")) =
	  c_("acqua") m_("acqua") (T_(f) - T_(i, "acqua")) => \
	  c_("metallo") = -frac(c_("acqua") m_("acqua") (T_(f) - T_(i, "acqua")),
	  m_("metallo") (T_(f) - T_(i, "metallo"))) =
	  frac(4187 joule / kilogram dot kelvin dot 0.400 kilogram dot (22.4 degreeCelsius - 20 degreeCelsius),
	  0.050 kilogram dot (200.0 degreeCelsius - 22.4 degreeCelsius)) approx 453 joule / kilogram dot kelvin $
]
