[ English | [Deutsch](./README_de.md) | [简体中文](./README_zh-CN.md) ]

# ![Fingrom Logo](./docs/design-flow/logo/main.svg) Financial Accounting Application
[![License: CC BY-NC-ND 4.0](https://img.shields.io/badge/License-CC_BY--NC--ND_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-nd/4.0/) 
[![Check Status](https://github.com/lyskouski/app-finance/actions/workflows/push_to_main.yml/badge.svg?branch=main)](https://github.com/lyskouski/app-finance/actions/workflows/push_to_main.yml)
[![Build Status](https://github.com/lyskouski/app-finance/actions/workflows/build.yml/badge.svg)](https://github.com/lyskouski/app-finance/actions/workflows/build.yml)

[![Unit Tests Coverage](https://lyskouski.github.io/app-finance/coverage/unit_coverage_badge.svg)](https://github.com/lyskouski/app-finance/tree/main/test/unit/)
[![Widget Tests Coverage](https://lyskouski.github.io/app-finance/coverage/widget_coverage_badge.svg)](https://github.com/lyskouski/app-finance/tree/main/test/widget)
[![End-To-End Coverage](https://lyskouski.github.io/app-finance/coverage/e2e_coverage_badge.svg)](https://github.com/lyskouski/app-finance/tree/main/test/e2e)

**Fingrom** -- open-source cross-platform financial accounting application without Ads and limitations.
The goal of the solution is to create a financial accounting application that is intuitive, efficient, and inclusive. 
That empowers users to effortlessly manage their finances while ensuring that no one is left behind.

```mermaid
gantt
    section Roadmap
    Initial                 :done, dis1, 2023-06-15, 15d
    Prototype               :done, dis2, 2023-07-01, 1M
    Market Shake Features   :done, dis3, 2023-08-01, 1M
    UI / UX Flow            :done, dis4, 2023-09-01, 1M
    Production Ready Stage  :done, dis5, 2023-10-01, 1M
    User Feedback           :active, dis6, 2023-11-01, 2M
    Components Library      : dis7, 2024-01-01, 1M
    ML Integration          : dis8, 2024-02-01, 1M
```

[![Watch the video](./docs/marketing-flow/presentation_video.png)](https://youtu.be/sNTbpILLsOw)


| Type                     | Alpha Version         | Pre-Release                   | Release                       |
| ------------------------ | ----------------------| ----------------------------- | ----------------------------- |
| ![Apple](./docs/design-flow/icons/apple.png) iOS (Apple Store)        | [fingrom_iOS.ipa](https://github.com/lyskouski/app-finance/releases/latest) | [TestFlight: Fingrom](https://testflight.apple.com/join/93ECy9ZB) | [![iOS Apple Store](./docs/design-flow/badges/ios.png)](https://apps.apple.com/us/app/fingrom/id6463955600) |
| ![Apple](./docs/design-flow/icons/apple.png) macOS (Apple Store)      | [fingrom_macOS.zip](https://github.com/lyskouski/app-finance/releases/latest) | Not available for testing | [![macOS Apple Store](./docs/design-flow/badges/macos.png)](https://apps.apple.com/us/app/fingrom/id6463955600) |
| ![Android](./docs/design-flow/icons/android.png) Android (Google Play)    | [fingrom_Android.aab](https://github.com/lyskouski/app-finance/releases/latest) | [[on hold]](https://github.com/lyskouski/app-finance/issues/129) | [[on hold]](https://github.com/lyskouski/app-finance/issues/129) |
| ![Android](./docs/design-flow/icons/android.png) Android (Galaxy Store)   | [fingrom_Android.aab](https://github.com/lyskouski/app-finance/releases/latest) | [Galaxy Store](https://galaxystore.samsung.com/detail/com.tercad.fingrom) | [![Fingrom](./docs/design-flow/badges/galaxy-store.png)](https://galaxy.store/apFinance) |
| ![Android](./docs/design-flow/icons/android.png) Android (Huawei Gallery) | [fingrom_Android.aab](https://github.com/lyskouski/app-finance/releases/latest) | [App Gallery](https://appgallery.huawei.com/#/app/C109437079) | [![App Gallery](./docs/design-flow/badges/huawei.png)](https://appgallery.huawei.com/#/app/C109437079) |
| ![Linux](./docs/design-flow/icons/linux.png) Linux (Snap Store)       | [fingrom_LinuxSnap.snap](https://github.com/lyskouski/app-finance/releases/latest) | [![Fingrom](https://snapcraft.io/fingrom/badge.svg)](https://snapcraft.io/fingrom) | [![Snapcraft: Fingrom](./docs/design-flow/badges/snap-store.png)](https://snapcraft.io/fingrom) |
| ![Linux](./docs/design-flow/icons/linux.png) Linux (Flathub)          | [fingrom_LinuxFlatpak.flatpak](https://github.com/lyskouski/app-finance/releases/latest)  | Not available | [ ![Flathub: Fingrom](./docs/design-flow/badges/flathub.png) ](https://flathub.org/apps/com.tercad.fingrom) |
| ![Linux](./docs/design-flow/icons/linux.png) Linux (AppImage)         | [pending] | [pending] | [pending] |
| ![Windows](./docs/design-flow/icons/windows.png) Windows (Partner Center) | [fingrom_Windows.zip](https://github.com/lyskouski/app-finance/releases/latest) | [App Center: Fingrom](https://appcenter.ms/orgs/terCAD/apps/Fingrom) | [![Microsoft Store](./docs/design-flow/badges/windows.png)](https://apps.microsoft.com/detail/fingrom/9NNPDJ2ST0HV) |
| ![Web Browsers](./docs/design-flow/icons/web.png) Web                      | [fingrom_Web.tar.gz](https://github.com/lyskouski/app-finance/releases/latest) | [GitHub Pages: Fingrom](https://lyskouski.github.io/app-finance/) | [terCAD: Fingrom](https://tercad.com/app/finance/index.html) |


## Functionality
- Accounting (Account Type, Currency/Cryptocurrency)
  - Simple grouping via `/` (in name) for the main page
  - Transactions log
  - Freeze amount by Update date (to import previous history)
- Budget Categories
  - Simple grouping via `/` (in name) for the main page
  - With limits restate:
    - Renewed at the beginning of each month
    - Configurable limits per month
    - Relatives (0.0 ... 1.0) to Income
  - Or, without limitations by showing a spent amount
- Bills, Transfers, Incomes (Invoices)
- Goals Definition
- Exchange rates, Default Currency for Summary
- Metrics: 
  - Budget:
    - Forecast (with Monte Carlo simulation)
  - Account:
    - Candlestick (OHLC) Chart
    - Income Health Radar
    - Currency Distribution
  - Bills:
    - YTD Expenses
    - Bar Race for Categories
  - Goals Gauge Chart
  - Currency Historical Chart
- [[demo]](https://youtu.be/RccQ8JpfJs4) Synchronization between devices (P2P) 
- Recovery via WebDav or a direct File
- Import from `CSV`, `QIF`, `OFX` files for Bills and Invoices
- Data encryption
- Localization: 8 languages
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

## Support (Sponsorship)

As an open-source project, subscribing will not unlock any additional features in the app. However, it would serve as 
an investment in the continuous evolution and improvement of the application. So, if you'd like to contribute 
financially towards the efforts, please consider these options:

* [Github Sponsorship](https://github.com/users/lyskouski/sponsorship)
* [Paypal](https://www.paypal.me/terCAD)
* [Patreon](https://www.patreon.com/terCAD)
* [Donorbox](https://donorbox.org/tercad)

Or, [treat me to :coffee:](https://www.buymeacoffee.com/lyskouski).

## Contributions

Any made contribution **is greatly appreciated** (also, by mentioning in `Contributors` section, `Release` notes, and 
in the app `About` - `Contributors` as a gratitude), check [Contribution Section](./CONTRIBUTING.md) for more details.

However, if it's been chosen a contribution (not just typo corrections) to this repo, you agree that you're giving
me a non-exclusive license to use that content, as I (and my possible team) deem appropriate. You probably guessed 
that already, but I just wanted to be extra clear on that.

## License & Copyright

The content herein are all &copy; 2023 **terCAD** Team (Viachaslau Lyskouski).

<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivs 4.0 Unported License</a>:
- **Attribution**: provide a link to the license, and indicate if changes were made
- **NonCommercial**: cannot be used as a part of a commercial solution
- **NoDerivatives**: any modification (remix, transform, or build upon the material) cannot be distributed by your own. 
  Push it back to the main repository (https://github.com/lyskouski/app-finance) to unblock the distribution for made 
  changes.
