// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Japanese (`ja`).
class AppLocalizationsJa extends AppLocalizations {
  AppLocalizationsJa([String locale = 'ja']) : super(locale);

  @override
  String get a =>
      'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => 'ご注文について';

  @override
  String get account => 'アカウント';

  @override
  String get accountFrom => 'アカウントから';

  @override
  String get accountHeadline => 'アカウント';

  @override
  String get accountTo => '口座へ';

  @override
  String get accountTooltip => '口座を開く';

  @override
  String get accountType => '口座の種類';

  @override
  String get accountTypeTooltip => '口座タイプを選択';

  @override
  String get acknowledgeTooltip => '承認';

  @override
  String get activate => '口座開設';

  @override
  String get actualData => '履歴データ';

  @override
  String get addAccountTooltip => '勘定科目の追加';

  @override
  String get addBudgetTooltip => '新しい予算カテゴリーを追加する';

  @override
  String get addGoalTooltip => '新しい目標の追加';

  @override
  String get addMainTooltip => '請求書、収入または送金を追加する';

  @override
  String afterNDays(Object value) {
    return '$value日後';
  }

  @override
  String get amountFrom => '開始金額';

  @override
  String get amountTo => '終了金額';

  @override
  String appBuild(Object build) {
    return 'ビルドする $build';
  }

  @override
  String get appInitHeadline => 'プロジェクトの初期化';

  @override
  String get appStartHeadline => '初期設定';

  @override
  String get appTitle => 'フィングロム';

  @override
  String appVersion(Object version) {
    return 'バージョン $version';
  }

  @override
  String get automationHeadline => 'オートメーション';

  @override
  String get automationTypeDays => '何日かして';

  @override
  String get backTooltip => '戻る';

  @override
  String get balance => '実際の残高';

  @override
  String get balanceDate => '残高更新日';

  @override
  String get balanceDateTooltip => 'この日付以前の成果および収入は残高に影響しません。';

  @override
  String get balanceTooltip => '残高の設定';

  @override
  String get bankAccount => '銀行口座';

  @override
  String get bill => '請求書';

  @override
  String get billHeadline => '請求書';

  @override
  String get billSetTooltip => '設定金額';

  @override
  String billSum(Object value) {
    return '手形 $value';
  }

  @override
  String get billTooltip => '手形を開く';

  @override
  String get billTypeTooltip => '[タイプ] 請求書、収入または譲渡';

  @override
  String get brightnessTheme => '明るさのテーマ';

  @override
  String get btnAdd => '追加';

  @override
  String get btnCancel => 'キャンセル';

  @override
  String get btnConfirm => '確認する';

  @override
  String get btnMore => 'その他';

  @override
  String get budget => '予算カテゴリー';

  @override
  String get budgetHeadline => '予算';

  @override
  String get budgetLimit => '月間限度額';

  @override
  String get budgetLimitHeadline => '限度額の調整';

  @override
  String get budgetPositive => '予算、サマリーハンドラー';

  @override
  String get budgetPositiveOff => '負の値を無視する';

  @override
  String get budgetPositiveOn => '負の値を含める';

  @override
  String get budgetRelativeLimit => '月ごとの相対係数';

  @override
  String get budgetTooltip => 'オープン予算タイプ';

  @override
  String get budgetType => '予算作成間隔';

  @override
  String get budgetTypeAsIs => '無制限';

  @override
  String get budgetTypeFixed => '固定';

  @override
  String get budgetTypeMonth => '毎月';

  @override
  String get budgetTypeRelative => '相対';

  @override
  String get budgetTypeWeek => '週間';

  @override
  String get budgetTypeYear => '年間';

  @override
  String get cash => '現金';

  @override
  String get chartBarRace => 'カテゴリー別バーレース';

  @override
  String get chartForecast => '予想チャート';

  @override
  String get chartOHLC => 'ローソク足（OHLC）チャート';

  @override
  String get chartYtdExpense => '累計支出';

  @override
  String get clear => 'ドロップ値';

  @override
  String get closeTooltip => '終値';

  @override
  String get closedAt => '終了日';

  @override
  String get cmpChart => 'ダイアグラム';

  @override
  String get cmpRecent => '最近の項目';

  @override
  String get cmpRecentCount => 'リストサイズ';

  @override
  String get coAuthor => '著者';

  @override
  String get coConsult => 'アドバイザー';

  @override
  String get coDeveloper => '開発者';

  @override
  String get coNew => '参加';

  @override
  String get coPromoter => 'プロモーター';

  @override
  String get coTranslator => '翻訳者';

  @override
  String get coef => '係数';

  @override
  String get collapse => '折りたたみ（復元）セクション';

  @override
  String get color => 'カラー';

  @override
  String get colorApp => 'カスタム';

  @override
  String get colorBackground => '背景色';

  @override
  String get colorDark => '暗い';

  @override
  String get colorInversePrimary => 'インバースプライマリ';

  @override
  String get colorInverseSurface => '逆サーフェス';

  @override
  String get colorLight => 'ライト';

  @override
  String get colorOnInverseSurface => '逆サーフェス上';

  @override
  String get colorOnSecondary => 'セカンダリー上';

  @override
  String get colorOnSecondaryContainer => 'オンコンテナ';

  @override
  String get colorPrimary => 'プライマリ';

  @override
  String get colorRestore => 'リセットパレット';

  @override
  String get colorSecondary => 'セカンダリ';

  @override
  String get colorSystem => 'デフォルト';

  @override
  String get colorTheme => 'パレット';

  @override
  String get colorTooltip => '色の選択';

  @override
  String get colorType => 'カラータイプ';

  @override
  String get colorUser => 'パーソナル';

  @override
  String columnMap(Object value) {
    return 'カラム\'$value\'のマッピング';
  }

  @override
  String columnMapTooltip(Object value) {
    return '\'$value\' - 列マッピングの選択';
  }

  @override
  String get completeGoalTooltip => 'ゴールを完了する';

  @override
  String get confirmHeader => 'アクションの確認';

  @override
  String get confirmTooltip => 'よろしいですか？このアクションは元に戻せません。';

  @override
  String get contributors => '貢献者';

  @override
  String get conversion => '変換';

  @override
  String conversionMessage(Object currency) {
    return '$currency で換算';
  }

  @override
  String get copiedToClipboard => 'クリップボードにコピーされました';

  @override
  String get createAccountHeader => '新規アカウント作成';

  @override
  String get createAccountTooltip => '新しい口座を作成する';

  @override
  String get createBillHeader => '新規取引の作成';

  @override
  String get createBillTooltip => '新しい請求書の追加';

  @override
  String get createBudgetHeader => '新しい予算カテゴリー';

  @override
  String get createBudgetTooltip => '新しい予算カテゴリーを作成する';

  @override
  String get createGoalHeader => '目標の作成';

  @override
  String get createGoalTooltip => '新しい目標を追加する';

  @override
  String get createIncomeTooltip => '新しい収入を追加する';

  @override
  String get createPaymentTooltip => '新規支払の追加';

  @override
  String get createTransferTooltip => '譲渡';

  @override
  String get credit => 'クレジット';

  @override
  String get creditCard => 'クレジットカード';

  @override
  String get currency => '通貨';

  @override
  String get currencyAddHeadline => '両替';

  @override
  String get currencyAddTooltip => '為替レートを追加する';

  @override
  String get currencyDefault => 'デフォルト通貨';

  @override
  String get currencyDistribution => '配布';

  @override
  String currencyExchange(Object from, Object to) {
    return '通貨交換： $from → $to';
  }

  @override
  String get currencyHeadline => '通貨';

  @override
  String currencyIn(Object value) {
    return 'で $value';
  }

  @override
  String get currencyShort => '通貨';

  @override
  String get currencyTooltip => '通貨の種類（コード）';

  @override
  String get currencyUpdateTooltip => '通貨レートの更新';

  @override
  String get currentDate => '現在の日付ポインタ';

  @override
  String get customAddTooltip => 'ウィジェットの追加';

  @override
  String get customDeleteTooltip => 'カスタマイズの削除';

  @override
  String get customSaveTooltip => 'カスタマイズの保存';

  @override
  String get customizeTooltip => 'ページのカスタマイズ';

  @override
  String get darkMode => '暗い';

  @override
  String get dateFormat => '日付フォーマット';

  @override
  String get dateRange => '日付範囲';

  @override
  String get dateTooltip => '日付選択';

  @override
  String get dayMonday => '月曜日';

  @override
  String get daySaturday => '土曜日';

  @override
  String get dayStartOfMonth => '月初';

  @override
  String get dayStartOfWeek => '週の始まり';

  @override
  String get daySunday => '日曜日';

  @override
  String get deactivateAction => 'パスワード保護を無効化します';

  @override
  String get debitCard => 'デビットカード';

  @override
  String def(Object value) {
    return '$value\'のデフォルト値';
  }

  @override
  String get deleteAccountTooltip => '口座の無効化';

  @override
  String get deleteBillTooltip => '請求書の削除';

  @override
  String get deleteBudgetTooltip => '予算カテゴリの無効化';

  @override
  String get deleteGoalTooltip => '目標の削除';

  @override
  String get deleteInvoiceTooltip => '請求書の削除';

  @override
  String get deletePaymentTooltip => '支払い削除';

  @override
  String get deleteTooltip => '削除';

  @override
  String get deleteTransferTooltip => '削除';

  @override
  String get deposit => '入金';

  @override
  String get description => '削除';

  @override
  String get descriptionTooltip => '経費の詳細設定';

  @override
  String get design => 'デザインモード（文化別）';

  @override
  String get designAsiaGeneral => 'アジア全般';

  @override
  String get designGermany => 'ドイツ';

  @override
  String get designGlobal => 'グローバル';

  @override
  String get designRtlGeneral => '右から左へのレタリング';

  @override
  String get details => '詳細';

  @override
  String get detailsTooltip => '****2345 - 番号の下4桁';

  @override
  String get dtAm => '午前';

  @override
  String get dtAmPm => '午前/午後で時間 (0~11)';

  @override
  String get dtDay => '日（月';

  @override
  String get dtEscape => 'テキストのエスケープ';

  @override
  String get dtHalfHour => 'am/pmの時 (1~12)';

  @override
  String get dtHour => '日の時 (0~23)';

  @override
  String get dtMinute => '分（時';

  @override
  String get dtMonth => '月（年';

  @override
  String get dtNamedDay => '曜日';

  @override
  String get dtPm => '午後';

  @override
  String get dtQuote => 'シングルクォート';

  @override
  String get dtSecond => '分';

  @override
  String get dtYear => '?';

  @override
  String get editAccountHeader => 'アカウント更新';

  @override
  String get editAccountTooltip => 'アカウント編集';

  @override
  String get editBillHeader => '請求書の更新';

  @override
  String get editBillTooltip => '請求書の編集';

  @override
  String get editBudgetHeader => '予算カテゴリーの更新';

  @override
  String get editBudgetTooltip => '予算カテゴリーの編集';

  @override
  String get editGoalHeader => '目標の更新';

  @override
  String get editGoalTooltip => '目標の編集';

  @override
  String get editInvoiceTooltip => '請求書の編集';

  @override
  String get editPaymentTooltip => 'お支払いの編集';

  @override
  String get editTooltip => '編集';

  @override
  String get editTransferTooltip => '転送編集';

  @override
  String get enableBankingAppId => 'アプリケーションID';

  @override
  String get enableBankingBank => '銀行';

  @override
  String get enableBankingCode => '認可後に開いたページのアドレス';

  @override
  String get enableBankingCodeTooltip =>
      '銀行でアクセスを承認した後、ブラウザーのアドレスをコピーしてここに貼り付けてください';

  @override
  String get enableBankingCountry => '国（ISOコード、例: DE）';

  @override
  String get enableBankingDescription =>
      'enablebanking.com に登録した独自のアプリケーションを使い、Enable Banking API（PSD2）経由でヨーロッパの銀行から残高と取引をインポートします。アクセスは読み取り専用で、支払いは行われません。';

  @override
  String get enableBankingHeadline => 'Enable Banking (EU)';

  @override
  String get enableBankingIncomplete => 'アプリケーションID、秘密鍵、リダイレクトURL、国を入力してください';

  @override
  String get enableBankingKey => '秘密鍵（PEM）';

  @override
  String get enableBankingKeyInvalid => '無効な秘密鍵: PEM ブロック「PRIVATE KEY」が必要です';

  @override
  String get enableBankingKeyNotRsa => '無効な秘密鍵: RSA 鍵が必要です';

  @override
  String get enableBankingKeyTooltip =>
      'Enable Banking Control Panel でアプリケーションと共に作成され、暗号化して保存されます。保存済みの鍵を使う場合は空欄のままにしてください';

  @override
  String get enableBankingLoadBanks => '銀行を読み込む';

  @override
  String get enableBankingNoAuthPage => 'Enable Banking から認可ページが返されませんでした';

  @override
  String get enableBankingNoCode => 'アドレスに認可コードが見つかりません';

  @override
  String get enableBankingRedirect => 'リダイレクトURL';

  @override
  String get enableBankingRedirectTooltip => 'アプリケーションに登録済みのURL。認可後、銀行はここに戻ります';

  @override
  String get enableBankingStateMismatch => 'このアドレスは別の認可のものです。もう一度接続してください';

  @override
  String get encryptionMode => 'データ暗号化';

  @override
  String error(Object value) {
    return 'エラー：$value';
  }

  @override
  String get errorExpired => 'カード有効期限切れ';

  @override
  String get errorNegative => '否定できません！エラーを修正してください';

  @override
  String get example => '例';

  @override
  String get expand => 'セクションを展開';

  @override
  String get expense => '請求金額';

  @override
  String get expenseDateTime => '請求額';

  @override
  String get expenseHeadline => '経費';

  @override
  String get expenseTransfer => '振込金額';

  @override
  String exportFile(Object value) {
    return '.$value-ファイルとしてエクスポート';
  }

  @override
  String get failData => '控除額';

  @override
  String get finTsApproved => '銀行アプリで承認済み';

  @override
  String get finTsBankCode => '銀行コード (BLZ)';

  @override
  String get finTsCustomerId => '顧客ID（ユーザーIDと異なる場合）';

  @override
  String get finTsDescription =>
      'FinTS 4.1（PIN/TAN）対応の銀行から残高と取引をインポートします。アクセスは読み取り専用で、支払いは行われません。';

  @override
  String get finTsHeadline => 'Financial Transaction Services (FinTS 4.1)';

  @override
  String get finTsIncomplete => 'サーバーURL、銀行コード、ユーザーID、製品登録番号を入力してください';

  @override
  String finTsLoginChanged(Object value) {
    return '銀行がログイン情報を変更しました。ユーザーIDまたは顧客IDを更新してください: $value';
  }

  @override
  String finTsLoginRefused(Object value) {
    return '銀行が前回のログインを拒否しました: $value。入力したPINで再試行しますか？';
  }

  @override
  String get finTsPin => 'PIN';

  @override
  String get finTsPinHint => 'このセッションでのみ使用され、保存されることはありません';

  @override
  String get finTsProductId => '製品登録番号';

  @override
  String get finTsProductIdTooltip =>
      'Deutsche Kreditwirtschaft がアプリの開発元に発行します';

  @override
  String get finTsTan => 'TAN';

  @override
  String get finTsTanHeadline => '取引認証 (TAN)';

  @override
  String get finTsTanMedium => 'TANメディアを選択';

  @override
  String get finTsTanMethod => 'TAN方式を選択';

  @override
  String get finTsUrl => '銀行のFinTSサーバーURL';

  @override
  String get finTsUserId => 'ユーザーID（ログイン）';

  @override
  String get finTsVersion => 'プロトコルバージョン';

  @override
  String get finTsWebUnsupported =>
      '銀行のサーバーはブラウザーからのアクセスを許可していません。デスクトップ版またはモバイル版アプリを使用してください。';

  @override
  String get flowTypeInvoice => '請求書';

  @override
  String get flowTypeTooltip => '金額の種類 請求書';

  @override
  String get forecastData => '予想';

  @override
  String get from => 'から';

  @override
  String get goNextTooltip => '次へ';

  @override
  String get goalHeadline => '目標';

  @override
  String goalProfit(Object value) {
    return '目標値：$value';
  }

  @override
  String get goalProfitTooltip => '利益対目標';

  @override
  String get goalTooltip => 'オープン目標';

  @override
  String get hasEncrypted => '一度設定すると変更できません';

  @override
  String get helpTooltip => '[ヘルプ] そのページの説明を表示する';

  @override
  String get homeHeadline => 'ホーム';

  @override
  String get homeTooltip => 'メインページに戻る';

  @override
  String get hour => '時間';

  @override
  String get icon => 'アイコン';

  @override
  String get iconTooltip => 'アイコンを選択';

  @override
  String get ignoreTooltip => '無視する';

  @override
  String get importHeadline => '輸出入';

  @override
  String get income => '収入金額';

  @override
  String get incomeHeadline => '収入';

  @override
  String get incomeHealth => '所得健康レーダー';

  @override
  String get incomeTooltip => '収入の詳細設定';

  @override
  String get integrationAccessDenied => 'アクセスが取り消されたか、認証情報が正しくありません';

  @override
  String get integrationConnect => '接続';

  @override
  String get integrationDateFrom => '取引のインポート開始日';

  @override
  String get integrationDefaultBudgetCategory => 'デフォルトの予算カテゴリ';

  @override
  String get integrationDisconnect => '切断';

  @override
  String get integrationForget => 'アクセスを削除';

  @override
  String get integrationHeadline => '連携';

  @override
  String integrationHttpError(Object value) {
    return 'サービスがエラーを返しました（HTTP $value）';
  }

  @override
  String get integrationHttpsRequired => '安全なアドレス（HTTPS）のみ使用できます';

  @override
  String get integrationImport => '取引をインポート';

  @override
  String integrationImported(Object added, Object pending, Object skipped) {
    return 'インポート済み: $added、既存のためスキップ: $skipped、保留中（未インポート）: $pending';
  }

  @override
  String integrationInvalidAmount(Object value) {
    return '無効な金額: $value';
  }

  @override
  String get integrationNoAccounts => '銀行から口座が提供されませんでした';

  @override
  String get integrationPaymentRequired => 'サービスへのアクセスには支払いが必要です';

  @override
  String get integrationSelectTarget => 'インポート先の口座と予算カテゴリを選択してください';

  @override
  String integrationServiceError(Object value) {
    return 'サービスからのメッセージ: $value';
  }

  @override
  String get integrationUnexpectedResponse => 'サービスからの予期しない応答';

  @override
  String get investecApiKey => 'API キー';

  @override
  String get investecClientId => 'クライアント ID';

  @override
  String get investecCredentialsTooltip =>
      'Investec Online の Investec Developer → API keys で作成します。暗号化して保存されます';

  @override
  String get investecDescription =>
      '独自の API キーを使い、Programmable Banking API 経由で Investec Private Banking 口座（南アフリカ）の残高と取引をインポートします。アクセスは読み取り専用で、支払いは行われません。';

  @override
  String get investecHeadline => 'Investec Programmable Banking（南アフリカ）';

  @override
  String get investecIncomplete => 'クライアント ID、シークレット、API キーを入力してください';

  @override
  String get investecSandbox => 'サンドボックス（テストデータ）';

  @override
  String get investecSecret => 'シークレット';

  @override
  String get investecSteps =>
      'API キーの取得方法:\n1. Investec Online にログインし、Investec Developer（Programmable Banking）に登録します\n2. API keys を開き、口座と取引へのアクセス権を持つキーを作成します\n3. 2 段階認証で確認し、クライアント ID、シークレット、API キーをコピーします\n4. 下に貼り付けて「接続」を押します';

  @override
  String get invoiceHeadline => '請求書';

  @override
  String invoiceSum(Object value) {
    return '請求書 $value';
  }

  @override
  String get isCleaned => '既存のデータを削除する';

  @override
  String get isCreated => 'すでに作成されています！';

  @override
  String get isEncrypted => 'ファイルは暗号化されています（デフォルト）';

  @override
  String get isRequired => '必須';

  @override
  String get language => '言語';

  @override
  String get left => '左';

  @override
  String get lightMode => 'ライト';

  @override
  String get link => 'ユニフォーム・リソース・ロケーター（URL）';

  @override
  String get managerHeadline => 'マネージャー';

  @override
  String get meaning => '意味';

  @override
  String get metricsHeadline => 'メトリクス';

  @override
  String get metricsTooltip => '指標';

  @override
  String get milestones => 'マイルストーン';

  @override
  String get minute => '分';

  @override
  String get missingContent => 'ファイルが処理できない（キャンセルされた）';

  @override
  String get monobankCreateAccount => '口座を作成';

  @override
  String get monobankDescription =>
      '個人トークンで monobank のカードと貯金箱（バンカ）の残高と取引をインポートします。monobank は 1 分間に 1 回のリクエストのみ許可するため、長い期間のインポートには数分かかります。読み取り専用アクセス：支払いは行われません。';

  @override
  String get monobankHeadline => 'monobank Personal API（ウクライナ）';

  @override
  String get monobankJar => '貯金箱';

  @override
  String monobankProgress(Object done, Object total) {
    return '明細を取得中：$done / $total';
  }

  @override
  String monobankRateLimit(Object value) {
    return 'monobank は 1 分間に 1 回のリクエストのみ許可：次は $value 秒後';
  }

  @override
  String get monobankToken => '個人トークン';

  @override
  String get monobankTokenSteps =>
      '個人トークンの取得方法：\n1. ブラウザで api.monobank.ua を開く\n2. monobank アプリで QR コードをスキャンしてアクセスを承認\n3. ページからトークンをコピー\n4. 下に貼り付けて「接続」を押す\n5. 各カードまたは貯金箱を口座に紐付け（または作成）してインポート';

  @override
  String get monobankTokenTooltip =>
      'monobank アプリで QR コードをスキャンすると api.monobank.ua で発行されます。暗号化して保存されます';

  @override
  String get monzoApprove => 'Monzo アプリでアクセスを承認してから、もう一度「接続」を押してください';

  @override
  String get monzoClientId => 'クライアント ID';

  @override
  String get monzoClientSecret => 'クライアントシークレット';

  @override
  String get monzoClientSecretTooltip =>
      'developers.monzo.com の OAuth クライアントに表示され、暗号化して保存されます。保存済みのシークレットを使う場合は空欄のままにしてください';

  @override
  String get monzoCode => 'サインイン後に開いたページのアドレス';

  @override
  String get monzoCodeTooltip =>
      'Fingrom が自動的に開かなかった場合は、ブラウザーのアドレスをコピーしてここに貼り付けてください';

  @override
  String get monzoDescription =>
      'developers.monzo.com に登録した独自の OAuth クライアントで Monzo 口座の残高と取引をインポートします（個人利用のみ）。アクセスは読み取り専用で、支払いは行われません。';

  @override
  String get monzoExpired => 'Monzo へのアクセスの有効期限が切れました。もう一度接続してください';

  @override
  String monzoFullHistory(Object value) {
    return '$value まで全履歴を取得できます。より前の日付を選んで今すぐインポートしてください。その後、Monzo は直近 90 日分のみ提供します';
  }

  @override
  String get monzoHeadline => 'Monzo Developer API（英国）';

  @override
  String monzoHistoryLimited(Object value) {
    return 'Monzo は直近 90 日分のみ提供します。取引は $value からインポートされます';
  }

  @override
  String get monzoIncomplete => 'クライアント ID、クライアントシークレット、リダイレクトURLを入力してください';

  @override
  String get monzoRedirect => 'リダイレクトURL';

  @override
  String get monzoRedirectTooltip =>
      'OAuth クライアントにこのアドレスをそのまま設定してください。サインイン後、Monzo はここに戻ります';

  @override
  String get monzoSteps =>
      '接続方法:\n1. Monzo アカウントのメールアドレスで developers.monzo.com にサインインします\n2. Clients → New OAuth Client を開き、「Confidential」を選んで、下に表示されたリダイレクトURLを設定します\n3. クライアント ID とクライアントシークレットをコピーして下に貼り付け、「接続」を押します\n4. メールで届いたリンクを開き、Monzo アプリでアクセスを承認して、もう一度「接続」を押します\n5. すぐにインポートしてください: 全履歴は承認後 5 分間のみ取得でき、その後は直近 90 日分のみです';

  @override
  String get navigationTooltip => 'メインメニューを開く';

  @override
  String netProfit(Object value) {
    return '利益：$value';
  }

  @override
  String get noChartData => '表示するデータがない（または十分でない）。';

  @override
  String get notificationAccessSettings => '通知へのアクセス';

  @override
  String get notificationAccessSteps =>
      'アクセスを許可する方法：\n1.「アクセスを許可」を押してシステム設定を開きます\n2. Fingrom に通知の読み取りを許可します\n3. Android が制限付き設定と表示した場合：Fingrom のアプリ情報 → ⋮ →「制限付き設定を許可」を開き、再試行します\n4. Fingrom に戻り、通知を読み取るアプリを選択します';

  @override
  String get notificationAccounts => '口座キーワード';

  @override
  String get notificationAccountsTooltip =>
      '通知内で口座を識別する語句（カード番号の末尾、ウォレット名）：語句を入力し、Enterキーで追加します。該当しない場合はアプリの既定の口座が使われます';

  @override
  String get notificationApps => '通知を読み取るアプリ';

  @override
  String notificationAutoImported(Object value) {
    return '通知から追加：$value';
  }

  @override
  String get notificationAutoTooltip =>
      '認識された通知は確認なしで追加されます：Fingrom の実行中は即時、それ以外は次回起動時。認識されない通知は確認待ちになります';

  @override
  String get notificationBalance => '残高キーワード';

  @override
  String get notificationBalanceTooltip =>
      '無視する金額（残高、限度額）の前に置かれる語句：語句を入力し、Enterキーで追加します';

  @override
  String notificationCaptured(Object value) {
    return '取得した通知：$value';
  }

  @override
  String get notificationClear => '取得済みを消去';

  @override
  String get notificationCurrencyTooltip => '通貨のない金額（例：引落 20.00）はこの通貨として扱われます';

  @override
  String get notificationDefaultAccount => '既定の口座';

  @override
  String get notificationDescription =>
      'この端末の銀行・決済アプリの通知から取引を作成します。選択したアプリの通知のみが読み取られ、インポートされるまで端末に保存されます。金額と通貨は自動で認識されます。';

  @override
  String get notificationGrant => 'アクセスを許可';

  @override
  String get notificationIncome => '収入キーワード';

  @override
  String get notificationIncomeTooltip => '通知を収入として判定する語句：語句を入力し、Enterキーで追加します';

  @override
  String get notificationMerchant => '加盟店ラベル';

  @override
  String get notificationMerchantTooltip =>
      'コロンと加盟店名が続く語（場所: 店舗）：語を入力し Enter キーで追加します';

  @override
  String get notificationNoApps => 'まだ通知を受信していません：アプリは通知を送信した後にここに表示されます';

  @override
  String get notificationUnparsed => '認識できません';

  @override
  String get notifyHeadline => '通知パーサー';

  @override
  String get ok => 'よし';

  @override
  String get orderPin => '優先順位';

  @override
  String get orderUnpin => '一般化された順序';

  @override
  String get outputFile => 'ファイルの保存先';

  @override
  String get parseFile => 'ファイルを解析';

  @override
  String get password => 'パスワード';

  @override
  String get path => 'ファイル名（保存先、読み込み元）';

  @override
  String get paymentType => '支払い間隔';

  @override
  String get paymentsHeadline => '定期的な支払い';

  @override
  String get pearDisabled => '無効';

  @override
  String get pearLoading => '進行中';

  @override
  String get peerAccept => '受け付ける';

  @override
  String get peerAction => 'アクション';

  @override
  String get peerClosed => '終了';

  @override
  String get peerConnect => 'デバイスの接続';

  @override
  String get peerConnectBtn => '接続';

  @override
  String get peerDelete => '削除';

  @override
  String get peerDevice => '接続デバイス';

  @override
  String get peerId => '接続用デバイス識別子';

  @override
  String get peerOffline => 'オフライン';

  @override
  String get peerOnline => '接続中';

  @override
  String get peerOtherId => '接続デバイス識別子';

  @override
  String get peerPending => '保留中';

  @override
  String get peerPing => 'ピング';

  @override
  String get peerSent => '接続機器にデータ転送中';

  @override
  String get peerStatus => 'ステータス';

  @override
  String get peerSync => 'データ転送';

  @override
  String pickFile(Object value) {
    return 'ピック.$value-ファイル';
  }

  @override
  String pongStatus(Object uuid) {
    return '$uuid からのリクエストを受信';
  }

  @override
  String get privatBankAdd => '口座を追加';

  @override
  String get privatBankDescription =>
      'Autoclientトークンを使用して、Privat24 for Businessの法人口座（個人事業主および企業）の残高と取引をインポートします。個人口座はAPIでサポートされていません。アクセスは読み取り専用で、支払いは行われません。';

  @override
  String get privatBankHeadline => 'PrivatBank Autoclient（ウクライナ）';

  @override
  String get privatBankIban => '口座のIBAN';

  @override
  String get privatBankIbanInvalid => 'ウクライナのIBANを入力してください：UAに続く27桁の数字';

  @override
  String get privatBankIbanTooltip => 'APIは口座の一覧を提供しません：口座のIBANを1つずつ追加してください';

  @override
  String privatBankNotReady(Object value) {
    return 'PrivatBankが明細を準備中です（フェーズ $value）：数分後に再試行してください';
  }

  @override
  String get privatBankRemove => '口座を削除';

  @override
  String get privatBankToken => 'Autoclientトークン';

  @override
  String get privatBankTokenSteps =>
      'Autoclientトークンの取得方法：\n1. Privat24 for Businessにサインインします\n2. 「連携（Autoclient）」を開きます\n3. 有効にしてトークンをコピーします\n4. 下に貼り付けて「接続」を押します\n5. インポートする口座のIBANを追加します';

  @override
  String get privatBankTokenTooltip =>
      'Privat24 for Businessの「連携（Autoclient）」で発行されます。暗号化して保存されます';

  @override
  String get processIsFinished => '終了しました！';

  @override
  String progress(Object value) {
    return '進捗状況 $value%';
  }

  @override
  String get raiseData => '金額追加';

  @override
  String get recoveryHeadline => '回復';

  @override
  String get recoveryTooltip => '回復元';

  @override
  String get releases => 'リリース';

  @override
  String get reset => 'リセット';

  @override
  String get returnBack => '戻る';

  @override
  String get roadmap => 'ロードマップ';

  @override
  String get saveNotification => '変更を保存';

  @override
  String get saveSettingsTooltip => '??';

  @override
  String get saveTooltip => '保存先';

  @override
  String search(Object value) {
    return '\'$value\' 」パターンで表示';
  }

  @override
  String get searchTooltip => '検索';

  @override
  String get secureBioNotMatch => '認証に失敗しました！もう一度お試しください';

  @override
  String get secureBioPromptReason => '続行するには認証してください';

  @override
  String get secureBioPromptTitle => '生体認証';

  @override
  String get secureOtpCode => 'ワンタイムパスワードコード';

  @override
  String get secureOtpCodeInvalid => '無効なコードです！新しいコードを取得して入力してください';

  @override
  String get secureOtpDeactivated => 'パスワード保護は無効化されています';

  @override
  String get securePassword => 'パスワード（回復フレーズ）';

  @override
  String get securePasswordEmpty => 'パスワードは空欄にできません！';

  @override
  String get securePasswordNotMatch => 'パスワードが一致しません！';

  @override
  String get securePasswordRepeat => 'パスワードの再入力';

  @override
  String get securityHeadline => 'セキュリティ';

  @override
  String get settingsBaseHeadline => '基本設定';

  @override
  String get settingsHeadline => '設定';

  @override
  String get settingsSaved => '設定が保存されました！';

  @override
  String get simpleFinDescription =>
      'SimpleFIN Bridge を通じて米国の銀行やカード発行会社から残高と取引をインポートします。アクセスは読み取り専用で、支払いは行われません。';

  @override
  String get simpleFinHeadline => 'SimpleFIN Bridge (US)';

  @override
  String get simpleFinNoCredentials =>
      'SimpleFIN Bridge が認証情報のないアクセスアドレスを返しました';

  @override
  String get simpleFinToken => 'SimpleFIN セットアップトークン';

  @override
  String get simpleFinTokenClaimed => 'セットアップトークンが存在しないか、既に使用されています';

  @override
  String get simpleFinTokenInvalid => '無効な SimpleFIN セットアップトークン';

  @override
  String get simpleFinTokenTooltip =>
      'このアプリ用に SimpleFIN Bridge（例: bridge.simplefin.org）で作成します。使用できるのは1回のみです';

  @override
  String get skipFromTotals => '合計から除外する';

  @override
  String get skipTooltip => 'ステップをスキップする';

  @override
  String get sortTooltip => 'アイテムを並べ替える';

  @override
  String get sortingAmountAsc => '金額（昇順）';

  @override
  String get sortingAmountDesc => '金額（降順）';

  @override
  String get sortingCreatedAtAsc => '作成日（昇順）';

  @override
  String get sortingCreatedAtDesc => '作成日（降順）';

  @override
  String get sortingTitleAsc => 'タイトル（昇順）';

  @override
  String get sortingTitleDesc => 'タイトル（降順）';

  @override
  String get sortingUpdatedAtAsc => '更新日（昇順）';

  @override
  String get sortingUpdatedAtDesc => '更新日（降順）';

  @override
  String get spent => '使用済み';

  @override
  String get splitCancelTooltip => '月ごとの分割を取り消す';

  @override
  String get splitHeadline => '請求書を分割する';

  @override
  String get splitTooltip => '月ごとの制限を宣言する';

  @override
  String get subscription =>
      'オープンソースプロジェクトであるため、購読することで追加機能がアンロックされることはありません。しかし、アプリケーションの継続的な進化と改善、そして可用性を維持するための投資となります。';

  @override
  String get subscriptionCoffee => 'コーヒーを買う';

  @override
  String get subscriptionDinner => '夕食をご馳走する';

  @override
  String get subscriptionDonorbox => 'Donorbox 経由で購読する';

  @override
  String get subscriptionGithub => 'GitHub 経由で申し込む';

  @override
  String get subscriptionHeadline => 'スポンサーシップ';

  @override
  String get subscriptionInactive => '購入サービス利用不可';

  @override
  String get subscriptionPatreon => 'Patreon 経由で購読する';

  @override
  String get subscriptionPaypal => 'コーヒーを買う (PayPal)';

  @override
  String get subscriptionTiny => '幸運のコインを贈る';

  @override
  String get subscriptionTooltip => 'サポート（スポンサーシップ）';

  @override
  String get success => '成功する';

  @override
  String get summary => '概要';

  @override
  String get symbol => 'シンボル';

  @override
  String get syncHeadline => '同期デバイス';

  @override
  String get systemMode => 'システム';

  @override
  String get tapToOpen => 'タップして開く';

  @override
  String get targetAmount => '目標金額';

  @override
  String get tellerAccessToken => 'アクセストークン';

  @override
  String get tellerAccessTokenTooltip =>
      '銀行の連携後に接続ページに表示されます。Fingrom が自動的に開かなかった場合はここに貼り付けてください';

  @override
  String get tellerAppId => 'アプリケーションID';

  @override
  String get tellerAppIdTooltip => 'Teller Dashboard に表示され、「app_」で始まります';

  @override
  String get tellerCertificate => '証明書（PEM）';

  @override
  String get tellerCertificateInvalid => '無効な証明書: PEM ブロック「CERTIFICATE」が必要です';

  @override
  String get tellerCertificateTooltip =>
      'Teller Dashboard（Certificates）で発行され、暗号化して保存されます。保存済みの証明書を使う場合は空欄のままにしてください';

  @override
  String get tellerConnectBank => '銀行を接続';

  @override
  String get tellerConnectPage => '接続ページ';

  @override
  String get tellerConnectPageTooltip =>
      'ブラウザで Teller Connect を開き、アクセストークンを Fingrom に返します';

  @override
  String get tellerDescription =>
      'teller.io に登録した独自のアプリケーションを使い、Teller を通じて米国の銀行やカード発行会社から残高と取引をインポートします（無料プランでは 100 件の実際の銀行接続が可能）。アクセスは読み取り専用で、支払いは行われません。';

  @override
  String get tellerDisconnected =>
      '銀行との接続に対応が必要です（新しいログインや確認コードなど）。銀行を再度接続してください';

  @override
  String get tellerEnvironment => '環境';

  @override
  String get tellerHeadline => 'Teller (US)';

  @override
  String get tellerIncomplete => 'アプリケーションIDを入力してください。実際の銀行データには証明書と秘密鍵が必要です';

  @override
  String get tellerKey => '秘密鍵（PEM）';

  @override
  String get tellerKeyInvalid => '無効な秘密鍵: PEM ブロック「PRIVATE KEY」が必要です';

  @override
  String get tellerKeyTooltip =>
      '証明書と一緒にダウンロードされ、暗号化して保存されます。保存済みの鍵を使う場合は空欄のままにしてください';

  @override
  String get tellerMissingCertificate =>
      'クライアント証明書がないため Teller がリクエストを拒否しました。証明書と秘密鍵をアップロードするか、sandbox を選択してください';

  @override
  String get tellerSteps =>
      '接続方法:\n1. teller.io に登録し、Teller Dashboard を開きます\n2. アプリケーションIDをコピーし、秘密鍵付きの証明書を作成してダウンロードします（Certificates）\n3. 下に入力し、環境を選択します（sandbox: テストデータ、銀行には \"username\" と \"password\" でログイン）\n4. 「銀行を接続」を押し、開いたページで銀行にログインします\n5. 口座と予算カテゴリを選択し、「取引をインポート」を押します';

  @override
  String get tellerUpload => 'ファイルをアップロード';

  @override
  String get termPrivacy => 'プライバシーポリシー';

  @override
  String get termUse => '利用規約';

  @override
  String get title => 'タイトル';

  @override
  String get titleAccountTooltip => 'アカウント識別子を入力';

  @override
  String get titleBudgetTooltip => '予算カテゴリー名を入力';

  @override
  String get titleGoal => '目標';

  @override
  String get titleGoalTooltip => '目標の説明';

  @override
  String get to => '合計';

  @override
  String get total => '合計';

  @override
  String get transactionFile => 'Fingrom 取引ログファイル（.log）';

  @override
  String get transferHeadline => '転送';

  @override
  String get transferTooltip => '転送の詳細を設定';

  @override
  String get transfersHeadline => '移籍';

  @override
  String get typeButton => 'ボタン';

  @override
  String get updateAccountTooltip => 'アカウントの更新';

  @override
  String get updateBillTooltip => '請求書の更新';

  @override
  String get updateBudgetTooltip => '予算カテゴリーの更新';

  @override
  String get updateGoalTooltip => '目標の更新';

  @override
  String get updatePaymentTooltip => '更新支払';

  @override
  String get username => 'ユーザー名（アカウント）';

  @override
  String get uuid => '一意の取引識別子';

  @override
  String get validTillDate => '有効期限';

  @override
  String get webDav => 'Web分散オーサリングとバージョニング（WebDav）';

  @override
  String get wiseDescription =>
      '個人用 API トークンで Wise マルチカレンシー口座の残高と取引をインポートします。連携した残高間の両替は振替としてインポートされます。アクセスは読み取り専用で、支払いは行われません。';

  @override
  String get wiseHeadline => 'Wise API (Global)';

  @override
  String get wiseNoProfiles => 'このトークンで利用できる Wise プロフィールがありません';

  @override
  String get wiseProfile => 'プロフィール';

  @override
  String get wiseScaRequired =>
      'Wise で強力な顧客認証が必要です。Wise アプリでこの残高の明細を開いてから再試行してください';

  @override
  String get wiseToken => '個人用 API トークン';

  @override
  String get wiseTokenSteps =>
      '個人用 API トークンの取得方法:\n1. ブラウザで wise.com にログインします（モバイルアプリではトークンを作成できません）\n2. 設定 → 連携とツール → API トークン を開きます\n3. 「新しいトークンを追加」を選び、名前（例: Fingrom）を付けて「読み取り専用」アクセスを選択します\n4. 2 段階認証で確認し、トークンをコピーします\n5. 下に貼り付けて「接続」を押します';

  @override
  String get wiseTokenTooltip =>
      'Wise の 設定 → API トークン で作成します（可能であれば読み取り専用）。暗号化して保存されます';

  @override
  String get zoomState => 'ズームイン/ズームアウト';
}
