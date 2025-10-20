// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get a =>
      'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => 'نبذة عن الشركة';

  @override
  String get account => 'الحساب';

  @override
  String get accountFrom => 'من الحساب';

  @override
  String get accountHeadline => 'الحسابات';

  @override
  String get accountTo => 'إلى الحساب';

  @override
  String get accountTooltip => 'فتح الحسابات';

  @override
  String get accountType => 'نوع الحساب';

  @override
  String get accountTypeTooltip => 'اختر نوع الحساب';

  @override
  String get acknowledgeTooltip => 'الإقرار';

  @override
  String get activate => 'تفعيل';

  @override
  String get actualData => 'البيانات التاريخية';

  @override
  String get addAccountTooltip => 'إضافة حساب';

  @override
  String get addBudgetTooltip => 'إضافة فئة ميزانية جديدة';

  @override
  String get addGoalTooltip => 'إضافة هدف جديد';

  @override
  String get addMainTooltip => 'إضافة فاتورة أو دخل أو تحويل';

  @override
  String afterNDays(Object value) {
    return 'بعد $value أيام';
  }

  @override
  String get amountFrom => 'من المبلغ';

  @override
  String get amountTo => 'إلى المبلغ';

  @override
  String appBuild(Object build) {
    return 'بناء $build';
  }

  @override
  String get appInitHeadline => 'تهيئة المشروع';

  @override
  String get appStartHeadline => 'الإعداد الأولي';

  @override
  String get appTitle => 'فينجروم';

  @override
  String appVersion(Object version) {
    return 'الإصدار: $version';
  }

  @override
  String get automationHeadline => 'الأتمتة';

  @override
  String get automationTypeDays => 'بعد بضعة أيام';

  @override
  String get backTooltip => 'الإرجاع';

  @override
  String get balance => 'الرصيد الفعلي';

  @override
  String get balanceDate => 'تحديث تاريخ الرصيد';

  @override
  String get balanceDateTooltip =>
      'لن تؤثر النتائج والإيرادات قبل هذا التاريخ على الرصيد';

  @override
  String get balanceTooltip => 'تعيين الرصيد';

  @override
  String get bankAccount => 'الحساب البنكي';

  @override
  String get bill => 'الفواتير';

  @override
  String get billHeadline => 'الفواتير';

  @override
  String get billSetTooltip => 'تعيين المبلغ';

  @override
  String billSum(Object value) {
    return 'الفواتير $value';
  }

  @override
  String get billTooltip => 'فواتير مفتوحة';

  @override
  String get billTypeTooltip => '[النوع] فاتورة أو دخل أو تحويل';

  @override
  String get brightnessTheme => 'سمة السطوع';

  @override
  String get btnAdd => 'إضافة';

  @override
  String get btnCancel => 'إلغاء';

  @override
  String get btnConfirm => 'تأكيد';

  @override
  String get btnMore => 'المزيد';

  @override
  String get budget => 'فئة الميزانية';

  @override
  String get budgetHeadline => 'الميزانيات';

  @override
  String get budgetLimit => 'الحد في الشهر';

  @override
  String get budgetLimitHeadline => 'تعديلات الحد في الشهر';

  @override
  String get budgetRelativeLimit => 'المعامل النسبي لكل شهر';

  @override
  String get budgetTooltip => 'أنواع الميزانية المفتوحة';

  @override
  String get budgetType => 'الفاصل الزمني للميزانية';

  @override
  String get budgetTypeAsIs => 'غير محدود';

  @override
  String get budgetTypeFixed => 'ثابت';

  @override
  String get budgetTypeMonth => 'شهرية';

  @override
  String get budgetTypeRelative => 'نسبي';

  @override
  String get budgetTypeWeek => 'أسبوعي';

  @override
  String get budgetTypeYear => 'سنوياً';

  @override
  String get cash => 'النقدية';

  @override
  String get chartBarRace => 'سباق الأعمدة للفئات';

  @override
  String get chartForecast => 'مخطط التنبؤ';

  @override
  String get chartOHLC => 'مخطط الشمعدان (OHLC)';

  @override
  String get chartYtdExpense => 'المصروفات منذ بداية العام وحتى تاريخه';

  @override
  String get clear => 'انخفاض القيمة';

  @override
  String get closeTooltip => 'إغلاق';

  @override
  String get closedAt => 'انتهى حتى الآن';

  @override
  String get cmpChart => 'الرسوم البيانية';

  @override
  String get cmpRecent => 'العناصر الأخيرة';

  @override
  String get cmpRecentCount => 'حجم القائمة';

  @override
  String get coAuthor => 'المؤلف';

  @override
  String get coConsult => 'مستشار';

  @override
  String get coDeveloper => 'مطور';

  @override
  String get coNew => 'انضمام';

  @override
  String get coPromoter => 'promoter';

  @override
  String get coTranslator => 'translator';

  @override
  String get coef => 'المعامل';

  @override
  String get collapse => 'طي (استعادة) القسم';

  @override
  String get color => 'اللون';

  @override
  String get colorApp => 'مخصص';

  @override
  String get colorBackground => 'الخلفية';

  @override
  String get colorDark => 'داكن';

  @override
  String get colorInversePrimary => 'أساسي معكوس';

  @override
  String get colorInverseSurface => 'السطح المعكوس';

  @override
  String get colorLight => 'فاتح';

  @override
  String get colorOnInverseSurface => 'على السطح المعكوس';

  @override
  String get colorOnSecondary => 'على الثانوي';

  @override
  String get colorOnSecondaryContainer => 'على الحاوية';

  @override
  String get colorPrimary => 'ابتدائي';

  @override
  String get colorRestore => 'إعادة تعيين اللوحة';

  @override
  String get colorSecondary => 'ثانوي';

  @override
  String get colorSystem => 'اللوحة الافتراضية';

  @override
  String get colorTheme => 'لوحة الألوان';

  @override
  String get colorTooltip => 'اختر لوناً';

  @override
  String get colorType => 'نوع اللون';

  @override
  String get colorUser => 'شخصي';

  @override
  String columnMap(Object value) {
    return 'التعيين للعمود \'$value\'';
  }

  @override
  String columnMapTooltip(Object value) {
    return '\'$value\' - اختر تعيين العمود';
  }

  @override
  String get completeGoalTooltip => 'إكمال الهدف';

  @override
  String get confirmHeader => 'تأكيد الإجراء';

  @override
  String get confirmTooltip => 'هل أنت متأكد؟ لا يمكن التراجع عن هذا الإجراء.';

  @override
  String get contributors => 'المساهمون';

  @override
  String get conversion => 'التحويل';

  @override
  String conversionMessage(Object currency) {
    return 'تم التحويل بـ $currency';
  }

  @override
  String get copiedToClipboard => 'تم النسخ إلى الحافظة';

  @override
  String get createAccountHeader => 'إنشاء حساب جديد';

  @override
  String get createAccountTooltip => 'إنشاء حساب جديد';

  @override
  String get createBillHeader => 'إنشاء معاملة جديدة';

  @override
  String get createBillTooltip => 'إضافة فاتورة جديدة';

  @override
  String get createBudgetHeader => 'فئة ميزانية جديدة';

  @override
  String get createBudgetTooltip => 'إنشاء فئة ميزانية جديدة';

  @override
  String get createGoalHeader => 'إنشاء هدف جديد';

  @override
  String get createGoalTooltip => 'إضافة هدف جديد';

  @override
  String get createIncomeTooltip => 'إضافة دخل جديد';

  @override
  String get createPaymentTooltip => 'إضافة دفعة جديدة';

  @override
  String get createTransferTooltip => 'إنشاء تحويل';

  @override
  String get credit => 'ائتمان';

  @override
  String get creditCard => 'بطاقة ائتمان';

  @override
  String get currency => 'عملة';

  @override
  String get currencyAddHeadline => 'صرف العملات';

  @override
  String get currencyAddTooltip => 'إضافة سعر صرف العملة';

  @override
  String get currencyDefault => 'العملة الافتراضية';

  @override
  String get currencyDistribution => 'التوزيع';

  @override
  String currencyExchange(Object from, Object to) {
    return 'صرف العملات: $from -> $to';
  }

  @override
  String get currencyHeadline => 'العملات';

  @override
  String currencyIn(Object value) {
    return 'في $value';
  }

  @override
  String get currencyShort => 'العملة';

  @override
  String get currencyTooltip => 'نوع العملة (الرمز)';

  @override
  String get currencyUpdateTooltip => 'تحديث سعر العملات';

  @override
  String get currentDate => 'مؤشر التاريخ الحالي';

  @override
  String get customAddTooltip => 'إضافة عنصر واجهة مستخدم';

  @override
  String get customDeleteTooltip => 'حذف التخصيص';

  @override
  String get customSaveTooltip => 'حفظ التخصيص';

  @override
  String get customizeTooltip => 'تخصيص الصفحة';

  @override
  String get darkMode => 'داكن';

  @override
  String get dateFormat => 'تنسيق التاريخ';

  @override
  String get dateRange => 'نطاق التاريخ';

  @override
  String get dateTooltip => 'تحديد التاريخ';

  @override
  String get dayMonday => 'الإثنين';

  @override
  String get dayStartOfMonth => 'بداية الشهر';

  @override
  String get dayStartOfWeek => 'بداية الأسبوع';

  @override
  String get daySunday => 'الأحد';

  @override
  String get debitCard => 'بطاقة الخصم';

  @override
  String def(Object value) {
    return 'القيمة الافتراضية لـ \'$value\'';
  }

  @override
  String get deleteAccountTooltip => 'إلغاء تنشيط الحساب';

  @override
  String get deleteBillTooltip => 'حذف الفاتورة';

  @override
  String get deleteBudgetTooltip => 'إلغاء تنشيط فئة الميزانية';

  @override
  String get deleteGoalTooltip => 'حذف الهدف';

  @override
  String get deleteInvoiceTooltip => 'حذف الفاتورة';

  @override
  String get deletePaymentTooltip => 'حذف الدفع';

  @override
  String get deleteTooltip => 'Delete';

  @override
  String get deleteTransferTooltip => 'حذف التحويل';

  @override
  String get deposit => 'إيداع';

  @override
  String get description => 'الوصف';

  @override
  String get descriptionTooltip => 'تعيين تفاصيل النفقات';

  @override
  String get design => 'وضع التصميم (خاص بالثقافة)';

  @override
  String get designAsiaGeneral => 'آسيا عام';

  @override
  String get designGermany => 'ألمانيا';

  @override
  String get designGlobal => 'عالمي';

  @override
  String get designRtlGeneral => 'حروف من اليمين إلى اليسار';

  @override
  String get details => 'التفاصيل';

  @override
  String get detailsTooltip => '****2345 - آخر 4 أرقام من الرقم';

  @override
  String get dtAm => 'صباحاً';

  @override
  String get dtAmPm => 'الساعة صباحاً/مساءً (0 ~ 11)';

  @override
  String get dtDay => 'اليوم بالشهر';

  @override
  String get dtEscape => 'الهروب للنص';

  @override
  String get dtHalfHour => 'الساعة صباحاً/مساءً (1 ~ 12)';

  @override
  String get dtHour => 'الساعة في اليوم (0 ~ 23)';

  @override
  String get dtMinute => 'الدقيقة بالساعة';

  @override
  String get dtMonth => 'الشهر بالسنة';

  @override
  String get dtNamedDay => 'يوم في الأسبوع';

  @override
  String get dtPm => 'مساءً';

  @override
  String get dtQuote => 'اقتباس واحد';

  @override
  String get dtSecond => 'الثانية بالدقيقة';

  @override
  String get dtYear => 'سنة';

  @override
  String get editAccountHeader => 'تحديث الحساب';

  @override
  String get editAccountTooltip => 'تعديل الحساب';

  @override
  String get editBillHeader => 'تحديث الفاتورة';

  @override
  String get editBillTooltip => 'تحرير الفاتورة';

  @override
  String get editBudgetHeader => 'تحديث فئة الميزانية';

  @override
  String get editBudgetTooltip => 'تحرير فئة الميزانية';

  @override
  String get editGoalHeader => 'تحديث الهدف';

  @override
  String get editGoalTooltip => 'تحرير الهدف';

  @override
  String get editInvoiceTooltip => 'تحرير الفاتورة';

  @override
  String get editPaymentTooltip => 'تحرير الدفع';

  @override
  String get editTooltip => 'تحرير';

  @override
  String get editTransferTooltip => 'تحرير التحويل';

  @override
  String get encryptionMode => 'تشفير البيانات';

  @override
  String error(Object value) {
    return 'خطأ $value';
  }

  @override
  String get errorExpired => 'انتهت صلاحية البطاقة';

  @override
  String get errorNegative => 'لا يمكن أن تكون سلبية! الرجاء إصلاح الخطأ';

  @override
  String get example => 'Example';

  @override
  String get expand => 'توسيع القسم';

  @override
  String get expense => 'مبلغ المصروفات';

  @override
  String get expenseDateTime => 'تمت المحاسبة على';

  @override
  String get expenseHeadline => 'المصاريف';

  @override
  String get expenseTransfer => 'مبلغ التحويل';

  @override
  String exportFile(Object value) {
    return 'التصدير كملف .$value-ملف';
  }

  @override
  String get failData => 'المبلغ المستقطع';

  @override
  String get flowTypeInvoice => 'الفاتورة';

  @override
  String get flowTypeTooltip => 'نوع المبلغ فاتورة، فاتورة';

  @override
  String get forecastData => 'تنبؤات';

  @override
  String get from => 'من';

  @override
  String get goNextTooltip => 'الانتقال إلى التالي';

  @override
  String get goalHeadline => 'الأهداف';

  @override
  String goalProfit(Object value) {
    return 'هدف الأهداف: $value';
  }

  @override
  String get goalProfitTooltip => 'الربح مقابل هدف الأهداف';

  @override
  String get goalTooltip => 'الأهداف المفتوحة';

  @override
  String get hasEncrypted => 'بمجرد تعيينها، لا يمكن تغييرها';

  @override
  String get helpTooltip => '[تعليمات] إظهار وصف تلك الصفحة';

  @override
  String get homeHeadline => 'الصفحة الرئيسية';

  @override
  String get homeTooltip => 'العودة إلى الصفحة الرئيسية';

  @override
  String get icon => 'أيقونة';

  @override
  String get iconTooltip => 'تحديد الأيقونة';

  @override
  String get ignoreTooltip => 'تجاهل';

  @override
  String get importHeadline => 'الاستيراد/التصدير';

  @override
  String get income => 'مبلغ الدخل';

  @override
  String get incomeHeadline => 'الدخل';

  @override
  String get incomeHealth => 'رادار صحة الدخل';

  @override
  String get incomeTooltip => 'تعيين تفاصيل الدخل';

  @override
  String get invoiceHeadline => 'الفواتير';

  @override
  String invoiceSum(Object value) {
    return 'الفواتير $value';
  }

  @override
  String get isCleaned => 'إزالة البيانات الموجودة';

  @override
  String get isCreated => 'تم إنشاؤه بالفعل، اتبع الخطوات التالية!';

  @override
  String get isEncrypted => 'الملف مشفر (افتراضيًا)';

  @override
  String get isRequired => 'مطلوب';

  @override
  String get language => 'اللغة';

  @override
  String get left => 'يسار';

  @override
  String get lightMode => 'خفيف';

  @override
  String get link => 'محدد موقع الموارد الموحد (URL)';

  @override
  String get meaning => 'المعنى';

  @override
  String get metricsHeadline => 'المقاييس';

  @override
  String get metricsTooltip => 'المقاييس';

  @override
  String get milestones => 'المقاييس';

  @override
  String get missingContent => 'يتعذر معالجة الملف (تم إلغاء إما)';

  @override
  String get navigationTooltip => 'فتح القائمة الرئيسية';

  @override
  String netProfit(Object value) {
    return 'الربح: $value';
  }

  @override
  String get noChartData => 'البيانات مفقودة (أو غير كافية) ليتم عرضها';

  @override
  String get notifyHeadline => 'محلل الإخطارات';

  @override
  String get ok => 'موافق';

  @override
  String get orderPin => 'الترتيب حسب الأولوية';

  @override
  String get orderUnpin => 'الترتيب المعمم';

  @override
  String get outputFile => 'وجهة الملف';

  @override
  String get parseFile => 'تحليل ملف';

  @override
  String get password => 'كلمة المرور';

  @override
  String get path => 'اسم الملف (للحفظ فيه أو التحميل منه)';

  @override
  String get paymentType => 'فترة السداد';

  @override
  String get paymentsHeadline => 'المدفوعات المتكررة';

  @override
  String get pearDisabled => '-- معطل';

  @override
  String get pearLoading => 'قيد التنفيذ...';

  @override
  String get peerAccept => 'قبول';

  @override
  String get peerAction => 'الإجراء';

  @override
  String get peerClosed => 'تم الإنهاء';

  @override
  String get peerConnect => 'توصيل الجهاز';

  @override
  String get peerConnectBtn => 'توصيل';

  @override
  String get peerDelete => 'delete';

  @override
  String get peerDevice => 'الأجهزة المتصلة';

  @override
  String get peerId => 'معرّف الجهاز الخاص بك للاتصال';

  @override
  String get peerOffline => 'غير متصل';

  @override
  String get peerOnline => 'connected';

  @override
  String get peerOtherId => 'معرّف الجهاز للاتصال';

  @override
  String get peerPending => 'معلق';

  @override
  String get peerPing => 'بينغ';

  @override
  String get peerSent => 'يتم نقل البيانات إلى الأجهزة المتصلة';

  @override
  String get peerStatus => 'الحالة';

  @override
  String get peerSync => 'نقل البيانات';

  @override
  String pickFile(Object value) {
    return 'اختر .$value-الملف';
  }

  @override
  String pongStatus(Object uuid) {
    return 'تم أخذ الطلب من $uuid';
  }

  @override
  String get processIsFinished => 'تم الانتهاء';

  @override
  String progress(Object value) {
    return 'تقدم $value٪';
  }

  @override
  String get raiseData => 'المبلغ المضاف';

  @override
  String get recoveryHeadline => 'الاسترداد';

  @override
  String get recoveryTooltip => 'الاسترداد من';

  @override
  String get releases => 'الإصدارات';

  @override
  String get reset => 'إعادة تعيين';

  @override
  String get returnBack => 'العودة إلى الوراء';

  @override
  String get roadmap => 'خارطة الطريق';

  @override
  String get saveNotification => 'تم حفظ التغييرات';

  @override
  String get saveSettingsTooltip => 'حفظ';

  @override
  String get saveTooltip => 'حفظ إلى';

  @override
  String search(Object value) {
    return 'إظهار حسب نمط \'$value\'';
  }

  @override
  String get searchTooltip => 'يبحث';

  @override
  String get settingsBaseHeadline => 'الأساسيات';

  @override
  String get settingsHeadline => 'الإعدادات';

  @override
  String get skipFromTotals => 'الاستبعاد من المجاميع';

  @override
  String get skipTooltip => 'تخطي الخطوة (الخطوات)';

  @override
  String get spent => 'المستهلكة';

  @override
  String get splitCancelTooltip => 'إلغاء التقسيم في الشهر';

  @override
  String get splitTooltip => 'إعلان الحدود في الشهر';

  @override
  String get subscription =>
      'كمشروع مفتوح المصدر، لن يؤدي الاشتراك إلى فتح أي ميزات إضافية. ومع ذلك، فإنه سيكون بمثابة استثمار في التطوير والتحسين المستمر للتطبيق، والحفاظ على إتاحته.';

  @override
  String get subscriptionCoffee => 'اشترِ قهوة';

  @override
  String get subscriptionDinner => 'عشاء على العشاء';

  @override
  String get subscriptionDonorbox => 'اشترك عبر صندوق التبرع';

  @override
  String get subscriptionGithub => 'اشترك عبر GitHub';

  @override
  String get subscriptionHeadline => 'الرعاية';

  @override
  String get subscriptionInactive => 'خدمة الشراء غير متوفرة';

  @override
  String get subscriptionPatreon => 'اشترك عبر Patreon';

  @override
  String get subscriptionPaypal => 'اشترِ قهوة (PayPal)';

  @override
  String get subscriptionTiny => 'تبرع بعملة محظوظة';

  @override
  String get subscriptionTooltip => 'الدعم (رعاية)';

  @override
  String get success => 'نجح';

  @override
  String get summary => 'ملخص';

  @override
  String get symbol => 'الرمز';

  @override
  String get syncHeadline => 'أجهزة المزامنة';

  @override
  String get systemMode => 'النظام';

  @override
  String get tapToOpen => 'انقر للفتح';

  @override
  String get targetAmount => 'المبلغ المستهدف';

  @override
  String get termPrivacy => 'سياسة الخصوصية';

  @override
  String get termUse => 'شروط الاستخدام';

  @override
  String get title => 'العنوان';

  @override
  String get titleAccountTooltip => 'أدخل معرّف الحساب';

  @override
  String get titleBudgetTooltip => 'أدخل اسم فئة الميزانية';

  @override
  String get titleGoal => 'الهدف';

  @override
  String get titleGoalTooltip => 'تحديد وصف الهدف';

  @override
  String get to => 'إلى';

  @override
  String get total => 'الإجمالي';

  @override
  String get transactionFile => 'ملف سجل المعاملات المالية (.log)';

  @override
  String get transferHeadline => 'التحويل';

  @override
  String get transferTooltip => 'تعيين تفاصيل التحويل';

  @override
  String get transfersHeadline => 'التحويلات';

  @override
  String get typeButton => 'الزر';

  @override
  String get updateAccountTooltip => 'تحديث الحساب';

  @override
  String get updateBillTooltip => 'تحديث الفاتورة';

  @override
  String get updateBudgetTooltip => 'تحديث فئة الميزانية';

  @override
  String get updateGoalTooltip => 'تحديث الهدف';

  @override
  String get updatePaymentTooltip => 'تحديث الدفع';

  @override
  String get username => 'اسم المستخدم (الحساب)';

  @override
  String get uuid => 'معرّف المعاملة الفريد';

  @override
  String get validTillDate => 'حتى تاريخ الصلاحية';

  @override
  String get webDav => 'التأليف والإصدار الموزع عبر الويب (WebDav)';

  @override
  String get zoomState => 'تكبير/تصغير';
}
