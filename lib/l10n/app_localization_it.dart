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
  String get dayStartOfMonth => 'Inizio del mese';

  @override
  String get dayStartOfWeek => 'Inizio settimana';

  @override
  String get daySunday => 'Domenica';

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
  String get meaning => 'Significato';

  @override
  String get metricsHeadline => 'Metrica';

  @override
  String get metricsTooltip => 'Metriche';

  @override
  String get milestones => 'Pietre miliari';

  @override
  String get missingContent => 'Il file non può essere elaborato (o annullato)';

  @override
  String get navigationTooltip => 'Aprire il menu principale';

  @override
  String netProfit(Object value) {
    return 'Profitto: $value';
  }

  @override
  String get noChartData => 'Mancano (o non sono sufficienti) dati da mostrare';

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
  String get settingsBaseHeadline => 'Nozioni di base';

  @override
  String get settingsHeadline => 'Impostazioni';

  @override
  String get skipFromTotals => 'Escludere dai totali';

  @override
  String get skipTooltip => 'Salta i passi';

  @override
  String get spent => 'speso';

  @override
  String get splitCancelTooltip => 'Annullare la suddivisione per mese';

  @override
  String get splitTooltip => 'Dichiara i limiti al mese';

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
  String get zoomState => 'Zoom avanti / Zoom indietro';
}
