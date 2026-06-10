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
  String get navigationTooltip => 'Открыть главное меню';

  @override
  String netProfit(Object value) {
    return 'Прибыль: $value';
  }

  @override
  String get noChartData =>
      'Данные отсутствуют (или недостаточно) для отображения';

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
  String get zoomState => 'Увеличить / Уменьшить';
}
