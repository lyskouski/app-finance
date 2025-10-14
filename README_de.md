[ [English](./README.md) | Deutsch | [简体中文](./README_zh-CN.md) | [...](./assets/l10n/about_de.md) ]

# ![Fingrom Logo](./docs/design-flow/logo/main.svg) Anwendung Finanzbuchhaltung
[![Lizenz: CC BY-NC-ND 4.0](https://img.shields.io/badge/License-CC_BY--NC--ND_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-nd/4.0/)
[![Status prüfen](https://github.com/lyskouski/app-finance/actions/workflows/push_to_main.yml/badge.svg?branch=main)](https://github.com/lyskouski/app-finance/actions/workflows/push_to_main.yml)
[![Status erstellen](https://github.com/lyskouski/app-finance/actions/workflows/build.yml/badge.svg)](https://github.com/lyskouski/app-finance/actions/workflows/build.yml)

[![Abdeckung der Unit-Tests](https://lyskouski.github.io/app-finance/coverage/unit_coverage_badge.svg)](https://lyskouski.github.io/app-finance/coverage/unit/index.html)
[![Abdeckung der Widget-Tests](https://lyskouski.github.io/app-finance/coverage/widget_coverage_badge.svg)](https://lyskouski.github.io/app-finance/coverage/widget/index.html)
[![End-To-End-Abdeckung](https://lyskouski.github.io/app-finance/coverage/e2e_coverage_badge.svg)](https://lyskouski.github.io/app-finance/coverage/e2e/index.html)

**Fingrom** -- plattformübergreifende Open-Source-Anwendung für die Finanzbuchhaltung ohne Ads und Einschränkungen. Das
Ziel der Lösung ist es, eine Finanzbuchhaltungsanwendung zu schaffen, die intuitiv, effizient und umfassend ist. Sie
ermöglicht es den Nutzern, ihre Finanzen mühelos zu verwalten und gleichzeitig sicherzustellen, dass niemand
zurückgelassen wird.


[![Watch the video](./docs/marketing-flow/presentation_video.png)](https://youtu.be/7hVGHYNzlQU)


| Typ                      | Alpha-Version         | Vorabversion                  | Freigabe                      |
| ------------------------ | ----------------------| ----------------------------- | ----------------------------- |
| ![Apple](./docs/design-flow/icons/apple.png) iOS (Apple Store)        | [fingrom_iOS.ipa](https://github.com/lyskouski/app-finance/releases/latest) | [TestFlight: Fingrom](https://testflight.apple.com/join/93ECy9ZB) | [![iOS Apple Store](./docs/design-flow/badges/ios.png)](https://apps.apple.com/us/app/fingrom/id6463955600) |
| ![Apple](./docs/design-flow/icons/apple.png) macOS (Apple Store)      | [fingrom_macOS.zip](https://github.com/lyskouski/app-finance/releases/latest) | Nicht verfügbar für Tests | [![macOS Apple Store](./docs/design-flow/badges/macos.png)](https://apps.apple.com/us/app/fingrom/id6463955600) |
| ![Android](./docs/design-flow/icons/android.png) Android (Google Play)    | [fingrom_Android.aab](https://github.com/lyskouski/app-finance/releases/latest) | [Google Play](https://play.google.com/store/apps/details?id=com.tercad.fingrom) | [![Google Play](./docs/design-flow/badges/google.png)](https://play.google.com/store/apps/details?id=com.tercad.fingrom) |
| ![Android](./docs/design-flow/icons/android.png) Android (Galaxy Store)   | [fingrom_Android.aab](https://github.com/lyskouski/app-finance/releases/latest) | [Galaxy Store](https://galaxystore.samsung.com/detail/com.tercad.fingrom) | [![Fingrom](./docs/design-flow/badges/galaxy-store.png)](https://galaxy.store/apFinance) |
| ![Android](./docs/design-flow/icons/android.png) Android (Huawei Gallery) | [fingrom_Android.aab](https://github.com/lyskouski/app-finance/releases/latest) | [App Gallery](https://appgallery.huawei.com/#/app/C109437079) | [![App Gallery](./docs/design-flow/badges/huawei.png)](https://appgallery.huawei.com/#/app/C109437079) |
| ![Android](./docs/design-flow/icons/android.png) Android (Amazon Appstore) | [fingrom_Android.aab](https://github.com/lyskouski/app-finance/releases/latest) | [Amazon Appstore](https://www.amazon.com/gp/product/B0DKFNJ45R) | [![Amazon Appstore](./docs/design-flow/badges/amazon.png)](https://www.amazon.com/gp/product/B0DKFNJ45R) |
| ![Linux](./docs/design-flow/icons/linux.png) Linux (Snap Store)       | [fingrom_LinuxSnap.snap](https://github.com/lyskouski/app-finance/releases/latest) | [![Fingrom](https://snapcraft.io/fingrom/badge.svg)](https://snapcraft.io/fingrom) | [![Snapcraft: Fingrom](./docs/design-flow/badges/snap-store.png)](https://snapcraft.io/fingrom) |
| ![Linux](./docs/design-flow/icons/linux.png) Linux (Flathub)          | [fingrom_LinuxFlatpak.flatpak](https://github.com/lyskouski/app-finance/releases/latest)  | Not available | [ ![Flathub: Fingrom](./docs/design-flow/badges/flathub.png) ](https://flathub.org/apps/com.tercad.fingrom) |
| ![Linux](./docs/design-flow/icons/linux.png) Linux (AppImage)         | [fingrom_Linux.AppImage](https://github.com/lyskouski/app-finance/releases/latest) | [Pling Store](https://www.pling.com/p/2173504/) | [![App Image Hub](./docs/design-flow/badges/appimagehub.png)](https://www.appimagehub.com/p/2173504) |
| ![Windows](./docs/design-flow/icons/windows.png) Windows (Partner Center) | [fingrom_Windows.zip](https://github.com/lyskouski/app-finance/releases/latest) | [App Center: Fingrom](https://appcenter.ms/orgs/terCAD/apps/Fingrom) | [![Microsoft Store](./docs/design-flow/badges/windows.png)](https://apps.microsoft.com/detail/fingrom/9NNPDJ2ST0HV) |
| ![Web Browsers](./docs/design-flow/icons/web.png) Web                      | [fingrom_Web.tar.gz](https://github.com/lyskouski/app-finance/releases/latest) | [GitHub Pages: Fingrom](https://lyskouski.github.io/app-finance/) | [terCAD: Fingrom](https://tercad.com/app/finance/index.html) |


## Funktionalität
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
  - Wiederkehrende Zahlungen (mit einem Home-Widget für Android)
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
    - Einkommensgesundheits-Radar
    - Währungsverteilung
  - Rechnungen:
    - YTD-Ausgaben
    - Balkenrennen für Kategorien
  - Ziele-Gauge-Diagramm
  - Historisches Währungsdiagramm
- [[demo]](https://youtu.be/RccQ8JpfJs4) Synchronisation zwischen Geräten (P2P)
- Wiederherstellung über WebDav oder eine direkte Datei
- Import von `CSV`, `QIF`, `OFX` Dateien für Rechnungen und Abrechnungen
- Exportieren in die Excel-Datei `XLSX`
- Verschlüsselung der Daten
- Lokalisierung
- Benutzerfreundlichkeit
  - Konfigurierbare Hauptseite (mehrere Konfigurationen pro `Breite x Höhe` eingestellt)
  - Reaktionsfähiges & adaptives Design
    - Adaptives Navigationspanel (oben, unten, rechts) und Registerkarten (oben, links)
  - Themenmodus (dunkel, hell, System) mit Palettendefinition (System, benutzerdefiniert, persönlich - Farbauswahl)
  - Letzte Auswahl für Konto, Budget und Währung beibehalten
  - Automatischer Bildlauf zum fokussierten Element im Formular
  - Erweitern/Komprimieren von Abschnitten auf der Hauptseite
  - Streichen für einen schnellen Zugriff auf die Aktionen Bearbeiten und Löschen
  - Vergrößern/Verkleinern (von 60% bis 200%) über "Einstellungen"
  - Shortcuts

| Beschreibung                        | Shortcut                       |
| ----------------------------------- | ------------------------------ |
| Öffnen / Schließen der Navigationsschublade | `Shift` + `Enter`      |
| Nach oben navigieren                | Nach oben                      |
| Nach unten navigieren               | Nach unten                     |
| Ausgewählte öffnen                  | Enter                          |
| Vergrößern                          | `Strg` + `+`                   |
| Vergrößern (mit der Maus)           | `Strg` + nach unten scrollen   |
| Verkleinern                         | `Strg` + `-`                   |
| Herauszoomen (mit der Maus)         | `Strg` + nach oben rollen      |
| Zoom zurücksetzen                   | `Strg` + `0`                   |
| Neue Transaktion hinzufügen         | `Strg` + `N`                   |
| Zurückkehren                        | `Strg` + `Backspace`           |
<!--
| Selektiertes Element bearbeiten     | `Strg` + `E`                   |
| Ausgewählten Eintrag löschen        | `Strg` + `D`                   |
-->

## Unterstützung (Sponsoring)

Da es sich um ein Open-Source-Projekt handelt, werden durch ein Abonnement keine zusätzlichen Funktionen in der App
freigeschaltet. Es dient jedoch als eine Investition in die kontinuierliche Weiterentwicklung und Verbesserung der
Anwendung. Wenn Sie also einen Beitrag leisten möchten finanziell unterstützen möchten, sollten Sie diese Möglichkeiten
in Betracht ziehen:

* [Github Sponsorship](https://github.com/users/lyskouski/sponsorship)
* [Paypal](https://www.paypal.me/terCAD)
* [Patreon](https://www.patreon.com/terCAD)
* [Donorbox](https://donorbox.org/tercad)

Or, [kauf mir einen :coffee:](https://www.buymeacoffee.com/lyskouski).

## Beiträge

Jeder geleistete Beitrag **ist sehr willkommen** (auch durch Erwähnung im Abschnitt `Contributors`, `Release` Notes,
und in der App `About` - `Contributors` als Dankeschön), siehe [Contribution Section](./CONTRIBUTING_de.md) für weitere
Details.

Wenn es jedoch als Beitrag (nicht nur Tippfehlerkorrekturen) zu diesem Repo ausgewählt wurde, stimmen Sie zu, dass Sie
eine nicht-exklusive Lizenz erteilen, diesen Inhalt so zu verwenden, wie ich (und mein mögliches Team) es für angemessen
halten. Sie haben das wahrscheinlich schon erraten aber ich wollte das nur besonders deutlich machen.

## Lizenz & Copyright

Die hierin enthaltenen Inhalte sind alle &copy; 2023 **terCAD** Team (Viachaslau Lyskouski).

<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />Dieses Werk ist lizenziert unter einer <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivs 4.0 Unported License</a>:
- **Attribution**: Geben Sie einen Link zur Lizenz an, und geben Sie an, ob Änderungen vorgenommen wurden
- **NonCommercial**: kann nicht als Teil einer kommerziellen Lösung verwendet werden
- **NoDerivatives**: Jede Modifikation (Remix, Transformation oder Aufbau auf dem Material) darf nicht selbst
  weitergegeben werden. Pushen Sie es zurück in das Hauptrepository (https://github.com/lyskouski/app-finance), um die
  Verteilung für vorgenommene Änderungen freizugeben.
