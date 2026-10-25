# Fingrom: Competitive & Market Research

> Date: 2026-10-25

> Scope: personal finance / budgeting applications that a Fingrom user could pick instead.

> Goal: identify (1) the alternatives, (2) their strong points, (3) functionality missing in

> Fingrom, and (4) what users actually ask for.

**Method & caveats**

- Fingrom's baseline comes from the [README](../README.md) and checks against the code in `lib/` (October 2026).
- Competitor data comes from vendor pages, app store listings, independent reviews and 2025–2026 roundups. Prices
  change often, and many roundups are written by competing vendors, so treat prices as approximate.
- User demand comes from: the top-voted feature requests in public GitHub trackers (Actual Budget, Cashew, Ivy Wallet),
  open Fingrom issues, published surveys (Forbes Advisor 2026, Academy Bank 2025) and analyses of negative reviews.
  Sources are listed at the end.

---

## 1. Fingrom Baseline (what we have)

| Area | Fingrom today |
| ---- | ------------- |
| Platforms | iOS, macOS, Android (Google Play, Galaxy, Huawei, Amazon), Linux (Snap, Flathub, AppImage), Windows, Web. All from one Flutter codebase |
| Price / model | Free, no ads, no feature paywall. Donations only |
| License | CC BY-NC-ND 4.0, with source available on GitHub |
| Accounts | Bank account, cash, debit/credit card, deposit, credit. Multi-currency incl. crypto. Grouping via `/`. Freeze the balance at a date |
| Budgets | Monthly limits (fixed per month, or relative to income), weekly/monthly/yearly view, custom start of week/month |
| Transactions | Bills, incomes, transfers, recurring payments, split bill, category prediction, filtering/search |
| Goals | Goals with a gauge chart |
| Analytics | Monte Carlo budget forecast, OHLC account chart, income health radar, currency distribution, YTD, bar race, currency history |
| Data | Import CSV/QIF/OFX; export XLSX; recovery via WebDAV or file; encryption |
| Sync | Serverless P2P sync between devices (WebRTC) |
| Security | TOTP code, recovery code, biometrics |
| UX | Configurable dashboard per screen size, adaptive navigation, themes and custom palettes, zoom 60–200%, keyboard shortcuts, Android home widget (recurring payments) |
| Localization | ~27 languages (incl. RTL: Arabic, Persian) |

---

## 2. Competitive Landscape

### 2.1 Commercial, bank-sync-first apps (mostly US/Canada)

| App | Platforms | Price (approx., 2026) | Strong options |
| --- | --------- | --------------------- | -------------- |
| **YNAB** | iOS, Android, Web | $14.99/mo or ~$109/yr | Zero-based "give every dollar a job" method, Age of Money, target-based category goals, loan planner, strong education/community. *Weak:* price, learning curve, and backlash against the June 2026 redesign and in-app promotions |
| **Monarch Money** | iOS, Android, Web | $14.99/mo or $99.99/yr (Plus ~$199/yr) | The main Mint successor. Household sharing at no extra cost, investments and net worth, AI assistant (Dec 2025), receipt scanning, equity tracking, cash-flow forecasting, rental/business tracking in the Plus plan |
| **Copilot Money** | iOS/macOS, Web (since Dec 2025) | $13/mo or $95/yr | Polished native UX, AI auto-categorization that learns from corrections, rollover budgets, spending pace, subscription detection. No Android app |
| **Rocket Money** | iOS, Android, Web | Free / $7–14/mo | Subscription detection and cancellation concierge, bill negotiation, credit score |
| **Quicken Simplifi** | iOS, Android, Web | ~$6/mo | Spending plan ("what's left"), projected cash flow, watchlists |
| **EveryDollar** | iOS, Android, Web | Free (manual) / Premium (bank sync) | Ramsey method, simple zero-based budget |
| **PocketGuard** | iOS, Android | Freemium | "In my pocket": safe-to-spend after bills and goals, debt payoff plan |
| **Lunch Money** | Web, iOS | ~$10/mo | Developer-friendly: multi-currency, rules, public API, crypto, budgeting by category groups |
| **Cleo** | iOS, Android | Freemium | Conversational AI coach with a "roast/hype" tone, aimed at younger users |

### 2.2 Mobile-first trackers with manual entry (global market, closest to Fingrom's audience)

| App | Platforms | Model | Strong options |
| --- | --------- | ----- | -------------- |
| **Wallet (BudgetBakers)** | iOS, Android, Web | Freemium + lifetime | Bank sync with ~4,000 banks, **shared accounts** where everyone contributes from any platform, planned payments with cash-flow impact, receipt photos, rich reports, debts, loyalty cards |
| **Spendee** | iOS, Android, Web | Freemium | Shared wallets, bank sync, crypto wallet tracking, attractive design |
| **Money Lover** | iOS, Android, Web | Freemium | Wallet sharing, events/trips, debt & loan tracking, bill reminders. Multiple wallets are paywalled |
| **Money Manager (Realbyte)** | iOS, Android, PC (via Wi-Fi) | Freemium | Very fast double-entry style input, calendar view, card statements, asset management, password, Google Drive/Dropbox backup |
| **Monefy** | iOS, Android | Freemium | Fastest entry possible (one-tap category on a pie chart). Little else |
| **1Money** | iOS, Android | Freemium | Simple, beautiful UI, widgets |
| **Toshl Finance** | iOS, Android, Web | Freemium (free tier: 2 accounts, 2 budgets) | Playful UI, ~13,000 bank connections, multi-currency, tags |
| **Bluecoins** | Android (+ desktop viewer) | Freemium | Dozens of reports, net worth, reminders, Google Drive/Dropbox sync. Strong with travellers (multi-currency) |
| **MoneyWiz 2026** | iOS, macOS (v3 also Android/Win) | Subscription | Bank sync, E2E-encrypted sync, forecasting, investments. *Weak:* reported sync failures and wrong balances |

### 2.3 Open-source / privacy-first alternatives (direct "philosophical" competitors)

| App | Platforms | License | Strong options |
| --- | --------- | ------- | -------------- |
| **Actual Budget** | Web/PWA, desktop (Electron), self-host | MIT (~28k ★) | Local-first envelope budgeting, optional E2E encryption, **rules engine**, **custom reports** (its most-voted request), reconciliation, schedules, bank sync (SimpleFIN for US, GoCardless/Enable Banking for EU/UK), YNAB/nYNAB importers, CLI/API |
| **Firefly III** | Self-hosted web (+ third-party mobile apps) | AGPL-3.0 (~24k ★) | Double-entry bookkeeping, rule engine, piggy banks, bill prediction, tags, **REST API**, webhooks, separate data importer (CSV, CAMT.052/053, bank providers) |
| **Cashew** | Android, iOS, Web (Flutter) | GPL-3.0 (~4.5k ★, 100k+ installs, 4.9★) | Same stack as Fingrom. **Notification / SMS parser** for automatic entry, Google Drive sync, objectives (goals and loans/debts), long-term loans, subscriptions view, app links for automation. Tagged releases have stalled since mid-2024 (still committing in 2026) |
| **Ivy Wallet** | Android | GPL-3.0 | Planned payments, loans, CSV import. **Unmaintained since Nov 2024**, so its users are looking for a successor |
| **Maybe → Sure** | Self-host web | AGPL | Net worth, investments, AI chat. Maybe was discontinued and the community fork "Sure" continues it |
| **Ghostfolio** | Self-host web | AGPL | Investment/portfolio tracking (dividends, allocation, performance) |
| **GnuCash / KMyMoney / HomeBank / Money Manager Ex** | Desktop (MMEX also Android) | GPL | Full accounting, investments, loans, reports, OFX/QIF, scheduled transactions. Dated UX |
| **Beancount + Fava / Ledger / hledger** | CLI + web UI | GPL | Plain-text accounting, beloved by power users. Auditable and scriptable |

---

## 3. Feature Matrix

Legend: ✅ supported · ⚠️ partial/limited · ❌ missing

| Feature | Fingrom | Actual | Firefly III | Cashew | Wallet (BB) | Money Manager (Realbyte) | YNAB | Monarch |
| ------- | :-----: | :----: | :---------: | :----: | :---------: | :----------------------: | :--: | :-----: |
| Free with no paywall or ads | ✅ | ✅ (self-host) | ✅ (self-host) | ✅ | ❌ | ⚠️ (ads) | ❌ | ❌ |
| Android + iOS + Desktop + Web | ✅ | ⚠️ (no native mobile) | ⚠️ (web only) | ⚠️ (no desktop) | ✅ | ⚠️ | ✅ | ✅ |
| Works fully offline / local-first | ✅ | ✅ | ❌ | ✅ | ⚠️ | ✅ | ❌ | ❌ |
| Multi-currency + crypto | ✅ | ⚠️ | ✅ | ✅ | ✅ | ✅ | ❌ | ⚠️ |
| Device sync | ✅ P2P | ✅ server | ✅ server | ✅ GDrive | ✅ cloud | ⚠️ backup | ✅ | ✅ |
| Automatic bank sync | ❌ | ✅ | ⚠️ (importer) | ❌ | ✅ | ❌ | ✅ | ✅ |
| Notification/SMS auto-capture | ❌ | ❌ | ❌ | ✅ | ❌ | ⚠️ | ❌ | ❌ |
| User-defined rules (auto-categorize/rename) | ⚠️ (prediction only) | ✅ | ✅ | ⚠️ | ✅ | ❌ | ⚠️ | ✅ |
| Tags / labels | ❌ | ✅ | ✅ | ⚠️ | ✅ | ❌ | ⚠️ (flags) | ✅ |
| Payees / merchants as entities | ❌ | ✅ | ✅ | ⚠️ | ✅ | ❌ | ✅ | ✅ |
| Split transaction | ✅ | ✅ | ✅ | ✅ | ✅ | ❌ | ✅ | ✅ |
| Receipt photo / attachments | ❌ | ❌ | ✅ | ⚠️ | ✅ | ✅ | ❌ | ✅ |
| Receipt OCR / AI scan | ❌ | ❌ | ❌ | ⚠️ | ⚠️ | ❌ | ❌ | ✅ |
| Envelope / zero-based budgeting | ❌ | ✅ | ⚠️ | ❌ | ❌ | ❌ | ✅ | ⚠️ |
| Budget rollover / carry-over | ❌ | ✅ | ⚠️ | ✅ | ⚠️ | ❌ | ✅ | ✅ |
| Recurring / scheduled transactions | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Bill reminders (push notifications) | ❌ | ❌ | ⚠️ | ✅ | ✅ | ✅ | ⚠️ | ✅ |
| Subscription detection | ❌ | ❌ | ❌ | ⚠️ | ⚠️ | ❌ | ❌ | ✅ |
| Loans / debts with schedule | ⚠️ (account type) | ⚠️ | ⚠️ | ✅ | ✅ | ⚠️ | ✅ | ✅ |
| Investments / holdings / net worth | ⚠️ (balances only) | ⚠️ | ⚠️ | ❌ | ⚠️ | ⚠️ | ❌ | ✅ |
| Goals | ✅ | ✅ | ✅ | ✅ | ✅ | ❌ | ✅ | ✅ |
| Reconciliation | ❌ | ✅ | ✅ | ❌ | ❌ | ❌ | ✅ | ❌ |
| Custom / ad-hoc reports | ⚠️ (fixed charts) | ✅ | ✅ | ⚠️ | ✅ | ⚠️ | ⚠️ | ✅ |
| Forecasting | ✅ Monte Carlo | ❌ | ❌ | ❌ | ⚠️ | ❌ | ❌ | ✅ |
| Shared household (multi-user) | ⚠️ (P2P same data) | ⚠️ | ⚠️ | ❌ | ✅ | ❌ | ✅ | ✅ |
| Import from other apps | ⚠️ (CSV/QIF/OFX) | ✅ (YNAB etc.) | ✅ | ✅ | ✅ | ⚠️ | ⚠️ | ✅ (Mint) |
| Export (CSV/JSON/open format) | ⚠️ (XLSX only) | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ | ✅ |
| Public API / automation hooks | ❌ | ✅ | ✅ | ⚠️ (app links) | ❌ | ❌ | ✅ | ❌ |
| AI assistant / natural-language queries | ❌ | ❌ | ❌ | ❌ | ⚠️ | ❌ | ❌ | ✅ |
| Home-screen widgets | ⚠️ (Android only) | ❌ | ❌ | ✅ | ✅ | ✅ | ✅ | ✅ |
| 2FA + biometrics + encryption | ✅ | ⚠️ | ⚠️ | ⚠️ | ⚠️ | ⚠️ | ⚠️ | ⚠️ |
| Many UI languages | ✅ ~27 | ⚠️ | ✅ | ✅ | ✅ | ✅ | ❌ | ❌ |

*Cells for competitors reflect publicly documented features. "⚠️" often means the feature is paywalled, minimal, or
only on some platforms.*

---

## 4. Fingrom's Strong Points (keep and promote)

1. **Free with no paywall or ads, on every platform.** Few apps cover iOS, Android, macOS, Windows, Linux and Web at
   once. Most open-source competitors are web-only or mobile-only. Price is the #2 reason for negative reviews
   elsewhere (~22% of 1–3★ reviews), and "free like Mint was" is the most common post-Mint request.
2. **Serverless P2P sync.** You get privacy without self-hosting. Actual and Firefly need a server, Cashew needs Google.
3. **Analytics depth.** Monte Carlo forecasting, OHLC and income radar are unique among free apps. Forecasting usually
   costs money (Monarch Plus, Simplifi).
4. **Security set.** TOTP, recovery code, biometrics and encryption together are rare even in paid apps (Forbes 2026
   ranks "biometrics, MFA and encryption" as a scoring factor).
5. **Localization and accessibility.** ~27 languages incl. RTL, zoom up to 200%, keyboard shortcuts. US leaders are
   English-only.
6. **Engineering quality.** Unit, widget and E2E coverage. By contrast, the closest Flutter competitor (Cashew) has a
   103k-LOC codebase with zero tests, and Ivy Wallet is abandoned. This means Fingrom can credibly be a *maintained*
   successor for those users.

**Perception risks to address**

- **License.** CC BY-NC-ND is *source-available*, not OSI/FSF open source. Competitors advertise MIT/GPL/AGPL.
  F-Droid accepts only FLOSS licenses, which likely blocks issue #208 (Publish to F-DROID). Privacy-oriented
  communities (r/selfhosted, r/privacy, F-Droid users) are a core audience for local-first apps.
- **Trackers.** The app ships `firebase_analytics` and `firebase_crashlytics`. Users publicly criticised Ivy Wallet for
  exactly this. Consider an opt-in toggle or a tracker-free build flavor (for F-Droid/Flathub).

---

## 5. Missing Functionality (Gap Analysis)

Priority = user demand × competitive pressure × fit with Fingrom's privacy/offline positioning.

### P1: High demand, clear gap

| # | Gap | Evidence / who has it | Suggested approach for Fingrom | Related issue |
| - | --- | --------------------- | ------------------------------ | ------------- |
| 1 | **Automatic transaction capture** | Manual entry is the #1 friction. Bank sync is a "must-have" in every 2026 checklist, but it is also the #1 source of negative reviews (34% of 1–3★, caused by Plaid/MX breakage) | Use cheap, private capture first: **Android notification/SMS parser** (Cashew's most-loved feature), share-intent from banking apps, Shortcuts/Tasker/app links. Then add opt-in open banking: **Enable Banking** (EU), **FinTS** (DE), **SimpleFIN** (US). GoCardless stopped taking new sign-ups in July 2025 | #120, #314, #252, #630 |
| 2 | **Tags and payees** | Top request in Cashew ("Payer, Payee, and Tag functionality much needed", #birthday/#amazon tags) and Actual. Standard in Firefly, Wallet, Toshl, Monarch | Add free-form tags (cross-category reporting, e.g. trips, events), and payees with a default category, which also feeds the prediction | — |
| 3 | **Rules engine** | Core to Actual, Firefly, Monarch, Lunch Money. Essential once imports or auto-capture exist | "If description/payee/amount matches → set category, tags, rename". Run on import and capture | #275 |
| 4 | **Receipt attachments and scanning** | Wallet, Money Manager, Firefly have attachments. Monarch shipped receipt scanning in Dec 2025. Requested in Ivy | Store images per bill (encrypted, synced via P2P), then add on-device OCR (ML Kit / Apple Vision) to prefill amount, date and merchant | #321, #293 |
| 5 | **Bill reminders and notifications** | Users complain about "missed renewal alerts". Ivy and Cashew users asked for notifications on planned payments. Money Lover, Bluecoins and Wallet have them | Local notifications for upcoming recurring payments, budget-limit thresholds (80%/100%), and goal milestones | — |
| 6 | **Budget rollover / envelope mode** | YNAB's and Actual's core value. Copilot and Monarch offer rollover. "Option to automatically hold income for next month" is a top Actual request | Optional per-category carry-over of leftover/overspend. Optional "zero-based" mode (assign income to categories) | — |
| 7 | **Loans and debts** | Ivy ("Debt/Loans borrowing/lending"), Actual ("Linked Loan Accounts"), Cashew (long-term loans), YNAB loan planner, PocketGuard debt payoff | Loan accounts with interest and amortization schedule, auto-split of payment into principal and interest, payoff projection (snowball/avalanche). Also lent/borrowed to people | #309 |

### P2: Competitive parity

| # | Gap | Evidence / who has it | Suggested approach |
| - | --- | --------------------- | ------------------ |
| 8 | **Custom reports** | **Most-voted Actual request ever (163 👍)**. Also "average expenditure by year" and fiscal-year periods | Report builder: group by category/tag/payee/account × period, chart type, save as a dashboard widget. Export to CSV/PDF |
| 9 | **Open export and migration importers** | Data portability is a top concern after Mint. Users of the abandoned Ivy and the stalled Cashew need a path in | CSV/JSON/QIF/OFX export. One-click importers for YNAB, Mint CSV, Cashew backup, Ivy CSV, Money Manager (Realbyte), Wallet |
| 10 | **Reconciliation** | Actual (47 👍 "lock transactions"), YNAB, Firefly | Mark transactions as cleared/reconciled against a statement balance, then lock them |
| 11 | **Household / shared budgets** | Monarch's top differentiator. Wallet, Money Lover and Spendee have shared wallets. Cashew request "share budgeting with my family/spouse". Forbes 2026 rates "sharing with family" | Build on P2P sync: per-user attribution ("added by"), shared vs. private accounts, a simple invite via QR |
| 12 | **Automatic cloud backups** | Ivy's #2 request ("scheduled automatic local backup"). Cashew request "sync with other than GDrive". Bluecoins and Realbyte use GDrive/Dropbox | Scheduled encrypted backups to local folder, WebDAV (existing), Google Drive, iCloud, Dropbox, Nextcloud |
| 13 | **Widgets and quick entry everywhere** | Widgets are standard in mobile trackers. Requests for an accounts widget and a cash-in/out widget. Voice entry | iOS widgets, Android quick-add, balance and budget widgets, Wear OS / Apple Watch quick entry, voice input | #121 |
| 14 | **Subscription tracking** | Rocket Money's core product. Copilot and Monarch detect subscriptions. Cashew request "view all overdue subscriptions" | A dedicated "Subscriptions" view over recurring payments with yearly cost and upcoming renewals. Later, auto-detection of repeated payees |
| 15 | **Investments / net worth** | Monarch, Sure, Ghostfolio, MoneyWiz. Net worth is a top metric in roundups | Holdings (ticker, qty, cost basis) with price refresh, an asset/liability net-worth timeline, manual assets (property, car) |

### P3: Differentiators and trends (2025–2026)

| # | Idea | Rationale |
| - | ---- | --------- |
| 16 | **Private AI assistant** | Monarch (Dec 2025), Copilot and Cleo push AI chat and auto-categorization, but privacy-minded users distrust cloud AI on financial data. An **on-device/BYO-key** assistant ("how much did I spend on food in Q2?", "can I afford X?") fits Fingrom's positioning. Start with offline categorization via the existing prediction |
| 17 | **Cash-flow calendar** | Wallet ("how payments will impact your cash flow"), Simplifi, Monarch. Project account balances forward from scheduled payments, which complements the Monte Carlo forecast |
| 18 | **"Safe to spend" summary** | PocketGuard's "In my pocket" and Simplifi's spending plan answer the most common question in one number |
| 19 | **Local API / automation** | Firefly's REST API, Actual's API and Lunch Money's API attract power users and integrations (Home Assistant, scripts) |
| 20 | **Trips / events** | Money Lover events and Cashew tag requests: group spending for a trip in a foreign currency. Could be built on tags |
| 21 | **Need vs. want classification** | Cashew request. Supports 50/30/20 budgeting, which Monarch is recommended for |
| 22 | **Tax / business separation** | Monarch Plus (rental/business), Actual sales-tax split. Useful for freelancers |

---

## 6. What Users Are Looking For: Summary

Ranked from the strongest signals across surveys, review analyses and issue trackers:

1. **Ease of use and fast entry.** This is the #1 factor in Academy Bank's survey and Forbes 2026. Monefy and
   Realbyte win on speed of input.
2. **Low or no cost.** This is the #2 complaint category. Users moved from free Mint to $60–180/yr apps and resent it.
3. **Automatic import that does not break.** Bank sync is wanted, but its reliability is the top complaint. Users
   value graceful fallbacks (file import, notification capture).
4. **Flexible categorization:** custom categories and subcategories, tags, payees, rules.
5. **Clear reports and charts,** including custom ones.
6. **Sharing with a partner or family.**
7. **Privacy, security and data ownership:** biometrics, MFA, encryption, export, no data selling. Manual or
   local-first apps are seen as the low-risk option.
8. **Reminders for bills and renewals.**
9. **Debt, loan and goal tracking.**
10. **AI help** (categorization, Q&A), which is growing but polarizing on privacy.

---

## 7. Recommended Roadmap (proposal)

| Phase | Items | Why first |
| ----- | ----- | --------- |
| **Next** | Tags + payees (#2), rules (#3), local notifications (#5), CSV/JSON export + importers for Ivy/Cashew/YNAB/Mint (#9) | Low effort, unblock everything else, and capture users of abandoned or stalled apps |
| **Then** | Android notification parser (#1, #120), receipt attachments → OCR (#4, #321, #293), rollover (#6), loans (#7, #309) | High demand with an offline-first approach |
| **Later** | Open banking (Enable Banking / FinTS / SimpleFIN) (#1, #314), custom reports (#8), household sharing (#11), investments (#15), on-device AI (#16) | Larger scope or external dependencies |
| **Positioning** | Reconsider the license for F-Droid/FLOSS perception. Add an analytics opt-out or a tracker-free flavor. Market Fingrom as "the maintained, free, cross-platform, private alternative to Mint/Ivy/Cashew" | Low cost, high trust impact |

---

## Sources

- Roundups and pricing: [Penny Hoarder: Best budgeting apps 2026](https://www.thepennyhoarder.com/budgeting/best-budgeting-apps/),
  [Forbes Advisor: Best budgeting apps 2026](https://www.forbes.com/advisor/banking/best-budgeting-apps/),
  [Rocket Money: Best budgeting apps](https://rocketmoney.com/learn/personal-finance/best-budgeting-apps),
  [NerdWallet: Best budget apps](https://www.nerdwallet.com/finance/learn/best-budget-apps?advid=2),
  [WalletHub: Best budget apps](https://wallethub.com/best-budget-apps)
- Surveys: [Academy Bank: Role of budgeting apps (2025)](https://www.academybank.com/assets/files/PGxTMoi1/Role_of_Budgeting_Apps_in_Personal_Finance.pdf)
- Mint shutdown: [Tiller: Mint FAQ and alternatives](https://tiller.com/mint), [Yahoo Tech: Mint alternatives](https://tech.yahoo.com/article/the-best-budgeting-apps-to-replace-mint-143047346.html)
- Monarch: [Penny Hoarder review](https://www.thepennyhoarder.com/budgeting/monarch-money-review/), [Monarch release notes](https://releasebot.io/updates/monarch)
- YNAB: [YNAB complaints](https://pocketclear.app/blog/ynab-complaints-problems.html), [YNAB review 2026](https://envelopebudgeting.com/articles/ynab-review), [v26.20 backlash](https://mwm.ai/articles/ynab-v26-20-adds-ceo-book-ads-sparks-user-outrage-over-ui-changes-in-june-2026)
- Copilot: [Penny Hoarder review](https://www.thepennyhoarder.com/budgeting/budgeting-copilot-money-review/), [Envelope Budgeting review](https://envelopebudgeting.com/articles/copilot-money-review)
- Complaints analysis: [Unstar: budgeting apps ranked 2026](https://unstar.app/it/blog/ynab-vs-rocket-money-vs-monarch-budgeting-apps-ranked-2026), [Gerald: budgeting app limitations](https://joingerald.com/learn/financial-wellness/budgeting-apps-feature-limitations-guide)
- Wallet (BudgetBakers): [Release notes 9.2.12](https://www.apkmirror.com/apk/budgetbakers-com/wallet-budget-tracker/wallet-budget-expense-tracker-9-2-12-release/)
- Mobile trackers: [Neowin: best budgeting apps for Android](https://www.neowin.net/news/these-are-the-best-budgeting-apps-for-android/), [Android Headlines](https://www.androidheadlines.com/best-money-management-android-apps), [GummySearch: Reddit expense tracker reviews](https://gummysearch.com/tools/best-products/expense-tracker/)
- Toshl / Bluecoins / MoneyWiz: [Toshl alternatives](https://alternativeto.net/software/toshl/?p=6), [Bluecoins alternatives](https://alternativeto.net/software/bluecoins/?p=3), [MoneyWiz 2026 vs 3](https://help.wiz.money/en/articles/4563902-what-is-the-difference-between-moneywiz-2021-and-moneywiz-3), [Setapp reviews](https://setapp.com/de/apps/moneywiz/customer-reviews)
- Open source: [OpenAlternative: budgeting apps](https://openalternative.co/categories/productivity-utilities/personal-finance-management/budgeting-apps),
  [Firefly III docs](https://docs.firefly-iii.org/explanation/firefly-iii/about/introduction/),
  [Actual Budget: GoCardless](https://actualbudget.org/docs/advanced/bank-sync/gocardless/),
  [Code with Andrea: Cashew code review](https://codewithandrea.com/videos/code-review-cashew-app/),
  [Ivy Wallet on AlternativeTo](https://www.alternativeto.net/software/ivy-wallet--track-your-income-expenses-and-budget/about/),
  [Maybe alternatives](https://alternativeto.net/software/maybe)
- Feature-request trackers (sorted by 👍, retrieved via GitHub API on 2026-10-25):
  [actualbudget/actual](https://github.com/actualbudget/actual/issues?q=label%3Afeature+sort%3Areactions-%2B1-desc),
  [jameskokoska/Cashew](https://github.com/jameskokoska/Cashew/issues?q=sort%3Areactions-%2B1-desc),
  [Ivy-Apps/ivy-wallet](https://github.com/Ivy-Apps/ivy-wallet/issues?q=sort%3Areactions-%2B1-desc),
  [lyskouski/app-finance](https://github.com/lyskouski/app-finance/issues)
