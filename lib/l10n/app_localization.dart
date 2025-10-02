import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'app_localization_ar.dart';
import 'app_localization_az.dart';
import 'app_localization_be.dart';
import 'app_localization_cs.dart';
import 'app_localization_de.dart';
import 'app_localization_en.dart';
import 'app_localization_es.dart';
import 'app_localization_fa.dart';
import 'app_localization_fr.dart';
import 'app_localization_hi.dart';
import 'app_localization_it.dart';
import 'app_localization_ja.dart';
import 'app_localization_ko.dart';
import 'app_localization_nl.dart';
import 'app_localization_pl.dart';
import 'app_localization_pt.dart';
import 'app_localization_ro.dart';
import 'app_localization_tr.dart';
import 'app_localization_uk.dart';
import 'app_localization_uz.dart';
import 'app_localization_zh.dart';

// ignore_for_file: type=lint

/// Callers can lookup localized strings with an instance of AppLocalizations
/// returned by `AppLocalizations.of(context)`.
///
/// Applications need to include `AppLocalizations.delegate()` in their app's
/// `localizationDelegates` list, and the locales they support in the app's
/// `supportedLocales` list. For example:
///
/// ```dart
/// import 'l10n/app_localization.dart';
///
/// return MaterialApp(
///   localizationsDelegates: AppLocalizations.localizationsDelegates,
///   supportedLocales: AppLocalizations.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```yaml
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # Rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the AppLocalizations.supportedLocales
/// property.
abstract class AppLocalizations {
  AppLocalizations(String locale)
      : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static AppLocalizations? of(BuildContext context) {
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =
      _AppLocalizationsDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates =
      <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('be'),
    Locale('uk'),
    Locale('pl'),
    Locale('pt'),
    Locale('fr'),
    Locale('de'),
    Locale('zh'),
    Locale('hi'),
    Locale('uz'),
    Locale('fa'),
    Locale('ar'),
    Locale('az'),
    Locale('ja'),
    Locale('es'),
    Locale('it'),
    Locale('tr'),
    Locale('ko'),
    Locale('nl'),
    Locale('cs'),
    Locale('ro'),
    Locale('be', 'EU'),
    Locale('pt', 'BR'),
    Locale('zh', 'TW')
  ];

  /// No description provided for @a.
  ///
  /// In en, this message translates to:
  /// **'RUN `dart run grinder sort-translations --quiet` FOR ORDERING'**
  String get a;

  /// No description provided for @aboutHeadline.
  ///
  /// In en, this message translates to:
  /// **'About'**
  String get aboutHeadline;

  /// No description provided for @account.
  ///
  /// In en, this message translates to:
  /// **'Account'**
  String get account;

  /// No description provided for @accountFrom.
  ///
  /// In en, this message translates to:
  /// **'From Account'**
  String get accountFrom;

  /// No description provided for @accountHeadline.
  ///
  /// In en, this message translates to:
  /// **'Accounts'**
  String get accountHeadline;

  /// No description provided for @accountTo.
  ///
  /// In en, this message translates to:
  /// **'To Account'**
  String get accountTo;

  /// No description provided for @accountTooltip.
  ///
  /// In en, this message translates to:
  /// **'Open Accounts'**
  String get accountTooltip;

  /// No description provided for @accountType.
  ///
  /// In en, this message translates to:
  /// **'Account Type'**
  String get accountType;

  /// No description provided for @accountTypeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Choose Account Type'**
  String get accountTypeTooltip;

  /// No description provided for @acknowledgeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Acknowledge'**
  String get acknowledgeTooltip;

  /// No description provided for @activate.
  ///
  /// In en, this message translates to:
  /// **'Activate'**
  String get activate;

  /// No description provided for @actualData.
  ///
  /// In en, this message translates to:
  /// **'Historical Data'**
  String get actualData;

  /// No description provided for @addAccountTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add Account'**
  String get addAccountTooltip;

  /// No description provided for @addBudgetTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add new Budget Category'**
  String get addBudgetTooltip;

  /// No description provided for @addGoalTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add new Goal'**
  String get addGoalTooltip;

  /// No description provided for @addMainTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add Bill , Income or Transfer'**
  String get addMainTooltip;

  /// No description provided for @afterNDays.
  ///
  /// In en, this message translates to:
  /// **'after {value} days'**
  String afterNDays(Object value);

  /// No description provided for @appBuild.
  ///
  /// In en, this message translates to:
  /// **'Build: {build}'**
  String appBuild(Object build);

  /// No description provided for @appInitHeadline.
  ///
  /// In en, this message translates to:
  /// **'Project Initialization'**
  String get appInitHeadline;

  /// No description provided for @appStartHeadline.
  ///
  /// In en, this message translates to:
  /// **'Initial Setup'**
  String get appStartHeadline;

  /// No description provided for @appTitle.
  ///
  /// In en, this message translates to:
  /// **'Fingrom'**
  String get appTitle;

  /// No description provided for @appVersion.
  ///
  /// In en, this message translates to:
  /// **'Version: {version}'**
  String appVersion(Object version);

  /// No description provided for @automationHeadline.
  ///
  /// In en, this message translates to:
  /// **'Automation'**
  String get automationHeadline;

  /// No description provided for @automationTypeDays.
  ///
  /// In en, this message translates to:
  /// **'after some days'**
  String get automationTypeDays;

  /// No description provided for @backTooltip.
  ///
  /// In en, this message translates to:
  /// **'Return back'**
  String get backTooltip;

  /// No description provided for @balance.
  ///
  /// In en, this message translates to:
  /// **'Actual Balance'**
  String get balance;

  /// No description provided for @balanceDate.
  ///
  /// In en, this message translates to:
  /// **'Balance Date Update'**
  String get balanceDate;

  /// No description provided for @balanceDateTooltip.
  ///
  /// In en, this message translates to:
  /// **'Outcomes and Incomes before this date won\'t affect the balance'**
  String get balanceDateTooltip;

  /// No description provided for @balanceTooltip.
  ///
  /// In en, this message translates to:
  /// **'Set Balance'**
  String get balanceTooltip;

  /// No description provided for @bankAccount.
  ///
  /// In en, this message translates to:
  /// **'Bank Account'**
  String get bankAccount;

  /// No description provided for @bill.
  ///
  /// In en, this message translates to:
  /// **'Bill'**
  String get bill;

  /// No description provided for @billHeadline.
  ///
  /// In en, this message translates to:
  /// **'Bills'**
  String get billHeadline;

  /// No description provided for @billSetTooltip.
  ///
  /// In en, this message translates to:
  /// **'Set Amount'**
  String get billSetTooltip;

  /// No description provided for @billSum.
  ///
  /// In en, this message translates to:
  /// **'Bills: {value}'**
  String billSum(Object value);

  /// No description provided for @billTooltip.
  ///
  /// In en, this message translates to:
  /// **'Open Bills'**
  String get billTooltip;

  /// No description provided for @billTypeTooltip.
  ///
  /// In en, this message translates to:
  /// **'[Type] Bill, Income or Transfer'**
  String get billTypeTooltip;

  /// No description provided for @brightnessTheme.
  ///
  /// In en, this message translates to:
  /// **'Brightness Theme'**
  String get brightnessTheme;

  /// No description provided for @btnAdd.
  ///
  /// In en, this message translates to:
  /// **'Add'**
  String get btnAdd;

  /// No description provided for @btnCancel.
  ///
  /// In en, this message translates to:
  /// **'Cancel'**
  String get btnCancel;

  /// No description provided for @btnConfirm.
  ///
  /// In en, this message translates to:
  /// **'Confirm'**
  String get btnConfirm;

  /// No description provided for @btnMore.
  ///
  /// In en, this message translates to:
  /// **'More'**
  String get btnMore;

  /// No description provided for @budget.
  ///
  /// In en, this message translates to:
  /// **'Budget Category'**
  String get budget;

  /// No description provided for @budgetHeadline.
  ///
  /// In en, this message translates to:
  /// **'Budgets'**
  String get budgetHeadline;

  /// No description provided for @budgetLimit.
  ///
  /// In en, this message translates to:
  /// **'Limit per Month'**
  String get budgetLimit;

  /// No description provided for @budgetLimitHeadline.
  ///
  /// In en, this message translates to:
  /// **'Limit Adjustments'**
  String get budgetLimitHeadline;

  /// No description provided for @budgetRelativeLimit.
  ///
  /// In en, this message translates to:
  /// **'Relative Coefficient per Month'**
  String get budgetRelativeLimit;

  /// No description provided for @budgetTooltip.
  ///
  /// In en, this message translates to:
  /// **'Open Budget Types'**
  String get budgetTooltip;

  /// No description provided for @budgetType.
  ///
  /// In en, this message translates to:
  /// **'Budgeting Interval'**
  String get budgetType;

  /// No description provided for @budgetTypeAsIs.
  ///
  /// In en, this message translates to:
  /// **'Unlimited'**
  String get budgetTypeAsIs;

  /// No description provided for @budgetTypeFixed.
  ///
  /// In en, this message translates to:
  /// **'Fixed'**
  String get budgetTypeFixed;

  /// No description provided for @budgetTypeMonth.
  ///
  /// In en, this message translates to:
  /// **'monthly'**
  String get budgetTypeMonth;

  /// No description provided for @budgetTypeRelative.
  ///
  /// In en, this message translates to:
  /// **'Relative'**
  String get budgetTypeRelative;

  /// No description provided for @budgetTypeWeek.
  ///
  /// In en, this message translates to:
  /// **'weekly'**
  String get budgetTypeWeek;

  /// No description provided for @budgetTypeYear.
  ///
  /// In en, this message translates to:
  /// **'yearly'**
  String get budgetTypeYear;

  /// No description provided for @cash.
  ///
  /// In en, this message translates to:
  /// **'Cash'**
  String get cash;

  /// No description provided for @chartBarRace.
  ///
  /// In en, this message translates to:
  /// **'Bar Race for Categories'**
  String get chartBarRace;

  /// No description provided for @chartForecast.
  ///
  /// In en, this message translates to:
  /// **'Forecast Chart'**
  String get chartForecast;

  /// No description provided for @chartOHLC.
  ///
  /// In en, this message translates to:
  /// **'Candlestick (OHLC) Chart'**
  String get chartOHLC;

  /// No description provided for @chartYtdExpense.
  ///
  /// In en, this message translates to:
  /// **'YTD Expenses'**
  String get chartYtdExpense;

  /// No description provided for @clear.
  ///
  /// In en, this message translates to:
  /// **'Drop Value'**
  String get clear;

  /// No description provided for @closeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Close'**
  String get closeTooltip;

  /// No description provided for @closedAt.
  ///
  /// In en, this message translates to:
  /// **'Finished till Date'**
  String get closedAt;

  /// No description provided for @cmpChart.
  ///
  /// In en, this message translates to:
  /// **'Diagrams'**
  String get cmpChart;

  /// No description provided for @cmpRecent.
  ///
  /// In en, this message translates to:
  /// **'Recent Items'**
  String get cmpRecent;

  /// No description provided for @cmpRecentCount.
  ///
  /// In en, this message translates to:
  /// **'List Size'**
  String get cmpRecentCount;

  /// No description provided for @coAuthor.
  ///
  /// In en, this message translates to:
  /// **'author'**
  String get coAuthor;

  /// No description provided for @coConsult.
  ///
  /// In en, this message translates to:
  /// **'advisor'**
  String get coConsult;

  /// No description provided for @coDeveloper.
  ///
  /// In en, this message translates to:
  /// **'developer'**
  String get coDeveloper;

  /// No description provided for @coNew.
  ///
  /// In en, this message translates to:
  /// **'Join'**
  String get coNew;

  /// No description provided for @coPromoter.
  ///
  /// In en, this message translates to:
  /// **'promoter'**
  String get coPromoter;

  /// No description provided for @coTranslator.
  ///
  /// In en, this message translates to:
  /// **'translator'**
  String get coTranslator;

  /// No description provided for @coef.
  ///
  /// In en, this message translates to:
  /// **'coef.'**
  String get coef;

  /// No description provided for @collapse.
  ///
  /// In en, this message translates to:
  /// **'Collapse (Restore) Section'**
  String get collapse;

  /// No description provided for @color.
  ///
  /// In en, this message translates to:
  /// **'Color'**
  String get color;

  /// No description provided for @colorApp.
  ///
  /// In en, this message translates to:
  /// **'Custom'**
  String get colorApp;

  /// No description provided for @colorBackground.
  ///
  /// In en, this message translates to:
  /// **'Background'**
  String get colorBackground;

  /// No description provided for @colorDark.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get colorDark;

  /// No description provided for @colorInversePrimary.
  ///
  /// In en, this message translates to:
  /// **'Inverse Primary'**
  String get colorInversePrimary;

  /// No description provided for @colorInverseSurface.
  ///
  /// In en, this message translates to:
  /// **'Inverse Surface'**
  String get colorInverseSurface;

  /// No description provided for @colorLight.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get colorLight;

  /// No description provided for @colorOnInverseSurface.
  ///
  /// In en, this message translates to:
  /// **'On Inverse Surface'**
  String get colorOnInverseSurface;

  /// No description provided for @colorOnSecondary.
  ///
  /// In en, this message translates to:
  /// **'On Secondary'**
  String get colorOnSecondary;

  /// No description provided for @colorOnSecondaryContainer.
  ///
  /// In en, this message translates to:
  /// **'On Container'**
  String get colorOnSecondaryContainer;

  /// No description provided for @colorPrimary.
  ///
  /// In en, this message translates to:
  /// **'Primary'**
  String get colorPrimary;

  /// No description provided for @colorRestore.
  ///
  /// In en, this message translates to:
  /// **'Reset Palette'**
  String get colorRestore;

  /// No description provided for @colorSecondary.
  ///
  /// In en, this message translates to:
  /// **'Secondary'**
  String get colorSecondary;

  /// No description provided for @colorSystem.
  ///
  /// In en, this message translates to:
  /// **'Default'**
  String get colorSystem;

  /// No description provided for @colorTheme.
  ///
  /// In en, this message translates to:
  /// **'Palette'**
  String get colorTheme;

  /// No description provided for @colorTooltip.
  ///
  /// In en, this message translates to:
  /// **'Select a Color'**
  String get colorTooltip;

  /// No description provided for @colorType.
  ///
  /// In en, this message translates to:
  /// **'Color Type'**
  String get colorType;

  /// No description provided for @colorUser.
  ///
  /// In en, this message translates to:
  /// **'Personal'**
  String get colorUser;

  /// No description provided for @columnMap.
  ///
  /// In en, this message translates to:
  /// **'Mapping for Column \'{value}\''**
  String columnMap(Object value);

  /// No description provided for @columnMapTooltip.
  ///
  /// In en, this message translates to:
  /// **'\'{value}\' - Choose Column Mapping'**
  String columnMapTooltip(Object value);

  /// No description provided for @completeGoalTooltip.
  ///
  /// In en, this message translates to:
  /// **'Complete Goal'**
  String get completeGoalTooltip;

  /// No description provided for @confirmHeader.
  ///
  /// In en, this message translates to:
  /// **'Confirm Action'**
  String get confirmHeader;

  /// No description provided for @confirmTooltip.
  ///
  /// In en, this message translates to:
  /// **'Are you sure? This action cannot be undone.'**
  String get confirmTooltip;

  /// No description provided for @contributors.
  ///
  /// In en, this message translates to:
  /// **'Contributors'**
  String get contributors;

  /// No description provided for @conversion.
  ///
  /// In en, this message translates to:
  /// **'Conversion'**
  String get conversion;

  /// No description provided for @conversionMessage.
  ///
  /// In en, this message translates to:
  /// **'Taken in {currency}'**
  String conversionMessage(Object currency);

  /// No description provided for @createAccountHeader.
  ///
  /// In en, this message translates to:
  /// **'Create new Account'**
  String get createAccountHeader;

  /// No description provided for @createAccountTooltip.
  ///
  /// In en, this message translates to:
  /// **'Create new Account'**
  String get createAccountTooltip;

  /// No description provided for @createBillHeader.
  ///
  /// In en, this message translates to:
  /// **'Create new Transaction'**
  String get createBillHeader;

  /// No description provided for @createBillTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add new Bill'**
  String get createBillTooltip;

  /// No description provided for @createBudgetHeader.
  ///
  /// In en, this message translates to:
  /// **'New Budget Category'**
  String get createBudgetHeader;

  /// No description provided for @createBudgetTooltip.
  ///
  /// In en, this message translates to:
  /// **'Create new Budget Category'**
  String get createBudgetTooltip;

  /// No description provided for @createGoalHeader.
  ///
  /// In en, this message translates to:
  /// **'Create Goal'**
  String get createGoalHeader;

  /// No description provided for @createGoalTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add new Goal'**
  String get createGoalTooltip;

  /// No description provided for @createIncomeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add new Income'**
  String get createIncomeTooltip;

  /// No description provided for @createPaymentTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add new Payment'**
  String get createPaymentTooltip;

  /// No description provided for @createTransferTooltip.
  ///
  /// In en, this message translates to:
  /// **'Create Transfer'**
  String get createTransferTooltip;

  /// No description provided for @credit.
  ///
  /// In en, this message translates to:
  /// **'Credit'**
  String get credit;

  /// No description provided for @creditCard.
  ///
  /// In en, this message translates to:
  /// **'Credit Card'**
  String get creditCard;

  /// No description provided for @currency.
  ///
  /// In en, this message translates to:
  /// **'Currency'**
  String get currency;

  /// No description provided for @currencyAddHeadline.
  ///
  /// In en, this message translates to:
  /// **'Currency Exchange'**
  String get currencyAddHeadline;

  /// No description provided for @currencyAddTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add Currency Exchange Rate'**
  String get currencyAddTooltip;

  /// No description provided for @currencyDefault.
  ///
  /// In en, this message translates to:
  /// **'Default Currency'**
  String get currencyDefault;

  /// No description provided for @currencyDistribution.
  ///
  /// In en, this message translates to:
  /// **'Distribution'**
  String get currencyDistribution;

  /// No description provided for @currencyExchange.
  ///
  /// In en, this message translates to:
  /// **'Currency Exchange: {from} -> {to}'**
  String currencyExchange(Object from, Object to);

  /// No description provided for @currencyHeadline.
  ///
  /// In en, this message translates to:
  /// **'Currencies'**
  String get currencyHeadline;

  /// No description provided for @currencyIn.
  ///
  /// In en, this message translates to:
  /// **'In {value}'**
  String currencyIn(Object value);

  /// No description provided for @currencyShort.
  ///
  /// In en, this message translates to:
  /// **'Curr.'**
  String get currencyShort;

  /// No description provided for @currencyTooltip.
  ///
  /// In en, this message translates to:
  /// **'Currency Type (Code)'**
  String get currencyTooltip;

  /// No description provided for @currencyUpdateTooltip.
  ///
  /// In en, this message translates to:
  /// **'Update Currencies Rate'**
  String get currencyUpdateTooltip;

  /// No description provided for @currentDate.
  ///
  /// In en, this message translates to:
  /// **'Current Date Pointer'**
  String get currentDate;

  /// No description provided for @customAddTooltip.
  ///
  /// In en, this message translates to:
  /// **'Add Widget'**
  String get customAddTooltip;

  /// No description provided for @customDeleteTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete Customization'**
  String get customDeleteTooltip;

  /// No description provided for @customSaveTooltip.
  ///
  /// In en, this message translates to:
  /// **'Save Customization'**
  String get customSaveTooltip;

  /// No description provided for @customizeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Customize Page'**
  String get customizeTooltip;

  /// No description provided for @darkMode.
  ///
  /// In en, this message translates to:
  /// **'Dark'**
  String get darkMode;

  /// No description provided for @dateFormat.
  ///
  /// In en, this message translates to:
  /// **'Date Format'**
  String get dateFormat;

  /// No description provided for @dateRange.
  ///
  /// In en, this message translates to:
  /// **'Date Range'**
  String get dateRange;

  /// No description provided for @dateTooltip.
  ///
  /// In en, this message translates to:
  /// **'Select Date'**
  String get dateTooltip;

  /// No description provided for @dayMonday.
  ///
  /// In en, this message translates to:
  /// **'Monday'**
  String get dayMonday;

  /// No description provided for @dayStartOfMonth.
  ///
  /// In en, this message translates to:
  /// **'Start of Month'**
  String get dayStartOfMonth;

  /// No description provided for @dayStartOfWeek.
  ///
  /// In en, this message translates to:
  /// **'Start of Week'**
  String get dayStartOfWeek;

  /// No description provided for @daySunday.
  ///
  /// In en, this message translates to:
  /// **'Sunday'**
  String get daySunday;

  /// No description provided for @debitCard.
  ///
  /// In en, this message translates to:
  /// **'Debit Card'**
  String get debitCard;

  /// No description provided for @def.
  ///
  /// In en, this message translates to:
  /// **'Default Value for \'{value}\''**
  String def(Object value);

  /// No description provided for @deleteAccountTooltip.
  ///
  /// In en, this message translates to:
  /// **'Deactivate Account'**
  String get deleteAccountTooltip;

  /// No description provided for @deleteBillTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete Bill'**
  String get deleteBillTooltip;

  /// No description provided for @deleteBudgetTooltip.
  ///
  /// In en, this message translates to:
  /// **'Deactivate Budget Category'**
  String get deleteBudgetTooltip;

  /// No description provided for @deleteGoalTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete Goal'**
  String get deleteGoalTooltip;

  /// No description provided for @deleteInvoiceTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete Invoice'**
  String get deleteInvoiceTooltip;

  /// No description provided for @deletePaymentTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete Payment'**
  String get deletePaymentTooltip;

  /// No description provided for @deleteTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete'**
  String get deleteTooltip;

  /// No description provided for @deleteTransferTooltip.
  ///
  /// In en, this message translates to:
  /// **'Delete Transfer'**
  String get deleteTransferTooltip;

  /// No description provided for @deposit.
  ///
  /// In en, this message translates to:
  /// **'Deposit'**
  String get deposit;

  /// No description provided for @description.
  ///
  /// In en, this message translates to:
  /// **'Description'**
  String get description;

  /// No description provided for @descriptionTooltip.
  ///
  /// In en, this message translates to:
  /// **'Set Expense Details'**
  String get descriptionTooltip;

  /// No description provided for @design.
  ///
  /// In en, this message translates to:
  /// **'Design Mode (Culture Specific)'**
  String get design;

  /// No description provided for @designAsiaGeneral.
  ///
  /// In en, this message translates to:
  /// **'Asia General'**
  String get designAsiaGeneral;

  /// No description provided for @designGermany.
  ///
  /// In en, this message translates to:
  /// **'Germany'**
  String get designGermany;

  /// No description provided for @designGlobal.
  ///
  /// In en, this message translates to:
  /// **'Global'**
  String get designGlobal;

  /// No description provided for @designRtlGeneral.
  ///
  /// In en, this message translates to:
  /// **'Right-to-Left Lettering'**
  String get designRtlGeneral;

  /// No description provided for @details.
  ///
  /// In en, this message translates to:
  /// **'Details'**
  String get details;

  /// No description provided for @detailsTooltip.
  ///
  /// In en, this message translates to:
  /// **'****2345 - last 4 digits of number'**
  String get detailsTooltip;

  /// No description provided for @dtAm.
  ///
  /// In en, this message translates to:
  /// **'am'**
  String get dtAm;

  /// No description provided for @dtAmPm.
  ///
  /// In en, this message translates to:
  /// **'hour in am/pm (0~11)'**
  String get dtAmPm;

  /// No description provided for @dtDay.
  ///
  /// In en, this message translates to:
  /// **'day in month'**
  String get dtDay;

  /// No description provided for @dtEscape.
  ///
  /// In en, this message translates to:
  /// **'escape for text'**
  String get dtEscape;

  /// No description provided for @dtHalfHour.
  ///
  /// In en, this message translates to:
  /// **'hour in am/pm (1~12)'**
  String get dtHalfHour;

  /// No description provided for @dtHour.
  ///
  /// In en, this message translates to:
  /// **'hour in day (0~23)'**
  String get dtHour;

  /// No description provided for @dtMinute.
  ///
  /// In en, this message translates to:
  /// **'minute in hour'**
  String get dtMinute;

  /// No description provided for @dtMonth.
  ///
  /// In en, this message translates to:
  /// **'month in year'**
  String get dtMonth;

  /// No description provided for @dtNamedDay.
  ///
  /// In en, this message translates to:
  /// **'day of week'**
  String get dtNamedDay;

  /// No description provided for @dtPm.
  ///
  /// In en, this message translates to:
  /// **'pm'**
  String get dtPm;

  /// No description provided for @dtQuote.
  ///
  /// In en, this message translates to:
  /// **'single quote'**
  String get dtQuote;

  /// No description provided for @dtSecond.
  ///
  /// In en, this message translates to:
  /// **'second in minute'**
  String get dtSecond;

  /// No description provided for @dtYear.
  ///
  /// In en, this message translates to:
  /// **'year'**
  String get dtYear;

  /// No description provided for @editAccountHeader.
  ///
  /// In en, this message translates to:
  /// **'Update Account'**
  String get editAccountHeader;

  /// No description provided for @editAccountTooltip.
  ///
  /// In en, this message translates to:
  /// **'Edit Account'**
  String get editAccountTooltip;

  /// No description provided for @editBillHeader.
  ///
  /// In en, this message translates to:
  /// **'Update Bill'**
  String get editBillHeader;

  /// No description provided for @editBillTooltip.
  ///
  /// In en, this message translates to:
  /// **'Edit Bill'**
  String get editBillTooltip;

  /// No description provided for @editBudgetHeader.
  ///
  /// In en, this message translates to:
  /// **'Update Budget Category'**
  String get editBudgetHeader;

  /// No description provided for @editBudgetTooltip.
  ///
  /// In en, this message translates to:
  /// **'Edit Budget Category'**
  String get editBudgetTooltip;

  /// No description provided for @editGoalHeader.
  ///
  /// In en, this message translates to:
  /// **'Update Goal'**
  String get editGoalHeader;

  /// No description provided for @editGoalTooltip.
  ///
  /// In en, this message translates to:
  /// **'Edit Goal'**
  String get editGoalTooltip;

  /// No description provided for @editInvoiceTooltip.
  ///
  /// In en, this message translates to:
  /// **'Edit Invoice'**
  String get editInvoiceTooltip;

  /// No description provided for @editPaymentTooltip.
  ///
  /// In en, this message translates to:
  /// **'Edit Payment'**
  String get editPaymentTooltip;

  /// No description provided for @editTooltip.
  ///
  /// In en, this message translates to:
  /// **'Edit'**
  String get editTooltip;

  /// No description provided for @editTransferTooltip.
  ///
  /// In en, this message translates to:
  /// **'Edit Transfer'**
  String get editTransferTooltip;

  /// No description provided for @encryptionMode.
  ///
  /// In en, this message translates to:
  /// **'Data Encryption'**
  String get encryptionMode;

  /// No description provided for @error.
  ///
  /// In en, this message translates to:
  /// **'Error: {value}'**
  String error(Object value);

  /// No description provided for @errorExpired.
  ///
  /// In en, this message translates to:
  /// **'Card expired'**
  String get errorExpired;

  /// No description provided for @errorNegative.
  ///
  /// In en, this message translates to:
  /// **'Cannot be negative! Please, fix the error'**
  String get errorNegative;

  /// No description provided for @example.
  ///
  /// In en, this message translates to:
  /// **'Example'**
  String get example;

  /// No description provided for @expand.
  ///
  /// In en, this message translates to:
  /// **'Expand Section'**
  String get expand;

  /// No description provided for @expense.
  ///
  /// In en, this message translates to:
  /// **'Amount of Expenses'**
  String get expense;

  /// No description provided for @expenseDateTime.
  ///
  /// In en, this message translates to:
  /// **'Billed At'**
  String get expenseDateTime;

  /// No description provided for @expenseHeadline.
  ///
  /// In en, this message translates to:
  /// **'Expense'**
  String get expenseHeadline;

  /// No description provided for @expenseTransfer.
  ///
  /// In en, this message translates to:
  /// **'Amount of Transfer'**
  String get expenseTransfer;

  /// No description provided for @exportFile.
  ///
  /// In en, this message translates to:
  /// **'Export as .{value}-file'**
  String exportFile(Object value);

  /// No description provided for @failData.
  ///
  /// In en, this message translates to:
  /// **'Amount Deduction'**
  String get failData;

  /// No description provided for @flowTypeInvoice.
  ///
  /// In en, this message translates to:
  /// **'Invoice'**
  String get flowTypeInvoice;

  /// No description provided for @flowTypeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Amount Type: Bill, Invoice'**
  String get flowTypeTooltip;

  /// No description provided for @forecastData.
  ///
  /// In en, this message translates to:
  /// **'Forecast'**
  String get forecastData;

  /// No description provided for @from.
  ///
  /// In en, this message translates to:
  /// **'from'**
  String get from;

  /// No description provided for @goNextTooltip.
  ///
  /// In en, this message translates to:
  /// **'Go Next'**
  String get goNextTooltip;

  /// No description provided for @goalHeadline.
  ///
  /// In en, this message translates to:
  /// **'Goals'**
  String get goalHeadline;

  /// No description provided for @goalProfit.
  ///
  /// In en, this message translates to:
  /// **'Goals Target: {value}'**
  String goalProfit(Object value);

  /// No description provided for @goalProfitTooltip.
  ///
  /// In en, this message translates to:
  /// **'Profit vs Goals Target'**
  String get goalProfitTooltip;

  /// No description provided for @goalTooltip.
  ///
  /// In en, this message translates to:
  /// **'Open Goals'**
  String get goalTooltip;

  /// No description provided for @hasEncrypted.
  ///
  /// In en, this message translates to:
  /// **'Once set, cannot be changed'**
  String get hasEncrypted;

  /// No description provided for @helpTooltip.
  ///
  /// In en, this message translates to:
  /// **'[Help] Show Description of that Page'**
  String get helpTooltip;

  /// No description provided for @homeHeadline.
  ///
  /// In en, this message translates to:
  /// **'Home'**
  String get homeHeadline;

  /// No description provided for @homeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Back to Main Page'**
  String get homeTooltip;

  /// No description provided for @icon.
  ///
  /// In en, this message translates to:
  /// **'Icon'**
  String get icon;

  /// No description provided for @iconTooltip.
  ///
  /// In en, this message translates to:
  /// **'Select Icon'**
  String get iconTooltip;

  /// No description provided for @ignoreTooltip.
  ///
  /// In en, this message translates to:
  /// **'Ignore'**
  String get ignoreTooltip;

  /// No description provided for @importHeadline.
  ///
  /// In en, this message translates to:
  /// **'Import / Export'**
  String get importHeadline;

  /// No description provided for @income.
  ///
  /// In en, this message translates to:
  /// **'Amount of Income'**
  String get income;

  /// No description provided for @incomeHeadline.
  ///
  /// In en, this message translates to:
  /// **'Income'**
  String get incomeHeadline;

  /// No description provided for @incomeHealth.
  ///
  /// In en, this message translates to:
  /// **'Income Health Radar'**
  String get incomeHealth;

  /// No description provided for @incomeTooltip.
  ///
  /// In en, this message translates to:
  /// **'Set Income Details'**
  String get incomeTooltip;

  /// No description provided for @invoiceHeadline.
  ///
  /// In en, this message translates to:
  /// **'Invoices'**
  String get invoiceHeadline;

  /// No description provided for @invoiceSum.
  ///
  /// In en, this message translates to:
  /// **'Invoices: {value}'**
  String invoiceSum(Object value);

  /// No description provided for @isCleaned.
  ///
  /// In en, this message translates to:
  /// **'Remove existing data'**
  String get isCleaned;

  /// No description provided for @isCreated.
  ///
  /// In en, this message translates to:
  /// **'Already created, follow next steps!'**
  String get isCreated;

  /// No description provided for @isEncrypted.
  ///
  /// In en, this message translates to:
  /// **'File is encrypted (by default)'**
  String get isEncrypted;

  /// No description provided for @isRequired.
  ///
  /// In en, this message translates to:
  /// **'required'**
  String get isRequired;

  /// No description provided for @language.
  ///
  /// In en, this message translates to:
  /// **'Language'**
  String get language;

  /// No description provided for @left.
  ///
  /// In en, this message translates to:
  /// **'left'**
  String get left;

  /// No description provided for @lightMode.
  ///
  /// In en, this message translates to:
  /// **'Light'**
  String get lightMode;

  /// No description provided for @link.
  ///
  /// In en, this message translates to:
  /// **'Uniform Resource Locator (URL)'**
  String get link;

  /// No description provided for @meaning.
  ///
  /// In en, this message translates to:
  /// **'Meaning'**
  String get meaning;

  /// No description provided for @metricsHeadline.
  ///
  /// In en, this message translates to:
  /// **'Metrics'**
  String get metricsHeadline;

  /// No description provided for @metricsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Metrics'**
  String get metricsTooltip;

  /// No description provided for @milestones.
  ///
  /// In en, this message translates to:
  /// **'Milestones'**
  String get milestones;

  /// No description provided for @missingContent.
  ///
  /// In en, this message translates to:
  /// **'File cannot be processed (either canceled)'**
  String get missingContent;

  /// No description provided for @navigationTooltip.
  ///
  /// In en, this message translates to:
  /// **'Open main menu'**
  String get navigationTooltip;

  /// No description provided for @netProfit.
  ///
  /// In en, this message translates to:
  /// **'Profit: {value}'**
  String netProfit(Object value);

  /// No description provided for @noChartData.
  ///
  /// In en, this message translates to:
  /// **'Data is missing (or not enough) to be shown'**
  String get noChartData;

  /// No description provided for @notifyHeadline.
  ///
  /// In en, this message translates to:
  /// **'Notifications Parser'**
  String get notifyHeadline;

  /// No description provided for @ok.
  ///
  /// In en, this message translates to:
  /// **'OK'**
  String get ok;

  /// No description provided for @orderPin.
  ///
  /// In en, this message translates to:
  /// **'Prioritized order'**
  String get orderPin;

  /// No description provided for @orderUnpin.
  ///
  /// In en, this message translates to:
  /// **'Generalized order'**
  String get orderUnpin;

  /// No description provided for @outputFile.
  ///
  /// In en, this message translates to:
  /// **'Destination for the file'**
  String get outputFile;

  /// No description provided for @parseFile.
  ///
  /// In en, this message translates to:
  /// **'Parse File'**
  String get parseFile;

  /// No description provided for @password.
  ///
  /// In en, this message translates to:
  /// **'Password'**
  String get password;

  /// No description provided for @path.
  ///
  /// In en, this message translates to:
  /// **'File Name (to save into, or load from)'**
  String get path;

  /// No description provided for @paymentType.
  ///
  /// In en, this message translates to:
  /// **'Payment Interval'**
  String get paymentType;

  /// No description provided for @paymentsHeadline.
  ///
  /// In en, this message translates to:
  /// **'Recurring Payments'**
  String get paymentsHeadline;

  /// No description provided for @pearDisabled.
  ///
  /// In en, this message translates to:
  /// **'-- disabled --'**
  String get pearDisabled;

  /// No description provided for @pearLoading.
  ///
  /// In en, this message translates to:
  /// **'In Progress...'**
  String get pearLoading;

  /// No description provided for @peerAccept.
  ///
  /// In en, this message translates to:
  /// **'accept'**
  String get peerAccept;

  /// No description provided for @peerAction.
  ///
  /// In en, this message translates to:
  /// **'Action'**
  String get peerAction;

  /// No description provided for @peerClosed.
  ///
  /// In en, this message translates to:
  /// **'terminated'**
  String get peerClosed;

  /// No description provided for @peerConnect.
  ///
  /// In en, this message translates to:
  /// **'Connect Device'**
  String get peerConnect;

  /// No description provided for @peerConnectBtn.
  ///
  /// In en, this message translates to:
  /// **'connect'**
  String get peerConnectBtn;

  /// No description provided for @peerDelete.
  ///
  /// In en, this message translates to:
  /// **'delete'**
  String get peerDelete;

  /// No description provided for @peerDevice.
  ///
  /// In en, this message translates to:
  /// **'Connected Devices'**
  String get peerDevice;

  /// No description provided for @peerId.
  ///
  /// In en, this message translates to:
  /// **'Your Device Identifier for Connection'**
  String get peerId;

  /// No description provided for @peerOffline.
  ///
  /// In en, this message translates to:
  /// **'offline'**
  String get peerOffline;

  /// No description provided for @peerOnline.
  ///
  /// In en, this message translates to:
  /// **'connected'**
  String get peerOnline;

  /// No description provided for @peerOtherId.
  ///
  /// In en, this message translates to:
  /// **'Device Identifier for Connection'**
  String get peerOtherId;

  /// No description provided for @peerPending.
  ///
  /// In en, this message translates to:
  /// **'pending'**
  String get peerPending;

  /// No description provided for @peerPing.
  ///
  /// In en, this message translates to:
  /// **'ping'**
  String get peerPing;

  /// No description provided for @peerSent.
  ///
  /// In en, this message translates to:
  /// **'Data is transferred to connected Devices'**
  String get peerSent;

  /// No description provided for @peerStatus.
  ///
  /// In en, this message translates to:
  /// **'Status'**
  String get peerStatus;

  /// No description provided for @peerSync.
  ///
  /// In en, this message translates to:
  /// **'Transfer Data'**
  String get peerSync;

  /// No description provided for @pickFile.
  ///
  /// In en, this message translates to:
  /// **'Pick .{value}-file'**
  String pickFile(Object value);

  /// No description provided for @pongStatus.
  ///
  /// In en, this message translates to:
  /// **'Taken request from {uuid}'**
  String pongStatus(Object uuid);

  /// No description provided for @processIsFinished.
  ///
  /// In en, this message translates to:
  /// **'Finished!'**
  String get processIsFinished;

  /// No description provided for @progress.
  ///
  /// In en, this message translates to:
  /// **'Progress: {value}%'**
  String progress(Object value);

  /// No description provided for @raiseData.
  ///
  /// In en, this message translates to:
  /// **'Amount Addition'**
  String get raiseData;

  /// No description provided for @recoveryHeadline.
  ///
  /// In en, this message translates to:
  /// **'Recovery'**
  String get recoveryHeadline;

  /// No description provided for @recoveryTooltip.
  ///
  /// In en, this message translates to:
  /// **'Recover From'**
  String get recoveryTooltip;

  /// No description provided for @releases.
  ///
  /// In en, this message translates to:
  /// **'Releases'**
  String get releases;

  /// No description provided for @reset.
  ///
  /// In en, this message translates to:
  /// **'reset'**
  String get reset;

  /// No description provided for @returnBack.
  ///
  /// In en, this message translates to:
  /// **'Return Back'**
  String get returnBack;

  /// No description provided for @roadmap.
  ///
  /// In en, this message translates to:
  /// **'Roadmap'**
  String get roadmap;

  /// No description provided for @saveNotification.
  ///
  /// In en, this message translates to:
  /// **'Changes saved!'**
  String get saveNotification;

  /// No description provided for @saveSettingsTooltip.
  ///
  /// In en, this message translates to:
  /// **'Save'**
  String get saveSettingsTooltip;

  /// No description provided for @saveTooltip.
  ///
  /// In en, this message translates to:
  /// **'Save To'**
  String get saveTooltip;

  /// No description provided for @search.
  ///
  /// In en, this message translates to:
  /// **'Show By \'{value}\' Pattern'**
  String search(Object value);

  /// No description provided for @searchTooltip.
  ///
  /// In en, this message translates to:
  /// **'Search'**
  String get searchTooltip;

  /// No description provided for @settingsBaseHeadline.
  ///
  /// In en, this message translates to:
  /// **'Basics'**
  String get settingsBaseHeadline;

  /// No description provided for @settingsHeadline.
  ///
  /// In en, this message translates to:
  /// **'Settings'**
  String get settingsHeadline;

  /// No description provided for @skipFromTotals.
  ///
  /// In en, this message translates to:
  /// **'Exclude from Totals'**
  String get skipFromTotals;

  /// No description provided for @skipTooltip.
  ///
  /// In en, this message translates to:
  /// **'Skip Step(s)'**
  String get skipTooltip;

  /// No description provided for @spent.
  ///
  /// In en, this message translates to:
  /// **'spent'**
  String get spent;

  /// No description provided for @splitCancelTooltip.
  ///
  /// In en, this message translates to:
  /// **'Cancel Split per Month'**
  String get splitCancelTooltip;

  /// No description provided for @splitTooltip.
  ///
  /// In en, this message translates to:
  /// **'Declare Limits per Month'**
  String get splitTooltip;

  /// No description provided for @subscription.
  ///
  /// In en, this message translates to:
  /// **'As an open-source project, subscribing will not unlock any additional features. However, it would serve as an investment in the continuous evolution and improvement of the application, and to preserve its availability.'**
  String get subscription;

  /// No description provided for @subscriptionCoffee.
  ///
  /// In en, this message translates to:
  /// **'Buy a Coffee'**
  String get subscriptionCoffee;

  /// No description provided for @subscriptionDinner.
  ///
  /// In en, this message translates to:
  /// **'Treat to Dinner'**
  String get subscriptionDinner;

  /// No description provided for @subscriptionDonorbox.
  ///
  /// In en, this message translates to:
  /// **'Subscribe via Donorbox'**
  String get subscriptionDonorbox;

  /// No description provided for @subscriptionGithub.
  ///
  /// In en, this message translates to:
  /// **'Subscribe via GitHub'**
  String get subscriptionGithub;

  /// No description provided for @subscriptionHeadline.
  ///
  /// In en, this message translates to:
  /// **'Sponsorship'**
  String get subscriptionHeadline;

  /// No description provided for @subscriptionInactive.
  ///
  /// In en, this message translates to:
  /// **'Purchase Service Unavailable'**
  String get subscriptionInactive;

  /// No description provided for @subscriptionPatreon.
  ///
  /// In en, this message translates to:
  /// **'Subscribe via Patreon'**
  String get subscriptionPatreon;

  /// No description provided for @subscriptionPaypal.
  ///
  /// In en, this message translates to:
  /// **'Buy a Coffee (PayPal)'**
  String get subscriptionPaypal;

  /// No description provided for @subscriptionTiny.
  ///
  /// In en, this message translates to:
  /// **'Give a lucky Coin'**
  String get subscriptionTiny;

  /// No description provided for @subscriptionTooltip.
  ///
  /// In en, this message translates to:
  /// **'Support (Sponsorship)'**
  String get subscriptionTooltip;

  /// No description provided for @success.
  ///
  /// In en, this message translates to:
  /// **'Succeeded'**
  String get success;

  /// No description provided for @summary.
  ///
  /// In en, this message translates to:
  /// **'Summary'**
  String get summary;

  /// No description provided for @symbol.
  ///
  /// In en, this message translates to:
  /// **'Symbol'**
  String get symbol;

  /// No description provided for @syncHeadline.
  ///
  /// In en, this message translates to:
  /// **'Sync Devices'**
  String get syncHeadline;

  /// No description provided for @systemMode.
  ///
  /// In en, this message translates to:
  /// **'System'**
  String get systemMode;

  /// No description provided for @tapToOpen.
  ///
  /// In en, this message translates to:
  /// **'Tap to Open'**
  String get tapToOpen;

  /// No description provided for @targetAmount.
  ///
  /// In en, this message translates to:
  /// **'Target Amount'**
  String get targetAmount;

  /// No description provided for @termPrivacy.
  ///
  /// In en, this message translates to:
  /// **'Privacy Policy'**
  String get termPrivacy;

  /// No description provided for @termUse.
  ///
  /// In en, this message translates to:
  /// **'Terms of Use'**
  String get termUse;

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Title'**
  String get title;

  /// No description provided for @titleAccountTooltip.
  ///
  /// In en, this message translates to:
  /// **'Enter Account Identifier'**
  String get titleAccountTooltip;

  /// No description provided for @titleBudgetTooltip.
  ///
  /// In en, this message translates to:
  /// **'Enter Budget Category Name'**
  String get titleBudgetTooltip;

  /// No description provided for @titleGoal.
  ///
  /// In en, this message translates to:
  /// **'Goal'**
  String get titleGoal;

  /// No description provided for @titleGoalTooltip.
  ///
  /// In en, this message translates to:
  /// **'Define Goal Description'**
  String get titleGoalTooltip;

  /// No description provided for @to.
  ///
  /// In en, this message translates to:
  /// **'to'**
  String get to;

  /// No description provided for @total.
  ///
  /// In en, this message translates to:
  /// **'total'**
  String get total;

  /// No description provided for @transactionFile.
  ///
  /// In en, this message translates to:
  /// **'Fingrom Transactions Log File (.log)'**
  String get transactionFile;

  /// No description provided for @transferHeadline.
  ///
  /// In en, this message translates to:
  /// **'Transfer'**
  String get transferHeadline;

  /// No description provided for @transferTooltip.
  ///
  /// In en, this message translates to:
  /// **'Set Transfer Details'**
  String get transferTooltip;

  /// No description provided for @transfersHeadline.
  ///
  /// In en, this message translates to:
  /// **'Transfers'**
  String get transfersHeadline;

  /// No description provided for @typeButton.
  ///
  /// In en, this message translates to:
  /// **'Button'**
  String get typeButton;

  /// No description provided for @updateAccountTooltip.
  ///
  /// In en, this message translates to:
  /// **'Update Account'**
  String get updateAccountTooltip;

  /// No description provided for @updateBillTooltip.
  ///
  /// In en, this message translates to:
  /// **'Update Bill'**
  String get updateBillTooltip;

  /// No description provided for @updateBudgetTooltip.
  ///
  /// In en, this message translates to:
  /// **'Update Budget Category'**
  String get updateBudgetTooltip;

  /// No description provided for @updateGoalTooltip.
  ///
  /// In en, this message translates to:
  /// **'Update Goal'**
  String get updateGoalTooltip;

  /// No description provided for @updatePaymentTooltip.
  ///
  /// In en, this message translates to:
  /// **'Update Payment'**
  String get updatePaymentTooltip;

  /// No description provided for @username.
  ///
  /// In en, this message translates to:
  /// **'Username (Account)'**
  String get username;

  /// No description provided for @uuid.
  ///
  /// In en, this message translates to:
  /// **'Unique Transaction Identifier'**
  String get uuid;

  /// No description provided for @validTillDate.
  ///
  /// In en, this message translates to:
  /// **'Valid Till'**
  String get validTillDate;

  /// No description provided for @webDav.
  ///
  /// In en, this message translates to:
  /// **'Web Distributed Authoring and Versioning (WebDav)'**
  String get webDav;

  /// No description provided for @zoomState.
  ///
  /// In en, this message translates to:
  /// **'Zoom In / Zoom Out'**
  String get zoomState;
}

class _AppLocalizationsDelegate
    extends LocalizationsDelegate<AppLocalizations> {
  const _AppLocalizationsDelegate();

  @override
  Future<AppLocalizations> load(Locale locale) {
    return SynchronousFuture<AppLocalizations>(lookupAppLocalizations(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>[
        'ar',
        'az',
        'be',
        'cs',
        'de',
        'en',
        'es',
        'fa',
        'fr',
        'hi',
        'it',
        'ja',
        'ko',
        'nl',
        'pl',
        'pt',
        'ro',
        'tr',
        'uk',
        'uz',
        'zh'
      ].contains(locale.languageCode);

  @override
  bool shouldReload(_AppLocalizationsDelegate old) => false;
}

AppLocalizations lookupAppLocalizations(Locale locale) {
  // Lookup logic when language+country codes are specified.
  switch (locale.languageCode) {
    case 'be':
      {
        switch (locale.countryCode) {
          case 'EU':
            return AppLocalizationsBeEu();
        }
        break;
      }
    case 'pt':
      {
        switch (locale.countryCode) {
          case 'BR':
            return AppLocalizationsPtBr();
        }
        break;
      }
    case 'zh':
      {
        switch (locale.countryCode) {
          case 'TW':
            return AppLocalizationsZhTw();
        }
        break;
      }
  }

  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'ar':
      return AppLocalizationsAr();
    case 'az':
      return AppLocalizationsAz();
    case 'be':
      return AppLocalizationsBe();
    case 'cs':
      return AppLocalizationsCs();
    case 'de':
      return AppLocalizationsDe();
    case 'en':
      return AppLocalizationsEn();
    case 'es':
      return AppLocalizationsEs();
    case 'fa':
      return AppLocalizationsFa();
    case 'fr':
      return AppLocalizationsFr();
    case 'hi':
      return AppLocalizationsHi();
    case 'it':
      return AppLocalizationsIt();
    case 'ja':
      return AppLocalizationsJa();
    case 'ko':
      return AppLocalizationsKo();
    case 'nl':
      return AppLocalizationsNl();
    case 'pl':
      return AppLocalizationsPl();
    case 'pt':
      return AppLocalizationsPt();
    case 'ro':
      return AppLocalizationsRo();
    case 'tr':
      return AppLocalizationsTr();
    case 'uk':
      return AppLocalizationsUk();
    case 'uz':
      return AppLocalizationsUz();
    case 'zh':
      return AppLocalizationsZh();
  }

  throw FlutterError(
      'AppLocalizations.delegate failed to load unsupported locale "$locale". This is likely '
      'an issue with the localizations generation tool. Please file an issue '
      'on GitHub with a reproducible sample app and the gen-l10n configuration '
      'that was used.');
}
