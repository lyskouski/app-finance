// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Azerbaijani (`az`).
class AppLocalizationsAz extends AppLocalizations {
  AppLocalizationsAz([String locale = 'az']) : super(locale);

  @override
  String get a =>
      'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => 'Haqqında';

  @override
  String get account => 'Hesab';

  @override
  String get accountFrom => 'Hesabdan';

  @override
  String get accountHeadline => 'Hesablar';

  @override
  String get accountTo => 'Hesabına';

  @override
  String get accountTooltip => 'Hesabları açın';

  @override
  String get accountType => 'Hesab növü';

  @override
  String get accountTypeTooltip => 'Hesab növü seçin';

  @override
  String get acknowledgeTooltip => 'etiraf et';

  @override
  String get activate => 'Aktivləşdirin';

  @override
  String get actualData => 'Tarixi məlumatlar';

  @override
  String get addAccountTooltip => 'Hesab əlavə edin';

  @override
  String get addBudgetTooltip => 'Yeni Büdcə Kateqoriyası əlavə edin';

  @override
  String get addGoalTooltip => 'Yeni Məqsəd əlavə edin';

  @override
  String get addMainTooltip => 'Fatural, gəlir və ya köçürmə əlavə edin';

  @override
  String afterNDays(Object value) {
    return '$value gündən sonra';
  }

  @override
  String get akahuAppToken => 'App ID tokeni';

  @override
  String get akahuDescription =>
      'Akahu-ya qoşulmuş Yeni Zelandiya banklarının qalıqlarını və əməliyyatlarını öz pulsuz şəxsi tətbiqinizlə idxal edin. Akahu bankların məlumatlarını öz qrafiki ilə (gündəlik) yeniləyir, buna görə son əməliyyatlar daha gec görünə bilər. Giriş yalnız oxumaq üçündür: ödənişlər edilmir.';

  @override
  String get akahuHeadline => 'Akahu Personal App (Yeni Zelandiya)';

  @override
  String get akahuInactive =>
      'Akahu bu hesaba girişi itirib: onu my.akahu.nz/connections ünvanında yenidən qoşun';

  @override
  String get akahuIncomplete =>
      'App ID tokenini və istifadəçi giriş tokenini doldurun';

  @override
  String get akahuRefresh => 'Məlumatları yenilə';

  @override
  String get akahuRefreshed =>
      'Akahu-dan banklardan yeni məlumatları alması xahiş olunub: bir neçə dəqiqədən sonra idxalı təkrarlayın (saatda ən çoxu bir dəfə)';

  @override
  String get akahuSteps =>
      'Tokenləri necə əldə etmək olar:\n1. my.akahu.nz saytında qeydiyyatdan keçin və banklarınızı qoşun\n2. \"Developers\" səhifəsini açın, tərtibatçı şərtlərini qəbul edin və çoxfaktorlu autentifikasiyanı qurun\n3. App ID tokenini və istifadəçi giriş tokenini kopyalayın\n4. Onları aşağıya yapışdırın və \"Qoşul\" düyməsini basın';

  @override
  String get akahuTokenTooltip =>
      'my.akahu.nz saytının \"Developers\" səhifəsində göstərilir; şifrələnmiş saxlanılır';

  @override
  String get akahuUserToken => 'İstifadəçi giriş tokeni';

  @override
  String get amountFrom => 'Məbləğdən';

  @override
  String get amountTo => 'Məbləğə';

  @override
  String appBuild(Object build) {
    return 'Qurmaq: $build';
  }

  @override
  String get appInitHeadline => 'Layihənin Başlanması';

  @override
  String get appStartHeadline => 'İlkin Quraşdırma';

  @override
  String get appTitle => 'Fingrom';

  @override
  String appVersion(Object version) {
    return 'Versiya: $version';
  }

  @override
  String get automationHeadline => 'Avtomatlaşdırma';

  @override
  String get automationTypeDays => 'bir neçə gündən sonra';

  @override
  String get backTooltip => 'Geri qayıt';

  @override
  String get balance => 'Faktiki Balans';

  @override
  String get balanceDate => 'Balans Tarixi Yeniləmə';

  @override
  String get balanceDateTooltip =>
      'Bu tarixdən əvvəlki nəticələr və Gəlirlər balansa təsir etməyəcək';

  @override
  String get balanceTooltip => 'Balansı təyin edin';

  @override
  String get bankAccount => 'Bank hesabı';

  @override
  String get bill => 'Fatural';

  @override
  String get billHeadline => 'Faturalar';

  @override
  String get billSetTooltip => 'Məbləği təyin edin';

  @override
  String billSum(Object value) {
    return 'Hesablar: $value';
  }

  @override
  String get billTooltip => 'Hesabları açın';

  @override
  String get billTypeTooltip => '[Növ] Bill, Gəlir və ya Transfer';

  @override
  String get brightnessTheme => 'Parlaqlıq mövzusu';

  @override
  String get btnAdd => 'əlavə et';

  @override
  String get btnCancel => 'Ləğv et';

  @override
  String get btnConfirm => 'Təsdiq edin';

  @override
  String get btnMore => 'Daha çox';

  @override
  String get budget => 'Büdcə kateqoriyası';

  @override
  String get budgetHeadline => 'Büdcələr';

  @override
  String get budgetLimit => 'Aylıq limit';

  @override
  String get budgetLimitHeadline => 'Limit Tənzimləmələri';

  @override
  String get budgetPositive => 'Büdcə, Xülasə emalçısı';

  @override
  String get budgetPositiveOff => 'Mənfi dəyərləri nəzərə alma';

  @override
  String get budgetPositiveOn => 'Mənfi dəyərləri daxil et';

  @override
  String get budgetRelativeLimit => 'Ayda nisbi əmsal';

  @override
  String get budgetTooltip => 'Büdcə növlərini açın';

  @override
  String get budgetType => 'Büdcələmə intervalı';

  @override
  String get budgetTypeAsIs => 'Limitsiz';

  @override
  String get budgetTypeFixed => 'Düzəldi';

  @override
  String get budgetTypeMonth => 'aylıq';

  @override
  String get budgetTypeRelative => 'Qohum';

  @override
  String get budgetTypeWeek => 'həftəlik';

  @override
  String get budgetTypeYear => 'illik';

  @override
  String get cash => 'Nağd pul';

  @override
  String get chartBarRace => 'Kateqoriyalar üçün Bar Yarışı';

  @override
  String get chartForecast => 'Proqnoz Diaqramı';

  @override
  String get chartOHLC => 'Şamdan (OHLC) Diaqramı';

  @override
  String get chartYtdExpense => 'YTD Xərcləri';

  @override
  String get clear => 'Dəyəri Düşür';

  @override
  String get closeTooltip => 'Yaxın';

  @override
  String get closedAt => 'Tarixə qədər bitdi';

  @override
  String get cmpChart => 'Diaqramlar';

  @override
  String get cmpRecent => 'Son Elementlər';

  @override
  String get cmpRecentCount => 'Siyahı Ölçüsü';

  @override
  String get coAuthor => 'müəllif';

  @override
  String get coConsult => 'məsləhətçi';

  @override
  String get coDeveloper => 'inkişaf etdirici';

  @override
  String get coNew => 'Qoşulun';

  @override
  String get coPromoter => 'təşviqatçı';

  @override
  String get coTranslator => 'tərcüməçi';

  @override
  String get coef => 'coef.';

  @override
  String get collapse => 'Bölməni yığcamlaşdırın (bərpa edin).';

  @override
  String get color => 'Rəng';

  @override
  String get colorApp => 'Xüsusi';

  @override
  String get colorBackground => 'Background';

  @override
  String get colorDark => 'Qaranlıq';

  @override
  String get colorInversePrimary => 'Tərs İlkin';

  @override
  String get colorInverseSurface => 'Tərs səth';

  @override
  String get colorLight => 'İşıq';

  @override
  String get colorOnInverseSurface => 'Tərs Səthdə';

  @override
  String get colorOnSecondary => 'Orta ixtisas üzrə';

  @override
  String get colorOnSecondaryContainer => 'Konteynerdə';

  @override
  String get colorPrimary => 'İlkin';

  @override
  String get colorRestore => 'Palitranı sıfırlayın';

  @override
  String get colorSecondary => 'İkinci dərəcəli';

  @override
  String get colorSystem => 'Defolt';

  @override
  String get colorTheme => 'Palette';

  @override
  String get colorTooltip => 'Rəng seçin';

  @override
  String get colorType => 'Rəng növü';

  @override
  String get colorUser => 'Şəxsi';

  @override
  String columnMap(Object value) {
    return '\'$value\' Sütunu üçün Xəritəçəkmə';
  }

  @override
  String columnMapTooltip(Object value) {
    return '\'$value\' - Sütun Xəritəçəkməsini seçin';
  }

  @override
  String get completeGoalTooltip => 'Tam Məqsəd';

  @override
  String get confirmHeader => 'Fəaliyyəti təsdiqləyin';

  @override
  String get confirmTooltip =>
      'Sən əminsən? Bu əməliyyat geri qaytarıla bilməz.';

  @override
  String get contributors => 'Töhfəçilər';

  @override
  String get conversion => 'Dönüşüm';

  @override
  String conversionMessage(Object currency) {
    return '$currency ilə çəkilib';
  }

  @override
  String get copiedToClipboard => 'Buferə kopyalandı';

  @override
  String get createAccountHeader => 'Yeni hesab yaratmaq';

  @override
  String get createAccountTooltip => 'Yeni hesab yaratmaq';

  @override
  String get createBillHeader => 'Yeni Əməliyyat yaradın';

  @override
  String get createBillTooltip => 'Yeni qanun layihəsi əlavə edin';

  @override
  String get createBudgetHeader => 'Yeni Büdcə Kateqoriyası';

  @override
  String get createBudgetTooltip => 'Yeni Büdcə Kateqoriyasını yaradın';

  @override
  String get createGoalHeader => 'Məqsəd Yaradın';

  @override
  String get createGoalTooltip => 'Yeni Məqsəd əlavə edin';

  @override
  String get createIncomeTooltip => 'Yeni gəlir əlavə edin';

  @override
  String get createPaymentTooltip => 'Yeni Ödəniş əlavə edin';

  @override
  String get createTransferTooltip => 'Transfer yaradın';

  @override
  String get credit => 'Credit';

  @override
  String get creditCard => 'Kredit kartı';

  @override
  String get currency => 'Currency';

  @override
  String get currencyAddHeadline => 'Valyuta mübadiləsi';

  @override
  String get currencyAddTooltip => 'Valyuta məzənnəsini əlavə edin';

  @override
  String get currencyDefault => 'Defolt Valyuta';

  @override
  String get currencyDistribution => 'Paylanma';

  @override
  String currencyExchange(Object from, Object to) {
    return 'Valyuta mübadiləsi: $from -> $to';
  }

  @override
  String get currencyHeadline => 'Currencies';

  @override
  String currencyIn(Object value) {
    return '$value ilə';
  }

  @override
  String get currencyShort => 'Curr.';

  @override
  String get currencyTooltip => 'Valyuta Növü (Kod)';

  @override
  String get currencyUpdateTooltip => 'Valyuta məzənnəsini yeniləyin';

  @override
  String get currentDate => 'Cari tarix göstəricisi';

  @override
  String get customAddTooltip => 'Vidcet əlavə edin';

  @override
  String get customDeleteTooltip => 'Fərdiləşdirməni silin';

  @override
  String get customSaveTooltip => 'Fərdiləşdirməni saxla';

  @override
  String get customizeTooltip => 'Səhifəni fərdiləşdirin';

  @override
  String get darkMode => 'Qaranlıq';

  @override
  String get dateFormat => 'Tarix formatı';

  @override
  String get dateRange => 'Tarix Aralığı';

  @override
  String get dateTooltip => 'Tarixi seçin';

  @override
  String get dayMonday => 'bazar ertəsi';

  @override
  String get daySaturday => 'Şənbə';

  @override
  String get dayStartOfMonth => 'Ayın başlanğıcı';

  @override
  String get dayStartOfWeek => 'Həftənin başlanğıcı';

  @override
  String get daySunday => 'bazar günü';

  @override
  String get deactivateAction => 'Şifrə qorunmasını deaktiv edin';

  @override
  String get debitCard => 'Debet kartı';

  @override
  String def(Object value) {
    return '\'$value\' üçün Defolt Dəyər';
  }

  @override
  String get deleteAccountTooltip => 'hesabı ləğv etmək';

  @override
  String get deleteBillTooltip => 'Bill silin';

  @override
  String get deleteBudgetTooltip => 'Büdcə Kateqoriyasını deaktiv edin';

  @override
  String get deleteGoalTooltip => 'Məqsədi silin';

  @override
  String get deleteInvoiceTooltip => 'Fakturanı silin';

  @override
  String get deletePaymentTooltip => 'Ödənişi silin';

  @override
  String get deleteTooltip => 'Sil';

  @override
  String get deleteTransferTooltip => 'Transferi silin';

  @override
  String get deposit => 'Deposit';

  @override
  String get description => 'Təsvir';

  @override
  String get descriptionTooltip => 'Xərc təfərrüatlarını təyin edin';

  @override
  String get design => 'Dizayn Rejimi (Mədəniyyət Xüsusi)';

  @override
  String get designAsiaGeneral => 'Asiya Generalı';

  @override
  String get designGermany => 'Almaniya';

  @override
  String get designGlobal => 'Qlobal';

  @override
  String get designRtlGeneral => 'Sağdan Sola Yazı';

  @override
  String get details => 'Təfərrüatlar';

  @override
  String get detailsTooltip => '****2345 - nömrənin son 4 rəqəmi';

  @override
  String get dtAm => 'am';

  @override
  String get dtAmPm => 'səhər/pm (0~11)';

  @override
  String get dtDay => 'ayda gün';

  @override
  String get dtEscape => 'mətn üçün qaçış';

  @override
  String get dtHalfHour => 'səhər saatlarında (1-12)';

  @override
  String get dtHour => 'gündə saat (0~23)';

  @override
  String get dtMinute => 'saatda dəqiqə';

  @override
  String get dtMonth => 'ilin ayı';

  @override
  String get dtNamedDay => 'həftənin günü';

  @override
  String get dtPm => 'axşam';

  @override
  String get dtQuote => 'tək sitat';

  @override
  String get dtSecond => 'dəqiqədə ikinci';

  @override
  String get dtYear => 'il';

  @override
  String get editAccountHeader => 'Hesabı yeniləyin';

  @override
  String get editAccountTooltip => 'Hesabı redaktə edin';

  @override
  String get editBillHeader => 'Billi yeniləyin';

  @override
  String get editBillTooltip => 'Bill redaktə edin';

  @override
  String get editBudgetHeader => 'Büdcə Kateqoriyasını yeniləyin';

  @override
  String get editBudgetTooltip => 'Büdcə Kateqoriyasına düzəliş edin';

  @override
  String get editGoalHeader => 'Məqsədi yeniləyin';

  @override
  String get editGoalTooltip => 'Məqsədi redaktə edin';

  @override
  String get editInvoiceTooltip => 'Fakturaya düzəliş edin';

  @override
  String get editPaymentTooltip => 'Ödənişi redaktə edin';

  @override
  String get editTooltip => 'Redaktə et';

  @override
  String get editTransferTooltip => 'Transferi redaktə edin';

  @override
  String get enableBankingAppId => 'Tətbiq ID-si';

  @override
  String get enableBankingBank => 'Bank';

  @override
  String get enableBankingCode =>
      'Avtorizasiyadan sonra açılan səhifənin ünvanı';

  @override
  String get enableBankingCodeTooltip =>
      'Bankda girişi təsdiqləyin, sonra ünvanı brauzerdən kopyalayıb bura yapışdırın';

  @override
  String get enableBankingCountry => 'Ölkə (ISO kodu, məs. DE)';

  @override
  String get enableBankingDescription =>
      'enablebanking.com-da qeydiyyatdan keçmiş öz tətbiqinizlə Enable Banking API (PSD2) vasitəsilə Avropa banklarının qalıqlarını və əməliyyatlarını idxal edin. Giriş yalnız oxumaq üçündür: ödənişlər edilmir.';

  @override
  String get enableBankingHeadline => 'Enable Banking (EU)';

  @override
  String get enableBankingIncomplete =>
      'Tətbiq ID-sini, şəxsi açarı, yönləndirmə URL-ni və ölkəni doldurun';

  @override
  String get enableBankingKey => 'Şəxsi açar (PEM)';

  @override
  String get enableBankingKeyInvalid =>
      'Yanlış şəxsi açar: \"PRIVATE KEY\" PEM bloku gözlənilir';

  @override
  String get enableBankingKeyNotRsa =>
      'Yanlış şəxsi açar: RSA açarı gözlənilir';

  @override
  String get enableBankingKeyTooltip =>
      'Enable Banking Control Panel-də tətbiqlə birlikdə yaradılır; şifrələnmiş saxlanılır. Saxlanılmış açarı saxlamaq üçün boş buraxın';

  @override
  String get enableBankingLoadBanks => 'Bankları yüklə';

  @override
  String get enableBankingNoAuthPage =>
      'Enable Banking avtorizasiya səhifəsi qaytarmadı';

  @override
  String get enableBankingNoCode => 'Ünvanda avtorizasiya kodu tapılmadı';

  @override
  String get enableBankingRedirect => 'Yönləndirmə URL-i';

  @override
  String get enableBankingRedirectTooltip =>
      'Tətbiq üçün qeydiyyatdan keçib; bank avtorizasiyadan sonra ona qayıdır';

  @override
  String get enableBankingStateMismatch =>
      'Ünvan başqa avtorizasiyaya aiddir, yenidən qoşulun';

  @override
  String get encryptionMode => 'Məlumatların Şifrələnməsi';

  @override
  String error(Object value) {
    return 'Xəta: $value';
  }

  @override
  String get errorExpired => 'Kartın müddəti bitdi';

  @override
  String get errorNegative =>
      'Mənfi ola bilməz! Zəhmət olmasa, xətanı düzəldin';

  @override
  String get example => 'Misal';

  @override
  String get expand => 'Bölməni genişləndirin';

  @override
  String get expense => 'Xərclərin məbləği';

  @override
  String get expenseDateTime => 'Billed At';

  @override
  String get expenseHeadline => 'Xərc';

  @override
  String get expenseTransfer => 'Köçürmə məbləği';

  @override
  String exportFile(Object value) {
    return '.$value-fayl kimi ixrac edin';
  }

  @override
  String get failData => 'Məbləğin tutulması';

  @override
  String get finTsApproved => 'Bank tətbiqində təsdiqləndi';

  @override
  String get finTsBankCode => 'Bank kodu (BLZ)';

  @override
  String get finTsCustomerId =>
      'Müştəri ID-si (istifadəçi ID-sindən fərqlidirsə)';

  @override
  String get finTsDescription =>
      'FinTS 4.1 (PIN/TAN) dəstəkləyən banklardan qalıqları və əməliyyatları idxal edin. Giriş yalnız oxumaq üçündür: ödənişlər edilmir.';

  @override
  String get finTsHeadline => 'Financial Transaction Services (FinTS 4.1)';

  @override
  String get finTsIncomplete =>
      'Server URL-ni, bank kodunu, istifadəçi ID-sini və məhsulun qeydiyyat nömrəsini doldurun';

  @override
  String finTsLoginChanged(Object value) {
    return 'Bank giriş məlumatlarını dəyişdi, istifadəçi və ya müştəri ID-sini yeniləyin: $value';
  }

  @override
  String finTsLoginRefused(Object value) {
    return 'Bank əvvəlki girişi rədd etdi: $value. Daxil edilmiş PIN ilə yenidən cəhd edilsin?';
  }

  @override
  String get finTsPin => 'PIN';

  @override
  String get finTsPinHint =>
      'Yalnız bu sessiya üçün istifadə olunur və heç vaxt saxlanılmır';

  @override
  String get finTsProductId => 'Məhsulun qeydiyyat nömrəsi';

  @override
  String get finTsProductIdTooltip =>
      'Deutsche Kreditwirtschaft tərəfindən tətbiqin istehsalçısına verilir';

  @override
  String get finTsTan => 'TAN';

  @override
  String get finTsTanHeadline => 'Əməliyyatın təsdiqi (TAN)';

  @override
  String get finTsTanMedium => 'TAN vasitəsini seçin';

  @override
  String get finTsTanMethod => 'TAN üsulunu seçin';

  @override
  String get finTsUrl => 'Bankın FinTS server URL-i';

  @override
  String get finTsUserId => 'İstifadəçi ID-si (giriş)';

  @override
  String get finTsVersion => 'Protokol versiyası';

  @override
  String get finTsWebUnsupported =>
      'Bank serverləri brauzerdən girişə icazə vermir. Masaüstü və ya mobil tətbiqdən istifadə edin.';

  @override
  String get flowTypeInvoice => 'Invoice';

  @override
  String get flowTypeTooltip => 'Məbləğ növü: faktura, faktura';

  @override
  String get forecastData => 'Proqnoz';

  @override
  String get from => '-dən';

  @override
  String get goNextTooltip => 'Sonrakı';

  @override
  String get goalHeadline => 'Məqsədlər';

  @override
  String goalProfit(Object value) {
    return 'Hədəflər Hədəf: $value';
  }

  @override
  String get goalProfitTooltip => 'Mənfəət və Məqsəd Hədəfi';

  @override
  String get goalTooltip => 'Açıq Məqsədlər';

  @override
  String get hasEncrypted => 'Quraşdırıldıqdan sonra dəyişdirilə bilməz';

  @override
  String get helpTooltip => '[Kömək] Həmin Səhifənin Təsvirini Göstərin';

  @override
  String get homeHeadline => 'Ev';

  @override
  String get homeTooltip => 'Əsas səhifəyə qayıt';

  @override
  String get hour => 'Saat';

  @override
  String get icon => 'İkon';

  @override
  String get iconTooltip => 'İkonu seçin';

  @override
  String get ignoreTooltip => 'Məhəl qoyma';

  @override
  String get importHeadline => 'İdxal / İxrac';

  @override
  String get income => 'Gəlir məbləği';

  @override
  String get incomeHeadline => 'Gəlir';

  @override
  String get incomeHealth => 'Gəlir Sağlamlığı Radarı';

  @override
  String get incomeTooltip => 'Gəlir təfərrüatlarını təyin edin';

  @override
  String get integrationAccessDenied =>
      'Giriş ləğv edilib və ya giriş məlumatları yanlışdır';

  @override
  String get integrationConnect => 'Qoşul';

  @override
  String get integrationDateFrom => 'Əməliyyatları bu tarixdən idxal et';

  @override
  String get integrationDefaultBudgetCategory => 'Defolt büdcə kateqoriyası';

  @override
  String get integrationDisconnect => 'Ayrıl';

  @override
  String get integrationForget => 'Girişi unut';

  @override
  String get integrationHeadline => 'İnteqrasiyalar';

  @override
  String integrationHttpError(Object value) {
    return 'Xidmət xəta ilə cavab verdi (HTTP $value)';
  }

  @override
  String get integrationHttpsRequired =>
      'Yalnız təhlükəsiz (HTTPS) ünvanlara icazə verilir';

  @override
  String get integrationImport => 'Əməliyyatları idxal et';

  @override
  String integrationImported(Object added, Object pending, Object skipped) {
    return 'İdxal edildi: $added, artıq mövcud olduğu üçün buraxıldı: $skipped, gözləmədə (idxal edilmədi): $pending';
  }

  @override
  String integrationInvalidAmount(Object value) {
    return 'Yanlış məbləğ: $value';
  }

  @override
  String get integrationNoAccounts => 'Bank heç bir hesab təqdim etmədi';

  @override
  String get integrationPaymentRequired =>
      'Xidmət giriş üçün ödəniş tələb edir';

  @override
  String get integrationSelectTarget =>
      'İdxal üçün hesabı və büdcə kateqoriyasını seçin';

  @override
  String integrationServiceError(Object value) {
    return 'Xidmətin mesajı: $value';
  }

  @override
  String get integrationUnexpectedResponse => 'Xidmətdən gözlənilməz cavab';

  @override
  String get investecApiKey => 'API açarı';

  @override
  String get investecClientId => 'Müştəri ID-si';

  @override
  String get investecCredentialsTooltip =>
      'Investec Online-da Investec Developer → API keys bölməsində yaradılır; şifrələnmiş saxlanılır';

  @override
  String get investecDescription =>
      'Öz API açarlarınızla Programmable Banking API vasitəsilə Investec Private Banking hesablarının (Cənubi Afrika) qalıqlarını və əməliyyatlarını idxal edin. Giriş yalnız oxumaq üçündür: ödənişlər edilmir.';

  @override
  String get investecHeadline =>
      'Investec Programmable Banking (Cənubi Afrika)';

  @override
  String get investecIncomplete =>
      'Müştəri ID-sini, gizli açarı və API açarını doldurun';

  @override
  String get investecSandbox => 'Sandbox (test məlumatları)';

  @override
  String get investecSecret => 'Gizli açar';

  @override
  String get investecSteps =>
      'API açarlarını necə əldə etmək olar:\n1. Investec Online-a daxil olun və Investec Developer-də (Programmable Banking) qeydiyyatdan keçin\n2. API keys bölməsini açın və hesablara və əməliyyatlara girişi olan açar yaradın\n3. İkimərhələli doğrulama ilə təsdiqləyin və müştəri ID-sini, gizli açarı və API açarını kopyalayın\n4. Onları aşağıya yapışdırın və \"Qoşul\" düyməsini basın';

  @override
  String get invoiceHeadline => 'Fakturalar';

  @override
  String invoiceSum(Object value) {
    return 'Fakturalar: $value';
  }

  @override
  String get isCleaned => 'Mövcud məlumatları silin';

  @override
  String get isCreated => 'Artıq yaradılmışdır, növbəti addımları izləyin!';

  @override
  String get isEncrypted => 'Fayl şifrələnib (defolt olaraq)';

  @override
  String get isRequired => 'tələb olunur';

  @override
  String get language => 'Dil';

  @override
  String get left => 'sol';

  @override
  String get lightMode => 'İşıq';

  @override
  String get link => 'Vahid Resurs Lokatoru (URL)';

  @override
  String get managerHeadline => 'Menecer';

  @override
  String get meaning => 'Məna';

  @override
  String get metricsHeadline => 'Metriklər';

  @override
  String get metricsTooltip => 'Metriklər';

  @override
  String get milestones => 'Mərhələlər';

  @override
  String get minute => 'Dəqiqə';

  @override
  String get missingContent => 'Fayl emal edilə bilməz (və ya ləğv edilir)';

  @override
  String get monobankCreateAccount => 'Hesab yarat';

  @override
  String get monobankDescription =>
      'Şəxsi token ilə monobank kartlarının və banklarının (yığım qutularının) qalıqlarının və əməliyyatlarının idxalı. monobank dəqiqədə bir sorğuya icazə verir: uzun dövrün idxalı bir neçə dəqiqə çəkir. Yalnız oxuma girişi: ödənişlər edilmir.';

  @override
  String get monobankHeadline => 'monobank Personal API (Ukrayna)';

  @override
  String get monobankJar => 'Yığım qutusu';

  @override
  String monobankProgress(Object done, Object total) {
    return 'Çıxarışlar sorğulanır: $done / $total';
  }

  @override
  String monobankRateLimit(Object value) {
    return 'monobank dəqiqədə bir sorğuya icazə verir: növbəti $value san sonra';
  }

  @override
  String get monobankToken => 'Şəxsi token';

  @override
  String get monobankTokenSteps =>
      'Şəxsi tokeni necə almaq olar:\n1. Brauzerdə api.monobank.ua ünvanını açın\n2. QR kodu monobank tətbiqi ilə skan edin və girişi təsdiqləyin\n3. Tokeni səhifədən kopyalayın\n4. Onu aşağıya yapışdırın və \"Qoşul\" düyməsini basın\n5. Hər kartı və ya yığım qutusunu hesaba bağlayın (və ya hesab yaradın) və idxal edin';

  @override
  String get monobankTokenTooltip =>
      'monobank tətbiqində QR kod skan edildikdən sonra api.monobank.ua-da verilir; şifrələnmiş şəkildə saxlanılır';

  @override
  String get monzoApprove =>
      'Monzo tətbiqində girişi təsdiqləyin, sonra yenidən \"Qoşul\" düyməsini basın';

  @override
  String get monzoClientId => 'Müştəri ID-si';

  @override
  String get monzoClientSecret => 'Müştəri gizli açarı';

  @override
  String get monzoClientSecretTooltip =>
      'developers.monzo.com saytında OAuth müştərisi üçün göstərilir; şifrələnmiş saxlanılır. Saxlanılmış açarı saxlamaq üçün boş buraxın';

  @override
  String get monzoCode => 'Girişdən sonra açılan səhifənin ünvanı';

  @override
  String get monzoCodeTooltip =>
      'Fingrom avtomatik açılmayıbsa, ünvanı brauzerdən kopyalayıb bura yapışdırın';

  @override
  String get monzoDescription =>
      'developers.monzo.com saytında qeydiyyatdan keçmiş öz OAuth müştərinizlə Monzo hesablarının qalıqlarını və əməliyyatlarını idxal edin (yalnız şəxsi istifadə üçün). Giriş yalnız oxumaq üçündür: ödənişlər edilmir.';

  @override
  String get monzoExpired => 'Monzo-ya girişin müddəti bitib: yenidən qoşulun';

  @override
  String monzoFullHistory(Object value) {
    return 'Tam tarixçə $value vaxtına qədər əlçatandır: daha erkən tarix seçin və indi idxal edin. Sonra Monzo yalnız son 90 günü təqdim edir';
  }

  @override
  String get monzoHeadline => 'Monzo Developer API (Birləşmiş Krallıq)';

  @override
  String monzoHistoryLimited(Object value) {
    return 'Monzo yalnız son 90 günü təqdim edir: əməliyyatlar $value tarixindən idxal olunur';
  }

  @override
  String get monzoIncomplete =>
      'Müştəri ID-sini, müştəri gizli açarını və yönləndirmə URL-ini doldurun';

  @override
  String get monzoRedirect => 'Yönləndirmə URL-i';

  @override
  String get monzoRedirectTooltip =>
      'OAuth müştərisi üçün məhz bu ünvanı təyin edin; Monzo girişdən sonra ona qayıdır';

  @override
  String get monzoSteps =>
      'Necə qoşulmaq olar:\n1. Monzo hesabınızın e-poçtu ilə developers.monzo.com saytına daxil olun\n2. Clients → New OAuth Client bölməsini açın, \"Confidential\" seçin və aşağıda göstərilən yönləndirmə URL-ini təyin edin\n3. Müştəri ID-sini və müştəri gizli açarını kopyalayın, aşağıya yapışdırın və \"Qoşul\" düyməsini basın\n4. E-poçtla göndərilən linki açın, Monzo tətbiqində girişi təsdiqləyin və yenidən \"Qoşul\" düyməsini basın\n5. Dərhal idxal edin: tam tarixçə təsdiqdən sonra yalnız 5 dəqiqə ərzində əlçatandır, sonra yalnız son 90 gün';

  @override
  String get navigationTooltip => 'Əsas menyunu açın';

  @override
  String netProfit(Object value) {
    return 'Mənfəət: $value';
  }

  @override
  String get noChartData =>
      'Göstərilmək üçün məlumat çatışmır (və ya kifayət deyil).';

  @override
  String get notificationAccessSettings => 'Bildirişlərə giriş';

  @override
  String get notificationAccessSteps =>
      'Girişi necə vermək olar:\n1. Sistem ayarlarını açmaq üçün \"Giriş ver\" düyməsini basın\n2. Fingrom-a bildirişləri oxumağa icazə verin\n3. Android məhdudlaşdırılmış ayar barədə bildirərsə: Fingrom tətbiq məlumatı → ⋮ → \"Məhdud ayarlara icazə ver\" seçin və yenidən cəhd edin\n4. Fingrom-a qayıdın və bildirişləri oxunacaq tətbiqləri seçin';

  @override
  String get notificationAccounts => 'Hesab açar sözləri';

  @override
  String get notificationAccountsTooltip =>
      'Bildirişdə hesabı müəyyən edən sözlər (kartın son rəqəmləri, pul kisəsinin adı): söz yazın və əlavə etmək üçün Enter düyməsini basın. Əks halda tətbiqin defolt hesabı istifadə olunur';

  @override
  String get notificationApps => 'Bildirişləri oxunan tətbiqlər';

  @override
  String notificationAutoImported(Object value) {
    return 'Bildirişlərdən əlavə edildi: $value';
  }

  @override
  String get notificationAutoTooltip =>
      'Tanınan bildirişlər təsdiqsiz əlavə olunur: Fingrom işləyərkən dərhal, əks halda növbəti açılışda. Tanınmayanlar yoxlamanı gözləyir';

  @override
  String get notificationBalance => 'Balans açar sözləri';

  @override
  String get notificationBalanceTooltip =>
      'Nəzərə alınmayacaq məbləğdən (balans, limit) əvvəl gələn sözlər: söz yazın və əlavə etmək üçün Enter düyməsini basın';

  @override
  String notificationCaptured(Object value) {
    return 'Tutulan bildirişlər: $value';
  }

  @override
  String get notificationClear => 'Tutulanları təmizlə';

  @override
  String get notificationCurrencyTooltip =>
      'Valyutasız məbləğlər (məs. Debit 20.00) bu valyutada götürülür';

  @override
  String get notificationDefaultAccount => 'Defolt hesab';

  @override
  String get notificationDescription =>
      'Bu cihazdakı bank və ödəniş tətbiqlərinin bildirişlərindən əməliyyatlar yaradın. Yalnız seçilmiş tətbiqlərin bildirişləri oxunur və idxal olunana qədər cihazda qalır. Məbləğ və valyuta avtomatik tanınır.';

  @override
  String get notificationGrant => 'Giriş ver';

  @override
  String get notificationIncome => 'Gəlir açar sözləri';

  @override
  String get notificationIncomeTooltip =>
      'Bildirişi gəlir kimi qeyd edən sözlər: söz yazın və əlavə etmək üçün Enter düyməsini basın';

  @override
  String get notificationMerchant => 'Satıcı etiketləri';

  @override
  String get notificationMerchantTooltip =>
      'İki nöqtə və satıcı adı ilə davam edən sözlər (Yer: Mağaza): söz yazın və əlavə etmək üçün Enter düyməsini basın';

  @override
  String get notificationNoApps =>
      'Hələ bildiriş alınmayıb: tətbiqlər bildiriş göndərdikdən sonra burada görünür';

  @override
  String get notificationUnparsed => 'Tanınmadı';

  @override
  String get notifyHeadline => 'Bildirişlər Parser';

  @override
  String get ok => 'tamam';

  @override
  String get orderPin => 'Prioritet sifariş';

  @override
  String get orderUnpin => 'Ümumiləşdirilmiş sifariş';

  @override
  String get outputFile => 'Fayl üçün təyinat';

  @override
  String get parseFile => 'Faylı təhlil edin';

  @override
  String get password => 'parol';

  @override
  String get path => 'Fayl adı (saxlamaq və ya yükləmək üçün)';

  @override
  String get paymentType => 'Ödəniş intervalı';

  @override
  String get paymentsHeadline => 'Təkrarlanan ödənişlər';

  @override
  String get pearDisabled => '-- əlil --';

  @override
  String get pearLoading => 'Davam edir...';

  @override
  String get peerAccept => 'qəbul et';

  @override
  String get peerAction => 'Fəaliyyət';

  @override
  String get peerClosed => 'dayandırıldı';

  @override
  String get peerConnect => 'Cihazı birləşdirin';

  @override
  String get peerConnectBtn => 'qoşulmaq';

  @override
  String get peerDelete => 'silin';

  @override
  String get peerDevice => 'Qoşulmuş Cihazlar';

  @override
  String get peerId => 'Qoşulma üçün Cihaz İdentifikatorunuz';

  @override
  String get peerOffline => 'offline';

  @override
  String get peerOnline => 'əlaqədar';

  @override
  String get peerOtherId => 'Qoşulma üçün Cihaz İdentifikatoru';

  @override
  String get peerPending => 'gözləyən';

  @override
  String get peerPing => 'ping';

  @override
  String get peerSent => 'Məlumatlar qoşulmuş Cihazlara ötürülür';

  @override
  String get peerStatus => 'Vəziyyət';

  @override
  String get peerSync => 'Məlumatların ötürülməsi';

  @override
  String pickFile(Object value) {
    return '.$value-faylını seçin';
  }

  @override
  String pongStatus(Object uuid) {
    return '$uuid tərəfindən sorğu götürülüb';
  }

  @override
  String get privatBankAdd => 'Hesab əlavə et';

  @override
  String get privatBankDescription =>
      'Privat24 for Business biznes hesablarının (fərdi sahibkarlar və şirkətlər) qalıqlarını və əməliyyatlarını Autoclient tokeni ilə idxal edin. Şəxsi hesablar API tərəfindən dəstəklənmir. Giriş yalnız oxumaq üçündür: ödənişlər edilmir.';

  @override
  String get privatBankHeadline => 'PrivatBank Autoclient (Ukrayna)';

  @override
  String get privatBankIban => 'Hesabın IBAN-ı';

  @override
  String get privatBankIbanInvalid =>
      'Ukrayna IBAN-ı daxil edin: UA və ardınca 27 rəqəm';

  @override
  String get privatBankIbanTooltip =>
      'API hesabların siyahısını vermir: hesabların IBAN-larını bir-bir əlavə edin';

  @override
  String privatBankNotReady(Object value) {
    return 'PrivatBank çıxarışları hazırlayır (mərhələ $value): bir neçə dəqiqədən sonra yenidən cəhd edin';
  }

  @override
  String get privatBankRemove => 'Hesabı sil';

  @override
  String get privatBankToken => 'Autoclient tokeni';

  @override
  String get privatBankTokenSteps =>
      'Autoclient tokenini necə əldə etmək olar:\n1. Privat24 for Business-ə daxil olun\n2. İnteqrasiya (Autoclient) bölməsini açın\n3. Onu aktivləşdirin və tokeni kopyalayın\n4. Aşağıya yapışdırın və \"Qoşul\" düyməsini basın\n5. İdxal ediləcək hesabların IBAN-larını əlavə edin';

  @override
  String get privatBankTokenTooltip =>
      'Privat24 for Business-də İnteqrasiya (Autoclient) bölməsində verilir; şifrələnmiş şəkildə saxlanılır';

  @override
  String get processIsFinished => 'Bitdi!';

  @override
  String progress(Object value) {
    return 'Tərəqqi: $value%';
  }

  @override
  String get raiseData => 'Məbləğə əlavə';

  @override
  String get recoveryHeadline => 'Bərpa';

  @override
  String get recoveryTooltip => 'Kimdən bərpa edin';

  @override
  String get releases => 'Buraxılışlar';

  @override
  String get reset => 'sıfırlayın';

  @override
  String get returnBack => 'Geri qayıt';

  @override
  String get roadmap => 'Yol xəritəsi';

  @override
  String get saveNotification => 'Dəyişikliklər yadda saxlanıldı!';

  @override
  String get saveSettingsTooltip => 'Yadda saxla';

  @override
  String get saveTooltip => 'Saxlamaq';

  @override
  String search(Object value) {
    return '\'$value\' Nümunəsi ilə Göstərin';
  }

  @override
  String get searchTooltip => 'Axtar';

  @override
  String get secureBioNotMatch =>
      'Təsdiqləmə uğursuz oldu! Zəhmət olmasa, yenidən cəhd edin';

  @override
  String get secureBioPromptReason =>
      'Davam etmək üçün zəhmət olmasa təsdiqlənin';

  @override
  String get secureBioPromptTitle => 'Biometrik Təsdiqləmə';

  @override
  String get secureOtpCode => 'Bir dəfəlik Şifrə Kodu';

  @override
  String get secureOtpCodeInvalid =>
      'Etkisiz! Zəhmət olmasa, yeni kod götürün və daxil edin';

  @override
  String get secureOtpDeactivated => 'Şifrə qorunması deaktiv edilib';

  @override
  String get securePassword => 'Şifrə (Bərpa ifadəsi)';

  @override
  String get securePasswordEmpty => 'Şifrə boş ola bilməz!';

  @override
  String get securePasswordNotMatch => 'Şifrələr uyğun gəlmir!';

  @override
  String get securePasswordRepeat => 'Təkrar Şifrə';

  @override
  String get securityHeadline => 'Təhlükəsizlik';

  @override
  String get settingsBaseHeadline => 'Əsaslar';

  @override
  String get settingsHeadline => 'Parametrlər';

  @override
  String get settingsSaved => 'Tənzimləmələr yadda saxlanıldı!';

  @override
  String get simpleFinDescription =>
      'ABŞ bankları və kart emitentlərinin qalıqlarını və əməliyyatlarını SimpleFIN Bridge vasitəsilə idxal edin. Giriş yalnız oxumaq üçündür: ödənişlər edilmir.';

  @override
  String get simpleFinHeadline => 'SimpleFIN Bridge (US)';

  @override
  String get simpleFinNoCredentials =>
      'SimpleFIN Bridge giriş məlumatları olmayan giriş ünvanı qaytardı';

  @override
  String get simpleFinToken => 'SimpleFIN quraşdırma tokeni';

  @override
  String get simpleFinTokenClaimed =>
      'Quraşdırma tokeni mövcud deyil və ya artıq istifadə olunub';

  @override
  String get simpleFinTokenInvalid => 'Yanlış SimpleFIN quraşdırma tokeni';

  @override
  String get simpleFinTokenTooltip =>
      'Bu tətbiq üçün SimpleFIN Bridge-də (məs. bridge.simplefin.org) yaradılır; yalnız bir dəfə istifadə oluna bilər';

  @override
  String get skipFromTotals => 'Cəmilərdən xaric edin';

  @override
  String get skipTooltip => 'Addım(lar)ı atlayın';

  @override
  String get sortTooltip => 'Elementləri sırala';

  @override
  String get sortingAmountAsc => 'Məbləğ Artan';

  @override
  String get sortingAmountDesc => 'Məbləğ Enən';

  @override
  String get sortingCreatedAtAsc => 'Yaradılma Tarixi Artan';

  @override
  String get sortingCreatedAtDesc => 'Yaradılma Tarixi Enən';

  @override
  String get sortingTitleAsc => 'Başlıq Artan';

  @override
  String get sortingTitleDesc => 'Başlıq Enən';

  @override
  String get sortingUpdatedAtAsc => 'Yenilənmə Tarixi Artan';

  @override
  String get sortingUpdatedAtDesc => 'Yenilənmə Tarixi Enən';

  @override
  String get spent => 'sərf etdi';

  @override
  String get splitCancelTooltip => 'Ayda bölünməni ləğv edin';

  @override
  String get splitHeadline => 'Hesabı böl';

  @override
  String get splitTooltip => 'Aylıq Limitləri Bəyan edin';

  @override
  String get starlingDescription =>
      'Pulsuz tərtibatçı hesabınızın şəxsi giriş tokeni ilə Starling Bank hesablarının qalıqlarını və əməliyyatlarını idxal edin. Giriş yalnız oxumaq üçündür: ödənişlər edilmir.';

  @override
  String get starlingHeadline =>
      'Starling Bank Personal Access (Birləşmiş Krallıq)';

  @override
  String get starlingScopes =>
      'Tokenin icazəsi çatışmır: onu \"account:read\", \"balance:read\" və \"transaction:read\" icazə sahələri ilə yaradın';

  @override
  String get starlingToken => 'Şəxsi giriş tokeni';

  @override
  String get starlingTokenSteps =>
      'Şəxsi giriş tokenini necə əldə etmək olar:\n1. developer.starlingbank.com saytında qeydiyyatdan keçin (pulsuz)\n2. Personal Access bölməsini açın, Starling hesabınızı əlavə edin və onu Starling tətbiqində təsdiqləyin\n3. \"account:read\", \"balance:read\" və \"transaction:read\" icazə sahələri ilə token yaradın\n4. Onu aşağıya yapışdırın və \"Qoşul\" düyməsini basın';

  @override
  String get starlingTokenTooltip =>
      'developer.starlingbank.com saytında Personal Access bölməsində yaradılır; şifrələnmiş saxlanılır';

  @override
  String get subscription =>
      'Açıq mənbəli layihə olaraq, abunəlik heç bir əlavə funksiyanın kilidini açmayacaq. Bununla belə, o, tətbiqin davamlı təkamülünə və təkmilləşdirilməsinə və onun mövcudluğunun qorunmasına investisiya kimi xidmət edəcəkdir.';

  @override
  String get subscriptionCoffee => 'Qəhvə al';

  @override
  String get subscriptionDinner => 'Axşam yeməyinə dəvət edin';

  @override
  String get subscriptionDonorbox => 'Donorbox vasitəsilə abunə olun';

  @override
  String get subscriptionGithub => 'GitHub vasitəsilə abunə olun';

  @override
  String get subscriptionHeadline => 'Sponsorluq';

  @override
  String get subscriptionInactive => 'Satınalma xidməti əlçatan deyil';

  @override
  String get subscriptionPatreon => 'Patreon vasitəsilə abunə olun';

  @override
  String get subscriptionPaypal => 'Qəhvə alın (PayPal)';

  @override
  String get subscriptionTiny => 'Şanslı bir sikkə verin';

  @override
  String get subscriptionTooltip => 'Dəstək (Sponsorluq)';

  @override
  String get success => 'Müvəffəq oldu';

  @override
  String get summary => 'Xülasə';

  @override
  String get symbol => 'Simvol';

  @override
  String get syncHeadline => 'Cihazları Sinxronlaşdırın';

  @override
  String get systemMode => 'Sistem';

  @override
  String get tapToOpen => 'Açmaq üçün toxunun';

  @override
  String get targetAmount => 'Hədəf məbləği';

  @override
  String get tellerAccessToken => 'Giriş tokeni';

  @override
  String get tellerAccessTokenTooltip =>
      'Bank bağlandıqdan sonra qoşulma səhifəsində göstərilir: Fingrom avtomatik açılmayıbsa, onu bura yapışdırın';

  @override
  String get tellerAppId => 'Tətbiq ID-si';

  @override
  String get tellerAppIdTooltip =>
      'Teller Dashboard-da göstərilir, \"app_\" ilə başlayır';

  @override
  String get tellerCertificate => 'Sertifikat (PEM)';

  @override
  String get tellerCertificateInvalid =>
      'Yanlış sertifikat: \"CERTIFICATE\" PEM bloku gözlənilir';

  @override
  String get tellerCertificateTooltip =>
      'Teller Dashboard-da verilir (Certificates); şifrələnmiş saxlanılır. Saxlanılmış sertifikatı saxlamaq üçün boş buraxın';

  @override
  String get tellerConnectBank => 'Bankı qoş';

  @override
  String get tellerConnectPage => 'Qoşulma səhifəsi';

  @override
  String get tellerConnectPageTooltip =>
      'Teller Connect-i brauzerdə açır və giriş tokenini Fingrom-a qaytarır';

  @override
  String get tellerDescription =>
      'ABŞ bankları və kart emitentlərinin qalıqlarını və əməliyyatlarını teller.io-da qeydiyyatdan keçmiş öz tətbiqinizlə Teller vasitəsilə idxal edin (pulsuz plan 100 real bank bağlantısına icazə verir). Giriş yalnız oxumaq üçündür: ödənişlər edilmir.';

  @override
  String get tellerDisconnected =>
      'Bank bağlantısı diqqətinizi tələb edir (məs. yeni giriş və ya təsdiq kodu): bankı yenidən qoşun';

  @override
  String get tellerEnvironment => 'Mühit';

  @override
  String get tellerHeadline => 'Teller (US)';

  @override
  String get tellerIncomplete =>
      'Tətbiq ID-sini doldurun; real bank məlumatları üçün sertifikat və şəxsi açar tələb olunur';

  @override
  String get tellerKey => 'Şəxsi açar (PEM)';

  @override
  String get tellerKeyInvalid =>
      'Yanlış şəxsi açar: \"PRIVATE KEY\" PEM bloku gözlənilir';

  @override
  String get tellerKeyTooltip =>
      'Sertifikatla birlikdə endirilir; şifrələnmiş saxlanılır. Saxlanılmış açarı saxlamaq üçün boş buraxın';

  @override
  String get tellerMissingCertificate =>
      'Teller sorğunu müştəri sertifikatı olmadan rədd etdi: sertifikatı və şəxsi açarı yükləyin və ya sandbox seçin';

  @override
  String get tellerSteps =>
      'Necə qoşulmaq olar:\n1. teller.io saytında qeydiyyatdan keçin və Teller Dashboard-u açın\n2. Tətbiq ID-sini kopyalayın, sonra şəxsi açarı ilə birlikdə sertifikat yaradıb endirin (Certificates)\n3. Onları aşağıda doldurun və mühiti seçin (sandbox: test məlumatları, banka \"username\" və \"password\" ilə daxil olun)\n4. \"Bankı qoş\" düyməsini basın və açılan səhifədə bankınıza daxil olun\n5. Hesabı və büdcə kateqoriyasını seçin, sonra \"Əməliyyatları idxal et\" düyməsini basın';

  @override
  String get tellerUpload => 'Fayl yüklə';

  @override
  String get termPrivacy => 'Gizlilik Siyasəti';

  @override
  String get termUse => 'İstifadə qaydaları';

  @override
  String get title => 'Başlıq';

  @override
  String get titleAccountTooltip => 'Hesab İdentifikatorunu daxil edin';

  @override
  String get titleBudgetTooltip => 'Büdcə Kateqoriyasının adını daxil edin';

  @override
  String get titleGoal => 'Məqsəd';

  @override
  String get titleGoalTooltip => 'Məqsəd təsvirini müəyyənləşdirin';

  @override
  String get to => 'üçün';

  @override
  String get total => 'ümumi';

  @override
  String get transactionFile => 'Fingrom Transactions Log File (.log)';

  @override
  String get transferHeadline => 'Transfer';

  @override
  String get transferTooltip => 'Transfer təfərrüatlarını təyin edin';

  @override
  String get transfersHeadline => 'Transferlər';

  @override
  String get typeButton => 'Düymə';

  @override
  String get upDescription =>
      'Şəxsi giriş tokeni ilə Up xərc və yığım hesablarının qalıqlarını və əməliyyatlarını idxal edin. Əlaqələndirilmiş Up hesabları arasında köçürmələr (Round Ups daxil olmaqla) köçürmə kimi idxal olunur. Giriş yalnız oxumaq üçündür: ödənişlər edilmir.';

  @override
  String get upHeadline => 'Up Banking API (Avstraliya)';

  @override
  String get upToken => 'Şəxsi giriş tokeni';

  @override
  String get upTokenSteps =>
      'Şəxsi giriş tokenini necə əldə etmək olar:\n1. Up tətbiqini açın və Data sharing → Personal Access Token bölməsinə keçin (və ya api.up.com.au saytında daxil olun)\n2. Token yaradın və onu kopyalayın (\"up:yeah:\" ilə başlayır); yeni token əvvəlkini əvəz edir\n3. Onu aşağıya yapışdırın və \"Qoşul\" düyməsini basın\n4. Aralarındakı köçürmələrin köçürmə kimi idxal olunması üçün bütün Up hesablarını (yığım hesabları daxil olmaqla) əlaqələndirin';

  @override
  String get upTokenTooltip =>
      'Up tətbiqində və ya api.up.com.au saytında yaradılır; şifrələnmiş saxlanılır. Yalnız ən son token etibarlıdır';

  @override
  String get updateAccountTooltip => 'Hesabı yeniləyin';

  @override
  String get updateBillTooltip => 'Billi yeniləyin';

  @override
  String get updateBudgetTooltip => 'Büdcə Kateqoriyasını yeniləyin';

  @override
  String get updateGoalTooltip => 'Məqsədi yeniləyin';

  @override
  String get updatePaymentTooltip => 'Ödənişi yeniləyin';

  @override
  String get username => 'İstifadəçi adı (Hesab)';

  @override
  String get uuid => 'Unikal Tranzaksiya İdentifikatoru';

  @override
  String get validTillDate => 'Qədər etibarlıdır';

  @override
  String get webDav => 'Veb Paylanmış Müəlliflik və Versiyalaşdırma (WebDav)';

  @override
  String get wiseDescription =>
      'Şəxsi API tokeni ilə Wise çoxvalyutalı hesablarının qalıqlarını və əməliyyatlarını idxal edin. Əlaqələndirilmiş balanslar arasında konvertasiyalar köçürmə kimi idxal olunur. Giriş yalnız oxumaq üçündür: ödənişlər edilmir.';

  @override
  String get wiseHeadline => 'Wise API (Global)';

  @override
  String get wiseNoProfiles => 'Token üçün mövcud Wise profili yoxdur';

  @override
  String get wiseProfile => 'Profil';

  @override
  String get wiseScaRequired =>
      'Wise güclü müştəri autentifikasiyası tələb edir: bu balansın çıxarışını Wise tətbiqində açın, sonra yenidən cəhd edin';

  @override
  String get wiseToken => 'Şəxsi API tokeni';

  @override
  String get wiseTokenSteps =>
      'Şəxsi API tokenini necə əldə etmək olar:\n1. Brauzerdə wise.com saytına daxil olun (mobil tətbiqdə token yaratmaq olmur)\n2. Parametrlər → İnteqrasiyalar və alətlər → API tokenləri bölməsini açın\n3. \"Yeni token əlavə et\" seçin, ad verin (məs. Fingrom) və \"Yalnız oxumaq\" girişini seçin\n4. İkimərhələli doğrulama ilə təsdiqləyin və tokeni kopyalayın\n5. Onu aşağıya yapışdırın və \"Qoşul\" düyməsini basın';

  @override
  String get wiseTokenTooltip =>
      'Wise-da Parametrlər → API tokenləri bölməsində yaradılır (mümkündürsə, yalnız oxumaq üçün); şifrələnmiş saxlanılır';

  @override
  String get zoomState => 'Böyüt / Uçaltın';
}
