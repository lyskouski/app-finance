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
  String get dayStartOfMonth => 'Start of Month';

  @override
  String get dayStartOfWeek => 'Start of Week';

  @override
  String get daySunday => 'Sunday';

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
  String get meaning => 'Meaning';

  @override
  String get metricsHeadline => 'Metrics';

  @override
  String get metricsTooltip => 'Metrics';

  @override
  String get milestones => 'Milestones';

  @override
  String get missingContent => 'File cannot be processed (either canceled)';

  @override
  String get navigationTooltip => 'Open main menu';

  @override
  String netProfit(Object value) {
    return 'Profit: $value';
  }

  @override
  String get noChartData => 'Data is missing (or not enough) to be shown';

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
  String get settingsBaseHeadline => 'Basics';

  @override
  String get settingsHeadline => 'Settings';

  @override
  String get skipFromTotals => 'Exclude from Totals';

  @override
  String get skipTooltip => 'Skip Step(s)';

  @override
  String get spent => 'spent';

  @override
  String get splitCancelTooltip => 'Cancel Split per Month';

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
  String get zoomState => 'Zoom In / Zoom Out';
}
