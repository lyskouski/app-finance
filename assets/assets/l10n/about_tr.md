[اللغة العربية (AR)](./about_ar.md) |
[Azərbaycanlı (AZ)](./about_az.md) |
[Тарашкевіца (BE)](./about_be.md) |
[Latsinka (BE)](./about_be_EU.md) |
[简体中文 (ZH-CN)](./about_zh.md) |
[繁體中文 (ZH-TW)](./about_zh_TW.md) |
[Čeština (CS)](./about_cs.md) |
[Nederlandse (NL)](./about_nl.md) |
[English (EN-US)](./about_en.md) |
[Français (FR)](./about_fr.md) |
[Deutsch (DE)](./about_de.md) |
[हिंदी (HI-IN)](./about_hi.md) |
[Italiano (IT)](./about_it.md) |
[日本語 (JA)](./about_ja.md) |
[فارسی (FA)](./about_fa.md) |
[한국어 (KO)](./about_ko.md) |
[Polski (PL)](./about_pl.md) |
[Português Europeu (PT)](./about_pt.md) |
[Português Brasileiro (PTB)](./about_pt_BR.md) |
[Limba română (RO)](./about_ro.md) |
[Español (ES)](./about_es.md) |
Türk dili (TR) |
[Українська (UK-UA)](./about_uk.md) |
[O'zbek (UZ)](./about_uz.md)

---

**Fingrom** -- Reklamlar ve sınırlamalar olmadan açık kaynaklı çapraz platform finansal muhasebe uygulaması.
Çözümün amacı sezgisel, verimli ve kapsayıcı bir finansal muhasebe uygulaması oluşturmaktır.
Bu, kullanıcıların mali durumlarını zahmetsizce yönetmelerini sağlarken kimsenin geride kalmamasını sağlar.

[![Videoyu izleyin](../images/presentation_en.png)](https://youtu.be/sNTbpILLsOw)

### İşlevsellik
- Muhasebe (Hesap Türü, Para Birimi/Kripto Para)
  - Ana sayfa için `/` sembolü (isimde) aracılığıyla basit gruplama
  - İşlem günlüğü
  - Güncelleme tarihine göre tutarı dondurma (önceki geçmişi içe aktarmak için)
- Bütçe Kategorileri
  - Ana sayfa için `/` sembolü (isimde) aracılığıyla basit gruplama
  - Limitler yeniden belirlenmiştir:
    - Her ayın başında yenilenir
    - Aylık yapılandırılabilir limitler
    - Gelire Akrabalar (0.0 ... 1.0)
  - Veya harcanan miktarı göstererek sınırlama olmaksızın
  - Farklı zaman çizelgesi: haftalık, aylık, yıllık
  - Haftanın ve ayın özelleştirilebilir başlangıç ​​günü
- Faturalar, Transferler, Gelirler (Faturalar)
  - Yinelenen Ödemeler (ana sayfa widget'ı ile)
  - Filtreleme
  - Bütçe Kategorisi varsayımı / tahmini
- Hedefler Tanım
- Döviz kurları, Özet için Varsayılan Para Birimi
- Metrikler:
  - Bütçe:
    - Tahmin (Monte Carlo simülasyonu ile)
    - Bütçe limiti ve aylık harcamalar
  - Hesap
    - Mum Çubuğu (OHLC) Grafiği
    - Gelir Sağlığı Radarı
    - Para Birimi Dağılımı
  - Faturalar:
    - YTD Giderleri
    - Kategoriler için Bar Yarışı
  - Hedefler Gösterge Tablosu
  - Para Birimi Tarihsel Grafiği
- Cihazlar arasında senkronizasyon (P2P)
- WebDav veya doğrudan bir Dosya aracılığıyla kurtarma
- Faturalar için `CSV`, `QIF`, `OFX` dosyalarından içe aktarma
- Excel `XLSX` dosyasına aktarın
- Veri şifreleme
- Yerelleştirme
- Kullanıcı Deneyimi
  - Yapılandırılabilir Ana Sayfa (`genişlik x yükseklik` seti başına birden fazla yapılandırma)
  - Duyarlı ve Uyarlanabilir Tasarım
    - Uyarlanabilir gezinme paneli (üst, alt, sağ) ve sekmeler (üst, sol)
  - Palet tanımlı Tema Modu (koyu, açık, sistem) (sistem, özel, kişisel -- renk seçici)
  - Hesap, Bütçe ve Para Birimi için son seçimi koru
  - Form üzerinde odaklanılan öğeye otomatik kaydırma
  - Ana Sayfadaki Bölümleri Genişlet / Daralt
  - Düzenle ve Sil eylemlerine hızlı erişim için kaydırın
  - “Ayarlar” aracılığıyla yakınlaştırma/uzaklaştırma (%60'tan %200'e kadar)
  - Kısayollar

| Açıklama                             | Kısayollar                        |
| ------------------------------------ | --------------------------------- |
| Gezinme Çekmecesini Aç / Kapat       | `Shift` + `Enter`                 |
| Yukarı Gezin                         | `yukarı`                          |
| Aşağı Gezin                          | `aşağı`                           |
| Seçili Olanları Aç                   | `Enter`                           |
| Yakınlaştır                          | `Ctrl` + `+`                      |
| Yakınlaştır (fare ile)               | `Ctrl` + `aşağı kaydır`           |
| Uzaklaştır                           | `Ctrl` + `-`                      |
| Uzaklaştır (fare ile)                | `Ctrl` + `yukarı kaydır`          |
| Yakınlaştırmayı Sıfırla              | `Ctrl` + `0`                      |
| Yeni İşlem Ekle                      | `Ctrl` + `N`                      |
| Geri Dön                             | `Ctrl` + `Backspace`              |
<!--
| Seçili Öğeyi Düzenle                 | `Ctrl` + `E`                      |
| Seçili Öğeyi Sil                     | `Ctrl` + `D`                      |
-->
