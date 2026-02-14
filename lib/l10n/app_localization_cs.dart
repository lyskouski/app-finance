// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Czech (`cs`).
class AppLocalizationsCs extends AppLocalizations {
  AppLocalizationsCs([String locale = 'cs']) : super(locale);

  @override
  String get a =>
      'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => 'O stránkách';

  @override
  String get account => 'Účet';

  @override
  String get accountFrom => 'Z účtu';

  @override
  String get accountHeadline => 'Účty';

  @override
  String get accountTo => 'Na účet';

  @override
  String get accountTooltip => 'Otevřené účty';

  @override
  String get accountType => 'Typ účtu';

  @override
  String get accountTypeTooltip => 'Vyberte typ účtu';

  @override
  String get acknowledgeTooltip => 'Potvrdit';

  @override
  String get activate => 'Aktivovat';

  @override
  String get actualData => 'Historické údaje';

  @override
  String get addAccountTooltip => 'Přidat účet';

  @override
  String get addBudgetTooltip => 'Přidat novou rozpočtovou kategorii';

  @override
  String get addGoalTooltip => 'Přidat nový cíl';

  @override
  String get addMainTooltip => 'Přidat účet , příjem nebo převod';

  @override
  String afterNDays(Object value) {
    return 'po $value dnech';
  }

  @override
  String get amountFrom => 'Částka od';

  @override
  String get amountTo => 'Částka do';

  @override
  String appBuild(Object build) {
    return 'Sestavit: $build';
  }

  @override
  String get appInitHeadline => 'Inicializace projektu';

  @override
  String get appStartHeadline => 'Počáteční nastavení';

  @override
  String get appTitle => 'Fingrom';

  @override
  String appVersion(Object version) {
    return 'Verze: $version';
  }

  @override
  String get automationHeadline => 'Automatizace';

  @override
  String get automationTypeDays => 'po několika dnech';

  @override
  String get backTooltip => 'Vrátit zpět';

  @override
  String get balance => 'Aktuální zůstatek';

  @override
  String get balanceDate => 'Datum aktualizace zůstatku';

  @override
  String get balanceDateTooltip =>
      'Výnosy a příjmy před tímto datem zůstatek neovlivní.';

  @override
  String get balanceTooltip => 'Nastavení zůstatku';

  @override
  String get bankAccount => 'Bankovní účet';

  @override
  String get bill => 'Účet';

  @override
  String get billHeadline => 'Účty';

  @override
  String get billSetTooltip => 'Nastavit částku';

  @override
  String billSum(Object value) {
    return 'Účty: $value';
  }

  @override
  String get billTooltip => 'Otevřené účty';

  @override
  String get billTypeTooltip => '[Typ] Účet, příjem nebo převod';

  @override
  String get brightnessTheme => 'Téma jasu';

  @override
  String get btnAdd => 'Přidat';

  @override
  String get btnCancel => 'Zrušit';

  @override
  String get btnConfirm => 'Potvrdit';

  @override
  String get btnMore => 'Více na';

  @override
  String get budget => 'Kategorie rozpočtu';

  @override
  String get budgetHeadline => 'Rozpočty';

  @override
  String get budgetLimit => 'Limit na měsíc';

  @override
  String get budgetLimitHeadline => 'Úpravy limitu';

  @override
  String get budgetRelativeLimit => 'Relativní koeficient na měsíc';

  @override
  String get budgetTooltip => 'Otevřené typy rozpočtů';

  @override
  String get budgetType => 'Interval sestavování rozpočtu';

  @override
  String get budgetTypeAsIs => 'Neomezený';

  @override
  String get budgetTypeFixed => 'Pevný';

  @override
  String get budgetTypeMonth => 'měsíční';

  @override
  String get budgetTypeRelative => 'Relativní';

  @override
  String get budgetTypeWeek => 'týdenní';

  @override
  String get budgetTypeYear => 'roční';

  @override
  String get cash => 'Hotovost';

  @override
  String get chartBarRace => 'Sloupcový závod pro kategorie';

  @override
  String get chartForecast => 'Předpovědní graf';

  @override
  String get chartOHLC => 'Svíčkový graf (OHLC)';

  @override
  String get chartYtdExpense => 'YTD výdaje';

  @override
  String get clear => 'Hodnota poklesu';

  @override
  String get closeTooltip => 'Zavřít';

  @override
  String get closedAt => 'Dokončeno do data';

  @override
  String get cmpChart => 'Diagramy';

  @override
  String get cmpRecent => 'Poslední položky';

  @override
  String get cmpRecentCount => 'Velikost seznamu';

  @override
  String get coAuthor => 'author';

  @override
  String get coConsult => 'poradce';

  @override
  String get coDeveloper => 'vývojář';

  @override
  String get coNew => 'Připojte se k';

  @override
  String get coPromoter => 'promotér';

  @override
  String get coTranslator => 'překladatel';

  @override
  String get coef => 'coef.';

  @override
  String get collapse => 'Sbalit (obnovit) sekci';

  @override
  String get color => 'Barva';

  @override
  String get colorApp => 'Vlastní';

  @override
  String get colorBackground => 'Pozadí';

  @override
  String get colorDark => 'Tmavé';

  @override
  String get colorInversePrimary => 'Inverzní primární';

  @override
  String get colorInverseSurface => 'Inverzní povrch';

  @override
  String get colorLight => 'Světlý';

  @override
  String get colorOnInverseSurface => 'Na inverzním povrchu';

  @override
  String get colorOnSecondary => 'Na sekundárním';

  @override
  String get colorOnSecondaryContainer => 'Na kontejneru';

  @override
  String get colorPrimary => 'Primární';

  @override
  String get colorRestore => 'Obnovit paletu';

  @override
  String get colorSecondary => 'Sekundární';

  @override
  String get colorSystem => 'Výchozí';

  @override
  String get colorTheme => 'Palette';

  @override
  String get colorTooltip => 'Výběr barvy';

  @override
  String get colorType => 'Typ barvy';

  @override
  String get colorUser => 'Osobní';

  @override
  String columnMap(Object value) {
    return 'Mapování pro sloupec \'$value\'';
  }

  @override
  String columnMapTooltip(Object value) {
    return '\'$value\' - Výběr mapování sloupce';
  }

  @override
  String get completeGoalTooltip => 'Dokončit cíl';

  @override
  String get confirmHeader => 'Potvrzení akce';

  @override
  String get confirmTooltip => 'Jste si jisti? Tuto akci nelze vzít zpět.';

  @override
  String get contributors => 'Přispěvatelé';

  @override
  String get conversion => 'Konverze';

  @override
  String conversionMessage(Object currency) {
    return 'Převzato v $currency';
  }

  @override
  String get copiedToClipboard => 'Zkopírováno do schránky';

  @override
  String get createAccountHeader => 'Vytvořit nový účet';

  @override
  String get createAccountTooltip => 'Vytvořit nový účet';

  @override
  String get createBillHeader => 'Vytvořit novou transakci';

  @override
  String get createBillTooltip => 'Přidat nový účet';

  @override
  String get createBudgetHeader => 'Nová rozpočtová kategorie';

  @override
  String get createBudgetTooltip => 'Vytvořit novou rozpočtovou kategorii';

  @override
  String get createGoalHeader => 'Vytvořit cíl';

  @override
  String get createGoalTooltip => 'Přidat nový cíl';

  @override
  String get createIncomeTooltip => 'Přidat nový příjem';

  @override
  String get createPaymentTooltip => 'Přidat novou platbu';

  @override
  String get createTransferTooltip => 'Vytvořit převod';

  @override
  String get credit => 'Credit';

  @override
  String get creditCard => 'Kreditní karta';

  @override
  String get currency => 'Měna';

  @override
  String get currencyAddHeadline => 'Výměna měny';

  @override
  String get currencyAddTooltip => 'Přidat kurz měny';

  @override
  String get currencyDefault => 'Výchozí měna';

  @override
  String get currencyDistribution => 'Distribuce';

  @override
  String currencyExchange(Object from, Object to) {
    return 'Směna měn: $from -> $to';
  }

  @override
  String get currencyHeadline => 'Měny';

  @override
  String currencyIn(Object value) {
    return 'V $value';
  }

  @override
  String get currencyShort => 'Měna';

  @override
  String get currencyTooltip => 'Typ měny (kód)';

  @override
  String get currencyUpdateTooltip => 'Aktualizovat kurz měn';

  @override
  String get currentDate => 'Ukazatel aktuálního data';

  @override
  String get customAddTooltip => 'Přidat widget';

  @override
  String get customDeleteTooltip => 'Odstranění přizpůsobení';

  @override
  String get customSaveTooltip => 'Uložit přizpůsobení';

  @override
  String get customizeTooltip => 'Přizpůsobení stránky';

  @override
  String get darkMode => 'Tmavé';

  @override
  String get dateFormat => 'Formát data';

  @override
  String get dateRange => 'Rozsah dat';

  @override
  String get dateTooltip => 'Výběr data';

  @override
  String get dayMonday => 'Pondělí';

  @override
  String get dayStartOfMonth => 'Začátek měsíce';

  @override
  String get dayStartOfWeek => 'Začátek týdne';

  @override
  String get daySunday => 'Neděle';

  @override
  String get debitCard => 'Debetní karta';

  @override
  String def(Object value) {
    return 'Výchozí hodnota pro \'$value\'';
  }

  @override
  String get deleteAccountTooltip => 'Deaktivovat účet';

  @override
  String get deleteBillTooltip => 'Smazat účet';

  @override
  String get deleteBudgetTooltip => 'Deaktivovat rozpočtovou kategorii';

  @override
  String get deleteGoalTooltip => 'Odstranit cíl';

  @override
  String get deleteInvoiceTooltip => 'Smazat fakturu';

  @override
  String get deletePaymentTooltip => 'Smazat platbu';

  @override
  String get deleteTooltip => 'Smazat';

  @override
  String get deleteTransferTooltip => 'Smazat převod';

  @override
  String get deposit => 'Vklad';

  @override
  String get description => 'Popis';

  @override
  String get descriptionTooltip => 'Nastavit podrobnosti o výdajích';

  @override
  String get design => 'Režim návrhu (specifický pro kulturu)';

  @override
  String get designAsiaGeneral => 'Asie Obecné';

  @override
  String get designGermany => 'Německo';

  @override
  String get designGlobal => 'Globální';

  @override
  String get designRtlGeneral => 'Písmo zprava doleva';

  @override
  String get details => 'Podrobnosti';

  @override
  String get detailsTooltip => '****2345 - poslední 4 číslice čísla';

  @override
  String get dtAm => 'am';

  @override
  String get dtAmPm => 'hodina v am/pm (0~11)';

  @override
  String get dtDay => 'den v měsíci';

  @override
  String get dtEscape => 'escape pro text';

  @override
  String get dtHalfHour => 'hodina v dopoledních/odpoledních hodinách (1~12)';

  @override
  String get dtHour => 'hodina v den (0~23)';

  @override
  String get dtMinute => 'minuta v hodině';

  @override
  String get dtMonth => 'měsíc v roce';

  @override
  String get dtNamedDay => 'den v týdnu';

  @override
  String get dtPm => 'pm';

  @override
  String get dtQuote => 'jednoduchá uvozovka';

  @override
  String get dtSecond => 'sekunda v minutě';

  @override
  String get dtYear => 'year';

  @override
  String get editAccountHeader => 'Aktualizovat účet';

  @override
  String get editAccountTooltip => 'Upravit účet';

  @override
  String get editBillHeader => 'Aktualizovat účet';

  @override
  String get editBillTooltip => 'Upravit účet';

  @override
  String get editBudgetHeader => 'Aktualizovat kategorii rozpočtu';

  @override
  String get editBudgetTooltip => 'Upravit kategorii rozpočtu';

  @override
  String get editGoalHeader => 'Aktualizovat cíl';

  @override
  String get editGoalTooltip => 'Upravit cíl';

  @override
  String get editInvoiceTooltip => 'Upravit fakturu';

  @override
  String get editPaymentTooltip => 'Upravit platbu';

  @override
  String get editTooltip => 'Upravit';

  @override
  String get editTransferTooltip => 'Upravit převod';

  @override
  String get encryptionMode => 'Šifrování dat';

  @override
  String error(Object value) {
    return 'Chyba: $value';
  }

  @override
  String get errorExpired => 'Platnost karty vypršela';

  @override
  String get errorNegative => 'Nemůže být záporná! Prosím, opravte chybu';

  @override
  String get example => 'Příklad:';

  @override
  String get expand => 'Rozbalit oddíl';

  @override
  String get expense => 'Výše výdajů';

  @override
  String get expenseDateTime => 'Účtováno při';

  @override
  String get expenseHeadline => 'Výdaje';

  @override
  String get expenseTransfer => 'Částka převodu';

  @override
  String exportFile(Object value) {
    return 'Exportovat jako soubor .$value';
  }

  @override
  String get failData => 'Odečtená částka';

  @override
  String get flowTypeInvoice => 'Faktura';

  @override
  String get flowTypeTooltip => 'Typ částky: Účet, faktura';

  @override
  String get forecastData => 'Předpověď';

  @override
  String get from => 'z';

  @override
  String get goNextTooltip => 'Přejít na další';

  @override
  String get goalHeadline => 'Cíle';

  @override
  String goalProfit(Object value) {
    return 'Cíle Cíl: $value';
  }

  @override
  String get goalProfitTooltip => 'Zisk vs Cílová hodnota cílů';

  @override
  String get goalTooltip => 'Otevřené cíle';

  @override
  String get hasEncrypted => 'Jednou nastavené nelze změnit';

  @override
  String get helpTooltip => '[Nápověda] Zobrazit popis této stránky';

  @override
  String get homeHeadline => 'Úvodní stránka';

  @override
  String get homeTooltip => 'Zpět na hlavní stránku';

  @override
  String get icon => 'Ikonka';

  @override
  String get iconTooltip => 'Vybrat ikonu';

  @override
  String get ignoreTooltip => 'Ignorovat';

  @override
  String get importHeadline => 'Import / export';

  @override
  String get income => 'Výše příjmu';

  @override
  String get incomeHeadline => 'Příjem';

  @override
  String get incomeHealth => 'Radar stavu příjmů';

  @override
  String get incomeTooltip => 'Nastavení podrobností o příjmech';

  @override
  String get invoiceHeadline => 'Faktury';

  @override
  String invoiceSum(Object value) {
    return 'Faktury: $value';
  }

  @override
  String get isCleaned => 'Odstranit existující údaje';

  @override
  String get isCreated => 'Již vytvořeno, postupujte podle dalších kroků!';

  @override
  String get isEncrypted => 'Soubor je zašifrovaný (ve výchozím nastavení)';

  @override
  String get isRequired => 'požadováno';

  @override
  String get language => 'Jazyk';

  @override
  String get left => 'vlevo';

  @override
  String get lightMode => 'Světlo';

  @override
  String get link => 'Jednotný vyhledávač zdrojů (URL)';

  @override
  String get meaning => 'Význam';

  @override
  String get metricsHeadline => 'Metriky';

  @override
  String get metricsTooltip => 'Metriky';

  @override
  String get milestones => 'Milníky';

  @override
  String get missingContent => 'Soubor nelze zpracovat (buď zrušen)';

  @override
  String get navigationTooltip => 'Otevřít hlavní nabídku';

  @override
  String netProfit(Object value) {
    return 'Zisk: $value';
  }

  @override
  String get noChartData =>
      'Chybí údaje (nebo jich není dostatek), aby se zobrazily';

  @override
  String get notifyHeadline => 'Parser oznámení';

  @override
  String get ok => 'OK';

  @override
  String get orderPin => 'Prioritní pořadí';

  @override
  String get orderUnpin => 'Zobecněné pořadí';

  @override
  String get outputFile => 'Místo určení souboru';

  @override
  String get parseFile => 'Parsování souboru';

  @override
  String get password => 'Heslo';

  @override
  String get path => 'Název souboru (k uložení nebo načtení z něj)';

  @override
  String get paymentType => 'Interval platby';

  @override
  String get paymentsHeadline => 'Opakující se platby';

  @override
  String get pearDisabled => '-- zakázáno --';

  @override
  String get pearLoading => 'Probíhá...';

  @override
  String get peerAccept => 'akceptovat';

  @override
  String get peerAction => 'Akce';

  @override
  String get peerClosed => 'ukončeno';

  @override
  String get peerConnect => 'Připojit zařízení';

  @override
  String get peerConnectBtn => 'připojit';

  @override
  String get peerDelete => 'odstranit';

  @override
  String get peerDevice => 'Připojená zařízení';

  @override
  String get peerId => 'Identifikátor vašeho zařízení pro připojení';

  @override
  String get peerOffline => 'offline';

  @override
  String get peerOnline => 'připojené';

  @override
  String get peerOtherId => 'Identifikátor zařízení pro připojení';

  @override
  String get peerPending => 'čeká na';

  @override
  String get peerPing => 'ping';

  @override
  String get peerSent => 'Data jsou přenášena do připojených zařízení';

  @override
  String get peerStatus => 'Stav';

  @override
  String get peerSync => 'Přenos dat';

  @override
  String pickFile(Object value) {
    return 'Vybrat soubor .$value';
  }

  @override
  String pongStatus(Object uuid) {
    return 'Přijatý požadavek z $uuid';
  }

  @override
  String get processIsFinished => 'Dokončeno!';

  @override
  String progress(Object value) {
    return 'Pokrok: $value%';
  }

  @override
  String get raiseData => 'Přidání částky';

  @override
  String get recoveryHeadline => 'Obnovení';

  @override
  String get recoveryTooltip => 'Obnovení z';

  @override
  String get releases => 'Uvolňuje';

  @override
  String get reset => 'resetovat';

  @override
  String get returnBack => 'Vrátit zpět';

  @override
  String get roadmap => 'Plán cesty';

  @override
  String get saveNotification => 'Změny uloženy!';

  @override
  String get saveSettingsTooltip => 'Uložit';

  @override
  String get saveTooltip => 'Uložit do';

  @override
  String search(Object value) {
    return 'Zobrazit podle vzoru \'$value\'';
  }

  @override
  String get searchTooltip => 'Vyhledávání';

  @override
  String get secureOtpCode => 'Jednorázové heslo';

  @override
  String get secureOtpCodeInvalid =>
      'Neplatné! Získejte nový kód a zadejte jej.';

  @override
  String get securePassword => 'Heslo (obnovovací fráze)';

  @override
  String get securePasswordEmpty => 'Heslo nesmí být prázdné!';

  @override
  String get securePasswordNotMatch => 'Hesla se neshodují!';

  @override
  String get securePasswordRepeat => 'Opakování hesla';

  @override
  String get securityHeadline => 'Bezpečnost';

  @override
  String get settingsBaseHeadline => 'Základy';

  @override
  String get settingsHeadline => 'Nastavení';

  @override
  String get settingsSaved => 'Nastavení uloženo!';

  @override
  String get skipFromTotals => 'Vyloučit ze součtů';

  @override
  String get skipTooltip => 'Vynechat krok(y)';

  @override
  String get spent => 'strávil';

  @override
  String get splitCancelTooltip => 'Zrušit rozdělení na měsíce';

  @override
  String get splitTooltip => 'Vyhlášení limitů za měsíc';

  @override
  String get subscription =>
      'Jelikož se jedná o projekt s otevřeným zdrojovým kódem, předplatné neodemkne žádné další funkce. Sloužilo by však jako investice do neustálého vývoje a zlepšování aplikace a k zachování její dostupnosti.';

  @override
  String get subscriptionCoffee => 'Koupit kávu';

  @override
  String get subscriptionDinner => 'Dopřejte si večeři';

  @override
  String get subscriptionDonorbox => 'Předplatné prostřednictvím Donorboxu';

  @override
  String get subscriptionGithub => 'Přihlásit se přes GitHub';

  @override
  String get subscriptionHeadline => 'Sponzorství';

  @override
  String get subscriptionInactive => 'Nákupní služba nedostupná';

  @override
  String get subscriptionPatreon => 'Přihlásit se přes Patreon';

  @override
  String get subscriptionPaypal => 'Koupit kávu (PayPal)';

  @override
  String get subscriptionTiny => 'Darujte minci pro štěstí';

  @override
  String get subscriptionTooltip => 'Podpořte (sponzorství)';

  @override
  String get success => 'Úspěšný';

  @override
  String get summary => 'Shrnutí';

  @override
  String get symbol => 'Symbol';

  @override
  String get syncHeadline => 'Synchronizační zařízení';

  @override
  String get systemMode => 'Systém';

  @override
  String get tapToOpen => 'Klepnutím otevřete';

  @override
  String get targetAmount => 'Cílová částka';

  @override
  String get termPrivacy => 'Zásady ochrany osobních údajů';

  @override
  String get termUse => 'Podmínky používání';

  @override
  String get title => 'Název';

  @override
  String get titleAccountTooltip => 'Zadejte identifikátor účtu';

  @override
  String get titleBudgetTooltip => 'Zadejte název rozpočtové kategorie';

  @override
  String get titleGoal => 'Cíl';

  @override
  String get titleGoalTooltip => 'Definujte popis cíle';

  @override
  String get to => 'na';

  @override
  String get total => 'celkem';

  @override
  String get transactionFile => 'Soubor protokolu transakcí Fingrom (.log)';

  @override
  String get transferHeadline => 'Přenos';

  @override
  String get transferTooltip => 'Nastavit podrobnosti o přenosu';

  @override
  String get transfersHeadline => 'Převody';

  @override
  String get typeButton => 'Tlačítko';

  @override
  String get updateAccountTooltip => 'Aktualizovat účet';

  @override
  String get updateBillTooltip => 'Aktualizovat účet';

  @override
  String get updateBudgetTooltip => 'Aktualizovat rozpočtovou kategorii';

  @override
  String get updateGoalTooltip => 'Aktualizovat cíl';

  @override
  String get updatePaymentTooltip => 'Aktualizovat platbu';

  @override
  String get username => 'Uživatelské jméno (účet)';

  @override
  String get uuid => 'Jedinečný identifikátor transakce';

  @override
  String get validTillDate => 'Platný termín';

  @override
  String get webDav => 'Webové distribuované autorizace a verzování (WebDav)';

  @override
  String get zoomState => 'Přiblížení / oddálení';
}
