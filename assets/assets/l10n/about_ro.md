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
[Polski (PL)](./about_pl.md) |
[Português Europeu (PT)](./about_pt.md) |
[Português Brasileiro (PTB)](./about_pt_BR.md) |
Limba română (RO) |
[Español (ES)](./about_es.md) |
[Türk dili (TR)](./about_tr.md) |
[Українська (UK-UA)](./about_uk.md) |
[O'zbek (UZ)](./about_uz.md)

---

**Fingrom** -- aplicație de contabilitate financiară cross-platform open-source fără anunțuri și limitări.
Scopul soluției este de a crea o aplicație de contabilitate financiară care este intuitivă, eficientă și incluzivă.
Care permite utilizatorilor să își gestioneze finanțele fără efort, asigurându-se în același timp că nimeni nu este lăsat în urmă.

[![Urmăriți videoclipul](../images/presentation_en.png)](https://youtu.be/sNTbpILLsOw)

### Funcționalitate
- Contabilitate (Tip de cont, Monedă/Criptomonedă)
  - Grupare simplă prin simbolul `/` (în nume) pentru pagina principală
  - Jurnalul tranzacțiilor
  - Înghețarea sumei în funcție de data actualizării (pentru a importa istoricul anterior)
- Categorii de buget
  - Grupare simplă prin `/`-simbol (în nume) pentru pagina principală
  - Cu limite restate:
    - Reînnoite la începutul fiecărei luni
    - Limite configurabile pe lună
    - Relative (0.0 ... 1.0) la venituri
  - Sau, fără limite prin afișarea unei sume cheltuite
  - Cronologie diferită: săptămânală, lunară, anuală
  - Zi de început a săptămânii și a lunii personalizabilă
- Facturi, transferuri, venituri (facturi)
  - Plăți recurente (cu un widget de pornire)
  - Filtrare
  - Ipoteza/previziunea categoriei bugetare
- Definirea obiectivelor
- Ratele de schimb, Moneda implicită pentru rezumat
- Metrici:
  - Buget:
    - Previziune (cu simulare Monte Carlo)
    - Limita bugetară și cheltuielile pe lună
  - Cont:
    - Diagrama lumânărilor (OHLC)
    - Radarul sănătății veniturilor
    - Distribuția monedei
  - Facturi:
    - Cheltuieli YTD
    - Bar Race pentru categorii
  - Grafic de măsurare a obiectivelor
  - Diagrama istorică a monedei
- Sincronizare între dispozitive (P2P)
- Recuperare prin WebDav sau un fișier direct
- Import din fișiere `CSV`, `QIF`, `OFX` pentru facturi și facturi
- Export către fișiere Excel `XLSX`.
- Criptarea datelor
- Localizare
- Experiența utilizatorului
  - Pagina principală configurabilă (configurații multiple pentru fiecare set `lățime x înălțime`)
  - Design receptiv și adaptabil
    - Panou de navigare adaptiv (sus, jos, dreapta) și file (sus, stânga)
  - Mod temă (întunecat, deschis, sistem) cu definirea paletei (sistem, personalizat, personal -- selector de culori)
  - Păstrarea ultimei alegeri pentru Cont, Buget și Monedă
  - Derulare automată la elementul focalizat pe formular
  - Extindeți / reduceți secțiunile pe pagina principală
  - Swipe pentru un acces rapid la acțiunile de editare și ștergere
  - Zoom in/out (de la 60% până la 200%) prin „Setări”
  - Comenzi rapide

| Descriere                               | Scurtătură                     |
| --------------------------------------- | ------------------------------ |
| Deschide / închide sertarul de navigare | `Shift` + `Enter`              |
| Navigare în sus                         | `up`                           |
| Navigare în jos                         | `down`                         |
| Deschide selecția                       | `Enter`                        |
| Zoom In                                 | `Ctrl` + `+`                   |
| Zoom In (cu mouse-ul)                   | `Ctrl` + `scroll down`         |
| Zoom Out                                | `Ctrl` + `-`                   |
| Zoom Out (cu mouse-ul)                  | `Ctrl` + `scroll up`           |
| Resetare zoom                           | `Ctrl` + `0`                   |
| Adaugă o nouă tranzacție                | `Ctrl` + `N`                   |
| Înapoi                                  | `Ctrl` + `Backspace`           |
<!--
| Editează elementul selectat             | `Ctrl` + `E`                   |
| Șterge elementul selectat               | `Ctrl` + `D`                   |
-->
