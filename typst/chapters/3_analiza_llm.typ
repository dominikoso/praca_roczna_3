= Analiza modeli językowych

== Metodologia

Wybrany dokument, wraz z definicjami wszystkich dwudziestu pięciu technik, przekazano w ramach pojedynczego polecenia (ang. _prompt_) czterem publicznie dostępnym modelom językowym: GPT-5.6 Luna (dostępny w ChatGPT) @openai2026chatgpt, Gemini 3.6 Flash @google2026gemini, DeepSeek R1 @deepseek2026r1 oraz Kimi K2.6 w trybie Instant @moonshot2026kimi. Każdy z modeli otrzymał identyczne instrukcje. Zadanie polegało na jednoczesnej ocenie wszystkich osiemnastu akapitów i wygenerowaniu spójnej odpowiedzi, w której każda decyzja klasyfikacyjna miała zostać uzasadniona w jednym lub dwóch zdaniach. Pełna treść wykorzystanego polecenia znajduje się w Załączniku, a wszystkie materiały i dane są dostępne w repozytorium projektu#footnote[#link("https://github.com/dominikoso/praca_roczna_3")].

Osadzenie pełnych definicji technik w treści polecenia częściowo nawiązuje do metodologii Jose i Greenstadt @jose2025llms, które w ramach zadania BSNLP 2025 zastosowały analogiczny zabieg w bardziej rozbudowanej formie, lecz tylko w drugim z dwóch podzadań konkursu, klasyfikacji konkretnych etykiet: osobno dla każdego akapitu, w dwóch przebiegach obejmujących połowę tagsetu naraz, z wymuszonym łańcuchem rozumowania i progiem pewności 0,99 przy ekstrakcji fragmentów, naprzemiennie na modelach _gpt-4o-mini_ i _o4-mini_. W pierwszym podzadaniu konkursu, samej detekcji obecności techniki, bliższej pierwszemu pytaniu z anotacji w niniejszej pracy, użyły natomiast wyłącznie modelu _o4-mini_, bez łańcucha rozumowania i bez podziału na przebiegi, co według ich własnych ustaleń ograniczyło uzyskiwany _recall_. Wszystkie cztery modele użyte w niniejszej pracy natywnie wspierają tryb rozumowania (ang. _thinking_/_reasoning_) i z niego korzystały przy generowaniu odpowiedzi, mimo że polecenie nie narzucało im tego wprost. Zastosowane tu podejście, jeden prompt obejmujący cały dokument naraz, bez podziału na przebiegi, progu pewności ani wymuszonej struktury łańcucha rozumowania, pozostaje więc uproszczeniem drugiego podzadania metody Jose i Greenstadt przede wszystkim pod względem inżynierii promptu, a nie faktycznego zaangażowania modeli w rozumowanie nad tekstem.

Nawiązuje ono również do wcześniejszych, niepublikowanych badań własnych, w których skuteczność modeli językowych weryfikowano na korpusie anglojęzycznym, jednak bez wykorzystania ustrukturyzowanej taksonomii @kostecki2025mozliwosci.

== Porównanie wyników z anotacją referencyjną

_Precision_ i _recall_ to standardowe miary stosowane przy ewaluacji zadań klasyfikacji wieloetykietowej. 
_Precision_ odpowiada na pytanie, jaki odsetek etykiet wskazanych przez model faktycznie pokrywa się z anotacją referencyjną. Wysoka wartość oznacza, że model rzadko zgaduje na wyrost. 
_Recall_ odpowiada na pytanie, jaki odsetek etykiet z anotacji referencyjnej model w ogóle wykrył. Wysoka wartość oznacza, że model rzadko coś pomija. F1 to średnia harmoniczna obu miar, niska, jeśli którakolwiek ze składowych jest niska. Wszystkie trzy miary liczono na poziomie pojedynczych par akapit-etykieta (18 akapitów x 25 możliwych technik).

#table(
  columns: (1.3fr, 1fr, 1fr, 1fr),
  align: (left, center, center, center),
  stroke: 0.5pt,
  inset: 6pt,
  table.header(
    [*Model*],
    [*_Precision_*],
    [*_Recall_*],
    [*F1*],
  ),
  [ChatGPT], [0,36], [0,53], [0,43],
  [Gemini], [0,37], [0,39], [0,38],
  [DeepSeek], [0,34], [0,31], [0,32],
  [Kimi], [0,36], [0,33], [0,34],
)
_Precision_ mieści się w przedziale 0,34-0,37, a _recall_ 0,31-0,53: modele rzadko pomijają technikę tam, gdzie faktycznie występuje, ale gdy już ją wskazują, częściej się mylą, niż trafiają. Pojedyncza anotacja ręczna, jak zaznaczono we wnioskach, nie pretenduje przy tym do roli obiektywnego wzorca.

Co istotne, w żadnym przypadku żaden model nie ocenił jako neutralnego akapitu, który anotator uznał za zawierający technikę perswazyjną. Wszystkie rozbieżności miały odwrotny kierunek: modele wskazywały technikę tam, gdzie anotator jej nie widział, zawsze w tych samych trzech akapitach (P04, P15, P17). Żaden model nie pomylił się poza tym zbiorem. Można to tłumaczyć na dwa sposoby: albo jako skłonność modeli do nadrozpoznawania perswazji w treściach czysto informacyjnych, albo jako możliwość, że pojedynczy anotator przeoczył subtelniejsze użycie technik akurat w tych fragmentach; rozstrzygnięcie między tymi wyjaśnieniami wymagałoby drugiego anotatora. Warto również zauważyć, że modele wykazywały wyższą zgodność wewnętrzną (między sobą) niż z anotacją referencyjną: dla szesnastu z osiemnastu akapitów wygenerowano identyczny werdykt u wszystkich czterech badanych systemów. Nie stoi to w sprzeczności z różną liczbą akapitów, w których poszczególne modele odbiegały od anotacji referencyjnej: z tych szesnastu jednomyślnych akapitów piętnaście to klasyfikacje zgodne z anotacją referencyjną, a jeden (P04) to rozbieżność, co do której wszystkie cztery modele są zgodne między sobą. Pozostałe dwa akapity, P15 i P17, to jedyne miejsca, w których modele nie są zgodne nawet między sobą (na każdym z nich trzy modele wskazują technikę, a jeden nie). Stąd różnice w łącznej liczbie rozbieżności poszczególnych modeli.

Znaczne rozbieżności względem anotacji referencyjnej zaobserwowano na poziomie przypisywania konkretnych etykiet. Systemy znacznie częściej sięgały po etykietę _Loaded Language_: wskazywano ją w niemal każdym akapicie uznanym za perswazyjny, podczas gdy w anotacji referencyjnej przypisano ją zaledwie w połowie przypadków. Zjawisko to jest wyraźnie widoczne na przykładzie akapitu P02, w którym mówczyni przytacza historię kobiety po odmowie wykonania legalnej aborcji przez szpital. W anotacji referencyjnej wskazano tu odwołanie do wartości, odwołanie do strachu oraz odwołanie do czasu (uzasadnione tym, że opowieść pada bezpośrednio po wzmiance o wcześniejszym przesunięciu debaty przez marszałka Sejmu, co nadaje jej wydźwięk pilności); wszystkie cztery modele niezależnie od siebie przypisały mu wspólną parę etykiet: odwołanie do litości (_Appeal to Pity_) oraz słownictwo manipulacyjne (_Loaded Language_), przy czym dwa z czterech modeli dodały do tej pary jeszcze trzecią etykietę (odpowiednio odwołanie do strachu i podważanie wiarygodności); żaden z nich nie wskazał odwołania do czasu. Modele zgodziły się więc ze sobą nawzajem bardziej niż z anotacją referencyjną, co sugeruje wspólne obciążenie w stronę technik łatwo rozpoznawalnych leksykalnie kosztem tych, które - jak zauważa Grice w kontekście implikatur konwersacyjnych - wymagają wykroczenia poza dosłowną treść zdania i uwzględnienia szerszego kontekstu wypowiedzi.

Loaded Language jest przy tym zjawiskiem przede wszystkim leksykalnym i semantycznym: polega na doborze słownictwa nacechowanego wartościująco niezależnie od szerszego kontekstu zdania, co dobrze tłumaczy, dlaczego modele językowe, sprawne w rozpoznawaniu wzorców na poziomie pojedynczych słów, tak chętnie po nią sięgają. Dopiero pochodne zjawiska w obrębie tej kategorii, takie jak pytania nacechowane (ang. _loaded questions_) czy generowanie niepożądanych implikatur przez sam dobór słownictwa, mają charakter bardziej pragmatyczny i wymagają uwzględnienia kontekstu wypowiedzi. Stanowią one jednak drugorzędny, a nie podstawowy, wymiar tej kategorii.