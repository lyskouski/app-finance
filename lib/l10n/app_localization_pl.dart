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
  String get accountTooltip => 'Otwórz konto';

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
  String get budgetPositive => 'Budżet, Menedżer podsumowań';

  @override
  String get budgetPositiveOff => 'Ignoruj wartości ujemne';

  @override
  String get budgetPositiveOn => 'Uwzględnij wartości ujemne';

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
  String get daySaturday => 'Sobota';

  @override
  String get dayStartOfMonth => 'Początek miesiąca';

  @override
  String get dayStartOfWeek => 'Początek tygodnia';

  @override
  String get daySunday => 'Niedziela';

  @override
  String get deactivateAction => 'Wyłącz ochronę hasłem';

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
  String get enableBankingAppId => 'ID aplikacji';

  @override
  String get enableBankingBank => 'Bank';

  @override
  String get enableBankingCode => 'Adres strony otwartej po autoryzacji';

  @override
  String get enableBankingCodeTooltip =>
      'Potwierdź dostęp w banku, a następnie skopiuj adres z przeglądarki i wklej go tutaj';

  @override
  String get enableBankingCountry => 'Kraj (kod ISO, np. PL)';

  @override
  String get enableBankingDescription =>
      'Import sald i transakcji z europejskich banków przez Enable Banking API (PSD2) z własną aplikacją zarejestrowaną na enablebanking.com. Dostęp tylko do odczytu: żadne płatności nie są wykonywane.';

  @override
  String get enableBankingHeadline => 'Enable Banking (EU)';

  @override
  String get enableBankingIncomplete =>
      'Uzupełnij ID aplikacji, klucz prywatny, URL przekierowania i kraj';

  @override
  String get enableBankingKey => 'Klucz prywatny (PEM)';

  @override
  String get enableBankingKeyInvalid =>
      'Nieprawidłowy klucz prywatny: oczekiwano bloku PEM \"PRIVATE KEY\"';

  @override
  String get enableBankingKeyNotRsa =>
      'Nieprawidłowy klucz prywatny: oczekiwano klucza RSA';

  @override
  String get enableBankingKeyTooltip =>
      'Tworzony wraz z aplikacją w Enable Banking Control Panel; przechowywany w postaci zaszyfrowanej. Pozostaw puste, aby zachować zapisany klucz';

  @override
  String get enableBankingLoadBanks => 'Wczytaj banki';

  @override
  String get enableBankingNoAuthPage =>
      'Enable Banking nie zwrócił strony autoryzacji';

  @override
  String get enableBankingNoCode => 'Nie znaleziono kodu autoryzacji w adresie';

  @override
  String get enableBankingRedirect => 'URL przekierowania';

  @override
  String get enableBankingRedirectTooltip =>
      'Zarejestrowany dla aplikacji; bank wraca do niego po autoryzacji';

  @override
  String get enableBankingStateMismatch =>
      'Adres należy do innej autoryzacji, połącz się ponownie';

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
  String get finTsApproved => 'Zatwierdzono w aplikacji bankowej';

  @override
  String get finTsBankCode => 'Kod banku (BLZ)';

  @override
  String get finTsCustomerId => 'ID klienta (jeśli inny niż ID użytkownika)';

  @override
  String get finTsDescription =>
      'Import sald i transakcji z banków obsługujących FinTS 4.1 (PIN/TAN). Dostęp tylko do odczytu: żadne płatności nie są wykonywane.';

  @override
  String get finTsHeadline => 'Financial Transaction Services (FinTS 4.1)';

  @override
  String get finTsIncomplete =>
      'Uzupełnij URL serwera, kod banku, ID użytkownika i numer rejestracyjny produktu';

  @override
  String finTsLoginChanged(Object value) {
    return 'Bank zmienił dane logowania, zaktualizuj ID użytkownika lub ID klienta: $value';
  }

  @override
  String finTsLoginRefused(Object value) {
    return 'Bank odrzucił poprzednie logowanie: $value. Spróbować ponownie z wprowadzonym PIN-em?';
  }

  @override
  String get finTsPin => 'PIN';

  @override
  String get finTsPinHint => 'Używany tylko w tej sesji i nigdy nie zapisywany';

  @override
  String get finTsProductId => 'Numer rejestracyjny produktu';

  @override
  String get finTsProductIdTooltip =>
      'Nadawany przez Deutsche Kreditwirtschaft producentowi aplikacji';

  @override
  String get finTsTan => 'TAN';

  @override
  String get finTsTanHeadline => 'Autoryzacja transakcji (TAN)';

  @override
  String get finTsTanMedium => 'Wybierz nośnik TAN';

  @override
  String get finTsTanMethod => 'Wybierz metodę TAN';

  @override
  String get finTsUrl => 'URL serwera FinTS banku';

  @override
  String get finTsUserId => 'ID użytkownika (login)';

  @override
  String get finTsVersion => 'Wersja protokołu';

  @override
  String get finTsWebUnsupported =>
      'Serwery banków nie pozwalają na dostęp z przeglądarki. Użyj aplikacji desktopowej lub mobilnej.';

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
  String get hour => 'Godzina';

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
  String get integrationAccessDenied =>
      'Dostęp został cofnięty lub dane logowania są nieprawidłowe';

  @override
  String get integrationConnect => 'Połącz';

  @override
  String get integrationDateFrom => 'Importuj transakcje od';

  @override
  String get integrationDefaultBudgetCategory => 'Domyślna kategoria budżetu';

  @override
  String get integrationDisconnect => 'Rozłącz';

  @override
  String get integrationForget => 'Zapomnij dostęp';

  @override
  String get integrationHeadline => 'Integracje';

  @override
  String integrationHttpError(Object value) {
    return 'Usługa odpowiedziała błędem (HTTP $value)';
  }

  @override
  String get integrationHttpsRequired =>
      'Dozwolone są tylko bezpieczne adresy (HTTPS)';

  @override
  String get integrationImport => 'Importuj transakcje';

  @override
  String integrationImported(Object added, Object pending, Object skipped) {
    return 'Zaimportowano: $added, pominięto jako istniejące: $skipped, oczekujące (nie zaimportowano): $pending';
  }

  @override
  String integrationInvalidAmount(Object value) {
    return 'Nieprawidłowa kwota: $value';
  }

  @override
  String get integrationNoAccounts => 'Bank nie udostępnił żadnych kont';

  @override
  String get integrationPaymentRequired => 'Usługa wymaga płatności za dostęp';

  @override
  String get integrationSelectTarget =>
      'Wybierz konto i kategorię budżetu do importu';

  @override
  String integrationServiceError(Object value) {
    return 'Komunikat usługi: $value';
  }

  @override
  String get integrationUnexpectedResponse => 'Nieoczekiwana odpowiedź usługi';

  @override
  String get investecApiKey => 'Klucz API';

  @override
  String get investecClientId => 'ID klienta';

  @override
  String get investecCredentialsTooltip =>
      'Tworzony w Investec Online w Investec Developer → API keys; przechowywany w postaci zaszyfrowanej';

  @override
  String get investecDescription =>
      'Import sald i transakcji kont Investec Private Banking (Republika Południowej Afryki) przez Programmable Banking API z własnymi kluczami API. Dostęp tylko do odczytu: nie są wykonywane żadne płatności.';

  @override
  String get investecHeadline =>
      'Investec Programmable Banking (Republika Południowej Afryki)';

  @override
  String get investecIncomplete => 'Uzupełnij ID klienta, sekret i klucz API';

  @override
  String get investecSandbox => 'Sandbox (dane testowe)';

  @override
  String get investecSecret => 'Sekret';

  @override
  String get investecSteps =>
      'Jak uzyskać klucze API:\n1. Zaloguj się do Investec Online i zarejestruj się w Investec Developer (Programmable Banking)\n2. Otwórz API keys i utwórz klucz z dostępem do kont i transakcji\n3. Potwierdź go weryfikacją dwuetapową i skopiuj ID klienta, sekret i klucz API\n4. Wklej je poniżej i naciśnij „Połącz”';

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
  String get managerHeadline => 'Menedżer';

  @override
  String get meaning => 'Znaczenie';

  @override
  String get metricsHeadline => 'Metryka';

  @override
  String get metricsTooltip => 'Metryki';

  @override
  String get milestones => 'Kamienie milowe';

  @override
  String get minute => 'Minuta';

  @override
  String get missingContent => 'Plik nie może zostać przetworzony (anulowany)';

  @override
  String get monobankCreateAccount => 'Utwórz konto';

  @override
  String get monobankDescription =>
      'Import sald i transakcji kart i słoików monobank za pomocą osobistego tokenu. monobank pozwala na jedno zapytanie na minutę: import długiego okresu trwa kilka minut. Dostęp tylko do odczytu: płatności nie są wykonywane.';

  @override
  String get monobankHeadline => 'monobank Personal API (Ukraina)';

  @override
  String get monobankJar => 'Słoik';

  @override
  String monobankProgress(Object done, Object total) {
    return 'Pobieranie wyciągów: $done z $total';
  }

  @override
  String monobankRateLimit(Object value) {
    return 'monobank pozwala na jedno zapytanie na minutę: następne za $value s';
  }

  @override
  String get monobankToken => 'Token osobisty';

  @override
  String get monobankTokenSteps =>
      'Jak uzyskać token osobisty:\n1. Otwórz api.monobank.ua w przeglądarce\n2. Zeskanuj kod QR w aplikacji monobank i potwierdź dostęp\n3. Skopiuj token ze strony\n4. Wklej go poniżej i naciśnij „Połącz”\n5. Powiąż każdą kartę lub słoik z kontem (albo utwórz je) i zaimportuj';

  @override
  String get monobankTokenTooltip =>
      'Wydawany na api.monobank.ua po zeskanowaniu kodu QR w aplikacji monobank; przechowywany w postaci zaszyfrowanej';

  @override
  String get monzoApprove =>
      'Zatwierdź dostęp w aplikacji Monzo, a następnie ponownie naciśnij „Połącz”';

  @override
  String get monzoClientId => 'ID klienta';

  @override
  String get monzoClientSecret => 'Sekret klienta';

  @override
  String get monzoClientSecretTooltip =>
      'Wyświetlany dla klienta OAuth na developers.monzo.com; przechowywany w postaci zaszyfrowanej. Pozostaw puste, aby zachować zapisany sekret';

  @override
  String get monzoCode => 'Adres strony otwartej po zalogowaniu';

  @override
  String get monzoCodeTooltip =>
      'Jeśli Fingrom nie otworzył się automatycznie, skopiuj adres z przeglądarki i wklej go tutaj';

  @override
  String get monzoDescription =>
      'Import sald i transakcji kont Monzo za pomocą własnego klienta OAuth zarejestrowanego na developers.monzo.com (tylko do użytku osobistego). Dostęp tylko do odczytu: nie są wykonywane żadne płatności.';

  @override
  String get monzoExpired => 'Dostęp do Monzo wygasł: połącz się ponownie';

  @override
  String monzoFullHistory(Object value) {
    return 'Pełna historia jest dostępna do $value: wybierz wcześniejszą datę i zaimportuj teraz. Później Monzo udostępnia tylko ostatnie 90 dni';
  }

  @override
  String get monzoHeadline => 'Monzo Developer API (Wielka Brytania)';

  @override
  String monzoHistoryLimited(Object value) {
    return 'Monzo udostępnia tylko ostatnie 90 dni: transakcje są importowane od $value';
  }

  @override
  String get monzoIncomplete =>
      'Uzupełnij ID klienta, sekret klienta i URL przekierowania';

  @override
  String get monzoRedirect => 'URL przekierowania';

  @override
  String get monzoRedirectTooltip =>
      'Ustaw dokładnie ten adres dla klienta OAuth; Monzo wraca do niego po zalogowaniu';

  @override
  String get monzoSteps =>
      'Jak połączyć:\n1. Zaloguj się na developers.monzo.com adresem e-mail swojego konta Monzo\n2. Otwórz Clients → New OAuth Client, wybierz „Confidential” i ustaw URL przekierowania pokazany poniżej\n3. Skopiuj ID klienta i sekret klienta, wklej je poniżej i naciśnij „Połącz”\n4. Otwórz link wysłany e-mailem, zatwierdź dostęp w aplikacji Monzo i ponownie naciśnij „Połącz”\n5. Importuj od razu: pełna historia jest dostępna tylko przez 5 minut po zatwierdzeniu, później tylko ostatnie 90 dni';

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
  String get notificationAccessSettings => 'Dostęp do powiadomień';

  @override
  String get notificationAccessSteps =>
      'Jak przyznać dostęp:\n1. Naciśnij \"Przyznaj dostęp\", aby otworzyć ustawienia systemowe\n2. Zezwól Fingrom na odczyt powiadomień\n3. Jeśli Android zgłasza ustawienie ograniczone: otwórz informacje o aplikacji Fingrom → ⋮ → \"Zezwól na ustawienia ograniczone\" i spróbuj ponownie\n4. Wróć do Fingrom i wybierz aplikacje, z których mają być odczytywane powiadomienia';

  @override
  String get notificationAccounts => 'Słowa kluczowe kont';

  @override
  String get notificationAccountsTooltip =>
      'Słowa rozpoznające konto w powiadomieniu (ostatnie cyfry karty, nazwa portfela): wpisz słowo i naciśnij Enter, aby je dodać. W przeciwnym razie używane jest domyślne konto aplikacji';

  @override
  String get notificationApps => 'Aplikacje do odczytu powiadomień';

  @override
  String notificationAutoImported(Object value) {
    return 'Dodano z powiadomień: $value';
  }

  @override
  String get notificationAutoTooltip =>
      'Rozpoznane powiadomienia są dodawane bez potwierdzenia: od razu, gdy Fingrom działa, w przeciwnym razie przy następnym uruchomieniu. Nierozpoznane czekają na sprawdzenie';

  @override
  String get notificationBalance => 'Słowa kluczowe salda';

  @override
  String get notificationBalanceTooltip =>
      'Słowa poprzedzające kwotę do pominięcia (saldo, limit): wpisz słowo i naciśnij Enter, aby je dodać';

  @override
  String notificationCaptured(Object value) {
    return 'Odebrane powiadomienia: $value';
  }

  @override
  String get notificationClear => 'Wyczyść odebrane';

  @override
  String get notificationCurrencyTooltip =>
      'Kwoty bez waluty (np. Obciążenie 20,00) są przyjmowane w tej walucie';

  @override
  String get notificationDefaultAccount => 'Konto domyślne';

  @override
  String get notificationDescription =>
      'Tworzenie transakcji z powiadomień aplikacji bankowych i płatniczych na tym urządzeniu. Odczytywane są tylko powiadomienia wybranych aplikacji i pozostają one na urządzeniu do czasu importu. Kwota i waluta są rozpoznawane automatycznie.';

  @override
  String get notificationGrant => 'Przyznaj dostęp';

  @override
  String get notificationIncome => 'Słowa kluczowe przychodu';

  @override
  String get notificationIncomeTooltip =>
      'Słowa oznaczające powiadomienie jako przychód: wpisz słowo i naciśnij Enter, aby je dodać';

  @override
  String get notificationMerchant => 'Etykiety sprzedawcy';

  @override
  String get notificationMerchantTooltip =>
      'Słowa, po których następuje dwukropek i sprzedawca (Lokalizacja: Sklep): wpisz słowo i naciśnij Enter, aby je dodać';

  @override
  String get notificationNoApps =>
      'Nie otrzymano jeszcze powiadomień: aplikacje pojawią się tutaj po wysłaniu powiadomienia';

  @override
  String get notificationUnparsed => 'Nie rozpoznano';

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
  String get privatBankAdd => 'Dodaj konto';

  @override
  String get privatBankDescription =>
      'Import sald i transakcji kont firmowych (JDG i spółek) Privat24 dla Biznesu za pomocą tokenu Autoclient. Konta osobiste nie są obsługiwane przez API. Dostęp tylko do odczytu: płatności nie są realizowane.';

  @override
  String get privatBankHeadline => 'PrivatBank Autoclient (Ukraina)';

  @override
  String get privatBankIban => 'IBAN konta';

  @override
  String get privatBankIbanInvalid => 'Wprowadź ukraiński IBAN: UA i 27 cyfr';

  @override
  String get privatBankIbanTooltip =>
      'API nie udostępnia listy kont: dodaj numery IBAN kont pojedynczo';

  @override
  String privatBankNotReady(Object value) {
    return 'PrivatBank przygotowuje wyciągi (faza $value): spróbuj ponownie za kilka minut';
  }

  @override
  String get privatBankRemove => 'Usuń konto';

  @override
  String get privatBankToken => 'Token Autoclient';

  @override
  String get privatBankTokenSteps =>
      'Jak uzyskać token Autoclient:\n1. Zaloguj się do Privat24 dla Biznesu\n2. Otwórz Integracja (Autoclient)\n3. Aktywuj ją i skopiuj token\n4. Wklej go poniżej i naciśnij „Połącz”\n5. Dodaj numery IBAN kont do importu';

  @override
  String get privatBankTokenTooltip =>
      'Wydawany w Privat24 dla Biznesu w sekcji Integracja (Autoclient); przechowywany w postaci zaszyfrowanej';

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
  String get secureBioNotMatch =>
      'Uwierzytelnianie nie powiodło się! Spróbuj ponownie';

  @override
  String get secureBioPromptReason =>
      'Proszę uwierzytelnić się, aby kontynuować';

  @override
  String get secureBioPromptTitle => 'Uwierzytelnianie biometryczne';

  @override
  String get secureOtpCode => 'Kod jednorazowego hasła';

  @override
  String get secureOtpCodeInvalid =>
      'Nieprawidłowy kod! Proszę, wygeneruj nowy kod i wprowadź go';

  @override
  String get secureOtpDeactivated => 'Ochrona hasłem jest wyłączona';

  @override
  String get securePassword => 'Hasło (fraza odzyskiwania)';

  @override
  String get securePasswordEmpty => 'Hasło nie może być puste!';

  @override
  String get securePasswordNotMatch => 'Hasła nie są zgodne!';

  @override
  String get securePasswordRepeat => 'Powtórz hasło';

  @override
  String get securityHeadline => 'Bezpieczeństwo';

  @override
  String get settingsBaseHeadline => 'Podstawy';

  @override
  String get settingsHeadline => 'Ustawienia';

  @override
  String get settingsSaved => 'Ustawienia zapisane!';

  @override
  String get simpleFinDescription =>
      'Import sald i transakcji z amerykańskich banków i wydawców kart przez SimpleFIN Bridge. Dostęp tylko do odczytu: żadne płatności nie są wykonywane.';

  @override
  String get simpleFinHeadline => 'SimpleFIN Bridge (US)';

  @override
  String get simpleFinNoCredentials =>
      'SimpleFIN Bridge zwrócił adres dostępu bez danych logowania';

  @override
  String get simpleFinToken => 'Token konfiguracyjny SimpleFIN';

  @override
  String get simpleFinTokenClaimed =>
      'Token konfiguracyjny nie istnieje lub został już użyty';

  @override
  String get simpleFinTokenInvalid =>
      'Nieprawidłowy token konfiguracyjny SimpleFIN';

  @override
  String get simpleFinTokenTooltip =>
      'Tworzony w Twoim SimpleFIN Bridge (np. bridge.simplefin.org) dla tej aplikacji; można go użyć tylko raz';

  @override
  String get skipFromTotals => 'Wyklucz z sumy';

  @override
  String get skipTooltip => 'Pomiń kroki';

  @override
  String get sortTooltip => 'Sortuj elementy';

  @override
  String get sortingAmountAsc => 'Kwota rosnąco';

  @override
  String get sortingAmountDesc => 'Kwota malejąco';

  @override
  String get sortingCreatedAtAsc => 'Utworzono rosnąco';

  @override
  String get sortingCreatedAtDesc => 'Utworzono malejąco';

  @override
  String get sortingTitleAsc => 'Tytuł rosnąco';

  @override
  String get sortingTitleDesc => 'Tytuł malejąco';

  @override
  String get sortingUpdatedAtAsc => 'Aktualizacja rosnąco';

  @override
  String get sortingUpdatedAtDesc => 'Aktualizacja malejąco';

  @override
  String get spent => 'zużyty';

  @override
  String get splitCancelTooltip => 'Anuluj podział na miesiąc';

  @override
  String get splitHeadline => 'Podziel rachunek';

  @override
  String get splitTooltip => 'Deklarowanie limitów na miesiąc';

  @override
  String get starlingDescription =>
      'Import sald i transakcji kont Starling Bank za pomocą osobistego tokena dostępu z Twojego bezpłatnego konta deweloperskiego. Dostęp tylko do odczytu: nie są wykonywane żadne płatności.';

  @override
  String get starlingHeadline =>
      'Starling Bank Personal Access (Wielka Brytania)';

  @override
  String get starlingScopes =>
      'Tokenowi brakuje uprawnienia: utwórz go z zakresami \"account:read\", \"balance:read\" i \"transaction:read\"';

  @override
  String get starlingToken => 'Osobisty token dostępu';

  @override
  String get starlingTokenSteps =>
      'Jak uzyskać osobisty token dostępu:\n1. Zarejestruj się na developer.starlingbank.com (bezpłatnie)\n2. Otwórz Personal Access, dodaj swoje konto Starling i zatwierdź je w aplikacji Starling\n3. Utwórz token z zakresami \"account:read\", \"balance:read\" i \"transaction:read\"\n4. Wklej go poniżej i naciśnij „Połącz”';

  @override
  String get starlingTokenTooltip =>
      'Tworzony na developer.starlingbank.com w sekcji Personal Access; przechowywany w postaci zaszyfrowanej';

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
  String get tellerAccessToken => 'Token dostępu';

  @override
  String get tellerAccessTokenTooltip =>
      'Wyświetlany na stronie połączenia po powiązaniu banku: wklej go tutaj, jeśli Fingrom nie został otwarty automatycznie';

  @override
  String get tellerAppId => 'ID aplikacji';

  @override
  String get tellerAppIdTooltip =>
      'Wyświetlany w Teller Dashboard, zaczyna się od \"app_\"';

  @override
  String get tellerCertificate => 'Certyfikat (PEM)';

  @override
  String get tellerCertificateInvalid =>
      'Nieprawidłowy certyfikat: oczekiwano bloku PEM \"CERTIFICATE\"';

  @override
  String get tellerCertificateTooltip =>
      'Wystawiany w Teller Dashboard (Certificates); przechowywany w postaci zaszyfrowanej. Pozostaw puste, aby zachować zapisany certyfikat';

  @override
  String get tellerConnectBank => 'Połącz bank';

  @override
  String get tellerConnectPage => 'Strona połączenia';

  @override
  String get tellerConnectPageTooltip =>
      'Otwiera Teller Connect w przeglądarce i zwraca token dostępu do Fingrom';

  @override
  String get tellerDescription =>
      'Import sald i transakcji z amerykańskich banków i od wydawców kart przez Teller z własną aplikacją zarejestrowaną w teller.io (bezpłatny plan pozwala na 100 rzeczywistych połączeń z bankami). Dostęp tylko do odczytu: żadne płatności nie są wykonywane.';

  @override
  String get tellerDisconnected =>
      'Połączenie z bankiem wymaga Twojej uwagi (np. ponownego logowania lub kodu potwierdzającego): połącz bank ponownie';

  @override
  String get tellerEnvironment => 'Środowisko';

  @override
  String get tellerHeadline => 'Teller (US)';

  @override
  String get tellerIncomplete =>
      'Uzupełnij ID aplikacji; certyfikat i klucz prywatny są wymagane dla rzeczywistych danych bankowych';

  @override
  String get tellerKey => 'Klucz prywatny (PEM)';

  @override
  String get tellerKeyInvalid =>
      'Nieprawidłowy klucz prywatny: oczekiwano bloku PEM \"PRIVATE KEY\"';

  @override
  String get tellerKeyTooltip =>
      'Pobierany razem z certyfikatem; przechowywany w postaci zaszyfrowanej. Pozostaw puste, aby zachować zapisany klucz';

  @override
  String get tellerMissingCertificate =>
      'Teller odrzucił żądanie bez certyfikatu klienta: prześlij certyfikat i klucz prywatny lub wybierz sandbox';

  @override
  String get tellerSteps =>
      'Jak połączyć:\n1. Zarejestruj się w teller.io i otwórz Teller Dashboard\n2. Skopiuj ID aplikacji, a następnie utwórz i pobierz certyfikat z kluczem prywatnym (Certificates)\n3. Wypełnij je poniżej i wybierz środowisko (sandbox: dane testowe, zaloguj się do banku jako \"username\" z hasłem \"password\")\n4. Naciśnij „Połącz bank” i zaloguj się do swojego banku na otwartej stronie\n5. Wybierz konto i kategorię budżetu, a następnie naciśnij „Importuj transakcje”';

  @override
  String get tellerUpload => 'Prześlij plik';

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
  String get wiseDescription =>
      'Import sald i transakcji wielowalutowych kont Wise za pomocą osobistego tokena API. Przewalutowania między powiązanymi saldami są importowane jako przelewy. Dostęp tylko do odczytu: nie są wykonywane żadne płatności.';

  @override
  String get wiseHeadline => 'Wise API (Global)';

  @override
  String get wiseNoProfiles => 'Dla tokena nie są dostępne żadne profile Wise';

  @override
  String get wiseProfile => 'Profil';

  @override
  String get wiseScaRequired =>
      'Wise wymaga silnego uwierzytelnienia klienta: otwórz wyciąg tego salda w aplikacji Wise i spróbuj ponownie';

  @override
  String get wiseToken => 'Osobisty token API';

  @override
  String get wiseTokenSteps =>
      'Jak uzyskać osobisty token API:\n1. Zaloguj się na wise.com w przeglądarce (w aplikacji mobilnej nie można tworzyć tokenów)\n2. Otwórz Ustawienia → Integracje i narzędzia → Tokeny API\n3. Wybierz „Dodaj nowy token”, nadaj nazwę (np. Fingrom) i wybierz dostęp „Tylko do odczytu”\n4. Potwierdź weryfikacją dwuetapową i skopiuj token\n5. Wklej go poniżej i naciśnij „Połącz”';

  @override
  String get wiseTokenTooltip =>
      'Tworzony w Wise w Ustawienia → Tokeny API (tylko do odczytu, jeśli dostępne); przechowywany w postaci zaszyfrowanej';

  @override
  String get zoomState => 'Powiększanie / pomniejszanie';
}
