[اللغة العربية (AR)](./about_ar.md) |
[Azərbaycanlı (AZ)](./about_az.md) |
[Тарашкевіца (BE)](./about_be.md) |
[Latsinka (BE)](./about_be_EU.md) |
[简体中文 (ZH-CN)](./about_zh.md) |
[繁體中文 (ZH-TW)](./about_zh_TW.md) |
[Čeština (CS)](./about_cs.md) |
[Nederlandse (NL)](./about_nl.md) |
English (EN-US) |
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

**Fingrom** -- open-source cross-platform financial accounting application without Ads and limitations.
The goal of the solution is to create a financial accounting application that is intuitive, efficient, and inclusive.
That empowers users to effortlessly manage their finances while ensuring that no one is left behind.

[![Watch the video](../images/presentation_en.png)](https://youtu.be/sNTbpILLsOw)

### Functionality
- Accounting (Account Type, Currency/Cryptocurrency)
  - Simple grouping via `/`-symbol (in name) for the main page
  - Transactions log
  - Freeze amount by Update date (to import previous history)
- Budget Categories
  - Simple grouping via `/`-symbol (in name) for the main page
  - With limits restate:
    - Renewed at the beginning of each month
    - Configurable limits per month
    - Relatives (0.0 ... 1.0) to Income
  - Or, without limitations by showing a spent amount
  - Different timeline: weekly, monthly, yearly
  - Customizable start day of the week and month
- Bills, Transfers, Incomes (Invoices)
  - Recurring Payments (with a home widget)
  - Filtering
  - Budget Category assumption / prediction
- Goals Definition
- Exchange rates, Default Currency for Summary
- Metrics:
  - Budget:
    - Forecast (with Monte Carlo simulation)
    - Budget limit and expenses per month
  - Account:
    - Candlestick (OHLC) Chart
    - Income Health Radar
    - Currency Distribution
  - Bills:
    - YTD Expenses
    - Bar Race for Categories
  - Goals Gauge Chart
  - Currency Historical Chart
- Synchronization between devices (P2P)
- Recovery via WebDav or a direct File
- Import from `CSV`, `QIF`, `OFX` files for Bills and Invoices
- Export to Excel `XLSX` file
- Data encryption
- Localization
- User Experience
  - Configurable Main Page (multiple configurations per `width x height` set)
  - Responsive & Adaptive Design
    - Adaptive navigation panel (top, bottom, right) and tabs (top, left)
  - Theme Mode (dark, light, system) with Palette definition (system, custom, personal -- colors selector)
  - Preserve last choice for Account, Budget, and Currency
  - Auto-scroll to the focused element on Form
  - Expand / Collapse sections on Main Page
  - Swipe for a quick access to Edit and Delete actions
  - Zoom in/out (from 60% up to 200%) via "Settings"
  - Shortcuts

| Description                         | Shortcut                       |
| ----------------------------------- | ------------------------------ |
| Open / Close the Navigation Drawer  | `Shift` + `Enter`              |
| Navigate Up                         | `up`                           |
| Navigate Down                       | `down`                         |
| Open Selected                       | `Enter`                        |
| Zoom In                             | `Ctrl` + `+`                   |
| Zoom In (with mouse)                | `Ctrl` + `scroll down`         |
| Zoom Out                            | `Ctrl` + `-`                   |
| Zoom Out (with mouse)               | `Ctrl` + `scroll up`           |
| Reset Zoom                          | `Ctrl` + `0`                   |
| Add new Transaction                 | `Ctrl` + `N`                   |
| Return Back                         | `Ctrl` + `Backspace`           |
<!--
| Edit Selected Item                  | `Ctrl` + `E`                   |
| Delete Selected Item                | `Ctrl` + `D`                   |
-->
