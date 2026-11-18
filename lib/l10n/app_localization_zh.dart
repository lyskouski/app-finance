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
  String get budgetPositive => '预算、摘要处理器';

  @override
  String get budgetPositiveOff => '忽略负值';

  @override
  String get budgetPositiveOn => '包含负值';

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
  String get daySaturday => '周六';

  @override
  String get dayStartOfMonth => '月初';

  @override
  String get dayStartOfWeek => '周初';

  @override
  String get daySunday => '周日';

  @override
  String get deactivateAction => '停用密码保护';

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
  String get enableBankingAppId => '应用 ID';

  @override
  String get enableBankingBank => '银行';

  @override
  String get enableBankingCode => '授权后打开页面的地址';

  @override
  String get enableBankingCodeTooltip => '在银行确认访问后，从浏览器复制地址并粘贴到此处';

  @override
  String get enableBankingCountry => '国家（ISO 代码，如 DE）';

  @override
  String get enableBankingDescription =>
      '使用您在 enablebanking.com 注册的应用，通过 Enable Banking API（PSD2）导入欧洲银行的余额和交易。仅限只读访问：不会执行任何付款。';

  @override
  String get enableBankingHeadline => 'Enable Banking (EU)';

  @override
  String get enableBankingIncomplete => '请填写应用 ID、私钥、重定向 URL 和国家';

  @override
  String get enableBankingKey => '私钥（PEM）';

  @override
  String get enableBankingKeyInvalid => '私钥无效：需要 PEM 块“PRIVATE KEY”';

  @override
  String get enableBankingKeyNotRsa => '私钥无效：需要 RSA 密钥';

  @override
  String get enableBankingKeyTooltip =>
      '在 Enable Banking Control Panel 中随应用一起创建；加密存储。留空则保留已存储的私钥';

  @override
  String get enableBankingLoadBanks => '加载银行';

  @override
  String get enableBankingNoAuthPage => 'Enable Banking 未返回授权页面';

  @override
  String get enableBankingNoCode => '地址中未找到授权码';

  @override
  String get enableBankingRedirect => '重定向 URL';

  @override
  String get enableBankingRedirectTooltip => '已为应用注册；授权后银行将返回此地址';

  @override
  String get enableBankingStateMismatch => '该地址属于其他授权，请重新连接';

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
  String get finTsApproved => '已在银行应用中批准';

  @override
  String get finTsBankCode => '银行代码 (BLZ)';

  @override
  String get finTsCustomerId => '客户 ID（如与用户 ID 不同）';

  @override
  String get finTsDescription =>
      '从支持 FinTS 4.1（PIN/TAN）的银行导入余额和交易。仅限只读访问：不会执行任何付款。';

  @override
  String get finTsHeadline => 'Financial Transaction Services (FinTS 4.1)';

  @override
  String get finTsIncomplete => '请填写服务器 URL、银行代码、用户 ID 和产品注册号';

  @override
  String finTsLoginChanged(Object value) {
    return '银行已更改登录信息，请更新用户 ID 或客户 ID：$value';
  }

  @override
  String finTsLoginRefused(Object value) {
    return '银行拒绝了上次登录：$value。使用输入的 PIN 重试？';
  }

  @override
  String get finTsPin => 'PIN';

  @override
  String get finTsPinHint => '仅用于本次会话，绝不保存';

  @override
  String get finTsProductId => '产品注册号';

  @override
  String get finTsProductIdTooltip => '由 Deutsche Kreditwirtschaft 颁发给应用开发商';

  @override
  String get finTsTan => 'TAN';

  @override
  String get finTsTanHeadline => '交易验证 (TAN)';

  @override
  String get finTsTanMedium => '选择 TAN 介质';

  @override
  String get finTsTanMethod => '选择 TAN 方式';

  @override
  String get finTsUrl => '银行的 FinTS 服务器 URL';

  @override
  String get finTsUserId => '用户 ID（登录名）';

  @override
  String get finTsVersion => '协议版本';

  @override
  String get finTsWebUnsupported => '银行服务器不允许从浏览器访问。请使用桌面或移动应用。';

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
  String get hour => '小时';

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
  String get integrationAccessDenied => '访问已被撤销或凭据不正确';

  @override
  String get integrationConnect => '连接';

  @override
  String get integrationDateFrom => '导入交易的起始日期';

  @override
  String get integrationDefaultBudgetCategory => '默认预算类别';

  @override
  String get integrationDisconnect => '断开连接';

  @override
  String get integrationForget => '删除访问权限';

  @override
  String get integrationHeadline => '集成';

  @override
  String integrationHttpError(Object value) {
    return '服务返回错误（HTTP $value）';
  }

  @override
  String get integrationHttpsRequired => '仅允许安全（HTTPS）地址';

  @override
  String get integrationImport => '导入交易';

  @override
  String integrationImported(Object added, Object pending, Object skipped) {
    return '已导入：$added，因已存在而跳过：$skipped，待处理（未导入）：$pending';
  }

  @override
  String integrationInvalidAmount(Object value) {
    return '金额无效：$value';
  }

  @override
  String get integrationNoAccounts => '银行未提供任何账户';

  @override
  String get integrationPaymentRequired => '该服务需要付费才能访问';

  @override
  String get integrationSelectTarget => '请选择要导入的账户和预算类别';

  @override
  String integrationServiceError(Object value) {
    return '服务消息：$value';
  }

  @override
  String get integrationUnexpectedResponse => '服务返回了意外的响应';

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
  String get managerHeadline => '管理器';

  @override
  String get meaning => '意义';

  @override
  String get metricsHeadline => '指标';

  @override
  String get metricsTooltip => '衡量标准';

  @override
  String get milestones => '里程碑';

  @override
  String get minute => '分钟';

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
  String get secureBioNotMatch => '身份验证失败！请重试';

  @override
  String get secureBioPromptReason => '请进行身份验证以继续';

  @override
  String get secureBioPromptTitle => '生物识别验证';

  @override
  String get secureOtpCode => '一次性密码验证码';

  @override
  String get secureOtpCodeInvalid => '无效！请获取新验证码并输入';

  @override
  String get secureOtpDeactivated => '密码保护已停用';

  @override
  String get securePassword => '密码（恢复短语）';

  @override
  String get securePasswordEmpty => '密码不能为空！';

  @override
  String get securePasswordNotMatch => '密码不匹配！';

  @override
  String get securePasswordRepeat => '重复密码';

  @override
  String get securityHeadline => '安全';

  @override
  String get settingsBaseHeadline => '基础知识';

  @override
  String get settingsHeadline => '设置';

  @override
  String get settingsSaved => '设置已保存！';

  @override
  String get simpleFinDescription =>
      '通过 SimpleFIN Bridge 导入美国银行和发卡机构的余额与交易。仅限只读访问：不会执行任何付款。';

  @override
  String get simpleFinHeadline => 'SimpleFIN Bridge (US)';

  @override
  String get simpleFinNoCredentials => 'SimpleFIN Bridge 返回了不含凭据的访问地址';

  @override
  String get simpleFinToken => 'SimpleFIN 设置令牌';

  @override
  String get simpleFinTokenClaimed => '设置令牌不存在或已被使用';

  @override
  String get simpleFinTokenInvalid => 'SimpleFIN 设置令牌无效';

  @override
  String get simpleFinTokenTooltip =>
      '在您的 SimpleFIN Bridge（如 bridge.simplefin.org）中为本应用创建；只能使用一次';

  @override
  String get skipFromTotals => '不计入总数';

  @override
  String get skipTooltip => '跳过步骤';

  @override
  String get sortTooltip => '排序项目';

  @override
  String get sortingAmountAsc => '金额升序';

  @override
  String get sortingAmountDesc => '金额降序';

  @override
  String get sortingCreatedAtAsc => '创建时间升序';

  @override
  String get sortingCreatedAtDesc => '创建时间降序';

  @override
  String get sortingTitleAsc => '标题升序';

  @override
  String get sortingTitleDesc => '标题降序';

  @override
  String get sortingUpdatedAtAsc => '更新时间升序';

  @override
  String get sortingUpdatedAtDesc => '更新时间降序';

  @override
  String get spent => '已花费';

  @override
  String get splitCancelTooltip => '取消每月拆分';

  @override
  String get splitHeadline => '分摊账单';

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
  String get wiseDescription =>
      '使用个人 API 令牌导入 Wise 多币种账户的余额和交易。已关联余额之间的换汇将作为转账导入。访问为只读：不会进行任何付款。';

  @override
  String get wiseHeadline => 'Wise API (Global)';

  @override
  String get wiseNoProfiles => '该令牌没有可用的 Wise 资料';

  @override
  String get wiseProfile => '资料';

  @override
  String get wiseScaRequired => 'Wise 要求强客户认证：请在 Wise 应用中打开此余额的对账单，然后重试';

  @override
  String get wiseToken => '个人 API 令牌';

  @override
  String get wiseTokenSteps =>
      '如何获取个人 API 令牌：\n1. 在浏览器中登录 wise.com（移动应用中无法创建令牌）\n2. 打开 设置 → 集成和工具 → API 令牌\n3. 选择“添加新令牌”，命名（如 Fingrom），并选择“只读”权限\n4. 通过两步验证确认并复制令牌\n5. 粘贴到下方并点击“连接”';

  @override
  String get wiseTokenTooltip => '在 Wise 的 设置 → API 令牌 中创建（如可选则为只读）；加密存储';

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
  String get budgetPositive => '預算、摘要處理器';

  @override
  String get budgetPositiveOff => '忽略負數';

  @override
  String get budgetPositiveOn => '包含負數';

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
  String get daySaturday => '週六';

  @override
  String get dayStartOfMonth => '本月開始';

  @override
  String get dayStartOfWeek => '本週開始';

  @override
  String get daySunday => '星期日';

  @override
  String get deactivateAction => '停用密碼保護功能';

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
  String get enableBankingAppId => '應用程式 ID';

  @override
  String get enableBankingBank => '銀行';

  @override
  String get enableBankingCode => '授權後開啟頁面的網址';

  @override
  String get enableBankingCodeTooltip => '在銀行確認存取後，從瀏覽器複製網址並貼上至此處';

  @override
  String get enableBankingCountry => '國家（ISO 代碼，如 DE）';

  @override
  String get enableBankingDescription =>
      '使用您在 enablebanking.com 註冊的應用程式，透過 Enable Banking API（PSD2）匯入歐洲銀行的餘額與交易。僅限唯讀存取：不會執行任何付款。';

  @override
  String get enableBankingHeadline => 'Enable Banking (EU)';

  @override
  String get enableBankingIncomplete => '請填寫應用程式 ID、私密金鑰、重新導向 URL 與國家';

  @override
  String get enableBankingKey => '私密金鑰（PEM）';

  @override
  String get enableBankingKeyInvalid => '私密金鑰無效：需要 PEM 區塊「PRIVATE KEY」';

  @override
  String get enableBankingKeyNotRsa => '私密金鑰無效：需要 RSA 金鑰';

  @override
  String get enableBankingKeyTooltip =>
      '在 Enable Banking Control Panel 中隨應用程式一併建立；加密儲存。留空則保留已儲存的金鑰';

  @override
  String get enableBankingLoadBanks => '載入銀行';

  @override
  String get enableBankingNoAuthPage => 'Enable Banking 未傳回授權頁面';

  @override
  String get enableBankingNoCode => '網址中找不到授權碼';

  @override
  String get enableBankingRedirect => '重新導向 URL';

  @override
  String get enableBankingRedirectTooltip => '已為應用程式註冊；授權後銀行將返回此網址';

  @override
  String get enableBankingStateMismatch => '此網址屬於其他授權，請重新連線';

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
  String get finTsApproved => '已在銀行應用程式中核准';

  @override
  String get finTsBankCode => '銀行代碼 (BLZ)';

  @override
  String get finTsCustomerId => '客戶 ID（若與使用者 ID 不同）';

  @override
  String get finTsDescription =>
      '從支援 FinTS 4.1（PIN/TAN）的銀行匯入餘額與交易。僅限唯讀存取：不會執行任何付款。';

  @override
  String get finTsHeadline => 'Financial Transaction Services (FinTS 4.1)';

  @override
  String get finTsIncomplete => '請填寫伺服器 URL、銀行代碼、使用者 ID 與產品註冊編號';

  @override
  String finTsLoginChanged(Object value) {
    return '銀行已變更登入資料，請更新使用者 ID 或客戶 ID：$value';
  }

  @override
  String finTsLoginRefused(Object value) {
    return '銀行拒絕了上次登入：$value。要使用輸入的 PIN 重試嗎？';
  }

  @override
  String get finTsPin => 'PIN';

  @override
  String get finTsPinHint => '僅用於本次工作階段，絕不儲存';

  @override
  String get finTsProductId => '產品註冊編號';

  @override
  String get finTsProductIdTooltip => '由 Deutsche Kreditwirtschaft 核發給應用程式開發商';

  @override
  String get finTsTan => 'TAN';

  @override
  String get finTsTanHeadline => '交易驗證 (TAN)';

  @override
  String get finTsTanMedium => '選擇 TAN 媒介';

  @override
  String get finTsTanMethod => '選擇 TAN 方式';

  @override
  String get finTsUrl => '銀行的 FinTS 伺服器 URL';

  @override
  String get finTsUserId => '使用者 ID（登入）';

  @override
  String get finTsVersion => '通訊協定版本';

  @override
  String get finTsWebUnsupported => '銀行伺服器不允許從瀏覽器存取。請使用桌面或行動應用程式。';

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
  String get hour => '時間';

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
  String get integrationAccessDenied => '存取已被撤銷或憑證不正確';

  @override
  String get integrationConnect => '連線';

  @override
  String get integrationDateFrom => '匯入交易的起始日期';

  @override
  String get integrationDefaultBudgetCategory => '預設預算類別';

  @override
  String get integrationDisconnect => '中斷連線';

  @override
  String get integrationForget => '移除存取權';

  @override
  String get integrationHeadline => '整合';

  @override
  String integrationHttpError(Object value) {
    return '服務回傳錯誤（HTTP $value）';
  }

  @override
  String get integrationHttpsRequired => '僅允許安全（HTTPS）網址';

  @override
  String get integrationImport => '匯入交易';

  @override
  String integrationImported(Object added, Object pending, Object skipped) {
    return '已匯入：$added，因已存在而略過：$skipped，待處理（未匯入）：$pending';
  }

  @override
  String integrationInvalidAmount(Object value) {
    return '金額無效：$value';
  }

  @override
  String get integrationNoAccounts => '銀行未提供任何帳戶';

  @override
  String get integrationPaymentRequired => '此服務需要付費才能存取';

  @override
  String get integrationSelectTarget => '請選擇要匯入的帳戶與預算類別';

  @override
  String integrationServiceError(Object value) {
    return '服務訊息：$value';
  }

  @override
  String get integrationUnexpectedResponse => '服務傳回了非預期的回應';

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
  String get managerHeadline => '管理器';

  @override
  String get meaning => '意義';

  @override
  String get metricsHeadline => '度量';

  @override
  String get metricsTooltip => '指標';

  @override
  String get milestones => '里程碑';

  @override
  String get minute => '分鐘';

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
  String get secureBioNotMatch => '驗證失敗！請重新嘗試';

  @override
  String get secureBioPromptReason => '請進行驗證以繼續';

  @override
  String get secureBioPromptTitle => '生物特徵驗證';

  @override
  String get secureOtpCode => '一次性密碼代碼';

  @override
  String get secureOtpCodeInvalid => '無效！請獲取新代碼並輸入';

  @override
  String get secureOtpDeactivated => '密碼保護功能已停用';

  @override
  String get securePassword => '密碼（恢復短語）';

  @override
  String get securePasswordEmpty => '密碼不能為空！';

  @override
  String get securePasswordNotMatch => '密碼不匹配！';

  @override
  String get securePasswordRepeat => '重複密碼';

  @override
  String get securityHeadline => '安全性';

  @override
  String get settingsBaseHeadline => '基本知識';

  @override
  String get settingsHeadline => '設定';

  @override
  String get settingsSaved => '設定已儲存！';

  @override
  String get simpleFinDescription =>
      '透過 SimpleFIN Bridge 匯入美國銀行與發卡機構的餘額及交易。僅限唯讀存取：不會執行任何付款。';

  @override
  String get simpleFinHeadline => 'SimpleFIN Bridge (US)';

  @override
  String get simpleFinNoCredentials => 'SimpleFIN Bridge 傳回了不含憑證的存取網址';

  @override
  String get simpleFinToken => 'SimpleFIN 設定權杖';

  @override
  String get simpleFinTokenClaimed => '設定權杖不存在或已被使用';

  @override
  String get simpleFinTokenInvalid => 'SimpleFIN 設定權杖無效';

  @override
  String get simpleFinTokenTooltip =>
      '在您的 SimpleFIN Bridge（如 bridge.simplefin.org）中為本應用程式建立；只能使用一次';

  @override
  String get skipFromTotals => '總計不包括';

  @override
  String get skipTooltip => '跳過步驟';

  @override
  String get sortTooltip => '排序項目';

  @override
  String get sortingAmountAsc => '金額升序排列';

  @override
  String get sortingAmountDesc => '金額降序排列';

  @override
  String get sortingCreatedAtAsc => '建立日期升序排列';

  @override
  String get sortingCreatedAtDesc => '建立日期降序排列';

  @override
  String get sortingTitleAsc => '標題升序排列';

  @override
  String get sortingTitleDesc => '標題降序排列';

  @override
  String get sortingUpdatedAtAsc => '更新日期升序排列';

  @override
  String get sortingUpdatedAtDesc => '更新日期降序排列';

  @override
  String get spent => '花費';

  @override
  String get splitCancelTooltip => '取消每月分割';

  @override
  String get splitHeadline => '分攤帳單';

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
  String get wiseDescription =>
      '使用個人 API 權杖匯入 Wise 多幣別帳戶的餘額與交易。已連結餘額之間的換匯將以轉帳匯入。存取為唯讀：不會進行任何付款。';

  @override
  String get wiseHeadline => 'Wise API (Global)';

  @override
  String get wiseNoProfiles => '此權杖沒有可用的 Wise 個人檔案';

  @override
  String get wiseProfile => '個人檔案';

  @override
  String get wiseScaRequired => 'Wise 要求強式客戶驗證：請在 Wise 應用程式中開啟此餘額的對帳單，然後重試';

  @override
  String get wiseToken => '個人 API 權杖';

  @override
  String get wiseTokenSteps =>
      '如何取得個人 API 權杖：\n1. 在瀏覽器中登入 wise.com（行動應用程式中無法建立權杖）\n2. 開啟 設定 → 整合與工具 → API 權杖\n3. 選擇「新增權杖」，命名（如 Fingrom），並選擇「唯讀」權限\n4. 透過兩步驟驗證確認並複製權杖\n5. 貼到下方並點選「連線」';

  @override
  String get wiseTokenTooltip => '在 Wise 的 設定 → API 權杖 中建立（如可選則為唯讀）；加密儲存';

  @override
  String get zoomState => '放大/縮小';
}
