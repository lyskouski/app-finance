[اللغة العربية (AR)](./about_ar.md) |
[Azərbaycanlı (AZ)](./about_az.md) |
[Тарашкевіца (BE)](./about_be.md) |
[Latsinka (BE)](./about_be_EU.md) |
[简体中文 (ZH-CN)](./about_zh.md) |
[繁體中文 (ZH-TW)](./about_zh_TW.md) |
Čeština (CS) |
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
[Limba română (RO)](./about_ro.md) |
[Español (ES)](./about_es.md) |
[Türk dili (TR)](./about_tr.md) |
[Українська (UK-UA)](./about_uk.md) |
[O'zbek (UZ)](./about_uz.md)

---

**Fingrom** -- open-source multiplatformní aplikace pro finanční účetnictví bez reklam a omezení.
Cílem řešení je vytvořit aplikaci finančního účetnictví, která je intuitivní, efektivní a inkluzivní.
Která uživatelům umožní bez námahy spravovat své finance a zároveň zajistí, aby nikdo nezůstal pozadu.

[![Podívejte se na video](../images/presentation_en.png)](https://youtu.be/sNTbpILLsOw)

### Funkčnost
- Účtování (typ účtu, měna/kriptoměna)
  - Jednoduché seskupení pomocí `/`-symbolu (v názvu) pro hlavní stránku
  - Protokol transakcí
  - Zmrazení částky podle data aktualizace (pro import předchozí historie)
- Kategorie rozpočtu
  - Jednoduché seskupení pomocí `/`-symbolu (v názvu) pro hlavní stránku
  - S limity restartovat:
    - Obnoveno na začátku každého měsíce
    - Konfigurovatelné limity na měsíc
    - Vztahy (0,0 ... 1,0) k příjmům
  - Nebo bez omezení zobrazením vynaložené částky
  - Různé časové osy: týdenní, měsíční, roční
  - Přizpůsobitelný počáteční den týdne a měsíce
- Účty, převody, příjmy (faktury)
  - Opakující se platby (s widgetem na domovské obrazovce)
  - Filtrování
  - Předpoklad/předpověď rozpočtové kategorie
- Definice cílů
- Směnné kurzy, výchozí měna pro shrnutí
- Metriky:
  - Rozpočet:
    - Rozpočet: Prognóza (se simulací Monte Carlo)
    - Rozpočtový limit a výdaje za měsíc
  - Účet:
    - Svíčkový (OHLC) graf
    - Radar stavu příjmů
    - Rozdělení měn
  - Účty:
    - Výdaje od začátku roku
    - Sloupcový závod pro kategorie
  - Měřicí graf cílů
  - Měnový historický graf
- Synchronizace mezi zařízeními (P2P)
- Obnovení prostřednictvím WebDav nebo přímo souboru
- Import ze souborů `CSV`, `QIF`, `OFX` pro účty a faktury
- Export do souboru `XLSX` aplikace Excel
- Šifrování dat
- Lokalizace
- Uživatelské zkušenosti
  - Konfigurovatelná hlavní stránka (více konfigurací pro sadu `šířka x výška`)
  - Responzivní a přizpůsobivý design
    - Adaptivní navigační panel (nahoře, dole, vpravo) a záložky (nahoře, vlevo)
  - Režim motivu (tmavý, světlý, systémový) s definicí palety (systémová, vlastní, osobní -- výběr barev)
  - Zachování poslední volby pro účet, rozpočet a měnu
  - Automatický posun na zaměřený prvek na formuláři
  - Rozbalení / sbalení sekcí na hlavní stránce
  - Přejetí prstem pro rychlý přístup k akcím Upravit a Odstranit
  - Zvětšení/zmenšení (od 60 % do 200 %) prostřednictvím „Nastavení“
  - Zkratky

| Popis | Zkratka
| ------------------------------------ | ------------------------------ |
| Otevření / zavření navigační zásuvky | `Shift` + `Enter`              |
| Navigace nahoru                      | `up`                           |
| Navigace dolů                        | `down`                         |
| Otevřít vybrané                      | `Enter`                        |
| Přiblížení                           | `Ctrl` + `+`                   |
| Přiblížení (myší)                    | `Ctrl` + `scroll down`         |
| Zvětšení                             | `Ctrl` + `-`                   |
| Zvětšení (myší)                      | `Ctrl` + `scroll up`           |
| Obnovení zoomu                       | `Ctrl` + `0`                   |
| Přidat novou transakci               | `Ctrl` + `N`                   |
| Návrat zpět                          | `Ctrl` + `Backspace`           |
<!--
| Upravit vybranou položku             | `Ctrl` + `E`                   |
| Smazání vybrané položky              | `Ctrl` + `D`                   |
-->
