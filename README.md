# ![Fingrom Logo](https://github.com/lyskouski/app-finance/blob/main/docs/mockups/logo/main.svg) Financial Accounting Application
[![License: CC BY-NC-ND 4.0](https://img.shields.io/badge/License-CC_BY--NC--ND_4.0-lightgrey.svg)](https://creativecommons.org/licenses/by-nc-nd/4.0/) 
[![Check Status](https://github.com/lyskouski/app-finance/actions/workflows/push_to_main.yml/badge.svg?branch=main)](https://github.com/lyskouski/app-finance/actions/workflows/push_to_main.yml)
[![Build Status](https://github.com/lyskouski/app-finance/actions/workflows/build.yml/badge.svg)](https://github.com/lyskouski/app-finance/actions/workflows/build.yml)

[![Unit Tests Coverage](https://lyskouski.github.io/app-finance/coverage/unit_coverage_badge.svg)](https://github.com/lyskouski/app-finance/tree/main/test/unit/)
[![Widget Tests Coverage](https://lyskouski.github.io/app-finance/coverage/widget_coverage_badge.svg)](https://github.com/lyskouski/app-finance/tree/main/test/widget)
[![End-To-End Coverage](https://lyskouski.github.io/app-finance/coverage/e2e_coverage_badge.svg)](https://github.com/lyskouski/app-finance/tree/main/test/e2e)

**Fingrom** - Open-sourced cross-platform financial accounting application without Ads and limitations.

#### Web App 
- https://lyskouski.github.io/app-finance/

#### Desktop Apps
- **Macos**:
  - Apple Store: __postponed till 1st November__
  - [TestFlight](https://developer.apple.com/testflight/): [[pending]](https://github.com/lyskouski/app-finance/issues/287)
  - [Release](https://github.com/lyskouski/app-finance/releases/latest)/fingrom_macOS.zip
- **Linux**: 
  - [Release](https://github.com/lyskouski/app-finance/releases/latest)/fingrom_Linux.tar.gz
- **Windows**: 
  - [Release](https://github.com/lyskouski/app-finance/releases/latest)/fingrom_Windows.zip

#### Mobile Apps
- **iOS**
  - Apple Store: __postponed till 1st November__
  - [TestFlight](https://developer.apple.com/testflight/): [early access](https://testflight.apple.com/join/93ECy9ZB)
  - [Release](https://github.com/lyskouski/app-finance/releases/latest)/fingrom_iOS.ipa
- **Android**
  - Google Play: [[on hold]](https://github.com/lyskouski/app-finance/issues/129)
  - Galaxy Store: [[pending]](https://github.com/lyskouski/app-finance/issues/284)
  - Huawei Gallery: [[pending]](https://github.com/lyskouski/app-finance/issues/286)

## Functionality
- Accounting (Account Type, Currency/Cryptocurrency)
  - Simple grouping via `/` (in name) for the main page
  - Transactions log
  - Freeze amount by Update date (to import previous history)
- Budget Categories with limits restate per month
  - Simple grouping via `/` (in name) for the main page
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
- Synchronization between devices (P2P) 
- Recovery via WebDav or a direct File
- Import from `CSV`, `QIF`, `OFX` files for Bills and Invoices
- Data encryption
- Localization: 2 languages
- User Experience
  - Responsive & Adaptive Design (`xlarge`, `large`, `medium`, `small`, and `xsmall` screens)
  - Theme Mode (dark, light, system) with Palette definition (system, custom, personal -- colors selector)
  - Preserve last choice for Account, Budget, and Currency
  - Auto-scroll to the focused element on Form
  - Expand / Collapse sections on Main Page
  - Swipe for a quick access to Edit and Delete actions
  - Zoom in/out (from 60% up to 200%) via "Settings" or by `Ctrl`+`+`(in), `-`(out), `0`(reset), or `Ctrl`+mouse wheel,
    <s>or by two-finger touch pinch / spread operation</s>

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

Any made contribution **is greatly appreciated** (also, by mentioning in `Contributors` section and `Release` notes
as a gratitude), check [Contribution Section](./CONTRIBUTING.md) for more details.

However, if it's been chosen a contribution (not just typo corrections) to this repo, you agree that you're giving
me a non-exclusive license to use that content, as I (and my possible team) deem appropriate. You probably guessed 
that already, but I just wanted to be extra clear on that.

## License & Copyright

The content herein are all &copy; 2023 **terCAD Team** (Viachaslau Lyskouski).

<a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-nd/4.0/88x31.png" /></a><br />This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-nd/4.0/">Creative Commons Attribution-NonCommercial-NoDerivs 4.0 Unported License</a>.
