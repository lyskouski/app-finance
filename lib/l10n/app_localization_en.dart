// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get a =>
      'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => 'About';

  @override
  String get account => 'Account';

  @override
  String get accountFrom => 'From Account';

  @override
  String get accountHeadline => 'Accounts';

  @override
  String get accountTo => 'To Account';

  @override
  String get accountTooltip => 'Open Accounts';

  @override
  String get accountType => 'Account Type';

  @override
  String get accountTypeTooltip => 'Choose Account Type';

  @override
  String get acknowledgeTooltip => 'Acknowledge';

  @override
  String get activate => 'Activate';

  @override
  String get actualData => 'Historical Data';

  @override
  String get addAccountTooltip => 'Add Account';

  @override
  String get addBudgetTooltip => 'Add new Budget Category';

  @override
  String get addGoalTooltip => 'Add new Goal';

  @override
  String get addMainTooltip => 'Add Bill , Income or Transfer';

  @override
  String afterNDays(Object value) {
    return 'after $value days';
  }

  @override
  String get amountFrom => 'From Amount';

  @override
  String get amountTo => 'To Amount';

  @override
  String appBuild(Object build) {
    return 'Build: $build';
  }

  @override
  String get appInitHeadline => 'Project Initialization';

  @override
  String get appStartHeadline => 'Initial Setup';

  @override
  String get appTitle => 'Fingrom';

  @override
  String appVersion(Object version) {
    return 'Version: $version';
  }

  @override
  String get automationHeadline => 'Automation';

  @override
  String get automationTypeDays => 'after some days';

  @override
  String get backTooltip => 'Return back';

  @override
  String get balance => 'Actual Balance';

  @override
  String get balanceDate => 'Balance Date Update';

  @override
  String get balanceDateTooltip =>
      'Outcomes and Incomes before this date won\'t affect the balance';

  @override
  String get balanceTooltip => 'Set Balance';

  @override
  String get bankAccount => 'Bank Account';

  @override
  String get bill => 'Bill';

  @override
  String get billHeadline => 'Bills';

  @override
  String get billSetTooltip => 'Set Amount';

  @override
  String billSum(Object value) {
    return 'Bills: $value';
  }

  @override
  String get billTooltip => 'Open Bills';

  @override
  String get billTypeTooltip => '[Type] Bill, Income or Transfer';

  @override
  String get brightnessTheme => 'Brightness Theme';

  @override
  String get btnAdd => 'Add';

  @override
  String get btnCancel => 'Cancel';

  @override
  String get btnConfirm => 'Confirm';

  @override
  String get btnMore => 'More';

  @override
  String get budget => 'Budget Category';

  @override
  String get budgetHeadline => 'Budgets';

  @override
  String get budgetLimit => 'Limit per Month';

  @override
  String get budgetLimitHeadline => 'Limit Adjustments';

  @override
  String get budgetPositive => 'Budget, Summary Handler';

  @override
  String get budgetPositiveOff => 'Ignore negative values';

  @override
  String get budgetPositiveOn => 'Include negative values';

  @override
  String get budgetRelativeLimit => 'Relative Coefficient per Month';

  @override
  String get budgetTooltip => 'Open Budget Types';

  @override
  String get budgetType => 'Budgeting Interval';

  @override
  String get budgetTypeAsIs => 'Unlimited';

  @override
  String get budgetTypeFixed => 'Fixed';

  @override
  String get budgetTypeMonth => 'monthly';

  @override
  String get budgetTypeRelative => 'Relative';

  @override
  String get budgetTypeWeek => 'weekly';

  @override
  String get budgetTypeYear => 'yearly';

  @override
  String get cash => 'Cash';

  @override
  String get chartBarRace => 'Bar Race for Categories';

  @override
  String get chartForecast => 'Forecast Chart';

  @override
  String get chartOHLC => 'Candlestick (OHLC) Chart';

  @override
  String get chartYtdExpense => 'YTD Expenses';

  @override
  String get clear => 'Drop Value';

  @override
  String get closeTooltip => 'Close';

  @override
  String get closedAt => 'Finished till Date';

  @override
  String get cmpChart => 'Diagrams';

  @override
  String get cmpRecent => 'Recent Items';

  @override
  String get cmpRecentCount => 'List Size';

  @override
  String get coAuthor => 'author';

  @override
  String get coConsult => 'advisor';

  @override
  String get coDeveloper => 'developer';

  @override
  String get coNew => 'Join';

  @override
  String get coPromoter => 'promoter';

  @override
  String get coTranslator => 'translator';

  @override
  String get coef => 'coef.';

  @override
  String get collapse => 'Collapse (Restore) Section';

  @override
  String get color => 'Color';

  @override
  String get colorApp => 'Custom';

  @override
  String get colorBackground => 'Background';

  @override
  String get colorDark => 'Dark';

  @override
  String get colorInversePrimary => 'Inverse Primary';

  @override
  String get colorInverseSurface => 'Inverse Surface';

  @override
  String get colorLight => 'Light';

  @override
  String get colorOnInverseSurface => 'On Inverse Surface';

  @override
  String get colorOnSecondary => 'On Secondary';

  @override
  String get colorOnSecondaryContainer => 'On Container';

  @override
  String get colorPrimary => 'Primary';

  @override
  String get colorRestore => 'Reset Palette';

  @override
  String get colorSecondary => 'Secondary';

  @override
  String get colorSystem => 'Default';

  @override
  String get colorTheme => 'Palette';

  @override
  String get colorTooltip => 'Select a Color';

  @override
  String get colorType => 'Color Type';

  @override
  String get colorUser => 'Personal';

  @override
  String columnMap(Object value) {
    return 'Mapping for Column \'$value\'';
  }

  @override
  String columnMapTooltip(Object value) {
    return '\'$value\' - Choose Column Mapping';
  }

  @override
  String get completeGoalTooltip => 'Complete Goal';

  @override
  String get confirmHeader => 'Confirm Action';

  @override
  String get confirmTooltip => 'Are you sure? This action cannot be undone.';

  @override
  String get contributors => 'Contributors';

  @override
  String get conversion => 'Conversion';

  @override
  String conversionMessage(Object currency) {
    return 'Taken in $currency';
  }

  @override
  String get copiedToClipboard => 'Copied to Clipboard';

  @override
  String get createAccountHeader => 'Create new Account';

  @override
  String get createAccountTooltip => 'Create new Account';

  @override
  String get createBillHeader => 'Create new Transaction';

  @override
  String get createBillTooltip => 'Add new Bill';

  @override
  String get createBudgetHeader => 'New Budget Category';

  @override
  String get createBudgetTooltip => 'Create new Budget Category';

  @override
  String get createGoalHeader => 'Create Goal';

  @override
  String get createGoalTooltip => 'Add new Goal';

  @override
  String get createIncomeTooltip => 'Add new Income';

  @override
  String get createPaymentTooltip => 'Add new Payment';

  @override
  String get createTransferTooltip => 'Create Transfer';

  @override
  String get credit => 'Credit';

  @override
  String get creditCard => 'Credit Card';

  @override
  String get currency => 'Currency';

  @override
  String get currencyAddHeadline => 'Currency Exchange';

  @override
  String get currencyAddTooltip => 'Add Currency Exchange Rate';

  @override
  String get currencyDefault => 'Default Currency';

  @override
  String get currencyDistribution => 'Distribution';

  @override
  String currencyExchange(Object from, Object to) {
    return 'Currency Exchange: $from -> $to';
  }

  @override
  String get currencyHeadline => 'Currencies';

  @override
  String currencyIn(Object value) {
    return 'In $value';
  }

  @override
  String get currencyShort => 'Curr.';

  @override
  String get currencyTooltip => 'Currency Type (Code)';

  @override
  String get currencyUpdateTooltip => 'Update Currencies Rate';

  @override
  String get currentDate => 'Current Date Pointer';

  @override
  String get customAddTooltip => 'Add Widget';

  @override
  String get customDeleteTooltip => 'Delete Customization';

  @override
  String get customSaveTooltip => 'Save Customization';

  @override
  String get customizeTooltip => 'Customize Page';

  @override
  String get darkMode => 'Dark';

  @override
  String get dateFormat => 'Date Format';

  @override
  String get dateRange => 'Date Range';

  @override
  String get dateTooltip => 'Select Date';

  @override
  String get dayMonday => 'Monday';

  @override
  String get daySaturday => 'Saturday';

  @override
  String get dayStartOfMonth => 'Start of Month';

  @override
  String get dayStartOfWeek => 'Start of Week';

  @override
  String get daySunday => 'Sunday';

  @override
  String get deactivateAction => 'Deactivate Password Protection';

  @override
  String get debitCard => 'Debit Card';

  @override
  String def(Object value) {
    return 'Default Value for \'$value\'';
  }

  @override
  String get deleteAccountTooltip => 'Deactivate Account';

  @override
  String get deleteBillTooltip => 'Delete Bill';

  @override
  String get deleteBudgetTooltip => 'Deactivate Budget Category';

  @override
  String get deleteGoalTooltip => 'Delete Goal';

  @override
  String get deleteInvoiceTooltip => 'Delete Invoice';

  @override
  String get deletePaymentTooltip => 'Delete Payment';

  @override
  String get deleteTooltip => 'Delete';

  @override
  String get deleteTransferTooltip => 'Delete Transfer';

  @override
  String get deposit => 'Deposit';

  @override
  String get description => 'Description';

  @override
  String get descriptionTooltip => 'Set Expense Details';

  @override
  String get design => 'Design Mode (Culture Specific)';

  @override
  String get designAsiaGeneral => 'Asia General';

  @override
  String get designGermany => 'Germany';

  @override
  String get designGlobal => 'Global';

  @override
  String get designRtlGeneral => 'Right-to-Left Lettering';

  @override
  String get details => 'Details';

  @override
  String get detailsTooltip => '****2345 - last 4 digits of number';

  @override
  String get dtAm => 'am';

  @override
  String get dtAmPm => 'hour in am/pm (0~11)';

  @override
  String get dtDay => 'day in month';

  @override
  String get dtEscape => 'escape for text';

  @override
  String get dtHalfHour => 'hour in am/pm (1~12)';

  @override
  String get dtHour => 'hour in day (0~23)';

  @override
  String get dtMinute => 'minute in hour';

  @override
  String get dtMonth => 'month in year';

  @override
  String get dtNamedDay => 'day of week';

  @override
  String get dtPm => 'pm';

  @override
  String get dtQuote => 'single quote';

  @override
  String get dtSecond => 'second in minute';

  @override
  String get dtYear => 'year';

  @override
  String get editAccountHeader => 'Update Account';

  @override
  String get editAccountTooltip => 'Edit Account';

  @override
  String get editBillHeader => 'Update Bill';

  @override
  String get editBillTooltip => 'Edit Bill';

  @override
  String get editBudgetHeader => 'Update Budget Category';

  @override
  String get editBudgetTooltip => 'Edit Budget Category';

  @override
  String get editGoalHeader => 'Update Goal';

  @override
  String get editGoalTooltip => 'Edit Goal';

  @override
  String get editInvoiceTooltip => 'Edit Invoice';

  @override
  String get editPaymentTooltip => 'Edit Payment';

  @override
  String get editTooltip => 'Edit';

  @override
  String get editTransferTooltip => 'Edit Transfer';

  @override
  String get enableBankingAppId => 'Application ID';

  @override
  String get enableBankingBank => 'Bank';

  @override
  String get enableBankingCode =>
      'Address of the Page Opened after the Authorization';

  @override
  String get enableBankingCodeTooltip =>
      'Confirm access at the bank, then copy the address from the browser and paste it here';

  @override
  String get enableBankingCountry => 'Country (ISO Code, e.g. FI)';

  @override
  String get enableBankingDescription =>
      'Import balances and transactions from European banks through the Enable Banking API (PSD2) with your own application registered at enablebanking.com. Access is read-only: no payments are made.';

  @override
  String get enableBankingHeadline => 'Enable Banking (EU)';

  @override
  String get enableBankingIncomplete =>
      'Fill in the application ID, private key, redirect URL, and country';

  @override
  String get enableBankingKey => 'Private Key (PEM)';

  @override
  String get enableBankingKeyInvalid =>
      'Invalid private key: a PEM block \"PRIVATE KEY\" is expected';

  @override
  String get enableBankingKeyNotRsa =>
      'Invalid private key: an RSA key is expected';

  @override
  String get enableBankingKeyTooltip =>
      'Created with the application in the Enable Banking Control Panel; stored encrypted. Leave empty to keep the stored key';

  @override
  String get enableBankingLoadBanks => 'Load Banks';

  @override
  String get enableBankingNoAuthPage =>
      'Enable Banking returned no authorization page';

  @override
  String get enableBankingNoCode =>
      'No authorization code found in the address';

  @override
  String get enableBankingRedirect => 'Redirect URL';

  @override
  String get enableBankingRedirectTooltip =>
      'Registered for the application; the bank returns to it after the authorization';

  @override
  String get enableBankingStateMismatch =>
      'The address belongs to another authorization, connect again';

  @override
  String get encryptionMode => 'Data Encryption';

  @override
  String error(Object value) {
    return 'Error: $value';
  }

  @override
  String get errorExpired => 'Card expired';

  @override
  String get errorNegative => 'Cannot be negative! Please, fix the error';

  @override
  String get example => 'Example';

  @override
  String get expand => 'Expand Section';

  @override
  String get expense => 'Amount of Expenses';

  @override
  String get expenseDateTime => 'Billed At';

  @override
  String get expenseHeadline => 'Expense';

  @override
  String get expenseTransfer => 'Amount of Transfer';

  @override
  String exportFile(Object value) {
    return 'Export as .$value-file';
  }

  @override
  String get failData => 'Amount Deduction';

  @override
  String get finTsApproved => 'Approved in the Banking App';

  @override
  String get finTsBankCode => 'Bank Code (BLZ)';

  @override
  String get finTsCustomerId => 'Customer ID (if different from User ID)';

  @override
  String get finTsDescription =>
      'Import balances and transactions from banks supporting FinTS 4.1 (PIN/TAN). Access is read-only: no payments are made.';

  @override
  String get finTsHeadline => 'Financial Transaction Services (FinTS 4.1)';

  @override
  String get finTsIncomplete =>
      'Fill in the server URL, bank code, user ID and product registration ID';

  @override
  String finTsLoginChanged(Object value) {
    return 'The bank has changed the login data, update the User ID or Customer ID: $value';
  }

  @override
  String finTsLoginRefused(Object value) {
    return 'The bank refused the previous login: $value. Retry with the entered PIN?';
  }

  @override
  String get finTsPin => 'PIN';

  @override
  String get finTsPinHint => 'Used for this session only and never stored';

  @override
  String get finTsProductId => 'Product Registration ID';

  @override
  String get finTsProductIdTooltip =>
      'Issued by the Deutsche Kreditwirtschaft to the application\'s vendor';

  @override
  String get finTsTan => 'TAN';

  @override
  String get finTsTanHeadline => 'Transaction Authentication (TAN)';

  @override
  String get finTsTanMedium => 'Select TAN Medium';

  @override
  String get finTsTanMethod => 'Select TAN Method';

  @override
  String get finTsUrl => 'Bank\'s FinTS Server URL';

  @override
  String get finTsUserId => 'User ID (Login)';

  @override
  String get finTsVersion => 'Protocol Version';

  @override
  String get finTsWebUnsupported =>
      'Bank servers do not allow access from a browser. Use the desktop or mobile application.';

  @override
  String get flowTypeInvoice => 'Invoice';

  @override
  String get flowTypeTooltip => 'Amount Type: Bill, Invoice';

  @override
  String get forecastData => 'Forecast';

  @override
  String get from => 'from';

  @override
  String get goNextTooltip => 'Go Next';

  @override
  String get goalHeadline => 'Goals';

  @override
  String goalProfit(Object value) {
    return 'Goals Target: $value';
  }

  @override
  String get goalProfitTooltip => 'Profit vs Goals Target';

  @override
  String get goalTooltip => 'Open Goals';

  @override
  String get hasEncrypted => 'Once set, cannot be changed';

  @override
  String get helpTooltip => '[Help] Show Description of that Page';

  @override
  String get homeHeadline => 'Home';

  @override
  String get homeTooltip => 'Back to Main Page';

  @override
  String get hour => 'Hour';

  @override
  String get icon => 'Icon';

  @override
  String get iconTooltip => 'Select Icon';

  @override
  String get ignoreTooltip => 'Ignore';

  @override
  String get importHeadline => 'Import / Export';

  @override
  String get income => 'Amount of Income';

  @override
  String get incomeHeadline => 'Income';

  @override
  String get incomeHealth => 'Income Health Radar';

  @override
  String get incomeTooltip => 'Set Income Details';

  @override
  String get integrationAccessDenied =>
      'Access has been revoked or the credentials are incorrect';

  @override
  String get integrationConnect => 'Connect';

  @override
  String get integrationDateFrom => 'Import Transactions Since';

  @override
  String get integrationDefaultBudgetCategory => 'Default Budget Category';

  @override
  String get integrationDisconnect => 'Disconnect';

  @override
  String get integrationForget => 'Forget Access';

  @override
  String get integrationHeadline => 'Integrations';

  @override
  String integrationHttpError(Object value) {
    return 'The service answered with an error (HTTP $value)';
  }

  @override
  String get integrationHttpsRequired =>
      'Only secure (HTTPS) addresses are allowed';

  @override
  String get integrationImport => 'Import Transactions';

  @override
  String integrationImported(Object added, Object pending, Object skipped) {
    return 'Imported: $added, skipped as already present: $skipped, pending (not imported): $pending';
  }

  @override
  String integrationInvalidAmount(Object value) {
    return 'Invalid amount: $value';
  }

  @override
  String get integrationNoAccounts => 'The bank has provided no accounts';

  @override
  String get integrationPaymentRequired =>
      'The service requires a payment for the access';

  @override
  String get integrationSelectTarget =>
      'Select the account and the budget category to import into';

  @override
  String integrationServiceError(Object value) {
    return 'The service reported: $value';
  }

  @override
  String get integrationUnexpectedResponse =>
      'Unexpected response of the service';

  @override
  String get invoiceHeadline => 'Invoices';

  @override
  String invoiceSum(Object value) {
    return 'Invoices: $value';
  }

  @override
  String get isCleaned => 'Remove existing data';

  @override
  String get isCreated => 'Already created, follow next steps!';

  @override
  String get isEncrypted => 'File is encrypted (by default)';

  @override
  String get isRequired => 'required';

  @override
  String get language => 'Language';

  @override
  String get left => 'left';

  @override
  String get lightMode => 'Light';

  @override
  String get link => 'Uniform Resource Locator (URL)';

  @override
  String get managerHeadline => 'Manager';

  @override
  String get meaning => 'Meaning';

  @override
  String get metricsHeadline => 'Metrics';

  @override
  String get metricsTooltip => 'Metrics';

  @override
  String get milestones => 'Milestones';

  @override
  String get minute => 'Minute';

  @override
  String get missingContent => 'File cannot be processed (either canceled)';

  @override
  String get monobankCreateAccount => 'Create Account';

  @override
  String get monobankDescription =>
      'Import balances and transactions of Monobank cards and jars with a personal token. Monobank allows one request per minute: importing a long period takes several minutes. Access is read-only: no payments are made.';

  @override
  String get monobankHeadline => 'Monobank Personal API (Ukraine)';

  @override
  String get monobankJar => 'Jar';

  @override
  String monobankProgress(Object done, Object total) {
    return 'Requesting statements: $done of $total';
  }

  @override
  String monobankRateLimit(Object value) {
    return 'Monobank allows one request per minute: the next one in $value s';
  }

  @override
  String get monobankToken => 'Personal Token';

  @override
  String get monobankTokenSteps =>
      'How to get a personal token:\n1. Open api.monobank.ua in a browser\n2. Scan the QR code with the Monobank app and confirm the access\n3. Copy the token from the page\n4. Paste it below and press \"Connect\"\n5. Link each card or jar to an account (or create one) and import';

  @override
  String get monobankTokenTooltip =>
      'Issued at api.monobank.ua after scanning the QR code in the Monobank app; stored encrypted';

  @override
  String get navigationTooltip => 'Open main menu';

  @override
  String netProfit(Object value) {
    return 'Profit: $value';
  }

  @override
  String get noChartData => 'Data is missing (or not enough) to be shown';

  @override
  String get notificationAccessSettings => 'Notification Access';

  @override
  String get notificationAccessSteps =>
      'How to grant the access:\n1. Press \"Grant Access\" to open the system settings\n2. Allow Fingrom to read notifications\n3. If Android reports a restricted setting: open App info of Fingrom → ⋮ → \"Allow restricted settings\", then retry\n4. Return to Fingrom and select the apps to read notifications from';

  @override
  String get notificationAccounts => 'Account Keywords';

  @override
  String get notificationAccountsTooltip =>
      'Words recognizing the account in a notification (last digits of a card, name of a wallet): type a word and press Enter to add it. Otherwise the default account of the app is used';

  @override
  String get notificationApps => 'Apps to Read Notifications From';

  @override
  String notificationAutoImported(Object value) {
    return 'Added from notifications: $value';
  }

  @override
  String get notificationAutoTooltip =>
      'Recognized notifications are added without a confirmation: right away while Fingrom is running, otherwise on its next start. Unrecognized ones wait for a review';

  @override
  String get notificationBalance => 'Balance Keywords';

  @override
  String get notificationBalanceTooltip =>
      'Words preceding an amount that should be ignored (balance, limit): type a word and press Enter to add it';

  @override
  String notificationCaptured(Object value) {
    return 'Captured notifications: $value';
  }

  @override
  String get notificationClear => 'Clear Captured';

  @override
  String get notificationCurrencyTooltip =>
      'Amounts without a currency (e.g. Debit 20.00) are taken in this currency';

  @override
  String get notificationDefaultAccount => 'Default Account';

  @override
  String get notificationDescription =>
      'Create transactions from notifications of banking and payment apps on this device. Only notifications of the selected apps are read, and they stay on the device until imported. The amount and the currency are recognized automatically.';

  @override
  String get notificationGrant => 'Grant Access';

  @override
  String get notificationIncome => 'Income Keywords';

  @override
  String get notificationIncomeTooltip =>
      'Words marking a notification as income: type a word and press Enter to add it';

  @override
  String get notificationMerchant => 'Merchant Labels';

  @override
  String get notificationMerchantTooltip =>
      'Words followed by a colon and a merchant (Location: Shop): type a word and press Enter to add it';

  @override
  String get notificationNoApps =>
      'No notifications have been received yet: apps appear here after they post a notification';

  @override
  String get notificationUnparsed => 'Not recognized';

  @override
  String get notifyHeadline => 'Notifications Parser';

  @override
  String get ok => 'OK';

  @override
  String get orderPin => 'Prioritized order';

  @override
  String get orderUnpin => 'Generalized order';

  @override
  String get outputFile => 'Destination for the file';

  @override
  String get parseFile => 'Parse File';

  @override
  String get password => 'Password';

  @override
  String get path => 'File Name (to save into, or load from)';

  @override
  String get paymentType => 'Payment Interval';

  @override
  String get paymentsHeadline => 'Recurring Payments';

  @override
  String get pearDisabled => '-- disabled --';

  @override
  String get pearLoading => 'In Progress...';

  @override
  String get peerAccept => 'accept';

  @override
  String get peerAction => 'Action';

  @override
  String get peerClosed => 'terminated';

  @override
  String get peerConnect => 'Connect Device';

  @override
  String get peerConnectBtn => 'connect';

  @override
  String get peerDelete => 'delete';

  @override
  String get peerDevice => 'Connected Devices';

  @override
  String get peerId => 'Your Device Identifier for Connection';

  @override
  String get peerOffline => 'offline';

  @override
  String get peerOnline => 'connected';

  @override
  String get peerOtherId => 'Device Identifier for Connection';

  @override
  String get peerPending => 'pending';

  @override
  String get peerPing => 'ping';

  @override
  String get peerSent => 'Data is transferred to connected Devices';

  @override
  String get peerStatus => 'Status';

  @override
  String get peerSync => 'Transfer Data';

  @override
  String pickFile(Object value) {
    return 'Pick .$value-file';
  }

  @override
  String pongStatus(Object uuid) {
    return 'Taken request from $uuid';
  }

  @override
  String get privatBankAdd => 'Add Account';

  @override
  String get privatBankDescription =>
      'Import balances and transactions of business accounts (sole proprietors and companies) of Privat24 for Business with an Autoclient token. Personal accounts are not supported by the API. Access is read-only: no payments are made.';

  @override
  String get privatBankHeadline => 'PrivatBank Autoclient (Ukraine)';

  @override
  String get privatBankIban => 'Account IBAN';

  @override
  String get privatBankIbanInvalid =>
      'Enter a Ukrainian IBAN: UA followed by 27 digits';

  @override
  String get privatBankIbanTooltip =>
      'The API provides no list of accounts: add IBANs of the accounts one by one';

  @override
  String privatBankNotReady(Object value) {
    return 'PrivatBank is preparing statements (phase $value): retry in a few minutes';
  }

  @override
  String get privatBankRemove => 'Remove Account';

  @override
  String get privatBankToken => 'Autoclient Token';

  @override
  String get privatBankTokenSteps =>
      'How to get an Autoclient token:\n1. Sign in to Privat24 for Business\n2. Open Integration (Autoclient)\n3. Activate it and copy the token\n4. Paste it below and press \"Connect\"\n5. Add IBANs of the accounts to import';

  @override
  String get privatBankTokenTooltip =>
      'Issued in Privat24 for Business under Integration (Autoclient); stored encrypted';

  @override
  String get processIsFinished => 'Finished!';

  @override
  String progress(Object value) {
    return 'Progress: $value%';
  }

  @override
  String get raiseData => 'Amount Addition';

  @override
  String get recoveryHeadline => 'Recovery';

  @override
  String get recoveryTooltip => 'Recover From';

  @override
  String get releases => 'Releases';

  @override
  String get reset => 'reset';

  @override
  String get returnBack => 'Return Back';

  @override
  String get roadmap => 'Roadmap';

  @override
  String get saveNotification => 'Changes saved!';

  @override
  String get saveSettingsTooltip => 'Save';

  @override
  String get saveTooltip => 'Save To';

  @override
  String search(Object value) {
    return 'Show By \'$value\' Pattern';
  }

  @override
  String get searchTooltip => 'Search';

  @override
  String get secureBioNotMatch => 'Authentication failed! Please, try again';

  @override
  String get secureBioPromptReason => 'Please authenticate to proceed';

  @override
  String get secureBioPromptTitle => 'Biometric Authentication';

  @override
  String get secureOtpCode => 'One-time Password Code';

  @override
  String get secureOtpCodeInvalid =>
      'Invalid! Please, take fresh code and enter it';

  @override
  String get secureOtpDeactivated => 'Password Protection is deactivated';

  @override
  String get securePassword => 'Password (Recovery Phrase)';

  @override
  String get securePasswordEmpty => 'Password cannot be empty!';

  @override
  String get securePasswordNotMatch => 'Passwords do not match!';

  @override
  String get securePasswordRepeat => 'Repeat Password';

  @override
  String get securityHeadline => 'Security';

  @override
  String get settingsBaseHeadline => 'Basics';

  @override
  String get settingsHeadline => 'Settings';

  @override
  String get settingsSaved => 'Settings saved!';

  @override
  String get simpleFinDescription =>
      'Import balances and transactions of US banks and card issuers through a SimpleFIN Bridge. Access is read-only: no payments are made.';

  @override
  String get simpleFinHeadline => 'SimpleFIN Bridge (US)';

  @override
  String get simpleFinNoCredentials =>
      'The SimpleFIN Bridge returned an access address without credentials';

  @override
  String get simpleFinToken => 'SimpleFIN Setup Token';

  @override
  String get simpleFinTokenClaimed =>
      'The Setup Token does not exist or has already been used';

  @override
  String get simpleFinTokenInvalid => 'Invalid SimpleFIN Setup Token';

  @override
  String get simpleFinTokenTooltip =>
      'Created at your SimpleFIN Bridge (e.g. bridge.simplefin.org) for this application; it can be used only once';

  @override
  String get skipFromTotals => 'Exclude from Totals';

  @override
  String get skipTooltip => 'Skip Step(s)';

  @override
  String get sortTooltip => 'Sort Items';

  @override
  String get sortingAmountAsc => 'Amount Ascending';

  @override
  String get sortingAmountDesc => 'Amount Descending';

  @override
  String get sortingCreatedAtAsc => 'Created At Ascending';

  @override
  String get sortingCreatedAtDesc => 'Created At Descending';

  @override
  String get sortingTitleAsc => 'Title Ascending';

  @override
  String get sortingTitleDesc => 'Title Descending';

  @override
  String get sortingUpdatedAtAsc => 'Updated At Ascending';

  @override
  String get sortingUpdatedAtDesc => 'Updated At Descending';

  @override
  String get spent => 'spent';

  @override
  String get splitCancelTooltip => 'Cancel Split per Month';

  @override
  String get splitHeadline => 'Split the Bill';

  @override
  String get splitTooltip => 'Declare Limits per Month';

  @override
  String get subscription =>
      'As an open-source project, subscribing will not unlock any additional features. However, it would serve as an investment in the continuous evolution and improvement of the application, and to preserve its availability.';

  @override
  String get subscriptionCoffee => 'Buy a Coffee';

  @override
  String get subscriptionDinner => 'Treat to Dinner';

  @override
  String get subscriptionDonorbox => 'Subscribe via Donorbox';

  @override
  String get subscriptionGithub => 'Subscribe via GitHub';

  @override
  String get subscriptionHeadline => 'Sponsorship';

  @override
  String get subscriptionInactive => 'Purchase Service Unavailable';

  @override
  String get subscriptionPatreon => 'Subscribe via Patreon';

  @override
  String get subscriptionPaypal => 'Buy a Coffee (PayPal)';

  @override
  String get subscriptionTiny => 'Give a lucky Coin';

  @override
  String get subscriptionTooltip => 'Support (Sponsorship)';

  @override
  String get success => 'Succeeded';

  @override
  String get summary => 'Summary';

  @override
  String get symbol => 'Symbol';

  @override
  String get syncHeadline => 'Sync Devices';

  @override
  String get systemMode => 'System';

  @override
  String get tapToOpen => 'Tap to Open';

  @override
  String get targetAmount => 'Target Amount';

  @override
  String get tellerAccessToken => 'Access Token';

  @override
  String get tellerAccessTokenTooltip =>
      'Shown by the connection page after a bank is linked: paste it here if Fingrom has not been opened automatically';

  @override
  String get tellerAppId => 'Application ID';

  @override
  String get tellerAppIdTooltip =>
      'Shown in the Teller Dashboard, starts with \"app_\"';

  @override
  String get tellerCertificate => 'Certificate (PEM)';

  @override
  String get tellerCertificateInvalid =>
      'Invalid certificate: a PEM block \"CERTIFICATE\" is expected';

  @override
  String get tellerCertificateTooltip =>
      'Issued in the Teller Dashboard (Certificates); stored encrypted. Leave empty to keep the stored one';

  @override
  String get tellerConnectBank => 'Connect Bank';

  @override
  String get tellerConnectPage => 'Connection Page';

  @override
  String get tellerConnectPageTooltip =>
      'Opens Teller Connect in a browser and returns the access token to Fingrom';

  @override
  String get tellerDescription =>
      'Import balances and transactions of US banks and card issuers through Teller with your own application registered at teller.io (the free plan allows 100 live bank connections). Access is read-only: no payments are made.';

  @override
  String get tellerDisconnected =>
      'The bank connection requires your attention (e.g. a new login or a confirmation code): connect the bank again';

  @override
  String get tellerEnvironment => 'Environment';

  @override
  String get tellerHeadline => 'Teller (US)';

  @override
  String get tellerIncomplete =>
      'Fill in the application ID; the certificate and the private key are required for real bank data';

  @override
  String get tellerKey => 'Private Key (PEM)';

  @override
  String get tellerKeyInvalid =>
      'Invalid private key: a PEM block \"PRIVATE KEY\" is expected';

  @override
  String get tellerKeyTooltip =>
      'Downloaded together with the certificate; stored encrypted. Leave empty to keep the stored key';

  @override
  String get tellerMissingCertificate =>
      'Teller rejected the request without a client certificate: upload the certificate and the private key, or choose the sandbox';

  @override
  String get tellerSteps =>
      'How to connect:\n1. Sign up at teller.io and open the Teller Dashboard\n2. Copy the Application ID, then create and download a certificate with its private key (Certificates)\n3. Fill them in below and choose the environment (sandbox: test data, sign in to a bank as \"username\" with \"password\")\n4. Press \"Connect Bank\" and sign in to your bank on the opened page\n5. Select the account and the budget category, then press \"Import Transactions\"';

  @override
  String get tellerUpload => 'Upload File';

  @override
  String get termPrivacy => 'Privacy Policy';

  @override
  String get termUse => 'Terms of Use';

  @override
  String get title => 'Title';

  @override
  String get titleAccountTooltip => 'Enter Account Identifier';

  @override
  String get titleBudgetTooltip => 'Enter Budget Category Name';

  @override
  String get titleGoal => 'Goal';

  @override
  String get titleGoalTooltip => 'Define Goal Description';

  @override
  String get to => 'to';

  @override
  String get total => 'total';

  @override
  String get transactionFile => 'Fingrom Transactions Log File (.log)';

  @override
  String get transferHeadline => 'Transfer';

  @override
  String get transferTooltip => 'Set Transfer Details';

  @override
  String get transfersHeadline => 'Transfers';

  @override
  String get typeButton => 'Button';

  @override
  String get updateAccountTooltip => 'Update Account';

  @override
  String get updateBillTooltip => 'Update Bill';

  @override
  String get updateBudgetTooltip => 'Update Budget Category';

  @override
  String get updateGoalTooltip => 'Update Goal';

  @override
  String get updatePaymentTooltip => 'Update Payment';

  @override
  String get username => 'Username (Account)';

  @override
  String get uuid => 'Unique Transaction Identifier';

  @override
  String get validTillDate => 'Valid Till';

  @override
  String get webDav => 'Web Distributed Authoring and Versioning (WebDav)';

  @override
  String get wiseDescription =>
      'Import balances and transactions of Wise multi-currency accounts with a Personal API Token. Conversions between linked balances are imported as transfers. Access is read-only: no payments are made.';

  @override
  String get wiseHeadline => 'Wise API (Global)';

  @override
  String get wiseNoProfiles => 'No Wise profiles are available for the token';

  @override
  String get wiseProfile => 'Profile';

  @override
  String get wiseScaRequired =>
      'Wise requires a strong customer authentication: open the statement of this balance in the Wise app, then retry';

  @override
  String get wiseToken => 'Personal API Token';

  @override
  String get wiseTokenSteps =>
      'How to get a Personal API Token:\n1. Sign in at wise.com in a browser (tokens cannot be created in the mobile app)\n2. Open Settings → Integrations and tools → API tokens\n3. Choose \"Add new token\", name it (e.g. Fingrom), and select \"Read only\" access\n4. Confirm with two-step verification and copy the token\n5. Paste it below and press \"Connect\"';

  @override
  String get wiseTokenTooltip =>
      'Created in Wise under Settings → API tokens (read-only if offered); stored encrypted';

  @override
  String get zoomState => 'Zoom In / Zoom Out';
}
