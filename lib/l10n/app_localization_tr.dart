// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Turkish (`tr`).
class AppLocalizationsTr extends AppLocalizations {
  AppLocalizationsTr([String locale = 'tr']) : super(locale);

  @override
  String get a =>
      'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => 'Hakkında';

  @override
  String get account => 'Hesap';

  @override
  String get accountFrom => 'Hesaptan';

  @override
  String get accountHeadline => 'Hesaplar';

  @override
  String get accountTo => 'Hesaba';

  @override
  String get accountTooltip => 'Açık Hesaplar';

  @override
  String get accountType => 'Hesap Türü';

  @override
  String get accountTypeTooltip => 'Hesap Türünü Seçin';

  @override
  String get acknowledgeTooltip => 'Onaylamak';

  @override
  String get activate => 'Etkinleştir';

  @override
  String get actualData => 'Tarihsel Veriler';

  @override
  String get addAccountTooltip => 'Hesap Ekle';

  @override
  String get addBudgetTooltip => 'Yeni Bütçe Kategorisi Ekleme';

  @override
  String get addGoalTooltip => 'Yeni Hedef Ekle';

  @override
  String get addMainTooltip => 'Fatura, Gelir veya Transfer Ekle';

  @override
  String afterNDays(Object value) {
    return '$value gün sonra';
  }

  @override
  String get amountFrom => 'Başlangıç ​​Miktarı';

  @override
  String get amountTo => 'Bitiş Miktarı';

  @override
  String appBuild(Object build) {
    return 'İnşa et: $build';
  }

  @override
  String get appInitHeadline => 'Proje Başlatma';

  @override
  String get appStartHeadline => 'İlk Kurulum';

  @override
  String get appTitle => 'Fingrom';

  @override
  String appVersion(Object version) {
    return 'Sürüm: $version';
  }

  @override
  String get automationHeadline => 'Otomasyon';

  @override
  String get automationTypeDays => 'birkaç gün sonra';

  @override
  String get backTooltip => 'Geri dön';

  @override
  String get balance => 'Gerçekleşen Bakiye';

  @override
  String get balanceDate => 'Denge Tarihi Güncellemesi';

  @override
  String get balanceDateTooltip =>
      'Bu tarihten önceki Sonuçlar ve Gelirler bakiyeyi etkilemeyecektir';

  @override
  String get balanceTooltip => 'Dengeyi Ayarla';

  @override
  String get bankAccount => 'Banka Hesabı';

  @override
  String get bill => 'Fatura';

  @override
  String get billHeadline => 'Faturalar';

  @override
  String get billSetTooltip => 'Miktarı Ayarla';

  @override
  String billSum(Object value) {
    return 'Faturalar: $value';
  }

  @override
  String get billTooltip => 'Açık Faturalar';

  @override
  String get billTypeTooltip => '[Tür] Fatura, Gelir veya Transfer';

  @override
  String get brightnessTheme => 'Parlaklık Teması';

  @override
  String get btnAdd => 'Ekle';

  @override
  String get btnCancel => 'İptal';

  @override
  String get btnConfirm => 'Onaylayın';

  @override
  String get btnMore => 'Daha fazla';

  @override
  String get budget => 'Bütçe Kategorisi';

  @override
  String get budgetHeadline => 'Bütçeler';

  @override
  String get budgetLimit => 'Aylık Limit';

  @override
  String get budgetLimitHeadline => 'Limit Ayarlamaları';

  @override
  String get budgetPositive => 'Bütçe, Özet Yöneticisi';

  @override
  String get budgetPositiveOff => 'Negatif değerleri yoksay';

  @override
  String get budgetPositiveOn => 'Negatif değerleri dahil et';

  @override
  String get budgetRelativeLimit => 'Ay Başına Göreli Katsayı';

  @override
  String get budgetTooltip => 'Açık Bütçe Türleri';

  @override
  String get budgetType => 'Bütçeleme Aralığı';

  @override
  String get budgetTypeAsIs => 'Sınırsız';

  @override
  String get budgetTypeFixed => 'Sabit';

  @override
  String get budgetTypeMonth => 'aylık';

  @override
  String get budgetTypeRelative => 'Göreceli';

  @override
  String get budgetTypeWeek => 'haftalık';

  @override
  String get budgetTypeYear => 'yıllık';

  @override
  String get cash => 'Nakit';

  @override
  String get chartBarRace => 'Kategoriler için Bar Yarışı';

  @override
  String get chartForecast => 'Tahmin Tablosu';

  @override
  String get chartOHLC => 'Mum Çubuğu (OHLC) Grafiği';

  @override
  String get chartYtdExpense => 'Yıldan Bugüne (YTD) Giderler';

  @override
  String get clear => 'Düşen Değer';

  @override
  String get closeTooltip => 'Kapat';

  @override
  String get closedAt => 'Bugüne kadar tamamlandı';

  @override
  String get cmpChart => 'Diyagramlar';

  @override
  String get cmpRecent => 'Son Ürünler';

  @override
  String get cmpRecentCount => 'Liste Boyutu';

  @override
  String get coAuthor => 'Yazar';

  @override
  String get coConsult => 'DANIŞMAN';

  @override
  String get coDeveloper => 'geliştirici';

  @override
  String get coNew => 'Katılın';

  @override
  String get coPromoter => 'destekleyici';

  @override
  String get coTranslator => 'ÇEVİRMEN';

  @override
  String get coef => 'katsayısı';

  @override
  String get collapse => 'Bölümü Daralt (Geri Yükle)';

  @override
  String get color => 'Renk';

  @override
  String get colorApp => 'Özel';

  @override
  String get colorBackground => 'Arka plan';

  @override
  String get colorDark => 'Karanlık';

  @override
  String get colorInversePrimary => 'Ters Birincil';

  @override
  String get colorInverseSurface => 'Ters Yüzey';

  @override
  String get colorLight => 'Işık';

  @override
  String get colorOnInverseSurface => 'Ters Yüzey Üzerinde';

  @override
  String get colorOnSecondary => 'İkincil Olarak';

  @override
  String get colorOnSecondaryContainer => 'Konteyner Üzerinde';

  @override
  String get colorPrimary => 'Birincil';

  @override
  String get colorRestore => 'Paleti Sıfırla';

  @override
  String get colorSecondary => 'İkincil';

  @override
  String get colorSystem => 'Varsayılan';

  @override
  String get colorTheme => 'Palet';

  @override
  String get colorTooltip => 'Bir Renk Seçin';

  @override
  String get colorType => 'Renk Tipi';

  @override
  String get colorUser => 'Kişisel';

  @override
  String columnMap(Object value) {
    return '\'$value\' Sütunu için Eşleme';
  }

  @override
  String columnMapTooltip(Object value) {
    return '\'$value\' - Sütun Eşlemesini Seçin';
  }

  @override
  String get completeGoalTooltip => 'Hedefi Tamamla';

  @override
  String get confirmHeader => 'Eylemi Onaylayın';

  @override
  String get confirmTooltip => 'Emin misiniz? Bu işlem geri alınamaz.';

  @override
  String get contributors => 'Katkıda Bulunanlar';

  @override
  String get conversion => 'Conversion';

  @override
  String conversionMessage(Object currency) {
    return '$currency cinsinden alınmıştır';
  }

  @override
  String get copiedToClipboard => 'Panoya kopyalandı';

  @override
  String get createAccountHeader => 'Yeni Hesap Oluştur';

  @override
  String get createAccountTooltip => 'Yeni Hesap Oluştur';

  @override
  String get createBillHeader => 'Yeni İşlem Oluştur';

  @override
  String get createBillTooltip => 'Yeni Fatura Ekle';

  @override
  String get createBudgetHeader => 'Yeni Bütçe Kategorisi';

  @override
  String get createBudgetTooltip => 'Yeni Bütçe Kategorisi Oluşturun';

  @override
  String get createGoalHeader => 'Hedef Oluştur';

  @override
  String get createGoalTooltip => 'Yeni Hedef Ekle';

  @override
  String get createIncomeTooltip => 'Yeni Gelir Ekleme';

  @override
  String get createPaymentTooltip => 'Yeni Ödeme Ekle';

  @override
  String get createTransferTooltip => 'Transfer Oluştur';

  @override
  String get credit => 'Kredi';

  @override
  String get creditCard => 'Kredi Kartı';

  @override
  String get currency => 'Para Birimi';

  @override
  String get currencyAddHeadline => 'Döviz Bozdurma';

  @override
  String get currencyAddTooltip => 'Döviz Kuru Ekle';

  @override
  String get currencyDefault => 'Varsayılan Para Birimi';

  @override
  String get currencyDistribution => 'Dağıtım';

  @override
  String currencyExchange(Object from, Object to) {
    return 'Para Birimi Değişimi: $from -> $to';
  }

  @override
  String get currencyHeadline => 'Para Birimleri';

  @override
  String currencyIn(Object value) {
    return 'içinde $value';
  }

  @override
  String get currencyShort => 'para';

  @override
  String get currencyTooltip => 'Para Birimi Türü (Kod)';

  @override
  String get currencyUpdateTooltip => 'Para Birimi Oranını Güncelle';

  @override
  String get currentDate => 'Geçerli Tarih İşaretçisi';

  @override
  String get customAddTooltip => 'Widget Ekle';

  @override
  String get customDeleteTooltip => 'Özelleştirmeyi Sil';

  @override
  String get customSaveTooltip => 'Özelleştirmeyi Kaydet';

  @override
  String get customizeTooltip => 'Sayfayı Özelleştir';

  @override
  String get darkMode => 'Karanlık';

  @override
  String get dateFormat => 'Tarih Formatı';

  @override
  String get dateRange => 'Tarih Aralığı';

  @override
  String get dateTooltip => 'Tarih Seçiniz';

  @override
  String get dayMonday => 'Pazartesi';

  @override
  String get daySaturday => 'Cumartesi';

  @override
  String get dayStartOfMonth => 'Ayın başlangıcı';

  @override
  String get dayStartOfWeek => 'Hafta başı';

  @override
  String get daySunday => 'Pazar';

  @override
  String get deactivateAction => 'Parola Korumasını devre dışı bırak';

  @override
  String get debitCard => 'Banka Kartı';

  @override
  String def(Object value) {
    return '\'$value\' için Varsayılan Değer';
  }

  @override
  String get deleteAccountTooltip => 'Hesabı Devre Dışı Bırak';

  @override
  String get deleteBillTooltip => 'Faturayı Sil';

  @override
  String get deleteBudgetTooltip => 'Bütçe Kategorisini Devre Dışı Bırak';

  @override
  String get deleteGoalTooltip => 'Hedefi Sil';

  @override
  String get deleteInvoiceTooltip => 'Fatura Silme';

  @override
  String get deletePaymentTooltip => 'Ödeme Sil';

  @override
  String get deleteTooltip => 'Silme';

  @override
  String get deleteTransferTooltip => 'Transfer Sil';

  @override
  String get deposit => 'Depozito';

  @override
  String get description => 'Açıklama';

  @override
  String get descriptionTooltip => 'Gider Ayrıntılarını Ayarla';

  @override
  String get design => 'Tasarım Modu (Kültüre Özel)';

  @override
  String get designAsiaGeneral => 'Asya Genel';

  @override
  String get designGermany => 'Almanya';

  @override
  String get designGlobal => 'Küresel';

  @override
  String get designRtlGeneral => 'Right-to-Left Lettering';

  @override
  String get details => 'Detaylar';

  @override
  String get detailsTooltip => '****2345 - numaranın son 4 hanesi';

  @override
  String get dtAm => 'am';

  @override
  String get dtAmPm => 'am/pm cinsinden saat (0~11)';

  @override
  String get dtDay => 'ay içinde gün';

  @override
  String get dtEscape => 'metin için kaçış';

  @override
  String get dtHalfHour => 'am/pm cinsinden saat (1~12)';

  @override
  String get dtHour => 'gün içindeki saat (0~23)';

  @override
  String get dtMinute => 'saat içinde dakika';

  @override
  String get dtMonth => 'yıl içinde ay';

  @override
  String get dtNamedDay => 'haftanın günü';

  @override
  String get dtPm => 'pm';

  @override
  String get dtQuote => 'tek alıntı';

  @override
  String get dtSecond => 'dakika içinde saniye';

  @override
  String get dtYear => 'yıl';

  @override
  String get editAccountHeader => 'Hesap Güncelleme';

  @override
  String get editAccountTooltip => 'Hesabı Düzenle';

  @override
  String get editBillHeader => 'Bill\'i Güncelle';

  @override
  String get editBillTooltip => 'Faturayı Düzenle';

  @override
  String get editBudgetHeader => 'Bütçe Kategorisini Güncelle';

  @override
  String get editBudgetTooltip => 'Bütçe Kategorisini Düzenle';

  @override
  String get editGoalHeader => 'Hedefi Güncelle';

  @override
  String get editGoalTooltip => 'Hedefi Düzenle';

  @override
  String get editInvoiceTooltip => 'Fatura Düzenle';

  @override
  String get editPaymentTooltip => 'Ödeme Düzenle';

  @override
  String get editTooltip => 'Düzenle';

  @override
  String get editTransferTooltip => 'Aktarımı Düzenle';

  @override
  String get enableBankingAppId => 'Uygulama kimliği';

  @override
  String get enableBankingBank => 'Banka';

  @override
  String get enableBankingCode =>
      'Yetkilendirmeden sonra açılan sayfanın adresi';

  @override
  String get enableBankingCodeTooltip =>
      'Bankada erişimi onaylayın, ardından adresi tarayıcıdan kopyalayıp buraya yapıştırın';

  @override
  String get enableBankingCountry => 'Ülke (ISO kodu, ör. DE)';

  @override
  String get enableBankingDescription =>
      'Enable Banking API (PSD2) üzerinden, enablebanking.com\'da kayıtlı kendi uygulamanızla Avrupa bankalarının bakiyelerini ve işlemlerini içe aktarın. Erişim salt okunurdur: ödeme yapılmaz.';

  @override
  String get enableBankingHeadline => 'Enable Banking (EU)';

  @override
  String get enableBankingIncomplete =>
      'Uygulama kimliğini, özel anahtarı, yönlendirme URL\'sini ve ülkeyi doldurun';

  @override
  String get enableBankingKey => 'Özel anahtar (PEM)';

  @override
  String get enableBankingKeyInvalid =>
      'Geçersiz özel anahtar: \"PRIVATE KEY\" PEM bloğu bekleniyor';

  @override
  String get enableBankingKeyNotRsa =>
      'Geçersiz özel anahtar: RSA anahtarı bekleniyor';

  @override
  String get enableBankingKeyTooltip =>
      'Enable Banking Control Panel\'de uygulamayla birlikte oluşturulur; şifreli olarak saklanır. Kayıtlı anahtarı korumak için boş bırakın';

  @override
  String get enableBankingLoadBanks => 'Bankaları yükle';

  @override
  String get enableBankingNoAuthPage =>
      'Enable Banking bir yetkilendirme sayfası döndürmedi';

  @override
  String get enableBankingNoCode => 'Adreste yetkilendirme kodu bulunamadı';

  @override
  String get enableBankingRedirect => 'Yönlendirme URL\'si';

  @override
  String get enableBankingRedirectTooltip =>
      'Uygulama için kayıtlıdır; banka yetkilendirmeden sonra buraya geri döner';

  @override
  String get enableBankingStateMismatch =>
      'Adres başka bir yetkilendirmeye ait, yeniden bağlanın';

  @override
  String get encryptionMode => 'Veri Şifreleme';

  @override
  String error(Object value) {
    return 'Hata: $value';
  }

  @override
  String get errorExpired => 'Kartın süresi doldu';

  @override
  String get errorNegative => 'Olumsuz olamaz! Lütfen hatayı düzeltin';

  @override
  String get example => 'Örnek';

  @override
  String get expand => 'Bölümü Genişlet';

  @override
  String get expense => 'Harcama Tutarı';

  @override
  String get expenseDateTime => 'Faturalandırma';

  @override
  String get expenseHeadline => 'Giderler';

  @override
  String get expenseTransfer => 'Transfer Tutarı';

  @override
  String exportFile(Object value) {
    return '.$value dosyası olarak dışa aktar';
  }

  @override
  String get failData => 'Tutar Kesintisi';

  @override
  String get finTsApproved => 'Banka uygulamasında onaylandı';

  @override
  String get finTsBankCode => 'Banka kodu (BLZ)';

  @override
  String get finTsCustomerId =>
      'Müşteri kimliği (kullanıcı kimliğinden farklıysa)';

  @override
  String get finTsDescription =>
      'FinTS 4.1 (PIN/TAN) destekleyen bankalardan bakiyeleri ve işlemleri içe aktarın. Erişim salt okunurdur: ödeme yapılmaz.';

  @override
  String get finTsHeadline => 'Financial Transaction Services (FinTS 4.1)';

  @override
  String get finTsIncomplete =>
      'Sunucu URL\'sini, banka kodunu, kullanıcı kimliğini ve ürün kayıt numarasını doldurun';

  @override
  String finTsLoginChanged(Object value) {
    return 'Banka giriş bilgilerini değiştirdi, kullanıcı veya müşteri kimliğini güncelleyin: $value';
  }

  @override
  String finTsLoginRefused(Object value) {
    return 'Banka önceki girişi reddetti: $value. Girilen PIN ile yeniden denensin mi?';
  }

  @override
  String get finTsPin => 'PIN';

  @override
  String get finTsPinHint =>
      'Yalnızca bu oturum için kullanılır ve asla saklanmaz';

  @override
  String get finTsProductId => 'Ürün kayıt numarası';

  @override
  String get finTsProductIdTooltip =>
      'Deutsche Kreditwirtschaft tarafından uygulama üreticisine verilir';

  @override
  String get finTsTan => 'TAN';

  @override
  String get finTsTanHeadline => 'İşlem doğrulama (TAN)';

  @override
  String get finTsTanMedium => 'TAN aracını seçin';

  @override
  String get finTsTanMethod => 'TAN yöntemini seçin';

  @override
  String get finTsUrl => 'Bankanın FinTS sunucu URL\'si';

  @override
  String get finTsUserId => 'Kullanıcı kimliği (giriş)';

  @override
  String get finTsVersion => 'Protokol sürümü';

  @override
  String get finTsWebUnsupported =>
      'Banka sunucuları tarayıcıdan erişime izin vermez. Masaüstü veya mobil uygulamayı kullanın.';

  @override
  String get flowTypeInvoice => 'Invoice';

  @override
  String get flowTypeTooltip => 'Tutar Türü: Fatura, Fatura';

  @override
  String get forecastData => 'Tahmin';

  @override
  String get from => 'gelen';

  @override
  String get goNextTooltip => 'Sonraki';

  @override
  String get goalHeadline => 'Hedefler';

  @override
  String goalProfit(Object value) {
    return 'Hedefler Hedef: $value';
  }

  @override
  String get goalProfitTooltip => 'Hedeflere Karşı Kâr';

  @override
  String get goalTooltip => 'Açık Hedefler';

  @override
  String get hasEncrypted => 'Ayarlandıktan sonra değiştirilemez';

  @override
  String get helpTooltip => '[Yardım] Bu Sayfanın Açıklamasını Göster';

  @override
  String get homeHeadline => 'Home';

  @override
  String get homeTooltip => 'Ana Sayfaya Geri Dön';

  @override
  String get hour => 'Saat';

  @override
  String get icon => 'Simge';

  @override
  String get iconTooltip => 'Simge Seçin';

  @override
  String get ignoreTooltip => 'Görmezden gel';

  @override
  String get importHeadline => 'İthalat / İhracat';

  @override
  String get income => 'Gelir Miktarı';

  @override
  String get incomeHeadline => 'Gelir';

  @override
  String get incomeHealth => 'Gelir Sağlığı Radarı';

  @override
  String get incomeTooltip => 'Gelir Ayrıntılarını Ayarla';

  @override
  String get integrationAccessDenied =>
      'Erişim iptal edildi veya kimlik bilgileri yanlış';

  @override
  String get integrationConnect => 'Bağlan';

  @override
  String get integrationDateFrom => 'İşlemleri şu tarihten itibaren içe aktar';

  @override
  String get integrationDefaultBudgetCategory => 'Varsayılan bütçe kategorisi';

  @override
  String get integrationDisconnect => 'Bağlantıyı kes';

  @override
  String get integrationForget => 'Erişimi unut';

  @override
  String get integrationHeadline => 'Entegrasyonlar';

  @override
  String integrationHttpError(Object value) {
    return 'Hizmet bir hatayla yanıt verdi (HTTP $value)';
  }

  @override
  String get integrationHttpsRequired =>
      'Yalnızca güvenli (HTTPS) adreslere izin verilir';

  @override
  String get integrationImport => 'İşlemleri içe aktar';

  @override
  String integrationImported(Object added, Object pending, Object skipped) {
    return 'İçe aktarılan: $added, zaten mevcut olduğu için atlanan: $skipped, bekleyen (içe aktarılmayan): $pending';
  }

  @override
  String integrationInvalidAmount(Object value) {
    return 'Geçersiz tutar: $value';
  }

  @override
  String get integrationNoAccounts => 'Banka herhangi bir hesap sağlamadı';

  @override
  String get integrationPaymentRequired =>
      'Hizmet, erişim için ödeme gerektiriyor';

  @override
  String get integrationSelectTarget =>
      'İçe aktarılacak hesabı ve bütçe kategorisini seçin';

  @override
  String integrationServiceError(Object value) {
    return 'Hizmet mesajı: $value';
  }

  @override
  String get integrationUnexpectedResponse => 'Hizmetten beklenmeyen yanıt';

  @override
  String get invoiceHeadline => 'Invoices';

  @override
  String invoiceSum(Object value) {
    return 'Faturalar: $value';
  }

  @override
  String get isCleaned => 'Mevcut verileri kaldırın';

  @override
  String get isCreated => 'Zaten oluşturuldu, sonraki adımları izleyin!';

  @override
  String get isEncrypted => 'Dosya şifrelenmiştir (varsayılan olarak)';

  @override
  String get isRequired => 'gerekli';

  @override
  String get language => 'Language';

  @override
  String get left => 'Sol';

  @override
  String get lightMode => 'Işık';

  @override
  String get link => 'Tekdüzen Kaynak Konum Belirleyici (URL)';

  @override
  String get managerHeadline => 'Yönetici';

  @override
  String get meaning => 'Anlamı';

  @override
  String get metricsHeadline => 'Metrikler';

  @override
  String get metricsTooltip => 'Metrikler';

  @override
  String get milestones => 'Kilometre Taşları';

  @override
  String get minute => 'Dakika';

  @override
  String get missingContent => 'Dosya işlenemiyor (ya iptal edildi)';

  @override
  String get monobankCreateAccount => 'Hesap oluştur';

  @override
  String get monobankDescription =>
      'Kişisel token ile monobank kartlarının ve kumbaralarının bakiyelerini ve işlemlerini içe aktarma. monobank dakikada bir isteğe izin verir: uzun bir dönemin içe aktarılması birkaç dakika sürer. Salt okunur erişim: ödeme yapılmaz.';

  @override
  String get monobankHeadline => 'monobank Personal API (Ukrayna)';

  @override
  String get monobankJar => 'Kumbara';

  @override
  String monobankProgress(Object done, Object total) {
    return 'Ekstreler isteniyor: $done / $total';
  }

  @override
  String monobankRateLimit(Object value) {
    return 'monobank dakikada bir isteğe izin verir: sonraki $value sn sonra';
  }

  @override
  String get monobankToken => 'Kişisel token';

  @override
  String get monobankTokenSteps =>
      'Kişisel token nasıl alınır:\n1. Bir tarayıcıda api.monobank.ua adresini açın\n2. QR kodunu monobank uygulamasıyla tarayın ve erişimi onaylayın\n3. Sayfadaki tokenı kopyalayın\n4. Aşağıya yapıştırın ve \"Bağlan\"a basın\n5. Her kartı veya kumbarayı bir hesaba bağlayın (ya da hesap oluşturun) ve içe aktarın';

  @override
  String get monobankTokenTooltip =>
      'monobank uygulamasında QR kodu tarandıktan sonra api.monobank.ua üzerinde verilir; şifrelenmiş olarak saklanır';

  @override
  String get navigationTooltip => 'Ana menüyü açın';

  @override
  String netProfit(Object value) {
    return 'Kâr: $value';
  }

  @override
  String get noChartData => 'Gösterilecek veri eksik (veya yeterli değil)';

  @override
  String get notificationAccessSettings => 'Bildirim erişimi';

  @override
  String get notificationAccessSteps =>
      'Erişim nasıl verilir:\n1. Sistem ayarlarını açmak için \"Erişim ver\"e basın\n2. Fingrom\'un bildirimleri okumasına izin verin\n3. Android kısıtlanmış bir ayar bildirirse: Fingrom uygulama bilgisi → ⋮ → \"Kısıtlanmış ayarlara izin ver\" seçeneğini açın ve tekrar deneyin\n4. Fingrom\'a dönün ve bildirimleri okunacak uygulamaları seçin';

  @override
  String get notificationAccounts => 'Hesap anahtar kelimeleri';

  @override
  String get notificationAccountsTooltip =>
      'Bildirimde hesabı tanıyan kelimeler (kartın son haneleri, cüzdan adı): bir kelime yazın ve eklemek için Enter tuşuna basın. Aksi halde uygulamanın varsayılan hesabı kullanılır';

  @override
  String get notificationApps => 'Bildirimleri okunan uygulamalar';

  @override
  String notificationAutoImported(Object value) {
    return 'Bildirimlerden eklendi: $value';
  }

  @override
  String get notificationAutoTooltip =>
      'Tanınan bildirimler onay olmadan eklenir: Fingrom çalışırken hemen, aksi halde bir sonraki açılışta. Tanınmayanlar incelemeyi bekler';

  @override
  String get notificationBalance => 'Bakiye anahtar kelimeleri';

  @override
  String get notificationBalanceTooltip =>
      'Yok sayılacak bir tutardan (bakiye, limit) önce gelen kelimeler: bir kelime yazın ve eklemek için Enter tuşuna basın';

  @override
  String notificationCaptured(Object value) {
    return 'Yakalanan bildirimler: $value';
  }

  @override
  String get notificationClear => 'Yakalananları temizle';

  @override
  String get notificationCurrencyTooltip =>
      'Para birimi olmayan tutarlar (ör. Borç 20,00) bu para biriminde alınır';

  @override
  String get notificationDefaultAccount => 'Varsayılan hesap';

  @override
  String get notificationDescription =>
      'Bu cihazdaki bankacılık ve ödeme uygulamalarının bildirimlerinden işlemler oluşturun. Yalnızca seçilen uygulamaların bildirimleri okunur ve içe aktarılana kadar cihazda kalır. Tutar ve para birimi otomatik olarak tanınır.';

  @override
  String get notificationGrant => 'Erişim ver';

  @override
  String get notificationIncome => 'Gelir anahtar kelimeleri';

  @override
  String get notificationIncomeTooltip =>
      'Bildirimi gelir olarak işaretleyen kelimeler: bir kelime yazın ve eklemek için Enter tuşuna basın';

  @override
  String get notificationMerchant => 'Satıcı etiketleri';

  @override
  String get notificationMerchantTooltip =>
      'Ardından iki nokta ve satıcı gelen kelimeler (Yer: Mağaza): bir kelime yazın ve eklemek için Enter tuşuna basın';

  @override
  String get notificationNoApps =>
      'Henüz bildirim alınmadı: uygulamalar bir bildirim gönderdikten sonra burada görünür';

  @override
  String get notificationUnparsed => 'Tanınmadı';

  @override
  String get notifyHeadline => 'Bildirim Ayrıştırıcı';

  @override
  String get ok => 'TAMAM.';

  @override
  String get orderPin => 'Önceliklendirilmiş sıra';

  @override
  String get orderUnpin => 'Genelleştirilmiş düzen';

  @override
  String get outputFile => 'Dosya için hedef';

  @override
  String get parseFile => 'Dosyayı Ayrıştırma';

  @override
  String get password => 'Şifre';

  @override
  String get path => 'Dosya Adı (içine kaydetmek veya içinden yüklemek için)';

  @override
  String get paymentType => 'Ödeme Aralığı';

  @override
  String get paymentsHeadline => 'Yinelenen Ödemeler';

  @override
  String get pearDisabled => '-- devre dışı --';

  @override
  String get pearLoading => 'Devam Ediyor...';

  @override
  String get peerAccept => 'kabul et';

  @override
  String get peerAction => 'Eylem';

  @override
  String get peerClosed => 'sonlandırıldı';

  @override
  String get peerConnect => 'Cihazı Bağlayın';

  @override
  String get peerConnectBtn => 'bağlanmak';

  @override
  String get peerDelete => 'silme';

  @override
  String get peerDevice => 'Bağlantılı Cihazlar';

  @override
  String get peerId => 'Bağlantı için Cihaz Tanımlayıcınız';

  @override
  String get peerOffline => 'çevrimdışı';

  @override
  String get peerOnline => 'bağlı';

  @override
  String get peerOtherId => 'Bağlantı için Cihaz Tanımlayıcısı';

  @override
  String get peerPending => 'beklemede';

  @override
  String get peerPing => 'ping';

  @override
  String get peerSent => 'Veriler bağlı Cihazlara aktarılır';

  @override
  String get peerStatus => 'Durum';

  @override
  String get peerSync => 'Veri Aktarımı';

  @override
  String pickFile(Object value) {
    return '.$value-dosyasını seç';
  }

  @override
  String pongStatus(Object uuid) {
    return '$uuid adresinden istek alındı';
  }

  @override
  String get privatBankAdd => 'Hesap ekle';

  @override
  String get privatBankDescription =>
      'Privat24 for Business\'taki ticari hesapların (şahıs işletmeleri ve şirketler) bakiyelerini ve işlemlerini bir Autoclient belirteciyle içe aktarın. Kişisel hesaplar API tarafından desteklenmez. Erişim salt okunurdur: ödeme yapılmaz.';

  @override
  String get privatBankHeadline => 'PrivatBank Autoclient (Ukrayna)';

  @override
  String get privatBankIban => 'Hesap IBAN';

  @override
  String get privatBankIbanInvalid =>
      'Bir Ukrayna IBAN girin: UA ve ardından 27 rakam';

  @override
  String get privatBankIbanTooltip =>
      'API hesap listesi sağlamaz: hesapların IBAN\'larını tek tek ekleyin';

  @override
  String privatBankNotReady(Object value) {
    return 'PrivatBank hesap özetlerini hazırlıyor (aşama $value): birkaç dakika sonra tekrar deneyin';
  }

  @override
  String get privatBankRemove => 'Hesabı kaldır';

  @override
  String get privatBankToken => 'Autoclient belirteci';

  @override
  String get privatBankTokenSteps =>
      'Autoclient belirteci nasıl alınır:\n1. Privat24 for Business\'a giriş yapın\n2. Entegrasyon (Autoclient) bölümünü açın\n3. Etkinleştirin ve belirteci kopyalayın\n4. Aşağıya yapıştırın ve \"Bağlan\"a basın\n5. İçe aktarılacak hesapların IBAN\'larını ekleyin';

  @override
  String get privatBankTokenTooltip =>
      'Privat24 for Business içinde Entegrasyon (Autoclient) altında verilir; şifreli olarak saklanır';

  @override
  String get processIsFinished => 'Bitti!';

  @override
  String progress(Object value) {
    return 'İlerleme: $value%';
  }

  @override
  String get raiseData => 'Tutar İlave';

  @override
  String get recoveryHeadline => 'Kurtarma';

  @override
  String get recoveryTooltip => 'Kurtarmak';

  @override
  String get releases => 'Bültenler';

  @override
  String get reset => 'Sıfırla';

  @override
  String get returnBack => 'Geri Dönüş';

  @override
  String get roadmap => 'Yol Haritası';

  @override
  String get saveNotification => 'Değişiklikler kaydedildi!';

  @override
  String get saveSettingsTooltip => 'Kaydet';

  @override
  String get saveTooltip => 'Şuraya Kaydet';

  @override
  String search(Object value) {
    return '\'$value\' Kalıbına Göre Göster';
  }

  @override
  String get searchTooltip => 'Aramak';

  @override
  String get secureBioNotMatch =>
      'Kimlik doğrulama başarısız! Lütfen tekrar deneyin';

  @override
  String get secureBioPromptReason =>
      'Devam etmek için lütfen kimlik doğrulaması yapın';

  @override
  String get secureBioPromptTitle => 'Biyometrik Kimlik Doğrulama';

  @override
  String get secureOtpCode => 'Bir Defalık Parola Kodu';

  @override
  String get secureOtpCodeInvalid =>
      'Geçersiz! Lütfen yeni bir kod oluşturun ve girin';

  @override
  String get secureOtpDeactivated => 'Parola Koruması devre dışı bırakıldı';

  @override
  String get securePassword => 'Parola (Kurtarma İfadesi)';

  @override
  String get securePasswordEmpty => 'Şifre boş bırakılamaz!';

  @override
  String get securePasswordNotMatch => 'Şifreler eşleşmiyor!';

  @override
  String get securePasswordRepeat => 'Parolayı Tekrarla';

  @override
  String get securityHeadline => 'Güvenlik';

  @override
  String get settingsBaseHeadline => 'Temel Bilgiler';

  @override
  String get settingsHeadline => 'Ayarlar';

  @override
  String get settingsSaved => 'Ayarlar kaydedildi!';

  @override
  String get simpleFinDescription =>
      'ABD bankaları ve kart sağlayıcılarının bakiyelerini ve işlemlerini bir SimpleFIN Bridge üzerinden içe aktarın. Erişim salt okunurdur: ödeme yapılmaz.';

  @override
  String get simpleFinHeadline => 'SimpleFIN Bridge (US)';

  @override
  String get simpleFinNoCredentials =>
      'SimpleFIN Bridge kimlik bilgileri olmayan bir erişim adresi döndürdü';

  @override
  String get simpleFinToken => 'SimpleFIN kurulum belirteci';

  @override
  String get simpleFinTokenClaimed =>
      'Kurulum belirteci mevcut değil veya zaten kullanılmış';

  @override
  String get simpleFinTokenInvalid => 'Geçersiz SimpleFIN kurulum belirteci';

  @override
  String get simpleFinTokenTooltip =>
      'Bu uygulama için SimpleFIN Bridge\'inizde (ör. bridge.simplefin.org) oluşturulur; yalnızca bir kez kullanılabilir';

  @override
  String get skipFromTotals => 'Toplamlardan hariç tut';

  @override
  String get skipTooltip => 'Adım(lar)ı Atla';

  @override
  String get sortTooltip => 'Öğeleri Sırala';

  @override
  String get sortingAmountAsc => 'Miktar Artan';

  @override
  String get sortingAmountDesc => 'Miktar Azalan';

  @override
  String get sortingCreatedAtAsc => 'Oluşturulma Tarihi Artan';

  @override
  String get sortingCreatedAtDesc => 'Oluşturulma Tarihi Azalan';

  @override
  String get sortingTitleAsc => 'Başlık Artan';

  @override
  String get sortingTitleDesc => 'Başlık Azalan';

  @override
  String get sortingUpdatedAtAsc => 'Güncellenme Tarihi Artan';

  @override
  String get sortingUpdatedAtDesc => 'Güncellenme Tarihi Azalan';

  @override
  String get spent => 'harcandı';

  @override
  String get splitCancelTooltip => 'Ay Başına Bölünmeyi İptal Et';

  @override
  String get splitHeadline => 'Faturayı Böl';

  @override
  String get splitTooltip => 'Aylık Limitleri Bildirin';

  @override
  String get subscription =>
      'Açık kaynaklı bir proje olarak, abone olmak herhangi bir ek özelliğin kilidini açmayacaktır. Ancak, uygulamanın sürekli gelişimi ve iyileştirilmesi ve kullanılabilirliğinin korunması için bir yatırım olarak hizmet edecektir.';

  @override
  String get subscriptionCoffee => 'Bir Kahve Satın Alın';

  @override
  String get subscriptionDinner => 'Akşam Yemeğinde İkram';

  @override
  String get subscriptionDonorbox => 'Donorbox üzerinden abone olun';

  @override
  String get subscriptionGithub => 'GitHub üzerinden abone olun';

  @override
  String get subscriptionHeadline => 'Sponsorluk';

  @override
  String get subscriptionInactive => 'Satın Alma Hizmeti Kullanılamıyor';

  @override
  String get subscriptionPatreon => 'Patreon aracılığıyla abone olun';

  @override
  String get subscriptionPaypal => 'Kahve Satın Alın (PayPal)';

  @override
  String get subscriptionTiny => 'Şanslı bir madeni para verin';

  @override
  String get subscriptionTooltip => 'Destek (Sponsorluk)';

  @override
  String get success => 'Başarılı';

  @override
  String get summary => 'Özet';

  @override
  String get symbol => 'Sembol';

  @override
  String get syncHeadline => 'Senkronizasyon Cihazları';

  @override
  String get systemMode => 'System';

  @override
  String get tapToOpen => 'Açmak için dokunun';

  @override
  String get targetAmount => 'Hedef Miktar';

  @override
  String get tellerAccessToken => 'Erişim anahtarı';

  @override
  String get tellerAccessTokenTooltip =>
      'Bir banka bağlandıktan sonra bağlantı sayfasında gösterilir: Fingrom otomatik olarak açılmadıysa buraya yapıştırın';

  @override
  String get tellerAppId => 'Uygulama kimliği';

  @override
  String get tellerAppIdTooltip =>
      'Teller Dashboard\'da gösterilir, \"app_\" ile başlar';

  @override
  String get tellerCertificate => 'Sertifika (PEM)';

  @override
  String get tellerCertificateInvalid =>
      'Geçersiz sertifika: \"CERTIFICATE\" PEM bloğu bekleniyor';

  @override
  String get tellerCertificateTooltip =>
      'Teller Dashboard\'da düzenlenir (Certificates); şifreli olarak saklanır. Kayıtlı sertifikayı korumak için boş bırakın';

  @override
  String get tellerConnectBank => 'Bankayı bağla';

  @override
  String get tellerConnectPage => 'Bağlantı sayfası';

  @override
  String get tellerConnectPageTooltip =>
      'Teller Connect\'i tarayıcıda açar ve erişim anahtarını Fingrom\'a döndürür';

  @override
  String get tellerDescription =>
      'ABD bankaları ve kart sağlayıcılarının bakiyelerini ve işlemlerini, teller.io\'da kayıtlı kendi uygulamanızla Teller üzerinden içe aktarın (ücretsiz plan 100 gerçek banka bağlantısına izin verir). Erişim salt okunurdur: ödeme yapılmaz.';

  @override
  String get tellerDisconnected =>
      'Banka bağlantısı ilginizi gerektiriyor (ör. yeni bir giriş veya onay kodu): bankayı yeniden bağlayın';

  @override
  String get tellerEnvironment => 'Ortam';

  @override
  String get tellerHeadline => 'Teller (US)';

  @override
  String get tellerIncomplete =>
      'Uygulama kimliğini doldurun; gerçek banka verileri için sertifika ve özel anahtar gereklidir';

  @override
  String get tellerKey => 'Özel anahtar (PEM)';

  @override
  String get tellerKeyInvalid =>
      'Geçersiz özel anahtar: \"PRIVATE KEY\" PEM bloğu bekleniyor';

  @override
  String get tellerKeyTooltip =>
      'Sertifikayla birlikte indirilir; şifreli olarak saklanır. Kayıtlı anahtarı korumak için boş bırakın';

  @override
  String get tellerMissingCertificate =>
      'Teller isteği istemci sertifikası olmadığı için reddetti: sertifikayı ve özel anahtarı yükleyin veya sandbox\'ı seçin';

  @override
  String get tellerSteps =>
      'Nasıl bağlanılır:\n1. teller.io\'ya kaydolun ve Teller Dashboard\'u açın\n2. Uygulama kimliğini kopyalayın, ardından özel anahtarıyla birlikte bir sertifika oluşturup indirin (Certificates)\n3. Bunları aşağıya girin ve ortamı seçin (sandbox: test verileri, bir bankaya \"username\" ve \"password\" ile giriş yapın)\n4. \"Bankayı bağla\"ya basın ve açılan sayfada bankanıza giriş yapın\n5. Hesabı ve bütçe kategorisini seçin, ardından \"İşlemleri içe aktar\"a basın';

  @override
  String get tellerUpload => 'Dosya yükle';

  @override
  String get termPrivacy => 'Gizlilik Politikası';

  @override
  String get termUse => 'Kullanım Koşulları';

  @override
  String get title => 'Başlık';

  @override
  String get titleAccountTooltip => 'Hesap Tanımlayıcısını Girin';

  @override
  String get titleBudgetTooltip => 'Bütçe Kategorisi Adını Girin';

  @override
  String get titleGoal => 'Hedef';

  @override
  String get titleGoalTooltip => 'Hedef Tanımını Belirleyin';

  @override
  String get to => 'için';

  @override
  String get total => 'Toplam';

  @override
  String get transactionFile => 'Fingrom İşlemleri Günlük Dosyası (.log)';

  @override
  String get transferHeadline => 'Transfer';

  @override
  String get transferTooltip => 'Transfer Ayrıntılarını Ayarla';

  @override
  String get transfersHeadline => 'Transferler';

  @override
  String get typeButton => 'Düğme';

  @override
  String get updateAccountTooltip => 'Hesap Güncelleme';

  @override
  String get updateBillTooltip => 'Bill\'i Güncelle';

  @override
  String get updateBudgetTooltip => 'Bütçe Kategorisini Güncelle';

  @override
  String get updateGoalTooltip => 'Hedefi Güncelle';

  @override
  String get updatePaymentTooltip => 'Ödeme Güncelleme';

  @override
  String get username => 'Kullanıcı Adı (Hesap)';

  @override
  String get uuid => 'Benzersiz İşlem Tanımlayıcısı';

  @override
  String get validTillDate => 'Geçerlilik Süresi';

  @override
  String get webDav => 'Web Dağıtılmış Yazma ve Sürüm Oluşturma (WebDav)';

  @override
  String get wiseDescription =>
      'Wise çoklu para birimi hesaplarının bakiyelerini ve işlemlerini kişisel API anahtarıyla içe aktarın. Bağlı bakiyeler arasındaki dönüşümler transfer olarak içe aktarılır. Erişim salt okunurdur: hiçbir ödeme yapılmaz.';

  @override
  String get wiseHeadline => 'Wise API (Global)';

  @override
  String get wiseNoProfiles =>
      'Bu anahtar için kullanılabilir Wise profili yok';

  @override
  String get wiseProfile => 'Profil';

  @override
  String get wiseScaRequired =>
      'Wise güçlü müşteri kimlik doğrulaması istiyor: bu bakiyenin ekstresini Wise uygulamasında açın ve tekrar deneyin';

  @override
  String get wiseToken => 'Kişisel API Anahtarı';

  @override
  String get wiseTokenSteps =>
      'Kişisel API anahtarı nasıl alınır:\n1. Tarayıcıda wise.com\'a giriş yapın (mobil uygulamada anahtar oluşturulamaz)\n2. Ayarlar → Entegrasyonlar ve araçlar → API anahtarları bölümünü açın\n3. \"Yeni anahtar ekle\"yi seçin, bir ad verin (ör. Fingrom) ve \"Salt okunur\" erişimi seçin\n4. İki adımlı doğrulamayla onaylayın ve anahtarı kopyalayın\n5. Aşağıya yapıştırın ve \"Bağlan\"a basın';

  @override
  String get wiseTokenTooltip =>
      'Wise\'da Ayarlar → API anahtarları bölümünde oluşturulur (mümkünse salt okunur); şifreli olarak saklanır';

  @override
  String get zoomState => 'Yakınlaştırma / Uzaklaştırma';
}
