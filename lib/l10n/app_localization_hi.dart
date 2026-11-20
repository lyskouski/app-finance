// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Hindi (`hi`).
class AppLocalizationsHi extends AppLocalizations {
  AppLocalizationsHi([String locale = 'hi']) : super(locale);

  @override
  String get a => 'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => 'के बारे में';

  @override
  String get account => 'खाता';

  @override
  String get accountFrom => 'अकाउंट से';

  @override
  String get accountHeadline => 'हिसाब किताब';

  @override
  String get accountTo => 'खाते में';

  @override
  String get accountTooltip => 'खाते खोलें';

  @override
  String get accountType => 'खाते का प्रकार';

  @override
  String get accountTypeTooltip => 'खाता प्रकार चुनें';

  @override
  String get acknowledgeTooltip => 'स्वीकार करना';

  @override
  String get activate => 'सक्रिय';

  @override
  String get actualData => 'ऐतिहासिक डेटा';

  @override
  String get addAccountTooltip => 'खाता जोड़ें';

  @override
  String get addBudgetTooltip => 'नई बजट श्रेणी जोड़ें';

  @override
  String get addGoalTooltip => 'नया लक्ष्य जोड़ें';

  @override
  String get addMainTooltip => 'बिल, आय या स्थानांतरण जोड़ें';

  @override
  String afterNDays(Object value) {
    return '$value दिनों के बाद';
  }

  @override
  String get amountFrom => 'राशि से';

  @override
  String get amountTo => 'राशि तक';

  @override
  String appBuild(Object build) {
    return 'निर्माण: $build';
  }

  @override
  String get appInitHeadline => 'परियोजना आरंभीकरण';

  @override
  String get appStartHeadline => 'प्रारंभिक व्यवस्था';

  @override
  String get appTitle => 'उँगलियाँ';

  @override
  String appVersion(Object version) {
    return 'संस्करण: $version';
  }

  @override
  String get automationHeadline => 'स्वचालन';

  @override
  String get automationTypeDays => 'कुछ दिनों के बाद';

  @override
  String get backTooltip => 'वापस लौटाएं';

  @override
  String get balance => 'वास्तविक संतुलन';

  @override
  String get balanceDate => 'शेष तिथि अद्यतन';

  @override
  String get balanceDateTooltip => 'इस तिथि से पहले के परिणाम और आय शेष राशि को प्रभावित नहीं करेंगे';

  @override
  String get balanceTooltip => 'संतुलन स्थापित करें';

  @override
  String get bankAccount => 'बैंक खाता';

  @override
  String get bill => 'बिल';

  @override
  String get billHeadline => 'विधेयकों';

  @override
  String get billSetTooltip => 'रकम तय करें';

  @override
  String billSum(Object value) {
    return 'बिल: $value';
  }

  @override
  String get billTooltip => 'बिल खोलें';

  @override
  String get billTypeTooltip => '[प्रकार] बिल, आय या स्थानांतरण';

  @override
  String get brightnessTheme => 'चमक थीम';

  @override
  String get btnAdd => 'जोड़ना';

  @override
  String get btnCancel => 'रद्द करना';

  @override
  String get btnConfirm => 'पुष्टि करना';

  @override
  String get btnMore => 'अधिक';

  @override
  String get budget => 'बजट श्रेणी';

  @override
  String get budgetHeadline => 'बजट';

  @override
  String get budgetLimit => 'प्रति माह सीमा';

  @override
  String get budgetLimitHeadline => 'सीमा समायोजन';

  @override
  String get budgetPositive => 'बजट, सारांश हैंडलर';

  @override
  String get budgetPositiveOff => 'नकारात्मक मानों की अनदेखी करें';

  @override
  String get budgetPositiveOn => 'नकारात्मक मानों को शामिल करें';

  @override
  String get budgetRelativeLimit => 'प्रति माह सापेक्ष गुणांक';

  @override
  String get budgetTooltip => 'बजट प्रकार खोलें';

  @override
  String get budgetType => 'बजट अंतराल';

  @override
  String get budgetTypeAsIs => 'असीमित';

  @override
  String get budgetTypeFixed => 'निश्चित';

  @override
  String get budgetTypeMonth => 'मासिक';

  @override
  String get budgetTypeRelative => 'सापेक्ष';

  @override
  String get budgetTypeWeek => 'साप्ताहिक';

  @override
  String get budgetTypeYear => 'वार्षिक';

  @override
  String get cash => 'नकद';

  @override
  String get chartBarRace => 'श्रेणियों के लिए बार रेस';

  @override
  String get chartForecast => 'पूर्वानुमान चार्ट';

  @override
  String get chartOHLC => 'कैंडलस्टिक (खुला-उच्च-निम्न-बंद) चार्ट';

  @override
  String get chartYtdExpense => 'वर्ष-दर-वर्ष व्यय';

  @override
  String get clear => 'ड्रॉप वैल्यू';

  @override
  String get closeTooltip => 'बंद करना';

  @override
  String get closedAt => 'आज तक समाप्त';

  @override
  String get cmpChart => 'चित्र';

  @override
  String get cmpRecent => 'हाल के आइटम';

  @override
  String get cmpRecentCount => 'सूची का आकार';

  @override
  String get coAuthor => 'लेखक';

  @override
  String get coConsult => 'सलाहकार';

  @override
  String get coDeveloper => 'डेवलपर';

  @override
  String get coNew => 'जोड़ना';

  @override
  String get coPromoter => 'प्रमोटर';

  @override
  String get coTranslator => 'अनुवादक';

  @override
  String get coef => 'कोएफ़.';

  @override
  String get collapse => 'अनुभाग को संक्षिप्त करें (पुनर्स्थापित करें)।';

  @override
  String get color => 'रंग';

  @override
  String get colorApp => 'रिवाज़';

  @override
  String get colorBackground => 'पृष्ठभूमि';

  @override
  String get colorDark => 'अँधेरा';

  @override
  String get colorInversePrimary => 'उलटा प्राथमिक';

  @override
  String get colorInverseSurface => 'उलटा सतह';

  @override
  String get colorLight => 'रोशनी';

  @override
  String get colorOnInverseSurface => 'उलटी सतह पर';

  @override
  String get colorOnSecondary => 'माध्यमिक पर';

  @override
  String get colorOnSecondaryContainer => 'कंटेनर पर';

  @override
  String get colorPrimary => 'प्राथमिक';

  @override
  String get colorRestore => 'पैलेट रीसेट करें';

  @override
  String get colorSecondary => 'माध्यमिक';

  @override
  String get colorSystem => 'गलती करना';

  @override
  String get colorTheme => 'पैलेट';

  @override
  String get colorTooltip => 'एक रंग चुनें';

  @override
  String get colorType => 'रंग प्रकार';

  @override
  String get colorUser => 'निजी';

  @override
  String columnMap(Object value) {
    return 'कॉलम \'$value\' के लिए मैपिंग';
  }

  @override
  String columnMapTooltip(Object value) {
    return '\'$value\' - कॉलम मैपिंग चुनें';
  }

  @override
  String get completeGoalTooltip => 'पूरा लक्ष्य';

  @override
  String get confirmHeader => 'कार्रवाई की पुष्टि करें';

  @override
  String get confirmTooltip => 'क्या आपको यकीन है? इस एक्शन को वापस नहीं किया जा सकता।';

  @override
  String get contributors => 'योगदानकर्ताओं';

  @override
  String get conversion => 'परिवर्तन';

  @override
  String conversionMessage(Object currency) {
    return '$currency में लिया गया';
  }

  @override
  String get copiedToClipboard => 'क्लिपबोर्ड पर कॉपी किया गया';

  @override
  String get createAccountHeader => 'नया खाता बनाएँ';

  @override
  String get createAccountTooltip => 'नया खाता बनाएँ';

  @override
  String get createBillHeader => 'नया लेनदेन बनाएं';

  @override
  String get createBillTooltip => 'नया बिल जोड़ें';

  @override
  String get createBudgetHeader => 'नई बजट श्रेणी';

  @override
  String get createBudgetTooltip => 'नई बजट श्रेणी बनाएं';

  @override
  String get createGoalHeader => 'लक्ष्य बनाएं';

  @override
  String get createGoalTooltip => 'नया लक्ष्य जोड़ें';

  @override
  String get createIncomeTooltip => 'नई आय जोड़ें';

  @override
  String get createPaymentTooltip => 'नया भुगतान जोड़ें';

  @override
  String get createTransferTooltip => 'स्थानांतरण बनाएँ';

  @override
  String get credit => 'श्रेय';

  @override
  String get creditCard => 'क्रेडिट कार्ड';

  @override
  String get currency => 'मुद्रा';

  @override
  String get currencyAddHeadline => 'मुद्रा विनिमय';

  @override
  String get currencyAddTooltip => 'मुद्रा विनिमय दर जोड़ें';

  @override
  String get currencyDefault => 'डिफ़ॉल्ट मुद्रा';

  @override
  String get currencyDistribution => 'वितरण';

  @override
  String currencyExchange(Object from, Object to) {
    return 'मुद्रा विनिमय: $from -> $to';
  }

  @override
  String get currencyHeadline => 'मुद्राओं';

  @override
  String currencyIn(Object value) {
    return 'मूल्य $value';
  }

  @override
  String get currencyShort => 'मुद्रा';

  @override
  String get currencyTooltip => 'मुद्रा प्रकार (कोड)';

  @override
  String get currencyUpdateTooltip => 'मुद्रा दर अद्यतन करें';

  @override
  String get currentDate => 'वर्तमान दिनांक सूचक';

  @override
  String get customAddTooltip => 'विजेट जोड़ें';

  @override
  String get customDeleteTooltip => 'अनुकूलन हटाएँ';

  @override
  String get customSaveTooltip => 'अनुकूलन सहेजें';

  @override
  String get customizeTooltip => 'पृष्ठ अनुकूलित करें';

  @override
  String get darkMode => 'अँधेरा';

  @override
  String get dateFormat => 'तारिख का प्रारूप';

  @override
  String get dateRange => 'तारीख़ की सीमा';

  @override
  String get dateTooltip => 'तारीख़ चुनें';

  @override
  String get dayMonday => 'सोमवार';

  @override
  String get daySaturday => 'शनिवार';

  @override
  String get dayStartOfMonth => 'महीने की शुरुआत';

  @override
  String get dayStartOfWeek => 'सप्ताह की शुरुआत';

  @override
  String get daySunday => 'रविवार';

  @override
  String get deactivateAction => 'पासवर्ड सुरक्षा अक्षम करें';

  @override
  String get debitCard => 'डेबिट कार्ड';

  @override
  String def(Object value) {
    return '\'$value\' के लिए डिफ़ॉल्ट मान';
  }

  @override
  String get deleteAccountTooltip => 'खाता निष्क्रिय करें';

  @override
  String get deleteBillTooltip => 'बिल हटाएँ';

  @override
  String get deleteBudgetTooltip => 'बजट श्रेणी निष्क्रिय करें';

  @override
  String get deleteGoalTooltip => 'लक्ष्य हटाएँ';

  @override
  String get deleteInvoiceTooltip => 'चालान हटाएँ';

  @override
  String get deletePaymentTooltip => 'भुगतान हटाएं';

  @override
  String get deleteTooltip => 'मिटाना';

  @override
  String get deleteTransferTooltip => 'स्थानांतरण हटाएँ';

  @override
  String get deposit => 'जमा';

  @override
  String get description => 'विवरण';

  @override
  String get descriptionTooltip => 'व्यय विवरण सेट करें';

  @override
  String get design => 'डिज़ाइन मोड (संस्कृति विशिष्ट)';

  @override
  String get designAsiaGeneral => 'एशिया जनरल';

  @override
  String get designGermany => 'जर्मनी';

  @override
  String get designGlobal => 'वैश्विक';

  @override
  String get designRtlGeneral => 'दाएं से बाएं अक्षरांकन';

  @override
  String get details => 'विवरण';

  @override
  String get detailsTooltip => '****2345 - संख्या के अंतिम 4 अंक';

  @override
  String get dtAm => 'पूर्वाह्न';

  @override
  String get dtAmPm => 'प्रातः/अपराह्न में घंटा (0~11)';

  @override
  String get dtDay => 'महीने में दिन';

  @override
  String get dtEscape => 'पाठ के लिए पलायन';

  @override
  String get dtHalfHour => 'प्रातः/अपराह्न में घंटा (1~12)';

  @override
  String get dtHour => 'दिन में घंटा (0~23)';

  @override
  String get dtMinute => 'घंटे में मिनट';

  @override
  String get dtMonth => 'साल में महीना';

  @override
  String get dtNamedDay => 'सप्ताह का दिन';

  @override
  String get dtPm => 'बजे';

  @override
  String get dtQuote => 'एकल बोली';

  @override
  String get dtSecond => 'मिनट में दूसरा';

  @override
  String get dtYear => 'वर्ष';

  @override
  String get editAccountHeader => 'खाता अद्यतन करें';

  @override
  String get editAccountTooltip => 'खाता संपादित करें';

  @override
  String get editBillHeader => 'बिल अद्यतन करें';

  @override
  String get editBillTooltip => 'बिल संपादित करें';

  @override
  String get editBudgetHeader => 'बजट श्रेणी अद्यतन करें';

  @override
  String get editBudgetTooltip => 'बजट श्रेणी संपादित करें';

  @override
  String get editGoalHeader => 'लक्ष्य अद्यतन करें';

  @override
  String get editGoalTooltip => 'लक्ष्य संपादित करें';

  @override
  String get editInvoiceTooltip => 'चालान संपादित करें';

  @override
  String get editPaymentTooltip => 'भुगतान संपादित करें';

  @override
  String get editTooltip => 'संपादन करना';

  @override
  String get editTransferTooltip => 'स्थानांतरण संपादित करें';

  @override
  String get enableBankingAppId => 'ऐप्लिकेशन आईडी';

  @override
  String get enableBankingBank => 'बैंक';

  @override
  String get enableBankingCode => 'प्राधिकरण के बाद खुले पृष्ठ का पता';

  @override
  String get enableBankingCodeTooltip => 'बैंक में पहुँच की पुष्टि करें, फिर ब्राउज़र से पता कॉपी करके यहाँ पेस्ट करें';

  @override
  String get enableBankingCountry => 'देश (ISO कोड, जैसे DE)';

  @override
  String get enableBankingDescription =>
      'enablebanking.com पर पंजीकृत अपने स्वयं के ऐप्लिकेशन के साथ Enable Banking API (PSD2) के माध्यम से यूरोपीय बैंकों से शेष राशि और लेनदेन आयात करें। पहुँच केवल पढ़ने के लिए है: कोई भुगतान नहीं किया जाता।';

  @override
  String get enableBankingHeadline => 'Enable Banking (EU)';

  @override
  String get enableBankingIncomplete => 'ऐप्लिकेशन आईडी, निजी कुंजी, रीडायरेक्ट URL और देश भरें';

  @override
  String get enableBankingKey => 'निजी कुंजी (PEM)';

  @override
  String get enableBankingKeyInvalid => 'अमान्य निजी कुंजी: PEM ब्लॉक \"PRIVATE KEY\" अपेक्षित है';

  @override
  String get enableBankingKeyNotRsa => 'अमान्य निजी कुंजी: RSA कुंजी अपेक्षित है';

  @override
  String get enableBankingKeyTooltip =>
      'Enable Banking Control Panel में ऐप्लिकेशन के साथ बनाई जाती है; एन्क्रिप्टेड रूप में संग्रहीत। संग्रहीत कुंजी रखने के लिए खाली छोड़ें';

  @override
  String get enableBankingLoadBanks => 'बैंक लोड करें';

  @override
  String get enableBankingNoAuthPage => 'Enable Banking ने कोई प्राधिकरण पृष्ठ नहीं लौटाया';

  @override
  String get enableBankingNoCode => 'पते में कोई प्राधिकरण कोड नहीं मिला';

  @override
  String get enableBankingRedirect => 'रीडायरेक्ट URL';

  @override
  String get enableBankingRedirectTooltip => 'ऐप्लिकेशन के लिए पंजीकृत; प्राधिकरण के बाद बैंक इसी पर लौटता है';

  @override
  String get enableBankingStateMismatch => 'यह पता किसी अन्य प्राधिकरण का है, फिर से कनेक्ट करें';

  @override
  String get encryptionMode => 'डेटा एन्क्रिप्शन';

  @override
  String error(Object value) {
    return 'त्रुटि: $value';
  }

  @override
  String get errorExpired => 'कार्ड समाप्त हो गया';

  @override
  String get errorNegative => 'नकारात्मक नहीं हो सकता! कृपया, त्रुटि ठीक करें';

  @override
  String get example => 'उदाहरण';

  @override
  String get expand => 'अनुभाग का विस्तार करें';

  @override
  String get expense => 'व्यय की राशि';

  @override
  String get expenseDateTime => 'पर बिल किया गया';

  @override
  String get expenseHeadline => 'व्यय';

  @override
  String get expenseTransfer => 'स्थानांतरण की राशि';

  @override
  String exportFile(Object value) {
    return '.$value फ़ाइल के रूप में निर्यात करें';
  }

  @override
  String get failData => 'राशि कटौती';

  @override
  String get finTsApproved => 'बैंक ऐप में स्वीकृत';

  @override
  String get finTsBankCode => 'बैंक कोड (BLZ)';

  @override
  String get finTsCustomerId => 'ग्राहक आईडी (यदि उपयोगकर्ता आईडी से अलग हो)';

  @override
  String get finTsDescription =>
      'FinTS 4.1 (PIN/TAN) समर्थित बैंकों से शेष राशि और लेनदेन आयात करें। पहुँच केवल पढ़ने के लिए है: कोई भुगतान नहीं किया जाता।';

  @override
  String get finTsHeadline => 'Financial Transaction Services (FinTS 4.1)';

  @override
  String get finTsIncomplete => 'सर्वर URL, बैंक कोड, उपयोगकर्ता आईडी और उत्पाद पंजीकरण संख्या भरें';

  @override
  String finTsLoginChanged(Object value) {
    return 'बैंक ने लॉगिन डेटा बदल दिया है, उपयोगकर्ता आईडी या ग्राहक आईडी अपडेट करें: $value';
  }

  @override
  String finTsLoginRefused(Object value) {
    return 'बैंक ने पिछला लॉगिन अस्वीकार कर दिया: $value। दर्ज किए गए PIN से फिर प्रयास करें?';
  }

  @override
  String get finTsPin => 'PIN';

  @override
  String get finTsPinHint => 'केवल इस सत्र के लिए उपयोग होता है और कभी संग्रहीत नहीं किया जाता';

  @override
  String get finTsProductId => 'उत्पाद पंजीकरण संख्या';

  @override
  String get finTsProductIdTooltip => 'Deutsche Kreditwirtschaft द्वारा ऐप निर्माता को जारी की जाती है';

  @override
  String get finTsTan => 'TAN';

  @override
  String get finTsTanHeadline => 'लेनदेन प्रमाणीकरण (TAN)';

  @override
  String get finTsTanMedium => 'TAN माध्यम चुनें';

  @override
  String get finTsTanMethod => 'TAN विधि चुनें';

  @override
  String get finTsUrl => 'बैंक का FinTS सर्वर URL';

  @override
  String get finTsUserId => 'उपयोगकर्ता आईडी (लॉगिन)';

  @override
  String get finTsVersion => 'प्रोटोकॉल संस्करण';

  @override
  String get finTsWebUnsupported =>
      'बैंक सर्वर ब्राउज़र से पहुँच की अनुमति नहीं देते। डेस्कटॉप या मोबाइल ऐप का उपयोग करें।';

  @override
  String get flowTypeInvoice => 'चालान';

  @override
  String get flowTypeTooltip => 'राशि का प्रकार: बिल, चालान';

  @override
  String get forecastData => 'पूर्वानुमान';

  @override
  String get from => 'से';

  @override
  String get goNextTooltip => 'आगे बढ़ें';

  @override
  String get goalHeadline => 'लक्ष्य';

  @override
  String goalProfit(Object value) {
    return 'लक्ष्य लक्ष्य: $value';
  }

  @override
  String get goalProfitTooltip => 'लाभ बनाम लक्ष्य लक्ष्य';

  @override
  String get goalTooltip => 'लक्ष्य खोलें';

  @override
  String get hasEncrypted => 'एक बार सेट हो जाने पर, बदला नहीं जा सकता';

  @override
  String get helpTooltip => '[सहायता] उस पृष्ठ का विवरण दिखाएँ';

  @override
  String get homeHeadline => 'घर';

  @override
  String get homeTooltip => 'मुख्य पृष्ठ पर वापस जाएँ';

  @override
  String get hour => 'घंटा';

  @override
  String get icon => 'आइकन';

  @override
  String get iconTooltip => 'आइकन चुनें';

  @override
  String get ignoreTooltip => 'अनदेखा करना';

  @override
  String get importHeadline => 'आयात / निर्यात';

  @override
  String get income => 'आय की राशि';

  @override
  String get incomeHeadline => 'आय';

  @override
  String get incomeHealth => 'आय स्वास्थ्य रडार';

  @override
  String get incomeTooltip => 'आय विवरण निर्धारित करें';

  @override
  String get integrationAccessDenied => 'पहुँच रद्द कर दी गई है या क्रेडेंशियल गलत हैं';

  @override
  String get integrationConnect => 'कनेक्ट करें';

  @override
  String get integrationDateFrom => 'इस तारीख से लेनदेन आयात करें';

  @override
  String get integrationDefaultBudgetCategory => 'डिफ़ॉल्ट बजट श्रेणी';

  @override
  String get integrationDisconnect => 'डिस्कनेक्ट करें';

  @override
  String get integrationForget => 'पहुँच भूल जाएँ';

  @override
  String get integrationHeadline => 'एकीकरण';

  @override
  String integrationHttpError(Object value) {
    return 'सेवा ने त्रुटि के साथ उत्तर दिया (HTTP $value)';
  }

  @override
  String get integrationHttpsRequired => 'केवल सुरक्षित (HTTPS) पतों की अनुमति है';

  @override
  String get integrationImport => 'लेनदेन आयात करें';

  @override
  String integrationImported(Object added, Object pending, Object skipped) {
    return 'आयात किए गए: $added, पहले से मौजूद होने के कारण छोड़े गए: $skipped, लंबित (आयात नहीं किए गए): $pending';
  }

  @override
  String integrationInvalidAmount(Object value) {
    return 'अमान्य राशि: $value';
  }

  @override
  String get integrationNoAccounts => 'बैंक ने कोई खाता प्रदान नहीं किया';

  @override
  String get integrationPaymentRequired => 'सेवा पहुँच के लिए भुगतान माँगती है';

  @override
  String get integrationSelectTarget => 'आयात के लिए खाता और बजट श्रेणी चुनें';

  @override
  String integrationServiceError(Object value) {
    return 'सेवा का संदेश: $value';
  }

  @override
  String get integrationUnexpectedResponse => 'सेवा से अप्रत्याशित उत्तर';

  @override
  String get invoiceHeadline => 'चालान';

  @override
  String invoiceSum(Object value) {
    return 'चालान: $value';
  }

  @override
  String get isCleaned => 'मौजूदा डेटा हटाएं';

  @override
  String get isCreated => 'पहले ही बनाया जा चुका है, अगले चरणों का पालन करें!';

  @override
  String get isEncrypted => 'फ़ाइल एन्क्रिप्टेड है (डिफ़ॉल्ट रूप से)';

  @override
  String get isRequired => 'आवश्यक';

  @override
  String get language => 'भाषा';

  @override
  String get left => 'बाएं';

  @override
  String get lightMode => 'रोशनी';

  @override
  String get link => 'यूनिफ़ॉर्म रिसोर्स लोकेटर (यूआरएल)';

  @override
  String get managerHeadline => 'प्रबंधक';

  @override
  String get meaning => 'अर्थ';

  @override
  String get metricsHeadline => 'मेट्रिक्स';

  @override
  String get metricsTooltip => 'मेट्रिक्स';

  @override
  String get milestones => 'मील के पत्थर';

  @override
  String get minute => 'मिनट';

  @override
  String get missingContent => 'फ़ाइल संसाधित नहीं की जा सकती (या तो रद्द की गई)';

  @override
  String get monobankCreateAccount => 'खाता बनाएँ';

  @override
  String get monobankDescription =>
      'व्यक्तिगत टोकन के साथ monobank कार्डों और जार (बचत गुल्लक) के शेष और लेन-देन का आयात। monobank प्रति मिनट एक अनुरोध की अनुमति देता है: लंबी अवधि के आयात में कई मिनट लगते हैं। केवल पढ़ने की पहुँच: कोई भुगतान नहीं किया जाता।';

  @override
  String get monobankHeadline => 'monobank Personal API (यूक्रेन)';

  @override
  String get monobankJar => 'जार';

  @override
  String monobankProgress(Object done, Object total) {
    return 'विवरण का अनुरोध: $total में से $done';
  }

  @override
  String monobankRateLimit(Object value) {
    return 'monobank प्रति मिनट एक अनुरोध की अनुमति देता है: अगला $value सेकंड में';
  }

  @override
  String get monobankToken => 'व्यक्तिगत टोकन';

  @override
  String get monobankTokenSteps =>
      'व्यक्तिगत टोकन कैसे प्राप्त करें:\n1. ब्राउज़र में api.monobank.ua खोलें\n2. monobank ऐप से QR कोड स्कैन करें और पहुँच की पुष्टि करें\n3. पृष्ठ से टोकन कॉपी करें\n4. इसे नीचे चिपकाएँ और \"कनेक्ट करें\" दबाएँ\n5. प्रत्येक कार्ड या जार को किसी खाते से जोड़ें (या नया बनाएँ) और आयात करें';

  @override
  String get monobankTokenTooltip =>
      'monobank ऐप में QR कोड स्कैन करने के बाद api.monobank.ua पर जारी किया जाता है; एन्क्रिप्टेड रूप में संग्रहीत';

  @override
  String get navigationTooltip => 'मुख्य मेनू खोलें';

  @override
  String netProfit(Object value) {
    return 'लाभ: $value';
  }

  @override
  String get noChartData => 'दिखाने के लिए डेटा गायब है (या पर्याप्त नहीं है)।';

  @override
  String get notificationAccessSettings => 'सूचना एक्सेस';

  @override
  String get notificationAccessSteps =>
      'एक्सेस कैसे दें:\n1. सिस्टम सेटिंग्स खोलने के लिए \"एक्सेस दें\" दबाएँ\n2. Fingrom को सूचनाएँ पढ़ने की अनुमति दें\n3. यदि Android प्रतिबंधित सेटिंग बताता है: Fingrom की ऐप जानकारी → ⋮ → \"प्रतिबंधित सेटिंग्स की अनुमति दें\" खोलें और फिर से प्रयास करें\n4. Fingrom पर लौटें और वे ऐप्स चुनें जिनकी सूचनाएँ पढ़ी जाएँगी';

  @override
  String get notificationAccounts => 'खाता कीवर्ड';

  @override
  String get notificationAccountsTooltip =>
      'सूचना में खाते की पहचान करने वाले शब्द (कार्ड के अंतिम अंक, वॉलेट का नाम): शब्द लिखें और जोड़ने के लिए Enter दबाएँ। अन्यथा ऐप का डिफ़ॉल्ट खाता उपयोग होता है';

  @override
  String get notificationApps => 'ऐप्स जिनकी सूचनाएँ पढ़ी जाती हैं';

  @override
  String notificationAutoImported(Object value) {
    return 'सूचनाओं से जोड़े गए: $value';
  }

  @override
  String get notificationAutoTooltip =>
      'पहचानी गई सूचनाएँ बिना पुष्टि के जोड़ी जाती हैं: Fingrom चलते समय तुरंत, अन्यथा अगली बार खोलने पर। न पहचानी गई सूचनाएँ समीक्षा की प्रतीक्षा करती हैं';

  @override
  String get notificationBalance => 'शेष राशि कीवर्ड';

  @override
  String get notificationBalanceTooltip =>
      'अनदेखी की जाने वाली राशि (शेष, सीमा) से पहले आने वाले शब्द: शब्द लिखें और जोड़ने के लिए Enter दबाएँ';

  @override
  String notificationCaptured(Object value) {
    return 'प्राप्त सूचनाएँ: $value';
  }

  @override
  String get notificationClear => 'प्राप्त सूचनाएँ साफ़ करें';

  @override
  String get notificationCurrencyTooltip => 'बिना मुद्रा वाली राशियाँ (जैसे डेबिट 20.00) इस मुद्रा में ली जाती हैं';

  @override
  String get notificationDefaultAccount => 'डिफ़ॉल्ट खाता';

  @override
  String get notificationDescription =>
      'इस डिवाइस पर बैंकिंग और भुगतान ऐप्स की सूचनाओं से लेनदेन बनाएँ। केवल चुने गए ऐप्स की सूचनाएँ पढ़ी जाती हैं, और वे आयात होने तक डिवाइस पर ही रहती हैं। राशि और मुद्रा स्वचालित रूप से पहचानी जाती हैं।';

  @override
  String get notificationGrant => 'एक्सेस दें';

  @override
  String get notificationIncome => 'आय कीवर्ड';

  @override
  String get notificationIncomeTooltip =>
      'सूचना को आय के रूप में चिह्नित करने वाले शब्द: शब्द लिखें और जोड़ने के लिए Enter दबाएँ';

  @override
  String get notificationNoApps => 'अभी तक कोई सूचना प्राप्त नहीं हुई: ऐप्स सूचना भेजने के बाद यहाँ दिखाई देंगे';

  @override
  String get notificationUnparsed => 'पहचाना नहीं गया';

  @override
  String get notifyHeadline => 'सूचनाएं पार्सर';

  @override
  String get ok => 'ठीक है';

  @override
  String get orderPin => 'प्राथमिकता क्रम';

  @override
  String get orderUnpin => 'सामान्यीकृत आदेश';

  @override
  String get outputFile => 'फ़ाइल के लिए गंतव्य';

  @override
  String get parseFile => 'फ़ाइल पार्स करें';

  @override
  String get password => 'पासवर्ड';

  @override
  String get path => 'फ़ाइल नाम (सेव करने या लोड करने के लिए)';

  @override
  String get paymentType => 'भुगतान अंतराल';

  @override
  String get paymentsHeadline => 'आवर्ती भुगतान';

  @override
  String get pearDisabled => '-- अक्षम --';

  @override
  String get pearLoading => 'प्रगति पर है...';

  @override
  String get peerAccept => 'स्वीकार करना';

  @override
  String get peerAction => 'कार्रवाई';

  @override
  String get peerClosed => 'समाप्त';

  @override
  String get peerConnect => 'डिवाइस कनेक्ट करें';

  @override
  String get peerConnectBtn => 'जोड़ना';

  @override
  String get peerDelete => 'मिटाना';

  @override
  String get peerDevice => 'जुड़ी हुई डिवाइसेज';

  @override
  String get peerId => 'कनेक्शन के लिए आपका डिवाइस पहचानकर्ता';

  @override
  String get peerOffline => 'ऑफलाइन';

  @override
  String get peerOnline => 'जुड़े हुए';

  @override
  String get peerOtherId => 'कनेक्शन के लिए डिवाइस पहचानकर्ता';

  @override
  String get peerPending => 'लंबित';

  @override
  String get peerPing => 'गुनगुनाहट';

  @override
  String get peerSent => 'डेटा को कनेक्टेड डिवाइसेस में स्थानांतरित किया जाता है';

  @override
  String get peerStatus => 'स्थिति';

  @override
  String get peerSync => 'स्थानांतरण डेटा';

  @override
  String pickFile(Object value) {
    return '.$value-फ़ाइल चुनें';
  }

  @override
  String pongStatus(Object uuid) {
    return '$uuid से अनुरोध लिया गया';
  }

  @override
  String get privatBankAdd => 'खाता जोड़ें';

  @override
  String get privatBankDescription =>
      'Autoclient टोकन के साथ Privat24 for Business के व्यावसायिक खातों (एकल स्वामित्व और कंपनियों) के बैलेंस और लेनदेन आयात करें। व्यक्तिगत खाते API द्वारा समर्थित नहीं हैं। पहुँच केवल पढ़ने के लिए है: कोई भुगतान नहीं किया जाता।';

  @override
  String get privatBankHeadline => 'PrivatBank Autoclient (यूक्रेन)';

  @override
  String get privatBankIban => 'खाते का IBAN';

  @override
  String get privatBankIbanInvalid => 'यूक्रेनी IBAN दर्ज करें: UA के बाद 27 अंक';

  @override
  String get privatBankIbanTooltip => 'API खातों की सूची नहीं देता: खातों के IBAN एक-एक करके जोड़ें';

  @override
  String privatBankNotReady(Object value) {
    return 'PrivatBank विवरण तैयार कर रहा है (चरण $value): कुछ मिनट बाद पुनः प्रयास करें';
  }

  @override
  String get privatBankRemove => 'खाता हटाएँ';

  @override
  String get privatBankToken => 'Autoclient टोकन';

  @override
  String get privatBankTokenSteps =>
      'Autoclient टोकन कैसे प्राप्त करें:\n1. Privat24 for Business में साइन इन करें\n2. इंटीग्रेशन (Autoclient) खोलें\n3. इसे सक्रिय करें और टोकन कॉपी करें\n4. इसे नीचे चिपकाएँ और \"कनेक्ट\" दबाएँ\n5. आयात किए जाने वाले खातों के IBAN जोड़ें';

  @override
  String get privatBankTokenTooltip =>
      'Privat24 for Business में इंटीग्रेशन (Autoclient) के अंतर्गत जारी किया जाता है; एन्क्रिप्टेड रूप में संग्रहीत';

  @override
  String get processIsFinished => 'खत्म!';

  @override
  String progress(Object value) {
    return 'प्रगति: $value%';
  }

  @override
  String get raiseData => 'राशि जोड़';

  @override
  String get recoveryHeadline => 'वसूली';

  @override
  String get recoveryTooltip => 'से उबरना';

  @override
  String get releases => 'विज्ञप्ति';

  @override
  String get reset => 'रीसेट';

  @override
  String get returnBack => 'वापस लौटाएं';

  @override
  String get roadmap => 'रोडमैप';

  @override
  String get saveNotification => 'बदलाव सुरक्षित किया गया!';

  @override
  String get saveSettingsTooltip => 'बचाना';

  @override
  String get saveTooltip => 'में सुरक्षित करें';

  @override
  String search(Object value) {
    return '\'$value\' पैटर्न द्वारा दिखाएँ';
  }

  @override
  String get searchTooltip => 'खोज';

  @override
  String get secureBioNotMatch => 'प्रमाणीकरण विफल! कृपया पुनः प्रयास करें';

  @override
  String get secureBioPromptReason => 'कृपया आगे बढ़ने के लिए प्रमाणीकरण करें';

  @override
  String get secureBioPromptTitle => 'बायोमेट्रिक प्रमाणीकरण';

  @override
  String get secureOtpCode => 'एक बार के लिए पासवर्ड कोड';

  @override
  String get secureOtpCodeInvalid => 'अमान्य! कृपया एक नया कोड प्राप्त करें और इसे दर्ज करें';

  @override
  String get secureOtpDeactivated => 'पासवर्ड सुरक्षा अक्षम है';

  @override
  String get securePassword => 'पासवर्ड (रिकवरी फ्रेज़)';

  @override
  String get securePasswordEmpty => 'पासवर्ड खाली नहीं हो सकता!';

  @override
  String get securePasswordNotMatch => 'पासवर्ड मेल नहीं खाते!';

  @override
  String get securePasswordRepeat => 'पासवर्ड दोहराएं';

  @override
  String get securityHeadline => 'सुरक्षा';

  @override
  String get settingsBaseHeadline => 'मूल बातें';

  @override
  String get settingsHeadline => 'समायोजन';

  @override
  String get settingsSaved => 'सेटिंग्स सहेजी गई!';

  @override
  String get simpleFinDescription =>
      'SimpleFIN Bridge के माध्यम से अमेरिकी बैंकों और कार्ड जारीकर्ताओं से शेष राशि और लेनदेन आयात करें। पहुँच केवल पढ़ने के लिए है: कोई भुगतान नहीं किया जाता।';

  @override
  String get simpleFinHeadline => 'SimpleFIN Bridge (US)';

  @override
  String get simpleFinNoCredentials => 'SimpleFIN Bridge ने क्रेडेंशियल के बिना पहुँच पता लौटाया';

  @override
  String get simpleFinToken => 'SimpleFIN सेटअप टोकन';

  @override
  String get simpleFinTokenClaimed => 'सेटअप टोकन मौजूद नहीं है या पहले ही उपयोग किया जा चुका है';

  @override
  String get simpleFinTokenInvalid => 'अमान्य SimpleFIN सेटअप टोकन';

  @override
  String get simpleFinTokenTooltip =>
      'इस ऐप के लिए आपके SimpleFIN Bridge (जैसे bridge.simplefin.org) में बनाया जाता है; केवल एक बार उपयोग किया जा सकता है';

  @override
  String get skipFromTotals => 'कुल से बाहर रखें';

  @override
  String get skipTooltip => 'चरण छोड़ें';

  @override
  String get sortTooltip => 'आइटम्स को क्रमबद्ध करें';

  @override
  String get sortingAmountAsc => 'राशि बढ़ती हुई';

  @override
  String get sortingAmountDesc => 'राशि घटती हुई';

  @override
  String get sortingCreatedAtAsc => 'निर्मित तिथि बढ़ती हुई';

  @override
  String get sortingCreatedAtDesc => 'निर्मित तिथि घटती हुई';

  @override
  String get sortingTitleAsc => 'शीर्षक बढ़ती हुई';

  @override
  String get sortingTitleDesc => 'शीर्षक घटती हुई';

  @override
  String get sortingUpdatedAtAsc => 'अद्यतन तिथि बढ़ती हुई';

  @override
  String get sortingUpdatedAtDesc => 'अद्यतन तिथि घटती हुई';

  @override
  String get spent => 'खर्च किया';

  @override
  String get splitCancelTooltip => 'प्रति माह विभाजन रद्द करें';

  @override
  String get splitHeadline => 'बिल विभाजित करें';

  @override
  String get splitTooltip => 'प्रति माह सीमा घोषित करें';

  @override
  String get subscription =>
      'एक ओपन-सोर्स प्रोजेक्ट के रूप में, सदस्यता लेने से कोई अतिरिक्त सुविधाएँ अनलॉक नहीं होंगी। हालाँकि, यह एप्लिकेशन के निरंतर विकास और सुधार और इसकी उपलब्धता को संरक्षित करने में एक निवेश के रूप में काम करेगा।';

  @override
  String get subscriptionCoffee => 'एक कॉफ़ी खरीदें';

  @override
  String get subscriptionDinner => 'रात के खाने का इलाज करें';

  @override
  String get subscriptionDonorbox => 'डोनरबॉक्स के माध्यम से सदस्यता लें';

  @override
  String get subscriptionGithub => 'GitHub के माध्यम से सदस्यता लें';

  @override
  String get subscriptionHeadline => 'प्रायोजन';

  @override
  String get subscriptionInactive => 'क्रय सेवा अनुपलब्ध';

  @override
  String get subscriptionPatreon => 'पैट्रियन के माध्यम से सदस्यता लें';

  @override
  String get subscriptionPaypal => 'कॉफ़ी खरीदें (PayPal)';

  @override
  String get subscriptionTiny => 'एक भाग्यशाली सिक्का दें';

  @override
  String get subscriptionTooltip => 'समर्थन (प्रायोजन)';

  @override
  String get success => 'सफल हुए';

  @override
  String get summary => 'सारांश';

  @override
  String get symbol => 'प्रतीक';

  @override
  String get syncHeadline => 'डिवाइस सिंक करें';

  @override
  String get systemMode => 'प्रणाली';

  @override
  String get tapToOpen => 'खोलने के लिए नल';

  @override
  String get targetAmount => 'लक्ष्य राशि';

  @override
  String get termPrivacy => 'गोपनीयता नीति';

  @override
  String get termUse => 'उपयोग की शर्तें';

  @override
  String get title => 'शीर्षक';

  @override
  String get titleAccountTooltip => 'खाता पहचानकर्ता दर्ज करें';

  @override
  String get titleBudgetTooltip => 'बजट श्रेणी का नाम दर्ज करें';

  @override
  String get titleGoal => 'लक्ष्य';

  @override
  String get titleGoalTooltip => 'लक्ष्य विवरण परिभाषित करें';

  @override
  String get to => 'को';

  @override
  String get total => 'कुल';

  @override
  String get transactionFile => 'फ़िंगरॉम लेनदेन लॉग फ़ाइल (.log)';

  @override
  String get transferHeadline => 'स्थानांतरण';

  @override
  String get transferTooltip => 'स्थानांतरण विवरण सेट करें';

  @override
  String get transfersHeadline => 'स्थानांतरण';

  @override
  String get typeButton => 'बटन';

  @override
  String get updateAccountTooltip => 'खाता अद्यतन करें';

  @override
  String get updateBillTooltip => 'बिल अद्यतन करें';

  @override
  String get updateBudgetTooltip => 'बजट श्रेणी अद्यतन करें';

  @override
  String get updateGoalTooltip => 'लक्ष्य अद्यतन करें';

  @override
  String get updatePaymentTooltip => 'भुगतान अपडेट करें';

  @override
  String get username => 'उपयोगकर्ता नाम (खाता)';

  @override
  String get uuid => 'अद्वितीय लेनदेन पहचानकर्ता';

  @override
  String get validTillDate => 'तक मान्य';

  @override
  String get webDav => 'वेब वितरित संलेखन और संस्करण (वेबडाव)';

  @override
  String get wiseDescription =>
      'व्यक्तिगत API टोकन से Wise मल्टी-करेंसी खातों के बैलेंस और लेन-देन इम्पोर्ट करें। लिंक किए गए बैलेंस के बीच रूपांतरण ट्रांसफर के रूप में इम्पोर्ट होते हैं। एक्सेस केवल पढ़ने के लिए है: कोई भुगतान नहीं किया जाता।';

  @override
  String get wiseHeadline => 'Wise API (Global)';

  @override
  String get wiseNoProfiles => 'इस टोकन के लिए कोई Wise प्रोफ़ाइल उपलब्ध नहीं है';

  @override
  String get wiseProfile => 'प्रोफ़ाइल';

  @override
  String get wiseScaRequired =>
      'Wise को मज़बूत ग्राहक प्रमाणीकरण चाहिए: Wise ऐप में इस बैलेंस का स्टेटमेंट खोलें, फिर पुनः प्रयास करें';

  @override
  String get wiseToken => 'व्यक्तिगत API टोकन';

  @override
  String get wiseTokenSteps =>
      'व्यक्तिगत API टोकन कैसे प्राप्त करें:\n1. ब्राउज़र में wise.com पर साइन इन करें (मोबाइल ऐप में टोकन नहीं बनाए जा सकते)\n2. सेटिंग्स → इंटीग्रेशन और टूल्स → API टोकन खोलें\n3. \"नया टोकन जोड़ें\" चुनें, नाम दें (जैसे Fingrom) और \"केवल पढ़ने\" वाली पहुँच चुनें\n4. दो-चरणीय सत्यापन से पुष्टि करें और टोकन कॉपी करें\n5. इसे नीचे चिपकाएँ और \"कनेक्ट\" दबाएँ';

  @override
  String get wiseTokenTooltip =>
      'Wise में सेटिंग्स → API टोकन में बनाया जाता है (उपलब्ध हो तो केवल पढ़ने वाला); एन्क्रिप्ट करके संग्रहीत';

  @override
  String get zoomState => 'ज़ूम इन ज़ूम आउट';
}
