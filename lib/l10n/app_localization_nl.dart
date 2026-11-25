// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Dutch Flemish (`nl`).
class AppLocalizationsNl extends AppLocalizations {
  AppLocalizationsNl([String locale = 'nl']) : super(locale);

  @override
  String get a =>
      'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => 'Over';

  @override
  String get account => 'Account';

  @override
  String get accountFrom => 'Van Account';

  @override
  String get accountHeadline => 'Rekeningen';

  @override
  String get accountTo => 'Naar account';

  @override
  String get accountTooltip => 'Rekening openen';

  @override
  String get accountType => 'Type rekening';

  @override
  String get accountTypeTooltip => 'Kies type rekening';

  @override
  String get acknowledgeTooltip => 'bevestigen';

  @override
  String get activate => 'Activeer';

  @override
  String get actualData => 'Historische gegevens';

  @override
  String get addAccountTooltip => 'Rekening toevoegen';

  @override
  String get addBudgetTooltip => 'Nieuwe budgetcategorie toevoegen';

  @override
  String get addGoalTooltip => 'Nieuw doel toevoegen';

  @override
  String get addMainTooltip => 'Rekening, inkomsten of overboeking toevoegen';

  @override
  String afterNDays(Object value) {
    return 'na $value dagen';
  }

  @override
  String get akahuAppToken => 'App ID-token';

  @override
  String get akahuDescription =>
      'Importeer saldi en transacties van met Akahu verbonden Nieuw-Zeelandse banken met uw eigen gratis persoonlijke app. Akahu ververst de gegevens van de banken volgens een eigen schema (dagelijks), dus de nieuwste transacties kunnen later verschijnen. De toegang is alleen-lezen: er worden geen betalingen uitgevoerd.';

  @override
  String get akahuHeadline => 'Akahu Personal App (Nieuw-Zeeland)';

  @override
  String get akahuInactive =>
      'Akahu heeft de toegang tot deze rekening verloren: verbind deze opnieuw op my.akahu.nz/connections';

  @override
  String get akahuIncomplete =>
      'Vul het App ID-token en het gebruikerstoegangstoken in';

  @override
  String get akahuRefresh => 'Gegevens vernieuwen';

  @override
  String get akahuRefreshed =>
      'Akahu is gevraagd nieuwe gegevens bij de banken op te halen: probeer de import over een paar minuten opnieuw (hoogstens één keer per uur)';

  @override
  String get akahuSteps =>
      'Zo krijgt u de tokens:\n1. Registreer u op my.akahu.nz en verbind uw banken\n2. Open de pagina \'Developers\', accepteer de ontwikkelaarsvoorwaarden en stel meervoudige verificatie in\n3. Kopieer het App ID-token en het gebruikerstoegangstoken\n4. Plak ze hieronder en druk op \'Verbinden\'';

  @override
  String get akahuTokenTooltip =>
      'Getoond op de pagina \'Developers\' van my.akahu.nz; versleuteld opgeslagen';

  @override
  String get akahuUserToken => 'Gebruikerstoegangstoken';

  @override
  String get amountFrom => 'Vanaf bedrag';

  @override
  String get amountTo => 'Naar bedrag';

  @override
  String appBuild(Object build) {
    return 'Samenstellen: $build';
  }

  @override
  String get appInitHeadline => 'Project initialisatie';

  @override
  String get appStartHeadline => 'Eerste instelling';

  @override
  String get appTitle => 'Fingrom';

  @override
  String appVersion(Object version) {
    return 'Versie: $version';
  }

  @override
  String get automationHeadline => 'Automatisering';

  @override
  String get automationTypeDays => 'na enkele dagen';

  @override
  String get backTooltip => 'Terugkeren';

  @override
  String get balance => 'Werkelijk Saldo';

  @override
  String get balanceDate => 'Saldo Datum Bijwerken';

  @override
  String get balanceDateTooltip =>
      'Uitkomsten en inkomsten vóór deze datum hebben geen invloed op het saldo';

  @override
  String get balanceTooltip => 'Saldo instellen';

  @override
  String get bankAccount => 'Bankrekening';

  @override
  String get bill => 'Rekening';

  @override
  String get billHeadline => 'Rekeningen';

  @override
  String get billSetTooltip => 'Bedrag instellen';

  @override
  String billSum(Object value) {
    return 'Rekeningen: $value';
  }

  @override
  String get billTooltip => 'Openstaande rekeningen';

  @override
  String get billTypeTooltip => '[Type] Rekening, Inkomen of Overdracht';

  @override
  String get brightnessTheme => 'Helderheid Thema';

  @override
  String get btnAdd => 'Toevoegen';

  @override
  String get btnCancel => 'Annuleren';

  @override
  String get btnConfirm => 'Bevestigen';

  @override
  String get btnMore => 'Meer';

  @override
  String get budget => 'Categorie Budget';

  @override
  String get budgetHeadline => 'Budgetten';

  @override
  String get budgetLimit => 'Limiet per maand';

  @override
  String get budgetLimitHeadline => 'Aanpassingen limiet';

  @override
  String get budgetPositive => 'Budget, Samenvattingsbeheerder';

  @override
  String get budgetPositiveOff => 'Negatieve waarden negeren';

  @override
  String get budgetPositiveOn => 'Negatieve waarden opnemen';

  @override
  String get budgetRelativeLimit => 'Relatieve coëfficiënt per maand';

  @override
  String get budgetTooltip => 'Open Budgettypes';

  @override
  String get budgetType => 'Budgetteringsinterval';

  @override
  String get budgetTypeAsIs => 'Onbeperkt';

  @override
  String get budgetTypeFixed => 'Vast';

  @override
  String get budgetTypeMonth => 'maandelijks';

  @override
  String get budgetTypeRelative => 'Relatief';

  @override
  String get budgetTypeWeek => 'wekelijks';

  @override
  String get budgetTypeYear => 'jaarlijks';

  @override
  String get cash => 'Contant';

  @override
  String get chartBarRace => 'Staafdiagram voor categorieën';

  @override
  String get chartForecast => 'Voorspellingsgrafiek';

  @override
  String get chartOHLC => 'Kandelaargrafiek (OHLC)';

  @override
  String get chartYtdExpense => 'YTD uitgaven';

  @override
  String get clear => 'Dalingswaarde';

  @override
  String get closeTooltip => 'Sluiten';

  @override
  String get closedAt => 'Afgewerkt tot datum';

  @override
  String get cmpChart => 'Diagrammen';

  @override
  String get cmpRecent => 'Recente items';

  @override
  String get cmpRecentCount => 'Lijstgrootte';

  @override
  String get coAuthor => 'author';

  @override
  String get coConsult => 'adviseur';

  @override
  String get coDeveloper => 'ontwikkelaar';

  @override
  String get coNew => 'Word lid van';

  @override
  String get coPromoter => 'promoter';

  @override
  String get coTranslator => 'vertaler';

  @override
  String get coef => 'coëf.';

  @override
  String get collapse => 'Sectie samenvouwen (herstellen)';

  @override
  String get color => 'Kleur';

  @override
  String get colorApp => 'Aangepast';

  @override
  String get colorBackground => 'Achtergrond';

  @override
  String get colorDark => 'Donker';

  @override
  String get colorInversePrimary => 'Invers Primair';

  @override
  String get colorInverseSurface => 'Invers oppervlak';

  @override
  String get colorLight => 'Licht';

  @override
  String get colorOnInverseSurface => 'Op omgekeerd oppervlak';

  @override
  String get colorOnSecondary => 'Op secundair';

  @override
  String get colorOnSecondaryContainer => 'Op container';

  @override
  String get colorPrimary => 'Primair';

  @override
  String get colorRestore => 'Reset palet';

  @override
  String get colorSecondary => 'Secundair';

  @override
  String get colorSystem => 'Standaard';

  @override
  String get colorTheme => 'Palette';

  @override
  String get colorTooltip => 'Selecteer een kleur';

  @override
  String get colorType => 'Type kleur';

  @override
  String get colorUser => 'Persoonlijk';

  @override
  String columnMap(Object value) {
    return 'Mapping voor kolom \'$value';
  }

  @override
  String columnMapTooltip(Object value) {
    return '$value\' - Kolom toewijzing kiezen';
  }

  @override
  String get completeGoalTooltip => 'Doel voltooien';

  @override
  String get confirmHeader => 'Actie bevestigen';

  @override
  String get confirmTooltip =>
      'Weet u het zeker? Deze actie kan niet ongedaan worden gemaakt.';

  @override
  String get contributors => 'Medewerkers';

  @override
  String get conversion => 'Conversie';

  @override
  String conversionMessage(Object currency) {
    return 'Ingenomen in $currency';
  }

  @override
  String get copiedToClipboard => 'Gekopieerd naar klembord';

  @override
  String get createAccountHeader => 'Nieuwe rekening aanmaken';

  @override
  String get createAccountTooltip => 'Nieuw account aanmaken';

  @override
  String get createBillHeader => 'Nieuwe transactie aanmaken';

  @override
  String get createBillTooltip => 'Nieuwe rekening toevoegen';

  @override
  String get createBudgetHeader => 'Nieuwe budgetcategorie';

  @override
  String get createBudgetTooltip => 'Nieuwe budgetcategorie aanmaken';

  @override
  String get createGoalHeader => 'Doel creëren';

  @override
  String get createGoalTooltip => 'Nieuw doel toevoegen';

  @override
  String get createIncomeTooltip => 'Nieuw inkomen toevoegen';

  @override
  String get createPaymentTooltip => 'Nieuwe betaling toevoegen';

  @override
  String get createTransferTooltip => 'Overdracht creëren';

  @override
  String get credit => 'Krediet';

  @override
  String get creditCard => 'Krediet Kaart';

  @override
  String get currency => 'Currency';

  @override
  String get currencyAddHeadline => 'Valuta wisselen';

  @override
  String get currencyAddTooltip => 'Valuta wisselen toevoegen';

  @override
  String get currencyDefault => 'Standaard Valuta';

  @override
  String get currencyDistribution => 'Distributie';

  @override
  String currencyExchange(Object from, Object to) {
    return 'Valuta wisselen: $from -> $to';
  }

  @override
  String get currencyHeadline => 'Currencies';

  @override
  String currencyIn(Object value) {
    return 'In $value';
  }

  @override
  String get currencyShort => 'Val.';

  @override
  String get currencyTooltip => 'Valutasoort (Code)';

  @override
  String get currencyUpdateTooltip => 'Valutasnelheid bijwerken';

  @override
  String get currentDate => 'Huidige Datum Wijzer';

  @override
  String get customAddTooltip => 'Widget toevoegen';

  @override
  String get customDeleteTooltip => 'Aanpassing verwijderen';

  @override
  String get customSaveTooltip => 'Aanpassing opslaan';

  @override
  String get customizeTooltip => 'Pagina aanpassen';

  @override
  String get darkMode => 'Donker';

  @override
  String get dateFormat => 'Datum Formaat';

  @override
  String get dateRange => 'Datumbereik';

  @override
  String get dateTooltip => 'Datum selecteren';

  @override
  String get dayMonday => 'Maandag';

  @override
  String get daySaturday => 'Zaterdag';

  @override
  String get dayStartOfMonth => 'Begin van de maand';

  @override
  String get dayStartOfWeek => 'Begin van de week';

  @override
  String get daySunday => 'Zondag';

  @override
  String get deactivateAction => 'Wachtwoordbeveiliging deactiveren';

  @override
  String get debitCard => 'Debetkaart';

  @override
  String def(Object value) {
    return 'Standaardwaarde voor \'$value\'';
  }

  @override
  String get deleteAccountTooltip => 'Rekening deactiveren';

  @override
  String get deleteBillTooltip => 'Rekening verwijderen';

  @override
  String get deleteBudgetTooltip => 'Deactiveer budgetcategorie';

  @override
  String get deleteGoalTooltip => 'Doel verwijderen';

  @override
  String get deleteInvoiceTooltip => 'Factuur verwijderen';

  @override
  String get deletePaymentTooltip => 'Betaling verwijderen';

  @override
  String get deleteTooltip => 'Verwijderen';

  @override
  String get deleteTransferTooltip => 'Overschrijving verwijderen';

  @override
  String get deposit => 'Storten';

  @override
  String get description => 'Beschrijving';

  @override
  String get descriptionTooltip => 'Onkostendetails instellen';

  @override
  String get design => 'Ontwerpmodus (cultuurspecifiek)';

  @override
  String get designAsiaGeneral => 'Azië Algemeen';

  @override
  String get designGermany => 'Duitsland';

  @override
  String get designGlobal => 'Wereldwijd';

  @override
  String get designRtlGeneral => 'Rechts-naar-links belettering';

  @override
  String get details => 'Details';

  @override
  String get detailsTooltip => '****2345 - laatste 4 cijfers van nummer';

  @override
  String get dtAm => 'am';

  @override
  String get dtAmPm => 'uur in am/pm (0~11)';

  @override
  String get dtDay => 'dag in maand';

  @override
  String get dtEscape => 'escape voor tekst';

  @override
  String get dtHalfHour => 'uur in am/pm (1~12)';

  @override
  String get dtHour => 'uur in dag (0~23)';

  @override
  String get dtMinute => 'minuut in uur';

  @override
  String get dtMonth => 'maand in jaar';

  @override
  String get dtNamedDay => 'dag van week';

  @override
  String get dtPm => 'pm';

  @override
  String get dtQuote => 'enkel citaat';

  @override
  String get dtSecond => 'seconde in minuut';

  @override
  String get dtYear => 'jaar';

  @override
  String get editAccountHeader => 'Account bijwerken';

  @override
  String get editAccountTooltip => 'Account bewerken';

  @override
  String get editBillHeader => 'Rekening bijwerken';

  @override
  String get editBillTooltip => 'Rekening bewerken';

  @override
  String get editBudgetHeader => 'Budgetcategorie bijwerken';

  @override
  String get editBudgetTooltip => 'Wijzig budgetcategorie';

  @override
  String get editGoalHeader => 'Doel bijwerken';

  @override
  String get editGoalTooltip => 'Doel bewerken';

  @override
  String get editInvoiceTooltip => 'Bewerk factuur';

  @override
  String get editPaymentTooltip => 'Betaling bewerken';

  @override
  String get editTooltip => 'Bewerken';

  @override
  String get editTransferTooltip => 'Bewerken Overdracht';

  @override
  String get enableBankingAppId => 'Applicatie-ID';

  @override
  String get enableBankingBank => 'Bank';

  @override
  String get enableBankingCode => 'Adres van de pagina na de autorisatie';

  @override
  String get enableBankingCodeTooltip =>
      'Bevestig de toegang bij de bank, kopieer daarna het adres uit de browser en plak het hier';

  @override
  String get enableBankingCountry => 'Land (ISO-code, bijv. NL)';

  @override
  String get enableBankingDescription =>
      'Importeer saldi en transacties van Europese banken via de Enable Banking API (PSD2) met je eigen applicatie, geregistreerd op enablebanking.com. Alleen-lezen toegang: er worden geen betalingen uitgevoerd.';

  @override
  String get enableBankingHeadline => 'Enable Banking (EU)';

  @override
  String get enableBankingIncomplete =>
      'Vul de applicatie-ID, privésleutel, omleidings-URL en het land in';

  @override
  String get enableBankingKey => 'Privésleutel (PEM)';

  @override
  String get enableBankingKeyInvalid =>
      'Ongeldige privésleutel: een PEM-blok \"PRIVATE KEY\" wordt verwacht';

  @override
  String get enableBankingKeyNotRsa =>
      'Ongeldige privésleutel: een RSA-sleutel wordt verwacht';

  @override
  String get enableBankingKeyTooltip =>
      'Aangemaakt met de applicatie in het Enable Banking Control Panel; versleuteld opgeslagen. Laat leeg om de opgeslagen sleutel te behouden';

  @override
  String get enableBankingLoadBanks => 'Banken laden';

  @override
  String get enableBankingNoAuthPage =>
      'Enable Banking heeft geen autorisatiepagina teruggegeven';

  @override
  String get enableBankingNoCode =>
      'Geen autorisatiecode gevonden in het adres';

  @override
  String get enableBankingRedirect => 'Omleidings-URL';

  @override
  String get enableBankingRedirectTooltip =>
      'Geregistreerd voor de applicatie; de bank keert er na de autorisatie naar terug';

  @override
  String get enableBankingStateMismatch =>
      'Het adres hoort bij een andere autorisatie, maak opnieuw verbinding';

  @override
  String get encryptionMode => 'Gegevenscodering';

  @override
  String error(Object value) {
    return 'Fout: $value';
  }

  @override
  String get errorExpired => 'Kaart verlopen';

  @override
  String get errorNegative => 'Kan niet negatief zijn! Herstel de fout';

  @override
  String get example => 'Voorbeeld';

  @override
  String get expand => 'Sectie uitbreiden';

  @override
  String get expense => 'Bedrag van uitgaven';

  @override
  String get expenseDateTime => 'Gefactureerd bij';

  @override
  String get expenseHeadline => 'Uitgaven';

  @override
  String get expenseTransfer => 'Bedrag overboeking';

  @override
  String exportFile(Object value) {
    return 'Exporteren als .$value-bestand';
  }

  @override
  String get failData => 'Bedrag Aftrek';

  @override
  String get finTsApproved => 'Goedgekeurd in de bankapp';

  @override
  String get finTsBankCode => 'Bankcode (BLZ)';

  @override
  String get finTsCustomerId => 'Klant-ID (indien anders dan gebruikers-ID)';

  @override
  String get finTsDescription =>
      'Importeer saldi en transacties van banken die FinTS 4.1 (PIN/TAN) ondersteunen. Alleen-lezen toegang: er worden geen betalingen uitgevoerd.';

  @override
  String get finTsHeadline => 'Financial Transaction Services (FinTS 4.1)';

  @override
  String get finTsIncomplete =>
      'Vul de server-URL, bankcode, gebruikers-ID en productregistratienummer in';

  @override
  String finTsLoginChanged(Object value) {
    return 'De bank heeft de inloggegevens gewijzigd, werk de gebruikers-ID of klant-ID bij: $value';
  }

  @override
  String finTsLoginRefused(Object value) {
    return 'De bank heeft de vorige aanmelding geweigerd: $value. Opnieuw proberen met de ingevoerde PIN?';
  }

  @override
  String get finTsPin => 'PIN';

  @override
  String get finTsPinHint =>
      'Alleen voor deze sessie gebruikt en nooit opgeslagen';

  @override
  String get finTsProductId => 'Productregistratienummer';

  @override
  String get finTsProductIdTooltip =>
      'Uitgegeven door de Deutsche Kreditwirtschaft aan de maker van de applicatie';

  @override
  String get finTsTan => 'TAN';

  @override
  String get finTsTanHeadline => 'Transactie-authenticatie (TAN)';

  @override
  String get finTsTanMedium => 'TAN-medium kiezen';

  @override
  String get finTsTanMethod => 'TAN-methode kiezen';

  @override
  String get finTsUrl => 'FinTS-server-URL van de bank';

  @override
  String get finTsUserId => 'Gebruikers-ID (login)';

  @override
  String get finTsVersion => 'Protocolversie';

  @override
  String get finTsWebUnsupported =>
      'Bankservers staan geen toegang vanuit een browser toe. Gebruik de desktop- of mobiele app.';

  @override
  String get flowTypeInvoice => 'Factuur';

  @override
  String get flowTypeTooltip => 'Type bedrag: Factuur';

  @override
  String get forecastData => 'Prognose';

  @override
  String get from => 'van';

  @override
  String get goNextTooltip => 'Ga Volgende';

  @override
  String get goalHeadline => 'Doelen';

  @override
  String goalProfit(Object value) {
    return 'Doelen Doel: $value';
  }

  @override
  String get goalProfitTooltip => 'Winst vs Doel';

  @override
  String get goalTooltip => 'Open Doelen';

  @override
  String get hasEncrypted => 'Eenmaal ingesteld, kan niet worden gewijzigd';

  @override
  String get helpTooltip => '[Help] Toon beschrijving van die pagina';

  @override
  String get homeHeadline => 'Home';

  @override
  String get homeTooltip => 'Terug naar hoofdpagina';

  @override
  String get hour => 'Uur';

  @override
  String get icon => 'Icoon';

  @override
  String get iconTooltip => 'Selecteer Pictogram';

  @override
  String get ignoreTooltip => 'Negeren';

  @override
  String get importHeadline => 'Importeren / Exporteren';

  @override
  String get income => 'Bedrag inkomen';

  @override
  String get incomeHeadline => 'Inkomen';

  @override
  String get incomeHealth => 'Inkomen gezondheidsradar';

  @override
  String get incomeTooltip => 'Inkomstendetails instellen';

  @override
  String get integrationAccessDenied =>
      'De toegang is ingetrokken of de inloggegevens zijn onjuist';

  @override
  String get integrationConnect => 'Verbinden';

  @override
  String get integrationDateFrom => 'Transacties importeren vanaf';

  @override
  String get integrationDefaultBudgetCategory => 'Standaard budgetcategorie';

  @override
  String get integrationDisconnect => 'Verbinding verbreken';

  @override
  String get integrationForget => 'Toegang vergeten';

  @override
  String get integrationHeadline => 'Integraties';

  @override
  String integrationHttpError(Object value) {
    return 'De dienst antwoordde met een fout (HTTP $value)';
  }

  @override
  String get integrationHttpsRequired =>
      'Alleen beveiligde adressen (HTTPS) zijn toegestaan';

  @override
  String get integrationImport => 'Transacties importeren';

  @override
  String integrationImported(Object added, Object pending, Object skipped) {
    return 'Geïmporteerd: $added, overgeslagen als al aanwezig: $skipped, in behandeling (niet geïmporteerd): $pending';
  }

  @override
  String integrationInvalidAmount(Object value) {
    return 'Ongeldig bedrag: $value';
  }

  @override
  String get integrationNoAccounts => 'De bank heeft geen rekeningen verstrekt';

  @override
  String get integrationPaymentRequired =>
      'De dienst vereist een betaling voor de toegang';

  @override
  String get integrationSelectTarget =>
      'Selecteer de rekening en de budgetcategorie om in te importeren';

  @override
  String integrationServiceError(Object value) {
    return 'Melding van de dienst: $value';
  }

  @override
  String get integrationUnexpectedResponse =>
      'Onverwacht antwoord van de dienst';

  @override
  String get investecApiKey => 'API-sleutel';

  @override
  String get investecClientId => 'Client-ID';

  @override
  String get investecCredentialsTooltip =>
      'Aangemaakt in Investec Online onder Investec Developer → API keys; versleuteld opgeslagen';

  @override
  String get investecDescription =>
      'Importeer saldi en transacties van Investec Private Banking-rekeningen (Zuid-Afrika) via de Programmable Banking API met uw eigen API-sleutels. De toegang is alleen-lezen: er worden geen betalingen uitgevoerd.';

  @override
  String get investecHeadline => 'Investec Programmable Banking (Zuid-Afrika)';

  @override
  String get investecIncomplete =>
      'Vul de client-ID, het geheim en de API-sleutel in';

  @override
  String get investecSandbox => 'Sandbox (testgegevens)';

  @override
  String get investecSecret => 'Geheim';

  @override
  String get investecSteps =>
      'Zo krijgt u de API-sleutels:\n1. Log in op Investec Online en meld u aan voor Investec Developer (Programmable Banking)\n2. Open API keys en maak een sleutel aan met toegang tot rekeningen en transacties\n3. Bevestig deze met tweestapsverificatie en kopieer de client-ID, het geheim en de API-sleutel\n4. Plak ze hieronder en druk op \'Verbinden\'';

  @override
  String get invoiceHeadline => 'Facturen';

  @override
  String invoiceSum(Object value) {
    return 'Facturen: $value';
  }

  @override
  String get isCleaned => 'Bestaande gegevens verwijderen';

  @override
  String get isCreated => 'Al aangemaakt, volg de volgende stappen!';

  @override
  String get isEncrypted => 'Bestand is gecodeerd (standaard)';

  @override
  String get isRequired => 'vereist';

  @override
  String get language => 'Taal';

  @override
  String get left => 'left';

  @override
  String get lightMode => 'Licht';

  @override
  String get link => 'Uniform Resource Locator (URL)';

  @override
  String get managerHeadline => 'Beheerder';

  @override
  String get meaning => 'Betekenis';

  @override
  String get metricsHeadline => 'Metriek';

  @override
  String get metricsTooltip => 'Metriek';

  @override
  String get milestones => 'Mijlpalen';

  @override
  String get minute => 'Minuut';

  @override
  String get missingContent => 'Bestand kan niet worden verwerkt (geannuleerd)';

  @override
  String get monobankCreateAccount => 'Rekening aanmaken';

  @override
  String get monobankDescription =>
      'Import van saldi en transacties van monobank-kaarten en spaarpotten met een persoonlijk token. monobank staat één verzoek per minuut toe: het importeren van een lange periode duurt enkele minuten. Alleen-lezen toegang: er worden geen betalingen uitgevoerd.';

  @override
  String get monobankHeadline => 'monobank Personal API (Oekraïne)';

  @override
  String get monobankJar => 'Spaarpot';

  @override
  String monobankProgress(Object done, Object total) {
    return 'Afschriften opvragen: $done van $total';
  }

  @override
  String monobankRateLimit(Object value) {
    return 'monobank staat één verzoek per minuut toe: het volgende over $value s';
  }

  @override
  String get monobankToken => 'Persoonlijk token';

  @override
  String get monobankTokenSteps =>
      'Zo krijgt u een persoonlijk token:\n1. Open api.monobank.ua in een browser\n2. Scan de QR-code met de monobank-app en bevestig de toegang\n3. Kopieer het token van de pagina\n4. Plak het hieronder en druk op \"Verbinden\"\n5. Koppel elke kaart of spaarpot aan een rekening (of maak er een aan) en importeer';

  @override
  String get monobankTokenTooltip =>
      'Uitgegeven op api.monobank.ua na het scannen van de QR-code in de monobank-app; versleuteld opgeslagen';

  @override
  String get monzoApprove =>
      'Keur de toegang goed in de Monzo-app en druk daarna opnieuw op \'Verbinden\'';

  @override
  String get monzoClientId => 'Client-ID';

  @override
  String get monzoClientSecret => 'Clientgeheim';

  @override
  String get monzoClientSecretTooltip =>
      'Getoond bij de OAuth-client op developers.monzo.com; versleuteld opgeslagen. Laat leeg om het opgeslagen geheim te behouden';

  @override
  String get monzoCode => 'Adres van de pagina na het inloggen';

  @override
  String get monzoCodeTooltip =>
      'Als Fingrom niet automatisch is geopend, kopieer dan het adres uit de browser en plak het hier';

  @override
  String get monzoDescription =>
      'Importeer saldi en transacties van Monzo-rekeningen met uw eigen OAuth-client die is geregistreerd op developers.monzo.com (alleen voor persoonlijk gebruik). De toegang is alleen-lezen: er worden geen betalingen uitgevoerd.';

  @override
  String get monzoExpired =>
      'De toegang tot Monzo is verlopen: maak opnieuw verbinding';

  @override
  String monzoFullHistory(Object value) {
    return 'De volledige geschiedenis is beschikbaar tot $value: kies een eerdere datum en importeer nu. Daarna levert Monzo alleen de laatste 90 dagen';
  }

  @override
  String get monzoHeadline => 'Monzo Developer API (Verenigd Koninkrijk)';

  @override
  String monzoHistoryLimited(Object value) {
    return 'Monzo levert alleen de laatste 90 dagen: transacties worden geïmporteerd vanaf $value';
  }

  @override
  String get monzoIncomplete =>
      'Vul de client-ID, het clientgeheim en de omleidings-URL in';

  @override
  String get monzoRedirect => 'Omleidings-URL';

  @override
  String get monzoRedirectTooltip =>
      'Stel precies dit adres in voor de OAuth-client; Monzo keert er na het inloggen naar terug';

  @override
  String get monzoSteps =>
      'Zo maakt u verbinding:\n1. Log in op developers.monzo.com met het e-mailadres van uw Monzo-account\n2. Open Clients → New OAuth Client, kies \'Confidential\' en stel de hieronder getoonde omleidings-URL in\n3. Kopieer de client-ID en het clientgeheim, plak ze hieronder en druk op \'Verbinden\'\n4. Open de per e-mail verzonden link, keur de toegang goed in de Monzo-app en druk opnieuw op \'Verbinden\'\n5. Importeer meteen: de volledige geschiedenis is slechts 5 minuten na de goedkeuring beschikbaar, daarna alleen de laatste 90 dagen';

  @override
  String get navigationTooltip => 'Hoofdmenu openen';

  @override
  String netProfit(Object value) {
    return 'Winst: $value';
  }

  @override
  String get noChartData =>
      'Gegevens ontbreken (of zijn niet voldoende) om te worden getoond';

  @override
  String get notificationAccessSettings => 'Toegang tot meldingen';

  @override
  String get notificationAccessSteps =>
      'Zo verleen je toegang:\n1. Druk op \"Toegang verlenen\" om de systeeminstellingen te openen\n2. Sta Fingrom toe meldingen te lezen\n3. Als Android een beperkte instelling meldt: open App-info van Fingrom → ⋮ → \"Beperkte instellingen toestaan\" en probeer het opnieuw\n4. Ga terug naar Fingrom en selecteer de apps waarvan meldingen worden gelezen';

  @override
  String get notificationAccounts => 'Trefwoorden voor rekeningen';

  @override
  String get notificationAccountsTooltip =>
      'Woorden waaraan de rekening in een melding wordt herkend (laatste cijfers van een kaart, naam van een wallet): typ een woord en druk op Enter om het toe te voegen. Anders wordt de standaardrekening van de app gebruikt';

  @override
  String get notificationApps => 'Apps waarvan meldingen worden gelezen';

  @override
  String notificationAutoImported(Object value) {
    return 'Toegevoegd uit meldingen: $value';
  }

  @override
  String get notificationAutoTooltip =>
      'Herkende meldingen worden zonder bevestiging toegevoegd: direct terwijl Fingrom actief is, anders bij de volgende start. Niet-herkende wachten op controle';

  @override
  String get notificationBalance => 'Trefwoorden voor saldo';

  @override
  String get notificationBalanceTooltip =>
      'Woorden vóór een bedrag dat genegeerd moet worden (saldo, limiet): typ een woord en druk op Enter om het toe te voegen';

  @override
  String notificationCaptured(Object value) {
    return 'Vastgelegde meldingen: $value';
  }

  @override
  String get notificationClear => 'Vastgelegde wissen';

  @override
  String get notificationCurrencyTooltip =>
      'Bedragen zonder valuta (bijv. Afschrijving 20,00) worden in deze valuta genomen';

  @override
  String get notificationDefaultAccount => 'Standaardrekening';

  @override
  String get notificationDescription =>
      'Maak transacties aan uit meldingen van bank- en betaalapps op dit apparaat. Alleen meldingen van de geselecteerde apps worden gelezen, en ze blijven op het apparaat tot ze zijn geïmporteerd. Het bedrag en de valuta worden automatisch herkend.';

  @override
  String get notificationGrant => 'Toegang verlenen';

  @override
  String get notificationIncome => 'Trefwoorden voor inkomsten';

  @override
  String get notificationIncomeTooltip =>
      'Woorden die een melding als inkomsten markeren: typ een woord en druk op Enter om het toe te voegen';

  @override
  String get notificationMerchant => 'Winkellabels';

  @override
  String get notificationMerchantTooltip =>
      'Woorden gevolgd door een dubbele punt en een winkel (Locatie: Winkel): typ een woord en druk op Enter om het toe te voegen';

  @override
  String get notificationNoApps =>
      'Nog geen meldingen ontvangen: apps verschijnen hier nadat ze een melding hebben verstuurd';

  @override
  String get notificationUnparsed => 'Niet herkend';

  @override
  String get notifyHeadline => 'Meldingen Parser';

  @override
  String get ok => 'OK';

  @override
  String get orderPin => 'Geprioriteerde volgorde';

  @override
  String get orderUnpin => 'Algemene volgorde';

  @override
  String get outputFile => 'Bestemming voor het bestand';

  @override
  String get parseFile => 'Bestand parseren';

  @override
  String get password => 'Wachtwoord';

  @override
  String get path => 'Bestandsnaam (om in op te slaan of om uit te laden)';

  @override
  String get paymentType => 'Betalingsinterval';

  @override
  String get paymentsHeadline => 'Terugkerende betalingen';

  @override
  String get pearDisabled => '`-- uitgeschakeld --';

  @override
  String get pearLoading => 'In uitvoering...';

  @override
  String get peerAccept => 'accepteren';

  @override
  String get peerAction => 'Actie';

  @override
  String get peerClosed => 'beëindigd';

  @override
  String get peerConnect => 'Apparaat verbinden';

  @override
  String get peerConnectBtn => 'verbinding maken';

  @override
  String get peerDelete => 'verwijderen';

  @override
  String get peerDevice => 'Aangesloten apparaten';

  @override
  String get peerId => 'Uw apparaat-ID voor verbinding';

  @override
  String get peerOffline => 'offline';

  @override
  String get peerOnline => 'aangesloten';

  @override
  String get peerOtherId => 'Apparaat-ID voor verbinding';

  @override
  String get peerPending => 'in afwachting van';

  @override
  String get peerPing => 'ping';

  @override
  String get peerSent =>
      'Gegevens worden overgedragen naar verbonden Apparaten';

  @override
  String get peerStatus => 'Status';

  @override
  String get peerSync => 'Gegevens overdragen';

  @override
  String pickFile(Object value) {
    return 'Kies .$value-bestand';
  }

  @override
  String pongStatus(Object uuid) {
    return 'Verzoek overgenomen van $uuid';
  }

  @override
  String get privatBankAdd => 'Rekening toevoegen';

  @override
  String get privatBankDescription =>
      'Importeer saldi en transacties van zakelijke rekeningen (eenmanszaken en bedrijven) van Privat24 for Business met een Autoclient-token. Privérekeningen worden niet ondersteund door de API. De toegang is alleen-lezen: er worden geen betalingen gedaan.';

  @override
  String get privatBankHeadline => 'PrivatBank Autoclient (Oekraïne)';

  @override
  String get privatBankIban => 'IBAN van de rekening';

  @override
  String get privatBankIbanInvalid =>
      'Voer een Oekraïense IBAN in: UA gevolgd door 27 cijfers';

  @override
  String get privatBankIbanTooltip =>
      'De API biedt geen lijst met rekeningen: voeg de IBANs van de rekeningen één voor één toe';

  @override
  String privatBankNotReady(Object value) {
    return 'PrivatBank bereidt de afschriften voor (fase $value): probeer het over een paar minuten opnieuw';
  }

  @override
  String get privatBankRemove => 'Rekening verwijderen';

  @override
  String get privatBankToken => 'Autoclient-token';

  @override
  String get privatBankTokenSteps =>
      'Zo krijgt u een Autoclient-token:\n1. Meld u aan bij Privat24 for Business\n2. Open Integratie (Autoclient)\n3. Activeer deze en kopieer het token\n4. Plak het hieronder en druk op \"Verbinden\"\n5. Voeg de IBANs toe van de rekeningen die u wilt importeren';

  @override
  String get privatBankTokenTooltip =>
      'Uitgegeven in Privat24 for Business onder Integratie (Autoclient); versleuteld opgeslagen';

  @override
  String get processIsFinished => 'Voltooid!';

  @override
  String progress(Object value) {
    return 'Voortgang: $value%';
  }

  @override
  String get raiseData => 'Bedrag toevoeging';

  @override
  String get recoveryHeadline => 'Herstel';

  @override
  String get recoveryTooltip => 'Herstellen van';

  @override
  String get releases => 'Geeft  vrij';

  @override
  String get reset => 'Reset';

  @override
  String get returnBack => 'Terug Terug';

  @override
  String get roadmap => 'Routekaart';

  @override
  String get saveNotification => 'Wijzigingen opgeslagen!';

  @override
  String get saveSettingsTooltip => 'Opslaan';

  @override
  String get saveTooltip => 'Opslaan in';

  @override
  String search(Object value) {
    return 'Tonen op \'$value\'-patroon';
  }

  @override
  String get searchTooltip => 'Zoekopdracht';

  @override
  String get secureBioNotMatch => 'Authenticatie mislukt! Probeer het opnieuw';

  @override
  String get secureBioPromptReason => 'Authenticeer uzelf om door te gaan';

  @override
  String get secureBioPromptTitle => 'Biometrische authenticatie';

  @override
  String get secureOtpCode => 'Eenmalig wachtwoordcode';

  @override
  String get secureOtpCodeInvalid =>
      'Ongeldige code! Kies een nieuwe code en voer deze in';

  @override
  String get secureOtpDeactivated => 'Wachtwoordbeveiliging is gedeactiveerd';

  @override
  String get securePassword => 'Wachtwoord (herstelzin)';

  @override
  String get securePasswordEmpty => 'Het wachtwoord mag niet leeg zijn!';

  @override
  String get securePasswordNotMatch => 'Wachtwoorden komen niet overeen!';

  @override
  String get securePasswordRepeat => 'Wachtwoord herhalen';

  @override
  String get securityHeadline => 'Beveiliging';

  @override
  String get settingsBaseHeadline => 'Basis';

  @override
  String get settingsHeadline => 'Instellingen';

  @override
  String get settingsSaved => 'Instellingen opgeslagen!';

  @override
  String get simpleFinDescription =>
      'Importeer saldi en transacties van Amerikaanse banken en kaartuitgevers via een SimpleFIN Bridge. Alleen-lezen toegang: er worden geen betalingen uitgevoerd.';

  @override
  String get simpleFinHeadline => 'SimpleFIN Bridge (US)';

  @override
  String get simpleFinNoCredentials =>
      'De SimpleFIN Bridge gaf een toegangsadres zonder inloggegevens terug';

  @override
  String get simpleFinToken => 'SimpleFIN-installatietoken';

  @override
  String get simpleFinTokenClaimed =>
      'Het installatietoken bestaat niet of is al gebruikt';

  @override
  String get simpleFinTokenInvalid => 'Ongeldig SimpleFIN-installatietoken';

  @override
  String get simpleFinTokenTooltip =>
      'Aangemaakt in je SimpleFIN Bridge (bijv. bridge.simplefin.org) voor deze applicatie; slechts één keer te gebruiken';

  @override
  String get skipFromTotals => 'Niet opnemen in totalen';

  @override
  String get skipTooltip => 'Stap(pen) overslaan';

  @override
  String get sortTooltip => 'Sorteer items';

  @override
  String get sortingAmountAsc => 'Bedrag oplopend';

  @override
  String get sortingAmountDesc => 'Bedrag aflopend';

  @override
  String get sortingCreatedAtAsc => 'Gemaakt op oplopend';

  @override
  String get sortingCreatedAtDesc => 'Gemaakt op aflopend';

  @override
  String get sortingTitleAsc => 'Titel oplopend';

  @override
  String get sortingTitleDesc => 'Titel aflopend';

  @override
  String get sortingUpdatedAtAsc => 'Bijgewerkt op oplopend';

  @override
  String get sortingUpdatedAtDesc => 'Bijgewerkt op aflopend';

  @override
  String get spent => 'uitgegeven';

  @override
  String get splitCancelTooltip => 'Splitsen per maand annuleren';

  @override
  String get splitHeadline => 'Rekening splitsen';

  @override
  String get splitTooltip => 'Limieten aangeven per maand';

  @override
  String get starlingDescription =>
      'Importeer saldi en transacties van Starling Bank-rekeningen met een persoonlijk toegangstoken van uw gratis ontwikkelaarsaccount. De toegang is alleen-lezen: er worden geen betalingen uitgevoerd.';

  @override
  String get starlingHeadline =>
      'Starling Bank Personal Access (Verenigd Koninkrijk)';

  @override
  String get starlingScopes =>
      'Het token mist een machtiging: maak het aan met de scopes \"account:read\", \"balance:read\" en \"transaction:read\"';

  @override
  String get starlingToken => 'Persoonlijk toegangstoken';

  @override
  String get starlingTokenSteps =>
      'Zo krijgt u een persoonlijk toegangstoken:\n1. Registreer u op developer.starlingbank.com (gratis)\n2. Open Personal Access, voeg uw Starling-rekening toe en keur deze goed in de Starling-app\n3. Maak een token aan met de scopes \"account:read\", \"balance:read\" en \"transaction:read\"\n4. Plak het hieronder en druk op \'Verbinden\'';

  @override
  String get starlingTokenTooltip =>
      'Aangemaakt op developer.starlingbank.com onder Personal Access; versleuteld opgeslagen';

  @override
  String get subscription =>
      'Omdat het een open-source project is, zal een abonnement geen extra functies vrijgeven. Het dient echter wel als een investering in de voortdurende evolutie en verbetering van de applicatie, en om de beschikbaarheid ervan te behouden.';

  @override
  String get subscriptionCoffee => 'Koffie kopen';

  @override
  String get subscriptionDinner => 'Trakteer op een etentje';

  @override
  String get subscriptionDonorbox => 'Abonneer je via Donorbox';

  @override
  String get subscriptionGithub => 'Inschrijven via GitHub';

  @override
  String get subscriptionHeadline => 'Sponsoring';

  @override
  String get subscriptionInactive => 'Aankoopdienst niet beschikbaar';

  @override
  String get subscriptionPatreon => 'Abonneer je via Patreon';

  @override
  String get subscriptionPaypal => 'Koop een koffie (PayPal)';

  @override
  String get subscriptionTiny => 'Geef een geluksmunt';

  @override
  String get subscriptionTooltip => 'Steun (Sponsoring)';

  @override
  String get success => 'Geslaagd';

  @override
  String get summary => 'Samenvatting';

  @override
  String get symbol => 'Symbool';

  @override
  String get syncHeadline => 'Synchroniseer apparaten';

  @override
  String get systemMode => 'Systeem';

  @override
  String get tapToOpen => 'Tikken om te openen';

  @override
  String get targetAmount => 'Doel Bedrag';

  @override
  String get tellerAccessToken => 'Toegangstoken';

  @override
  String get tellerAccessTokenTooltip =>
      'Getoond door de verbindingspagina nadat een bank is gekoppeld: plak het hier als Fingrom niet automatisch is geopend';

  @override
  String get tellerAppId => 'Applicatie-ID';

  @override
  String get tellerAppIdTooltip =>
      'Getoond in het Teller Dashboard, begint met \"app_\"';

  @override
  String get tellerCertificate => 'Certificaat (PEM)';

  @override
  String get tellerCertificateInvalid =>
      'Ongeldig certificaat: een PEM-blok \"CERTIFICATE\" wordt verwacht';

  @override
  String get tellerCertificateTooltip =>
      'Uitgegeven in het Teller Dashboard (Certificates); versleuteld opgeslagen. Laat leeg om het opgeslagen certificaat te behouden';

  @override
  String get tellerConnectBank => 'Bank verbinden';

  @override
  String get tellerConnectPage => 'Verbindingspagina';

  @override
  String get tellerConnectPageTooltip =>
      'Opent Teller Connect in een browser en geeft het toegangstoken terug aan Fingrom';

  @override
  String get tellerDescription =>
      'Importeer saldi en transacties van Amerikaanse banken en kaartuitgevers via Teller met uw eigen applicatie, geregistreerd op teller.io (het gratis abonnement staat 100 echte bankverbindingen toe). Alleen-lezen toegang: er worden geen betalingen uitgevoerd.';

  @override
  String get tellerDisconnected =>
      'De bankverbinding vereist uw aandacht (bijv. een nieuwe aanmelding of een bevestigingscode): verbind de bank opnieuw';

  @override
  String get tellerEnvironment => 'Omgeving';

  @override
  String get tellerHeadline => 'Teller (US)';

  @override
  String get tellerIncomplete =>
      'Vul de applicatie-ID in; het certificaat en de privésleutel zijn vereist voor echte bankgegevens';

  @override
  String get tellerKey => 'Privésleutel (PEM)';

  @override
  String get tellerKeyInvalid =>
      'Ongeldige privésleutel: een PEM-blok \"PRIVATE KEY\" wordt verwacht';

  @override
  String get tellerKeyTooltip =>
      'Samen met het certificaat gedownload; versleuteld opgeslagen. Laat leeg om de opgeslagen sleutel te behouden';

  @override
  String get tellerMissingCertificate =>
      'Teller heeft het verzoek zonder clientcertificaat geweigerd: upload het certificaat en de privésleutel, of kies sandbox';

  @override
  String get tellerSteps =>
      'Zo maakt u verbinding:\n1. Registreer u op teller.io en open het Teller Dashboard\n2. Kopieer de applicatie-ID, maak daarna een certificaat met de bijbehorende privésleutel aan en download het (Certificates)\n3. Vul ze hieronder in en kies de omgeving (sandbox: testgegevens, meld u bij een bank aan als \"username\" met \"password\")\n4. Druk op \'Bank verbinden\' en meld u op de geopende pagina aan bij uw bank\n5. Selecteer de rekening en de budgetcategorie en druk op \'Transacties importeren\'';

  @override
  String get tellerUpload => 'Bestand uploaden';

  @override
  String get termPrivacy => 'Privacybeleid';

  @override
  String get termUse => 'Gebruiksvoorwaarden';

  @override
  String get title => 'Title';

  @override
  String get titleAccountTooltip => 'Voer rekeningidentificatiecode in';

  @override
  String get titleBudgetTooltip => 'Naam budgetcategorie invoeren';

  @override
  String get titleGoal => 'Doel';

  @override
  String get titleGoalTooltip => 'Doelomschrijving definiëren';

  @override
  String get to => 'naar';

  @override
  String get total => 'totaal';

  @override
  String get transactionFile => 'Logbestand Fingrom-transacties (.log)';

  @override
  String get transferHeadline => 'Overdracht';

  @override
  String get transferTooltip => 'Details overdracht instellen';

  @override
  String get transfersHeadline => 'Overschrijvingen';

  @override
  String get typeButton => 'Knop';

  @override
  String get upDescription =>
      'Importeer saldi en transacties van betaal- en spaarrekeningen van Up met een persoonlijk toegangstoken. Overboekingen tussen gekoppelde Up-rekeningen (inclusief Round Ups) worden als overboekingen geïmporteerd. De toegang is alleen-lezen: er worden geen betalingen uitgevoerd.';

  @override
  String get upHeadline => 'Up Banking API (Australië)';

  @override
  String get upToken => 'Persoonlijk toegangstoken';

  @override
  String get upTokenSteps =>
      'Zo krijgt u een persoonlijk toegangstoken:\n1. Open de Up-app en ga naar Data sharing → Personal Access Token (of log in op api.up.com.au)\n2. Maak een token aan en kopieer het (het begint met \"up:yeah:\"); een nieuw token vervangt het vorige\n3. Plak het hieronder en druk op \'Verbinden\'\n4. Koppel elke Up-rekening (inclusief spaarrekeningen) zodat overboekingen ertussen als overboekingen worden geïmporteerd';

  @override
  String get upTokenTooltip =>
      'Aangemaakt in de Up-app of op api.up.com.au; versleuteld opgeslagen. Alleen het nieuwste token is geldig';

  @override
  String get updateAccountTooltip => 'Rekening bijwerken';

  @override
  String get updateBillTooltip => 'Rekening bijwerken';

  @override
  String get updateBudgetTooltip => 'Budgetcategorie bijwerken';

  @override
  String get updateGoalTooltip => 'Doel bijwerken';

  @override
  String get updatePaymentTooltip => 'Betaling bijwerken';

  @override
  String get username => 'Gebruikersnaam (rekening)';

  @override
  String get uuid => 'Unieke transactie-identificatiecode';

  @override
  String get validTillDate => 'Geldig tot';

  @override
  String get webDav =>
      'Web gedistribueerde authorisatie en versiebeheer (WebDav)';

  @override
  String get wiseDescription =>
      'Importeer saldi en transacties van Wise-rekeningen in meerdere valuta met een persoonlijk API-token. Omwisselingen tussen gekoppelde saldi worden als overboekingen geïmporteerd. De toegang is alleen-lezen: er worden geen betalingen uitgevoerd.';

  @override
  String get wiseHeadline => 'Wise API (Global)';

  @override
  String get wiseNoProfiles =>
      'Er zijn geen Wise-profielen beschikbaar voor het token';

  @override
  String get wiseProfile => 'Profiel';

  @override
  String get wiseScaRequired =>
      'Wise vereist sterke klantauthenticatie: open het afschrift van dit saldo in de Wise-app en probeer het opnieuw';

  @override
  String get wiseToken => 'Persoonlijk API-token';

  @override
  String get wiseTokenSteps =>
      'Zo krijgt u een persoonlijk API-token:\n1. Log in op wise.com in een browser (in de mobiele app kunnen geen tokens worden aangemaakt)\n2. Open Instellingen → Integraties en tools → API-tokens\n3. Kies \'Nieuw token toevoegen\', geef het een naam (bijv. Fingrom) en kies toegang \'Alleen lezen\'\n4. Bevestig met tweestapsverificatie en kopieer het token\n5. Plak het hieronder en druk op \'Verbinden\'';

  @override
  String get wiseTokenTooltip =>
      'Aangemaakt in Wise onder Instellingen → API-tokens (alleen-lezen indien mogelijk); versleuteld opgeslagen';

  @override
  String get zoomState => 'Inzoomen / Uitzoomen';
}
