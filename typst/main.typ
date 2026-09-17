// University of Warsaw - Faculty of Philosophy
// Thesis Template in Typst
// Template structure based on official UW requirements
// Author: Dominik Kostecki

#import "template.typ": *

#show: thesis.with(
  title: "Techniki perswazyjne w polskim dyskursie parlamentarnym: anotacja manualna a klasyfikacja z wykorzystaniem modeli językowych",
  title-english: "Persuasive Techniques in Polish Parliamentary Discourse: Manual Annotation versus Classification Using Language Models",
  author: "Dominik Kostecki",
  student-id: "460552",
  degree-type: "roczna",
  field-of-study: "Filozofia",
  supervisor: "dr Marcin Będkowski",
  date: "Wrzesień 2026",
  abstract: [
    Praca bada, w jakim stopniu współczesna taksonomia technik perswazyjnych, opracowana na potrzeby zadania BSNLP 2025, koresponduje z tradycyjnymi kategoriami logiki nieformalnej, fallacjami i schematami argumentów, oraz jak sprawdza się w pilotażowej analizie pojedynczego wystąpienia z polskiej debaty sejmowej. Większość technik wyróżnionych w ramach zadania BSNLP ma bezpośredni odpowiednik wśród klasycznych błędów wnioskowania, choć kilka z nich, na przykład slogany czy powtórzenie, pozostaje bliższych retoryce niż logice.

    Wybrane w pracy wystąpienie sejmowe poddano sekwencyjnej anotacji manualnej (zadanie klasyfikacji sekwencji, w odróżnieniu od klasyfikacji tokenów), a uzyskane wyniki porównano z klasyfikacją przeprowadzoną z wykorzystaniem czterech modeli językowych. Modele nie pominęły żadnego akapitu ocenionego w anotacji referencyjnej jako perswazyjny, ale wykazały wyraźną skłonność do wskazywania technik w treściach czysto informacyjnych oraz do nadmiarowego stosowania etykiety nacechowanego emocjonalnie słownictwa (_Loaded Language_) kosztem etykiet wymagających głębszej integracji kontekstu.
  ],
  keywords: ("fallacje", "schematy argumentów", "techniki perswazyjne", "BSNLP", "modele językowe", "dyskurs publiczny"),
)

#counter(page).update(4)

#set heading(numbering: "1.1.")
#include "chapters/1_wstep_teoria.typ"
#include "chapters/2_moja_analiza.typ"
#include "chapters/3_analiza_llm.typ"

#set heading(numbering: none)
#include "chapters/4_podsumowanie.typ"

#bibliography("bibliography/references.bib", title: "Bibliografia", style: "chicago-notes")

#appendix(title: "Prompt użyty w eksperymencie z modelami językowymi")[
  #include "chapters/aneks_prompt.typ"
]
