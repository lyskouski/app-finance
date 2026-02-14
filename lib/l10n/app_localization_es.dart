// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Spanish Castilian (`es`).
class AppLocalizationsEs extends AppLocalizations {
  AppLocalizationsEs([String locale = 'es']) : super(locale);

  @override
  String get a =>
      'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => 'Acerca de';

  @override
  String get account => 'Cuenta';

  @override
  String get accountFrom => 'De la cuenta';

  @override
  String get accountHeadline => 'Cuentas';

  @override
  String get accountTo => 'A la cuenta';

  @override
  String get accountTooltip => 'Abrir cuenta';

  @override
  String get accountType => 'Tipo de cuenta';

  @override
  String get accountTypeTooltip => 'Elegir tipo de cuenta';

  @override
  String get acknowledgeTooltip => 'Acknowledge';

  @override
  String get activate => 'Activar';

  @override
  String get actualData => 'Datos Historicos';

  @override
  String get addAccountTooltip => 'Añadir cuenta';

  @override
  String get addBudgetTooltip => 'Añadir nueva Categoría Presupuestaria';

  @override
  String get addGoalTooltip => 'Añadir nuevo Objetivo';

  @override
  String get addMainTooltip => 'Añadir factura, ingreso o transferencia';

  @override
  String afterNDays(Object value) {
    return 'después de $value días';
  }

  @override
  String get amountFrom => 'Importe inicial';

  @override
  String get amountTo => 'Importe final';

  @override
  String appBuild(Object build) {
    return 'Construir: $build';
  }

  @override
  String get appInitHeadline => 'Inicialización del Proyecto';

  @override
  String get appStartHeadline => 'Configuración inicial';

  @override
  String get appTitle => 'Fingrom';

  @override
  String appVersion(Object version) {
    return 'Versión: $version';
  }

  @override
  String get automationHeadline => 'Automatización';

  @override
  String get automationTypeDays => 'después de algunos días';

  @override
  String get backTooltip => 'Volver atrás';

  @override
  String get balance => 'Saldo Actual';

  @override
  String get balanceDate => 'Fecha de actualización del saldo';

  @override
  String get balanceDateTooltip =>
      'Los resultados e ingresos anteriores a esta fecha no afectarán al saldo';

  @override
  String get balanceTooltip => 'Establecer Saldo';

  @override
  String get bankAccount => 'Cuenta bancaria';

  @override
  String get bill => 'Factura';

  @override
  String get billHeadline => 'Bills';

  @override
  String get billSetTooltip => 'Fijar Importe';

  @override
  String billSum(Object value) {
    return 'Facturas $value';
  }

  @override
  String get billTooltip => 'Abrir Facturas';

  @override
  String get billTypeTooltip => '[Tipo] Factura, Ingreso o Transferencia';

  @override
  String get brightnessTheme => 'Tema de brillo';

  @override
  String get btnAdd => 'Añadir';

  @override
  String get btnCancel => 'Cancel';

  @override
  String get btnConfirm => 'Confirm';

  @override
  String get btnMore => 'Más';

  @override
  String get budget => 'Categoría de presupuesto';

  @override
  String get budgetHeadline => 'Presupuestos';

  @override
  String get budgetLimit => 'Límite mensual';

  @override
  String get budgetLimitHeadline => 'Ajustes Límite';

  @override
  String get budgetRelativeLimit => 'Coeficiente relativo por mes';

  @override
  String get budgetTooltip => 'Tipos de presupuesto abiertos';

  @override
  String get budgetType => 'Intervalo presupuestario';

  @override
  String get budgetTypeAsIs => 'Ilimitado';

  @override
  String get budgetTypeFixed => 'Fijo';

  @override
  String get budgetTypeMonth => 'mensual';

  @override
  String get budgetTypeRelative => 'Relativo';

  @override
  String get budgetTypeWeek => 'semanal';

  @override
  String get budgetTypeYear => 'anual';

  @override
  String get cash => 'Efectivo';

  @override
  String get chartBarRace => 'Carrera de Barras por Categorías';

  @override
  String get chartForecast => 'Gráfico de Previsión';

  @override
  String get chartOHLC => 'Gráfico de Velas (OHLC)';

  @override
  String get chartYtdExpense => 'Gastos del año hasta la fecha';

  @override
  String get clear => 'Valor de Caída';

  @override
  String get closeTooltip => 'Cierre';

  @override
  String get closedAt => 'Finalizado hasta la Fecha';

  @override
  String get cmpChart => 'Diagrams';

  @override
  String get cmpRecent => 'Artículos recientes';

  @override
  String get cmpRecentCount => 'Tamaño de la lista';

  @override
  String get coAuthor => 'author';

  @override
  String get coConsult => 'asesor';

  @override
  String get coDeveloper => 'desarrollador';

  @override
  String get coNew => 'Únase a';

  @override
  String get coPromoter => 'promoter';

  @override
  String get coTranslator => 'traductor';

  @override
  String get coef => 'coeficiente';

  @override
  String get collapse => 'Contraer (Restaurar) la sección';

  @override
  String get color => 'Color';

  @override
  String get colorApp => 'Personalizado';

  @override
  String get colorBackground => 'Fondo';

  @override
  String get colorDark => 'Oscuro';

  @override
  String get colorInversePrimary => 'Primario inverso';

  @override
  String get colorInverseSurface => 'Superficie inversa';

  @override
  String get colorLight => 'Claro';

  @override
  String get colorOnInverseSurface => 'En Superficie Inversa';

  @override
  String get colorOnSecondary => 'En Secundario';

  @override
  String get colorOnSecondaryContainer => 'En contenedor';

  @override
  String get colorPrimary => 'Primario';

  @override
  String get colorRestore => 'Restablecer paleta';

  @override
  String get colorSecondary => 'Secundario';

  @override
  String get colorSystem => 'Por defecto';

  @override
  String get colorTheme => 'Palette';

  @override
  String get colorTooltip => 'Seleccione un color';

  @override
  String get colorType => 'Tipo de color';

  @override
  String get colorUser => 'Personal';

  @override
  String columnMap(Object value) {
    return 'Asignación para la columna \'$value\'';
  }

  @override
  String columnMapTooltip(Object value) {
    return '$value\' - Elija la Asignación de Columna';
  }

  @override
  String get completeGoalTooltip => 'Completar objetivo';

  @override
  String get confirmHeader => 'Confirmar Acción';

  @override
  String get confirmTooltip =>
      '¿Está seguro? Esta acción no se puede deshacer.';

  @override
  String get contributors => 'Colaboradores';

  @override
  String get conversion => 'Conversión';

  @override
  String conversionMessage(Object currency) {
    return 'Tomado en $currency';
  }

  @override
  String get copiedToClipboard => 'Copiado al portapapeles';

  @override
  String get createAccountHeader => 'Crear nueva cuenta';

  @override
  String get createAccountTooltip => 'Crear nueva cuenta';

  @override
  String get createBillHeader => 'Crear nueva transacción';

  @override
  String get createBillTooltip => 'Añadir nueva Factura';

  @override
  String get createBudgetHeader => 'Nueva Categoría Presupuestaria';

  @override
  String get createBudgetTooltip => 'Crear nueva Categoría Presupuestaria';

  @override
  String get createGoalHeader => 'Crear objetivo';

  @override
  String get createGoalTooltip => 'Añadir nuevo Objetivo';

  @override
  String get createIncomeTooltip => 'Añadir nuevo Ingreso';

  @override
  String get createPaymentTooltip => 'Añadir nuevo pago';

  @override
  String get createTransferTooltip => 'Crear transferencia';

  @override
  String get credit => 'Credit';

  @override
  String get creditCard => 'Tarjeta de crédito';

  @override
  String get currency => 'Moneda';

  @override
  String get currencyAddHeadline => 'Cambio de divisas';

  @override
  String get currencyAddTooltip => 'Añadir tipo de cambio';

  @override
  String get currencyDefault => 'Moneda por defecto';

  @override
  String get currencyDistribution => 'Distribución';

  @override
  String currencyExchange(Object from, Object to) {
    return 'Cambio de divisas: $from -> $to';
  }

  @override
  String get currencyHeadline => 'Divisas';

  @override
  String currencyIn(Object value) {
    return 'En $value';
  }

  @override
  String get currencyShort => 'Divisa';

  @override
  String get currencyTooltip => 'Tipo de moneda (Código)';

  @override
  String get currencyUpdateTooltip => 'Actualizar Tipo de Divisa';

  @override
  String get currentDate => 'Indicador de fecha actual';

  @override
  String get customAddTooltip => 'Añadir Widget';

  @override
  String get customDeleteTooltip => 'Eliminar personalización';

  @override
  String get customSaveTooltip => 'Guardar personalización';

  @override
  String get customizeTooltip => 'Customize Page';

  @override
  String get darkMode => 'Oscuro';

  @override
  String get dateFormat => 'Formato de fecha';

  @override
  String get dateRange => 'Rango de fechas';

  @override
  String get dateTooltip => 'Seleccionar fecha';

  @override
  String get dayMonday => 'Lunes';

  @override
  String get dayStartOfMonth => 'Principios de mes';

  @override
  String get dayStartOfWeek => 'Inicio de semana';

  @override
  String get daySunday => 'Domingo';

  @override
  String get debitCard => 'Tarjeta de débito';

  @override
  String def(Object value) {
    return 'Valor por defecto para \'$value\'';
  }

  @override
  String get deleteAccountTooltip => 'Desactivar cuenta';

  @override
  String get deleteBillTooltip => 'Borrar Factura';

  @override
  String get deleteBudgetTooltip => 'Desactivar categoría presupuestaria';

  @override
  String get deleteGoalTooltip => 'Borrar Meta';

  @override
  String get deleteInvoiceTooltip => 'Borrar factura';

  @override
  String get deletePaymentTooltip => 'Borrar pago';

  @override
  String get deleteTooltip => 'Borrar';

  @override
  String get deleteTransferTooltip => 'Borrar Transferencia';

  @override
  String get deposit => 'Depositar';

  @override
  String get description => 'Descripción';

  @override
  String get descriptionTooltip => 'Establecer detalles de gastos';

  @override
  String get design => 'Modo de diseño (Cultura específica)';

  @override
  String get designAsiaGeneral => 'Asia General';

  @override
  String get designGermany => 'Alemania';

  @override
  String get designGlobal => 'Global';

  @override
  String get designRtlGeneral => 'Letras de derecha a izquierda';

  @override
  String get details => 'Detalles';

  @override
  String get detailsTooltip => '****2345 - últimas 4 cifras del número';

  @override
  String get dtAm => 'am';

  @override
  String get dtAmPm => 'hora en am/pm (0~11)';

  @override
  String get dtDay => 'día en mes';

  @override
  String get dtEscape => 'escape for text';

  @override
  String get dtHalfHour => 'hora en am/pm (1~12)';

  @override
  String get dtHour => 'hora en día (0~23)';

  @override
  String get dtMinute => 'minuto en hora';

  @override
  String get dtMonth => 'mes en año';

  @override
  String get dtNamedDay => 'día de la semana';

  @override
  String get dtPm => 'pm';

  @override
  String get dtQuote => 'comilla simple';

  @override
  String get dtSecond => 'segundo en minuto';

  @override
  String get dtYear => 'año';

  @override
  String get editAccountHeader => 'Actualizar cuenta';

  @override
  String get editAccountTooltip => 'Editar cuenta';

  @override
  String get editBillHeader => 'Actualizar factura';

  @override
  String get editBillTooltip => 'Editar factura';

  @override
  String get editBudgetHeader => 'Actualizar categoría presupuestaria';

  @override
  String get editBudgetTooltip => 'Editar categoría presupuestaria';

  @override
  String get editGoalHeader => 'Actualizar objetivo';

  @override
  String get editGoalTooltip => 'Edit Goal';

  @override
  String get editInvoiceTooltip => 'Editar factura';

  @override
  String get editPaymentTooltip => 'Editar pago';

  @override
  String get editTooltip => 'Edit';

  @override
  String get editTransferTooltip => 'Editar Transferencia';

  @override
  String get encryptionMode => 'Codificación de datos';

  @override
  String error(Object value) {
    return 'Error: $value';
  }

  @override
  String get errorExpired => 'Tarjeta caducada';

  @override
  String get errorNegative =>
      '¡No puede ser negativa! Por favor, corrija el error';

  @override
  String get example => 'Ejemplo';

  @override
  String get expand => 'Expandir Sección';

  @override
  String get expense => 'Importe de los gastos';

  @override
  String get expenseDateTime => 'Facturados en';

  @override
  String get expenseHeadline => 'Gasto';

  @override
  String get expenseTransfer => 'Importe de la transferencia';

  @override
  String exportFile(Object value) {
    return 'Exportar como archivo .$value';
  }

  @override
  String get failData => 'Importe Deducción';

  @override
  String get flowTypeInvoice => 'Factura';

  @override
  String get flowTypeTooltip => 'Tipo de Importe Albarán, Factura';

  @override
  String get forecastData => 'Previsión';

  @override
  String get from => 'desde';

  @override
  String get goNextTooltip => 'Siguiente';

  @override
  String get goalHeadline => 'Objetivos';

  @override
  String goalProfit(Object value) {
    return 'Objetivos: $value';
  }

  @override
  String get goalProfitTooltip => 'Beneficio vs Metas Objetivo';

  @override
  String get goalTooltip => 'Objetivos abiertos';

  @override
  String get hasEncrypted => 'Una vez establecidos, no se pueden cambiar';

  @override
  String get helpTooltip => '[Ayuda] Mostrar Descripción de esa Página';

  @override
  String get homeHeadline => 'Inicio';

  @override
  String get homeTooltip => 'Volver a la página principal';

  @override
  String get icon => 'Icono';

  @override
  String get iconTooltip => 'Seleccionar icono';

  @override
  String get ignoreTooltip => 'Ignore';

  @override
  String get importHeadline => 'Importar / Exportar';

  @override
  String get income => 'Importe de los ingresos';

  @override
  String get incomeHeadline => 'Ingresos';

  @override
  String get incomeHealth => 'Radar de salud de ingresos';

  @override
  String get incomeTooltip => 'Establecer detalles de ingresos';

  @override
  String get invoiceHeadline => 'Invoices';

  @override
  String invoiceSum(Object value) {
    return 'Facturas: $value';
  }

  @override
  String get isCleaned => 'Eliminar datos existentes';

  @override
  String get isCreated => 'Ya creado, siga los siguientes pasos';

  @override
  String get isEncrypted => 'El archivo está encriptado (por defecto)';

  @override
  String get isRequired => 'requerido';

  @override
  String get language => 'Language';

  @override
  String get left => 'izquierda';

  @override
  String get lightMode => 'Light';

  @override
  String get link => 'Uniform Resource Locator (URL)';

  @override
  String get meaning => 'Meaning';

  @override
  String get metricsHeadline => 'Metrics';

  @override
  String get metricsTooltip => 'Metrics';

  @override
  String get milestones => 'Hitos';

  @override
  String get missingContent => 'No se puede procesar el archivo (o se cancela)';

  @override
  String get navigationTooltip => 'Abrir menú principal';

  @override
  String netProfit(Object value) {
    return 'Beneficio: $value';
  }

  @override
  String get noChartData =>
      'Faltan datos (o no son suficientes) para mostrarlos';

  @override
  String get notifyHeadline => 'Notificaciones Parser';

  @override
  String get ok => 'OK';

  @override
  String get orderPin => 'Orden priorizado';

  @override
  String get orderUnpin => 'Orden generalizado';

  @override
  String get outputFile => 'Destino del fichero';

  @override
  String get parseFile => 'Analizar archivo';

  @override
  String get password => 'Contraseña';

  @override
  String get path => 'Nombre del archivo (para guardar en, o cargar desde)';

  @override
  String get paymentType => 'Intervalo de pago';

  @override
  String get paymentsHeadline => 'Pagos periódicos';

  @override
  String get pearDisabled => 'desactivado';

  @override
  String get pearLoading => 'En curso...';

  @override
  String get peerAccept => 'aceptar';

  @override
  String get peerAction => 'Acción';

  @override
  String get peerClosed => 'terminated';

  @override
  String get peerConnect => 'Connect Device';

  @override
  String get peerConnectBtn => 'connect';

  @override
  String get peerDelete => 'borrar';

  @override
  String get peerDevice => 'Connected Devices';

  @override
  String get peerId => 'Su identificador de dispositivo para la conexión';

  @override
  String get peerOffline => 'desconectado';

  @override
  String get peerOnline => 'connected';

  @override
  String get peerOtherId => 'Identificador de dispositivo para la conexión';

  @override
  String get peerPending => 'pendiente';

  @override
  String get peerPing => 'ping';

  @override
  String get peerSent =>
      'Los datos se transfieren a los Dispositivos conectados';

  @override
  String get peerStatus => 'Status';

  @override
  String get peerSync => 'Transferencia de datos';

  @override
  String pickFile(Object value) {
    return 'Recoger archivo .$value';
  }

  @override
  String pongStatus(Object uuid) {
    return 'Petición tomada de $uuid';
  }

  @override
  String get processIsFinished => 'Finalizado';

  @override
  String progress(Object value) {
    return 'Progreso: $value%';
  }

  @override
  String get raiseData => 'Importe Adición';

  @override
  String get recoveryHeadline => 'Recuperación';

  @override
  String get recoveryTooltip => 'Recover From';

  @override
  String get releases => 'Libera';

  @override
  String get reset => 'Restablecer';

  @override
  String get returnBack => 'Volver atrás';

  @override
  String get roadmap => 'Hoja de ruta';

  @override
  String get saveNotification => 'Cambios guardados';

  @override
  String get saveSettingsTooltip => 'Guardar';

  @override
  String get saveTooltip => 'Guardar en';

  @override
  String search(Object value) {
    return 'Mostrar por patrón \'$value\'';
  }

  @override
  String get searchTooltip => 'Buscar';

  @override
  String get secureOtpCode => 'Código de contraseña de un solo uso';

  @override
  String get secureOtpCodeInvalid =>
      '¡No es válido! Por favor, obtenga un nuevo código e introdúzcalo.';

  @override
  String get securePassword => 'Contraseña (Frase de recuperación)';

  @override
  String get securePasswordEmpty => '¡La contraseña no puede estar vacía!';

  @override
  String get securePasswordNotMatch => '¡Las contraseñas no coinciden!';

  @override
  String get securePasswordRepeat => 'Repetir contraseña';

  @override
  String get securityHeadline => 'Seguridad';

  @override
  String get settingsBaseHeadline => 'Básico';

  @override
  String get settingsHeadline => 'Configuración';

  @override
  String get settingsSaved => '¡Configuración guardada!';

  @override
  String get skipFromTotals => 'Excluir de los totales';

  @override
  String get skipTooltip => 'Saltar Paso(s)';

  @override
  String get spent => 'gastado';

  @override
  String get splitCancelTooltip => 'Anular división por mes';

  @override
  String get splitTooltip => 'Declarar límites por mes';

  @override
  String get subscription =>
      'Al tratarse de un proyecto de código abierto, la suscripción no desbloqueará ninguna función adicional. Sin embargo, serviría como inversión en la continua evolución y mejora de la aplicación, y para preservar su disponibilidad.';

  @override
  String get subscriptionCoffee => 'Comprar un café';

  @override
  String get subscriptionDinner => 'Invitar a cenar';

  @override
  String get subscriptionDonorbox => 'Suscribirse a través de Donorbox';

  @override
  String get subscriptionGithub => 'Suscribirse a través de GitHub';

  @override
  String get subscriptionHeadline => 'Patrocinio';

  @override
  String get subscriptionInactive => 'Servicio de compra no disponible';

  @override
  String get subscriptionPatreon => 'Suscribirse a través de Patreon';

  @override
  String get subscriptionPaypal => 'Comprar un café (PayPal)';

  @override
  String get subscriptionTiny => 'Regala una moneda de la suerte';

  @override
  String get subscriptionTooltip => 'Apoyar (Patrocinio)';

  @override
  String get success => 'Éxito';

  @override
  String get summary => 'Resumen';

  @override
  String get symbol => 'Symbol';

  @override
  String get syncHeadline => 'Sincronizar dispositivos';

  @override
  String get systemMode => 'System';

  @override
  String get tapToOpen => 'Tap to Open';

  @override
  String get targetAmount => 'Importe objetivo';

  @override
  String get termPrivacy => 'Política de privacidad';

  @override
  String get termUse => 'Condiciones de uso';

  @override
  String get title => 'Title';

  @override
  String get titleAccountTooltip => 'Introducir identificador de cuenta';

  @override
  String get titleBudgetTooltip => 'Nombre de la categoría presupuestaria';

  @override
  String get titleGoal => 'Goal';

  @override
  String get titleGoalTooltip => 'Defina la descripción del objetivo';

  @override
  String get to => 'a';

  @override
  String get total => 'total';

  @override
  String get transactionFile =>
      'Archivo de registro de transacciones Fingrom (.log)';

  @override
  String get transferHeadline => 'Transferencia';

  @override
  String get transferTooltip => 'Establecer detalles de transferencia';

  @override
  String get transfersHeadline => 'Transferencias';

  @override
  String get typeButton => 'Botón';

  @override
  String get updateAccountTooltip => 'Actualizar cuenta';

  @override
  String get updateBillTooltip => 'Actualizar factura';

  @override
  String get updateBudgetTooltip => 'Actualizar categoría presupuestaria';

  @override
  String get updateGoalTooltip => 'Actualizar objetivo';

  @override
  String get updatePaymentTooltip => 'Actualizar pago';

  @override
  String get username => 'Nombre de usuario (cuenta)';

  @override
  String get uuid => 'Identificador único de transacción';

  @override
  String get validTillDate => 'Fecha de validez';

  @override
  String get webDav =>
      'Autoría y control de versiones distribuido por la Web (WebDav)';

  @override
  String get zoomState => 'Acercar / Alejar';
}
