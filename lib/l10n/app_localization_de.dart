// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for German (`de`).
class AppLocalizationsDe extends AppLocalizations {
  AppLocalizationsDe([String locale = 'de']) : super(locale);

  @override
  String get a =>
      'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => 'Über';

  @override
  String get account => 'Account';

  @override
  String get accountFrom => 'Von Konto';

  @override
  String get accountHeadline => 'Konten';

  @override
  String get accountTo => 'Nach Konto';

  @override
  String get accountTooltip => 'Offene Konten';

  @override
  String get accountType => 'Kontoart';

  @override
  String get accountTypeTooltip => 'Kontotyp wählen';

  @override
  String get acknowledgeTooltip => 'Bestätigen Sie';

  @override
  String get activate => 'Aktivieren Sie';

  @override
  String get actualData => 'Historische Daten';

  @override
  String get addAccountTooltip => 'Konto hinzufügen';

  @override
  String get addBudgetTooltip => 'Neue Budgetkategorie hinzufügen';

  @override
  String get addGoalTooltip => 'Neues Ziel hinzufügen';

  @override
  String get addMainTooltip =>
      'Rechnung, Einkommen oder Überweisung hinzufügen';

  @override
  String afterNDays(Object value) {
    return 'nach $value Tagen';
  }

  @override
  String get akahuAppToken => 'App-ID-Token';

  @override
  String get akahuDescription =>
      'Salden und Umsätze von mit Akahu verbundenen neuseeländischen Banken mit Ihrer eigenen kostenlosen persönlichen App importieren. Akahu aktualisiert die Daten der Banken nach eigenem Zeitplan (täglich), daher können die neuesten Umsätze später erscheinen. Der Zugriff ist nur lesend: Es werden keine Zahlungen ausgeführt.';

  @override
  String get akahuHeadline => 'Akahu Personal App (Neuseeland)';

  @override
  String get akahuInactive =>
      'Akahu hat den Zugriff auf dieses Konto verloren: Verbinden Sie es unter my.akahu.nz/connections erneut';

  @override
  String get akahuIncomplete =>
      'App-ID-Token und Benutzer-Zugriffstoken ausfüllen';

  @override
  String get akahuRefresh => 'Daten aktualisieren';

  @override
  String get akahuRefreshed =>
      'Akahu wurde gebeten, neue Daten von den Banken abzurufen: Wiederholen Sie den Import in einigen Minuten (höchstens einmal pro Stunde)';

  @override
  String get akahuSteps =>
      'So erhalten Sie die Tokens:\n1. Registrieren Sie sich auf my.akahu.nz und verbinden Sie Ihre Banken\n2. Öffnen Sie die Seite „Developers“, akzeptieren Sie die Entwicklerbedingungen und richten Sie die Multi-Faktor-Authentifizierung ein\n3. Kopieren Sie das App-ID-Token und das Benutzer-Zugriffstoken\n4. Fügen Sie sie unten ein und tippen Sie auf „Verbinden“';

  @override
  String get akahuTokenTooltip =>
      'Wird auf my.akahu.nz auf der Seite „Developers“ angezeigt; verschlüsselt gespeichert';

  @override
  String get akahuUserToken => 'Benutzer-Zugriffstoken';

  @override
  String get amountFrom => 'Von-Betrag';

  @override
  String get amountTo => 'Bis-Betrag';

  @override
  String appBuild(Object build) {
    return 'Erstellen: $build';
  }

  @override
  String get appInitHeadline => 'Projekt-Initialisierung';

  @override
  String get appStartHeadline => 'Ersteinrichtung';

  @override
  String get appTitle => 'Fingrom';

  @override
  String appVersion(Object version) {
    return 'Version: $version';
  }

  @override
  String get automationHeadline => 'Automatisierung';

  @override
  String get automationTypeDays => 'nach einigen Tagen';

  @override
  String get backTooltip => 'Rückgabe';

  @override
  String get balance => 'Aktueller Saldo';

  @override
  String get balanceDate => 'Datum der Aktualisierung des Saldos';

  @override
  String get balanceDateTooltip =>
      'Ausgaben und Einnahmen vor diesem Datum haben keinen Einfluss auf den Saldo';

  @override
  String get balanceTooltip => 'Saldo festlegen';

  @override
  String get bankAccount => 'Bankkonto';

  @override
  String get bill => 'Rechnung';

  @override
  String get billHeadline => 'Rechnungen';

  @override
  String get billSetTooltip => 'Betrag einstellen';

  @override
  String billSum(Object value) {
    return 'Rechnungen: $value';
  }

  @override
  String get billTooltip => 'Offene Rechnungen';

  @override
  String get billTypeTooltip => '[Typ] Rechnung, Einkommen oder Überweisung';

  @override
  String get brightnessTheme => 'Helligkeit Thema';

  @override
  String get btnAdd => 'Hinzufügen';

  @override
  String get btnCancel => 'Abbrechen';

  @override
  String get btnConfirm => 'Bestätigen';

  @override
  String get btnMore => 'Mehr';

  @override
  String get budget => 'Kategorie Budget';

  @override
  String get budgetHeadline => 'Budgets';

  @override
  String get budgetLimit => 'Limit pro Monat';

  @override
  String get budgetLimitHeadline => 'Limit-Anpassungen';

  @override
  String get budgetPositive => 'Budget, Zusammenfassungs-Handler';

  @override
  String get budgetPositiveOff => 'Negative Werte ignorieren';

  @override
  String get budgetPositiveOn => 'Negative Werte einbeziehen';

  @override
  String get budgetRelativeLimit => 'Relativer Koeffizient pro Monat';

  @override
  String get budgetTooltip => 'Offene Budgetarten';

  @override
  String get budgetType => 'Intervall der Budgetierung';

  @override
  String get budgetTypeAsIs => 'Unbegrenzt';

  @override
  String get budgetTypeFixed => 'Festgelegt';

  @override
  String get budgetTypeMonth => 'Monatlich';

  @override
  String get budgetTypeRelative => 'Relativ';

  @override
  String get budgetTypeWeek => 'Wöchentlich';

  @override
  String get budgetTypeYear => 'Jährlich';

  @override
  String get cash => 'Bargeld';

  @override
  String get chartBarRace => 'Balkenrennen für Kategorien';

  @override
  String get chartForecast => 'Vorhersage-Chart';

  @override
  String get chartOHLC => 'Candlestick (OHLC) Diagramm';

  @override
  String get chartYtdExpense => 'YTD-Ausgaben';

  @override
  String get clear => 'Wert fallen lassen';

  @override
  String get closeTooltip => 'Schließen';

  @override
  String get closedAt => 'Abgeschlossen bis Datum';

  @override
  String get cmpChart => 'Diagramme';

  @override
  String get cmpRecent => 'Neueste Positionen';

  @override
  String get cmpRecentCount => 'Liste Größe';

  @override
  String get coAuthor => 'Autor';

  @override
  String get coConsult => 'Beraterin';

  @override
  String get coDeveloper => 'Entwickler';

  @override
  String get coNew => 'Beitreten';

  @override
  String get coPromoter => 'Projektträger';

  @override
  String get coTranslator => 'Übersetzer';

  @override
  String get coef => 'Koeff.';

  @override
  String get collapse => 'Ausschnitt komprimieren (wiederherstellen)';

  @override
  String get color => 'Farbe';

  @override
  String get colorApp => 'Benutzerdefiniert';

  @override
  String get colorBackground => 'Hintergrund';

  @override
  String get colorDark => 'Dunkel';

  @override
  String get colorInversePrimary => 'Invers Primär';

  @override
  String get colorInverseSurface => 'Inverse Oberfläche';

  @override
  String get colorLight => 'Hell';

  @override
  String get colorOnInverseSurface => 'Auf Inverser Oberfläche';

  @override
  String get colorOnSecondary => 'Auf Sekundär';

  @override
  String get colorOnSecondaryContainer => 'Auf Behälter';

  @override
  String get colorPrimary => 'Primär';

  @override
  String get colorRestore => 'Palette zurücksetzen';

  @override
  String get colorSecondary => 'Sekundär';

  @override
  String get colorSystem => 'Standard';

  @override
  String get colorTheme => 'Palette';

  @override
  String get colorTooltip => 'Wählen Sie eine Farbe';

  @override
  String get colorType => 'Farbe Typ';

  @override
  String get colorUser => 'Persönlich';

  @override
  String columnMap(Object value) {
    return 'Mapping für Spalte \'$value\'';
  }

  @override
  String columnMapTooltip(Object value) {
    return '\'$value\' - Spaltenzuordnung auswählen';
  }

  @override
  String get completeGoalTooltip => 'Ziel abschließen';

  @override
  String get confirmHeader => 'Aktion bestätigen';

  @override
  String get confirmTooltip =>
      'Sind Sie sicher? Diese Aktion kann nicht rückgängig gemacht werden.';

  @override
  String get contributors => 'Beitragende';

  @override
  String get conversion => 'Umrechnung';

  @override
  String conversionMessage(Object currency) {
    return 'Umgerechnet in $currency';
  }

  @override
  String get copiedToClipboard => 'In die Zwischenablage kopiert';

  @override
  String get createAccountHeader => 'Neues Konto erstellen';

  @override
  String get createAccountTooltip => 'Neues Konto erstellen';

  @override
  String get createBillHeader => 'Neue Transaktion erstellen';

  @override
  String get createBillTooltip => 'Neue Rechnung hinzufügen';

  @override
  String get createBudgetHeader => 'Neue Budgetkategorie';

  @override
  String get createBudgetTooltip => 'Neue Budgetkategorie erstellen';

  @override
  String get createGoalHeader => 'Neues Ziel erstellen';

  @override
  String get createGoalTooltip => 'Neues Ziel hinzufügen';

  @override
  String get createIncomeTooltip => 'Neue Einnahme hinzufügen';

  @override
  String get createPaymentTooltip => 'Neue Zahlung hinzufügen';

  @override
  String get createTransferTooltip => 'Übertragung erstellen';

  @override
  String get credit => 'Kredit';

  @override
  String get creditCard => 'Kreditkarte';

  @override
  String get currency => 'Währung';

  @override
  String get currencyAddHeadline => 'Währungsumtausch';

  @override
  String get currencyAddTooltip => 'Devisenkurs hinzufügen';

  @override
  String get currencyDefault => 'Standardwährung';

  @override
  String get currencyDistribution => 'Vertrieb';

  @override
  String currencyExchange(Object from, Object to) {
    return 'Währungsumtausch: $from -> $to';
  }

  @override
  String get currencyHeadline => 'Währungen';

  @override
  String currencyIn(Object value) {
    return 'In $value';
  }

  @override
  String get currencyShort => 'Währungen.';

  @override
  String get currencyTooltip => 'Währungstyp (Code)';

  @override
  String get currencyUpdateTooltip => 'Währungskurs aktualisieren';

  @override
  String get currentDate => 'Aktuelles Datum Zeiger';

  @override
  String get customAddTooltip => 'Widget hinzufügen';

  @override
  String get customDeleteTooltip => 'Anpassung löschen';

  @override
  String get customSaveTooltip => 'Anpassung speichern';

  @override
  String get customizeTooltip => 'Seite anpassen';

  @override
  String get darkMode => 'Dunkel';

  @override
  String get dateFormat => 'Datumsformat';

  @override
  String get dateRange => 'Datumsbereich';

  @override
  String get dateTooltip => 'Datum auswählen';

  @override
  String get dayMonday => 'Montag';

  @override
  String get daySaturday => 'Samstag';

  @override
  String get dayStartOfMonth => 'Anfang des Monats';

  @override
  String get dayStartOfWeek => 'Beginn der Woche';

  @override
  String get daySunday => 'Sonntag';

  @override
  String get deactivateAction => 'Passwortschutz deaktivieren';

  @override
  String get debitCard => 'Debitkarte';

  @override
  String def(Object value) {
    return 'Standardwert für \'$value\'';
  }

  @override
  String get deleteAccountTooltip => 'Konto deaktivieren';

  @override
  String get deleteBillTooltip => 'Rechnung löschen';

  @override
  String get deleteBudgetTooltip => 'Budgetkategorie deaktivieren';

  @override
  String get deleteGoalTooltip => 'Ziel löschen';

  @override
  String get deleteInvoiceTooltip => 'Rechnung löschen';

  @override
  String get deletePaymentTooltip => 'Zahlung löschen';

  @override
  String get deleteTooltip => 'löschen';

  @override
  String get deleteTransferTooltip => 'Überweisung löschen';

  @override
  String get deposit => 'Einzahlen';

  @override
  String get description => 'Beschreibung';

  @override
  String get descriptionTooltip => 'Ausgabendetails festlegen';

  @override
  String get design => 'Designmodus (kulturspezifisch)';

  @override
  String get designAsiaGeneral => 'Asien Allgemein';

  @override
  String get designGermany => 'Deutschland';

  @override
  String get designGlobal => 'Weltweit';

  @override
  String get designRtlGeneral => 'Rechts-nach-links-Beschriftung';

  @override
  String get details => 'Einzelheiten';

  @override
  String get detailsTooltip => '****2345 - letzte 4 Ziffern der Nummer';

  @override
  String get dtAm => 'am';

  @override
  String get dtAmPm => 'Stunde in am/pm (0~11)';

  @override
  String get dtDay => 'Tag im Monat';

  @override
  String get dtEscape => 'Escape für Text';

  @override
  String get dtHalfHour => 'Stunde in am/pm (1~12)';

  @override
  String get dtHour => 'Stunde in Tag (0~23)';

  @override
  String get dtMinute => 'Minute in Stunde';

  @override
  String get dtMonth => 'Monat im Jahr';

  @override
  String get dtNamedDay => 'Tag der Woche';

  @override
  String get dtPm => 'pm';

  @override
  String get dtQuote => 'einfaches Anführungszeichen';

  @override
  String get dtSecond => 'Sekunde in Minute';

  @override
  String get dtYear => 'Jahr';

  @override
  String get editAccountHeader => 'Konto aktualisieren';

  @override
  String get editAccountTooltip => 'Konto bearbeiten';

  @override
  String get editBillHeader => 'Rechnung aktualisieren';

  @override
  String get editBillTooltip => 'Rechnung bearbeiten';

  @override
  String get editBudgetHeader => 'Budgetkategorie aktualisieren';

  @override
  String get editBudgetTooltip => 'Budgetkategorie bearbeiten';

  @override
  String get editGoalHeader => 'Ziel aktualisieren';

  @override
  String get editGoalTooltip => 'Ziel bearbeiten';

  @override
  String get editInvoiceTooltip => 'Rechnung bearbeiten';

  @override
  String get editPaymentTooltip => 'Zahlung bearbeiten';

  @override
  String get editTooltip => 'bearbeiten';

  @override
  String get editTransferTooltip => 'Überweisung bearbeiten';

  @override
  String get enableBankingAppId => 'Anwendungs-ID';

  @override
  String get enableBankingBank => 'Bank';

  @override
  String get enableBankingCode => 'Adresse der Seite nach der Autorisierung';

  @override
  String get enableBankingCodeTooltip =>
      'Bestätigen Sie den Zugriff bei der Bank, kopieren Sie dann die Adresse aus dem Browser und fügen Sie sie hier ein';

  @override
  String get enableBankingCountry => 'Land (ISO-Code, z. B. DE)';

  @override
  String get enableBankingDescription =>
      'Salden und Umsätze europäischer Banken über die Enable Banking API (PSD2) mit Ihrer eigenen, bei enablebanking.com registrierten Anwendung importieren. Der Zugriff ist nur lesend: Es werden keine Zahlungen ausgeführt.';

  @override
  String get enableBankingHeadline => 'Enable Banking (EU)';

  @override
  String get enableBankingIncomplete =>
      'Anwendungs-ID, privaten Schlüssel, Weiterleitungs-URL und Land ausfüllen';

  @override
  String get enableBankingKey => 'Privater Schlüssel (PEM)';

  @override
  String get enableBankingKeyInvalid =>
      'Ungültiger privater Schlüssel: Ein PEM-Block \"PRIVATE KEY\" wird erwartet';

  @override
  String get enableBankingKeyNotRsa =>
      'Ungültiger privater Schlüssel: Ein RSA-Schlüssel wird erwartet';

  @override
  String get enableBankingKeyTooltip =>
      'Mit der Anwendung im Enable Banking Control Panel erstellt; verschlüsselt gespeichert. Leer lassen, um den gespeicherten Schlüssel zu behalten';

  @override
  String get enableBankingLoadBanks => 'Banken laden';

  @override
  String get enableBankingNoAuthPage =>
      'Enable Banking hat keine Autorisierungsseite geliefert';

  @override
  String get enableBankingNoCode =>
      'In der Adresse wurde kein Autorisierungscode gefunden';

  @override
  String get enableBankingRedirect => 'Weiterleitungs-URL';

  @override
  String get enableBankingRedirectTooltip =>
      'Für die Anwendung registriert; die Bank leitet nach der Autorisierung dorthin zurück';

  @override
  String get enableBankingStateMismatch =>
      'Die Adresse gehört zu einer anderen Autorisierung, bitte erneut verbinden';

  @override
  String get encryptionMode => 'Daten verschlüsseln';

  @override
  String error(Object value) {
    return 'Fehler: $value';
  }

  @override
  String get errorExpired => 'Karte abgelaufen';

  @override
  String get errorNegative =>
      'Kann nicht negativ sein! Bitte beheben Sie den Fehler';

  @override
  String get example => 'Beispiel';

  @override
  String get expand => 'Abschnitt erweitern';

  @override
  String get expense => 'Betrag der Ausgaben';

  @override
  String get expenseDateTime => 'Abgerechnet zu';

  @override
  String get expenseHeadline => 'Aufwand';

  @override
  String get expenseTransfer => 'Betrag der Übertragung';

  @override
  String exportFile(Object value) {
    return 'Exportieren als .$value-Datei';
  }

  @override
  String get failData => 'Abgezogener Betrag';

  @override
  String get finTsApproved => 'In der Banking-App freigegeben';

  @override
  String get finTsBankCode => 'Bankleitzahl (BLZ)';

  @override
  String get finTsCustomerId =>
      'Kunden-ID (falls abweichend von der Benutzerkennung)';

  @override
  String get finTsDescription =>
      'Salden und Umsätze von Banken mit FinTS 4.1 (PIN/TAN) importieren. Der Zugriff ist nur lesend: Es werden keine Zahlungen ausgeführt.';

  @override
  String get finTsHeadline => 'Financial Transaction Services (FinTS 4.1)';

  @override
  String get finTsIncomplete =>
      'Server-URL, Bankleitzahl, Benutzerkennung und Produktregistrierungsnummer ausfüllen';

  @override
  String finTsLoginChanged(Object value) {
    return 'Die Bank hat die Zugangsdaten geändert, Benutzerkennung oder Kunden-ID aktualisieren: $value';
  }

  @override
  String finTsLoginRefused(Object value) {
    return 'Die Bank hat die vorherige Anmeldung abgelehnt: $value. Mit der eingegebenen PIN erneut versuchen?';
  }

  @override
  String get finTsPin => 'PIN';

  @override
  String get finTsPinHint =>
      'Nur für diese Sitzung verwendet und nie gespeichert';

  @override
  String get finTsProductId => 'Produktregistrierungsnummer';

  @override
  String get finTsProductIdTooltip =>
      'Von der Deutschen Kreditwirtschaft an den Hersteller der Anwendung vergeben';

  @override
  String get finTsTan => 'TAN';

  @override
  String get finTsTanHeadline => 'Transaktionsauthentifizierung (TAN)';

  @override
  String get finTsTanMedium => 'TAN-Medium auswählen';

  @override
  String get finTsTanMethod => 'TAN-Verfahren auswählen';

  @override
  String get finTsUrl => 'FinTS-Server-URL der Bank';

  @override
  String get finTsUserId => 'Benutzerkennung (Login)';

  @override
  String get finTsVersion => 'Protokollversion';

  @override
  String get finTsWebUnsupported =>
      'Bankserver erlauben keinen Zugriff aus dem Browser. Bitte die Desktop- oder Mobil-App verwenden.';

  @override
  String get flowTypeInvoice => 'Rechnung';

  @override
  String get flowTypeTooltip => 'Betragsart: Rechnung, Fakturierung';

  @override
  String get forecastData => 'Vorhersage';

  @override
  String get from => 'von';

  @override
  String get goNextTooltip => 'Weiter';

  @override
  String get goalHeadline => 'Ziele';

  @override
  String goalProfit(Object value) {
    return 'Zielvorgabe: $value';
  }

  @override
  String get goalProfitTooltip => 'Gewinn vs. Zielvorgabe';

  @override
  String get goalTooltip => 'Offene Ziele';

  @override
  String get hasEncrypted => 'Einmal gesetzt, kann nicht geändert werden';

  @override
  String get helpTooltip => '[Hilfe] Beschreibung der Seite anzeigen';

  @override
  String get homeHeadline => 'Startseite';

  @override
  String get homeTooltip => 'Zurück zur Hauptseite';

  @override
  String get hour => 'Stunde';

  @override
  String get icon => 'Icon';

  @override
  String get iconTooltip => 'Icon auswählen';

  @override
  String get ignoreTooltip => 'Ignorieren';

  @override
  String get importHeadline => 'Einfuhr/Ausfuhr';

  @override
  String get income => 'Betrag des Einkommens';

  @override
  String get incomeHeadline => 'Einkommen';

  @override
  String get incomeHealth => 'Einkommens-Gesundheitsradar';

  @override
  String get incomeTooltip => 'Einkommensdetails festlegen';

  @override
  String get integrationAccessDenied =>
      'Der Zugriff wurde widerrufen oder die Zugangsdaten sind falsch';

  @override
  String get integrationConnect => 'Verbinden';

  @override
  String get integrationDateFrom => 'Umsätze importieren ab';

  @override
  String get integrationDefaultBudgetCategory => 'Standard-Budgetkategorie';

  @override
  String get integrationDisconnect => 'Trennen';

  @override
  String get integrationForget => 'Zugriff vergessen';

  @override
  String get integrationHeadline => 'Integrationen';

  @override
  String integrationHttpError(Object value) {
    return 'Der Dienst hat mit einem Fehler geantwortet (HTTP $value)';
  }

  @override
  String get integrationHttpsRequired =>
      'Nur sichere Adressen (HTTPS) sind erlaubt';

  @override
  String get integrationImport => 'Umsätze importieren';

  @override
  String integrationImported(Object added, Object pending, Object skipped) {
    return 'Importiert: $added, als bereits vorhanden übersprungen: $skipped, vorgemerkt (nicht importiert): $pending';
  }

  @override
  String integrationInvalidAmount(Object value) {
    return 'Ungültiger Betrag: $value';
  }

  @override
  String get integrationNoAccounts => 'Die Bank hat keine Konten übermittelt';

  @override
  String get integrationPaymentRequired =>
      'Der Dienst verlangt eine Zahlung für den Zugriff';

  @override
  String get integrationSelectTarget =>
      'Konto und Budgetkategorie für den Import auswählen';

  @override
  String integrationServiceError(Object value) {
    return 'Meldung des Dienstes: $value';
  }

  @override
  String get integrationUnexpectedResponse =>
      'Unerwartete Antwort des Dienstes';

  @override
  String get investecApiKey => 'API-Schlüssel';

  @override
  String get investecClientId => 'Client-ID';

  @override
  String get investecCredentialsTooltip =>
      'Wird in Investec Online unter Investec Developer → API keys erstellt; verschlüsselt gespeichert';

  @override
  String get investecDescription =>
      'Salden und Umsätze von Konten bei Investec Private Banking (Südafrika) über die Programmable Banking API mit eigenen API-Schlüsseln importieren. Der Zugriff ist nur lesend: Es werden keine Zahlungen ausgeführt.';

  @override
  String get investecHeadline => 'Investec Programmable Banking (Südafrika)';

  @override
  String get investecIncomplete =>
      'Client-ID, Client-Secret und API-Schlüssel ausfüllen';

  @override
  String get investecSandbox => 'Sandbox (Testdaten)';

  @override
  String get investecSecret => 'Client-Secret';

  @override
  String get investecSteps =>
      'So erhalten Sie die API-Schlüssel:\n1. Melden Sie sich bei Investec Online an und registrieren Sie sich für Investec Developer (Programmable Banking)\n2. Öffnen Sie API keys und erstellen Sie einen Schlüssel mit Zugriff auf Konten und Umsätze\n3. Bestätigen Sie ihn mit der Zwei-Faktor-Verifizierung und kopieren Sie die Client-ID, das Client-Secret und den API-Schlüssel\n4. Fügen Sie sie unten ein und tippen Sie auf „Verbinden“';

  @override
  String get invoiceHeadline => 'Rechnungen';

  @override
  String invoiceSum(Object value) {
    return 'Rechnungen: $value';
  }

  @override
  String get isCleaned => 'Vorhandene Daten entfernen';

  @override
  String get isCreated =>
      'Bereits erstellt, folgen Sie den nächsten Schritten!';

  @override
  String get isEncrypted => 'Datei ist verschlüsselt (standardmäßig)';

  @override
  String get isRequired => 'erforderlich';

  @override
  String get language => 'Sprache';

  @override
  String get left => 'links';

  @override
  String get lightMode => 'Leicht';

  @override
  String get link => 'Uniform Resource Locator (URL)';

  @override
  String get managerHeadline => 'Manager';

  @override
  String get meaning => 'Bedeutung';

  @override
  String get metricsHeadline => 'Metriken';

  @override
  String get metricsTooltip => 'Metriken';

  @override
  String get milestones => 'Meilensteine';

  @override
  String get minute => 'Minute';

  @override
  String get missingContent =>
      'Datei kann nicht verarbeitet werden (entweder abgebrochen)';

  @override
  String get monobankCreateAccount => 'Konto erstellen';

  @override
  String get monobankDescription =>
      'Import von Salden und Umsätzen der Karten und Sparbüchsen („Banky“) von monobank mit einem persönlichen Token. monobank erlaubt eine Anfrage pro Minute: Der Import eines langen Zeitraums dauert einige Minuten. Nur Lesezugriff: Es werden keine Zahlungen ausgeführt.';

  @override
  String get monobankHeadline => 'monobank Personal API (Ukraine)';

  @override
  String get monobankJar => 'Sparbüchse';

  @override
  String monobankProgress(Object done, Object total) {
    return 'Kontoauszüge werden abgerufen: $done von $total';
  }

  @override
  String monobankRateLimit(Object value) {
    return 'monobank erlaubt eine Anfrage pro Minute: die nächste in $value s';
  }

  @override
  String get monobankToken => 'Persönliches Token';

  @override
  String get monobankTokenSteps =>
      'So erhalten Sie ein persönliches Token:\n1. Öffnen Sie api.monobank.ua im Browser\n2. Scannen Sie den QR-Code mit der monobank-App und bestätigen Sie den Zugriff\n3. Kopieren Sie das Token von der Seite\n4. Fügen Sie es unten ein und drücken Sie „Verbinden“\n5. Verknüpfen Sie jede Karte oder Sparbüchse mit einem Konto (oder erstellen Sie eines) und importieren Sie';

  @override
  String get monobankTokenTooltip =>
      'Wird auf api.monobank.ua nach dem Scannen des QR-Codes in der monobank-App ausgestellt; verschlüsselt gespeichert';

  @override
  String get monzoApprove =>
      'Bestätigen Sie den Zugriff in der Monzo-App und tippen Sie dann erneut auf „Verbinden“';

  @override
  String get monzoClientId => 'Client-ID';

  @override
  String get monzoClientSecret => 'Client-Secret';

  @override
  String get monzoClientSecretTooltip =>
      'Wird für den OAuth-Client auf developers.monzo.com angezeigt; verschlüsselt gespeichert. Leer lassen, um das gespeicherte Secret zu behalten';

  @override
  String get monzoCode => 'Adresse der Seite nach der Anmeldung';

  @override
  String get monzoCodeTooltip =>
      'Wenn Fingrom nicht automatisch geöffnet wurde, kopieren Sie die Adresse aus dem Browser und fügen Sie sie hier ein';

  @override
  String get monzoDescription =>
      'Salden und Umsätze von Monzo-Konten mit einem eigenen, auf developers.monzo.com registrierten OAuth-Client importieren (nur für den persönlichen Gebrauch). Der Zugriff ist nur lesend: Es werden keine Zahlungen ausgeführt.';

  @override
  String get monzoExpired =>
      'Der Zugriff auf Monzo ist abgelaufen: bitte erneut verbinden';

  @override
  String monzoFullHistory(Object value) {
    return 'Der vollständige Verlauf ist bis $value verfügbar: Wählen Sie ein früheres Datum und importieren Sie jetzt. Danach stellt Monzo nur die letzten 90 Tage bereit';
  }

  @override
  String get monzoHeadline => 'Monzo Developer API (Vereinigtes Königreich)';

  @override
  String monzoHistoryLimited(Object value) {
    return 'Monzo stellt nur die letzten 90 Tage bereit: Umsätze werden ab $value importiert';
  }

  @override
  String get monzoIncomplete =>
      'Client-ID, Client-Secret und Weiterleitungs-URL ausfüllen';

  @override
  String get monzoRedirect => 'Weiterleitungs-URL';

  @override
  String get monzoRedirectTooltip =>
      'Genau diese Adresse für den OAuth-Client festlegen; Monzo leitet nach der Anmeldung dorthin zurück';

  @override
  String get monzoSteps =>
      'So verbinden Sie sich:\n1. Melden Sie sich bei developers.monzo.com mit der E-Mail-Adresse Ihres Monzo-Kontos an\n2. Öffnen Sie Clients → New OAuth Client, wählen Sie „Confidential“ und legen Sie die unten angezeigte Weiterleitungs-URL fest\n3. Kopieren Sie die Client-ID und das Client-Secret, fügen Sie sie unten ein und tippen Sie auf „Verbinden“\n4. Öffnen Sie den per E-Mail gesendeten Link, bestätigen Sie den Zugriff in der Monzo-App und tippen Sie erneut auf „Verbinden“\n5. Sofort importieren: Der vollständige Verlauf ist nur 5 Minuten nach der Bestätigung verfügbar, danach nur die letzten 90 Tage';

  @override
  String get navigationTooltip => 'Hauptmenü öffnen';

  @override
  String netProfit(Object value) {
    return 'Gewinn: $value';
  }

  @override
  String get noChartData =>
      'Daten fehlen (oder sind nicht ausreichend) um angezeigt zu werden';

  @override
  String get notificationAccessSettings => 'Benachrichtigungszugriff';

  @override
  String get notificationAccessSteps =>
      'So wird der Zugriff gewährt:\n1. \"Zugriff gewähren\" drücken, um die Systemeinstellungen zu öffnen\n2. Fingrom das Lesen von Benachrichtigungen erlauben\n3. Meldet Android eine eingeschränkte Einstellung: App-Info von Fingrom → ⋮ → \"Eingeschränkte Einstellungen zulassen\" öffnen und erneut versuchen\n4. Zu Fingrom zurückkehren und die Apps auswählen, deren Benachrichtigungen gelesen werden';

  @override
  String get notificationAccounts => 'Konto-Schlüsselwörter';

  @override
  String get notificationAccountsTooltip =>
      'Wörter, an denen das Konto in einer Benachrichtigung erkannt wird (letzte Kartenziffern, Name der Wallet): Wort eingeben und mit Enter hinzufügen. Sonst wird das Standardkonto der App verwendet';

  @override
  String get notificationApps =>
      'Apps, deren Benachrichtigungen gelesen werden';

  @override
  String notificationAutoImported(Object value) {
    return 'Aus Benachrichtigungen hinzugefügt: $value';
  }

  @override
  String get notificationAutoTooltip =>
      'Erkannte Benachrichtigungen werden ohne Bestätigung hinzugefügt: sofort, während Fingrom läuft, sonst beim nächsten Start. Nicht erkannte warten auf eine Prüfung';

  @override
  String get notificationBalance => 'Kontostand-Schlüsselwörter';

  @override
  String get notificationBalanceTooltip =>
      'Wörter vor einem zu ignorierenden Betrag (Kontostand, Limit): Wort eingeben und mit Enter hinzufügen';

  @override
  String notificationCaptured(Object value) {
    return 'Erfasste Benachrichtigungen: $value';
  }

  @override
  String get notificationClear => 'Erfasste löschen';

  @override
  String get notificationCurrencyTooltip =>
      'Beträge ohne Währung (z. B. Belastung 20,00) werden in dieser Währung erfasst';

  @override
  String get notificationDefaultAccount => 'Standardkonto';

  @override
  String get notificationDescription =>
      'Umsätze aus Benachrichtigungen von Banking- und Zahlungs-Apps auf diesem Gerät erstellen. Es werden nur Benachrichtigungen der ausgewählten Apps gelesen, und sie verbleiben bis zum Import auf dem Gerät. Betrag und Währung werden automatisch erkannt.';

  @override
  String get notificationGrant => 'Zugriff gewähren';

  @override
  String get notificationIncome => 'Einnahme-Schlüsselwörter';

  @override
  String get notificationIncomeTooltip =>
      'Wörter, die eine Benachrichtigung als Einnahme kennzeichnen: Wort eingeben und mit Enter hinzufügen';

  @override
  String get notificationMerchant => 'Händler-Bezeichnungen';

  @override
  String get notificationMerchantTooltip =>
      'Wörter, auf die ein Doppelpunkt und ein Händler folgen (Ort: Geschäft): Wort eingeben und mit Enter hinzufügen';

  @override
  String get notificationNoApps =>
      'Bisher wurden keine Benachrichtigungen empfangen: Apps erscheinen hier, nachdem sie eine Benachrichtigung gesendet haben';

  @override
  String get notificationUnparsed => 'Nicht erkannt';

  @override
  String get notifyHeadline => 'Benachrichtigungen Parser';

  @override
  String get ok => 'OK';

  @override
  String get orderPin => 'Priorisierte Reihenfolge';

  @override
  String get orderUnpin => 'Generalisierte Reihenfolge';

  @override
  String get outputFile => 'Ziel für die Datei';

  @override
  String get parseFile => 'Datei analysieren';

  @override
  String get password => 'Kennwort';

  @override
  String get path => 'Dateiname (zum Speichern oder Laden von)';

  @override
  String get paymentType => 'Zahlungsintervall';

  @override
  String get paymentsHeadline => 'Wiederkehrende Zahlungen';

  @override
  String get pearDisabled => '-- deaktiviert --';

  @override
  String get pearLoading => 'In Bearbeitung...';

  @override
  String get peerAccept => 'akzeptieren';

  @override
  String get peerAction => 'Aktion';

  @override
  String get peerClosed => 'abgebrochen';

  @override
  String get peerConnect => 'Gerät verbinden';

  @override
  String get peerConnectBtn => 'verbinden';

  @override
  String get peerDelete => 'löschen';

  @override
  String get peerDevice => 'Verbundene Geräte';

  @override
  String get peerId => 'Ihre Gerätekennung für die Verbindung';

  @override
  String get peerOffline => 'offline';

  @override
  String get peerOnline => 'verbunden';

  @override
  String get peerOtherId => 'Gerätekennung für Verbindung';

  @override
  String get peerPending => 'ausstehend';

  @override
  String get peerPing => 'ping';

  @override
  String get peerSent => 'Daten werden an verbundene Geräte übertragen';

  @override
  String get peerStatus => 'Status';

  @override
  String get peerSync => 'Daten übertragen';

  @override
  String pickFile(Object value) {
    return 'Pick .$value-Datei';
  }

  @override
  String pongStatus(Object uuid) {
    return 'Anfrage von $uuid entgegengenommen';
  }

  @override
  String get privatBankAdd => 'Konto hinzufügen';

  @override
  String get privatBankDescription =>
      'Salden und Umsätze von Geschäftskonten (Einzelunternehmer und Firmen) aus Privat24 for Business mit einem Autoclient-Token importieren. Privatkonten werden von der API nicht unterstützt. Der Zugriff ist nur lesend: Es werden keine Zahlungen ausgeführt.';

  @override
  String get privatBankHeadline => 'PrivatBank Autoclient (Ukraine)';

  @override
  String get privatBankIban => 'IBAN des Kontos';

  @override
  String get privatBankIbanInvalid =>
      'Geben Sie eine ukrainische IBAN ein: UA gefolgt von 27 Ziffern';

  @override
  String get privatBankIbanTooltip =>
      'Die API liefert keine Kontoliste: Fügen Sie die IBANs der Konten einzeln hinzu';

  @override
  String privatBankNotReady(Object value) {
    return 'PrivatBank bereitet die Kontoauszüge vor (Phase $value): Versuchen Sie es in einigen Minuten erneut';
  }

  @override
  String get privatBankRemove => 'Konto entfernen';

  @override
  String get privatBankToken => 'Autoclient-Token';

  @override
  String get privatBankTokenSteps =>
      'So erhalten Sie ein Autoclient-Token:\n1. Melden Sie sich bei Privat24 for Business an\n2. Öffnen Sie Integration (Autoclient)\n3. Aktivieren Sie sie und kopieren Sie das Token\n4. Fügen Sie es unten ein und tippen Sie auf „Verbinden“\n5. Fügen Sie die IBANs der zu importierenden Konten hinzu';

  @override
  String get privatBankTokenTooltip =>
      'Wird in Privat24 for Business unter Integration (Autoclient) ausgestellt; verschlüsselt gespeichert';

  @override
  String get processIsFinished => 'Beendet!';

  @override
  String progress(Object value) {
    return 'Fortschritt: $value%';
  }

  @override
  String get raiseData => 'Betragsaddition';

  @override
  String get recoveryHeadline => 'Wiederherstellung';

  @override
  String get recoveryTooltip => 'Wiederherstellen von';

  @override
  String get releases => 'Freigaben';

  @override
  String get reset => 'zurücksetzen';

  @override
  String get returnBack => 'Rückgabe Zurück';

  @override
  String get roadmap => 'Fahrplan';

  @override
  String get saveNotification => 'Änderungen gespeichert!';

  @override
  String get saveSettingsTooltip => 'Speichern';

  @override
  String get saveTooltip => 'Speichern in';

  @override
  String search(Object value) {
    return 'Nach \'$value\'-Muster anzeigen';
  }

  @override
  String get searchTooltip => 'Suchen';

  @override
  String get secureBioNotMatch =>
      'Die Authentifizierung ist fehlgeschlagen! Bitte versuchen Sie es erneut';

  @override
  String get secureBioPromptReason =>
      'Bitte authentifizieren Sie sich, um fortzufahren';

  @override
  String get secureBioPromptTitle => 'Biometrische Authentifizierung';

  @override
  String get secureOtpCode => 'Einmalpasswortcode';

  @override
  String get secureOtpCodeInvalid =>
      'Ungültig! Bitte, neuen Code generieren und eingeben';

  @override
  String get secureOtpDeactivated => 'Passwortschutz ist deaktiviert';

  @override
  String get securePassword => 'Passwort (Wiederherstellungsphrase)';

  @override
  String get securePasswordEmpty => 'Das Passwort darf nicht leer sein!';

  @override
  String get securePasswordNotMatch => 'Die Passwörter stimmen nicht überein!';

  @override
  String get securePasswordRepeat => 'Passwort wiederholen';

  @override
  String get securityHeadline => 'Sicherheit';

  @override
  String get settingsBaseHeadline => 'Grundlagen';

  @override
  String get settingsHeadline => 'Einstellungen';

  @override
  String get settingsSaved => 'Einstellungen gespeichert!';

  @override
  String get simpleFinDescription =>
      'Salden und Umsätze von US-Banken und Kartenanbietern über eine SimpleFIN Bridge importieren. Der Zugriff ist nur lesend: Es werden keine Zahlungen ausgeführt.';

  @override
  String get simpleFinHeadline => 'SimpleFIN Bridge (US)';

  @override
  String get simpleFinNoCredentials =>
      'Die SimpleFIN Bridge hat eine Zugriffsadresse ohne Zugangsdaten geliefert';

  @override
  String get simpleFinToken => 'SimpleFIN-Einrichtungstoken';

  @override
  String get simpleFinTokenClaimed =>
      'Das Einrichtungstoken existiert nicht oder wurde bereits verwendet';

  @override
  String get simpleFinTokenInvalid => 'Ungültiges SimpleFIN-Einrichtungstoken';

  @override
  String get simpleFinTokenTooltip =>
      'In Ihrer SimpleFIN Bridge (z. B. bridge.simplefin.org) für diese Anwendung erstellt; nur einmal verwendbar';

  @override
  String get skipFromTotals => 'Aus den Gesamtwerten ausschließen';

  @override
  String get skipTooltip => 'Schritt(e) überspringen';

  @override
  String get sortTooltip => 'Elemente sortieren';

  @override
  String get sortingAmountAsc => 'Betrag aufsteigend';

  @override
  String get sortingAmountDesc => 'Betrag absteigend';

  @override
  String get sortingCreatedAtAsc => 'Erstellt am aufsteigend';

  @override
  String get sortingCreatedAtDesc => 'Erstellt am absteigend';

  @override
  String get sortingTitleAsc => 'Titel aufsteigend';

  @override
  String get sortingTitleDesc => 'Titel absteigend';

  @override
  String get sortingUpdatedAtAsc => 'Aktualisiert am aufsteigend';

  @override
  String get sortingUpdatedAtDesc => 'Aktualisiert am absteigend';

  @override
  String get spent => 'ausgegeben';

  @override
  String get splitCancelTooltip => 'Aufteilung pro Monat aufheben';

  @override
  String get splitHeadline => 'Rechnung teilen';

  @override
  String get splitTooltip => 'Limits pro Monat deklarieren';

  @override
  String get starlingDescription =>
      'Salden und Umsätze von Konten der Starling Bank mit einem persönlichen Zugriffstoken Ihres kostenlosen Entwicklerkontos importieren. Der Zugriff ist nur lesend: Es werden keine Zahlungen ausgeführt.';

  @override
  String get starlingHeadline =>
      'Starling Bank Personal Access (Vereinigtes Königreich)';

  @override
  String get starlingScopes =>
      'Dem Token fehlt eine Berechtigung: Erstellen Sie es mit den Scopes \"account:read\", \"balance:read\" und \"transaction:read\"';

  @override
  String get starlingToken => 'Persönliches Zugriffstoken';

  @override
  String get starlingTokenSteps =>
      'So erhalten Sie ein persönliches Zugriffstoken:\n1. Registrieren Sie sich auf developer.starlingbank.com (kostenlos)\n2. Öffnen Sie Personal Access, fügen Sie Ihr Starling-Konto hinzu und bestätigen Sie es in der Starling-App\n3. Erstellen Sie ein Token mit den Scopes \"account:read\", \"balance:read\" und \"transaction:read\"\n4. Fügen Sie es unten ein und tippen Sie auf „Verbinden“';

  @override
  String get starlingTokenTooltip =>
      'Wird auf developer.starlingbank.com unter Personal Access erstellt; verschlüsselt gespeichert';

  @override
  String get subscription =>
      'Da es sich um ein Open-Source-Projekt handelt, werden durch ein Abonnement keine zusätzlichen Funktionen freigeschaltet. Es ist jedoch eine Investition in die kontinuierliche Weiterentwicklung und Verbesserung der Anwendung und in die Erhaltung ihrer Verfügbarkeit.';

  @override
  String get subscriptionCoffee => 'Einen Kaffee kaufen';

  @override
  String get subscriptionDinner => 'Zum Essen einladen';

  @override
  String get subscriptionDonorbox => 'Über Donorbox abonnieren';

  @override
  String get subscriptionGithub => 'Über GitHub abonnieren';

  @override
  String get subscriptionHeadline => 'Patenschaft';

  @override
  String get subscriptionInactive => 'Kaufservice nicht verfügbar';

  @override
  String get subscriptionPatreon => 'Über Patreon abonnieren';

  @override
  String get subscriptionPaypal => 'Einen Kaffee kaufen (PayPal)';

  @override
  String get subscriptionTiny => 'Schenke eine Glücksmünze';

  @override
  String get subscriptionTooltip => 'Unterstützung (Patenschaft)';

  @override
  String get success => 'Erfolgreich';

  @override
  String get summary => 'Zusammenfassung';

  @override
  String get symbol => 'Symbol';

  @override
  String get syncHeadline => 'Sync-Geräte';

  @override
  String get systemMode => 'System';

  @override
  String get tapToOpen => 'Tippen zum Öffnen';

  @override
  String get targetAmount => 'Zielbetrag';

  @override
  String get tellerAccessToken => 'Zugriffstoken';

  @override
  String get tellerAccessTokenTooltip =>
      'Wird nach der Verknüpfung einer Bank auf der Verbindungsseite angezeigt: hier einfügen, falls Fingrom nicht automatisch geöffnet wurde';

  @override
  String get tellerAppId => 'Anwendungs-ID';

  @override
  String get tellerAppIdTooltip =>
      'Wird im Teller Dashboard angezeigt, beginnt mit \"app_\"';

  @override
  String get tellerCertificate => 'Zertifikat (PEM)';

  @override
  String get tellerCertificateInvalid =>
      'Ungültiges Zertifikat: Ein PEM-Block \"CERTIFICATE\" wird erwartet';

  @override
  String get tellerCertificateTooltip =>
      'Im Teller Dashboard ausgestellt (Certificates); verschlüsselt gespeichert. Leer lassen, um das gespeicherte Zertifikat zu behalten';

  @override
  String get tellerConnectBank => 'Bank verbinden';

  @override
  String get tellerConnectPage => 'Verbindungsseite';

  @override
  String get tellerConnectPageTooltip =>
      'Öffnet Teller Connect im Browser und gibt das Zugriffstoken an Fingrom zurück';

  @override
  String get tellerDescription =>
      'Salden und Umsätze von US-Banken und Kartenanbietern über Teller mit Ihrer eigenen, bei teller.io registrierten Anwendung importieren (der kostenlose Tarif erlaubt 100 echte Bankverbindungen). Der Zugriff ist nur lesend: Es werden keine Zahlungen ausgeführt.';

  @override
  String get tellerDisconnected =>
      'Die Bankverbindung erfordert Ihre Aufmerksamkeit (z. B. eine neue Anmeldung oder einen Bestätigungscode): Verbinden Sie die Bank erneut';

  @override
  String get tellerEnvironment => 'Umgebung';

  @override
  String get tellerHeadline => 'Teller (US)';

  @override
  String get tellerIncomplete =>
      'Anwendungs-ID ausfüllen; Zertifikat und privater Schlüssel sind für echte Bankdaten erforderlich';

  @override
  String get tellerKey => 'Privater Schlüssel (PEM)';

  @override
  String get tellerKeyInvalid =>
      'Ungültiger privater Schlüssel: Ein PEM-Block \"PRIVATE KEY\" wird erwartet';

  @override
  String get tellerKeyTooltip =>
      'Zusammen mit dem Zertifikat heruntergeladen; verschlüsselt gespeichert. Leer lassen, um den gespeicherten Schlüssel zu behalten';

  @override
  String get tellerMissingCertificate =>
      'Teller hat die Anfrage ohne Client-Zertifikat abgelehnt: Laden Sie das Zertifikat und den privaten Schlüssel hoch oder wählen Sie sandbox';

  @override
  String get tellerSteps =>
      'So verbinden Sie sich:\n1. Registrieren Sie sich bei teller.io und öffnen Sie das Teller Dashboard\n2. Kopieren Sie die Anwendungs-ID, erstellen Sie dann ein Zertifikat mit privatem Schlüssel und laden Sie es herunter (Certificates)\n3. Tragen Sie beides unten ein und wählen Sie die Umgebung (sandbox: Testdaten, Anmeldung bei einer Bank als \"username\" mit \"password\")\n4. Tippen Sie auf „Bank verbinden“ und melden Sie sich auf der geöffneten Seite bei Ihrer Bank an\n5. Wählen Sie das Konto und die Budgetkategorie und tippen Sie dann auf „Umsätze importieren“';

  @override
  String get tellerUpload => 'Datei hochladen';

  @override
  String get termPrivacy => 'Datenschutzrichtlinie';

  @override
  String get termUse => 'Nutzungsbedingungen';

  @override
  String get title => 'Titel';

  @override
  String get titleAccountTooltip => 'Konto-Identifikator eingeben';

  @override
  String get titleBudgetTooltip => 'Name der Budgetkategorie eingeben';

  @override
  String get titleGoal => 'Ziel';

  @override
  String get titleGoalTooltip => 'Beschreibung des Ziels definieren';

  @override
  String get to => 'an';

  @override
  String get total => 'gesamt';

  @override
  String get transactionFile => 'Fingrom-Transaktionsprotokolldatei (.log)';

  @override
  String get transferHeadline => 'Übertragen';

  @override
  String get transferTooltip => 'Übertragungsdetails festlegen';

  @override
  String get transfersHeadline => 'Überweisungen';

  @override
  String get typeButton => 'Schaltfläche';

  @override
  String get updateAccountTooltip => 'Konto aktualisieren';

  @override
  String get updateBillTooltip => 'Rechnung aktualisieren';

  @override
  String get updateBudgetTooltip => 'Budgetkategorie aktualisieren';

  @override
  String get updateGoalTooltip => 'Ziel aktualisieren';

  @override
  String get updatePaymentTooltip => 'Zahlung aktualisieren';

  @override
  String get username => 'Benutzername (Konto)';

  @override
  String get uuid => 'Eindeutiger Transaktionsbezeichner';

  @override
  String get validTillDate => 'Gültig bis';

  @override
  String get webDav =>
      'Verteilte Autorisierung und Versionierung im Web (WebDav)';

  @override
  String get wiseDescription =>
      'Salden und Umsätze von Wise-Mehrwährungskonten mit einem persönlichen API-Token importieren. Umrechnungen zwischen verknüpften Guthaben werden als Überweisungen importiert. Der Zugriff ist nur lesend: Es werden keine Zahlungen ausgeführt.';

  @override
  String get wiseHeadline => 'Wise API (Global)';

  @override
  String get wiseNoProfiles =>
      'Für das Token sind keine Wise-Profile verfügbar';

  @override
  String get wiseProfile => 'Profil';

  @override
  String get wiseScaRequired =>
      'Wise verlangt eine starke Kundenauthentifizierung: Öffnen Sie den Kontoauszug dieses Guthabens in der Wise-App und versuchen Sie es erneut';

  @override
  String get wiseToken => 'Persönliches API-Token';

  @override
  String get wiseTokenSteps =>
      'So erhalten Sie ein persönliches API-Token:\n1. Melden Sie sich im Browser bei wise.com an (in der mobilen App können keine Token erstellt werden)\n2. Öffnen Sie Einstellungen → Integrationen und Tools → API-Token\n3. Wählen Sie „Neues Token hinzufügen“, benennen Sie es (z. B. Fingrom) und wählen Sie den Zugriff „Nur lesen“\n4. Bestätigen Sie mit der Zwei-Faktor-Verifizierung und kopieren Sie das Token\n5. Fügen Sie es unten ein und tippen Sie auf „Verbinden“';

  @override
  String get wiseTokenTooltip =>
      'Wird in Wise unter Einstellungen → API-Token erstellt (wenn möglich nur lesend); verschlüsselt gespeichert';

  @override
  String get zoomState => 'Vergrößern / Verkleinern';
}
