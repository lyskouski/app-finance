// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Romanian Moldavian Moldovan (`ro`).
class AppLocalizationsRo extends AppLocalizations {
  AppLocalizationsRo([String locale = 'ro']) : super(locale);

  @override
  String get a =>
      'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => 'Despre';

  @override
  String get account => 'Cont';

  @override
  String get accountFrom => 'De la cont';

  @override
  String get accountHeadline => 'Conturi';

  @override
  String get accountTo => 'La cont';

  @override
  String get accountTooltip => 'Conturi deschise';

  @override
  String get accountType => 'Tip cont';

  @override
  String get accountTypeTooltip => 'Alegeți tipul de cont';

  @override
  String get acknowledgeTooltip => 'Acknowledge';

  @override
  String get activate => 'Activați';

  @override
  String get actualData => 'Date istorice';

  @override
  String get addAccountTooltip => 'Adăugați cont';

  @override
  String get addBudgetTooltip => 'Adăugați o nouă categorie bugetară';

  @override
  String get addGoalTooltip => 'Adăugați un nou obiectiv';

  @override
  String get addMainTooltip => 'Adaugă factură , venit sau transfer';

  @override
  String afterNDays(Object value) {
    return 'după $value zile';
  }

  @override
  String appBuild(Object build) {
    return 'Construiește: $build';
  }

  @override
  String get appInitHeadline => 'Inițializare proiect';

  @override
  String get appStartHeadline => 'Configurare inițială';

  @override
  String get appTitle => 'Fingrom';

  @override
  String appVersion(Object version) {
    return 'Versiune: $version';
  }

  @override
  String get automationHeadline => 'Automatizare';

  @override
  String get automationTypeDays => 'după câteva zile';

  @override
  String get backTooltip => 'Revenire înapoi';

  @override
  String get balance => 'Sold real';

  @override
  String get balanceDate => 'Data actualizării soldului';

  @override
  String get balanceDateTooltip =>
      'Rezultatele și veniturile anterioare acestei date nu vor afecta soldul';

  @override
  String get balanceTooltip => 'Setați soldul';

  @override
  String get bankAccount => 'Cont bancar';

  @override
  String get bill => 'Factură';

  @override
  String get billHeadline => 'Facturi';

  @override
  String get billSetTooltip => 'Setați suma';

  @override
  String billSum(Object value) {
    return 'Facturi: $value';
  }

  @override
  String get billTooltip => 'Facturi deschise';

  @override
  String get billTypeTooltip => '[Tip] Factură, Venit sau Transfer';

  @override
  String get brightnessTheme => 'Tema Luminozitate';

  @override
  String get btnAdd => 'Adaugă';

  @override
  String get btnCancel => 'Anulare';

  @override
  String get btnConfirm => 'Confirmare';

  @override
  String get btnMore => 'Mai multe';

  @override
  String get budget => 'Categoria Buget';

  @override
  String get budgetHeadline => 'Buget';

  @override
  String get budgetLimit => 'Limita pe lună';

  @override
  String get budgetLimitHeadline => 'Ajustări ale limitei';

  @override
  String get budgetRelativeLimit => 'Coeficient relativ pe lună';

  @override
  String get budgetTooltip => 'Tipuri de bugete deschise';

  @override
  String get budgetType => 'Interval de bugetare';

  @override
  String get budgetTypeAsIs => 'Nelimitat';

  @override
  String get budgetTypeFixed => 'Fix';

  @override
  String get budgetTypeMonth => 'lunar';

  @override
  String get budgetTypeRelative => 'Relative';

  @override
  String get budgetTypeWeek => 'săptămânal';

  @override
  String get budgetTypeYear => 'yearly';

  @override
  String get cash => 'Numerar';

  @override
  String get chartBarRace => 'Bar Race pentru categorii';

  @override
  String get chartForecast => 'Diagrama de prognoză';

  @override
  String get chartOHLC => 'Diagrama lumânărilor (OHLC)';

  @override
  String get chartYtdExpense => 'Cheltuieli YTD';

  @override
  String get clear => 'Drop Valoare';

  @override
  String get closeTooltip => 'Închidere';

  @override
  String get closedAt => 'Terminat până la Data';

  @override
  String get cmpChart => 'Diagrame';

  @override
  String get cmpRecent => 'Elemente recente';

  @override
  String get cmpRecentCount => 'Dimensiune listă';

  @override
  String get coAuthor => 'author';

  @override
  String get coConsult => 'consilier';

  @override
  String get coDeveloper => 'dezvoltator';

  @override
  String get coNew => 'Participă';

  @override
  String get coPromoter => 'promoter';

  @override
  String get coTranslator => 'traducător';

  @override
  String get coef => 'coef.';

  @override
  String get collapse => 'Reducerea (restaurarea) secțiunii';

  @override
  String get color => 'Culoare';

  @override
  String get colorApp => 'Personalizat';

  @override
  String get colorBackground => 'Fundal';

  @override
  String get colorDark => 'Întunecat';

  @override
  String get colorInversePrimary => 'Inverse primar';

  @override
  String get colorInverseSurface => 'Suprafață inversă';

  @override
  String get colorLight => 'Luminoasă';

  @override
  String get colorOnInverseSurface => 'Pe suprafața inversă';

  @override
  String get colorOnSecondary => 'Pe secundar';

  @override
  String get colorOnSecondaryContainer => 'Pe recipient';

  @override
  String get colorPrimary => 'Primar';

  @override
  String get colorRestore => 'Resetarea paletei';

  @override
  String get colorSecondary => 'Secundară';

  @override
  String get colorSystem => 'Implicit';

  @override
  String get colorTheme => 'Paletă';

  @override
  String get colorTooltip => 'Selectați o culoare';

  @override
  String get colorType => 'Tip culoare';

  @override
  String get colorUser => 'Personal';

  @override
  String columnMap(Object value) {
    return 'Mapare pentru coloana \'$value\'';
  }

  @override
  String columnMapTooltip(Object value) {
    return '\'$value\' - Alegeți maparea coloanei';
  }

  @override
  String get completeGoalTooltip => 'Finalizați obiectivul';

  @override
  String get confirmHeader => 'Confirmați acțiunea';

  @override
  String get confirmTooltip =>
      'Sunteți sigur? Această acțiune nu poate fi anulată.';

  @override
  String get contributors => 'Contributori';

  @override
  String get conversion => 'Conversie';

  @override
  String conversionMessage(Object currency) {
    return 'Încasat în $currency';
  }

  @override
  String get createAccountHeader => 'Creați un cont nou';

  @override
  String get createAccountTooltip => 'Crearea unui cont nou';

  @override
  String get createBillHeader => 'Crearea unei noi tranzacții';

  @override
  String get createBillTooltip => 'Adăugare factură nouă';

  @override
  String get createBudgetHeader => 'Categorie bugetară nouă';

  @override
  String get createBudgetTooltip => 'Crearea unei noi categorii de buget';

  @override
  String get createGoalHeader => 'Creare obiectiv';

  @override
  String get createGoalTooltip => 'Adăugați un nou obiectiv';

  @override
  String get createIncomeTooltip => 'Adăugați un nou venit';

  @override
  String get createPaymentTooltip => 'Adaugă o nouă plată';

  @override
  String get createTransferTooltip => 'Creare transfer';

  @override
  String get credit => 'Credit';

  @override
  String get creditCard => 'Card de credit';

  @override
  String get currency => 'Monedă';

  @override
  String get currencyAddHeadline => 'Schimb valutar';

  @override
  String get currencyAddTooltip => 'Adăugați rata de schimb valutar';

  @override
  String get currencyDefault => 'Valută implicită';

  @override
  String get currencyDistribution => 'Distribuție';

  @override
  String currencyExchange(Object from, Object to) {
    return 'Schimb valutar: $from -> $to';
  }

  @override
  String get currencyHeadline => 'Currencies';

  @override
  String currencyIn(Object value) {
    return 'În $value';
  }

  @override
  String get currencyShort => 'Curr.';

  @override
  String get currencyTooltip => 'Tipul de monedă (Cod)';

  @override
  String get currencyUpdateTooltip => 'Actualizarea ratei valutei';

  @override
  String get currentDate => 'Data curentă Pointer';

  @override
  String get customAddTooltip => 'Adăugați Widget';

  @override
  String get customDeleteTooltip => 'Ștergeți personalizarea';

  @override
  String get customSaveTooltip => 'Salvare personalizare';

  @override
  String get customizeTooltip => 'Personalizați pagina';

  @override
  String get darkMode => 'Întuneric';

  @override
  String get dateFormat => 'Format dată';

  @override
  String get dateTooltip => 'Selectați data';

  @override
  String get dayMonday => 'Luni';

  @override
  String get dayStartOfMonth => 'Începutul lunii';

  @override
  String get dayStartOfWeek => 'Începutul săptămânii';

  @override
  String get daySunday => 'Duminică';

  @override
  String get debitCard => 'Card de debit';

  @override
  String def(Object value) {
    return 'Valoare implicită pentru \'$value\'';
  }

  @override
  String get deleteAccountTooltip => 'Dezactivare cont';

  @override
  String get deleteBillTooltip => 'Ștergere factură';

  @override
  String get deleteBudgetTooltip => 'Dezactivare categorie bugetară';

  @override
  String get deleteGoalTooltip => 'Ștergere obiectiv';

  @override
  String get deleteInvoiceTooltip => 'Ștergere factură';

  @override
  String get deletePaymentTooltip => 'Ștergere plată';

  @override
  String get deleteTooltip => 'Ștergere';

  @override
  String get deleteTransferTooltip => 'Ștergere Transfer';

  @override
  String get deposit => 'Deposit';

  @override
  String get description => 'Descriere';

  @override
  String get descriptionTooltip => 'Setare detalii cheltuieli';

  @override
  String get design => 'Mod de proiectare (specific culturii)';

  @override
  String get designAsiaGeneral => 'Asia General';

  @override
  String get designGermany => 'Germany';

  @override
  String get designGlobal => 'Global';

  @override
  String get designRtlGeneral => 'Scriere de la dreapta la stânga';

  @override
  String get details => 'Detalii';

  @override
  String get detailsTooltip => '****2345 - ultimele 4 cifre ale numărului';

  @override
  String get dtAm => 'am';

  @override
  String get dtAmPm => 'ora în am/pm (0~11)';

  @override
  String get dtDay => 'ziua în lună';

  @override
  String get dtEscape => 'scăpare pentru text';

  @override
  String get dtHalfHour => 'ora în am/pm (1~12)';

  @override
  String get dtHour => 'ora în zi (0~23)';

  @override
  String get dtMinute => 'minut în oră';

  @override
  String get dtMonth => 'luna în an';

  @override
  String get dtNamedDay => 'ziua săptămânii';

  @override
  String get dtPm => 'pm';

  @override
  String get dtQuote => 'citat simplu';

  @override
  String get dtSecond => 'secundă în minut';

  @override
  String get dtYear => 'year';

  @override
  String get editAccountHeader => 'Actualizare cont';

  @override
  String get editAccountTooltip => 'Editare cont';

  @override
  String get editBillHeader => 'Actualizare factură';

  @override
  String get editBillTooltip => 'Editare factură';

  @override
  String get editBudgetHeader => 'Actualizare categorie buget';

  @override
  String get editBudgetTooltip => 'Editare categorie buget';

  @override
  String get editGoalHeader => 'Actualizare obiectiv';

  @override
  String get editGoalTooltip => 'Editare obiectiv';

  @override
  String get editInvoiceTooltip => 'Edit Invoice';

  @override
  String get editPaymentTooltip => 'Editare plată';

  @override
  String get editTooltip => 'Edit';

  @override
  String get editTransferTooltip => 'Editare transfer';

  @override
  String get encryptionMode => 'Criptarea datelor';

  @override
  String error(Object value) {
    return 'Eroare: $value';
  }

  @override
  String get errorExpired => 'Card expirat';

  @override
  String get errorNegative =>
      'Nu poate fi negativ! Vă rugăm, corectați eroarea';

  @override
  String get example => 'Exemplu';

  @override
  String get expand => 'Extindeți secțiunea';

  @override
  String get expense => 'Valoarea cheltuielilor';

  @override
  String get expenseDateTime => 'Facturate la';

  @override
  String get expenseHeadline => 'Cheltuieli';

  @override
  String get expenseTransfer => 'Suma transferului';

  @override
  String exportFile(Object value) {
    return 'Export ca .$value-file';
  }

  @override
  String get failData => 'Suma dedusă';

  @override
  String get flowTypeInvoice => 'Factură';

  @override
  String get flowTypeTooltip => 'Tip sumă: Factură, factură';

  @override
  String get forecastData => 'Prognoză';

  @override
  String get from => 'de la';

  @override
  String get goNextTooltip => 'Următorul';

  @override
  String get goalHeadline => 'Obiective';

  @override
  String goalProfit(Object value) {
    return 'Ținta obiectivelor: $value';
  }

  @override
  String get goalProfitTooltip => 'Profit vs Obiectivele țintă';

  @override
  String get goalTooltip => 'Obiective deschise';

  @override
  String get hasEncrypted => 'Odată stabilite, nu pot fi modificate';

  @override
  String get helpTooltip => '[Ajutor] Afișează descrierea paginii respective';

  @override
  String get homeHeadline => 'Acasă';

  @override
  String get homeTooltip => 'Înapoi la pagina principală';

  @override
  String get icon => 'Pictogramă';

  @override
  String get iconTooltip => 'Selectați pictograma';

  @override
  String get ignoreTooltip => 'Ignorați';

  @override
  String get importHeadline => 'Import / Export';

  @override
  String get income => 'Valoarea venitului';

  @override
  String get incomeHeadline => 'Venit';

  @override
  String get incomeHealth => 'Radar sănătate venit';

  @override
  String get incomeTooltip => 'Setați detaliile privind venitul';

  @override
  String get invoiceHeadline => 'Facturi';

  @override
  String invoiceSum(Object value) {
    return 'Facturi: $value';
  }

  @override
  String get isCleaned => 'Eliminarea datelor existente';

  @override
  String get isCreated => 'Deja create, urmați pașii următori!';

  @override
  String get isEncrypted => 'Fișierul este criptat (implicit)';

  @override
  String get isRequired => 'necesar';

  @override
  String get language => 'Limba';

  @override
  String get left => 'stânga';

  @override
  String get lightMode => 'Lumină';

  @override
  String get link => 'Localizator uniform de resurse (URL)';

  @override
  String get meaning => 'Înțeles';

  @override
  String get metricsHeadline => 'Metrică';

  @override
  String get metricsTooltip => 'Măsurători';

  @override
  String get milestones => 'Etape';

  @override
  String get missingContent => 'Fișierul nu poate fi procesat (fie anulat)';

  @override
  String get navigationTooltip => 'Deschideți meniul principal';

  @override
  String netProfit(Object value) {
    return 'Profit: $value';
  }

  @override
  String get noChartData =>
      'Datele lipsesc (sau nu sunt suficiente) pentru a fi afișate';

  @override
  String get notifyHeadline => 'Notificări Parser';

  @override
  String get ok => 'OK';

  @override
  String get orderPin => 'Ordine prioritizată';

  @override
  String get orderUnpin => 'Ordine generalizată';

  @override
  String get outputFile => 'Destinație pentru fișier';

  @override
  String get parseFile => 'Parsează fișierul';

  @override
  String get password => 'Parolă';

  @override
  String get path =>
      'Numele fișierului (în care se salvează sau din care se încarcă)';

  @override
  String get paymentType => 'Interval de plată';

  @override
  String get paymentsHeadline => 'Plăți recurente';

  @override
  String get pearDisabled => '-- dezactivat --';

  @override
  String get pearLoading => 'În curs...';

  @override
  String get peerAccept => 'acceptați';

  @override
  String get peerAction => 'Acțiune';

  @override
  String get peerClosed => 'Terminat';

  @override
  String get peerConnect => 'Conectarea dispozitivului';

  @override
  String get peerConnectBtn => 'conectare';

  @override
  String get peerDelete => 'șterge';

  @override
  String get peerDevice => 'Dispozitive conectate';

  @override
  String get peerId => 'Identificatorul dispozitivului dvs. pentru conectare';

  @override
  String get peerOffline => 'offline';

  @override
  String get peerOnline => 'conectat';

  @override
  String get peerOtherId => 'Identificatorul dispozitivului pentru conexiune';

  @override
  String get peerPending => 'în așteptare';

  @override
  String get peerPing => 'ping';

  @override
  String get peerSent =>
      'Datele sunt transferate către dispozitivele conectate';

  @override
  String get peerStatus => 'Stare';

  @override
  String get peerSync => 'Transfer de date';

  @override
  String pickFile(Object value) {
    return 'Preluare .$value-file';
  }

  @override
  String pongStatus(Object uuid) {
    return 'Cerere preluată de la $uuid';
  }

  @override
  String get processIsFinished => 'Terminat!';

  @override
  String progress(Object value) {
    return 'Progres: $value%';
  }

  @override
  String get raiseData => 'Adăugare sumă';

  @override
  String get recoveryHeadline => 'Recuperare';

  @override
  String get recoveryTooltip => 'Recuperare din';

  @override
  String get releases => 'Eliberări';

  @override
  String get reset => 'resetare';

  @override
  String get returnBack => 'Revenire înapoi';

  @override
  String get roadmap => 'Foaie de parcurs';

  @override
  String get saveNotification => 'Modificări salvate!';

  @override
  String get saveSettingsTooltip => 'Salvare';

  @override
  String get saveTooltip => 'Salvare către';

  @override
  String search(Object value) {
    return 'Afișare după modelul \'$value\'';
  }

  @override
  String get searchTooltip => 'Căutare';

  @override
  String get settingsBaseHeadline => 'Principii de bază';

  @override
  String get settingsHeadline => 'Setări';

  @override
  String get skipFromTotals => 'Excludere din totaluri';

  @override
  String get skipTooltip => 'Sari peste pas(e)';

  @override
  String get spent => 'cheltuite';

  @override
  String get splitCancelTooltip => 'Anulare împărțire pe lună';

  @override
  String get splitTooltip => 'Declararea limitelor pe lună';

  @override
  String get subscription =>
      'Fiind un proiect open-source, abonarea nu va debloca nicio funcție suplimentară. Cu toate acestea, ar servi ca o investiție în evoluția și îmbunătățirea continuă a aplicației și pentru a păstra disponibilitatea acesteia.';

  @override
  String get subscriptionCoffee => 'Cumpărați o cafea';

  @override
  String get subscriptionDinner => 'Cumpărați o cină';

  @override
  String get subscriptionDonorbox => 'Abonați-vă prin Donorbox';

  @override
  String get subscriptionGithub => 'Abonați-vă prin GitHub';

  @override
  String get subscriptionHeadline => 'Sponsorizare';

  @override
  String get subscriptionInactive => 'Serviciul de cumpărare indisponibil';

  @override
  String get subscriptionPatreon => 'Abonare prin Patreon';

  @override
  String get subscriptionPaypal => 'Cumpărați o cafea (PayPal)';

  @override
  String get subscriptionTiny => 'Dați o monedă norocoasă';

  @override
  String get subscriptionTooltip => 'Susțineți (sponsorizare)';

  @override
  String get success => 'Reușită';

  @override
  String get summary => 'Rezumat';

  @override
  String get symbol => 'Simbol';

  @override
  String get syncHeadline => 'Dispozitive de sincronizare';

  @override
  String get systemMode => 'System';

  @override
  String get tapToOpen => 'Atingeți pentru a deschide';

  @override
  String get targetAmount => 'Suma țintă';

  @override
  String get termPrivacy => 'Politica de confidențialitate';

  @override
  String get termUse => 'Termeni de utilizare';

  @override
  String get title => 'Titlu';

  @override
  String get titleAccountTooltip => 'Introduceți identificatorul contului';

  @override
  String get titleBudgetTooltip => 'Introduceți numele categoriei bugetare';

  @override
  String get titleGoal => 'Obiectiv';

  @override
  String get titleGoalTooltip => 'Definiți descrierea obiectivului';

  @override
  String get to => 'la';

  @override
  String get total => 'total';

  @override
  String get transactionFile =>
      'Fișierul jurnal al tranzacțiilor Fingrom (.log)';

  @override
  String get transferHeadline => 'Transfer';

  @override
  String get transferTooltip => 'Setați detaliile transferului';

  @override
  String get transfersHeadline => 'Transferuri';

  @override
  String get typeButton => 'Buton';

  @override
  String get updateAccountTooltip => 'Actualizare cont';

  @override
  String get updateBillTooltip => 'Actualizare factură';

  @override
  String get updateBudgetTooltip => 'Actualizare categorie buget';

  @override
  String get updateGoalTooltip => 'Actualizare obiectiv';

  @override
  String get updatePaymentTooltip => 'Actualizare plată';

  @override
  String get username => 'Nume utilizator (cont)';

  @override
  String get uuid => 'Identificator unic al tranzacției';

  @override
  String get validTillDate => 'Factură valabilă';

  @override
  String get webDav => 'Autorizare și versiune distribuite pe web (WebDav)';

  @override
  String get zoomState => 'Măriți / Micșorați';
}
