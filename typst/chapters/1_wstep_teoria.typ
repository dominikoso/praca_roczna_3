#heading(numbering: none)[Wstęp]

Współczesny dyskurs publiczny - kreowany przez polityków, dziennikarzy i komentatorów - jest nasycony próbami przekonania odbiorcy do określonych racji. Obok rzetelnej argumentacji regularnie pojawiają się w nim błędy logiczne i chwyty erystyczne. Choć logika bada te zjawiska od czasów starożytnych, współcześnie, pod pojęciem technik perswazyjnych, stanowią one również przedmiot intensywnych badań w dziedzinie przetwarzania języka naturalnego (NLP).

Celem pracy jest sprawdzenie, na ile poszczególne techniki z taksonomii zadania BSNLP 2025 (formalnie: SlavicNLP 2025 Shared Task) da się powiązać z klasycznymi fallacjami i schematami argumentacyjnymi, a na ile są to kategorie bez odpowiednika w tradycji logicznej. Zbadane zostanie też, jak ta taksonomia - opracowana z myślą o materiale wielojęzycznym - sprawdza się w praktyce przy pilotażowej analizie pojedynczego, w pełni zanotowanego wystąpienia z polskiej debaty sejmowej.

= Wprowadzenie

== Rys historyczny i klasyfikacja błędów logicznych

Pytanie o to, co odróżnia dobry argument od złego, jest tak stare jak sama logika. Arystoteles w traktacie _O dowodach sofistycznych_ opisał trzynaście rodzajów pozornych, sofistycznych obaleń @aristotle_elenchi: sześć z nich zależy od dwuznaczności języka, w jakim sformułowano argument (jak ekwiwokacja czy amfibolia), pozostałe siedem zależy od samej struktury rozumowania, jak _petitio principii_, czyli błędne koło polegające na zakładaniu tego, co dopiero ma zostać udowodnione, oraz fałszywa przyczyna. Przez kolejne stulecia ten katalog pozostawał w logice na marginesie, traktowany raczej jako dydaktyczna ciekawostka niż osobny przedmiot badań. Zmieniła to dopiero książka C.L. Hamblina _Fallacies_ z 1970 roku @hamblin1970fallacies, w której autor pokazał, że podręcznikowe ujęcie błędów logicznych - powielane od wieków bez większych zmian i nazwane przez niego _standard treatment_ - nie proponuje w istocie spójnej definicji fallacji, a jedynie zestaw przykładów bez łączącej je teorii. Krytyka Hamblina otworzyła nowy etap badań nad argumentacją, kontynuowany między innymi przez Teresę Hołówkę, która w podobnym duchu porządkowała typowe błędy argumentacyjne pojawiające się w codziennych sporach, choć bez tak rozbudowanego aparatu teoretycznego @holowka1998bledy.

Fallacje dzieli się zwykle na formalne, polegające na naruszeniu reguł logiki formalnej niezależnie od treści argumentu, oraz nieformalne, zależne od treści i kontekstu, w jakim argument padł. Fallacje nieformalne stanowią zdecydowaną większość błędów opisywanych w literaturze przedmiotu i to im poświęcona jest dalsza część tej pracy.

== Schematy argumentów Waltona

Jedną z odpowiedzi na krytykę Hamblina jest koncepcja Douglasa Waltona, który zamiast katalogować błędy jako osobną kategorię, opisał najpierw ogólne wzorce rozumowania powszechnie stosowane w codziennej argumentacji - schematy argumentów (_argumentation schemes_). Wraz z Christopherem Reedem i Fabrizio Macagno skatalogował ich 96 @walton2008argumentation, między innymi odwołanie do opinii eksperta, odwołanie do popularności danego poglądu czy argument ze skutków. Każdemu schematowi towarzyszy zestaw pytań krytycznych: dla odwołania do opinii eksperta należy na przykład sprawdzić, czy przywoływana osoba rzeczywiście jest ekspertem w danej dziedzinie i czy wypowiada się w granicach swoich kompetencji. Błąd, w tym ujęciu, pojawia się dopiero wtedy, gdy takie pytania są ignorowane albo nie da się na nie odpowiedzieć twierdząco - odwołanie do autorytetu samo w sobie nie jest więc fallacją, staje się nią dopiero przy nieuczciwym użyciu. To rozróżnienie jest istotne dla dalszej części pracy: część technik perswazyjnych z taksonomii BSNLP omówionej w kolejnym podrozdziale da się opisać właśnie jako nieuczciwe zastosowanie skądinąd neutralnych schematów argumentacyjnych.

== Pragmatyka języka: maksymy Grice'a

Szczególne znaczenie dla analizy technik perswazyjnych ma pragmatyka języka, w tym koncepcja Paula Grice'a. Grice sformułował fundamentalną zasadę kooperacji, nakazującą uczestnikom rozmowy wnosić do niej taki wkład, jaki jest wymagany przez aktualny cel i kierunek wymiany zdań @grice1975logic. Zasadę tę rozkłada on na cztery maksymy konwersacyjne: maksymę jakości (mów prawdę i nie twierdź tego, czego nie potrafisz uzasadnić), maksymę ilości (mów tyle, ile trzeba, nie więcej i nie mniej), maksymę odniesienia (mów na temat) oraz maksymę sposobu (wyrażaj się jasno i unikaj niejednoznaczności). Zwrócił on uwagę, że nieuczciwa perswazja w naturalnych rozmowach rzadko przybiera formę czystego błędu w dowodzie logicznym; znacznie częściej opiera się na tym, co zostaje zaimplikowane poprzez pozorne złamanie jednej z tych maksym przy jednoczesnym założeniu, że rozmówca wciąż współpracuje - tak powstaje implikatura konwersacyjna, czyli treść, którą wypowiedź komunikuje, choć nie została w niej dosłownie wyrażona. Podobnie działają presupozycje, czyli treści milcząco zakładane przez zdanie: pytanie w rodzaju "Od kiedy przestaliście okradać budżet państwa?" zakłada, że okradanie budżetu miało miejsce, a samo zaprzeczenie odpowiedzi na to pytanie nie pozwala tego założenia podważyć. Taka perspektywa pozwala znacznie precyzyjniej uchwycić naturę współczesnej nieuczciwej perswazji w dyskursie politycznym niż odwołanie się wyłącznie do klasycznych błędów wnioskowania.

== Taksonomia BSNLP

W ramach zadania SemEval-2023 Task 3 wyodrębniono dwadzieścia trzy techniki propagandowe, badane w dziewięciu językach, w tym polskim @piskorski2023semeval. Zadanie BSNLP 2025, stanowiące główny punkt odniesienia niniejszej pracy, rozszerzyło tę listę o dwie kolejne techniki (łącznie dwadzieścia pięć). Klasyfikacja ta dotyczy analizy tekstów z debat parlamentarnych oraz mediów społecznościowych w pięciu językach słowiańskich, włączając w to polski @bsnlp2025sharedtask. Wyróżnione techniki zgrupowano w sześciu kategoriach: atak na reputację, uzasadnienie, uproszczenie, odwrócenie uwagi, wezwanie do działania oraz manipulacyjne słownictwo.

#table(
  columns: (1.2fr, 1.4fr),
  align: (left, left),
  stroke: 0.5pt,
  inset: 6pt,
  table.header(
    [*Kategoria logiczna*],
    [*Technika BSNLP*],
  ),
  [Ad hominem], [Name Calling, Guilt by Association, Casting Doubt],
  [Odwołanie do autorytetu], [Appeal to Authority],
  [Odwołanie do strachu / litości], [Appeal to Fear Prejudice, Appeal to Pity],
  [Fałszywy dylemat], [False Dilemma or No Choice],
  [Zarzut hipokryzji], [Appeal to Hypocrisy, Whataboutism],
  [Naruszenie maksym Grice'a], [Loaded Language, Exaggeration or Minimisation],
  [Brak wyraźnego odpowiednika], [Slogans, Repetition, Appeal to Time],
)

Większość technik uwzględnionych w taksonomii BSNLP znajduje swoje odzwierciedlenie w klasycznych błędach we wnioskowaniu. Część z nich jednak - jak slogany czy repetycja - nie ma bezpośrednich odpowiedników w tradycyjnych katalogach logiki, ponieważ stanowią one raczej strategie retoryczne i erystyczne niż błędy ściśle argumentacyjne.
