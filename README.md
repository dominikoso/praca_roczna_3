# Praca Roczna - Techniki perswazyjne w polskim dyskursie parlamentarnym: anotacja manualna a klasyfikacja modeli językowych

Źródło pracy oraz materiał i wyniki części praktycznej.

- `typst/` - źródło Typst całej pracy
- `source/` - oryginalny dokument z próbnych danych BSNLP 2025 (PL), niezmieniony
- `labelstudio/` - konfiguracja użyta do anotacji ręcznej: `label_config.xml` (schemat etykiet, 25 technik BSNLP), `tasks.json` (18 akapitów P01–P18 do importu), `docker-compose.yml` (lokalne uruchomienie LabelStudio).
- `annotations/anotacja_reczna.json` - eksport anotacji ręcznej z LabelStudio.
- `llm_results/` - `prompt_template.md` (prompt użyty do zapytania modeli) oraz odpowiedzi czterech modeli