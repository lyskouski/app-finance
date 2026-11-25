// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Italian (`it`).
class AppLocalizationsIt extends AppLocalizations {
  AppLocalizationsIt([String locale = 'it']) : super(locale);

  @override
  String get a =>
      'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => 'Informazioni su';

  @override
  String get account => 'Il conto';

  @override
  String get accountFrom => 'Dal conto';

  @override
  String get accountHeadline => 'Conto';

  @override
  String get accountTo => 'Al conto';

  @override
  String get accountTooltip => 'Conti aperti';

  @override
  String get accountType => 'Tipo di conto';

  @override
  String get accountTypeTooltip => 'Scegliere il tipo di conto';

  @override
  String get acknowledgeTooltip => 'Riconoscere';

  @override
  String get activate => 'Attivare';

  @override
  String get actualData => 'Dati storici';

  @override
  String get addAccountTooltip => 'Aggiungi conto';

  @override
  String get addBudgetTooltip => 'Aggiungere una nuova categoria di bilancio';

  @override
  String get addGoalTooltip => 'Aggiungere un nuovo obiettivo';

  @override
  String get addMainTooltip => 'Aggiungi fattura, reddito o trasferimento';

  @override
  String afterNDays(Object value) {
    return 'dopo $value giorni';
  }

  @override
  String get akahuAppToken => 'Token App ID';

  @override
  String get akahuDescription =>
      'Importa saldi e transazioni delle banche neozelandesi collegate ad Akahu con la tua app personale gratuita. Akahu aggiorna i dati dalle banche secondo la propria pianificazione (giornaliera), quindi le transazioni più recenti potrebbero comparire più tardi. L’accesso è di sola lettura: non vengono effettuati pagamenti.';

  @override
  String get akahuHeadline => 'Akahu Personal App (Nuova Zelanda)';

  @override
  String get akahuInactive =>
      'Akahu ha perso l’accesso a questo conto: ricollegalo su my.akahu.nz/connections';

  @override
  String get akahuIncomplete =>
      'Compila il token App ID e il token di accesso utente';

  @override
  String get akahuRefresh => 'Aggiorna dati';

  @override
  String get akahuRefreshed =>
      'È stato chiesto ad Akahu di recuperare nuovi dati dalle banche: riprova l’importazione tra qualche minuto (al massimo una volta all’ora)';

  @override
  String get akahuSteps =>
      'Come ottenere i token:\n1. Registrati su my.akahu.nz e collega le tue banche\n2. Apri la pagina «Developers», accetta i termini per sviluppatori e configura l’autenticazione a più fattori\n3. Copia il token App ID e il token di accesso utente\n4. Incollali qui sotto e premi «Connetti»';

  @override
  String get akahuTokenTooltip =>
      'Mostrato nella pagina «Developers» di my.akahu.nz; memorizzato cifrato';

  @override
  String get akahuUserToken => 'Token di accesso utente';

  @override
  String get amountFrom => 'Importo iniziale';

  @override
  String get amountTo => 'Importo finale';

  @override
  String appBuild(Object build) {
    return 'Costruire: $build';
  }

  @override
  String get appInitHeadline => 'Inizializzazione del progetto';

  @override
  String get appStartHeadline => 'Impostazione iniziale';

  @override
  String get appTitle => 'Fingrom';

  @override
  String appVersion(Object version) {
    return 'Versione: $version';
  }

  @override
  String get automationHeadline => 'Automazione';

  @override
  String get automationTypeDays => 'dopo alcuni giorni';

  @override
  String get backTooltip => 'Ritorno';

  @override
  String get balance => 'Saldo effettivo';

  @override
  String get balanceDate => 'Aggiornamento della data del saldo';

  @override
  String get balanceDateTooltip =>
      'I risultati e le entrate precedenti a questa data non influiscono sul saldo.';

  @override
  String get balanceTooltip => 'Impostare il saldo';

  @override
  String get bankAccount => 'Conto bancario';

  @override
  String get bill => 'Bolletta';

  @override
  String get billHeadline => 'Bollette';

  @override
  String get billSetTooltip => 'Imposta importo';

  @override
  String billSum(Object value) {
    return 'Bollette: $value';
  }

  @override
  String get billTooltip => 'Fatture aperte';

  @override
  String get billTypeTooltip => '[Fattura, reddito o trasferimento';

  @override
  String get brightnessTheme => 'Tema Luminosità';

  @override
  String get btnAdd => 'Aggiungi';

  @override
  String get btnCancel => 'Annulla';

  @override
  String get btnConfirm => 'Confermare';

  @override
  String get btnMore => 'Altro';

  @override
  String get budget => 'Categoria Bilancio';

  @override
  String get budgetHeadline => 'Budget';

  @override
  String get budgetLimit => 'Limite per mese';

  @override
  String get budgetLimitHeadline => 'Aggiustamenti del limite';

  @override
  String get budgetPositive => 'Bilancio, Gestore di riepilogo';

  @override
  String get budgetPositiveOff => 'Ignora i valori negativi';

  @override
  String get budgetPositiveOn => 'Includi i valori negativi';

  @override
  String get budgetRelativeLimit => 'Coefficiente relativo per mese';

  @override
  String get budgetTooltip => 'Tipi di bilancio aperti';

  @override
  String get budgetType => 'Intervallo di budgeting';

  @override
  String get budgetTypeAsIs => 'Illimitato';

  @override
  String get budgetTypeFixed => 'Fisso';

  @override
  String get budgetTypeMonth => 'mensile';

  @override
  String get budgetTypeRelative => 'Relativo';

  @override
  String get budgetTypeWeek => 'settimanale';

  @override
  String get budgetTypeYear => 'annuale';

  @override
  String get cash => 'Contanti';

  @override
  String get chartBarRace => 'Gara a barre per categorie';

  @override
  String get chartForecast => 'Grafico di previsione';

  @override
  String get chartOHLC => 'Grafico a candele (OHLC)';

  @override
  String get chartYtdExpense => 'Spese anno su anno (YTD)';

  @override
  String get clear => 'Valore di caduta';

  @override
  String get closeTooltip => 'Chiusura';

  @override
  String get closedAt => 'Finito fino alla data';

  @override
  String get cmpChart => 'Diagrammi';

  @override
  String get cmpRecent => 'Articoli recenti';

  @override
  String get cmpRecentCount => 'Dimensione dell\'elenco';

  @override
  String get coAuthor => 'autore';

  @override
  String get coConsult => 'consulente';

  @override
  String get coDeveloper => 'sviluppatore';

  @override
  String get coNew => 'Partecipa';

  @override
  String get coPromoter => 'promotore';

  @override
  String get coTranslator => 'traduttore';

  @override
  String get coef => 'coef.';

  @override
  String get collapse => 'Sezione di collasso (ripristino)';

  @override
  String get color => 'Colore';

  @override
  String get colorApp => 'Personalizzato';

  @override
  String get colorBackground => 'Sfondo';

  @override
  String get colorDark => 'Scuro';

  @override
  String get colorInversePrimary => 'Inverse Primary';

  @override
  String get colorInverseSurface => 'Inverse Surface';

  @override
  String get colorLight => 'Chiaro';

  @override
  String get colorOnInverseSurface => 'Sulla superficie inversa';

  @override
  String get colorOnSecondary => 'Sul secondario';

  @override
  String get colorOnSecondaryContainer => 'Su contenitore';

  @override
  String get colorPrimary => 'Primary';

  @override
  String get colorRestore => 'Azzeramento tavolozza';

  @override
  String get colorSecondary => 'Secondario';

  @override
  String get colorSystem => 'Predefinito';

  @override
  String get colorTheme => 'Tavolozza';

  @override
  String get colorTooltip => 'Selezionare un colore';

  @override
  String get colorType => 'Tipo di colore';

  @override
  String get colorUser => 'Personale';

  @override
  String columnMap(Object value) {
    return 'Mappatura della colonna \'$value\'';
  }

  @override
  String columnMapTooltip(Object value) {
    return '\'$value\' - Scegliere la mappatura della colonna';
  }

  @override
  String get completeGoalTooltip => 'Completare l\'obiettivo';

  @override
  String get confirmHeader => 'Confermare l\'azione';

  @override
  String get confirmTooltip =>
      'Siete sicuri? Questa azione non può essere annullata.';

  @override
  String get contributors => 'Contribuenti';

  @override
  String get conversion => 'Conversione';

  @override
  String conversionMessage(Object currency) {
    return 'Preso in $currency';
  }

  @override
  String get copiedToClipboard => 'Copiato negli appunti';

  @override
  String get createAccountHeader => 'Crea un nuovo conto';

  @override
  String get createAccountTooltip => 'Creare un nuovo conto';

  @override
  String get createBillHeader => 'Creare una nuova transazione';

  @override
  String get createBillTooltip => 'Aggiungi una nuova fattura';

  @override
  String get createBudgetHeader => 'Nuova categoria di bilancio';

  @override
  String get createBudgetTooltip => 'Creare una nuova categoria di bilancio';

  @override
  String get createGoalHeader => 'Crea obiettivo';

  @override
  String get createGoalTooltip => 'Aggiungi un nuovo obiettivo';

  @override
  String get createIncomeTooltip => 'Aggiungi nuove entrate';

  @override
  String get createPaymentTooltip => 'Aggiungere un nuovo pagamento';

  @override
  String get createTransferTooltip => 'Crea trasferimento';

  @override
  String get credit => 'Credito';

  @override
  String get creditCard => 'Carta di credito';

  @override
  String get currency => 'Valuta';

  @override
  String get currencyAddHeadline => 'Cambio valuta';

  @override
  String get currencyAddTooltip => 'Aggiungere il tasso di cambio della valuta';

  @override
  String get currencyDefault => 'Valuta predefinita';

  @override
  String get currencyDistribution => 'Distribuzione';

  @override
  String currencyExchange(Object from, Object to) {
    return 'Scambio di valuta: $from -> $to';
  }

  @override
  String get currencyHeadline => 'Valute';

  @override
  String currencyIn(Object value) {
    return 'In $value';
  }

  @override
  String get currencyShort => 'Val.';

  @override
  String get currencyTooltip => 'Tipo di valuta (codice)';

  @override
  String get currencyUpdateTooltip => 'Aggiorna tasso di valuta';

  @override
  String get currentDate => 'Puntatore alla data corrente';

  @override
  String get customAddTooltip => 'Aggiungi widget';

  @override
  String get customDeleteTooltip => 'Eliminare la personalizzazione';

  @override
  String get customSaveTooltip => 'Salva personalizzazione';

  @override
  String get customizeTooltip => 'Personalizza pagina';

  @override
  String get darkMode => 'Scura';

  @override
  String get dateFormat => 'Formato data';

  @override
  String get dateRange => 'Intervallo di date';

  @override
  String get dateTooltip => 'Selezionare la data';

  @override
  String get dayMonday => 'Lunedì';

  @override
  String get daySaturday => 'Sabato';

  @override
  String get dayStartOfMonth => 'Inizio del mese';

  @override
  String get dayStartOfWeek => 'Inizio settimana';

  @override
  String get daySunday => 'Domenica';

  @override
  String get deactivateAction => 'Disattiva la protezione con password';

  @override
  String get debitCard => 'Carta di debito';

  @override
  String def(Object value) {
    return 'Valore predefinito per \'$value\'';
  }

  @override
  String get deleteAccountTooltip => 'Disattivare il conto';

  @override
  String get deleteBillTooltip => 'Cancellare la fattura';

  @override
  String get deleteBudgetTooltip => 'Disattivare la categoria di bilancio';

  @override
  String get deleteGoalTooltip => 'Cancellare l\'obiettivo';

  @override
  String get deleteInvoiceTooltip => 'Cancellare la fattura';

  @override
  String get deletePaymentTooltip => 'Cancellare il pagamento';

  @override
  String get deleteTooltip => 'Cancellare';

  @override
  String get deleteTransferTooltip => 'Elimina Trasferimento';

  @override
  String get deposit => 'Deposito';

  @override
  String get description => 'Descrizione';

  @override
  String get descriptionTooltip => 'Imposta dettagli spese';

  @override
  String get design => 'Modalità di progettazione (specifica per la cultura)';

  @override
  String get designAsiaGeneral => 'Asia Generale';

  @override
  String get designGermany => 'Germania';

  @override
  String get designGlobal => 'Globale';

  @override
  String get designRtlGeneral => 'Scrittura da destra a sinistra';

  @override
  String get details => 'Dettagli';

  @override
  String get detailsTooltip => '****2345 - ultime 4 cifre del numero';

  @override
  String get dtAm => 'am';

  @override
  String get dtAmPm => 'ora in am/pm (0~11)';

  @override
  String get dtDay => 'giorno nel mese';

  @override
  String get dtEscape => 'escape per il testo';

  @override
  String get dtHalfHour => 'ora in am/pm (1~12)';

  @override
  String get dtHour => 'ora nel giorno (0~23)';

  @override
  String get dtMinute => 'minuto in ora';

  @override
  String get dtMonth => 'mese in anno';

  @override
  String get dtNamedDay => 'giorno della settimana';

  @override
  String get dtPm => 'pm';

  @override
  String get dtQuote => 'citazione singola';

  @override
  String get dtSecond => 'secondo in minuto';

  @override
  String get dtYear => 'anno';

  @override
  String get editAccountHeader => 'Aggiornare il conto';

  @override
  String get editAccountTooltip => 'Modifica del conto';

  @override
  String get editBillHeader => 'Aggiornare la fattura';

  @override
  String get editBillTooltip => 'Modifica fattura';

  @override
  String get editBudgetHeader => 'Aggiornare la categoria di bilancio';

  @override
  String get editBudgetTooltip => 'Modifica categoria di bilancio';

  @override
  String get editGoalHeader => 'Aggiorna obiettivo';

  @override
  String get editGoalTooltip => 'Modifica obiettivo';

  @override
  String get editInvoiceTooltip => 'Modifica fattura';

  @override
  String get editPaymentTooltip => 'Modifica del pagamento';

  @override
  String get editTooltip => 'Modifica';

  @override
  String get editTransferTooltip => 'Modifica trasferimento';

  @override
  String get enableBankingAppId => 'ID dell\'applicazione';

  @override
  String get enableBankingBank => 'Banca';

  @override
  String get enableBankingCode =>
      'Indirizzo della pagina aperta dopo l\'autorizzazione';

  @override
  String get enableBankingCodeTooltip =>
      'Conferma l\'accesso presso la banca, poi copia l\'indirizzo dal browser e incollalo qui';

  @override
  String get enableBankingCountry => 'Paese (codice ISO, ad es. IT)';

  @override
  String get enableBankingDescription =>
      'Importa saldi e movimenti delle banche europee tramite l\'API Enable Banking (PSD2) con la tua applicazione registrata su enablebanking.com. Accesso in sola lettura: non vengono effettuati pagamenti.';

  @override
  String get enableBankingHeadline => 'Enable Banking (EU)';

  @override
  String get enableBankingIncomplete =>
      'Compila l\'ID dell\'applicazione, la chiave privata, l\'URL di reindirizzamento e il paese';

  @override
  String get enableBankingKey => 'Chiave privata (PEM)';

  @override
  String get enableBankingKeyInvalid =>
      'Chiave privata non valida: è previsto un blocco PEM \"PRIVATE KEY\"';

  @override
  String get enableBankingKeyNotRsa =>
      'Chiave privata non valida: è prevista una chiave RSA';

  @override
  String get enableBankingKeyTooltip =>
      'Creata con l\'applicazione nel Enable Banking Control Panel; memorizzata cifrata. Lascia vuoto per mantenere la chiave memorizzata';

  @override
  String get enableBankingLoadBanks => 'Carica banche';

  @override
  String get enableBankingNoAuthPage =>
      'Enable Banking non ha restituito alcuna pagina di autorizzazione';

  @override
  String get enableBankingNoCode =>
      'Nessun codice di autorizzazione trovato nell\'indirizzo';

  @override
  String get enableBankingRedirect => 'URL di reindirizzamento';

  @override
  String get enableBankingRedirectTooltip =>
      'Registrato per l\'applicazione; la banca vi ritorna dopo l\'autorizzazione';

  @override
  String get enableBankingStateMismatch =>
      'L\'indirizzo appartiene a un\'altra autorizzazione, connettiti di nuovo';

  @override
  String get encryptionMode => 'Crittografia dei dati';

  @override
  String error(Object value) {
    return 'Errore: $value';
  }

  @override
  String get errorExpired => 'Carta scaduta';

  @override
  String get errorNegative => 'Non può essere negativo! Correggere l\'errore';

  @override
  String get example => 'Esempio';

  @override
  String get expand => 'Espandi la sezione';

  @override
  String get expense => 'Importo delle spese';

  @override
  String get expenseDateTime => 'Fatturato a';

  @override
  String get expenseHeadline => 'Spese';

  @override
  String get expenseTransfer => 'Importo del trasferimento';

  @override
  String exportFile(Object value) {
    return 'Esportazione come file .$value';
  }

  @override
  String get failData => 'Importo Detrazione';

  @override
  String get finTsApproved => 'Approvato nell\'app della banca';

  @override
  String get finTsBankCode => 'Codice bancario (BLZ)';

  @override
  String get finTsCustomerId => 'ID cliente (se diverso dall\'ID utente)';

  @override
  String get finTsDescription =>
      'Importa saldi e movimenti dalle banche che supportano FinTS 4.1 (PIN/TAN). Accesso in sola lettura: non vengono effettuati pagamenti.';

  @override
  String get finTsHeadline => 'Financial Transaction Services (FinTS 4.1)';

  @override
  String get finTsIncomplete =>
      'Compila l\'URL del server, il codice bancario, l\'ID utente e il numero di registrazione del prodotto';

  @override
  String finTsLoginChanged(Object value) {
    return 'La banca ha modificato i dati di accesso, aggiorna l\'ID utente o l\'ID cliente: $value';
  }

  @override
  String finTsLoginRefused(Object value) {
    return 'La banca ha rifiutato l\'accesso precedente: $value. Riprovare con il PIN inserito?';
  }

  @override
  String get finTsPin => 'PIN';

  @override
  String get finTsPinHint => 'Usato solo per questa sessione e mai memorizzato';

  @override
  String get finTsProductId => 'Numero di registrazione del prodotto';

  @override
  String get finTsProductIdTooltip =>
      'Rilasciato dalla Deutsche Kreditwirtschaft al produttore dell\'applicazione';

  @override
  String get finTsTan => 'TAN';

  @override
  String get finTsTanHeadline => 'Autenticazione dell\'operazione (TAN)';

  @override
  String get finTsTanMedium => 'Seleziona il supporto TAN';

  @override
  String get finTsTanMethod => 'Seleziona il metodo TAN';

  @override
  String get finTsUrl => 'URL del server FinTS della banca';

  @override
  String get finTsUserId => 'ID utente (login)';

  @override
  String get finTsVersion => 'Versione del protocollo';

  @override
  String get finTsWebUnsupported =>
      'I server bancari non consentono l\'accesso da un browser. Usa l\'applicazione desktop o mobile.';

  @override
  String get flowTypeInvoice => 'Fattura';

  @override
  String get flowTypeTooltip => 'Tipo di importo: Bolletta, Fattura';

  @override
  String get forecastData => 'Previsione';

  @override
  String get from => 'from';

  @override
  String get goNextTooltip => 'Vai al prossimo';

  @override
  String get goalHeadline => 'Obiettivi';

  @override
  String goalProfit(Object value) {
    return 'Obiettivo degli obiettivi: $value';
  }

  @override
  String get goalProfitTooltip =>
      'Profitto rispetto all\'obiettivo degli obiettivi';

  @override
  String get goalTooltip => 'Obiettivi aperti';

  @override
  String get hasEncrypted =>
      'Una volta impostati, non possono essere modificati';

  @override
  String get helpTooltip => '[Mostra la descrizione della pagina';

  @override
  String get homeHeadline => 'Pagina iniziale';

  @override
  String get homeTooltip => 'Torna alla pagina principale';

  @override
  String get hour => 'Ora';

  @override
  String get icon => 'Icona';

  @override
  String get iconTooltip => 'Selezionare l\'icona';

  @override
  String get ignoreTooltip => 'Ignora';

  @override
  String get importHeadline => 'Importazione / Esportazione';

  @override
  String get income => 'Importo del reddito';

  @override
  String get incomeHeadline => 'Reddito';

  @override
  String get incomeHealth => 'Radar salute reddito';

  @override
  String get incomeTooltip => 'Imposta i dettagli del reddito';

  @override
  String get integrationAccessDenied =>
      'L\'accesso è stato revocato o le credenziali non sono corrette';

  @override
  String get integrationConnect => 'Connetti';

  @override
  String get integrationDateFrom => 'Importa movimenti dal';

  @override
  String get integrationDefaultBudgetCategory =>
      'Categoria di budget predefinita';

  @override
  String get integrationDisconnect => 'Disconnetti';

  @override
  String get integrationForget => 'Dimentica l\'accesso';

  @override
  String get integrationHeadline => 'Integrazioni';

  @override
  String integrationHttpError(Object value) {
    return 'Il servizio ha risposto con un errore (HTTP $value)';
  }

  @override
  String get integrationHttpsRequired =>
      'Sono consentiti solo indirizzi sicuri (HTTPS)';

  @override
  String get integrationImport => 'Importa movimenti';

  @override
  String integrationImported(Object added, Object pending, Object skipped) {
    return 'Importati: $added, saltati perché già presenti: $skipped, in sospeso (non importati): $pending';
  }

  @override
  String integrationInvalidAmount(Object value) {
    return 'Importo non valido: $value';
  }

  @override
  String get integrationNoAccounts => 'La banca non ha fornito alcun conto';

  @override
  String get integrationPaymentRequired =>
      'Il servizio richiede un pagamento per l\'accesso';

  @override
  String get integrationSelectTarget =>
      'Seleziona il conto e la categoria di budget per l\'importazione';

  @override
  String integrationServiceError(Object value) {
    return 'Messaggio del servizio: $value';
  }

  @override
  String get integrationUnexpectedResponse => 'Risposta inattesa del servizio';

  @override
  String get investecApiKey => 'Chiave API';

  @override
  String get investecClientId => 'ID client';

  @override
  String get investecCredentialsTooltip =>
      'Creato in Investec Online in Investec Developer → API keys; memorizzato cifrato';

  @override
  String get investecDescription =>
      'Importa saldi e transazioni dei conti Investec Private Banking (Sudafrica) tramite la Programmable Banking API con le proprie chiavi API. L’accesso è di sola lettura: non vengono effettuati pagamenti.';

  @override
  String get investecHeadline => 'Investec Programmable Banking (Sudafrica)';

  @override
  String get investecIncomplete =>
      'Compila l’ID client, il segreto e la chiave API';

  @override
  String get investecSandbox => 'Sandbox (dati di prova)';

  @override
  String get investecSecret => 'Segreto';

  @override
  String get investecSteps =>
      'Come ottenere le chiavi API:\n1. Accedi a Investec Online e iscriviti a Investec Developer (Programmable Banking)\n2. Apri API keys e crea una chiave con accesso a conti e transazioni\n3. Confermala con la verifica in due passaggi e copia l’ID client, il segreto e la chiave API\n4. Incollali qui sotto e premi «Connetti»';

  @override
  String get invoiceHeadline => 'Fatture';

  @override
  String invoiceSum(Object value) {
    return 'Fatture: $value';
  }

  @override
  String get isCleaned => 'Rimuovere i dati esistenti';

  @override
  String get isCreated => 'Già creato, seguire i passi successivi!';

  @override
  String get isEncrypted =>
      'Il file è crittografato (per impostazione predefinita)';

  @override
  String get isRequired => 'richiesto';

  @override
  String get language => 'Lingua';

  @override
  String get left => 'sinistra';

  @override
  String get lightMode => 'Luce';

  @override
  String get link => 'Localizzatore uniforme di risorse (URL)';

  @override
  String get managerHeadline => 'Gestore';

  @override
  String get meaning => 'Significato';

  @override
  String get metricsHeadline => 'Metrica';

  @override
  String get metricsTooltip => 'Metriche';

  @override
  String get milestones => 'Pietre miliari';

  @override
  String get minute => 'Minuto';

  @override
  String get missingContent => 'Il file non può essere elaborato (o annullato)';

  @override
  String get monobankCreateAccount => 'Crea conto';

  @override
  String get monobankDescription =>
      'Importazione di saldi e movimenti di carte e salvadanai monobank con un token personale. monobank consente una richiesta al minuto: importare un periodo lungo richiede alcuni minuti. Accesso in sola lettura: non vengono eseguiti pagamenti.';

  @override
  String get monobankHeadline => 'monobank Personal API (Ucraina)';

  @override
  String get monobankJar => 'Salvadanaio';

  @override
  String monobankProgress(Object done, Object total) {
    return 'Richiesta degli estratti: $done di $total';
  }

  @override
  String monobankRateLimit(Object value) {
    return 'monobank consente una richiesta al minuto: la prossima tra $value s';
  }

  @override
  String get monobankToken => 'Token personale';

  @override
  String get monobankTokenSteps =>
      'Come ottenere un token personale:\n1. Apri api.monobank.ua in un browser\n2. Scansiona il codice QR con l’app monobank e conferma l’accesso\n3. Copia il token dalla pagina\n4. Incollalo qui sotto e premi «Connetti»\n5. Collega ogni carta o salvadanaio a un conto (o creane uno) e importa';

  @override
  String get monobankTokenTooltip =>
      'Rilasciato su api.monobank.ua dopo la scansione del codice QR nell’app monobank; conservato cifrato';

  @override
  String get monzoApprove =>
      'Approva l’accesso nell’app Monzo, poi premi di nuovo «Connetti»';

  @override
  String get monzoClientId => 'ID client';

  @override
  String get monzoClientSecret => 'Segreto client';

  @override
  String get monzoClientSecretTooltip =>
      'Mostrato per il client OAuth su developers.monzo.com; memorizzato cifrato. Lascia vuoto per mantenere il segreto memorizzato';

  @override
  String get monzoCode => 'Indirizzo della pagina aperta dopo l\'accesso';

  @override
  String get monzoCodeTooltip =>
      'Se Fingrom non si è aperto automaticamente, copia l\'indirizzo dal browser e incollalo qui';

  @override
  String get monzoDescription =>
      'Importa saldi e transazioni dei conti Monzo con il proprio client OAuth registrato su developers.monzo.com (solo per uso personale). L’accesso è di sola lettura: non vengono effettuati pagamenti.';

  @override
  String get monzoExpired => 'L’accesso a Monzo è scaduto: connettiti di nuovo';

  @override
  String monzoFullHistory(Object value) {
    return 'Lo storico completo è disponibile fino alle $value: scegli una data precedente e importa ora. In seguito Monzo fornisce solo gli ultimi 90 giorni';
  }

  @override
  String get monzoHeadline => 'Monzo Developer API (Regno Unito)';

  @override
  String monzoHistoryLimited(Object value) {
    return 'Monzo fornisce solo gli ultimi 90 giorni: i movimenti vengono importati dal $value';
  }

  @override
  String get monzoIncomplete =>
      'Compila l’ID client, il segreto client e l’URL di reindirizzamento';

  @override
  String get monzoRedirect => 'URL di reindirizzamento';

  @override
  String get monzoRedirectTooltip =>
      'Imposta esattamente questo indirizzo per il client OAuth; Monzo vi ritorna dopo l\'accesso';

  @override
  String get monzoSteps =>
      'Come connettersi:\n1. Accedi a developers.monzo.com con l’email del tuo conto Monzo\n2. Apri Clients → New OAuth Client, scegli «Confidential» e imposta l’URL di reindirizzamento mostrato qui sotto\n3. Copia l’ID client e il segreto client, incollali qui sotto e premi «Connetti»\n4. Apri il link inviato via email, approva l’accesso nell’app Monzo e premi di nuovo «Connetti»\n5. Importa subito: lo storico completo è disponibile solo per 5 minuti dopo l’approvazione, poi solo gli ultimi 90 giorni';

  @override
  String get navigationTooltip => 'Aprire il menu principale';

  @override
  String netProfit(Object value) {
    return 'Profitto: $value';
  }

  @override
  String get noChartData => 'Mancano (o non sono sufficienti) dati da mostrare';

  @override
  String get notificationAccessSettings => 'Accesso alle notifiche';

  @override
  String get notificationAccessSteps =>
      'Come concedere l\'accesso:\n1. Premi \"Concedi accesso\" per aprire le impostazioni di sistema\n2. Consenti a Fingrom di leggere le notifiche\n3. Se Android segnala un\'impostazione con restrizioni: apri le info dell\'app Fingrom → ⋮ → \"Consenti impostazioni con restrizioni\" e riprova\n4. Torna a Fingrom e seleziona le app di cui leggere le notifiche';

  @override
  String get notificationAccounts => 'Parole chiave dei conti';

  @override
  String get notificationAccountsTooltip =>
      'Parole che riconoscono il conto in una notifica (ultime cifre della carta, nome del portafoglio): digita una parola e premi Invio per aggiungerla. Altrimenti viene usato il conto predefinito dell\'app';

  @override
  String get notificationApps => 'App di cui leggere le notifiche';

  @override
  String notificationAutoImported(Object value) {
    return 'Aggiunti dalle notifiche: $value';
  }

  @override
  String get notificationAutoTooltip =>
      'Le notifiche riconosciute vengono aggiunte senza conferma: subito mentre Fingrom è in esecuzione, altrimenti al prossimo avvio. Quelle non riconosciute attendono una revisione';

  @override
  String get notificationBalance => 'Parole chiave di saldo';

  @override
  String get notificationBalanceTooltip =>
      'Parole che precedono un importo da ignorare (saldo, limite): digita una parola e premi Invio per aggiungerla';

  @override
  String notificationCaptured(Object value) {
    return 'Notifiche acquisite: $value';
  }

  @override
  String get notificationClear => 'Cancella acquisite';

  @override
  String get notificationCurrencyTooltip =>
      'Gli importi senza valuta (ad es. Addebito 20,00) sono presi in questa valuta';

  @override
  String get notificationDefaultAccount => 'Conto predefinito';

  @override
  String get notificationDescription =>
      'Crea movimenti dalle notifiche delle app bancarie e di pagamento su questo dispositivo. Vengono lette solo le notifiche delle app selezionate, che restano sul dispositivo fino all\'importazione. Importo e valuta vengono riconosciuti automaticamente.';

  @override
  String get notificationGrant => 'Concedi accesso';

  @override
  String get notificationIncome => 'Parole chiave di entrata';

  @override
  String get notificationIncomeTooltip =>
      'Parole che contrassegnano una notifica come entrata: digita una parola e premi Invio per aggiungerla';

  @override
  String get notificationMerchant => 'Etichette dell\'esercente';

  @override
  String get notificationMerchantTooltip =>
      'Parole seguite da due punti e da un esercente (Luogo: Negozio): digita una parola e premi Invio per aggiungerla';

  @override
  String get notificationNoApps =>
      'Nessuna notifica ricevuta finora: le app compaiono qui dopo aver inviato una notifica';

  @override
  String get notificationUnparsed => 'Non riconosciuto';

  @override
  String get notifyHeadline => 'Parser delle notifiche';

  @override
  String get ok => 'OK';

  @override
  String get orderPin => 'Ordine prioritario';

  @override
  String get orderUnpin => 'Ordine generalizzato';

  @override
  String get outputFile => 'Destinazione del file';

  @override
  String get parseFile => 'Analizza il file';

  @override
  String get password => 'Password';

  @override
  String get path => 'Nome del file (da salvare o caricare)';

  @override
  String get paymentType => 'Intervallo di pagamento';

  @override
  String get paymentsHeadline => 'Pagamenti ricorrenti';

  @override
  String get pearDisabled => '-- disabilitato --';

  @override
  String get pearLoading => 'In corso...';

  @override
  String get peerAccept => 'accettare';

  @override
  String get peerAction => 'Azione';

  @override
  String get peerClosed => 'terminato';

  @override
  String get peerConnect => 'Connetti il dispositivo';

  @override
  String get peerConnectBtn => 'connettersi';

  @override
  String get peerDelete => 'Cancellare';

  @override
  String get peerDevice => 'Dispositivi connessi';

  @override
  String get peerId => 'L\'identificatore del dispositivo per la connessione';

  @override
  String get peerOffline => 'offline';

  @override
  String get peerOnline => 'connesso';

  @override
  String get peerOtherId => 'Identificatore dispositivo per la connessione';

  @override
  String get peerPending => 'in attesa';

  @override
  String get peerPing => 'ping';

  @override
  String get peerSent => 'I dati vengono trasferiti ai dispositivi connessi';

  @override
  String get peerStatus => 'Stato';

  @override
  String get peerSync => 'Trasferimento dei dati';

  @override
  String pickFile(Object value) {
    return 'Preleva il file .$value';
  }

  @override
  String pongStatus(Object uuid) {
    return 'Richiesta accettata da $uuid';
  }

  @override
  String get privatBankAdd => 'Aggiungi conto';

  @override
  String get privatBankDescription =>
      'Importa saldi e transazioni dei conti aziendali (ditte individuali e società) di Privat24 for Business con un token Autoclient. I conti personali non sono supportati dall\'API. L\'accesso è di sola lettura: non vengono effettuati pagamenti.';

  @override
  String get privatBankHeadline => 'PrivatBank Autoclient (Ucraina)';

  @override
  String get privatBankIban => 'IBAN del conto';

  @override
  String get privatBankIbanInvalid =>
      'Inserisci un IBAN ucraino: UA seguito da 27 cifre';

  @override
  String get privatBankIbanTooltip =>
      'L\'API non fornisce un elenco dei conti: aggiungi gli IBAN dei conti uno alla volta';

  @override
  String privatBankNotReady(Object value) {
    return 'PrivatBank sta preparando gli estratti conto (fase $value): riprova tra qualche minuto';
  }

  @override
  String get privatBankRemove => 'Rimuovi conto';

  @override
  String get privatBankToken => 'Token Autoclient';

  @override
  String get privatBankTokenSteps =>
      'Come ottenere un token Autoclient:\n1. Accedi a Privat24 for Business\n2. Apri Integrazione (Autoclient)\n3. Attivala e copia il token\n4. Incollalo qui sotto e premi «Connetti»\n5. Aggiungi gli IBAN dei conti da importare';

  @override
  String get privatBankTokenTooltip =>
      'Rilasciato in Privat24 for Business in Integrazione (Autoclient); memorizzato in forma crittografata';

  @override
  String get processIsFinished => 'Finito!';

  @override
  String progress(Object value) {
    return 'Progressi: $value%';
  }

  @override
  String get raiseData => 'Importo Aggiunta';

  @override
  String get recoveryHeadline => 'Recupero';

  @override
  String get recoveryTooltip => 'Recupero da';

  @override
  String get releases => 'Rilascio';

  @override
  String get reset => 'reset';

  @override
  String get returnBack => 'Ritorno indietro';

  @override
  String get roadmap => 'Tabella di marcia';

  @override
  String get saveNotification => 'Modifiche salvate!';

  @override
  String get saveSettingsTooltip => 'Salva';

  @override
  String get saveTooltip => 'Salva in';

  @override
  String search(Object value) {
    return 'Mostra per modello \'$value\'';
  }

  @override
  String get searchTooltip => 'Ricerca';

  @override
  String get secureBioNotMatch => 'Autenticazione fallita! Per favore, riprova';

  @override
  String get secureBioPromptReason => 'Per favore, autentica per procedere';

  @override
  String get secureBioPromptTitle => 'Autenticazione biometrica';

  @override
  String get secureOtpCode => 'Codice password monouso';

  @override
  String get secureOtpCodeInvalid =>
      'Codice non valido! Per favore, genera un nuovo codice e inseriscilo';

  @override
  String get secureOtpDeactivated => 'La protezione con password è disattivata';

  @override
  String get securePassword => 'Password (frase di recupero)';

  @override
  String get securePasswordEmpty => 'La password non può essere vuota!';

  @override
  String get securePasswordNotMatch => 'Le password non corrispondono!';

  @override
  String get securePasswordRepeat => 'Ripetere la password';

  @override
  String get securityHeadline => 'Sicurezza';

  @override
  String get settingsBaseHeadline => 'Nozioni di base';

  @override
  String get settingsHeadline => 'Impostazioni';

  @override
  String get settingsSaved => 'Impostazioni salvate!';

  @override
  String get simpleFinDescription =>
      'Importa saldi e movimenti di banche ed emittenti di carte statunitensi tramite un SimpleFIN Bridge. Accesso in sola lettura: non vengono effettuati pagamenti.';

  @override
  String get simpleFinHeadline => 'SimpleFIN Bridge (US)';

  @override
  String get simpleFinNoCredentials =>
      'Il SimpleFIN Bridge ha restituito un indirizzo di accesso senza credenziali';

  @override
  String get simpleFinToken => 'Token di configurazione SimpleFIN';

  @override
  String get simpleFinTokenClaimed =>
      'Il token di configurazione non esiste o è già stato utilizzato';

  @override
  String get simpleFinTokenInvalid =>
      'Token di configurazione SimpleFIN non valido';

  @override
  String get simpleFinTokenTooltip =>
      'Creato nel tuo SimpleFIN Bridge (ad es. bridge.simplefin.org) per questa applicazione; utilizzabile una sola volta';

  @override
  String get skipFromTotals => 'Escludere dai totali';

  @override
  String get skipTooltip => 'Salta i passi';

  @override
  String get sortTooltip => 'Ordina elementi';

  @override
  String get sortingAmountAsc => 'Importo crescente';

  @override
  String get sortingAmountDesc => 'Importo decrescente';

  @override
  String get sortingCreatedAtAsc => 'Creato il crescente';

  @override
  String get sortingCreatedAtDesc => 'Creato il decrescente';

  @override
  String get sortingTitleAsc => 'Titolo crescente';

  @override
  String get sortingTitleDesc => 'Titolo decrescente';

  @override
  String get sortingUpdatedAtAsc => 'Aggiornato il crescente';

  @override
  String get sortingUpdatedAtDesc => 'Aggiornato il decrescente';

  @override
  String get spent => 'speso';

  @override
  String get splitCancelTooltip => 'Annullare la suddivisione per mese';

  @override
  String get splitHeadline => 'Dividi il conto';

  @override
  String get splitTooltip => 'Dichiara i limiti al mese';

  @override
  String get starlingDescription =>
      'Importa saldi e transazioni dei conti Starling Bank con un token di accesso personale del tuo account sviluppatore gratuito. L’accesso è di sola lettura: non vengono effettuati pagamenti.';

  @override
  String get starlingHeadline => 'Starling Bank Personal Access (Regno Unito)';

  @override
  String get starlingScopes =>
      'Al token manca un’autorizzazione: crealo con gli ambiti \"account:read\", \"balance:read\" e \"transaction:read\"';

  @override
  String get starlingToken => 'Token di accesso personale';

  @override
  String get starlingTokenSteps =>
      'Come ottenere un token di accesso personale:\n1. Registrati su developer.starlingbank.com (gratis)\n2. Apri Personal Access, aggiungi il tuo conto Starling e approvalo nell’app Starling\n3. Crea un token con gli ambiti \"account:read\", \"balance:read\" e \"transaction:read\"\n4. Incollalo qui sotto e premi «Connetti»';

  @override
  String get starlingTokenTooltip =>
      'Creato su developer.starlingbank.com in Personal Access; memorizzato cifrato';

  @override
  String get subscription =>
      'Essendo un progetto open-source, l\'abbonamento non sblocca alcuna funzionalità aggiuntiva. Tuttavia, serve come investimento per la continua evoluzione e il miglioramento dell\'applicazione e per preservarne la disponibilità.';

  @override
  String get subscriptionCoffee => 'Comprare un caffè';

  @override
  String get subscriptionDinner => 'Offri una cena';

  @override
  String get subscriptionDonorbox => 'Iscriviti tramite Donorbox';

  @override
  String get subscriptionGithub => 'Iscriviti via GitHub';

  @override
  String get subscriptionHeadline => 'Sponsorizzazione';

  @override
  String get subscriptionInactive => 'Servizio di acquisto non disponibile';

  @override
  String get subscriptionPatreon => 'Abbonamento tramite Patreon';

  @override
  String get subscriptionPaypal => 'Acquista un caffè (PayPal)';

  @override
  String get subscriptionTiny => 'Regala una moneta fortunata';

  @override
  String get subscriptionTooltip => 'Sostegno (Sponsorizzazione)';

  @override
  String get success => 'Riuscito';

  @override
  String get summary => 'Riepilogo';

  @override
  String get symbol => 'Simbolo';

  @override
  String get syncHeadline => 'Dispositivi di sincronizzazione';

  @override
  String get systemMode => 'System';

  @override
  String get tapToOpen => 'Toccare per aprire';

  @override
  String get targetAmount => 'Importo target';

  @override
  String get tellerAccessToken => 'Token di accesso';

  @override
  String get tellerAccessTokenTooltip =>
      'Mostrato dalla pagina di connessione dopo il collegamento di una banca: incollalo qui se Fingrom non è stato aperto automaticamente';

  @override
  String get tellerAppId => 'ID dell\'applicazione';

  @override
  String get tellerAppIdTooltip =>
      'Mostrato nel Teller Dashboard, inizia con \"app_\"';

  @override
  String get tellerCertificate => 'Certificato (PEM)';

  @override
  String get tellerCertificateInvalid =>
      'Certificato non valido: è previsto un blocco PEM \"CERTIFICATE\"';

  @override
  String get tellerCertificateTooltip =>
      'Emesso nel Teller Dashboard (Certificates); memorizzato cifrato. Lascia vuoto per mantenere il certificato memorizzato';

  @override
  String get tellerConnectBank => 'Collega banca';

  @override
  String get tellerConnectPage => 'Pagina di connessione';

  @override
  String get tellerConnectPageTooltip =>
      'Apre Teller Connect in un browser e restituisce il token di accesso a Fingrom';

  @override
  String get tellerDescription =>
      'Importa saldi e movimenti di banche ed emittenti di carte statunitensi tramite Teller con la tua applicazione registrata su teller.io (il piano gratuito consente 100 connessioni bancarie reali). Accesso in sola lettura: non vengono effettuati pagamenti.';

  @override
  String get tellerDisconnected =>
      'Il collegamento con la banca richiede la tua attenzione (ad es. un nuovo accesso o un codice di conferma): collega di nuovo la banca';

  @override
  String get tellerEnvironment => 'Ambiente';

  @override
  String get tellerHeadline => 'Teller (US)';

  @override
  String get tellerIncomplete =>
      'Compila l\'ID dell\'applicazione; il certificato e la chiave privata sono necessari per i dati bancari reali';

  @override
  String get tellerKey => 'Chiave privata (PEM)';

  @override
  String get tellerKeyInvalid =>
      'Chiave privata non valida: è previsto un blocco PEM \"PRIVATE KEY\"';

  @override
  String get tellerKeyTooltip =>
      'Scaricata insieme al certificato; memorizzata cifrata. Lascia vuoto per mantenere la chiave memorizzata';

  @override
  String get tellerMissingCertificate =>
      'Teller ha rifiutato la richiesta senza un certificato client: carica il certificato e la chiave privata, oppure scegli sandbox';

  @override
  String get tellerSteps =>
      'Come collegarsi:\n1. Registrati su teller.io e apri il Teller Dashboard\n2. Copia l\'ID dell\'applicazione, poi crea e scarica un certificato con la relativa chiave privata (Certificates)\n3. Compilali qui sotto e scegli l\'ambiente (sandbox: dati di prova, accedi a una banca come \"username\" con \"password\")\n4. Premi «Collega banca» e accedi alla tua banca nella pagina aperta\n5. Seleziona il conto e la categoria di budget, poi premi «Importa movimenti»';

  @override
  String get tellerUpload => 'Carica file';

  @override
  String get termPrivacy => 'Informativa sulla privacy';

  @override
  String get termUse => 'Condizioni d\'uso';

  @override
  String get title => 'Titolo';

  @override
  String get titleAccountTooltip => 'Inserire l\'identificativo del conto';

  @override
  String get titleBudgetTooltip =>
      'Inserire il nome della categoria di bilancio';

  @override
  String get titleGoal => 'Obiettivo';

  @override
  String get titleGoalTooltip => 'Definire la descrizione dell\'obiettivo';

  @override
  String get to => 'to';

  @override
  String get total => 'totale';

  @override
  String get transactionFile =>
      'File di registro delle transazioni Fingrom (.log)';

  @override
  String get transferHeadline => 'Trasferimento';

  @override
  String get transferTooltip => 'Impostare i dettagli del trasferimento';

  @override
  String get transfersHeadline => 'Trasferimenti';

  @override
  String get typeButton => 'Pulsante';

  @override
  String get updateAccountTooltip => 'Aggiorna conto';

  @override
  String get updateBillTooltip => 'Aggiorna fattura';

  @override
  String get updateBudgetTooltip => 'Aggiorna categoria di bilancio';

  @override
  String get updateGoalTooltip => 'Aggiorna obiettivo';

  @override
  String get updatePaymentTooltip => 'Aggiornamento del pagamento';

  @override
  String get username => 'Nome utente (conto)';

  @override
  String get uuid => 'Identificatore unico di transazione';

  @override
  String get validTillDate => 'Scadenza valida';

  @override
  String get webDav =>
      'Autenticazione e versionamento distribuiti via web (WebDav)';

  @override
  String get wiseDescription =>
      'Importa saldi e transazioni dei conti multivaluta Wise con un token API personale. Le conversioni tra saldi collegati vengono importate come trasferimenti. L’accesso è di sola lettura: non vengono effettuati pagamenti.';

  @override
  String get wiseHeadline => 'Wise API (Global)';

  @override
  String get wiseNoProfiles => 'Nessun profilo Wise disponibile per il token';

  @override
  String get wiseProfile => 'Profilo';

  @override
  String get wiseScaRequired =>
      'Wise richiede un’autenticazione forte del cliente: apri l’estratto conto di questo saldo nell’app Wise, quindi riprova';

  @override
  String get wiseToken => 'Token API personale';

  @override
  String get wiseTokenSteps =>
      'Come ottenere un token API personale:\n1. Accedi a wise.com da un browser (i token non si possono creare nell’app mobile)\n2. Apri Impostazioni → Integrazioni e strumenti → Token API\n3. Scegli «Aggiungi nuovo token», assegna un nome (ad es. Fingrom) e seleziona l’accesso «Sola lettura»\n4. Conferma con la verifica in due passaggi e copia il token\n5. Incollalo qui sotto e premi «Connetti»';

  @override
  String get wiseTokenTooltip =>
      'Creato in Wise in Impostazioni → Token API (di sola lettura, se disponibile); memorizzato cifrato';

  @override
  String get zoomState => 'Zoom avanti / Zoom indietro';
}
