// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Uzbek (`uz`).
class AppLocalizationsUz extends AppLocalizations {
  AppLocalizationsUz([String locale = 'uz']) : super(locale);

  @override
  String get a =>
      'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => 'Haqida';

  @override
  String get account => 'Hisob';

  @override
  String get accountFrom => 'Hisobdan';

  @override
  String get accountHeadline => 'Hisoblar';

  @override
  String get accountTo => 'Hisobga';

  @override
  String get accountTooltip => 'Hisoblarni ochish';

  @override
  String get accountType => 'Hisob turi';

  @override
  String get accountTypeTooltip => 'Hisob turini tanlang';

  @override
  String get acknowledgeTooltip => 'Tan olish';

  @override
  String get activate => 'Faollashtirish';

  @override
  String get actualData => 'Tarixiy ma\'lumotlar';

  @override
  String get addAccountTooltip => 'Hisob qo\'shish';

  @override
  String get addBudgetTooltip => 'Yangi byudjet toifasini qo\'shing';

  @override
  String get addGoalTooltip => 'Yangi maqsad qo\'shing';

  @override
  String get addMainTooltip =>
      'Hisob-kitob, daromad yoki pul o\'tkazmasini qo\'shing';

  @override
  String afterNDays(Object value) {
    return '$value kundan keyin';
  }

  @override
  String get akahuAppToken => 'App ID tokeni';

  @override
  String get akahuDescription =>
      'Akahu’ga ulangan Yangi Zelandiya banklarining qoldiqlari va tranzaksiyalarini o‘zingizning bepul shaxsiy ilovangiz orqali import qiling. Akahu banklardagi ma’lumotlarni o‘z jadvali bo‘yicha (har kuni) yangilaydi, shuning uchun so‘nggi tranzaksiyalar keyinroq paydo bo‘lishi mumkin. Kirish faqat o‘qish uchun: to‘lovlar amalga oshirilmaydi.';

  @override
  String get akahuHeadline => 'Akahu Personal App (Yangi Zelandiya)';

  @override
  String get akahuInactive =>
      'Akahu bu hisobga kirish huquqini yo‘qotdi: uni my.akahu.nz/connections sahifasida qayta ulang';

  @override
  String get akahuIncomplete =>
      'App ID tokeni va foydalanuvchi kirish tokenini to‘ldiring';

  @override
  String get akahuRefresh => 'Ma’lumotlarni yangilash';

  @override
  String get akahuRefreshed =>
      'Akahu’dan banklardan yangi ma’lumotlarni olish so‘raldi: bir necha daqiqadan so‘ng importni qayta urinib ko‘ring (soatiga ko‘pi bilan bir marta)';

  @override
  String get akahuSteps =>
      'Tokenlarni qanday olish mumkin:\n1. my.akahu.nz saytida ro‘yxatdan o‘ting va banklaringizni ulang\n2. «Developers» sahifasini oching, dasturchi shartlarini qabul qiling va ko‘p faktorli autentifikatsiyani sozlang\n3. App ID tokeni va foydalanuvchi kirish tokenini nusxalang\n4. Ularni quyiga joylang va «Ulanish» tugmasini bosing';

  @override
  String get akahuTokenTooltip =>
      'my.akahu.nz saytidagi «Developers» sahifasida ko‘rsatiladi; shifrlangan holda saqlanadi';

  @override
  String get akahuUserToken => 'Foydalanuvchi kirish tokeni';

  @override
  String get amountFrom => 'Miqdordan';

  @override
  String get amountTo => 'Miqdorga';

  @override
  String appBuild(Object build) {
    return 'Qurilish: $build';
  }

  @override
  String get appInitHeadline => 'Loyihani ishga tushirish';

  @override
  String get appStartHeadline => 'Dastlabki sozlash';

  @override
  String get appTitle => 'Fingrom';

  @override
  String appVersion(Object version) {
    return 'Versiya: $version';
  }

  @override
  String get automationHeadline => 'Avtomatlashtirish';

  @override
  String get automationTypeDays => 'bir necha kundan keyin';

  @override
  String get backTooltip => 'Orqaga qayt';

  @override
  String get balance => 'Haqiqiy balans';

  @override
  String get balanceDate => 'Balans sanasini yangilash';

  @override
  String get balanceDateTooltip =>
      'Ushbu sanadan oldingi natijalar va daromadlar balansga ta\'sir qilmaydi';

  @override
  String get balanceTooltip => 'Balansni o\'rnatish';

  @override
  String get bankAccount => 'Bank hisob raqami';

  @override
  String get bill => 'Bill';

  @override
  String get billHeadline => 'Hisob-kitoblar';

  @override
  String get billSetTooltip => 'Miqdorni belgilash';

  @override
  String billSum(Object value) {
    return 'Hisob-kitoblar: $value';
  }

  @override
  String get billTooltip => 'Hisob-kitoblarni ochish';

  @override
  String get billTypeTooltip => '[Tur] Bill, daromad yoki transfer';

  @override
  String get brightnessTheme => 'Yorqinlik mavzusi';

  @override
  String get btnAdd => 'Qo\'shish';

  @override
  String get btnCancel => 'Bekor qilish';

  @override
  String get btnConfirm => 'Tasdiqlang';

  @override
  String get btnMore => 'Ko\'proq';

  @override
  String get budget => 'Byudjet toifasi';

  @override
  String get budgetHeadline => 'Byudjetlar';

  @override
  String get budgetLimit => 'Oyiga cheklov';

  @override
  String get budgetLimitHeadline => 'Cheklovlarni sozlash';

  @override
  String get budgetPositive => 'Byudjet, Umumiy boshqaruvchi';

  @override
  String get budgetPositiveOff => 'Manfiy qiymatlarni e\'tiborsiz qoldirish';

  @override
  String get budgetPositiveOn => 'Manfiy qiymatlarni kiritish';

  @override
  String get budgetRelativeLimit => 'Oyiga nisbiy koeffitsient';

  @override
  String get budgetTooltip => 'Byudjet turlarini oching';

  @override
  String get budgetType => 'Byudjetlashtirish oralig\'i';

  @override
  String get budgetTypeAsIs => 'Cheksiz';

  @override
  String get budgetTypeFixed => 'Ruxsat etilgan';

  @override
  String get budgetTypeMonth => 'oylik';

  @override
  String get budgetTypeRelative => 'Qarindosh';

  @override
  String get budgetTypeWeek => 'haftalik';

  @override
  String get budgetTypeYear => 'yillik';

  @override
  String get cash => 'Naqd pul';

  @override
  String get chartBarRace => 'Kategoriyalar uchun bar poygasi';

  @override
  String get chartForecast => 'Prognozlar jadvali';

  @override
  String get chartOHLC => 'Shamdon (OHLC) diagrammasi';

  @override
  String get chartYtdExpense => 'YTD xarajatlari';

  @override
  String get clear => 'Chiqarish qiymati';

  @override
  String get closeTooltip => 'Yopish';

  @override
  String get closedAt => 'Sanagacha tugallangan';

  @override
  String get cmpChart => 'Diagrammalar';

  @override
  String get cmpRecent => 'Oxirgi elementlar';

  @override
  String get cmpRecentCount => 'Ro\'yxat hajmi';

  @override
  String get coAuthor => 'muallif';

  @override
  String get coConsult => 'maslahatchi';

  @override
  String get coDeveloper => 'dasturchi';

  @override
  String get coNew => 'Qo\'shilish';

  @override
  String get coPromoter => 'targ\'ibotchi';

  @override
  String get coTranslator => 'tarjimon';

  @override
  String get coef => 'koef.';

  @override
  String get collapse => 'Bo\'limni yig\'ish (tiklash).';

  @override
  String get color => 'Rang';

  @override
  String get colorApp => 'Maxsus';

  @override
  String get colorBackground => 'Background';

  @override
  String get colorDark => 'Qorong\'i';

  @override
  String get colorInversePrimary => 'Teskari birlamchi';

  @override
  String get colorInverseSurface => 'Teskari yuza';

  @override
  String get colorLight => 'Nur';

  @override
  String get colorOnInverseSurface => 'Teskari yuzada';

  @override
  String get colorOnSecondary => 'Ikkinchi darajali';

  @override
  String get colorOnSecondaryContainer => 'Konteynerda';

  @override
  String get colorPrimary => 'Asosiy';

  @override
  String get colorRestore => 'Palitrani tiklash';

  @override
  String get colorSecondary => 'Ikkilamchi';

  @override
  String get colorSystem => 'Standart';

  @override
  String get colorTheme => 'Palette';

  @override
  String get colorTooltip => 'Rangni tanlang';

  @override
  String get colorType => 'Rang turi';

  @override
  String get colorUser => 'Shaxsiy';

  @override
  String columnMap(Object value) {
    return '“$value” ustuni uchun xaritalash';
  }

  @override
  String columnMapTooltip(Object value) {
    return '\'$value\' - Ustun xaritasini tanlang';
  }

  @override
  String get completeGoalTooltip => 'To\'liq maqsad';

  @override
  String get confirmHeader => 'Amalni tasdiqlang';

  @override
  String get confirmTooltip =>
      'Ishonchingiz komilmi? Bu amalni ortga qaytarib bo‘lmaydi.';

  @override
  String get contributors => 'Himoyachilar';

  @override
  String get conversion => 'Konvertatsiya';

  @override
  String conversionMessage(Object currency) {
    return '$currency da olingan';
  }

  @override
  String get copiedToClipboard => 'Buferga nusxalandi';

  @override
  String get createAccountHeader => 'Yangi hisob yaratish';

  @override
  String get createAccountTooltip => 'Yangi hisob yaratish';

  @override
  String get createBillHeader => 'Yangi tranzaksiya yarating';

  @override
  String get createBillTooltip => 'Yangi Bill qo\'shing';

  @override
  String get createBudgetHeader => 'Yangi byudjet toifasi';

  @override
  String get createBudgetTooltip => 'Yangi byudjet toifasini yarating';

  @override
  String get createGoalHeader => 'Maqsad yaratish';

  @override
  String get createGoalTooltip => 'Yangi maqsad qo\'shing';

  @override
  String get createIncomeTooltip => 'Yangi daromad qo\'shing';

  @override
  String get createPaymentTooltip => 'Yangi toʻlovni qoʻshish';

  @override
  String get createTransferTooltip => 'Transfer yaratish';

  @override
  String get credit => 'Credit';

  @override
  String get creditCard => 'Kredit kartasi';

  @override
  String get currency => 'Valyuta';

  @override
  String get currencyAddHeadline => 'Valyuta ayirboshlash';

  @override
  String get currencyAddTooltip => 'Valyuta kursini qo\'shing';

  @override
  String get currencyDefault => 'Standart valyuta';

  @override
  String get currencyDistribution => 'Tarqatish';

  @override
  String currencyExchange(Object from, Object to) {
    return 'Valyuta almashinuvi: $from -> $to';
  }

  @override
  String get currencyHeadline => 'Valyutalar';

  @override
  String currencyIn(Object value) {
    return '$value ichida';
  }

  @override
  String get currencyShort => 'Curr.';

  @override
  String get currencyTooltip => 'Valyuta turi (kod)';

  @override
  String get currencyUpdateTooltip => 'Valyutalar kursini yangilash';

  @override
  String get currentDate => 'Joriy sana ko\'rsatkichi';

  @override
  String get customAddTooltip => 'Vidjet qo‘shish';

  @override
  String get customDeleteTooltip => 'Moslashtirishni oʻchirish';

  @override
  String get customSaveTooltip => 'Moslashtirishni saqlash';

  @override
  String get customizeTooltip => 'Sahifani moslashtirish';

  @override
  String get darkMode => 'Qorong\'i';

  @override
  String get dateFormat => 'Sana formati';

  @override
  String get dateRange => 'Sana oralig\'i';

  @override
  String get dateTooltip => 'Sana-ni tanlang';

  @override
  String get dayMonday => 'Dushanba';

  @override
  String get daySaturday => 'Shanba';

  @override
  String get dayStartOfMonth => 'Oyning boshlanishi';

  @override
  String get dayStartOfWeek => 'Hafta boshi';

  @override
  String get daySunday => 'Yakshanba';

  @override
  String get deactivateAction => 'Parol himoyasini o\'chirish';

  @override
  String get debitCard => 'Debit karta';

  @override
  String def(Object value) {
    return '“$value” uchun birlamchi qiymat';
  }

  @override
  String get deleteAccountTooltip => 'Hisobni o\'chirish';

  @override
  String get deleteBillTooltip => 'Billni o\'chirish';

  @override
  String get deleteBudgetTooltip => 'Byudjet toifasini o\'chirish';

  @override
  String get deleteGoalTooltip => 'Maqsadni o\'chirish';

  @override
  String get deleteInvoiceTooltip => 'Hisob-fakturani o\'chirish';

  @override
  String get deletePaymentTooltip => 'Toʻlovni oʻchirish';

  @override
  String get deleteTooltip => 'Oʻchirish';

  @override
  String get deleteTransferTooltip => 'Transferni o\'chirish';

  @override
  String get deposit => 'Depozit';

  @override
  String get description => 'Tavsif';

  @override
  String get descriptionTooltip => 'Xarajat tafsilotlarini o\'rnating';

  @override
  String get design => 'Dizayn rejimi (Madaniyatga xos)';

  @override
  String get designAsiaGeneral => 'Umumiy Osiyo';

  @override
  String get designGermany => 'Germaniya';

  @override
  String get designGlobal => 'Global';

  @override
  String get designRtlGeneral => 'O\'ngdan chapga harflar';

  @override
  String get details => 'Tafsilotlar';

  @override
  String get detailsTooltip => '****2345 - raqamning oxirgi 4 ta raqami';

  @override
  String get dtAm => 'am';

  @override
  String get dtAmPm => 'soat ertalab/kech (0~11)';

  @override
  String get dtDay => 'oyda kun';

  @override
  String get dtEscape => 'matn uchun qochish';

  @override
  String get dtHalfHour => 'soat ertalab/soat (1-12)';

  @override
  String get dtHour => 'kunduzi soat (0~23)';

  @override
  String get dtMinute => 'soatda daqiqa';

  @override
  String get dtMonth => 'yilning oyi';

  @override
  String get dtNamedDay => 'haftaning kuni';

  @override
  String get dtPm => 'pm';

  @override
  String get dtQuote => 'yagona tirnoq';

  @override
  String get dtSecond => 'daqiqada ikkinchi';

  @override
  String get dtYear => 'yil';

  @override
  String get editAccountHeader => 'Hisobni yangilash';

  @override
  String get editAccountTooltip => 'Hisobni tahrirlash';

  @override
  String get editBillHeader => 'Billni yangilash';

  @override
  String get editBillTooltip => 'Billni tahrirlash';

  @override
  String get editBudgetHeader => 'Byudjet toifasini yangilash';

  @override
  String get editBudgetTooltip => 'Byudjet toifasini tahrirlash';

  @override
  String get editGoalHeader => 'Maqsadni yangilash';

  @override
  String get editGoalTooltip => 'Maqsadni tahrirlash';

  @override
  String get editInvoiceTooltip => 'Hisob-fakturani tahrirlash';

  @override
  String get editPaymentTooltip => 'To\'lovni tahrirlash';

  @override
  String get editTooltip => 'Tahrirlash';

  @override
  String get editTransferTooltip => 'Transferni tahrirlash';

  @override
  String get enableBankingAppId => 'Ilova ID';

  @override
  String get enableBankingBank => 'Bank';

  @override
  String get enableBankingCode =>
      'Avtorizatsiyadan keyin ochilgan sahifa manzili';

  @override
  String get enableBankingCodeTooltip =>
      'Bankda kirishni tasdiqlang, so\'ng manzilni brauzerdan nusxalab, shu yerga joylashtiring';

  @override
  String get enableBankingCountry => 'Mamlakat (ISO kodi, masalan, DE)';

  @override
  String get enableBankingDescription =>
      'enablebanking.com saytida ro\'yxatdan o\'tgan o\'z ilovangiz bilan Enable Banking API (PSD2) orqali Yevropa banklarining qoldiqlari va tranzaksiyalarini import qiling. Kirish faqat o\'qish uchun: to\'lovlar amalga oshirilmaydi.';

  @override
  String get enableBankingHeadline => 'Enable Banking (EU)';

  @override
  String get enableBankingIncomplete =>
      'Ilova ID, maxfiy kalit, yo\'naltirish URL manzili va mamlakatni to\'ldiring';

  @override
  String get enableBankingKey => 'Maxfiy kalit (PEM)';

  @override
  String get enableBankingKeyInvalid =>
      'Noto\'g\'ri maxfiy kalit: \"PRIVATE KEY\" PEM bloki kutilmoqda';

  @override
  String get enableBankingKeyNotRsa =>
      'Noto\'g\'ri maxfiy kalit: RSA kaliti kutilmoqda';

  @override
  String get enableBankingKeyTooltip =>
      'Enable Banking Control Panel\'da ilova bilan birga yaratiladi; shifrlangan holda saqlanadi. Saqlangan kalitni qoldirish uchun bo\'sh qoldiring';

  @override
  String get enableBankingLoadBanks => 'Banklarni yuklash';

  @override
  String get enableBankingNoAuthPage =>
      'Enable Banking avtorizatsiya sahifasini qaytarmadi';

  @override
  String get enableBankingNoCode => 'Manzilda avtorizatsiya kodi topilmadi';

  @override
  String get enableBankingRedirect => 'Yo\'naltirish URL manzili';

  @override
  String get enableBankingRedirectTooltip =>
      'Ilova uchun ro\'yxatdan o\'tkazilgan; avtorizatsiyadan so\'ng bank unga qaytaradi';

  @override
  String get enableBankingStateMismatch =>
      'Manzil boshqa avtorizatsiyaga tegishli, qayta ulaning';

  @override
  String get encryptionMode => 'Ma\'lumotlarni shifrlash';

  @override
  String error(Object value) {
    return 'Xato: $value';
  }

  @override
  String get errorExpired => 'Karta muddati tugagan';

  @override
  String get errorNegative =>
      'Salbiy bo\'lishi mumkin emas! Iltimos, xatoni tuzating';

  @override
  String get example => 'Misol';

  @override
  String get expand => 'Bo\'limni kengaytirish';

  @override
  String get expense => 'Xarajatlar miqdori';

  @override
  String get expenseDateTime => 'Hisoblangan';

  @override
  String get expenseHeadline => 'Xarajat';

  @override
  String get expenseTransfer => 'Transfer summasi';

  @override
  String exportFile(Object value) {
    return '.$value fayl sifatida eksport qiling';
  }

  @override
  String get failData => 'Chegirma miqdori';

  @override
  String get finTsApproved => 'Bank ilovasida tasdiqlandi';

  @override
  String get finTsBankCode => 'Bank kodi (BLZ)';

  @override
  String get finTsCustomerId => 'Mijoz ID (foydalanuvchi ID dan farq qilsa)';

  @override
  String get finTsDescription =>
      'FinTS 4.1 (PIN/TAN) ni qo\'llab-quvvatlaydigan banklardan qoldiqlar va tranzaksiyalarni import qiling. Kirish faqat o\'qish uchun: to\'lovlar amalga oshirilmaydi.';

  @override
  String get finTsHeadline => 'Financial Transaction Services (FinTS 4.1)';

  @override
  String get finTsIncomplete =>
      'Server URL, bank kodi, foydalanuvchi ID va mahsulot ro\'yxatdan o\'tish raqamini to\'ldiring';

  @override
  String finTsLoginChanged(Object value) {
    return 'Bank kirish ma\'lumotlarini o\'zgartirdi, foydalanuvchi yoki mijoz ID ni yangilang: $value';
  }

  @override
  String finTsLoginRefused(Object value) {
    return 'Bank oldingi kirishni rad etdi: $value. Kiritilgan PIN bilan qayta urinib ko\'rilsinmi?';
  }

  @override
  String get finTsPin => 'PIN';

  @override
  String get finTsPinHint =>
      'Faqat shu seans uchun ishlatiladi va hech qachon saqlanmaydi';

  @override
  String get finTsProductId => 'Mahsulot ro\'yxatdan o\'tish raqami';

  @override
  String get finTsProductIdTooltip =>
      'Deutsche Kreditwirtschaft tomonidan ilova ishlab chiqaruvchisiga beriladi';

  @override
  String get finTsTan => 'TAN';

  @override
  String get finTsTanHeadline => 'Tranzaksiyani tasdiqlash (TAN)';

  @override
  String get finTsTanMedium => 'TAN vositasini tanlang';

  @override
  String get finTsTanMethod => 'TAN usulini tanlang';

  @override
  String get finTsUrl => 'Bankning FinTS server URL manzili';

  @override
  String get finTsUserId => 'Foydalanuvchi ID (login)';

  @override
  String get finTsVersion => 'Protokol versiyasi';

  @override
  String get finTsWebUnsupported =>
      'Bank serverlari brauzerdan kirishga ruxsat bermaydi. Kompyuter yoki mobil ilovadan foydalaning.';

  @override
  String get flowTypeInvoice => 'Hisob-faktura';

  @override
  String get flowTypeTooltip => 'Miqdor turi: hisob-faktura, hisob-faktura';

  @override
  String get forecastData => 'Prognoz';

  @override
  String get from => 'dan';

  @override
  String get goNextTooltip => 'Keyingiga o\'tish';

  @override
  String get goalHeadline => 'Maqsadlar';

  @override
  String goalProfit(Object value) {
    return 'Maqsadlar: $value';
  }

  @override
  String get goalProfitTooltip => 'Foyda va Maqsadlar';

  @override
  String get goalTooltip => 'Ochiq maqsadlar';

  @override
  String get hasEncrypted =>
      'Bir marta o\'rnatilsa, uni o\'zgartirib bo\'lmaydi';

  @override
  String get helpTooltip => '[Yordam] Sahifaning tavsifini ko\'rsatish';

  @override
  String get homeHeadline => 'Uy';

  @override
  String get homeTooltip => 'Bosh sahifaga qaytish';

  @override
  String get hour => 'Soat';

  @override
  String get icon => 'Belgi';

  @override
  String get iconTooltip => 'Belgini tanlang';

  @override
  String get ignoreTooltip => 'E\'tibor bermaslik';

  @override
  String get importHeadline => 'Import / eksport';

  @override
  String get income => 'Daromad miqdori';

  @override
  String get incomeHeadline => 'Daromad';

  @override
  String get incomeHealth => 'Sog\'lik daromadlari radari';

  @override
  String get incomeTooltip => 'Daromad tafsilotlarini o\'rnating';

  @override
  String get integrationAccessDenied =>
      'Kirish bekor qilingan yoki hisob ma\'lumotlari noto\'g\'ri';

  @override
  String get integrationConnect => 'Ulanish';

  @override
  String get integrationDateFrom =>
      'Tranzaksiyalarni shu sanadan import qilish';

  @override
  String get integrationDefaultBudgetCategory => 'Standart byudjet toifasi';

  @override
  String get integrationDisconnect => 'Uzish';

  @override
  String get integrationForget => 'Kirishni unutish';

  @override
  String get integrationHeadline => 'Integratsiyalar';

  @override
  String integrationHttpError(Object value) {
    return 'Xizmat xato bilan javob berdi (HTTP $value)';
  }

  @override
  String get integrationHttpsRequired =>
      'Faqat xavfsiz (HTTPS) manzillarga ruxsat beriladi';

  @override
  String get integrationImport => 'Tranzaksiyalarni import qilish';

  @override
  String integrationImported(Object added, Object pending, Object skipped) {
    return 'Import qilindi: $added, allaqachon mavjudligi sababli o\'tkazib yuborildi: $skipped, kutilmoqda (import qilinmadi): $pending';
  }

  @override
  String integrationInvalidAmount(Object value) {
    return 'Noto\'g\'ri summa: $value';
  }

  @override
  String get integrationNoAccounts => 'Bank hech qanday hisob taqdim etmadi';

  @override
  String get integrationPaymentRequired =>
      'Xizmat kirish uchun to\'lov talab qiladi';

  @override
  String get integrationSelectTarget =>
      'Import uchun hisob va byudjet toifasini tanlang';

  @override
  String integrationServiceError(Object value) {
    return 'Xizmat xabari: $value';
  }

  @override
  String get integrationUnexpectedResponse => 'Xizmatdan kutilmagan javob';

  @override
  String get investecApiKey => 'API kaliti';

  @override
  String get investecClientId => 'Mijoz ID';

  @override
  String get investecCredentialsTooltip =>
      'Investec Online’da Investec Developer → API keys bo‘limida yaratiladi; shifrlangan holda saqlanadi';

  @override
  String get investecDescription =>
      'O‘z API kalitlaringiz bilan Programmable Banking API orqali Investec Private Banking hisoblarining (Janubiy Afrika) qoldiqlari va tranzaksiyalarini import qiling. Kirish faqat o‘qish uchun: to‘lovlar amalga oshirilmaydi.';

  @override
  String get investecHeadline =>
      'Investec Programmable Banking (Janubiy Afrika)';

  @override
  String get investecIncomplete =>
      'Mijoz ID, maxfiy kod va API kalitini to‘ldiring';

  @override
  String get investecSandbox => 'Sandbox (test ma’lumotlari)';

  @override
  String get investecSecret => 'Maxfiy kod';

  @override
  String get investecSteps =>
      'API kalitlarini qanday olish mumkin:\n1. Investec Online’ga kiring va Investec Developer’da (Programmable Banking) ro‘yxatdan o‘ting\n2. API keys bo‘limini oching va hisoblar hamda tranzaksiyalarga kirish huquqiga ega kalit yarating\n3. Ikki bosqichli tasdiqlash bilan tasdiqlang va mijoz ID, maxfiy kod va API kalitini nusxalang\n4. Ularni quyiga joylang va «Ulanish» tugmasini bosing';

  @override
  String get invoiceHeadline => 'Hisob-fakturalar';

  @override
  String invoiceSum(Object value) {
    return 'Hisob-fakturalar: $value';
  }

  @override
  String get isCleaned => 'Mavjud ma\'lumotlarni olib tashlang';

  @override
  String get isCreated =>
      'Allaqachon yaratilgan, keyingi bosqichlarni bajaring!';

  @override
  String get isEncrypted => 'Fayl shifrlangan (sukut bo\'yicha)';

  @override
  String get isRequired => 'talab qilinadi';

  @override
  String get language => 'Til';

  @override
  String get left => 'chap';

  @override
  String get lightMode => 'Nur';

  @override
  String get link => 'Yagona Resurs Locator (URL)';

  @override
  String get managerHeadline => 'Menejer';

  @override
  String get meaning => 'Ma\'nosi';

  @override
  String get metricsHeadline => 'Ko\'rsatkichlar';

  @override
  String get metricsTooltip => 'Ko\'rsatkichlar';

  @override
  String get milestones => 'Marosimlar';

  @override
  String get minute => 'Daqiqa';

  @override
  String get missingContent =>
      'Faylni qayta ishlash mumkin emas (yoki bekor qilinadi)';

  @override
  String get monobankCreateAccount => 'Hisob yaratish';

  @override
  String get monobankDescription =>
      'Shaxsiy token yordamida monobank kartalari va jamg‘arma bankalarining qoldiqlari va operatsiyalarini import qilish. monobank daqiqasiga bitta so‘rovga ruxsat beradi: uzoq davrni import qilish bir necha daqiqa davom etadi. Faqat o‘qish uchun ruxsat: to‘lovlar amalga oshirilmaydi.';

  @override
  String get monobankHeadline => 'monobank Personal API (Ukraina)';

  @override
  String get monobankJar => 'Jamg‘arma banka';

  @override
  String monobankProgress(Object done, Object total) {
    return 'Ko‘chirmalar so‘ralmoqda: $done / $total';
  }

  @override
  String monobankRateLimit(Object value) {
    return 'monobank daqiqasiga bitta so‘rovga ruxsat beradi: keyingisi $value s dan keyin';
  }

  @override
  String get monobankToken => 'Shaxsiy token';

  @override
  String get monobankTokenSteps =>
      'Shaxsiy tokenni qanday olish mumkin:\n1. Brauzerda api.monobank.ua ni oching\n2. QR kodni monobank ilovasi bilan skanerlang va ruxsatni tasdiqlang\n3. Tokenni sahifadan nusxalang\n4. Uni pastga joylashtiring va \"Ulanish\" tugmasini bosing\n5. Har bir karta yoki jamg‘arma bankani hisobga bog‘lang (yoki hisob yarating) va import qiling';

  @override
  String get monobankTokenTooltip =>
      'monobank ilovasida QR kod skanerlangandan so‘ng api.monobank.ua da beriladi; shifrlangan holda saqlanadi';

  @override
  String get monzoApprove =>
      'Monzo ilovasida kirishni tasdiqlang, so‘ng yana «Ulanish» tugmasini bosing';

  @override
  String get monzoClientId => 'Mijoz ID';

  @override
  String get monzoClientSecret => 'Mijoz maxfiy kodi';

  @override
  String get monzoClientSecretTooltip =>
      'developers.monzo.com saytida OAuth mijozi uchun ko‘rsatiladi; shifrlangan holda saqlanadi. Saqlangan maxfiy kodni qoldirish uchun bo‘sh qoldiring';

  @override
  String get monzoCode => 'Kirishdan keyin ochilgan sahifa manzili';

  @override
  String get monzoCodeTooltip =>
      'Agar Fingrom avtomatik ochilmagan bo‘lsa, manzilni brauzerdan nusxalab, shu yerga joylashtiring';

  @override
  String get monzoDescription =>
      'developers.monzo.com saytida ro‘yxatdan o‘tkazilgan o‘z OAuth mijozingiz orqali Monzo hisoblarining qoldiqlari va tranzaksiyalarini import qiling (faqat shaxsiy foydalanish uchun). Kirish faqat o‘qish uchun: to‘lovlar amalga oshirilmaydi.';

  @override
  String get monzoExpired => 'Monzo’ga kirish muddati tugadi: qayta ulaning';

  @override
  String monzoFullHistory(Object value) {
    return 'To‘liq tarix $value gacha mavjud: oldinroq sanani tanlang va hozir import qiling. Keyin Monzo faqat oxirgi 90 kunni taqdim etadi';
  }

  @override
  String get monzoHeadline => 'Monzo Developer API (Buyuk Britaniya)';

  @override
  String monzoHistoryLimited(Object value) {
    return 'Monzo faqat oxirgi 90 kunni taqdim etadi: tranzaksiyalar $value dan boshlab import qilinadi';
  }

  @override
  String get monzoIncomplete =>
      'Mijoz ID, mijoz maxfiy kodi va yo‘naltirish URL manzilini to‘ldiring';

  @override
  String get monzoRedirect => 'Yo\'naltirish URL manzili';

  @override
  String get monzoRedirectTooltip =>
      'OAuth mijozi uchun aynan shu manzilni belgilang; kirishdan so‘ng Monzo unga qaytaradi';

  @override
  String get monzoSteps =>
      'Qanday ulanish mumkin:\n1. Monzo hisobingiz elektron pochtasi bilan developers.monzo.com saytiga kiring\n2. Clients → New OAuth Client bo‘limini oching, «Confidential»ni tanlang va quyida ko‘rsatilgan yo‘naltirish URL manzilini belgilang\n3. Mijoz ID va mijoz maxfiy kodini nusxalang, quyiga joylang va «Ulanish» tugmasini bosing\n4. Elektron pochta orqali yuborilgan havolani oching, Monzo ilovasida kirishni tasdiqlang va yana «Ulanish» tugmasini bosing\n5. Darhol import qiling: to‘liq tarix tasdiqlashdan keyin faqat 5 daqiqa davomida mavjud, keyin faqat oxirgi 90 kun';

  @override
  String get navigationTooltip => 'Asosiy menyuni oching';

  @override
  String netProfit(Object value) {
    return 'Foyda: $value';
  }

  @override
  String get noChartData =>
      'Koʻrsatish uchun maʼlumotlar yetishmayapti (yoki yetarli emas).';

  @override
  String get notificationAccessSettings => 'Bildirishnomalarga ruxsat';

  @override
  String get notificationAccessSteps =>
      'Ruxsatni qanday berish mumkin:\n1. Tizim sozlamalarini ochish uchun \"Ruxsat berish\" tugmasini bosing\n2. Fingrom\'ga bildirishnomalarni o\'qishga ruxsat bering\n3. Agar Android cheklangan sozlama haqida xabar bersa: Fingrom ilova haqida → ⋮ → \"Cheklangan sozlamalarga ruxsat berish\" ni oching va qayta urinib ko\'ring\n4. Fingrom\'ga qayting va bildirishnomalari o\'qiladigan ilovalarni tanlang';

  @override
  String get notificationAccounts => 'Hisob kalit so\'zlari';

  @override
  String get notificationAccountsTooltip =>
      'Bildirishnomada hisobni aniqlaydigan so\'zlar (kartaning oxirgi raqamlari, hamyon nomi): so\'z kiriting va qo\'shish uchun Enter tugmasini bosing. Aks holda ilovaning standart hisobi ishlatiladi';

  @override
  String get notificationApps => 'Bildirishnomalari o\'qiladigan ilovalar';

  @override
  String notificationAutoImported(Object value) {
    return 'Bildirishnomalardan qo\'shildi: $value';
  }

  @override
  String get notificationAutoTooltip =>
      'Aniqlangan bildirishnomalar tasdiqsiz qo\'shiladi: Fingrom ishlayotganda darhol, aks holda keyingi ishga tushirishda. Aniqlanmaganlari tekshiruvni kutadi';

  @override
  String get notificationBalance => 'Balans kalit so\'zlari';

  @override
  String get notificationBalanceTooltip =>
      'E\'tiborga olinmaydigan summa (balans, limit) oldidan keladigan so\'zlar: so\'z kiriting va qo\'shish uchun Enter tugmasini bosing';

  @override
  String notificationCaptured(Object value) {
    return 'Olingan bildirishnomalar: $value';
  }

  @override
  String get notificationClear => 'Olinganlarni tozalash';

  @override
  String get notificationCurrencyTooltip =>
      'Valyutasiz summalar (masalan, Yechildi 20.00) shu valyutada olinadi';

  @override
  String get notificationDefaultAccount => 'Standart hisob';

  @override
  String get notificationDescription =>
      'Ushbu qurilmadagi bank va to\'lov ilovalarining bildirishnomalaridan tranzaksiyalar yarating. Faqat tanlangan ilovalarning bildirishnomalari o\'qiladi va import qilinguncha qurilmada saqlanadi. Summa va valyuta avtomatik ravishda aniqlanadi.';

  @override
  String get notificationGrant => 'Ruxsat berish';

  @override
  String get notificationIncome => 'Daromad kalit so\'zlari';

  @override
  String get notificationIncomeTooltip =>
      'Bildirishnomani daromad sifatida belgilovchi so\'zlar: so\'z kiriting va qo\'shish uchun Enter tugmasini bosing';

  @override
  String get notificationMerchant => 'Sotuvchi belgilari';

  @override
  String get notificationMerchantTooltip =>
      'Ortidan ikki nuqta va sotuvchi keladigan so\'zlar (Joy: Do\'kon): so\'z yozing va qo\'shish uchun Enter tugmasini bosing';

  @override
  String get notificationNoApps =>
      'Hali bildirishnomalar olinmagan: ilovalar bildirishnoma yuborgandan keyin shu yerda paydo bo\'ladi';

  @override
  String get notificationUnparsed => 'Aniqlanmadi';

  @override
  String get notifyHeadline => 'Bildirishnomalarni tahlil qilish';

  @override
  String get ok => 'xop';

  @override
  String get orderPin => 'Ustuvor buyurtma';

  @override
  String get orderUnpin => 'Umumiy tartib';

  @override
  String get outputFile => 'Fayl uchun maqsad';

  @override
  String get parseFile => 'Faylni tahlil qilish';

  @override
  String get password => 'Parol';

  @override
  String get path => 'Fayl nomi (saqlash yoki undan yuklash uchun)';

  @override
  String get paymentType => 'To\'lov oralig\'i';

  @override
  String get paymentsHeadline => 'Takroriy to\'lovlar';

  @override
  String get pearDisabled => '-- nogiron --';

  @override
  String get pearLoading => 'Jarayonda...';

  @override
  String get peerAccept => 'qabul qilish';

  @override
  String get peerAction => 'Harakat';

  @override
  String get peerClosed => 'tugatildi';

  @override
  String get peerConnect => 'Qurilmani ulash';

  @override
  String get peerConnectBtn => 'ulanmoq';

  @override
  String get peerDelete => 'o\'chirish';

  @override
  String get peerDevice => 'Ulangan qurilmalar';

  @override
  String get peerId => 'Ulanish uchun qurilmangiz identifikatori';

  @override
  String get peerOffline => 'oflayn';

  @override
  String get peerOnline => 'ulangan';

  @override
  String get peerOtherId => 'Ulanish uchun qurilma identifikatori';

  @override
  String get peerPending => 'kutilmoqda';

  @override
  String get peerPing => 'ping';

  @override
  String get peerSent => 'Ma\'lumotlar ulangan qurilmalarga uzatiladi';

  @override
  String get peerStatus => 'Holat';

  @override
  String get peerSync => 'Ma\'lumotlarni uzatish';

  @override
  String pickFile(Object value) {
    return '.$value-faylni tanlang';
  }

  @override
  String pongStatus(Object uuid) {
    return '$uuid tomonidan soʻrov olindi';
  }

  @override
  String get privatBankAdd => 'Hisob qo\'shish';

  @override
  String get privatBankDescription =>
      'Privat24 for Business biznes hisoblari (yakka tartibdagi tadbirkorlar va kompaniyalar) qoldiqlari va tranzaksiyalarini Autoclient tokeni orqali import qilish. Shaxsiy hisoblar API tomonidan qo\'llab-quvvatlanmaydi. Kirish faqat o\'qish uchun: to\'lovlar amalga oshirilmaydi.';

  @override
  String get privatBankHeadline => 'PrivatBank Autoclient (Ukraina)';

  @override
  String get privatBankIban => 'Hisob IBAN raqami';

  @override
  String get privatBankIbanInvalid =>
      'Ukraina IBAN raqamini kiriting: UA va 27 ta raqam';

  @override
  String get privatBankIbanTooltip =>
      'API hisoblar ro\'yxatini bermaydi: hisoblarning IBAN raqamlarini birma-bir qo\'shing';

  @override
  String privatBankNotReady(Object value) {
    return 'PrivatBank ko\'chirmalarni tayyorlamoqda (bosqich $value): bir necha daqiqadan so\'ng qayta urinib ko\'ring';
  }

  @override
  String get privatBankRemove => 'Hisobni o\'chirish';

  @override
  String get privatBankToken => 'Autoclient tokeni';

  @override
  String get privatBankTokenSteps =>
      'Autoclient tokenini qanday olish mumkin:\n1. Privat24 for Business tizimiga kiring\n2. Integratsiya (Autoclient) bo\'limini oching\n3. Uni faollashtiring va tokenni nusxalang\n4. Uni quyiga joylashtiring va \"Ulanish\" tugmasini bosing\n5. Import qilinadigan hisoblarning IBAN raqamlarini qo\'shing';

  @override
  String get privatBankTokenTooltip =>
      'Privat24 for Business\'da Integratsiya (Autoclient) bo\'limida beriladi; shifrlangan holda saqlanadi';

  @override
  String get processIsFinished => 'Tugallandi!';

  @override
  String progress(Object value) {
    return 'Rivojlanish: $value%';
  }

  @override
  String get raiseData => 'Qo\'shimcha miqdor';

  @override
  String get recoveryHeadline => 'Qayta tiklash';

  @override
  String get recoveryTooltip => 'Qayta tiklash';

  @override
  String get releases => 'Relizlar';

  @override
  String get reset => 'qayta o\'rnatish';

  @override
  String get returnBack => 'Orqaga qaytish';

  @override
  String get roadmap => 'Yo\'l xaritasi';

  @override
  String get saveNotification => 'O\'zgarishlar saqlandi!';

  @override
  String get saveSettingsTooltip => 'Saqlash';

  @override
  String get saveTooltip => 'Saqlash';

  @override
  String search(Object value) {
    return '“$value” namunasi boʻyicha koʻrsatish';
  }

  @override
  String get searchTooltip => 'Qidiruv';

  @override
  String get secureBioNotMatch =>
      'Autentifikatsiya muvaffaqiyatsiz! Iltimos, qayta urinib ko\'ring';

  @override
  String get secureBioPromptReason =>
      'Iltimos, davom etish uchun autentifikatsiya qiling';

  @override
  String get secureBioPromptTitle => 'Biometrik autentifikatsiya';

  @override
  String get secureOtpCode => 'Bir martalik parol kodi';

  @override
  String get secureOtpCodeInvalid =>
      'Noto\'g\'ri! Iltimos, yangi kod oling va uni kiriting';

  @override
  String get secureOtpDeactivated => 'Parol himoyasi o\'chirilgan';

  @override
  String get securePassword => 'Parol (Qayta tiklash iborasi)';

  @override
  String get securePasswordEmpty => 'Parol bo\'sh bo\'la olmaydi!';

  @override
  String get securePasswordNotMatch => 'Parollar mos kelmaydi!';

  @override
  String get securePasswordRepeat => 'Parolni takrorlash';

  @override
  String get securityHeadline => 'Xavfsizlik';

  @override
  String get settingsBaseHeadline => 'Asoslar';

  @override
  String get settingsHeadline => 'Sozlamalar';

  @override
  String get settingsSaved => 'Sozlamalar saqlandi!';

  @override
  String get simpleFinDescription =>
      'AQSh banklari va karta emitentlarining qoldiqlari va tranzaksiyalarini SimpleFIN Bridge orqali import qiling. Kirish faqat o\'qish uchun: to\'lovlar amalga oshirilmaydi.';

  @override
  String get simpleFinHeadline => 'SimpleFIN Bridge (US)';

  @override
  String get simpleFinNoCredentials =>
      'SimpleFIN Bridge hisob ma\'lumotlarisiz kirish manzilini qaytardi';

  @override
  String get simpleFinToken => 'SimpleFIN sozlash tokeni';

  @override
  String get simpleFinTokenClaimed =>
      'Sozlash tokeni mavjud emas yoki allaqachon ishlatilgan';

  @override
  String get simpleFinTokenInvalid => 'Noto\'g\'ri SimpleFIN sozlash tokeni';

  @override
  String get simpleFinTokenTooltip =>
      'Ushbu ilova uchun SimpleFIN Bridge\'da (masalan, bridge.simplefin.org) yaratiladi; faqat bir marta ishlatilishi mumkin';

  @override
  String get skipFromTotals => 'Jami hisobdan chiqarib tashlang';

  @override
  String get skipTooltip => 'Qadam(lar)ni o‘tkazib yuborish';

  @override
  String get sortTooltip => 'Elementlarni saralash';

  @override
  String get sortingAmountAsc => 'Summa bo\'yicha o\'sib boradi';

  @override
  String get sortingAmountDesc => 'Summa bo\'yicha pasayiborak';

  @override
  String get sortingCreatedAtAsc => 'Yaratilgan sana bo\'yicha o\'sib boradi';

  @override
  String get sortingCreatedAtDesc => 'Yaratilgan sana bo\'yicha pasayiborak';

  @override
  String get sortingTitleAsc => 'Sarlavha bo\'yicha o\'sib boradi';

  @override
  String get sortingTitleDesc => 'Sarlavha bo\'yicha pasayiborak';

  @override
  String get sortingUpdatedAtAsc => 'Yangilangan sana bo\'yicha o\'sib boradi';

  @override
  String get sortingUpdatedAtDesc => 'Yangilangan sana bo\'yicha pasayiborak';

  @override
  String get spent => 'sarflangan';

  @override
  String get splitCancelTooltip => 'Oyiga Splitni bekor qilish';

  @override
  String get splitHeadline => 'Hisobni bo\'lish';

  @override
  String get splitTooltip => 'Oyiga limitlarni e\'lon qiling';

  @override
  String get starlingDescription =>
      'Bepul dasturchi hisobingizning shaxsiy kirish tokeni orqali Starling Bank hisoblarining qoldiqlari va tranzaksiyalarini import qiling. Kirish faqat o‘qish uchun: to‘lovlar amalga oshirilmaydi.';

  @override
  String get starlingHeadline =>
      'Starling Bank Personal Access (Buyuk Britaniya)';

  @override
  String get starlingScopes =>
      'Tokenda ruxsat yetishmaydi: uni \"account:read\", \"balance:read\" va \"transaction:read\" ruxsat doiralari bilan yarating';

  @override
  String get starlingToken => 'Shaxsiy kirish tokeni';

  @override
  String get starlingTokenSteps =>
      'Shaxsiy kirish tokenini qanday olish mumkin:\n1. developer.starlingbank.com saytida ro‘yxatdan o‘ting (bepul)\n2. Personal Access bo‘limini oching, Starling hisobingizni qo‘shing va uni Starling ilovasida tasdiqlang\n3. \"account:read\", \"balance:read\" va \"transaction:read\" ruxsat doiralari bilan token yarating\n4. Uni quyiga joylang va «Ulanish» tugmasini bosing';

  @override
  String get starlingTokenTooltip =>
      'developer.starlingbank.com saytida Personal Access bo‘limida yaratiladi; shifrlangan holda saqlanadi';

  @override
  String get subscription =>
      'Ochiq manbali loyiha sifatida obuna bo‘lish qo‘shimcha funksiyalarni ochmaydi. Biroq, bu ilovaning uzluksiz rivojlanishi va takomillashtirilishiga va uning mavjudligini saqlab qolishga investitsiya sifatida xizmat qiladi.';

  @override
  String get subscriptionCoffee => 'Kofe sotib oling';

  @override
  String get subscriptionDinner => 'Kechki ovqat uchun';

  @override
  String get subscriptionDonorbox => 'Donorbox orqali obuna bo\'ling';

  @override
  String get subscriptionGithub => 'GitHub orqali obuna bo\'ling';

  @override
  String get subscriptionHeadline => 'Homiylik';

  @override
  String get subscriptionInactive => 'Sotib olish xizmati mavjud emas';

  @override
  String get subscriptionPatreon => 'Patreon orqali obuna bo\'ling';

  @override
  String get subscriptionPaypal => 'Qahva sotib oling (PayPal)';

  @override
  String get subscriptionTiny => 'Baxtli tanga bering';

  @override
  String get subscriptionTooltip => 'Yordam (homiylik)';

  @override
  String get success => 'Muvaffaqiyatli';

  @override
  String get summary => 'Xulosa';

  @override
  String get symbol => 'Belgi';

  @override
  String get syncHeadline => 'Qurilmalarni sinxronlash';

  @override
  String get systemMode => 'Tizim';

  @override
  String get tapToOpen => 'Ochish uchun bosing';

  @override
  String get targetAmount => 'Maqsadli miqdor';

  @override
  String get tellerAccessToken => 'Kirish tokeni';

  @override
  String get tellerAccessTokenTooltip =>
      'Bank ulangandan so\'ng ulanish sahifasida ko\'rsatiladi: agar Fingrom avtomatik ochilmagan bo\'lsa, uni shu yerga joylashtiring';

  @override
  String get tellerAppId => 'Ilova ID';

  @override
  String get tellerAppIdTooltip =>
      'Teller Dashboard\'da ko\'rsatiladi, \"app_\" bilan boshlanadi';

  @override
  String get tellerCertificate => 'Sertifikat (PEM)';

  @override
  String get tellerCertificateInvalid =>
      'Noto\'g\'ri sertifikat: \"CERTIFICATE\" PEM bloki kutilmoqda';

  @override
  String get tellerCertificateTooltip =>
      'Teller Dashboard\'da beriladi (Certificates); shifrlangan holda saqlanadi. Saqlangan sertifikatni qoldirish uchun bo\'sh qoldiring';

  @override
  String get tellerConnectBank => 'Bankni ulash';

  @override
  String get tellerConnectPage => 'Ulanish sahifasi';

  @override
  String get tellerConnectPageTooltip =>
      'Teller Connect\'ni brauzerda ochadi va kirish tokenini Fingrom\'ga qaytaradi';

  @override
  String get tellerDescription =>
      'AQSh banklari va karta emitentlarining qoldiqlari va tranzaksiyalarini teller.io\'da ro\'yxatdan o\'tkazilgan o\'z ilovangiz bilan Teller orqali import qiling (bepul tarif 100 ta haqiqiy bank ulanishiga ruxsat beradi). Kirish faqat o\'qish uchun: to\'lovlar amalga oshirilmaydi.';

  @override
  String get tellerDisconnected =>
      'Bank ulanishi e\'tiboringizni talab qiladi (masalan, qayta kirish yoki tasdiqlash kodi): bankni qayta ulang';

  @override
  String get tellerEnvironment => 'Muhit';

  @override
  String get tellerHeadline => 'Teller (US)';

  @override
  String get tellerIncomplete =>
      'Ilova ID ni to\'ldiring; haqiqiy bank ma\'lumotlari uchun sertifikat va maxfiy kalit talab qilinadi';

  @override
  String get tellerKey => 'Maxfiy kalit (PEM)';

  @override
  String get tellerKeyInvalid =>
      'Noto\'g\'ri maxfiy kalit: \"PRIVATE KEY\" PEM bloki kutilmoqda';

  @override
  String get tellerKeyTooltip =>
      'Sertifikat bilan birga yuklab olinadi; shifrlangan holda saqlanadi. Saqlangan kalitni qoldirish uchun bo\'sh qoldiring';

  @override
  String get tellerMissingCertificate =>
      'Teller so\'rovni mijoz sertifikatisiz rad etdi: sertifikat va maxfiy kalitni yuklang yoki sandbox ni tanlang';

  @override
  String get tellerSteps =>
      'Qanday ulanish mumkin:\n1. teller.io saytida ro\'yxatdan o\'ting va Teller Dashboard\'ni oching\n2. Ilova ID ni nusxalang, so\'ng maxfiy kaliti bilan sertifikat yarating va yuklab oling (Certificates)\n3. Ularni quyida to\'ldiring va muhitni tanlang (sandbox: test ma\'lumotlari, bankka \"username\" va \"password\" bilan kiring)\n4. «Bankni ulash» tugmasini bosing va ochilgan sahifada bankingizga kiring\n5. Hisob va byudjet toifasini tanlang, so\'ng «Tranzaksiyalarni import qilish» tugmasini bosing';

  @override
  String get tellerUpload => 'Faylni yuklash';

  @override
  String get termPrivacy => 'Maxfiylik siyosati';

  @override
  String get termUse => 'Foydalanish shartlari';

  @override
  String get title => 'Sarlavha';

  @override
  String get titleAccountTooltip => 'Hisob identifikatorini kiriting';

  @override
  String get titleBudgetTooltip => 'Byudjet toifasi nomini kiriting';

  @override
  String get titleGoal => 'Maqsad';

  @override
  String get titleGoalTooltip => 'Maqsad tavsifini aniqlang';

  @override
  String get to => 'uchun';

  @override
  String get total => 'jami';

  @override
  String get transactionFile => 'Fingrom tranzaksiyalari jurnali fayli (.log)';

  @override
  String get transferHeadline => 'Transfer';

  @override
  String get transferTooltip => 'Transfer ma\'lumotlarini o\'rnating';

  @override
  String get transfersHeadline => 'Transferlar';

  @override
  String get typeButton => 'Tugma';

  @override
  String get upDescription =>
      'Shaxsiy kirish tokeni orqali Up xarajat va jamg‘arma hisoblarining qoldiqlari va tranzaksiyalarini import qiling. Bog‘langan Up hisoblari orasidagi o‘tkazmalar (Round Ups ham) o‘tkazma sifatida import qilinadi. Kirish faqat o‘qish uchun: to‘lovlar amalga oshirilmaydi.';

  @override
  String get upHeadline => 'Up Banking API (Avstraliya)';

  @override
  String get upToken => 'Shaxsiy kirish tokeni';

  @override
  String get upTokenSteps =>
      'Shaxsiy kirish tokenini qanday olish mumkin:\n1. Up ilovasini oching va Data sharing → Personal Access Token bo‘limiga o‘ting (yoki api.up.com.au saytiga kiring)\n2. Token yarating va uni nusxalang (u \"up:yeah:\" bilan boshlanadi); yangi token avvalgisini almashtiradi\n3. Uni quyiga joylang va «Ulanish» tugmasini bosing\n4. Ular orasidagi o‘tkazmalar o‘tkazma sifatida import qilinishi uchun barcha Up hisoblarini (jamg‘arma hisoblari ham) bog‘lang';

  @override
  String get upTokenTooltip =>
      'Up ilovasida yoki api.up.com.au saytida yaratiladi; shifrlangan holda saqlanadi. Faqat eng so‘nggi token amal qiladi';

  @override
  String get updateAccountTooltip => 'Hisobni yangilash';

  @override
  String get updateBillTooltip => 'Billni yangilash';

  @override
  String get updateBudgetTooltip => 'Byudjet toifasini yangilash';

  @override
  String get updateGoalTooltip => 'Maqsadni yangilash';

  @override
  String get updatePaymentTooltip => 'To\'lovni yangilash';

  @override
  String get username => 'Foydalanuvchi nomi (hisob qaydnomasi)';

  @override
  String get uuid => 'Tranzaksiyaning noyob identifikatori';

  @override
  String get validTillDate => 'Qachon amal qiladi';

  @override
  String get webDav =>
      'Internetda tarqatilgan mualliflik va versiyalarni yaratish (WebDav)';

  @override
  String get wiseDescription =>
      'Shaxsiy API tokeni orqali Wise ko‘p valyutali hisoblarining qoldiqlari va tranzaksiyalarini import qiling. Bog‘langan balanslar orasidagi konvertatsiyalar o‘tkazma sifatida import qilinadi. Kirish faqat o‘qish uchun: to‘lovlar amalga oshirilmaydi.';

  @override
  String get wiseHeadline => 'Wise API (Global)';

  @override
  String get wiseNoProfiles => 'Token uchun mavjud Wise profillari yo‘q';

  @override
  String get wiseProfile => 'Profil';

  @override
  String get wiseScaRequired =>
      'Wise mijozni kuchli autentifikatsiya qilishni talab qiladi: ushbu balans ko‘chirmasini Wise ilovasida oching va qayta urinib ko‘ring';

  @override
  String get wiseToken => 'Shaxsiy API tokeni';

  @override
  String get wiseTokenSteps =>
      'Shaxsiy API tokenini qanday olish mumkin:\n1. Brauzerda wise.com saytiga kiring (mobil ilovada token yaratib bo‘lmaydi)\n2. Sozlamalar → Integratsiyalar va vositalar → API tokenlari bo‘limini oching\n3. «Yangi token qo‘shish»ni tanlang, nom bering (masalan, Fingrom) va «Faqat o‘qish» ruxsatini tanlang\n4. Ikki bosqichli tasdiqlash bilan tasdiqlang va tokenni nusxalang\n5. Uni quyiga joylang va «Ulanish» tugmasini bosing';

  @override
  String get wiseTokenTooltip =>
      'Wise’da Sozlamalar → API tokenlari bo‘limida yaratiladi (imkon bo‘lsa, faqat o‘qish uchun); shifrlangan holda saqlanadi';

  @override
  String get zoomState => 'Kattalashtirish / Kichraytirish';
}
