// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Russian (`ru`).
class AppLocalizationsRu extends AppLocalizations {
  AppLocalizationsRu([String locale = 'ru']) : super(locale);

  @override
  String get a =>
      'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => 'О приложении';

  @override
  String get account => 'Счёт';

  @override
  String get accountFrom => 'Со счёта';

  @override
  String get accountHeadline => 'Счета';

  @override
  String get accountTo => 'На счёт';

  @override
  String get accountTooltip => 'Открыть счет';

  @override
  String get accountType => 'Тип счёта';

  @override
  String get accountTypeTooltip => 'Выберите тип счёта';

  @override
  String get acknowledgeTooltip => 'Подтвердить';

  @override
  String get activate => 'Активировать';

  @override
  String get actualData => 'Исторические данные';

  @override
  String get addAccountTooltip => 'Добавить счёт';

  @override
  String get addBudgetTooltip => 'Добавить новую категорию бюджета';

  @override
  String get addGoalTooltip => 'Добавить новую цель';

  @override
  String get addMainTooltip => 'Добавить расход, приход или перевод';

  @override
  String afterNDays(Object value) {
    return 'через $value дней';
  }

  @override
  String get akahuAppToken => 'Токен App ID';

  @override
  String get akahuDescription =>
      'Импорт остатков и операций банков Новой Зеландии, подключённых к Akahu, с помощью собственного бесплатного персонального приложения. Akahu обновляет данные из банков по своему расписанию (ежедневно), поэтому последние операции могут появиться позже. Доступ только для чтения: платежи не выполняются.';

  @override
  String get akahuHeadline => 'Akahu Personal App (Новая Зеландия)';

  @override
  String get akahuInactive =>
      'Akahu потерял доступ к этому счёту: подключите его заново на my.akahu.nz/connections';

  @override
  String get akahuIncomplete =>
      'Заполните токен App ID и токен доступа пользователя';

  @override
  String get akahuRefresh => 'Обновить данные';

  @override
  String get akahuRefreshed =>
      'Akahu получил запрос на загрузку новых данных из банков: повторите импорт через несколько минут (не чаще раза в час)';

  @override
  String get akahuSteps =>
      'Как получить токены:\n1. Зарегистрируйтесь на my.akahu.nz и подключите свои банки\n2. Откройте страницу «Developers», примите условия для разработчиков и настройте многофакторную аутентификацию\n3. Скопируйте токен App ID и токен доступа пользователя\n4. Вставьте их ниже и нажмите «Подключиться»';

  @override
  String get akahuTokenTooltip =>
      'Отображается на странице «Developers» на my.akahu.nz; хранится в зашифрованном виде';

  @override
  String get akahuUserToken => 'Токен доступа пользователя';

  @override
  String get amountFrom => 'Сумма от';

  @override
  String get amountTo => 'Сумма до';

  @override
  String appBuild(Object build) {
    return 'Сборка: $build';
  }

  @override
  String get appInitHeadline => 'Инициализация проекта';

  @override
  String get appStartHeadline => 'Начальная настройка';

  @override
  String get appTitle => 'Фингром';

  @override
  String appVersion(Object version) {
    return 'Версия: $version';
  }

  @override
  String get automationHeadline => 'Автоматизация';

  @override
  String get automationTypeDays => 'через несколько дней';

  @override
  String get backTooltip => 'Вернуться назад';

  @override
  String get balance => 'Текущий баланс';

  @override
  String get balanceDate => 'Обновление даты баланса';

  @override
  String get balanceDateTooltip =>
      'Расходы и доходы до этой даты не будут влиять на баланс';

  @override
  String get balanceTooltip => 'Установить баланс';

  @override
  String get bankAccount => 'Банковский счёт';

  @override
  String get bill => 'Чек';

  @override
  String get billHeadline => 'Чеки';

  @override
  String get billSetTooltip => 'Установить сумму';

  @override
  String billSum(Object value) {
    return 'Чеки: $value';
  }

  @override
  String get billTooltip => 'Открыть чек';

  @override
  String get billTypeTooltip => '[Тип] Расход, приход или перевод';

  @override
  String get brightnessTheme => 'Тема яркости';

  @override
  String get btnAdd => 'Добавить';

  @override
  String get btnCancel => 'Отмена';

  @override
  String get btnConfirm => 'Подтвердить';

  @override
  String get btnMore => 'Ещё';

  @override
  String get budget => 'Категория бюджета';

  @override
  String get budgetHeadline => 'Бюджеты';

  @override
  String get budgetLimit => 'Лимит в месяц';

  @override
  String get budgetLimitHeadline => 'Корректировка лимитов';

  @override
  String get budgetPositive => 'Бюджет, обработчик сводки';

  @override
  String get budgetPositiveOff => 'Игнорировать отрицательные значения';

  @override
  String get budgetPositiveOn => 'Включить отрицательные значения';

  @override
  String get budgetRelativeLimit => 'Относительный коэффициент в месяц';

  @override
  String get budgetTooltip => 'Открыть типы бюджета';

  @override
  String get budgetType => 'Интервал бюджетирования';

  @override
  String get budgetTypeAsIs => 'Фактический';

  @override
  String get budgetTypeFixed => 'Ограниченный';

  @override
  String get budgetTypeMonth => 'ежемесячно';

  @override
  String get budgetTypeRelative => 'Относительный';

  @override
  String get budgetTypeWeek => 'еженедельно';

  @override
  String get budgetTypeYear => 'ежегодно';

  @override
  String get cash => 'Наличные';

  @override
  String get chartBarRace => 'Расходы по категориям';

  @override
  String get chartForecast => 'Диаграмма прогноза';

  @override
  String get chartOHLC => 'Свечная диаграмма (OHLC)';

  @override
  String get chartYtdExpense => 'Расходы с начала года';

  @override
  String get clear => 'Очистить значение';

  @override
  String get closeTooltip => 'Закрыть';

  @override
  String get closedAt => 'Завершено до даты';

  @override
  String get cmpChart => 'Диаграммы';

  @override
  String get cmpRecent => 'Недавние элементы';

  @override
  String get cmpRecentCount => 'Размер списка';

  @override
  String get coAuthor => 'автор';

  @override
  String get coConsult => 'советник';

  @override
  String get coDeveloper => 'разработчик';

  @override
  String get coNew => 'Присоединиться';

  @override
  String get coPromoter => 'промоутер';

  @override
  String get coTranslator => 'переводчик';

  @override
  String get coef => 'коэф.';

  @override
  String get collapse => 'Свернуть (восстановить) раздел';

  @override
  String get color => 'Цвет';

  @override
  String get colorApp => 'Пользовательский';

  @override
  String get colorBackground => 'Фон';

  @override
  String get colorDark => 'Тёмный';

  @override
  String get colorInversePrimary => 'Обратный основному';

  @override
  String get colorInverseSurface => 'Обратная поверхность';

  @override
  String get colorLight => 'Светлый';

  @override
  String get colorOnInverseSurface => 'На обратной поверхности';

  @override
  String get colorOnSecondary => 'На вторичном';

  @override
  String get colorOnSecondaryContainer => 'На контейнере';

  @override
  String get colorPrimary => 'Основной';

  @override
  String get colorRestore => 'Сбросить палитру';

  @override
  String get colorSecondary => 'Вторичный';

  @override
  String get colorSystem => 'По умолчанию';

  @override
  String get colorTheme => 'Палитра';

  @override
  String get colorTooltip => 'Выберите цвет';

  @override
  String get colorType => 'Тип цвета';

  @override
  String get colorUser => 'Персональный';

  @override
  String columnMap(Object value) {
    return 'Отображение для столбца \'$value\'';
  }

  @override
  String columnMapTooltip(Object value) {
    return '\'$value\' - Выберите отображение столбца';
  }

  @override
  String get completeGoalTooltip => 'Завершить цель';

  @override
  String get confirmHeader => 'Подтвердить действие';

  @override
  String get confirmTooltip => 'Вы уверены? Это действие нельзя отменить.';

  @override
  String get contributors => 'Участники';

  @override
  String get conversion => 'Конвертация';

  @override
  String conversionMessage(Object currency) {
    return 'Взято в $currency';
  }

  @override
  String get copiedToClipboard => 'Скопировано в буфер обмена';

  @override
  String get createAccountHeader => 'Создать новый счёт';

  @override
  String get createAccountTooltip => 'Создать новый счёт';

  @override
  String get createBillHeader => 'Создать новую транзакцию';

  @override
  String get createBillTooltip => 'Добавить новый чек';

  @override
  String get createBudgetHeader => 'Новая категория бюджета';

  @override
  String get createBudgetTooltip => 'Создать новую категорию бюджета';

  @override
  String get createGoalHeader => 'Создать цель';

  @override
  String get createGoalTooltip => 'Добавить новую цель';

  @override
  String get createIncomeTooltip => 'Добавить новый доход';

  @override
  String get createPaymentTooltip => 'Добавить новый платёж';

  @override
  String get createTransferTooltip => 'Создать перевод';

  @override
  String get credit => 'Кредит';

  @override
  String get creditCard => 'Кредитная карта';

  @override
  String get currency => 'Валюта';

  @override
  String get currencyAddHeadline => 'Обмен валюты';

  @override
  String get currencyAddTooltip => 'Добавить курс обмена валюты';

  @override
  String get currencyDefault => 'Валюта по умолчанию';

  @override
  String get currencyDistribution => 'Распределение';

  @override
  String currencyExchange(Object from, Object to) {
    return 'Обмен валюты: $from -> $to';
  }

  @override
  String get currencyHeadline => 'Валюты';

  @override
  String currencyIn(Object value) {
    return 'В $value';
  }

  @override
  String get currencyShort => 'Валюта';

  @override
  String get currencyTooltip => 'Тип валюты (код)';

  @override
  String get currencyUpdateTooltip => 'Обновить курсы валют';

  @override
  String get currentDate => 'Указатель текущей даты';

  @override
  String get customAddTooltip => 'Добавить виджет';

  @override
  String get customDeleteTooltip => 'Удалить настройку';

  @override
  String get customSaveTooltip => 'Сохранить настройку';

  @override
  String get customizeTooltip => 'Настроить страницу';

  @override
  String get darkMode => 'Тёмный';

  @override
  String get dateFormat => 'Формат даты';

  @override
  String get dateRange => 'Диапазон дат';

  @override
  String get dateTooltip => 'Выберите дату';

  @override
  String get dayMonday => 'Понедельник';

  @override
  String get daySaturday => 'Суббота';

  @override
  String get dayStartOfMonth => 'Начало месяца';

  @override
  String get dayStartOfWeek => 'Начало недели';

  @override
  String get daySunday => 'Воскресенье';

  @override
  String get deactivateAction => 'Отключить защиту паролем';

  @override
  String get debitCard => 'Дебетовая карта';

  @override
  String def(Object value) {
    return 'Значение по умолчанию для \'$value\'';
  }

  @override
  String get deleteAccountTooltip => 'Деактивировать счёт';

  @override
  String get deleteBillTooltip => 'Удалить чек';

  @override
  String get deleteBudgetTooltip => 'Деактивировать категорию бюджета';

  @override
  String get deleteGoalTooltip => 'Удалить цель';

  @override
  String get deleteInvoiceTooltip => 'Удалить приход';

  @override
  String get deletePaymentTooltip => 'Удалить платёж';

  @override
  String get deleteTooltip => 'Удалить';

  @override
  String get deleteTransferTooltip => 'Удалить перевод';

  @override
  String get deposit => 'Депозит';

  @override
  String get description => 'Описание';

  @override
  String get descriptionTooltip => 'Установить детали расхода';

  @override
  String get design => 'Режим дизайна (специфичный для культуры)';

  @override
  String get designAsiaGeneral => 'Азия (Общее)';

  @override
  String get designGermany => 'Германия';

  @override
  String get designGlobal => 'Глобально';

  @override
  String get designRtlGeneral => 'Письмо справа налево';

  @override
  String get details => 'Детали';

  @override
  String get detailsTooltip => '****2345 - последние 4 цифры номера';

  @override
  String get dtAm => 'дп';

  @override
  String get dtAmPm => 'часы в дп/пп (0~11)';

  @override
  String get dtDay => 'день в месяце';

  @override
  String get dtEscape => 'экран для текста';

  @override
  String get dtHalfHour => 'часы в дп/пп (1~12)';

  @override
  String get dtHour => 'часы в день (0~23)';

  @override
  String get dtMinute => 'минуты в часе';

  @override
  String get dtMonth => 'месяц в году';

  @override
  String get dtNamedDay => 'день недели';

  @override
  String get dtPm => 'пп';

  @override
  String get dtQuote => 'одиночная кавычка';

  @override
  String get dtSecond => 'секунды в минуте';

  @override
  String get dtYear => 'год';

  @override
  String get editAccountHeader => 'Обновить счёт';

  @override
  String get editAccountTooltip => 'Редактировать счёт';

  @override
  String get editBillHeader => 'Обновить чек';

  @override
  String get editBillTooltip => 'Редактировать чек';

  @override
  String get editBudgetHeader => 'Обновить категорию бюджета';

  @override
  String get editBudgetTooltip => 'Редактировать категорию бюджета';

  @override
  String get editGoalHeader => 'Обновить цель';

  @override
  String get editGoalTooltip => 'Редактировать цель';

  @override
  String get editInvoiceTooltip => 'Редактировать приход';

  @override
  String get editPaymentTooltip => 'Редактировать платёж';

  @override
  String get editTooltip => 'Редактировать';

  @override
  String get editTransferTooltip => 'Редактировать перевод';

  @override
  String get enableBankingAppId => 'ID приложения';

  @override
  String get enableBankingBank => 'Банк';

  @override
  String get enableBankingCode => 'Адрес страницы после авторизации';

  @override
  String get enableBankingCodeTooltip =>
      'Подтвердите доступ в банке, затем скопируйте адрес из браузера и вставьте его сюда';

  @override
  String get enableBankingCountry => 'Страна (код ISO, например FI)';

  @override
  String get enableBankingDescription =>
      'Импорт остатков и операций европейских банков через Enable Banking API (PSD2) с вашим собственным приложением, зарегистрированным на enablebanking.com. Доступ только для чтения: платежи не выполняются.';

  @override
  String get enableBankingHeadline => 'Enable Banking (EU)';

  @override
  String get enableBankingIncomplete =>
      'Заполните ID приложения, закрытый ключ, URL перенаправления и страну';

  @override
  String get enableBankingKey => 'Закрытый ключ (PEM)';

  @override
  String get enableBankingKeyInvalid =>
      'Неверный закрытый ключ: ожидается PEM-блок \"PRIVATE KEY\"';

  @override
  String get enableBankingKeyNotRsa =>
      'Неверный закрытый ключ: ожидается ключ RSA';

  @override
  String get enableBankingKeyTooltip =>
      'Создаётся вместе с приложением в Enable Banking Control Panel; хранится в зашифрованном виде. Оставьте пустым, чтобы сохранить текущий ключ';

  @override
  String get enableBankingLoadBanks => 'Загрузить банки';

  @override
  String get enableBankingNoAuthPage =>
      'Enable Banking не вернул страницу авторизации';

  @override
  String get enableBankingNoCode => 'В адресе не найден код авторизации';

  @override
  String get enableBankingRedirect => 'URL перенаправления';

  @override
  String get enableBankingRedirectTooltip =>
      'Зарегистрирован для приложения; после авторизации банк возвращает на него';

  @override
  String get enableBankingStateMismatch =>
      'Адрес относится к другой авторизации, подключитесь заново';

  @override
  String get encryptionMode => 'Шифрование данных';

  @override
  String error(Object value) {
    return 'Ошибка: $value';
  }

  @override
  String get errorExpired => 'Карта истекла';

  @override
  String get errorNegative =>
      'Не может быть отрицательным! Пожалуйста, исправьте ошибку';

  @override
  String get example => 'Пример';

  @override
  String get expand => 'Развернуть раздел';

  @override
  String get expense => 'Сумма расходов';

  @override
  String get expenseDateTime => 'Выставлено счётом в';

  @override
  String get expenseHeadline => 'Расход';

  @override
  String get expenseTransfer => 'Сумма перевода';

  @override
  String exportFile(Object value) {
    return 'Экспортировать как .$value-файл';
  }

  @override
  String get failData => 'Размер вычета';

  @override
  String get finTsApproved => 'Подтверждено в банковском приложении';

  @override
  String get finTsBankCode => 'Код банка (BLZ)';

  @override
  String get finTsCustomerId =>
      'ID клиента (если отличается от ID пользователя)';

  @override
  String get finTsDescription =>
      'Импорт остатков и операций из банков с поддержкой FinTS 4.1 (PIN/TAN). Доступ только для чтения: платежи не выполняются.';

  @override
  String get finTsHeadline => 'Financial Transaction Services (FinTS 4.1)';

  @override
  String get finTsIncomplete =>
      'Заполните URL сервера, код банка, ID пользователя и регистрационный номер продукта';

  @override
  String finTsLoginChanged(Object value) {
    return 'Банк изменил данные для входа, обновите ID пользователя или ID клиента: $value';
  }

  @override
  String finTsLoginRefused(Object value) {
    return 'Банк отклонил предыдущий вход: $value. Повторить с введённым PIN?';
  }

  @override
  String get finTsPin => 'PIN';

  @override
  String get finTsPinHint =>
      'Используется только в этом сеансе и никогда не сохраняется';

  @override
  String get finTsProductId => 'Регистрационный номер продукта';

  @override
  String get finTsProductIdTooltip =>
      'Выдаётся Deutsche Kreditwirtschaft разработчику приложения';

  @override
  String get finTsTan => 'TAN';

  @override
  String get finTsTanHeadline => 'Подтверждение операции (TAN)';

  @override
  String get finTsTanMedium => 'Выберите носитель TAN';

  @override
  String get finTsTanMethod => 'Выберите способ TAN';

  @override
  String get finTsUrl => 'URL сервера FinTS банка';

  @override
  String get finTsUserId => 'ID пользователя (логин)';

  @override
  String get finTsVersion => 'Версия протокола';

  @override
  String get finTsWebUnsupported =>
      'Серверы банков не разрешают доступ из браузера. Используйте настольное или мобильное приложение.';

  @override
  String get flowTypeInvoice => 'Приход';

  @override
  String get flowTypeTooltip => 'Тип суммы: Чек, Приход';

  @override
  String get forecastData => 'Прогноз';

  @override
  String get from => 'от';

  @override
  String get goNextTooltip => 'Перейти далее';

  @override
  String get goalHeadline => 'Цели';

  @override
  String goalProfit(Object value) {
    return 'Целевой показатель: $value';
  }

  @override
  String get goalProfitTooltip => 'Прибыль | целевой показатель';

  @override
  String get goalTooltip => 'Открыть цели';

  @override
  String get hasEncrypted => 'После установки нельзя изменить';

  @override
  String get helpTooltip => '[Справка] Показать описание этой страницы';

  @override
  String get homeHeadline => 'Главная';

  @override
  String get homeTooltip => 'Вернуться на главную страницу';

  @override
  String get hour => 'Час';

  @override
  String get icon => 'Значок';

  @override
  String get iconTooltip => 'Выберите значок';

  @override
  String get ignoreTooltip => 'Игнорировать';

  @override
  String get importHeadline => 'Импорт / Экспорт';

  @override
  String get income => 'Сумма дохода';

  @override
  String get incomeHeadline => 'Доход';

  @override
  String get incomeHealth => 'Радар здоровья доходов';

  @override
  String get incomeTooltip => 'Установить детали дохода';

  @override
  String get integrationAccessDenied =>
      'Доступ отозван или учётные данные неверны';

  @override
  String get integrationConnect => 'Подключиться';

  @override
  String get integrationDateFrom => 'Импортировать операции с';

  @override
  String get integrationDefaultBudgetCategory =>
      'Категория бюджета по умолчанию';

  @override
  String get integrationDisconnect => 'Отключиться';

  @override
  String get integrationForget => 'Забыть доступ';

  @override
  String get integrationHeadline => 'Интеграции';

  @override
  String integrationHttpError(Object value) {
    return 'Сервис ответил ошибкой (HTTP $value)';
  }

  @override
  String get integrationHttpsRequired =>
      'Разрешены только защищённые адреса (HTTPS)';

  @override
  String get integrationImport => 'Импортировать операции';

  @override
  String integrationImported(Object added, Object pending, Object skipped) {
    return 'Импортировано: $added, пропущено как уже существующие: $skipped, в обработке (не импортированы): $pending';
  }

  @override
  String integrationInvalidAmount(Object value) {
    return 'Неверная сумма: $value';
  }

  @override
  String get integrationNoAccounts => 'Банк не предоставил ни одного счёта';

  @override
  String get integrationPaymentRequired => 'Сервис требует оплаты доступа';

  @override
  String get integrationSelectTarget =>
      'Выберите счёт и категорию бюджета для импорта';

  @override
  String integrationServiceError(Object value) {
    return 'Сообщение сервиса: $value';
  }

  @override
  String get integrationUnexpectedResponse => 'Неожиданный ответ сервиса';

  @override
  String get investecApiKey => 'API-ключ';

  @override
  String get investecClientId => 'ID клиента';

  @override
  String get investecCredentialsTooltip =>
      'Создаётся в Investec Online в разделе Investec Developer → API keys; хранится в зашифрованном виде';

  @override
  String get investecDescription =>
      'Импорт остатков и операций счетов Investec Private Banking (ЮАР) через Programmable Banking API с собственными API-ключами. Доступ только для чтения: платежи не выполняются.';

  @override
  String get investecHeadline => 'Investec Programmable Banking (ЮАР)';

  @override
  String get investecIncomplete => 'Заполните ID клиента, секрет и API-ключ';

  @override
  String get investecSandbox => 'Sandbox (тестовые данные)';

  @override
  String get investecSecret => 'Секрет';

  @override
  String get investecSteps =>
      'Как получить API-ключи:\n1. Войдите в Investec Online и зарегистрируйтесь в Investec Developer (Programmable Banking)\n2. Откройте API keys и создайте ключ с доступом к счетам и операциям\n3. Подтвердите его двухэтапной проверкой и скопируйте ID клиента, секрет и API-ключ\n4. Вставьте их ниже и нажмите «Подключиться»';

  @override
  String get invoiceHeadline => 'Доходы';

  @override
  String invoiceSum(Object value) {
    return 'Доходы: $value';
  }

  @override
  String get isCleaned => 'Удалить существующие данные';

  @override
  String get isCreated => 'Уже создано, следуйте далее!';

  @override
  String get isEncrypted => 'Файл зашифрован (по умолчанию)';

  @override
  String get isRequired => 'требуется';

  @override
  String get language => 'Язык';

  @override
  String get left => 'осталось';

  @override
  String get lightMode => 'Светлый';

  @override
  String get link => 'Единый указатель ресурса (URL)';

  @override
  String get managerHeadline => 'Менеджер';

  @override
  String get meaning => 'Значение';

  @override
  String get metricsHeadline => 'Метрики';

  @override
  String get metricsTooltip => 'Метрики';

  @override
  String get milestones => 'Вехи';

  @override
  String get minute => 'Минута';

  @override
  String get missingContent => 'Файл не может быть обработан (либо отменён)';

  @override
  String get monobankCreateAccount => 'Создать счёт';

  @override
  String get monobankDescription =>
      'Импорт остатков и операций карт и банок monobank с помощью персонального токена. monobank разрешает один запрос в минуту: импорт за долгий период занимает несколько минут. Доступ только для чтения: платежи не выполняются.';

  @override
  String get monobankHeadline => 'monobank Personal API (Украина)';

  @override
  String get monobankJar => 'Банка';

  @override
  String monobankProgress(Object done, Object total) {
    return 'Запрос выписок: $done из $total';
  }

  @override
  String monobankRateLimit(Object value) {
    return 'monobank разрешает один запрос в минуту: следующий через $value с';
  }

  @override
  String get monobankToken => 'Персональный токен';

  @override
  String get monobankTokenSteps =>
      'Как получить персональный токен:\n1. Откройте api.monobank.ua в браузере\n2. Отсканируйте QR-код в приложении monobank и подтвердите доступ\n3. Скопируйте токен со страницы\n4. Вставьте его ниже и нажмите «Подключиться»\n5. Привяжите каждую карту или банку к счёту (или создайте его) и импортируйте';

  @override
  String get monobankTokenTooltip =>
      'Выдаётся на api.monobank.ua после сканирования QR-кода в приложении monobank; хранится в зашифрованном виде';

  @override
  String get monzoApprove =>
      'Подтвердите доступ в приложении Monzo, затем снова нажмите «Подключиться»';

  @override
  String get monzoClientId => 'ID клиента';

  @override
  String get monzoClientSecret => 'Секрет клиента';

  @override
  String get monzoClientSecretTooltip =>
      'Отображается для OAuth-клиента на developers.monzo.com; хранится в зашифрованном виде. Оставьте пустым, чтобы сохранить текущий секрет';

  @override
  String get monzoCode => 'Адрес страницы после входа';

  @override
  String get monzoCodeTooltip =>
      'Если Fingrom не открылся автоматически, скопируйте адрес из браузера и вставьте его сюда';

  @override
  String get monzoDescription =>
      'Импорт остатков и операций счетов Monzo с собственным OAuth-клиентом, зарегистрированным на developers.monzo.com (только для личного использования). Доступ только для чтения: платежи не выполняются.';

  @override
  String get monzoExpired => 'Срок доступа к Monzo истёк: подключитесь заново';

  @override
  String monzoFullHistory(Object value) {
    return 'Полная история доступна до $value: выберите более раннюю дату и импортируйте сейчас. Позже Monzo предоставляет только последние 90 дней';
  }

  @override
  String get monzoHeadline => 'Monzo Developer API (Великобритания)';

  @override
  String monzoHistoryLimited(Object value) {
    return 'Monzo предоставляет только последние 90 дней: операции импортируются с $value';
  }

  @override
  String get monzoIncomplete =>
      'Заполните ID клиента, секрет клиента и URL перенаправления';

  @override
  String get monzoRedirect => 'URL перенаправления';

  @override
  String get monzoRedirectTooltip =>
      'Укажите именно этот адрес для OAuth-клиента; после входа Monzo возвращает на него';

  @override
  String get monzoSteps =>
      'Как подключиться:\n1. Войдите на developers.monzo.com с электронной почтой вашего аккаунта Monzo\n2. Откройте Clients → New OAuth Client, выберите «Confidential» и укажите URL перенаправления, показанный ниже\n3. Скопируйте ID клиента и секрет клиента, вставьте их ниже и нажмите «Подключиться»\n4. Откройте ссылку из письма, подтвердите доступ в приложении Monzo и снова нажмите «Подключиться»\n5. Импортируйте сразу: полная история доступна только 5 минут после подтверждения, позже — только последние 90 дней';

  @override
  String get navigationTooltip => 'Открыть главное меню';

  @override
  String netProfit(Object value) {
    return 'Прибыль: $value';
  }

  @override
  String get noChartData =>
      'Данные отсутствуют (или недостаточно) для отображения';

  @override
  String get notificationAccessSettings => 'Доступ к уведомлениям';

  @override
  String get notificationAccessSteps =>
      'Как предоставить доступ:\n1. Нажмите \"Предоставить доступ\", чтобы открыть системные настройки\n2. Разрешите Fingrom читать уведомления\n3. Если Android сообщает об ограниченной настройке: откройте сведения о приложении Fingrom → ⋮ → \"Разрешить ограниченные настройки\" и повторите\n4. Вернитесь в Fingrom и выберите приложения для чтения уведомлений';

  @override
  String get notificationAccounts => 'Ключевые слова счетов';

  @override
  String get notificationAccountsTooltip =>
      'Слова, по которым в уведомлении распознаётся счёт (последние цифры карты, название кошелька): введите слово и нажмите Enter, чтобы добавить его. Иначе используется счёт по умолчанию для приложения';

  @override
  String get notificationApps => 'Приложения для чтения уведомлений';

  @override
  String notificationAutoImported(Object value) {
    return 'Добавлено из уведомлений: $value';
  }

  @override
  String get notificationAutoTooltip =>
      'Распознанные уведомления добавляются без подтверждения: сразу, если Fingrom запущен, иначе при следующем запуске. Нераспознанные ждут проверки';

  @override
  String get notificationBalance => 'Ключевые слова баланса';

  @override
  String get notificationBalanceTooltip =>
      'Слова перед суммой, которую нужно игнорировать (баланс, лимит): введите слово и нажмите Enter, чтобы добавить его';

  @override
  String notificationCaptured(Object value) {
    return 'Получено уведомлений: $value';
  }

  @override
  String get notificationClear => 'Очистить полученные';

  @override
  String get notificationCurrencyTooltip =>
      'Суммы без валюты (например, Списано 20.00) учитываются в этой валюте';

  @override
  String get notificationDefaultAccount => 'Счёт по умолчанию';

  @override
  String get notificationDescription =>
      'Создание операций из уведомлений банковских и платёжных приложений на этом устройстве. Читаются только уведомления выбранных приложений, и они хранятся на устройстве до импорта. Сумма и валюта распознаются автоматически.';

  @override
  String get notificationGrant => 'Предоставить доступ';

  @override
  String get notificationIncome => 'Ключевые слова дохода';

  @override
  String get notificationIncomeTooltip =>
      'Слова, отмечающие уведомление как доход: введите слово и нажмите Enter, чтобы добавить его';

  @override
  String get notificationMerchant => 'Метки продавца';

  @override
  String get notificationMerchantTooltip =>
      'Слова, за которыми следуют двоеточие и продавец (Место: Магазин): введите слово и нажмите Enter, чтобы добавить его';

  @override
  String get notificationNoApps =>
      'Уведомлений ещё не было: приложения появятся здесь после того, как пришлют уведомление';

  @override
  String get notificationUnparsed => 'Не распознано';

  @override
  String get notifyHeadline => 'Парсер уведомлений';

  @override
  String get ok => 'OK';

  @override
  String get orderPin => 'Приоритетный порядок';

  @override
  String get orderUnpin => 'Обобщённый порядок';

  @override
  String get outputFile => 'Расположение для файла';

  @override
  String get parseFile => 'Обработать файл';

  @override
  String get password => 'Пароль';

  @override
  String get path => 'Имя файла (для сохранения или загрузки)';

  @override
  String get paymentType => 'Интервал платежа';

  @override
  String get paymentsHeadline => 'Повторяющиеся платежи';

  @override
  String get pearDisabled => '-- отключено --';

  @override
  String get pearLoading => 'В процессе...';

  @override
  String get peerAccept => 'принять';

  @override
  String get peerAction => 'Действие';

  @override
  String get peerClosed => 'прекращено';

  @override
  String get peerConnect => 'Подключить устройство';

  @override
  String get peerConnectBtn => 'подключить';

  @override
  String get peerDelete => 'удалить';

  @override
  String get peerDevice => 'Подключённые устройства';

  @override
  String get peerId => 'Идентификатор вашего устройства для подключения';

  @override
  String get peerOffline => 'не в сети';

  @override
  String get peerOnline => 'подключено';

  @override
  String get peerOtherId => 'Идентификатор устройства для подключения';

  @override
  String get peerPending => 'ожидание';

  @override
  String get peerPing => 'проверка соединения';

  @override
  String get peerSent => 'Данные передаются подключённым устройствам';

  @override
  String get peerStatus => 'Статус';

  @override
  String get peerSync => 'Передать данные';

  @override
  String pickFile(Object value) {
    return 'Выберите .$value-файл';
  }

  @override
  String pongStatus(Object uuid) {
    return 'Получен ответ от $uuid';
  }

  @override
  String get privatBankAdd => 'Добавить счёт';

  @override
  String get privatBankDescription =>
      'Импорт остатков и операций бизнес-счетов (ФЛП и компаний) Приват24 для бизнеса с помощью токена Автоклиента. Личные счета API не поддерживает. Доступ только для чтения: платежи не выполняются.';

  @override
  String get privatBankHeadline => 'ПриватБанк Автоклиент (Украина)';

  @override
  String get privatBankIban => 'IBAN счёта';

  @override
  String get privatBankIbanInvalid => 'Введите украинский IBAN: UA и 27 цифр';

  @override
  String get privatBankIbanTooltip =>
      'API не предоставляет список счетов: добавьте IBAN счетов по одному';

  @override
  String privatBankNotReady(Object value) {
    return 'ПриватБанк готовит выписки (фаза $value): повторите попытку через несколько минут';
  }

  @override
  String get privatBankRemove => 'Удалить счёт';

  @override
  String get privatBankToken => 'Токен Автоклиента';

  @override
  String get privatBankTokenSteps =>
      'Как получить токен Автоклиента:\n1. Войдите в Приват24 для бизнеса\n2. Откройте «Интеграция (Автоклиент)»\n3. Активируйте её и скопируйте токен\n4. Вставьте его ниже и нажмите «Подключиться»\n5. Добавьте IBAN счетов для импорта';

  @override
  String get privatBankTokenTooltip =>
      'Выдаётся в Приват24 для бизнеса в разделе «Интеграция (Автоклиент)»; хранится в зашифрованном виде';

  @override
  String get processIsFinished => 'Готово!';

  @override
  String progress(Object value) {
    return 'Прогресс: $value%';
  }

  @override
  String get raiseData => 'Размер данных';

  @override
  String get recoveryHeadline => 'Восстановление';

  @override
  String get recoveryTooltip => 'Восстановить из';

  @override
  String get releases => 'Выпуски';

  @override
  String get reset => 'сброс';

  @override
  String get returnBack => 'Вернуться назад';

  @override
  String get roadmap => 'Дорожная карта';

  @override
  String get saveNotification => 'Изменения сохранены!';

  @override
  String get saveSettingsTooltip => 'Сохранить';

  @override
  String get saveTooltip => 'Сохранить в';

  @override
  String search(Object value) {
    return 'Показать по шаблону \'$value\'';
  }

  @override
  String get searchTooltip => 'Поиск';

  @override
  String get secureBioNotMatch =>
      'Вход не удался! Пожалуйста, попробуйте снова';

  @override
  String get secureBioPromptReason =>
      'Пожалуйста, авторизируйтесь для продолжения';

  @override
  String get secureBioPromptTitle => 'Биометрическая аутентификация';

  @override
  String get secureOtpCode => 'Код одноразового пароля';

  @override
  String get secureOtpCodeInvalid =>
      'Неверно! Пожалуйста, возьмите свежий код и введите его';

  @override
  String get secureOtpDeactivated => 'Защита паролем отключена';

  @override
  String get securePassword => 'Пароль (фраза для восстановления)';

  @override
  String get securePasswordEmpty => 'Пароль не может быть пустым!';

  @override
  String get securePasswordNotMatch => 'Пароли не совпадают!';

  @override
  String get securePasswordRepeat => 'Повторите пароль';

  @override
  String get securityHeadline => 'Безопасность';

  @override
  String get settingsBaseHeadline => 'Основы';

  @override
  String get settingsHeadline => 'Параметры';

  @override
  String get settingsSaved => 'Параметры сохранены!';

  @override
  String get simpleFinDescription =>
      'Импорт остатков и операций банков и эмитентов карт США через SimpleFIN Bridge. Доступ только для чтения: платежи не выполняются.';

  @override
  String get simpleFinHeadline => 'SimpleFIN Bridge (US)';

  @override
  String get simpleFinNoCredentials =>
      'SimpleFIN Bridge вернул адрес доступа без учётных данных';

  @override
  String get simpleFinToken => 'Токен настройки SimpleFIN';

  @override
  String get simpleFinTokenClaimed =>
      'Токен настройки не существует или уже был использован';

  @override
  String get simpleFinTokenInvalid => 'Неверный токен настройки SimpleFIN';

  @override
  String get simpleFinTokenTooltip =>
      'Создаётся в вашем SimpleFIN Bridge (например, bridge.simplefin.org) для этого приложения; используется только один раз';

  @override
  String get skipFromTotals => 'Исключить из итогов';

  @override
  String get skipTooltip => 'Пропустить шаг(и)';

  @override
  String get sortTooltip => 'Сортировать элементы';

  @override
  String get sortingAmountAsc => 'Сумма, по возрастанию';

  @override
  String get sortingAmountDesc => 'Сумма, по убыванию';

  @override
  String get sortingCreatedAtAsc => 'Создано, по возрастанию';

  @override
  String get sortingCreatedAtDesc => 'Создано, по убыванию';

  @override
  String get sortingTitleAsc => 'Название, по возрастанию';

  @override
  String get sortingTitleDesc => 'Название, по убыванию';

  @override
  String get sortingUpdatedAtAsc => 'Обновлено, по возрастанию';

  @override
  String get sortingUpdatedAtDesc => 'Обновлено, по убыванию';

  @override
  String get spent => 'потрачено';

  @override
  String get splitCancelTooltip => 'Отменить разделение';

  @override
  String get splitHeadline => 'Разделить счёт';

  @override
  String get splitTooltip => 'Выставить лимиты на месяц';

  @override
  String get starlingDescription =>
      'Импорт остатков и операций счетов Starling Bank с помощью персонального токена доступа вашего бесплатного аккаунта разработчика. Доступ только для чтения: платежи не выполняются.';

  @override
  String get starlingHeadline =>
      'Starling Bank Personal Access (Великобритания)';

  @override
  String get starlingScopes =>
      'У токена не хватает разрешения: создайте его с областями доступа \"account:read\", \"balance:read\" и \"transaction:read\"';

  @override
  String get starlingToken => 'Персональный токен доступа';

  @override
  String get starlingTokenSteps =>
      'Как получить персональный токен доступа:\n1. Зарегистрируйтесь на developer.starlingbank.com (бесплатно)\n2. Откройте Personal Access, добавьте свой аккаунт Starling и подтвердите его в приложении Starling\n3. Создайте токен с областями доступа \"account:read\", \"balance:read\" и \"transaction:read\"\n4. Вставьте его ниже и нажмите «Подключиться»';

  @override
  String get starlingTokenTooltip =>
      'Создаётся на developer.starlingbank.com в разделе Personal Access; хранится в зашифрованном виде';

  @override
  String get subscription =>
      'Как проект с открытым исходным кодом, подписка не разблокирует никаких дополнительных функций. Однако это послужит инвестицией в непрерывное развитие и совершенствование приложения, а также в сохранение его доступности.';

  @override
  String get subscriptionCoffee => 'Купить кофе';

  @override
  String get subscriptionDinner => 'Угостить ужином';

  @override
  String get subscriptionDonorbox => 'Подписаться через Donorbox';

  @override
  String get subscriptionGithub => 'Подписаться через GitHub';

  @override
  String get subscriptionHeadline => 'Спонсорство';

  @override
  String get subscriptionInactive => 'Сервис покупки недоступен';

  @override
  String get subscriptionPatreon => 'Подписаться через Patreon';

  @override
  String get subscriptionPaypal => 'Купить кофе (PayPal)';

  @override
  String get subscriptionTiny => 'Дать счастливую монету';

  @override
  String get subscriptionTooltip => 'Поддержка (спонсорство)';

  @override
  String get success => 'Успешно';

  @override
  String get summary => 'Резюме';

  @override
  String get symbol => 'Символ';

  @override
  String get syncHeadline => 'Синхронизировать устройства';

  @override
  String get systemMode => 'Система';

  @override
  String get tapToOpen => 'Нажмите для открытия';

  @override
  String get targetAmount => 'Целевая сумма';

  @override
  String get tellerAccessToken => 'Токен доступа';

  @override
  String get tellerAccessTokenTooltip =>
      'Показывается на странице подключения после привязки банка: вставьте его сюда, если Fingrom не открылся автоматически';

  @override
  String get tellerAppId => 'ID приложения';

  @override
  String get tellerAppIdTooltip =>
      'Показан в Teller Dashboard, начинается с \"app_\"';

  @override
  String get tellerCertificate => 'Сертификат (PEM)';

  @override
  String get tellerCertificateInvalid =>
      'Неверный сертификат: ожидается PEM-блок \"CERTIFICATE\"';

  @override
  String get tellerCertificateTooltip =>
      'Выдаётся в Teller Dashboard (Certificates); хранится в зашифрованном виде. Оставьте пустым, чтобы сохранить текущий сертификат';

  @override
  String get tellerConnectBank => 'Подключить банк';

  @override
  String get tellerConnectPage => 'Страница подключения';

  @override
  String get tellerConnectPageTooltip =>
      'Открывает Teller Connect в браузере и возвращает токен доступа в Fingrom';

  @override
  String get tellerDescription =>
      'Импорт остатков и операций банков и эмитентов карт США через Teller с собственным приложением, зарегистрированным на teller.io (бесплатный тариф допускает 100 реальных подключений к банкам). Доступ только для чтения: платежи не выполняются.';

  @override
  String get tellerDisconnected =>
      'Подключение к банку требует вашего внимания (например, нового входа или кода подтверждения): подключите банк заново';

  @override
  String get tellerEnvironment => 'Среда';

  @override
  String get tellerHeadline => 'Teller (US)';

  @override
  String get tellerIncomplete =>
      'Заполните ID приложения; сертификат и закрытый ключ нужны для реальных банковских данных';

  @override
  String get tellerKey => 'Закрытый ключ (PEM)';

  @override
  String get tellerKeyInvalid =>
      'Неверный закрытый ключ: ожидается PEM-блок \"PRIVATE KEY\"';

  @override
  String get tellerKeyTooltip =>
      'Скачивается вместе с сертификатом; хранится в зашифрованном виде. Оставьте пустым, чтобы сохранить текущий ключ';

  @override
  String get tellerMissingCertificate =>
      'Teller отклонил запрос без клиентского сертификата: загрузите сертификат и закрытый ключ или выберите sandbox';

  @override
  String get tellerSteps =>
      'Как подключиться:\n1. Зарегистрируйтесь на teller.io и откройте Teller Dashboard\n2. Скопируйте ID приложения, затем создайте и скачайте сертификат с закрытым ключом (Certificates)\n3. Заполните их ниже и выберите среду (sandbox: тестовые данные, вход в банк как \"username\" с паролем \"password\")\n4. Нажмите «Подключить банк» и войдите в свой банк на открывшейся странице\n5. Выберите счёт и категорию бюджета, затем нажмите «Импортировать операции»';

  @override
  String get tellerUpload => 'Загрузить файл';

  @override
  String get termPrivacy => 'Политика конфиденциальности';

  @override
  String get termUse => 'Условия использования';

  @override
  String get title => 'Название';

  @override
  String get titleAccountTooltip => 'Введите идентификатор счёта';

  @override
  String get titleBudgetTooltip => 'Введите имя категории бюджета';

  @override
  String get titleGoal => 'Цель';

  @override
  String get titleGoalTooltip => 'Определите описание цели';

  @override
  String get to => 'на';

  @override
  String get total => 'всего';

  @override
  String get transactionFile => 'Файл журнала транзакций Фингром (.log)';

  @override
  String get transferHeadline => 'Перевод';

  @override
  String get transferTooltip => 'Установить детали перевода';

  @override
  String get transfersHeadline => 'Переводы';

  @override
  String get typeButton => 'Кнопка';

  @override
  String get updateAccountTooltip => 'Обновить счёт';

  @override
  String get updateBillTooltip => 'Обновить чек';

  @override
  String get updateBudgetTooltip => 'Обновить категорию бюджета';

  @override
  String get updateGoalTooltip => 'Обновить цель';

  @override
  String get updatePaymentTooltip => 'Обновить платёж';

  @override
  String get username => 'Имя пользователя (счёт)';

  @override
  String get uuid => 'Уникальный идентификатор транзакции';

  @override
  String get validTillDate => 'Действительно до';

  @override
  String get webDav => 'Веб-распределённое версионирование (WebDav)';

  @override
  String get wiseDescription =>
      'Импорт остатков и операций мультивалютных счетов Wise с помощью персонального API-токена. Конвертации между связанными балансами импортируются как переводы. Доступ только для чтения: платежи не выполняются.';

  @override
  String get wiseHeadline => 'Wise API (Global)';

  @override
  String get wiseNoProfiles => 'Для токена нет доступных профилей Wise';

  @override
  String get wiseProfile => 'Профиль';

  @override
  String get wiseScaRequired =>
      'Wise требует строгой аутентификации клиента: откройте выписку по этому балансу в приложении Wise и повторите попытку';

  @override
  String get wiseToken => 'Персональный API-токен';

  @override
  String get wiseTokenSteps =>
      'Как получить персональный API-токен:\n1. Войдите на wise.com в браузере (в мобильном приложении токены не создаются)\n2. Откройте Настройки → Интеграции и инструменты → API-токены\n3. Нажмите «Добавить токен», задайте имя (например, Fingrom) и выберите доступ «Только чтение»\n4. Подтвердите двухэтапной проверкой и скопируйте токен\n5. Вставьте его ниже и нажмите «Подключиться»';

  @override
  String get wiseTokenTooltip =>
      'Создаётся в Wise в разделе Настройки → API-токены (только для чтения, если доступно); хранится в зашифрованном виде';

  @override
  String get zoomState => 'Увеличить / Уменьшить';
}
