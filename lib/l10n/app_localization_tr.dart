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
  String get bill => 'Bill';

  @override
  String get billHeadline => 'Bills';

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
  String get dayStartOfMonth => 'Ayın başlangıcı';

  @override
  String get dayStartOfWeek => 'Hafta başı';

  @override
  String get daySunday => 'Pazar';

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
  String get meaning => 'Anlamı';

  @override
  String get metricsHeadline => 'Metrikler';

  @override
  String get metricsTooltip => 'Metrikler';

  @override
  String get milestones => 'Kilometre Taşları';

  @override
  String get missingContent => 'Dosya işlenemiyor (ya iptal edildi)';

  @override
  String get navigationTooltip => 'Ana menüyü açın';

  @override
  String netProfit(Object value) {
    return 'Kâr: $value';
  }

  @override
  String get noChartData => 'Gösterilecek veri eksik (veya yeterli değil)';

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
  String get settingsBaseHeadline => 'Temel Bilgiler';

  @override
  String get settingsHeadline => 'Ayarlar';

  @override
  String get skipFromTotals => 'Toplamlardan hariç tut';

  @override
  String get skipTooltip => 'Adım(lar)ı Atla';

  @override
  String get spent => 'harcandı';

  @override
  String get splitCancelTooltip => 'Ay Başına Bölünmeyi İptal Et';

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
  String get zoomState => 'Yakınlaştırma / Uzaklaştırma';
}
