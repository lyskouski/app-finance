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
Deutsch (DE) |
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

**Fingrom** -- plattformübergreifende Open-Source-Finanzbuchhaltungsanwendung ohne Werbung und Einschränkungen.
Das Ziel der Lösung ist es, eine Finanzbuchhaltungsanwendung zu schaffen, die intuitiv, effizient und umfassend ist.
Sie ermöglicht es den Nutzern, ihre Finanzen mühelos zu verwalten und gleichzeitig sicherzustellen, dass niemand
zurückgelassen wird.

[![Das Video ansehen](../images/presentation_en.png)](https://youtu.be/7hVGHYNzlQU)

### Funktionalität
- Buchhaltung (Kontotyp, Währung/Kryptowährung)
  - Einfache Gruppierung über `/`-Symbol (im Namen) für die Hauptseite
  - Transaktionsprotokoll
  - Einfrieren von Beträgen nach Aktualisierungsdatum (um frühere Historien zu importieren)
- Budget-Kategorien
  - Einfache Gruppierung über das `/`-Symbol (im Namen) für die Hauptseite
  - Mit Limits wiederherstellen:
    - Erneuert am Anfang eines jeden Monats
    - Konfigurierbare Limits pro Monat
    - Relativ (0.0 ... 1.0) zum Einkommen
  - Oder ohne Einschränkungen durch Anzeige eines ausgegebenen Betrags
  - Verschiedene Zeitleisten: wöchentlich, monatlich, vorzeitig
  - Anpassbarer Starttag der Woche und des Monats
- Rechnungen, Überweisungen, Einkünfte (Rechnungen)
  - Wiederkehrende Zahlungen (mit einem Home-Widget)
  - Filterung
  - Annahme/Prognose zur Budgetkategorie
- Ziele Definition
- Wechselkurse, Standardwährung für Zusammenfassung
- Metriken:
  - Budget:
    - Vorhersage (mit Monte-Carlo-Simulation)
    - Budgetgrenze und Ausgaben pro Monat
  - Konto:
    - Candlestick (OHLC) Diagramm
    - Einkommensgesundheitsradar
    - Währungsverteilung
  - Rechnungen:
    - YTD-Ausgaben
    - Balkenrennen für Kategorien
  - Ziele-Gauge-Diagramm
  - Historisches Währungsdiagramm
- Synchronisierung zwischen Geräten (P2P)
- Wiederherstellung über WebDav oder eine direkte Datei
- Import von `CSV`, `QIF`, `OFX` Dateien für Rechnungen und Rechnungen
- Exportieren in die Excel-Datei `XLSX`
- Verschlüsselung der Daten
- Lokalisierung
- Benutzerfreundlichkeit
  - Konfigurierbare Hauptseite (mehrere Konfigurationen pro `Breite x Höhe` eingestellt)
  - Reaktionsfähiges & adaptives Design
    - Adaptives Navigationspanel (oben, unten, rechts) und Tabs (oben, links)
  - Themenmodus (dunkel, hell, System) mit Palettendefinition (System, benutzerdefiniert, persönlich - Farbauswahl)
  - Letzte Auswahl für Konto, Budget und Währung beibehalten
  - Automatischer Bildlauf zum fokussierten Element im Formular
  - Erweitern/Komprimieren von Abschnitten auf der Hauptseite
  - Streichen für einen schnellen Zugriff auf die Aktionen Bearbeiten und Löschen
  - Vergrößern/Verkleinern (von 60% bis 200%) über „Einstellungen“
  - Shortcut

| Beschreibung                               | Shortcut                       |
| ------------------------------------------ | ------------------------------ |
| Öffnen/Schließen der Navigationsschublade  | `Shift` + `Enter`              |
| Nach oben navigieren                       | `nach oben`                    |
| Nach unten navigieren                      | `nach unten`                   |
| Ausgewählte öffnen                         | `Enter`                        |
| Vergrößern                                 | `Ctrl` + `+`                   |
| Vergrößern (mit der Maus)                  | `Ctrl` + `abwärts blättern`    |
| Herauszoomen                               | `Ctrl` + `-`                   |
| Herauszoomen (mit der Maus)                | `Ctrl` + `nach oben blättern`  |
| Zoom zurücksetzen                          | `Ctrl` + `0`                   |
| Neue Transaktion hinzufügen                | `Ctrl` + `N`                   |
| Zurückkehren                               | `Ctrl` + `Backspace`           |
<!--
| Ausgewähltes Element bearbeiten            | `Ctrl` + `E`                   |
| Ausgewählte Position löschen               | `Ctrl` + `D`                   |
-->
