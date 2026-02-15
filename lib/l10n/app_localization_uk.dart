// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Ukrainian (`uk`).
class AppLocalizationsUk extends AppLocalizations {
  AppLocalizationsUk([String locale = 'uk']) : super(locale);

  @override
  String get a =>
      'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => 'Про додаток';

  @override
  String get account => 'Рахунок';

  @override
  String get accountFrom => 'З рахунку';

  @override
  String get accountHeadline => 'Рахунки';

  @override
  String get accountTo => 'До рахунку';

  @override
  String get accountTooltip => 'Відкрити рахунки';

  @override
  String get accountType => 'Тип рахунку';

  @override
  String get accountTypeTooltip => 'Оберіть тип рахунку';

  @override
  String get acknowledgeTooltip => 'Прийняти';

  @override
  String get activate => 'Активувати';

  @override
  String get actualData => 'Історичні дані';

  @override
  String get addAccountTooltip => 'Додати рахунок';

  @override
  String get addBudgetTooltip => 'Додати категорію бюджету';

  @override
  String get addGoalTooltip => 'Додати мету';

  @override
  String get addMainTooltip => 'Додати чек, прибуток чи переказ';

  @override
  String afterNDays(Object value) {
    return 'через $value днів';
  }

  @override
  String get amountFrom => 'Сума від';

  @override
  String get amountTo => 'Сума до';

  @override
  String appBuild(Object build) {
    return 'Збірка: $build';
  }

  @override
  String get appInitHeadline => 'Ініціалізація проекту';

  @override
  String get appStartHeadline => 'Початкове налаштуваннє';

  @override
  String get appTitle => 'Fingrom';

  @override
  String appVersion(Object version) {
    return 'Версія: $version';
  }

  @override
  String get automationHeadline => 'Автоматизація';

  @override
  String get automationTypeDays => 'через кілька днів';

  @override
  String get backTooltip => 'Повернутися';

  @override
  String get balance => 'Фактичний баланс';

  @override
  String get balanceDate => 'Дата оновлення балансу';

  @override
  String get balanceDateTooltip =>
      'Відрахування та прибутки до цієї дати не вплинуть на баланс';

  @override
  String get balanceTooltip => 'Встановити баланс';

  @override
  String get bankAccount => 'Банківський рахунок';

  @override
  String get bill => 'Чек';

  @override
  String get billHeadline => 'Чеки';

  @override
  String get billSetTooltip => 'Встановити суму';

  @override
  String billSum(Object value) {
    return 'Чеки: $value';
  }

  @override
  String get billTooltip => 'Відкрити чеки';

  @override
  String get billTypeTooltip => '[Тип] Чек, прибуток або переказ';

  @override
  String get brightnessTheme => 'Тип яскравосці';

  @override
  String get btnAdd => 'Додати';

  @override
  String get btnCancel => 'Скасувати';

  @override
  String get btnConfirm => 'Підтвердити';

  @override
  String get btnMore => 'Більше';

  @override
  String get budget => 'Категорія бюджету';

  @override
  String get budgetHeadline => 'Бюджети';

  @override
  String get budgetLimit => 'Ліміт на місяць';

  @override
  String get budgetLimitHeadline => 'Коригування лімітів';

  @override
  String get budgetRelativeLimit => 'Відносний коефіцієнт на місяць';

  @override
  String get budgetTooltip => 'Відкрити типи бюджету';

  @override
  String get budgetType => 'Інтервал бюджетування';

  @override
  String get budgetTypeAsIs => 'Необмежений';

  @override
  String get budgetTypeFixed => 'Фіксований';

  @override
  String get budgetTypeMonth => 'щомісячний';

  @override
  String get budgetTypeRelative => 'Відносний';

  @override
  String get budgetTypeWeek => 'щотижня';

  @override
  String get budgetTypeYear => 'річний';

  @override
  String get cash => 'Готівка';

  @override
  String get chartBarRace => 'Гістограма по категоріям';

  @override
  String get chartForecast => 'Діаграма прогнозу';

  @override
  String get chartOHLC => 'Підсвічникова діаграма (OHLC)';

  @override
  String get chartYtdExpense => 'Витрати від початку року';

  @override
  String get clear => 'Очистити значення';

  @override
  String get closeTooltip => 'Закрити';

  @override
  String get closedAt => 'Завершено за датою';

  @override
  String get cmpChart => 'Діаграми';

  @override
  String get cmpRecent => 'Нещодавні елементи';

  @override
  String get cmpRecentCount => 'Розмір списання';

  @override
  String get coAuthor => 'автор';

  @override
  String get coConsult => 'радник';

  @override
  String get coDeveloper => 'розробник';

  @override
  String get coNew => 'Приєднатися';

  @override
  String get coPromoter => 'промоутер';

  @override
  String get coTranslator => 'перекладач';

  @override
  String get coef => 'коеф.';

  @override
  String get collapse => 'Згорнути (розгорнути) розділ';

  @override
  String get color => 'Колір';

  @override
  String get colorApp => 'Звичайна';

  @override
  String get colorBackground => 'Фон';

  @override
  String get colorDark => 'Темний';

  @override
  String get colorInversePrimary => 'Реверс основного';

  @override
  String get colorInverseSurface => 'Зворотна поверхня';

  @override
  String get colorLight => 'Світлий';

  @override
  String get colorOnInverseSurface => 'На зворотній поверхні';

  @override
  String get colorOnSecondary => 'На вторинному';

  @override
  String get colorOnSecondaryContainer => 'На контейнери';

  @override
  String get colorPrimary => 'Головний';

  @override
  String get colorRestore => 'Скинути палітру';

  @override
  String get colorSecondary => 'Вторинний';

  @override
  String get colorSystem => 'Системна';

  @override
  String get colorTheme => 'Палітра';

  @override
  String get colorTooltip => 'Обрати колір';

  @override
  String get colorType => 'Тип кольору';

  @override
  String get colorUser => 'Особистий';

  @override
  String columnMap(Object value) {
    return 'Відображення для стовпця \'$value\'';
  }

  @override
  String columnMapTooltip(Object value) {
    return '\'$value\' - Обрати кольоровий тип';
  }

  @override
  String get completeGoalTooltip => 'Закінчити мету';

  @override
  String get confirmHeader => 'Підтвердити дію';

  @override
  String get confirmTooltip => 'Ви впевнені? Цю дію не можна відмінити.';

  @override
  String get contributors => 'Учасники';

  @override
  String get conversion => 'Конверсія';

  @override
  String conversionMessage(Object currency) {
    return 'Взята у $currency';
  }

  @override
  String get copiedToClipboard => 'Скопійовано в буфер обміну';

  @override
  String get createAccountHeader => 'Створити новий рахунок';

  @override
  String get createAccountTooltip => 'Створити рахунок';

  @override
  String get createBillHeader => 'Додати нову транзакцію';

  @override
  String get createBillTooltip => 'Додати новий чек';

  @override
  String get createBudgetHeader => 'Нова категорія бюджету';

  @override
  String get createBudgetTooltip => 'Створити категорію бюджету';

  @override
  String get createGoalHeader => 'Встановити мету';

  @override
  String get createGoalTooltip => 'Встановити мету';

  @override
  String get createIncomeTooltip => 'Додати прибуток';

  @override
  String get createPaymentTooltip => 'Додати новий платіж';

  @override
  String get createTransferTooltip => 'Додати переказ';

  @override
  String get credit => 'Кредит';

  @override
  String get creditCard => 'Кредитна картка';

  @override
  String get currency => 'Валюта';

  @override
  String get currencyAddHeadline => 'Обмін валют';

  @override
  String get currencyAddTooltip => 'Додати курс обміну валюти';

  @override
  String get currencyDefault => 'Безумовна валюта';

  @override
  String get currencyDistribution => 'Розподіл';

  @override
  String currencyExchange(Object from, Object to) {
    return 'Обмін валюти: $from -> $to';
  }

  @override
  String get currencyHeadline => 'Валюти';

  @override
  String currencyIn(Object value) {
    return 'в $value';
  }

  @override
  String get currencyShort => 'Вал.';

  @override
  String get currencyTooltip => 'Тип валюти (Код)';

  @override
  String get currencyUpdateTooltip => 'Оновити курс валют';

  @override
  String get currentDate => 'Показник актуальної дати';

  @override
  String get customAddTooltip => 'Додати віджет';

  @override
  String get customDeleteTooltip => 'Видалити налаштування';

  @override
  String get customSaveTooltip => 'Зберегти налаштування';

  @override
  String get customizeTooltip => 'Налаштувати сторінку';

  @override
  String get darkMode => 'Темний';

  @override
  String get dateFormat => 'Формат дати';

  @override
  String get dateRange => 'Діапазон дат';

  @override
  String get dateTooltip => 'Виберіть дату';

  @override
  String get dayMonday => 'Понеділок';

  @override
  String get dayStartOfMonth => 'Початок місяця';

  @override
  String get dayStartOfWeek => 'Початок тижня';

  @override
  String get daySunday => 'Неділя';

  @override
  String get deactivateAction => 'Вимкнути захист паролем';

  @override
  String get debitCard => 'Дебетова картка';

  @override
  String def(Object value) {
    return 'Значення за умовчанням для \'$value\'';
  }

  @override
  String get deleteAccountTooltip => 'Деактивувати рахунок';

  @override
  String get deleteBillTooltip => 'Видалити чек';

  @override
  String get deleteBudgetTooltip => 'Деактивувати категорію бюджету';

  @override
  String get deleteGoalTooltip => 'Видалити мету';

  @override
  String get deleteInvoiceTooltip => 'Видалити прибуток';

  @override
  String get deletePaymentTooltip => 'Видалити платіж';

  @override
  String get deleteTooltip => 'Видалити';

  @override
  String get deleteTransferTooltip => 'Видалити переказ';

  @override
  String get deposit => 'Депозит';

  @override
  String get description => 'Опис';

  @override
  String get descriptionTooltip => 'Встановити деталі витрати';

  @override
  String get design => 'Режим дизайну (культурно-специфічний)';

  @override
  String get designAsiaGeneral => 'Азія Загальна';

  @override
  String get designGermany => 'Німеччина';

  @override
  String get designGlobal => 'Глобальний';

  @override
  String get designRtlGeneral => 'Написи справа наліво';

  @override
  String get details => 'Деталі';

  @override
  String get detailsTooltip => '****2345 - останні 4 цифри номеру';

  @override
  String get dtAm => 'am';

  @override
  String get dtAmPm => 'час у am/pm (0~11)';

  @override
  String get dtDay => 'день у місяці';

  @override
  String get dtEscape => 'обмеження для тексту';

  @override
  String get dtHalfHour => 'година у am/pm (1~12)';

  @override
  String get dtHour => 'годин у дні (0~23)';

  @override
  String get dtMinute => 'хвилина у годині';

  @override
  String get dtMonth => 'місяць у року';

  @override
  String get dtNamedDay => 'день тижня';

  @override
  String get dtPm => 'pm';

  @override
  String get dtQuote => 'одинарні лапки';

  @override
  String get dtSecond => 'секунд у хвилину';

  @override
  String get dtYear => 'рік';

  @override
  String get editAccountHeader => 'Оновити рахунок';

  @override
  String get editAccountTooltip => 'Редагувати рахунок';

  @override
  String get editBillHeader => 'Оновити чек';

  @override
  String get editBillTooltip => 'Редагувати чек';

  @override
  String get editBudgetHeader => 'Оновити категорію бюджету';

  @override
  String get editBudgetTooltip => 'Редагувати категорію бюджету';

  @override
  String get editGoalHeader => 'Оновити мету';

  @override
  String get editGoalTooltip => 'Редагувати мету';

  @override
  String get editInvoiceTooltip => 'Редагувати прибуток';

  @override
  String get editPaymentTooltip => 'Редагувати платіж';

  @override
  String get editTooltip => 'Редагувати';

  @override
  String get editTransferTooltip => 'Редагувати переказ';

  @override
  String get encryptionMode => 'Шифрування даних';

  @override
  String error(Object value) {
    return 'Помилка: $value';
  }

  @override
  String get errorExpired => 'Термін дії картки закінчився';

  @override
  String get errorNegative =>
      'Не може бути негативним! Будь ласка, виправте помилку';

  @override
  String get example => 'Приклад';

  @override
  String get expand => 'Розгорнути розділ';

  @override
  String get expense => 'Сума витрат';

  @override
  String get expenseDateTime => 'Виставлений';

  @override
  String get expenseHeadline => 'Витрати';

  @override
  String get expenseTransfer => 'Сума переводу';

  @override
  String exportFile(Object value) {
    return 'Експортувати як .$value-файл';
  }

  @override
  String get failData => 'Сума відрахування';

  @override
  String get flowTypeInvoice => 'Прибуток';

  @override
  String get flowTypeTooltip => 'Тип суми: Чек, Прибуток';

  @override
  String get forecastData => 'Прогноз';

  @override
  String get from => 'од';

  @override
  String get goNextTooltip => 'Перейти далі';

  @override
  String get goalHeadline => 'Цілі';

  @override
  String goalProfit(Object value) {
    return 'Очікування: $value';
  }

  @override
  String get goalProfitTooltip => 'Прибуток проти цілі';

  @override
  String get goalTooltip => 'Відкрити цілі';

  @override
  String get hasEncrypted => 'Після встановлення не можна змінити';

  @override
  String get helpTooltip => '[Довідка] Показати опис цієї сторінки';

  @override
  String get homeHeadline => 'Головна';

  @override
  String get homeTooltip => 'Повернутися на головну сторінку';

  @override
  String get icon => 'Значок';

  @override
  String get iconTooltip => 'Оберіть значок';

  @override
  String get ignoreTooltip => 'Ігнорувати';

  @override
  String get importHeadline => 'Імпорт / Експорт';

  @override
  String get income => 'Сума прибутку';

  @override
  String get incomeHeadline => 'Дохід';

  @override
  String get incomeHealth => 'Радар здоров\'я доходів';

  @override
  String get incomeTooltip => 'Встановіть відомості про дохід';

  @override
  String get invoiceHeadline => 'Фактури';

  @override
  String invoiceSum(Object value) {
    return 'Фактури: $value';
  }

  @override
  String get isCleaned => 'Видалити наявні дані';

  @override
  String get isCreated => 'Вже створено, виконайте наступні кроки!';

  @override
  String get isEncrypted => 'Файл зашифровано (за замовчуванням)';

  @override
  String get isRequired => 'обов\'язковий';

  @override
  String get language => 'мова';

  @override
  String get left => 'ліворуч';

  @override
  String get lightMode => 'Світлий';

  @override
  String get link => 'Показник інформаційного ресурсу (URL)';

  @override
  String get meaning => 'Сенс';

  @override
  String get metricsHeadline => 'Метрики';

  @override
  String get metricsTooltip => 'Метрики';

  @override
  String get milestones => 'Віхи';

  @override
  String get missingContent => 'Файл не може бути оброблений (або скасуваний)';

  @override
  String get navigationTooltip => 'Відкрити головне меню';

  @override
  String netProfit(Object value) {
    return 'Прибуток: $value';
  }

  @override
  String get noChartData => 'Дані відсутні (або недостатньо) для відображення';

  @override
  String get notifyHeadline => 'Відпрацьовник повідомлень';

  @override
  String get ok => 'OK';

  @override
  String get orderPin => 'Пріоритетне замовлення';

  @override
  String get orderUnpin => 'Узагальнений пріоритет';

  @override
  String get outputFile => 'Призначення для файлу';

  @override
  String get parseFile => 'Розібрати файл';

  @override
  String get password => 'Пароль';

  @override
  String get path => 'Ім\'я файла (щоб зберегти або завантажити з)';

  @override
  String get paymentType => 'Інтервал платежів';

  @override
  String get paymentsHeadline => 'Періодичні платежі';

  @override
  String get pearDisabled => '-- відключений --';

  @override
  String get pearLoading => 'У процесі...';

  @override
  String get peerAccept => 'прийняти';

  @override
  String get peerAction => 'Дія';

  @override
  String get peerClosed => 'припинено';

  @override
  String get peerConnect => 'Підключити пристрій';

  @override
  String get peerConnectBtn => 'підключити';

  @override
  String get peerDelete => 'видалити';

  @override
  String get peerDevice => 'Підключені пристрої';

  @override
  String get peerId => 'Ідентифікатор вашого пристрою для підключення';

  @override
  String get peerOffline => 'по за сіткою';

  @override
  String get peerOnline => 'підключений';

  @override
  String get peerOtherId => 'Ідентифікатор пристрою для підключення';

  @override
  String get peerPending => ' в очікуванні';

  @override
  String get peerPing => 'пінг';

  @override
  String get peerSent => 'Дані передаються на підключені пристрої';

  @override
  String get peerStatus => 'Статус';

  @override
  String get peerSync => 'Передача даних';

  @override
  String pickFile(Object value) {
    return 'Обрати .$value-файл';
  }

  @override
  String pongStatus(Object uuid) {
    return 'Прийняти запит від $uuid';
  }

  @override
  String get processIsFinished => 'Закінчено!';

  @override
  String progress(Object value) {
    return 'Прогрес: $value%';
  }

  @override
  String get raiseData => 'Додавання суми';

  @override
  String get recoveryHeadline => 'Відновлення';

  @override
  String get recoveryTooltip => 'Оговтатися від';

  @override
  String get releases => 'Релізи';

  @override
  String get reset => 'скинути';

  @override
  String get returnBack => 'Повернутися назад';

  @override
  String get roadmap => 'Мапа розвитку';

  @override
  String get saveNotification => 'Зміни збережені!';

  @override
  String get saveSettingsTooltip => 'Зберегти';

  @override
  String get saveTooltip => 'Зберегти у';

  @override
  String search(Object value) {
    return 'Показати по \'$value\' візерунку';
  }

  @override
  String get searchTooltip => 'Пошук';

  @override
  String get secureOtpCode => 'Код одноразового пароля';

  @override
  String get secureOtpCodeInvalid =>
      'Неправильно! Будь ласка, візьміть новий код і введіть його';

  @override
  String get secureOtpDeactivated => 'Захист паролем вимкнено';

  @override
  String get securePassword => 'Пароль (Фраза для відновлення)';

  @override
  String get securePasswordEmpty => 'Пароль не може бути порожнім!';

  @override
  String get securePasswordNotMatch => 'Паролі не збігаються!';

  @override
  String get securePasswordRepeat => 'Повторіть пароль';

  @override
  String get securityHeadline => 'Безпека';

  @override
  String get settingsBaseHeadline => 'Основи';

  @override
  String get settingsHeadline => 'Налаштування';

  @override
  String get settingsSaved => 'Налаштування збережено!';

  @override
  String get skipFromTotals => 'Виключити із загальної кількості';

  @override
  String get skipTooltip => 'Пропустити крок(і)';

  @override
  String get spent => 'патр.';

  @override
  String get splitCancelTooltip => 'Скасувати розподіл на місяць';

  @override
  String get splitTooltip => 'Задекларуйте місячні ліміти';

  @override
  String get subscription =>
      'Оскільки це проект із відкритим кодом, підписка не розблокує жодних додаткових функцій. Однак це буде інвестицією в безперервний розвиток і вдосконалення програми, а також для збереження її доступності.';

  @override
  String get subscriptionCoffee => 'Купити каву';

  @override
  String get subscriptionDinner => 'Пригостіть вечерею';

  @override
  String get subscriptionDonorbox => 'Підписатися через Donorbox';

  @override
  String get subscriptionGithub => 'Підписатися через GitHub';

  @override
  String get subscriptionHeadline => 'Підтримка';

  @override
  String get subscriptionInactive => 'Послуга покупки недоступна';

  @override
  String get subscriptionPatreon => 'Підписатися через Patreon';

  @override
  String get subscriptionPaypal => 'Купити каву (PayPal)';

  @override
  String get subscriptionTiny => 'Початкове спонсорство';

  @override
  String get subscriptionTooltip => 'Підтримка (спонсорство)';

  @override
  String get success => 'Вдалося';

  @override
  String get summary => 'Резюме';

  @override
  String get symbol => 'Символ';

  @override
  String get syncHeadline => 'Синхронізація простроїв';

  @override
  String get systemMode => 'Системний';

  @override
  String get tapToOpen => 'Натисніть, щоб відкрити';

  @override
  String get targetAmount => 'Цільова сума';

  @override
  String get termPrivacy => 'Політика приватності';

  @override
  String get termUse => 'Умови використання';

  @override
  String get title => 'Назва';

  @override
  String get titleAccountTooltip => 'Введіть ідентифікатор рахунку';

  @override
  String get titleBudgetTooltip => 'Введіть назву категорії бюджету';

  @override
  String get titleGoal => 'Ціль';

  @override
  String get titleGoalTooltip => 'Визначте опис цілі';

  @override
  String get to => 'до';

  @override
  String get total => 'усьго';

  @override
  String get transactionFile => 'Fingrom Файл журналу транзакцій (.log)';

  @override
  String get transferHeadline => 'Передача';

  @override
  String get transferTooltip => 'Встановіть деталі передачі';

  @override
  String get transfersHeadline => 'Переклади';

  @override
  String get typeButton => 'Кнопка';

  @override
  String get updateAccountTooltip => 'Змінити рахунок';

  @override
  String get updateBillTooltip => 'Змінити чек';

  @override
  String get updateBudgetTooltip => 'Змінити категорію бюджету';

  @override
  String get updateGoalTooltip => 'Змінити ціль';

  @override
  String get updatePaymentTooltip => 'Оновити платіж';

  @override
  String get username => 'Користувач (обліковий запис)';

  @override
  String get uuid => 'Унікальний ідентифікатор транзакції';

  @override
  String get validTillDate => 'Дійсний до';

  @override
  String get webDav =>
      'Веб-розподілене створення і кирування версіями (WebDav)';

  @override
  String get zoomState => 'Збільшити / Зменшити';
}
