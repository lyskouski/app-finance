[اللغة العربية (AR)](./about_ar.md) |
[Azərbaycanlı (AZ)](./about_az.md) |
[Тарашкевіца (BE)](./about_be.md) |
[Latsinka (BE)](./about_be_EU.md) |
[简体中文 (ZH-CN)](./about_zh.md) |
繁體中文 (ZH-TW) |
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
[Türk dili (TR)](./about_tr.md) |
[Українська (UK-UA)](./about_uk.md) |
[O'zbek (UZ)](./about_uz.md)

---

**Fingrom** -- 開放原始碼的跨平台財務會計應用程式，沒有 Ads 和限制。
此解決方案的目標是建立一個直覺、有效率且具包容性的財務會計應用程式。
這能讓使用者毫不費力地管理自己的財務，同時確保沒有人落在後面。

[![觀看影片](../images/presentation_en.png)](https://youtu.be/sNTbpILLsOw)

### 功能
- 會計（帳戶類型、貨幣/加密貨幣）
  - 透過`/`符號（在名稱中）對主頁進行簡單的分類
  - 交易記錄
  - 按更新日期凍結金額（匯入之前的歷史記錄）
- 預算類別
  - 主頁面透過 `/`-符號（在名稱中）進行簡單的分類
  - 有限制重述：
    - 每月初更新
    - 每月可設定的限制
    - 與收入的關係 (0.0 ... 1.0)
  - 或透過顯示已花費的金額而無限制
  - 不同的時間線：每週、每月、每年
  - 可自訂的一周和一個月的開始日期
- 帳單、轉帳、收入 (發票)
  - 重複付款（含首頁小工具）
  - 過濾
  - 預算類別假設／預測
- 目標定義
- 匯率、摘要的預設貨幣
- 指標：
  - 預算：
    - 預測 (使用 Monte Carlo 模擬)
    - 每月預算限額和支出
  - 帳戶：
    - 燭形 (OHLC) 圖表
    - 收入健康雷達
    - 貨幣分佈
  - 帳單
    - YTD 支出
    - 分類條賽
  - 目標指標圖
  - 貨幣歷史圖表
- 裝置間同步 (P2P)
- 透過 WebDav 或直接檔案復原
- 從「CSV」、「QIF」、「OFX」檔案匯入帳單和發票
- 匯出到 Excel「XLSX」文件
- 資料加密
- 本地化
- 使用者體驗
  - 可設定主頁（每組寬度 x 高度可設定多種配置）
  - 反應式與適應性設計
    - 自適應導覽面板（頂部、底部、右側）與標籤（頂部、左側）
  - 具有調色板定義的主題模式（深色、淺色、系統）（系統、自訂、個人 - 顏色選擇器）
  - 保留帳戶、預算和貨幣的最後選擇
  - 自動捲動至表格上的焦點元素
  - 在主頁上展開/折疊部分
  - 輕掃可快速存取編輯和刪除動作
  - 透過「設定」放大/縮小 (從 60% 到 200%)
  - 捷徑

| 說明                         | 捷徑                       |
| ---------------------------- | ------------------------- |
| 開啟/關閉導覽抽屜             | `Shift` + `Enter`         |
| 向上導航                      | `向上`                    |
| 向下導覽                      | `下`                      |
| 開啟選取的內容                | `Enter`                   |
| 放大                          | `Ctrl` + `+`              |
| 放大（使用滑鼠）              | `Ctrl` + `向下捲動`         |
| 縮小                          | `Ctrl` + `-`              |
| 縮小 (使用滑鼠)               | `Ctrl` + `上卷`            |
| 重設縮放                      | `Ctrl` + `0`               |
| 新增交易                      | `Ctrl` + `N`               |
| 返回 返回                     | `Ctrl` + `Backspace`       |
<!--
| 編輯選取的項目                | `Ctrl` + `E`               |
| 刪除選取的項目                | `Ctrl` + `D`               |
-->

