[اللغة العربية (AR)](./about_ar.md) |
[Azərbaycanlı (AZ)](./about_az.md) |
[Тарашкевіца (BE)](./about_be.md) |
[Latsinka (BE)](./about_be_EU.md) |
[简体中文 (ZH-CN)](./about_zh.md) |
[繁體中文 (ZH-TW)](./about_zh_TW.md) |
[Čeština (CS)](./about_cs.md) |
[Nederlandse (NL)](./about_nl.md) |
[English (EN-US)](./about_en.md) |
[Français (FR)](./about_fr.md) |
[Deutsch (DE)](./about_de.md) |
[हिंदी (HI-IN)](./about_hi.md) |
[Italiano (IT)](./about_it.md) |
[日本語 (JA)](./about_ja.md) |
[فارسی (FA)](./about_fa.md) |
[한국어 (KO)](./about_ko.md) |
Polski (PL) |
[Português Europeu (PT)](./about_pt.md) |
[Português Brasileiro (PTB)](./about_pt_BR.md) |
[Limba română (RO)](./about_ro.md) |
[Español (ES)](./about_es.md) |
[Türk dili (TR)](./about_tr.md) |
[Українська (UK-UA)](./about_uk.md) |
[O'zbek (UZ)](./about_uz.md)

---

**Fingrom** - wieloplatformowa aplikacja finansowo-księgowa o otwartym kodzie źródłowym bez reklam i ograniczeń.
Celem rozwiązania jest stworzenie aplikacji do księgowości finansowej, która jest intuicyjna, wydajna i integracyjna.
Dzięki temu użytkownicy mogą bez wysiłku zarządzać swoimi finansami, jednocześnie zapewniając, że nikt nie zostanie pominięty.

[![Obejrzyj wideo](../images/presentation_en.png)](https://youtu.be/sNTbpILLsOw)

### Funkcjonalność
- Księgowość (typ konta, waluta/kryptowaluta)
  - Proste grupowanie za pomocą symbolu `/` (w nazwie) dla strony głównej
  - Dziennik transakcji
  - Zamrożenie kwoty według daty aktualizacji (aby zaimportować poprzednią historię)
- Kategorie budżetu
  - Proste grupowanie poprzez `/`-symbol (w nazwie) dla strony głównej
  - Z limitami restate:
    - Odnawiane na początku każdego miesiąca
    - Konfigurowalne limity na miesiąc
    - Stosunek (0,0 ... 1,0) do dochodu
  - Lub bez ograniczeń, pokazując wydaną kwotę
  - Różne harmonogramy: tygodniowy, miesięczny, roczny
  - Możliwość dostosowania dnia rozpoczęcia tygodnia i miesiąca
- Rachunki, przelewy, dochody (faktury)
  - Płatności cykliczne (z widżetem domowym)
  - Filtrowanie
  - Założenie/prognoza kategorii budżetowej
- Definicja celów
- Kursy wymiany, domyślna waluta dla podsumowania
- Metryki:
  - Budżet:
    - Prognoza (z symulacją Monte Carlo)
    - Limit budżetu i wydatki na miesiąc
  - Konto:
    - Wykres świecowy (OHLC)
    - Radar zdrowia dochodów
    - Rozkład walut
  - Rachunki:
    - Wydatki narastająco
    - Wyścig słupkowy dla kategorii
  - Wykres wskaźnika celów
  - Wykres historyczny waluty
- Synchronizacja między urządzeniami (P2P)
- Odzyskiwanie poprzez WebDav lub bezpośredni plik
- Import z plików `CSV`, `QIF`, `OFX` dla rachunków i faktur
- Eksport do pliku Excel `XLSX`
- Szyfrowanie danych
- Lokalizacja
- Doświadczenie użytkownika
  - Konfigurowalna strona główna (wiele konfiguracji na zestaw `szerokość x wysokość`)
  - Responsywny i adaptacyjny design
    - Adaptacyjny panel nawigacyjny (góra, dół, prawo) i zakładki (góra, lewo)
  - Tryb motywu (ciemny, jasny, systemowy) z definicją palety (systemowa, niestandardowa, osobista - selektor kolorów)
  - Zachowanie ostatniego wyboru dla konta, budżetu i waluty
  - Automatyczne przewijanie do wybranego elementu formularza
  - Rozwijanie/zwijanie sekcji na stronie głównej
  - Przesuń palcem, aby uzyskać szybki dostęp do akcji edycji i usuwania
  - Powiększanie / pomniejszanie (od 60% do 200%) poprzez „Ustawienia”
  - Skróty

| Opis                                | Skrót                          |
| ----------------------------------- | ------------------------------ |
| Otwórz / Zamknij szufladę nawigacji | `Shift` + `Enter`              |
| Nawiguj w górę                      | `w górę`                       |
| Nawiguj w dół                       | `w dół`                        |
| Otwórz wybrane                      | `Enter`                        |
| Powiększanie                        | `Ctrl` + `+`                   |
| Powiększ (myszką)                   | `Ctrl` + `przewijanie w dół`   |
| Powiększanie                        | `Ctrl` + `-`                   |
| Zoom Out (z myszą)                  | `Ctrl` + `przewijanie w górę`  |
| Reset Zoom                          | `Ctrl` + `0`                   |
| Dodaj nową transakcję               | `Ctrl` + `N`                   |
| Powrót                              | `Ctrl` + `Backspace`           |
<!--
| Edytuj wybrany element              | `Ctrl` + `E`                   |
| Usuń zaznaczony element             | `Ctrl` + `D`                   |
-->
