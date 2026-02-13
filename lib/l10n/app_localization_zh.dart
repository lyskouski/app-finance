// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Chinese (`zh`).
class AppLocalizationsZh extends AppLocalizations {
  AppLocalizationsZh([String locale = 'zh']) : super(locale);

  @override
  String get a =>
      'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => '关于';

  @override
  String get account => '账户';

  @override
  String get accountFrom => '来自账户';

  @override
  String get accountHeadline => '账户';

  @override
  String get accountTo => '收件人账户';

  @override
  String get accountTooltip => '打开账户';

  @override
  String get accountType => '账户类型';

  @override
  String get accountTypeTooltip => '选择账户类型';

  @override
  String get acknowledgeTooltip => '确认';

  @override
  String get activate => '激活';

  @override
  String get actualData => '历史数据';

  @override
  String get addAccountTooltip => '添加账户';

  @override
  String get addBudgetTooltip => '添加新的预算类别';

  @override
  String get addGoalTooltip => '添加新目标';

  @override
  String get addMainTooltip => '添加账单,收入或转账';

  @override
  String afterNDays(Object value) {
    return '$value天后';
  }

  @override
  String get amountFrom => '起始金额';

  @override
  String get amountTo => '终止金额';

  @override
  String appBuild(Object build) {
    return '构建: $build';
  }

  @override
  String get appInitHeadline => '项目初始化';

  @override
  String get appStartHeadline => '初始设置';

  @override
  String get appTitle => 'Fingrom (金融雷击)';

  @override
  String appVersion(Object version) {
    return '版本：$version';
  }

  @override
  String get automationHeadline => '自动化';

  @override
  String get automationTypeDays => '过些日子';

  @override
  String get backTooltip => '返回';

  @override
  String get balance => '实际余额';

  @override
  String get balanceDate => '余额日期更新';

  @override
  String get balanceDateTooltip => '此日期之前的成果和收入不会影响余额';

  @override
  String get balanceTooltip => '设置余额';

  @override
  String get bankAccount => '银行账户';

  @override
  String get bill => '账单';

  @override
  String get billHeadline => '账单';

  @override
  String get billSetTooltip => '设置金额';

  @override
  String billSum(Object value) {
    return '账单：$value';
  }

  @override
  String get billTooltip => '未结账单';

  @override
  String get billTypeTooltip => '[类型] 账单、收入或转账';

  @override
  String get brightnessTheme => '亮度主题';

  @override
  String get btnAdd => '添加';

  @override
  String get btnCancel => '取消';

  @override
  String get btnConfirm => '确认';

  @override
  String get btnMore => '更多';

  @override
  String get budget => '预算类别';

  @override
  String get budgetHeadline => '预算';

  @override
  String get budgetLimit => '每月限额';

  @override
  String get budgetLimitHeadline => '限额调整';

  @override
  String get budgetRelativeLimit => '每月相对系数';

  @override
  String get budgetTooltip => '开放预算类型';

  @override
  String get budgetType => '预算编制间隔';

  @override
  String get budgetTypeAsIs => '无限制';

  @override
  String get budgetTypeFixed => '固定';

  @override
  String get budgetTypeMonth => '每月';

  @override
  String get budgetTypeRelative => '相对';

  @override
  String get budgetTypeWeek => '每周';

  @override
  String get budgetTypeYear => '每年';

  @override
  String get cash => '现金';

  @override
  String get chartBarRace => '类别条形竞赛';

  @override
  String get chartForecast => '预测图表';

  @override
  String get chartOHLC => '烛台（开盘高低收盘）图';

  @override
  String get chartYtdExpense => '年初至今的支出';

  @override
  String get clear => '下降值';

  @override
  String get closeTooltip => '关闭';

  @override
  String get closedAt => '完成日期';

  @override
  String get cmpChart => '图表';

  @override
  String get cmpRecent => '最近项目';

  @override
  String get cmpRecentCount => '列表大小';

  @override
  String get coAuthor => '作者';

  @override
  String get coConsult => '顾问';

  @override
  String get coDeveloper => '开发者';

  @override
  String get coNew => '加入';

  @override
  String get coPromoter => '推广员';

  @override
  String get coTranslator => '翻译';

  @override
  String get coef => '系数';

  @override
  String get collapse => '折叠（恢复）部分';

  @override
  String get color => '颜色';

  @override
  String get colorApp => '自定义';

  @override
  String get colorBackground => '背景';

  @override
  String get colorDark => '深色';

  @override
  String get colorInversePrimary => '反色原色';

  @override
  String get colorInverseSurface => '反转表面';

  @override
  String get colorLight => '光';

  @override
  String get colorOnInverseSurface => '反转表面';

  @override
  String get colorOnSecondary => '次要';

  @override
  String get colorOnSecondaryContainer => '在容器上';

  @override
  String get colorPrimary => '初级';

  @override
  String get colorRestore => '重置调色板';

  @override
  String get colorSecondary => '次要';

  @override
  String get colorSystem => '默认';

  @override
  String get colorTheme => '调色板';

  @override
  String get colorTooltip => '选择颜色';

  @override
  String get colorType => '颜色类型';

  @override
  String get colorUser => '个人';

  @override
  String columnMap(Object value) {
    return '列 \'$value\' 的映射';
  }

  @override
  String columnMapTooltip(Object value) {
    return '\'$value\' - 选择列映射';
  }

  @override
  String get completeGoalTooltip => '完成目标';

  @override
  String get confirmHeader => '确认行动';

  @override
  String get confirmTooltip => '您确定吗？此操作无法撤销。';

  @override
  String get contributors => '贡献者';

  @override
  String get conversion => '转换';

  @override
  String conversionMessage(Object currency) {
    return '以 $currency 表示';
  }

  @override
  String get copiedToClipboard => '已复制到剪贴板';

  @override
  String get createAccountHeader => '创建新账户';

  @override
  String get createAccountTooltip => '创建新账户';

  @override
  String get createBillHeader => '创建新交易';

  @override
  String get createBillTooltip => '添加新账单';

  @override
  String get createBudgetHeader => '新预算类别';

  @override
  String get createBudgetTooltip => '创建新预算类别';

  @override
  String get createGoalHeader => '创建目标';

  @override
  String get createGoalTooltip => '添加新目标';

  @override
  String get createIncomeTooltip => '添加新收入';

  @override
  String get createPaymentTooltip => '添加新付款';

  @override
  String get createTransferTooltip => '创建转账';

  @override
  String get credit => '信用';

  @override
  String get creditCard => '信用卡';

  @override
  String get currency => '货币';

  @override
  String get currencyAddHeadline => '货币兑换';

  @override
  String get currencyAddTooltip => '添加货币汇率';

  @override
  String get currencyDefault => '默认货币';

  @override
  String get currencyDistribution => '分配';

  @override
  String currencyExchange(Object from, Object to) {
    return '货币兑换：$from -> $to';
  }

  @override
  String get currencyHeadline => '货币';

  @override
  String currencyIn(Object value) {
    return '在 $value 中';
  }

  @override
  String get currencyShort => '币';

  @override
  String get currencyTooltip => '货币类型（代码）';

  @override
  String get currencyUpdateTooltip => '更新货币汇率';

  @override
  String get currentDate => '当前日期指针';

  @override
  String get customAddTooltip => '添加小工具';

  @override
  String get customDeleteTooltip => '删除自定义';

  @override
  String get customSaveTooltip => '保存自定义';

  @override
  String get customizeTooltip => '自定义页面';

  @override
  String get darkMode => '暗';

  @override
  String get dateFormat => '日期格式';

  @override
  String get dateRange => '日期範圍';

  @override
  String get dateTooltip => '选择日期';

  @override
  String get dayMonday => '星期一';

  @override
  String get dayStartOfMonth => '月初';

  @override
  String get dayStartOfWeek => '周初';

  @override
  String get daySunday => '周日';

  @override
  String get debitCard => '借记卡';

  @override
  String def(Object value) {
    return '\'$value\' 的默认值';
  }

  @override
  String get deleteAccountTooltip => '停用账户';

  @override
  String get deleteBillTooltip => '删除账单';

  @override
  String get deleteBudgetTooltip => '停用预算类别';

  @override
  String get deleteGoalTooltip => '删除目标';

  @override
  String get deleteInvoiceTooltip => '删除发票';

  @override
  String get deletePaymentTooltip => '删除付款';

  @override
  String get deleteTooltip => '删除';

  @override
  String get deleteTransferTooltip => '删除转账';

  @override
  String get deposit => '存款';

  @override
  String get description => '说明';

  @override
  String get descriptionTooltip => '设置支出详情';

  @override
  String get design => '设计模式（特定文化）';

  @override
  String get designAsiaGeneral => '亚洲 通用';

  @override
  String get designGermany => '德国';

  @override
  String get designGlobal => '全球';

  @override
  String get designRtlGeneral => '从右到左的文字';

  @override
  String get details => '详情';

  @override
  String get detailsTooltip => '****2345 - 号码的最后 4 位数字';

  @override
  String get dtAm => '上午';

  @override
  String get dtAmPm => '小时（上午/下午）（0~11';

  @override
  String get dtDay => '月中的日';

  @override
  String get dtEscape => '文本转码';

  @override
  String get dtHalfHour => '小时（上午/下午）（1~12';

  @override
  String get dtHour => '小时（日）（0~23';

  @override
  String get dtMinute => '分钟（小时';

  @override
  String get dtMonth => '以年为单位的月';

  @override
  String get dtNamedDay => '星期';

  @override
  String get dtPm => '下午';

  @override
  String get dtQuote => '单引号';

  @override
  String get dtSecond => '秒（分钟';

  @override
  String get dtYear => '年';

  @override
  String get editAccountHeader => '更新账户';

  @override
  String get editAccountTooltip => '编辑账户';

  @override
  String get editBillHeader => '更新账单';

  @override
  String get editBillTooltip => '编辑账单';

  @override
  String get editBudgetHeader => '更新预算类别';

  @override
  String get editBudgetTooltip => '编辑预算类别';

  @override
  String get editGoalHeader => '更新目标';

  @override
  String get editGoalTooltip => '编辑目标';

  @override
  String get editInvoiceTooltip => '编辑发票';

  @override
  String get editPaymentTooltip => '编辑付款';

  @override
  String get editTooltip => '编辑';

  @override
  String get editTransferTooltip => '编辑转账';

  @override
  String get encryptionMode => '数据加密';

  @override
  String error(Object value) {
    return '错误：$value';
  }

  @override
  String get errorExpired => '卡已过期';

  @override
  String get errorNegative => '不能为负数！请修复错误';

  @override
  String get example => '示例';

  @override
  String get expand => '展开部分';

  @override
  String get expense => '费用金额';

  @override
  String get expenseDateTime => '账单';

  @override
  String get expenseHeadline => '支出';

  @override
  String get expenseTransfer => '转账金额';

  @override
  String exportFile(Object value) {
    return '导出为 .$value 文件';
  }

  @override
  String get failData => '扣除金额';

  @override
  String get flowTypeInvoice => '发票';

  @override
  String get flowTypeTooltip => '金额类型： 账单、发票';

  @override
  String get forecastData => '预测';

  @override
  String get from => '从';

  @override
  String get goNextTooltip => '下一步';

  @override
  String get goalHeadline => '目标';

  @override
  String goalProfit(Object value) {
    return '目标：$value';
  }

  @override
  String get goalProfitTooltip => '利润与目标';

  @override
  String get goalTooltip => '打开目标';

  @override
  String get hasEncrypted => '一旦设定，不可更改';

  @override
  String get helpTooltip => '[帮助] 显示该页面的说明';

  @override
  String get homeHeadline => '主页';

  @override
  String get homeTooltip => '返回主页';

  @override
  String get icon => '图标';

  @override
  String get iconTooltip => '选择图标';

  @override
  String get ignoreTooltip => '忽略';

  @override
  String get importHeadline => '进口/出口';

  @override
  String get income => '收入金额';

  @override
  String get incomeHeadline => '收入';

  @override
  String get incomeHealth => '收入健康雷达';

  @override
  String get incomeTooltip => '设置收入详情';

  @override
  String get invoiceHeadline => '发票';

  @override
  String invoiceSum(Object value) {
    return '发票： $value';
  }

  @override
  String get isCleaned => '删除现有数据';

  @override
  String get isCreated => '已创建，请执行下一步！';

  @override
  String get isEncrypted => '文件已加密（默认情况下）';

  @override
  String get isRequired => '需要';

  @override
  String get language => '语言';

  @override
  String get left => '左';

  @override
  String get lightMode => '光';

  @override
  String get link => '统一资源定位符 (URL)';

  @override
  String get meaning => '意义';

  @override
  String get metricsHeadline => '指标';

  @override
  String get metricsTooltip => '衡量标准';

  @override
  String get milestones => '里程碑';

  @override
  String get missingContent => '文件无法处理（或取消）';

  @override
  String get navigationTooltip => '打开主菜单';

  @override
  String netProfit(Object value) {
    return '利润：$value';
  }

  @override
  String get noChartData => '数据缺失（或不足），无法显示';

  @override
  String get notifyHeadline => '通知解析器';

  @override
  String get ok => '确定';

  @override
  String get orderPin => '优先顺序';

  @override
  String get orderUnpin => '通用顺序';

  @override
  String get outputFile => '文件目的地';

  @override
  String get parseFile => '解析文件';

  @override
  String get password => '密码';

  @override
  String get path => '文件名（保存到其中或从其中加载）';

  @override
  String get paymentType => '付款间隔';

  @override
  String get paymentsHeadline => '经常性付款';

  @override
  String get pearDisabled => '-- 禁用';

  @override
  String get pearLoading => '进行中...';

  @override
  String get peerAccept => '接受';

  @override
  String get peerAction => '行动';

  @override
  String get peerClosed => '已终止';

  @override
  String get peerConnect => '连接设备';

  @override
  String get peerConnectBtn => '连接';

  @override
  String get peerDelete => '删除';

  @override
  String get peerDevice => '已连接的设备';

  @override
  String get peerId => '您的连接设备标识符';

  @override
  String get peerOffline => '离线';

  @override
  String get peerOnline => '已连接';

  @override
  String get peerOtherId => '连接的设备标识符';

  @override
  String get peerPending => '待处理';

  @override
  String get peerPing => 'ping';

  @override
  String get peerSent => '数据已传输至连接的设备';

  @override
  String get peerStatus => '状态';

  @override
  String get peerSync => '传输数据';

  @override
  String pickFile(Object value) {
    return '选取 .$value 文件';
  }

  @override
  String pongStatus(Object uuid) {
    return '已接收来自 $uuid 的请求';
  }

  @override
  String get processIsFinished => '已完成！';

  @override
  String progress(Object value) {
    return '进度： $value%';
  }

  @override
  String get raiseData => '金额增加';

  @override
  String get recoveryHeadline => '恢复';

  @override
  String get recoveryTooltip => '恢复自';

  @override
  String get releases => '发布';

  @override
  String get reset => '重置';

  @override
  String get returnBack => '返回';

  @override
  String get roadmap => '路线图';

  @override
  String get saveNotification => '保存更改！';

  @override
  String get saveSettingsTooltip => '保存';

  @override
  String get saveTooltip => '保存至';

  @override
  String search(Object value) {
    return '按 \'$value\' 模式显示';
  }

  @override
  String get searchTooltip => '搜索';

  @override
  String get securityHeadline => '安全';

  @override
  String get settingsBaseHeadline => '基础知识';

  @override
  String get settingsHeadline => '设置';

  @override
  String get skipFromTotals => '不计入总数';

  @override
  String get skipTooltip => '跳过步骤';

  @override
  String get spent => '已花费';

  @override
  String get splitCancelTooltip => '取消每月拆分';

  @override
  String get splitTooltip => '声明每月限额';

  @override
  String get subscription =>
      '作为一个开源项目，订阅不会解锁任何额外功能。不过，这将是对应用程序持续发展和改进的投资，并能保持其可用性。';

  @override
  String get subscriptionCoffee => '购买咖啡';

  @override
  String get subscriptionDinner => '请客吃饭';

  @override
  String get subscriptionDonorbox => '通过 Donorbox 订阅';

  @override
  String get subscriptionGithub => '通过 GitHub 订阅';

  @override
  String get subscriptionHeadline => '赞助';

  @override
  String get subscriptionInactive => '购买服务不可用';

  @override
  String get subscriptionPatreon => '通过 Patreon 订阅';

  @override
  String get subscriptionPaypal => '购买咖啡 (PayPal)';

  @override
  String get subscriptionTiny => '赠送幸运币';

  @override
  String get subscriptionTooltip => '支持（赞助）';

  @override
  String get success => '成功';

  @override
  String get summary => '摘要';

  @override
  String get symbol => '符号';

  @override
  String get syncHeadline => '同步设备';

  @override
  String get systemMode => '系统';

  @override
  String get tapToOpen => '轻点打开';

  @override
  String get targetAmount => '目标金额';

  @override
  String get termPrivacy => '隐私政策';

  @override
  String get termUse => '使用条款';

  @override
  String get title => '标题';

  @override
  String get titleAccountTooltip => '输入账户标识符';

  @override
  String get titleBudgetTooltip => '输入预算类别名称';

  @override
  String get titleGoal => '目标';

  @override
  String get titleGoalTooltip => '定义目标描述';

  @override
  String get to => '至';

  @override
  String get total => '总计';

  @override
  String get transactionFile => 'Fingrom 交易日志文件 (.log)';

  @override
  String get transferHeadline => '转账';

  @override
  String get transferTooltip => '设置转账详情';

  @override
  String get transfersHeadline => '转让';

  @override
  String get typeButton => '按钮';

  @override
  String get updateAccountTooltip => '更新账户';

  @override
  String get updateBillTooltip => '更新账单';

  @override
  String get updateBudgetTooltip => '更新预算类别';

  @override
  String get updateGoalTooltip => '更新目标';

  @override
  String get updatePaymentTooltip => '更新付款';

  @override
  String get username => '用户名（账户）';

  @override
  String get uuid => '唯一交易标识符';

  @override
  String get validTillDate => '有效提单';

  @override
  String get webDav => '网络分布式创作和版本管理（WebDav）';

  @override
  String get zoomState => '放大/缩小';
}

/// The translations for Chinese, as used in Taiwan (`zh_TW`).
class AppLocalizationsZhTw extends AppLocalizationsZh {
  AppLocalizationsZhTw() : super('zh_TW');

  @override
  String get a =>
      'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => '關於我們';

  @override
  String get account => '帳號';

  @override
  String get accountFrom => '自帳戶';

  @override
  String get accountHeadline => '帳戶';

  @override
  String get accountTo => '至帳戶';

  @override
  String get accountTooltip => '開啟帳戶';

  @override
  String get accountType => '帳戶類型';

  @override
  String get accountTypeTooltip => '選擇帳戶類型';

  @override
  String get acknowledgeTooltip => '確認';

  @override
  String get activate => '啟動';

  @override
  String get actualData => '歷史資料';

  @override
  String get addAccountTooltip => '新增帳戶';

  @override
  String get addBudgetTooltip => '新增預算類別';

  @override
  String get addGoalTooltip => '新增目標';

  @override
  String get addMainTooltip => '新增帳單、收入或轉帳';

  @override
  String afterNDays(Object value) {
    return '$value天後';
  }

  @override
  String get amountFrom => '起始金額';

  @override
  String get amountTo => '終止金額';

  @override
  String appBuild(Object build) {
    return '建立：$build';
  }

  @override
  String get appInitHeadline => '專案初始化';

  @override
  String get appStartHeadline => '初始設定';

  @override
  String get appTitle => '財務報表';

  @override
  String appVersion(Object version) {
    return '版本：$version';
  }

  @override
  String get automationHeadline => '自動化';

  @override
  String get automationTypeDays => '過些日子';

  @override
  String get backTooltip => '返回';

  @override
  String get balance => '實際結餘';

  @override
  String get balanceDate => '結餘更新日期';

  @override
  String get balanceDateTooltip => '此日期前的成果和收入不會影響結餘';

  @override
  String get balanceTooltip => '設定結餘';

  @override
  String get bankAccount => '銀行帳戶';

  @override
  String get bill => '帳單';

  @override
  String get billHeadline => '帳單';

  @override
  String get billSetTooltip => '設定金額';

  @override
  String billSum(Object value) {
    return '帳單：$value';
  }

  @override
  String get billTooltip => '開啟帳單';

  @override
  String get billTypeTooltip => '[類型] 帳單、收入或轉帳';

  @override
  String get brightnessTheme => '亮度主題';

  @override
  String get btnAdd => '新增';

  @override
  String get btnCancel => '取消';

  @override
  String get btnConfirm => '確認';

  @override
  String get btnMore => '更多資訊';

  @override
  String get budget => '預算類別';

  @override
  String get budgetHeadline => '預算';

  @override
  String get budgetLimit => '每月限額';

  @override
  String get budgetLimitHeadline => '限額調整';

  @override
  String get budgetRelativeLimit => '每月相對係數';

  @override
  String get budgetTooltip => '公開預算類型';

  @override
  String get budgetType => '預算間隔';

  @override
  String get budgetTypeAsIs => '無限制';

  @override
  String get budgetTypeFixed => '固定';

  @override
  String get budgetTypeMonth => '每月';

  @override
  String get budgetTypeRelative => '相對';

  @override
  String get budgetTypeWeek => '每週';

  @override
  String get budgetTypeYear => '每年';

  @override
  String get cash => '現金';

  @override
  String get chartBarRace => '分類條賽';

  @override
  String get chartForecast => '預測圖表';

  @override
  String get chartOHLC => '燭形 (OHLC) 圖表';

  @override
  String get chartYtdExpense => '年初至今的支出';

  @override
  String get clear => '跌價值';

  @override
  String get closeTooltip => '收盤';

  @override
  String get closedAt => '完成日期';

  @override
  String get cmpChart => '圖表';

  @override
  String get cmpRecent => '最近的項目';

  @override
  String get cmpRecentCount => '清單大小';

  @override
  String get coAuthor => '作者';

  @override
  String get coConsult => '顧問';

  @override
  String get coDeveloper => '開發人員';

  @override
  String get coNew => '加盟';

  @override
  String get coPromoter => '推銷員';

  @override
  String get coTranslator => '翻譯器';

  @override
  String get coef => '係數';

  @override
  String get collapse => '折疊（恢復）部分';

  @override
  String get color => '顏色';

  @override
  String get colorApp => '自訂';

  @override
  String get colorBackground => '背景顏色';

  @override
  String get colorDark => '黑暗';

  @override
  String get colorInversePrimary => '反向原色';

  @override
  String get colorInverseSurface => '反色表面';

  @override
  String get colorLight => '淺色';

  @override
  String get colorOnInverseSurface => '反向表面上';

  @override
  String get colorOnSecondary => '次要表面上';

  @override
  String get colorOnSecondaryContainer => '貨櫃';

  @override
  String get colorPrimary => '原色';

  @override
  String get colorRestore => '重設調色板';

  @override
  String get colorSecondary => '次級';

  @override
  String get colorSystem => '預設';

  @override
  String get colorTheme => '調色板';

  @override
  String get colorTooltip => '選擇顏色';

  @override
  String get colorType => '顏色類型';

  @override
  String get colorUser => '個人';

  @override
  String columnMap(Object value) {
    return '欄 \'$value\' 的對應';
  }

  @override
  String columnMapTooltip(Object value) {
    return '\'$value\' - 選擇欄對應';
  }

  @override
  String get completeGoalTooltip => '完成目標';

  @override
  String get confirmHeader => '確認動作';

  @override
  String get confirmTooltip => '確定嗎？此動作無法撤銷。';

  @override
  String get contributors => '貢獻者';

  @override
  String get conversion => '轉換';

  @override
  String conversionMessage(Object currency) {
    return '以 $currency 兌換';
  }

  @override
  String get copiedToClipboard => '已複製到剪貼簿';

  @override
  String get createAccountHeader => '建立新帳戶';

  @override
  String get createAccountTooltip => '建立新帳戶';

  @override
  String get createBillHeader => '建立新交易';

  @override
  String get createBillTooltip => '新增帳單';

  @override
  String get createBudgetHeader => '新增預算類別';

  @override
  String get createBudgetTooltip => '建立新的預算類別';

  @override
  String get createGoalHeader => '建立目標';

  @override
  String get createGoalTooltip => '新增目標';

  @override
  String get createIncomeTooltip => '新增收入';

  @override
  String get createPaymentTooltip => '新增付款';

  @override
  String get createTransferTooltip => '建立轉帳';

  @override
  String get credit => '信貸';

  @override
  String get creditCard => '信用卡';

  @override
  String get currency => '貨幣';

  @override
  String get currencyAddHeadline => '貨幣兌換';

  @override
  String get currencyAddTooltip => '加入貨幣匯率';

  @override
  String get currencyDefault => '預設貨幣';

  @override
  String get currencyDistribution => '分佈';

  @override
  String currencyExchange(Object from, Object to) {
    return '貨幣兌換： $from -> $to';
  }

  @override
  String get currencyHeadline => '貨幣';

  @override
  String currencyIn(Object value) {
    return '在 $value';
  }

  @override
  String get currencyShort => '貨幣';

  @override
  String get currencyTooltip => '貨幣類型（代碼）';

  @override
  String get currencyUpdateTooltip => '更新貨幣匯率';

  @override
  String get currentDate => '當前日期指標';

  @override
  String get customAddTooltip => '新增小工具';

  @override
  String get customDeleteTooltip => '刪除自訂';

  @override
  String get customSaveTooltip => '儲存自訂';

  @override
  String get customizeTooltip => '自訂頁面';

  @override
  String get darkMode => 'Dark';

  @override
  String get dateFormat => 'Date Format';

  @override
  String get dateRange => '日期范围';

  @override
  String get dateTooltip => '選擇日期';

  @override
  String get dayMonday => '星期一';

  @override
  String get dayStartOfMonth => '本月開始';

  @override
  String get dayStartOfWeek => '本週開始';

  @override
  String get daySunday => '星期日';

  @override
  String get debitCard => '借記卡';

  @override
  String def(Object value) {
    return '$value的預設值';
  }

  @override
  String get deleteAccountTooltip => '停用帳戶';

  @override
  String get deleteBillTooltip => '刪除帳單';

  @override
  String get deleteBudgetTooltip => '停用預算類別';

  @override
  String get deleteGoalTooltip => '刪除目標';

  @override
  String get deleteInvoiceTooltip => '刪除發票';

  @override
  String get deletePaymentTooltip => '刪除付款';

  @override
  String get deleteTooltip => '刪除';

  @override
  String get deleteTransferTooltip => '刪除轉帳';

  @override
  String get deposit => 'Deposit';

  @override
  String get description => '說明';

  @override
  String get descriptionTooltip => '設定支出詳細資料';

  @override
  String get design => '設計模式 (特定文化)';

  @override
  String get designAsiaGeneral => '亞洲一般';

  @override
  String get designGermany => '德國';

  @override
  String get designGlobal => 'Global';

  @override
  String get designRtlGeneral => '從右至左字體';

  @override
  String get details => '詳細資料';

  @override
  String get detailsTooltip => '****2345 - 號碼的最後四個數字';

  @override
  String get dtAm => '上午';

  @override
  String get dtAmPm => '小時（上午/下午）(0~11)';

  @override
  String get dtDay => '以月為單位的日';

  @override
  String get dtEscape => '轉換文字';

  @override
  String get dtHalfHour => '小時（上午/下午）(1~12)';

  @override
  String get dtHour => '小時（日） (0~23)';

  @override
  String get dtMinute => '分鐘（以小時為單位';

  @override
  String get dtMonth => '以年為單位的月份';

  @override
  String get dtNamedDay => 'day of week';

  @override
  String get dtPm => '下午';

  @override
  String get dtQuote => '單引號';

  @override
  String get dtSecond => '分秒';

  @override
  String get dtYear => '年';

  @override
  String get editAccountHeader => '更新帳戶';

  @override
  String get editAccountTooltip => '編輯帳戶';

  @override
  String get editBillHeader => '更新帳單';

  @override
  String get editBillTooltip => '編輯帳單';

  @override
  String get editBudgetHeader => '更新預算類別';

  @override
  String get editBudgetTooltip => '編輯預算類別';

  @override
  String get editGoalHeader => '更新目標';

  @override
  String get editGoalTooltip => '編輯目標';

  @override
  String get editInvoiceTooltip => '編輯發票';

  @override
  String get editPaymentTooltip => '編輯付款';

  @override
  String get editTooltip => '編輯';

  @override
  String get editTransferTooltip => '編輯轉移';

  @override
  String get encryptionMode => '資料加密';

  @override
  String error(Object value) {
    return '錯誤：$value';
  }

  @override
  String get errorExpired => '卡已過期';

  @override
  String get errorNegative => '無法為負值！請修正錯誤';

  @override
  String get example => '範例';

  @override
  String get expand => '展開部分';

  @override
  String get expense => '支出金額';

  @override
  String get expenseDateTime => '帳單';

  @override
  String get expenseHeadline => '費用';

  @override
  String get expenseTransfer => '轉帳金額';

  @override
  String exportFile(Object value) {
    return '匯出為 .$value 檔案';
  }

  @override
  String get failData => '扣除金額';

  @override
  String get flowTypeInvoice => '發票';

  @override
  String get flowTypeTooltip => '金額類型： 帳單、發票';

  @override
  String get forecastData => '預測';

  @override
  String get from => '從';

  @override
  String get goNextTooltip => '下一個';

  @override
  String get goalHeadline => '目標';

  @override
  String goalProfit(Object value) {
    return '目標：$value';
  }

  @override
  String get goalProfitTooltip => '利潤与目標';

  @override
  String get goalTooltip => '開啟目標';

  @override
  String get hasEncrypted => '一旦設定，無法變更';

  @override
  String get helpTooltip => '[說明] 顯示該頁面的說明';

  @override
  String get homeHeadline => '首頁';

  @override
  String get homeTooltip => '回到主頁';

  @override
  String get icon => '圖示';

  @override
  String get iconTooltip => '選擇圖示';

  @override
  String get ignoreTooltip => '忽略';

  @override
  String get importHeadline => '進口/出口';

  @override
  String get income => '收入金額';

  @override
  String get incomeHeadline => '收入';

  @override
  String get incomeHealth => '收入健康雷達';

  @override
  String get incomeTooltip => '設定收入詳細資訊';

  @override
  String get invoiceHeadline => '發票';

  @override
  String invoiceSum(Object value) {
    return '發票：$value';
  }

  @override
  String get isCleaned => '移除現有資料';

  @override
  String get isCreated => '已建立，請遵循下一步！';

  @override
  String get isEncrypted => '檔案已加密 (預設)';

  @override
  String get isRequired => '所需';

  @override
  String get language => '語言';

  @override
  String get left => '左邊';

  @override
  String get lightMode => '光線';

  @override
  String get link => '統一資源定位符 (URL)';

  @override
  String get meaning => '意義';

  @override
  String get metricsHeadline => '度量';

  @override
  String get metricsTooltip => '指標';

  @override
  String get milestones => '里程碑';

  @override
  String get missingContent => '檔案無法處理 (或取消)';

  @override
  String get navigationTooltip => '開啟主功能表';

  @override
  String netProfit(Object value) {
    return '利潤：$value';
  }

  @override
  String get noChartData => '資料遺失（或不足），無法顯示';

  @override
  String get notifyHeadline => '通知解析器';

  @override
  String get ok => '確定';

  @override
  String get orderPin => '優先順序';

  @override
  String get orderUnpin => '一般化順序';

  @override
  String get outputFile => '檔案的目的地';

  @override
  String get parseFile => '解析檔案';

  @override
  String get password => '密碼';

  @override
  String get path => '檔案名稱 (儲存至檔案，或從檔案載入)';

  @override
  String get paymentType => '付款間隔';

  @override
  String get paymentsHeadline => '循環付款';

  @override
  String get pearDisabled => '-- 已停用 --';

  @override
  String get pearLoading => '進行中...';

  @override
  String get peerAccept => '接受';

  @override
  String get peerAction => '行動';

  @override
  String get peerClosed => '已終止';

  @override
  String get peerConnect => '連接裝置';

  @override
  String get peerConnectBtn => '連接';

  @override
  String get peerDelete => '刪除';

  @override
  String get peerDevice => '連線裝置';

  @override
  String get peerId => '您的連線裝置識別碼';

  @override
  String get peerOffline => '離線';

  @override
  String get peerOnline => '已連接';

  @override
  String get peerOtherId => '連線的裝置識別碼';

  @override
  String get peerPending => '待定';

  @override
  String get peerPing => '乒';

  @override
  String get peerSent => '資料傳輸至已連接的裝置';

  @override
  String get peerStatus => '狀態';

  @override
  String get peerSync => '傳輸資料';

  @override
  String pickFile(Object value) {
    return '選取 .$value 檔案';
  }

  @override
  String pongStatus(Object uuid) {
    return '已接收來自 $uuid 的請求';
  }

  @override
  String get processIsFinished => '完成！';

  @override
  String progress(Object value) {
    return '進度： $value%';
  }

  @override
  String get raiseData => '金額增加';

  @override
  String get recoveryHeadline => '復原';

  @override
  String get recoveryTooltip => '回收自';

  @override
  String get releases => '釋放';

  @override
  String get reset => '重設';

  @override
  String get returnBack => '返回 返回';

  @override
  String get roadmap => '路徑圖';

  @override
  String get saveNotification => '變更已儲存';

  @override
  String get saveSettingsTooltip => '儲存';

  @override
  String get saveTooltip => '儲存至';

  @override
  String search(Object value) {
    return '以 \'$value\' 模式顯示';
  }

  @override
  String get searchTooltip => '搜尋';

  @override
  String get securityHeadline => '安全性';

  @override
  String get settingsBaseHeadline => '基本知識';

  @override
  String get settingsHeadline => '設定';

  @override
  String get skipFromTotals => '總計不包括';

  @override
  String get skipTooltip => '跳過步驟';

  @override
  String get spent => '花費';

  @override
  String get splitCancelTooltip => '取消每月分割';

  @override
  String get splitTooltip => '宣告每月限制';

  @override
  String get subscription =>
      '作為一個開放原始碼專案，訂閱不會解鎖任何額外功能。然而，這將會成為對應用程式持續演進與改進的投資，並維持其可用性。';

  @override
  String get subscriptionCoffee => '購買咖啡';

  @override
  String get subscriptionDinner => '款待晚餐';

  @override
  String get subscriptionDonorbox => '透過 Donorbox 訂閱';

  @override
  String get subscriptionGithub => '透過 GitHub 訂閱';

  @override
  String get subscriptionHeadline => '贊助';

  @override
  String get subscriptionInactive => '購買服務不可用';

  @override
  String get subscriptionPatreon => '透過 Patreon 訂閱';

  @override
  String get subscriptionPaypal => '購買咖啡 (PayPal)';

  @override
  String get subscriptionTiny => '贈送幸運硬幣';

  @override
  String get subscriptionTooltip => '支持 (贊助)';

  @override
  String get success => '成功';

  @override
  String get summary => '摘要';

  @override
  String get symbol => '符號';

  @override
  String get syncHeadline => '同步裝置';

  @override
  String get systemMode => '系統';

  @override
  String get tapToOpen => '點選開啟';

  @override
  String get targetAmount => '目標金額';

  @override
  String get termPrivacy => '隱私權政策';

  @override
  String get termUse => '使用條款';

  @override
  String get title => '標題';

  @override
  String get titleAccountTooltip => '輸入帳戶識別碼';

  @override
  String get titleBudgetTooltip => '輸入預算類別名稱';

  @override
  String get titleGoal => '目標';

  @override
  String get titleGoalTooltip => '定義目標描述';

  @override
  String get to => '至';

  @override
  String get total => '總計';

  @override
  String get transactionFile => 'Fingrom 交易記錄檔 (.log)';

  @override
  String get transferHeadline => '傳輸';

  @override
  String get transferTooltip => '設定傳輸詳細資料';

  @override
  String get transfersHeadline => '轉移';

  @override
  String get typeButton => '按鈕';

  @override
  String get updateAccountTooltip => '更新帳戶';

  @override
  String get updateBillTooltip => '更新帳單';

  @override
  String get updateBudgetTooltip => '更新預算類別';

  @override
  String get updateGoalTooltip => '更新目標';

  @override
  String get updatePaymentTooltip => '更新付款';

  @override
  String get username => '用戶名（帳戶）';

  @override
  String get uuid => '唯一交易識別碼';

  @override
  String get validTillDate => '有效提單';

  @override
  String get webDav => '網路分散式撰寫與版本控制 (WebDav)';

  @override
  String get zoomState => '放大/縮小';
}
