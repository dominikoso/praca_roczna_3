// University of Warsaw - Faculty of Philosophy
// Thesis Template in Typst
// Template structure based on official UW requirements
// Author: Dominik Kostecki

#import "template.typ": *

#let cited-footnote-dedup(body) = context {
  let sel = selector(ref)

  let firsts = query(sel).dedup(key: it => (
    it.citation.key,
    it.location().page(),
  ))

  show sel: it => {
    let key = it.citation.key
    let page = here().page()

    let first = firsts.find(x => x.citation.key == key and x.location().page() == page)

    if first.location() == it.location() {
      footnote()[#cite(key, form: "full")]
    } else {
      let prev = query(sel.before(here()))
        .filter(x => x.location().page() == page)
        .filter(x => x.citation.key == key)
        .last()

      super([#{ counter(footnote).at(prev.location()).first() + 1 }])
    }
  }

  body
}

#show: cited-footnote-dedup

#show: thesis.with(
  title: "Techniki perswazyjne w polskim dyskursie parlamentarnym: anotacja manualna a klasyfikacja modeli językowych",
  title-english: "Persuasive Techniques in Polish Parliamentary Discourse: Manual Annotation versus Language Model Classification",
  author: "Dominik Kostecki",
  student-id: "460552",
  degree-type: "roczna",
  field-of-study: "Filozofia",
  supervisor: "dr Marcin Będkowski",
  date: "Sierpień 2026",
  abstract: [
    Praca bada, w jakim stopniu współczesna taksonomia technik perswazyjnych, opracowana na potrzeby zadania BSNLP 2025, koresponduje z tradycyjnymi kategoriami logicznymi - fallacjami i schematami argumentów - oraz jak sprawdza się w pilotażowej analizie pojedynczego wystąpienia z polskiej debaty sejmowej. Większość technik BSNLP ma bezpośredni odpowiednik wśród klasycznych błędów wnioskowania, choć kilka z nich, na przykład slogany czy powtórzenie, pozostaje bliższe retoryce niż logice.

    Pełne wystąpienie sejmowe poddano sekwencyjnej anotacji manualnej, a uzyskane wyniki porównano z klasyfikacją czterech modeli językowych. Modele nie pominęły żadnego akapitu ocenionego w anotacji referencyjnej jako perswazyjny, ale wykazały wyraźną skłonność do wskazywania technik w treściach czysto informacyjnych oraz do nadmiarowego stosowania etykiety nacechowanego emocjonalnie słownictwa (_Loaded Language_) kosztem etykiet wymagających głębszej integracji kontekstu.
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

#bibliography("bibliography/references.bib", title: "Bibliografia", style: "springer-humanities-author-date")
