[اللغة العربية (AR)](./about_ar.md) |
[Azərbaycanlı (AZ)](./about_az.md) |
[Тарашкевіца (BE)](./about_be.md) |
[Latsinka (BE)](./about_be_EU.md) |
[简体中文 (ZH-CN)](./about_zh.md) |
[繁體中文 (ZH-TW)](./about_zh_TW.md) |
[Čeština (CS)](./about_cs.md) |
Nederlandse (NL) |
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
[Limba română (RO)](./about_ro.md) |
[Español (ES)](./about_es.md) |
[Türk dili (TR)](./about_tr.md) |
[Українська (UK-UA)](./about_uk.md) |
[O'zbek (UZ)](./about_uz.md)

---

**Fingrom** -- open-source cross-platform financieel boekhoudprogramma zonder Ads en beperkingen.
Het doel van de oplossing is om een financiële boekhoudapplicatie te maken die intuïtief, efficiënt en inclusief is.
Dat stelt gebruikers in staat om moeiteloos hun financiën te beheren en zorgt ervoor dat niemand achterblijft.

[![Bekijk de video](../images/presentation_en.png)](https://youtu.be/sNTbpILLsOw)

### Functionaliteit
- Boekhouding (Rekeningtype, Valuta/Cryptocurrency)
  - Eenvoudige groepering via `/`-symbool (in naam) voor de hoofdpagina
  - Logboek transacties
  - Bevries bedrag op Bijwerkdatum (om vorige geschiedenis te importeren)
- Budget categorieën
  - Eenvoudige groepering via `/`-symbool (in naam) voor de hoofdpagina
  - Met limieten herstellen:
    - Vernieuwd aan het begin van elke maand
    - Configureerbare limieten per maand
    - Relaties (0,0 ... 1,0) tot Inkomen
  - Of, zonder beperkingen door een uitgegeven bedrag te tonen
  - Verschillende tijdlijn: wekelijks, maandelijks, jaarlijks
  - Aanpasbare startdag van de week en maand
- Rekeningen, overschrijvingen, inkomsten (facturen)
  - Terugkerende betalingen (met een widget)
  - Filteren
  - Begrotingscategorie veronderstelling / voorspelling
- Doelen definiëren
- Wisselkoersen, standaardvaluta voor overzicht
- Metriek:
  - Budget:
    - Prognose (met Monte Carlo-simulatie)
    - Budgetlimiet en uitgaven per maand
  - Rekening:
    - Kandelaar (OHLC) Grafiek
    - Inkomensradar
    - Valutaverdeling
  - Rekeningen:
    - YTD Uitgaven
    - Staafgrafiek voor categorieën
  - Doelstellingen Grafiek
  - Historische valuta grafiek
- Synchronisatie tussen apparaten (P2P)
- Herstel via WebDav of een direct bestand
- Importeren uit `CSV`, `QIF`, `OFX` bestanden voor rekeningen en facturen
- Exporteren naar Excel `XLSX`-bestand
- Gegevensencryptie
- Lokalisatie
- Gebruikerservaring
  - Configureerbare hoofdpagina (meerdere configuraties per `breedte x hoogte` set)
  - Responsief en adaptief ontwerp
    - Adaptief navigatiepaneel (boven, onder, rechts) en tabbladen (boven, links)
  - Themamodus (donker, licht, systeem) met paletdefinitie (systeem, aangepast, persoonlijk -- kleurenkiezer)
  - Behoud laatste keuze voor Rekening, Budget en Valuta
  - Automatisch bladeren naar het gefocuste element op Formulier
  - Secties uitvouwen/vouwen op hoofdpagina
  - Vegen voor snelle toegang tot Bewerken en Verwijderen
  - In-/uitzoomen (van 60% tot 200%) via “Instellingen”
  - Snelkoppelingen

| Beschrijving                        | Snelkoppeling                  |
| ----------------------------------- | ------------------------------ |
| Open/sluit de navigatie lade        | `Shift` + `Enter`              |
| Omhoog navigeren                    | `omhoog`                       |
| Omlaag navigeren                    | `omlaag`                       |
| Geselecteerd openen                 | `Enter`                        |
| Inzoomen                            | `Ctrl` + `+`                   |
| Zoom in (met muis)                  | `Ctrl` + `scroll naar beneden` |
| Uitzoomen                           | `Ctrl` + `-`                   |
| Uitzoomen (met muis)                | `Ctrl` + `scroll omhoog`       |
| Zoom opnieuw instellen              | `Ctrl` + `0`                   |
| Nieuwe transactie toevoegen         | `Ctrl` + `N`                   |
| Teruggaan                           | `Ctrl` + `Backspace`           |
<!--
| Geselecteerd item bewerken          | `Ctrl` + `E`                   |
| Geselecteerd item verwijderen       | `Ctrl` + `D`                   |
-->
