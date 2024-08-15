#import "../Metodi_defs.typ": *

Nello scenario presentato nel precedente capitolo, due entitá sono in grado
di scambiarsi messaggi senza che terze parti siano in grado di leggerne il
contenuto. Si presenta peró un problema: per il ricevente non c'é modo di
sapere _davvero_ se il mittente del messaggio sia effettivamente chi dice
di essere o se sia qualcun'altro che lo sta impersonando. Diventa quindi
necessario associare al messaggio una *firma* che dia al ricevente la certezza
di aver ricevuto un messaggio da un mittente che é davvero chi dice di essere.
Una firma di questo tipo puó essere facilmente implementata mediante RSA.

Siano Alice e Bob due entitá che vogliono comunicare; senza perdita di
generalitá, si assuma che Alice sia il mittente e Bob il ricevente. Alice
ha una chiave di cifratura $(N_(A), r_(A))$ ed una chiave di decifratura
$(N_(A), s_(A))$, mentre Bob ha una chiave di cifratura $(N_(B), r_(B))$
ed una chiave di decifratura $(N_(B), s_(B))$. Naturalmente, le chiavi di
cifratura sono note per entrambi, mentre le chiavi di decifratura sono note
solamente ai rispettivi possessori.

Si assuma per semplicitá che $cal(P)$, l'insieme delle unitá di messaggi
in chiaro, e $cal(C)$, l'insieme delle unitá dei messaggi cifrati, coincidano.
Sia $F$ un messaggio non cifrato speciale (un numero identificativo, un
timestamp, ecc...) che fa da firma ai messaggi di Alice. Si noti come
Alice, per provare a Bob di essere sé stessa e non un impostore, non puó
semplicemente cifrare ed inviare $F$, perché si ripresenterebbe il problema.
Si distinguono due casi:

+ $N_(A) gt.eq N_(B)$. Per cifrare il suo messaggio, Alice
  innanzitutto cifra $F$ usando la sua chiave di decifratura
  (anziché quella di cifratura, come farebbe di norma), ottenendo
  $F_(A) = F^(s_(A)) mod N_(A)$. A partire da questa, calcola
  $F_(A, B) = F_(A)^(r_(B)) mod N_(B)$ e invia a Bob sia il messaggio
  che vuole inviargli, sia la sua firma $F_(A, B)$. Bob ricostruisce
  sia il messaggio sia la firma $F_(A) = F_(A, B)^(s_(B)) N_(B)$,
  per poi ottenere $F$ come $F = F_(A)^(r_(A)) mod N_(A)$;
+ $N_(A) < N_(B)$. Per cifrare il suo messaggio, Alice innanzitutto
  cifra $F$ usando la chiave di cifratura di Bob (anziché la sua chiave
  di cifratura, come farebbe di norma), ottenendo $F_(B) = F^(r_(B)) mod
  N_(B)$. A partire da questa, calcola $F_(B, A) = F_(B)^(s_(A)) mod N_(A)$
  e invia a Bob sia il messaggio che vuole inviargli, sia la sua firma
  $F_(B, A)$. Bob ricostruisce sia il messaggio sia la firma $F_(B) =
  F_(B, A)^(r_(A)) N_(A)$ per poi ottenere $F$ come $F = F_(B)^(s_(B))
  mod N_(B)$.

Bob ha la certezza che il messaggio provenga da Alice perché per
ricostruire la firma ha dovuto usare la chiave pubblica di Alice,
e solamente Alice puó conoscere la relativa chiave privata, e aver
quindi cifrato il messaggio con essa.
