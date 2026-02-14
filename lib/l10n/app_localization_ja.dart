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
  String get dayStartOfMonth => '月初';

  @override
  String get dayStartOfWeek => '週の始まり';

  @override
  String get daySunday => '日曜日';

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
  String get meaning => '意味';

  @override
  String get metricsHeadline => 'メトリクス';

  @override
  String get metricsTooltip => '指標';

  @override
  String get milestones => 'マイルストーン';

  @override
  String get missingContent => 'ファイルが処理できない（キャンセルされた）';

  @override
  String get navigationTooltip => 'メインメニューを開く';

  @override
  String netProfit(Object value) {
    return '利益：$value';
  }

  @override
  String get noChartData => '表示するデータがない（または十分でない）。';

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
  String get secureOtpCode => 'ワンタイムパスワードコード';

  @override
  String get secureOtpCodeInvalid => '無効なコードです！新しいコードを取得して入力してください';

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
  String get skipFromTotals => '合計から除外する';

  @override
  String get skipTooltip => 'ステップをスキップする';

  @override
  String get spent => '使用済み';

  @override
  String get splitCancelTooltip => '月ごとの分割を取り消す';

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
  String get zoomState => 'ズームイン/ズームアウト';
}
