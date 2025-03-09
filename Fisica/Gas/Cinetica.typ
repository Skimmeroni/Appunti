	\section{Teoria cinetica dei gas}
		
		Finora abbiamo descritto i gas perfetti con variabili macroscopiche, come 
		temperatura, pressione e volume. Possiamo per\`o ripensare la descrizione 
		di un gas anche in termini microscopici, descrivendo le singole interazioni 
		che avvengono tra le sue molecole.
		
		La tipologia di modello fisico che andremo a costituire per i gas prende il 
		nome di \textbf{modello strutturale}. Un modello strutturale \`e un modello 
		di un sistema che \`e troppo grande o troppo piccolo per essere osservato 
		direttamente (come il sistema solare o gli atomi). In particolare, chiameremo 
		questo modello \textbf{teoria cinetica}.

		La teoria cinetica tratta un gas ideale come un insieme di molecole, avente 
		le seguenti propriet\`a:

		\begin{enumerate}
			\item 
			\textbf{Costituenti fisici:} \\
			\\
			Il gas \`e costituito da una certa quantit\`a di molecole identiche 
			all'interno di un recipiente cubico avente lato di lunghezza $d$. Il 
			numero di molecole nel gas \`e elevato e la separazione media tra le 
			molecole \`e grande se confrontata con le loro dimensioni. Pertanto, 
			il volume delle molecole \`e trascurabile
			\item
			\textbf{Comportamento dei costituenti:}
			\begin{enumerate}
				\item 
				Le singole molecole obbediscono alle leggi di Newton sul moto, ma il 
				loro moto \`e \textit{isotropo}: possono muoversi in qualsiasi direzione 
				a qualsiasi velocit\`a.
				\item
				Le uniche interazioni che avvengono tra le particelle sono urti elastici 
				relativi al loro movimento: escludiamo quindi la loro interazione 
				gravitazionale.
				\item
				Le molecole urtano in modo elastico le pareti del recipiente.
			\end{enumerate}
		\end{enumerate}
		
		Iniziamo la costruzione del modello ripensando quella che abbiamo indicato 
		come la pressione $P$ del gas in termini microscopici. Immaginiamo un numero 
		$N$ di molecole di un gas ideale qualsiasi in un cubo di lato $d$ e di volume 
		$V$, ciascuna di uguale massa $m_{0}$. Concentriamo la nostra attenzione su 
		una qualunque di queste molecole, assumendo che si stia muovendo di velocit\`a 
		$\vv{v_{i}}$, scomposta lungo gli assi in $v_{xi}$ e $v_{yi}$ \footnote{il 
		pedice $i$ si riferisce al fatto che stiamo considerando la $i$-esima 
		particella, non al valore iniziale}. Quando la molecola urta una delle pareti 
		in modo elastico (\textit{propriet\`a $2c$}) la componente della velocit\`a 
		parallela alla parete (assumiamo $x$, ma \`e indifferente) cambia di segno. 
		Per le propriet\`a degli urti, sappiamo che la quantit\`a di moto prima e 
		dopo l'avvenire dell'urto \`e costante: se la quantit\`a di moto prima 
		dell'urto \`e $m_{0}v_{xi}$, allora dopo l'urto sar\`a uguale a 
		$m_{0}(-v_{xi}) = -m_{0}v_{xi}$. Indicando con $\Delta p_{xi}$ la
		variazione di quantit\`a di moto prima e dopo l'urto, abbiamo:

		\begin{equation*}
			\Delta p_{xi} = -m_{0}v_{xi} - (m_{0}v_{xi}) = -2m_{0}v_{xi}
		\end{equation*}

		Applicando il teorema dell'impulso-quantit\`a di moto alla molecola, 
		otteniamo:

		\begin{equation*}
			\overline{F}_{i,\textrm{molecola}} \Delta t_{\textrm{urto}} = 
			\Delta p_{xi} = -2m_{0}v_{xi}
		\end{equation*}
		
		dove $\overline{F}_{i,\textrm{molecola}}$ \`e la forza media che si esercita 
		sulla particella e $\Delta t$ indica la durata complessiva dell'urto. Per 
		colpire la parete due volte di fila, la molecola deve compiere una distanza 
		$2d$ in direzione $x$, pertanto il tempo fra due urti successivi con la 
		stessa parete \`e uguale a:

		\begin{equation*}
			\Delta t = \frac{2d}{v_{xi}}
		\end{equation*}

		La forza che provoca la variazione della quantit\`a di moto della molecola si 
		esercita solo durante l'urto stesso. Possiamo tuttavia calcolare la forza 
		media a lungo termine per molti tragitti di andata e ritorno attraverso il 
		cubo facendo la media dell'equazione della variazione della quantit\`a di 
		moto nell'intervallo di tempo necessario per compiere un solo tragitto di 
		andata e ritorno, ricavato dalla equazione precedente. La variazione media 
		di quantit\`a di moto per tragitto per l'intervallo di tempo richiesto per 
		molti tragitti \`e la stessa che si ha durante il breve intervallo di tempo 
		in cui avviene l'urto. Possiamo allora riscrivere l'equazione della 
		variazione di quantit\`a di moto come:

		\begin{equation*}
			\overline{F}_{i}\Delta t = \Delta p_{xi} = -2m_{0}v_{xi}
		\end{equation*}
		
		Dove $\overline{F}_{i}$ \`e la componente della forza media nell'intervallo 
		di tempo necessario alla molecola per un tragitto di andata e ritorno 
		attraverso il cubo. Dato che in tale intervallo di tempo avviene esattamente 
		un urto, questo risultato rappresenta anche la forza media a lungo termine 
		sulla molecola in un intervallo di tempo abbastanza lungo da poter contenere 
		un gran numero di intervalli $\Delta t$.

		Combinando le due equazioni appena ricavate, abbiamo:

		\begin{equation*}
			\overline{F}_{i} = -\frac{2m_{0}v_{xi}}{\Delta t} = 
			-\frac{2m_{0}v_{xi}}{\left(\frac{2d}{v_{xi}}\right)} 
			= -\frac{\cancel{2}(m_{0}v_{xi})(v_{xi})}{\cancel{2}d} = 
			-\frac{m_{0}v_{xi}^{2}}{d}
		\end{equation*}

		Se applichiamo la terza legge di Newton, abbiamo che la forza che la molecola 
		esercita sulla parete \`e uguale e contraria alla forza che la parete 
		esercita sulla molecola:

		\begin{equation*}
			\overline{F}_{i,\textrm{sulla parete}} = -\overline{F}_{i} = 
			-\left(-\frac{m_{0}v_{xi}^{2}}{d}\right) = \frac{m_{0}v_{xi}^{2}}{d}
		\end{equation*}
		
		La forza totale media $\overline{F}$ esercitata dal gas sulla parete \`e la 
		somma di tutte le forze esercitate dalle singole molecole:

		\begin{equation*}
			\overline{F} = \sum_{i = 1}^{N}{\frac{m_{0}v_{xi}^{2}}{d}} = 
			\left(\frac{m_{0}}{d}\right)\sum_{i = 1}^{N}{v_{xi}^{2}}
		\end{equation*}

		Dove il fattore $m_{0}/d$ \`e stato portato fuori dal segno dell'integrale, 
		perch\`e le particelle hanno tutte la stessa massa. Se le particelle nel gas 
		sono poche, dovremmo aspettarci che questa forza \`e diversa da zero quando 
		la particella urta le pareti del gas ed \`e nulla quando la particella si 
		sta muovendo all'interno del volume di gas. Abbiamo per\`o assunto che il 
		numero di particelle sia molto grande, pertanto possiamo aspettarci che 
		questa forza esercitata sulle pareti si mantenga approssimativamente 
		costante. Questo perch\`e se le molecole sono in numero enorme, possiamo 
		immaginarci che appena una particella ha subito un urto in un certo punto, 
		ci sia un'altra particella vicina che sta per subire un urto nello stesso 
		punto, e quindi l'intervallo di tempo tra l'avvenire di due urti \`e 
		approssimabile a zero. Pertanto:

		\begin{equation*}
			F = \left(\frac{m_{0}}{d}\right)\sum_{i = 1}^{N}{v_{xi}^{2}}
		\end{equation*}

		Per procedere oltre, dobbiamo esprimere il valore medio della velocit\`a al 
		quadrato delle particelle. Sappiamo che la media aritmetica di un insieme di 
		valori \`e la somma di questi valori divisa per il numero dei valori; 
		indicando con $N$ il numero totale di molecole, avremo:

		\begin{equation*}
			\overline{v_{xi}^{2}} = \frac{\sum_{i = 1}^{N}{v_{xi}^{2}}}{N} 
			\quad \Rightarrow \quad \sum_{i = 1}^{N}{v_{xi}^{2}} = 
			N\overline{v_{xi}^{2}} 
		\end{equation*}

		Sostituendo questo risultato nell'equazione precedente:

		\begin{equation*}
			F = \left(\frac{m_{0}}{d}\right)N\overline{v_{xi}^{2}}
		\end{equation*}
		
		Sappiamo che per scomporre un vettore lungo le sue componenti, occorre 
		applicare il Teorema di Pitagora. Nel caso della velocit\`a di una 
		singola particella, avremo:

		\begin{equation*}
			v_{i}^{2} = v_{xi}^{2} + v_{yi}^{2} + v_{zi}^{2}
		\end{equation*}

		Se invece consideriamo la media delle velocit\`a di tutte le molecole:

		\begin{equation*}
			\overline{v^{2}} = \overline{v_{xi}^{2}} + \overline{v_{yi}^{2}} + 
			\overline{v_{zi}^{2}}
		\end{equation*}

		Abbiamo per\`o detto che le molecole possono muoversi in qualsiasi direzione 
		con qualsiasi velocit\`a, quindi avremo necessariamente che 
		$\overline{v_{xi}^{2}} = \overline{v_{yi}^{2}} = \overline{v_{zi}^{2}}$. 
		Ma allora:

		\begin{equation*}
			\overline{v^{2}} = \overline{v_{xi}^{2}} + \overline{v_{yi}^{2}} + 
			\overline{v_{zi}^{2}} = \overline{v_{xi}^{2}} + \overline{v_{xi}^{2}} + 
			\overline{v_{xi}^{2}} = 3\overline{v_{xi}^{2}}
		\end{equation*}
		
		Sostituiamo questo risultato nell'equazione precedente:
		
		\begin{equation*}
			F = \frac{1}{3}N\frac{m_{0}\overline{v^{2}}}{d}
		\end{equation*}
		
		Usiamo questa forza per esprimere la pressione che il gas esercita sulle pareti:

		\begin{equation*}
			P = \frac{F}{A} = F\frac{1}{d^{2}} = 
			\frac{1}{3}N\frac{m_{0}\overline{v^{2}}}{d^{3}} 
			= \frac{1}{3}\left(\frac{N}{V}\right)m_{0}\overline{v^{2}}
			= \frac{2}{3}\left(\frac{N}{V}\right)
			\left(\frac{1}{2}m_{0}\overline{v^{2}}\right)
		\end{equation*}
		
		Riscrivendo l'equazione come di cui sopra, si ottiene un'energia cinetica 
		nella forma del valore $\frac{1}{2}m_{0}\overline{v^{2}}$. In particolare, 
		se abbiamo definito $\overline{v^{2}}$ come la velocit\`a media delle 
		particelle del gas, allora $\frac{1}{2}m_{0}\overline{v^{2}}$ dovr\`a essere 
		l'energia cinetica media associata a una singola particella. Indicandola con 
		$\overline{K}$, abbiamo:
		
		\begin{equation}
			P = \frac{2}{3}\overline{K}\left(\frac{N}{V}\right)
		\end{equation}
		
		Siamo allora riusciti a collegare una quantit\`a macroscopica quale la 
		pressione a interazioni microscopiche tra particelle.

		Questa equazione d\`a una spiegazione a diversi fenomeni legati alla 
		variazione della pressione. Ad esempio, aumentando il numero di molecole 
		$N$ aumenta anche la pressione $P$: questo perch\`e un gas pi\`u denso ha 
		anche una maggiore pressione. O ancora, aumentando l'energia cinetica media 
		$\overline{K}$ aumenta anche la pressione: questo perch\`e un aumento 
		dell'energia cinetica media corrisponde a un aumento della temperatura del 
		gas, che sappiamo aumentare a sua volta la temperatura ($PV = nRT$).
		
		Anche la temperatura pu\`o essere legata a interazioni microscopiche tra le 
		particelle del gas. Innanzitutto, riscriviamo l'equazione precedente 
		spostando il volume $V$ a sinistra:

		\begin{equation*}
			PV = \frac{2}{3}\overline{K}N
		\end{equation*}

		Eguagliando questa equazione con l'equazione di stato dei gas perfetti 
		(nella forma che contiene la costante di Boltzmann):

		\begin{equation*}
			Nk_{b}T = \frac{2}{3}\overline{K}N \quad \Rightarrow \quad 
			T = \frac{2}{3k_{b}}\overline{K}
		\end{equation*}

		Questo indica che la temperatura di un gas \`e legata direttamente 
		all'energia cinetica media delle sue molecole. Riscriviamo l'equazione 
		mettendo in evidenza l'energia cinetica media molecolare:

		\begin{equation}
			\overline{K} = \frac{3}{2}k_{b}T
		\end{equation}

		Abbiamo qui un risultato interessante; ricordando che 
		$\overline{v_{x}^{2}} = \overline{v_{y}^{2}} = \overline{v_{z}^{2}} 
		= \frac{1}{3}\overline{v^{2}}$ e che $\overline{K} = 
		\frac{1}{2}m_{0}\overline{v^{2}}$, risulta, dopo facili calcoli, che:

		\begin{align}
			\frac{1}{2}m_{0}\overline{v_{x}^{2}}&= \overline{K_{x}} = \frac{1}{2}k_{b}T &
			\frac{1}{2}m_{0}\overline{v_{y}^{2}}&= \overline{K_{y}} = \frac{1}{2}k_{b}T &
			\frac{1}{2}m_{0}\overline{v_{z}^{2}}&= \overline{K_{z}} = \frac{1}{2}k_{b}T 
		\end{align}

		Ovvero, per ognuna delle tre dimensioni in cui si muove ($x,y,z$), la 
		particella porta un ``contributo'' di energia cinetica molecolare media 
		pari a $\frac{1}{2}k_{b}T$. Se sommiamo queste tre quantit\`a abbiamo 
		che l'energia cinetica media molecolare complessiva associata a una 
		particella \`e proprio $3(\frac{1}{2}k_{b}T) = \frac{3}{2}k_{b}T$, in 
		accordo con quanto detto finora.
		
		Possiamo intendere questo risultato in senso pi\`u ampio. 
		Enunciamo il \textbf{teorema di equipartizione dell'energia}:

		\textbf{Ogni grado di libert\`a che le molecole di un gas possiedono d\`a un 
		contributo di energia cinetica media molecolare alle stesse pari a 
		$\frac{1}{2}k_{b}T$. I gradi di libert\`a sono quelli associati ai possibili 
		moti della molecola: traslazione, rotazione, vibrazione.}

		Con ``grado di libert\`a'' si intende ogni modo indipendente in cui la 
		velocit\`a pu\`o muoversi. Se la molecola non ruota e non vibra ma si muove 
		soltanto nello spazio nelle tre direzioni, come nel caso dei gas perfetti, 
		allora abbiamo esattamente tre gradi di libert\`a. Infatti, nuovamente, 
		$3(\frac{1}{2}k_{b}T) = \frac{3}{2}k_{b}T$

		L'energia cinetica totale di tutte le molecole sar\`a allora il prodotto tra 
		l'energia cinetica molecolare media e il numero di molecole, ovvero:

		\begin{equation}
			K_{\textrm{tot trans}} = N\overline{K} = \frac{3}{2}Nk_{b}T = \frac{3}{2}nRT
		\end{equation}

		La radice quadrata di $\overline{v^{2}}$ \`e detta 
		\textbf{velocit\`a quadratica media (rms)} delle molecole. 
		Ricaviamola:

		\begin{equation}
			v_{rms} = \sqrt{\overline{v^{2}}} = 
			\sqrt{\frac{3k_{b}T}{m_{0}}} = 
			\sqrt{\frac{3RT}{M}}
		\end{equation}

		Dove $M$ \`e la massa molare espressa in \si{\\\kilogram\per\mole} 
		ed \`e uguale a $m_{0}N_{A}$

		\examplebox{teoria cinetica dei gas}{
			\textbf{Una bombola usata per riempire palloncini di elio ha volume 
			\SI{0.300}{\cubic\metre} e contiene \SI{2}{\mol} di gas di elio alla 
			temperatura di \SI{293.0}{\kelvin}.}
			\renewcommand{\labelenumi}{\Alph{enumi}}
			\begin{enumerate}
				\item 
				\textbf{Qual'\`e l'energia traslazionale totale delle molecole del gas?}
				\begin{equation*}
					K_{\textrm{tot trans}} = \frac{3}{2}nRT = \frac{3}{2}(\SI{2}{\mol})
					\left(\SI{8.314}{\joule\per\mole\cdot\kelvin}\right)(\SI{293.0}{\kelvin})
					= \SI{7.30e3}{\joule}
				\end{equation*}
				\item
				\textbf{Qual\`e l'energia cinetica media per singola molecola?}
				\begin{equation*}
					\overline{K} = \frac{3}{2}k_{b}T = \frac{3}{2}
					\left(\SI{1.38e-23}{\\\joule\per\kelvin}\right)(\SI{293.0}{\kelvin})
					= \SI{6.07e-21}{\joule}
				\end{equation*}
			\end{enumerate}
		}

\newpage
