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
  String get dayStartOfMonth => 'Anfang des Monats';

  @override
  String get dayStartOfWeek => 'Beginn der Woche';

  @override
  String get daySunday => 'Sonntag';

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
  String get meaning => 'Bedeutung';

  @override
  String get metricsHeadline => 'Metriken';

  @override
  String get metricsTooltip => 'Metriken';

  @override
  String get milestones => 'Meilensteine';

  @override
  String get missingContent =>
      'Datei kann nicht verarbeitet werden (entweder abgebrochen)';

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
  String get securityHeadline => 'Sicherheit';

  @override
  String get settingsBaseHeadline => 'Grundlagen';

  @override
  String get settingsHeadline => 'Einstellungen';

  @override
  String get skipFromTotals => 'Aus den Gesamtwerten ausschließen';

  @override
  String get skipTooltip => 'Schritt(e) überspringen';

  @override
  String get spent => 'ausgegeben';

  @override
  String get splitCancelTooltip => 'Aufteilung pro Monat aufheben';

  @override
  String get splitTooltip => 'Limits pro Monat deklarieren';

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
  String get zoomState => 'Vergrößern / Verkleinern';
}
