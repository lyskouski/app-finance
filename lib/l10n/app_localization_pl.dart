// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Polish (`pl`).
class AppLocalizationsPl extends AppLocalizations {
  AppLocalizationsPl([String locale = 'pl']) : super(locale);

  @override
  String get a =>
      'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => 'O aplikacji';

  @override
  String get account => 'Konto';

  @override
  String get accountFrom => 'Od konta';

  @override
  String get accountHeadline => 'Konta';

  @override
  String get accountTo => 'Do konta';

  @override
  String get accountTooltip => 'Otwarte konta';

  @override
  String get accountType => 'Typ konta';

  @override
  String get accountTypeTooltip => 'Wybierz typ konta';

  @override
  String get acknowledgeTooltip => 'Potwierdź';

  @override
  String get activate => 'Aktywuj';

  @override
  String get actualData => 'Dane historyczne';

  @override
  String get addAccountTooltip => 'Dodaj konto';

  @override
  String get addBudgetTooltip => 'Dodaj nową kategorię budżetu';

  @override
  String get addGoalTooltip => 'Dodaj nowy cel';

  @override
  String get addMainTooltip => 'Dodaj rachunek, dochód lub przelew';

  @override
  String afterNDays(Object value) {
    return 'po $value dniach';
  }

  @override
  String get amountFrom => 'Kwota od';

  @override
  String get amountTo => 'Kwota do';

  @override
  String appBuild(Object build) {
    return 'Utwórz: $build';
  }

  @override
  String get appInitHeadline => 'Inicjalizacja projektu';

  @override
  String get appStartHeadline => 'Konfiguracja początkowa';

  @override
  String get appTitle => 'Fingrom';

  @override
  String appVersion(Object version) {
    return 'Wersja: $version';
  }

  @override
  String get automationHeadline => 'Automatyzacja';

  @override
  String get automationTypeDays => 'po kilku dniach';

  @override
  String get backTooltip => 'Powrót';

  @override
  String get balance => 'Rzeczywiste saldo';

  @override
  String get balanceDate => 'Data aktualizacji salda';

  @override
  String get balanceDateTooltip =>
      'Wyniki i przychody sprzed tej daty nie wpłyną na saldo.';

  @override
  String get balanceTooltip => 'Ustaw saldo';

  @override
  String get bankAccount => 'Konto bankowe';

  @override
  String get bill => 'Rachunek';

  @override
  String get billHeadline => 'Rachunki';

  @override
  String get billSetTooltip => 'Ustaw kwotę';

  @override
  String billSum(Object value) {
    return 'Rachunki: $value';
  }

  @override
  String get billTooltip => 'Otwarte rachunki';

  @override
  String get billTypeTooltip => '[Typ] Rachunek, Przychód lub Przelew';

  @override
  String get brightnessTheme => 'Motyw jasności';

  @override
  String get btnAdd => 'Dodaj';

  @override
  String get btnCancel => 'Anuluj';

  @override
  String get btnConfirm => 'Potwierdź';

  @override
  String get btnMore => 'Więcej';

  @override
  String get budget => 'Kategoria Budżet';

  @override
  String get budgetHeadline => 'Budżety';

  @override
  String get budgetLimit => 'Limit na miesiąc';

  @override
  String get budgetLimitHeadline => 'Korekty limitu';

  @override
  String get budgetRelativeLimit => 'Współczynnik względny na miesiąc';

  @override
  String get budgetTooltip => 'Typy otwartych budżetów';

  @override
  String get budgetType => 'Interwał budżetowania';

  @override
  String get budgetTypeAsIs => 'Bez ograniczeń';

  @override
  String get budgetTypeFixed => 'Stały';

  @override
  String get budgetTypeMonth => 'miesięczny';

  @override
  String get budgetTypeRelative => 'Względny';

  @override
  String get budgetTypeWeek => 'tygodniowy';

  @override
  String get budgetTypeYear => 'rocznie';

  @override
  String get cash => 'Gotówka';

  @override
  String get chartBarRace => 'Wyścig słupkowy dla kategorii';

  @override
  String get chartForecast => 'Wykres prognozy';

  @override
  String get chartOHLC => 'Wykres świecowy (OHLC)';

  @override
  String get chartYtdExpense => 'Wydatki narastająco';

  @override
  String get clear => 'Upuść wartość';

  @override
  String get closeTooltip => 'Zamknięcie';

  @override
  String get closedAt => 'Zakończone do daty';

  @override
  String get cmpChart => 'Schematy';

  @override
  String get cmpRecent => 'Ostatnie pozycje';

  @override
  String get cmpRecentCount => 'Rozmiar listy';

  @override
  String get coAuthor => 'autor';

  @override
  String get coConsult => 'doradca';

  @override
  String get coDeveloper => 'deweloper';

  @override
  String get coNew => 'Dołącz';

  @override
  String get coPromoter => 'promotor';

  @override
  String get coTranslator => 'tłumacz';

  @override
  String get coef => 'wsp.';

  @override
  String get collapse => 'Zwiń (Przywróć) sekcję';

  @override
  String get color => 'Kolor';

  @override
  String get colorApp => 'Niestandardowy';

  @override
  String get colorBackground => 'Tło';

  @override
  String get colorDark => 'Ciemny';

  @override
  String get colorInversePrimary => 'Odwrócona powierzchnia podstawowa';

  @override
  String get colorInverseSurface => 'Odwrócona powierzchnia';

  @override
  String get colorLight => 'Jasny';

  @override
  String get colorOnInverseSurface => 'Na powierzchni odwróconej';

  @override
  String get colorOnSecondary => 'Na powierzchni dodatkowej';

  @override
  String get colorOnSecondaryContainer => 'Na pojemniku';

  @override
  String get colorPrimary => 'Podstawowa';

  @override
  String get colorRestore => 'Zresetuj paletę';

  @override
  String get colorSecondary => 'Wtórny';

  @override
  String get colorSystem => 'Domyślny';

  @override
  String get colorTheme => 'Paleta';

  @override
  String get colorTooltip => 'Wybierz kolor';

  @override
  String get colorType => 'Typ koloru';

  @override
  String get colorUser => 'Osobisty';

  @override
  String columnMap(Object value) {
    return 'Mapowanie dla kolumny \'$value\'';
  }

  @override
  String columnMapTooltip(Object value) {
    return '\'$value\' - Wybierz mapowanie kolumny';
  }

  @override
  String get completeGoalTooltip => 'Ukończ cel';

  @override
  String get confirmHeader => 'Potwierdź działanie';

  @override
  String get confirmTooltip => 'Czy na pewno? Tej akcji nie można cofnąć.';

  @override
  String get contributors => 'Współtwórcy';

  @override
  String get conversion => 'Konwersja';

  @override
  String conversionMessage(Object currency) {
    return 'Wykonano w $currency';
  }

  @override
  String get copiedToClipboard => 'Skopiowano do schowka';

  @override
  String get createAccountHeader => 'Utwórz nowe konto';

  @override
  String get createAccountTooltip => 'Utwórz nowe konto';

  @override
  String get createBillHeader => 'Utwórz nową transakcję';

  @override
  String get createBillTooltip => 'Dodaj nowy rachunek';

  @override
  String get createBudgetHeader => 'Nowa kategoria budżetu';

  @override
  String get createBudgetTooltip => 'Utwórz nową kategorię budżetu';

  @override
  String get createGoalHeader => 'Utwórz cel';

  @override
  String get createGoalTooltip => 'Dodaj nowy cel';

  @override
  String get createIncomeTooltip => 'Dodaj nowy Dochód';

  @override
  String get createPaymentTooltip => 'Dodaj nową płatność';

  @override
  String get createTransferTooltip => 'Utwórz przelew';

  @override
  String get credit => 'Kredyt';

  @override
  String get creditCard => 'Karta kredytowa';

  @override
  String get currency => 'Waluta';

  @override
  String get currencyAddHeadline => 'Wymiana walut';

  @override
  String get currencyAddTooltip => 'Dodaj kurs wymiany walut';

  @override
  String get currencyDefault => 'Domyślna waluta';

  @override
  String get currencyDistribution => 'Dystrybucja';

  @override
  String currencyExchange(Object from, Object to) {
    return 'Wymiana walut: $from -> $to';
  }

  @override
  String get currencyHeadline => 'Waluty';

  @override
  String currencyIn(Object value) {
    return 'W $value';
  }

  @override
  String get currencyShort => 'Wal.';

  @override
  String get currencyTooltip => 'Typ waluty (kod)';

  @override
  String get currencyUpdateTooltip => 'Zaktualizuj kurs walut';

  @override
  String get currentDate => 'Wskaźnik bieżącej daty';

  @override
  String get customAddTooltip => 'Dodaj widżet';

  @override
  String get customDeleteTooltip => 'Usuń dostosowanie';

  @override
  String get customSaveTooltip => 'Zapisz personalizację';

  @override
  String get customizeTooltip => 'Dostosowywanie strony';

  @override
  String get darkMode => 'Ciemny';

  @override
  String get dateFormat => 'Format daty';

  @override
  String get dateRange => 'Zakres dat';

  @override
  String get dateTooltip => 'Wybierz datę';

  @override
  String get dayMonday => 'Poniedziałek';

  @override
  String get dayStartOfMonth => 'Początek miesiąca';

  @override
  String get dayStartOfWeek => 'Początek tygodnia';

  @override
  String get daySunday => 'Niedziela';

  @override
  String get debitCard => 'Karta debetowa';

  @override
  String def(Object value) {
    return 'Wartość domyślna dla \'$value\'';
  }

  @override
  String get deleteAccountTooltip => 'Dezaktywuj konto';

  @override
  String get deleteBillTooltip => 'Usuń rachunek';

  @override
  String get deleteBudgetTooltip => 'Dezaktywuj kategorię budżetu';

  @override
  String get deleteGoalTooltip => 'Usuń cel';

  @override
  String get deleteInvoiceTooltip => 'Usuń fakturę';

  @override
  String get deletePaymentTooltip => 'Usuń płatność';

  @override
  String get deleteTooltip => 'Usuń';

  @override
  String get deleteTransferTooltip => 'Usuń przelew';

  @override
  String get deposit => 'Wpłata';

  @override
  String get description => 'Opis';

  @override
  String get descriptionTooltip => 'Ustawianie szczegółów wydatków';

  @override
  String get design => 'Tryb projektowania (specyficzny dla kultury)';

  @override
  String get designAsiaGeneral => 'Azja Ogólne';

  @override
  String get designGermany => 'Niemczech';

  @override
  String get designGlobal => 'Globalny';

  @override
  String get designRtlGeneral => 'Napisy od prawej do lewej';

  @override
  String get details => 'Szczegóły';

  @override
  String get detailsTooltip => '****2345 - ostatnie 4 cyfry numeru';

  @override
  String get dtAm => 'am';

  @override
  String get dtAmPm => 'godzina w am/pm (0~11)';

  @override
  String get dtDay => 'dzień w miesiącu';

  @override
  String get dtEscape => 'escape dla tekstu';

  @override
  String get dtHalfHour => 'godzina w am/pm (1~12)';

  @override
  String get dtHour => 'godzina w dniu (0~23)';

  @override
  String get dtMinute => 'minuta w godzinie';

  @override
  String get dtMonth => 'miesiąc w roku';

  @override
  String get dtNamedDay => 'dzień tygodnia';

  @override
  String get dtPm => 'pm';

  @override
  String get dtQuote => 'pojedynczy cudzysłów';

  @override
  String get dtSecond => 'sekunda w minucie';

  @override
  String get dtYear => 'rok';

  @override
  String get editAccountHeader => 'Zaktualizuj konto';

  @override
  String get editAccountTooltip => 'Edytuj konto';

  @override
  String get editBillHeader => 'Zaktualizuj rachunek';

  @override
  String get editBillTooltip => 'Edytuj rachunek';

  @override
  String get editBudgetHeader => 'Aktualizacja kategorii budżetu';

  @override
  String get editBudgetTooltip => 'Edytuj kategorię budżetu';

  @override
  String get editGoalHeader => 'Aktualizuj cel';

  @override
  String get editGoalTooltip => 'Edytuj cel';

  @override
  String get editInvoiceTooltip => 'Edytuj fakturę';

  @override
  String get editPaymentTooltip => 'Edytuj płatność';

  @override
  String get editTooltip => 'Edytuj';

  @override
  String get editTransferTooltip => 'Edytuj przelew';

  @override
  String get encryptionMode => 'Szyfrowanie danych';

  @override
  String error(Object value) {
    return 'Błąd: $value';
  }

  @override
  String get errorExpired => 'Karta wygasła';

  @override
  String get errorNegative => 'Nie może być ujemna! Proszę, napraw ten błąd';

  @override
  String get example => 'Przykład';

  @override
  String get expand => 'Rozwiń sekcję';

  @override
  String get expense => 'Kwota wydatków';

  @override
  String get expenseDateTime => 'Rozliczone na';

  @override
  String get expenseHeadline => 'Wydatek';

  @override
  String get expenseTransfer => 'Kwota przelewu';

  @override
  String exportFile(Object value) {
    return 'Eksportuj jako plik .$value';
  }

  @override
  String get failData => 'Kwota odliczenia';

  @override
  String get flowTypeInvoice => 'Faktura';

  @override
  String get flowTypeTooltip => 'Typ kwoty: Rachunek, Faktura';

  @override
  String get forecastData => 'Prognoza';

  @override
  String get from => 'od';

  @override
  String get goNextTooltip => 'Przejdź dalej';

  @override
  String get goalHeadline => 'Cele';

  @override
  String goalProfit(Object value) {
    return 'Cele docelowe: $value';
  }

  @override
  String get goalProfitTooltip => 'Zysk vs cel bramki';

  @override
  String get goalTooltip => 'Otwarte cele';

  @override
  String get hasEncrypted => 'Po ustawieniu nie można ich zmienić';

  @override
  String get helpTooltip => '[Pomoc] Pokaż opis tej strony';

  @override
  String get homeHeadline => 'Strona główna';

  @override
  String get homeTooltip => 'Powrót do strony głównej';

  @override
  String get icon => 'Ikona';

  @override
  String get iconTooltip => 'Wybierz ikonę';

  @override
  String get ignoreTooltip => 'Ignoruj';

  @override
  String get importHeadline => 'Import / Eksport';

  @override
  String get income => 'Kwota dochodu';

  @override
  String get incomeHeadline => 'Dochód';

  @override
  String get incomeHealth => 'Radar stanu dochodów';

  @override
  String get incomeTooltip => 'Ustawianie szczegółów dochodu';

  @override
  String get invoiceHeadline => 'Faktury';

  @override
  String invoiceSum(Object value) {
    return 'Faktury: $value';
  }

  @override
  String get isCleaned => 'Usuń istniejące dane';

  @override
  String get isCreated => 'Już utworzony, wykonaj kolejne kroki!';

  @override
  String get isEncrypted => 'Plik jest szyfrowany (domyślnie)';

  @override
  String get isRequired => 'wymagany';

  @override
  String get language => 'Język';

  @override
  String get left => 'lewy';

  @override
  String get lightMode => 'Światło';

  @override
  String get link => 'Jednolity lokalizator zasobów (URL)';

  @override
  String get meaning => 'Znaczenie';

  @override
  String get metricsHeadline => 'Metryka';

  @override
  String get metricsTooltip => 'Metryki';

  @override
  String get milestones => 'Kamienie milowe';

  @override
  String get missingContent => 'Plik nie może zostać przetworzony (anulowany)';

  @override
  String get navigationTooltip => 'Otwórz menu główne';

  @override
  String netProfit(Object value) {
    return 'Zysk: $value';
  }

  @override
  String get noChartData =>
      'Brakuje danych (lub jest ich za mało) do wyświetlenia';

  @override
  String get notifyHeadline => 'Parser powiadomień';

  @override
  String get ok => 'OK';

  @override
  String get orderPin => 'Kolejność priorytetowa';

  @override
  String get orderUnpin => 'Kolejność uogólniona';

  @override
  String get outputFile => 'Miejsce docelowe dla pliku';

  @override
  String get parseFile => 'Przeanalizuj plik';

  @override
  String get password => 'Hasło';

  @override
  String get path => 'Nazwa pliku (do zapisania lub wczytania)';

  @override
  String get paymentType => 'Przedział płatności';

  @override
  String get paymentsHeadline => 'Płatności cykliczne';

  @override
  String get pearDisabled => '-- wyłączone --';

  @override
  String get pearLoading => 'W toku...';

  @override
  String get peerAccept => 'akceptuj';

  @override
  String get peerAction => 'Działanie';

  @override
  String get peerClosed => 'zakończone';

  @override
  String get peerConnect => 'Podłącz urządzenie';

  @override
  String get peerConnectBtn => 'połączenie';

  @override
  String get peerDelete => 'usuwanie';

  @override
  String get peerDevice => 'Połączone urządzenia';

  @override
  String get peerId => 'Identyfikator urządzenia dla połączenia';

  @override
  String get peerOffline => 'nieaktywny';

  @override
  String get peerOnline => 'połączony';

  @override
  String get peerOtherId => 'Identyfikator urządzenia dla połączenia';

  @override
  String get peerPending => 'w toku';

  @override
  String get peerPing => 'ping';

  @override
  String get peerSent => 'Dane są przesyłane do połączonych urządzeń';

  @override
  String get peerStatus => 'Status';

  @override
  String get peerSync => 'Przesyłanie danych';

  @override
  String pickFile(Object value) {
    return 'Pobrano plik .$value';
  }

  @override
  String pongStatus(Object uuid) {
    return 'Odebrano żądanie od $uuid';
  }

  @override
  String get processIsFinished => 'Zakończono!';

  @override
  String progress(Object value) {
    return 'Postęp: $value%';
  }

  @override
  String get raiseData => 'Dodanie kwoty';

  @override
  String get recoveryHeadline => 'Odzyskiwanie';

  @override
  String get recoveryTooltip => 'Odzyskiwanie z';

  @override
  String get releases => 'Zwolnienia';

  @override
  String get reset => 'reset';

  @override
  String get returnBack => 'Powrócić';

  @override
  String get roadmap => 'Mapa drogowa';

  @override
  String get saveNotification => 'Zmiany zostały zapisane!';

  @override
  String get saveSettingsTooltip => 'Zapisz';

  @override
  String get saveTooltip => 'Zapisz do';

  @override
  String search(Object value) {
    return 'Pokaż według wzorca \'$value\'';
  }

  @override
  String get searchTooltip => 'Szukaj';

  @override
  String get settingsBaseHeadline => 'Podstawy';

  @override
  String get settingsHeadline => 'Ustawienia';

  @override
  String get skipFromTotals => 'Wyklucz z sumy';

  @override
  String get skipTooltip => 'Pomiń kroki';

  @override
  String get spent => 'zużyty';

  @override
  String get splitCancelTooltip => 'Anuluj podział na miesiąc';

  @override
  String get splitTooltip => 'Deklarowanie limitów na miesiąc';

  @override
  String get subscription =>
      'Jako projekt open-source, subskrypcja nie odblokuje żadnych dodatkowych funkcji. Będzie to jednak inwestycja w ciągłą ewolucję i ulepszanie aplikacji oraz zachowanie jej dostępności.';

  @override
  String get subscriptionCoffee => 'Kup kawę';

  @override
  String get subscriptionDinner => 'Poczęstuj się kolacją';

  @override
  String get subscriptionDonorbox => 'Subskrybuj przez Donorbox';

  @override
  String get subscriptionGithub => 'Subskrybuj przez GitHub';

  @override
  String get subscriptionHeadline => 'Sponsorowanie';

  @override
  String get subscriptionInactive => 'Usługa zakupu niedostępna';

  @override
  String get subscriptionPatreon => 'Subskrybuj przez Patreon';

  @override
  String get subscriptionPaypal => 'Kup kawę (PayPal)';

  @override
  String get subscriptionTiny => 'Podarować szczęśliwą monetę';

  @override
  String get subscriptionTooltip => 'Wsparcie (sponsorowanie)';

  @override
  String get success => 'Udało się';

  @override
  String get summary => 'Podsumowanie';

  @override
  String get symbol => 'Godło';

  @override
  String get syncHeadline => 'Synchronizacja urządzeń';

  @override
  String get systemMode => 'Systemowy';

  @override
  String get tapToOpen => 'Naciśnij, aby otworzyć';

  @override
  String get targetAmount => 'Kwota docelowa';

  @override
  String get termPrivacy => 'Polityka prywatności';

  @override
  String get termUse => 'Warunki użytkowania';

  @override
  String get title => 'Tytuł';

  @override
  String get titleAccountTooltip => 'Wprowadź identyfikator konta';

  @override
  String get titleBudgetTooltip => 'Wprowadź nazwę kategorii budżetu';

  @override
  String get titleGoal => 'Cel';

  @override
  String get titleGoalTooltip => 'Zdefiniuj opis celu';

  @override
  String get to => 'do';

  @override
  String get total => 'całkowity';

  @override
  String get transactionFile => 'Plik dziennika transakcji Fingrom (.log)';

  @override
  String get transferHeadline => 'Przelew';

  @override
  String get transferTooltip => 'Ustaw szczegóły transferu';

  @override
  String get transfersHeadline => 'Przelewy';

  @override
  String get typeButton => 'Przycisk';

  @override
  String get updateAccountTooltip => 'Zaktualizuj rachunek';

  @override
  String get updateBillTooltip => 'Zaktualizuj rachunek';

  @override
  String get updateBudgetTooltip => 'Zaktualizuj kategorię budżetu';

  @override
  String get updateGoalTooltip => 'Zaktualizuj cel';

  @override
  String get updatePaymentTooltip => 'Aktualizacja płatności';

  @override
  String get username => 'Nazwa użytkownika (konto)';

  @override
  String get uuid => 'Unikalny identyfikator transakcji';

  @override
  String get validTillDate => 'Ważny termin płatności';

  @override
  String get webDav =>
      'Rozproszone tworzenie i wersjonowanie przez Internet (WebDav)';

  @override
  String get zoomState => 'Powiększanie / pomniejszanie';
}
