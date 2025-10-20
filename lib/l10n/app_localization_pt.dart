// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for Portuguese (`pt`).
class AppLocalizationsPt extends AppLocalizations {
  AppLocalizationsPt([String locale = 'pt']) : super(locale);

  @override
  String get a =>
      'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => 'Sobre a';

  @override
  String get account => 'Conta';

  @override
  String get accountFrom => 'Da conta';

  @override
  String get accountHeadline => 'Conta';

  @override
  String get accountTo => 'Para a conta';

  @override
  String get accountTooltip => 'Abrir contas';

  @override
  String get accountType => 'Tipo de conta';

  @override
  String get accountTypeTooltip => 'Selecionar o tipo de conta';

  @override
  String get acknowledgeTooltip => 'Confirmar';

  @override
  String get activate => 'Ativar';

  @override
  String get actualData => 'Dados históricos';

  @override
  String get addAccountTooltip => 'Adicionar conta';

  @override
  String get addBudgetTooltip => 'Adicionar nova categoria de orçamento';

  @override
  String get addGoalTooltip => 'Adicionar novo objetivo';

  @override
  String get addMainTooltip => 'Adicionar fatura, rendimento ou transferência';

  @override
  String afterNDays(Object value) {
    return 'após $value dias';
  }

  @override
  String get amountFrom => 'De Valor';

  @override
  String get amountTo => 'Para Valor';

  @override
  String appBuild(Object build) {
    return 'Criar: $build';
  }

  @override
  String get appInitHeadline => 'Inicialização do projeto';

  @override
  String get appStartHeadline => 'Configuração inicial';

  @override
  String get appTitle => 'Financiamento';

  @override
  String appVersion(Object version) {
    return 'Versão: $version';
  }

  @override
  String get automationHeadline => 'Automatização';

  @override
  String get automationTypeDays => 'após alguns dias';

  @override
  String get backTooltip => 'Retorno';

  @override
  String get balance => 'Saldo real';

  @override
  String get balanceDate => 'Atualização da data do saldo';

  @override
  String get balanceDateTooltip =>
      'Os resultados e rendimentos anteriores a esta data não afectam o saldo';

  @override
  String get balanceTooltip => 'Definir saldo';

  @override
  String get bankAccount => 'Conta bancária';

  @override
  String get bill => 'Facturas';

  @override
  String get billHeadline => 'Facturas';

  @override
  String get billSetTooltip => 'Definir montante';

  @override
  String billSum(Object value) {
    return 'Facturas: $value';
  }

  @override
  String get billTooltip => 'Contas em aberto';

  @override
  String get billTypeTooltip => '[Tipo] Fatura, Rendimento ou Transferência';

  @override
  String get brightnessTheme => 'Tema de brilho';

  @override
  String get btnAdd => 'Adicionar';

  @override
  String get btnCancel => 'Cancelar';

  @override
  String get btnConfirm => 'Confirmar';

  @override
  String get btnMore => 'Mais';

  @override
  String get budget => 'Categoria de orçamento';

  @override
  String get budgetHeadline => 'Orçamentos';

  @override
  String get budgetLimit => 'Limite por mês';

  @override
  String get budgetLimitHeadline => 'Ajustes de limite';

  @override
  String get budgetRelativeLimit => 'Coeficiente relativo por mês';

  @override
  String get budgetTooltip => 'Tipos de orçamento abertos';

  @override
  String get budgetType => 'Intervalo de elaboração do orçamento';

  @override
  String get budgetTypeAsIs => 'Ilimitado';

  @override
  String get budgetTypeFixed => 'Fixo';

  @override
  String get budgetTypeMonth => 'mensal';

  @override
  String get budgetTypeRelative => 'Relativo';

  @override
  String get budgetTypeWeek => 'semanal';

  @override
  String get budgetTypeYear => 'anual';

  @override
  String get cash => 'Dinheiro';

  @override
  String get chartBarRace => 'Corrida de barras para categorias';

  @override
  String get chartForecast => 'Gráfico de previsão';

  @override
  String get chartOHLC => 'Gráfico de velas (OHLC)';

  @override
  String get chartYtdExpense => 'Despesas YTD';

  @override
  String get clear => 'Valor de queda';

  @override
  String get closeTooltip => 'Fechar';

  @override
  String get closedAt => 'Concluído até à data';

  @override
  String get cmpChart => 'Diagramas';

  @override
  String get cmpRecent => 'Itens recentes';

  @override
  String get cmpRecentCount => 'Tamanho da lista';

  @override
  String get coAuthor => 'autor';

  @override
  String get coConsult => 'conselheiro';

  @override
  String get coDeveloper => 'criador';

  @override
  String get coNew => 'Aderir';

  @override
  String get coPromoter => 'promotor';

  @override
  String get coTranslator => 'tradutor';

  @override
  String get coef => 'coef.';

  @override
  String get collapse => 'Recolher (restaurar) a secção';

  @override
  String get color => 'Cor';

  @override
  String get colorApp => 'Personalizada';

  @override
  String get colorBackground => 'Fundo';

  @override
  String get colorDark => 'Escuro';

  @override
  String get colorInversePrimary => 'Inverso primário';

  @override
  String get colorInverseSurface => 'Superfície inversa';

  @override
  String get colorLight => 'Clara';

  @override
  String get colorOnInverseSurface => 'Na superfície inversa';

  @override
  String get colorOnSecondary => 'Na secundária';

  @override
  String get colorOnSecondaryContainer => 'No contentor';

  @override
  String get colorPrimary => 'Primária';

  @override
  String get colorRestore => 'Redefinir paleta';

  @override
  String get colorSecondary => 'Secundária';

  @override
  String get colorSystem => 'Predefinição';

  @override
  String get colorTheme => 'Paleta';

  @override
  String get colorTooltip => 'Selecionar uma cor';

  @override
  String get colorType => 'Tipo de cor';

  @override
  String get colorUser => 'Pessoal';

  @override
  String columnMap(Object value) {
    return 'Mapeamento para a coluna \'$value\'';
  }

  @override
  String columnMapTooltip(Object value) {
    return '\'$value\' - Selecionar o mapeamento da coluna';
  }

  @override
  String get completeGoalTooltip => 'Concluir objetivo';

  @override
  String get confirmHeader => 'Confirmar ação';

  @override
  String get confirmTooltip => 'Tem a certeza? Esta ação não pode ser anulada.';

  @override
  String get contributors => 'Contribuintes';

  @override
  String get conversion => 'Conversão';

  @override
  String conversionMessage(Object currency) {
    return 'Efectuada em $currency';
  }

  @override
  String get copiedToClipboard => 'Copiado para a área de transferência';

  @override
  String get createAccountHeader => 'Criar nova conta';

  @override
  String get createAccountTooltip => 'Criar nova conta';

  @override
  String get createBillHeader => 'Criar nova transação';

  @override
  String get createBillTooltip => 'Adicionar nova fatura';

  @override
  String get createBudgetHeader => 'Nova categoria de orçamento';

  @override
  String get createBudgetTooltip => 'Criar nova categoria de orçamento';

  @override
  String get createGoalHeader => 'Criar objetivo';

  @override
  String get createGoalTooltip => 'Adicionar novo objetivo';

  @override
  String get createIncomeTooltip => 'Adicionar novo rendimento';

  @override
  String get createPaymentTooltip => 'Adicionar novo pagamento';

  @override
  String get createTransferTooltip => 'Criar transferência';

  @override
  String get credit => 'Crédito';

  @override
  String get creditCard => 'Cartão de crédito';

  @override
  String get currency => 'Moeda';

  @override
  String get currencyAddHeadline => 'Câmbio de moeda';

  @override
  String get currencyAddTooltip => 'Adicionar taxa de câmbio';

  @override
  String get currencyDefault => 'Moeda predefinida';

  @override
  String get currencyDistribution => 'Distribuição';

  @override
  String currencyExchange(Object from, Object to) {
    return 'Câmbio de moeda: $from -> $to';
  }

  @override
  String get currencyHeadline => 'Moedas';

  @override
  String currencyIn(Object value) {
    return 'Em $value';
  }

  @override
  String get currencyShort => 'Moeda';

  @override
  String get currencyTooltip => 'Tipo de moeda (código)';

  @override
  String get currencyUpdateTooltip => 'Atualizar taxa de moedas';

  @override
  String get currentDate => 'Ponteiro de data atual';

  @override
  String get customAddTooltip => 'Adicionar Widget';

  @override
  String get customDeleteTooltip => 'Excluir personalização';

  @override
  String get customSaveTooltip => 'Salvar personalização';

  @override
  String get customizeTooltip => 'Personalizar página';

  @override
  String get darkMode => 'Escuro';

  @override
  String get dateFormat => 'Formato da data';

  @override
  String get dateRange => 'Intervalo de datas';

  @override
  String get dateTooltip => 'Selecionar data';

  @override
  String get dayMonday => 'Segunda-feira';

  @override
  String get dayStartOfMonth => 'Início do mês';

  @override
  String get dayStartOfWeek => 'Início da semana';

  @override
  String get daySunday => 'Domingo';

  @override
  String get debitCard => 'Cartão de débito';

  @override
  String def(Object value) {
    return 'Valor predefinido para \'$value\'';
  }

  @override
  String get deleteAccountTooltip => 'Desativar conta';

  @override
  String get deleteBillTooltip => 'Apagar fatura';

  @override
  String get deleteBudgetTooltip => 'Desativar categoria de orçamento';

  @override
  String get deleteGoalTooltip => 'Eliminar objetivo';

  @override
  String get deleteInvoiceTooltip => 'Eliminar fatura';

  @override
  String get deletePaymentTooltip => 'Eliminar pagamento';

  @override
  String get deleteTooltip => 'Eliminar';

  @override
  String get deleteTransferTooltip => 'Eliminar transferência';

  @override
  String get deposit => 'Depósito';

  @override
  String get description => 'Descrição';

  @override
  String get descriptionTooltip => 'Definir detalhes de despesas';

  @override
  String get design => 'Modo de conceção (específico da cultura)';

  @override
  String get designAsiaGeneral => 'Ásia Geral';

  @override
  String get designGermany => 'Alemanha';

  @override
  String get designGlobal => 'Global';

  @override
  String get designRtlGeneral => 'Letras da direita para a esquerda';

  @override
  String get details => 'Detalhes';

  @override
  String get detailsTooltip => '****2345 - últimos 4 dígitos do número';

  @override
  String get dtAm => 'am';

  @override
  String get dtAmPm => 'hora em am/pm (0~11)';

  @override
  String get dtDay => 'dia no mês';

  @override
  String get dtEscape => 'escape para texto';

  @override
  String get dtHalfHour => 'hora em am/pm (1~12)';

  @override
  String get dtHour => 'hora no dia (0~23)';

  @override
  String get dtMinute => 'minuto em hora';

  @override
  String get dtMonth => 'mês no ano';

  @override
  String get dtNamedDay => 'dia da semana';

  @override
  String get dtPm => 'pm';

  @override
  String get dtQuote => 'aspas simples';

  @override
  String get dtSecond => 'segundo em minuto';

  @override
  String get dtYear => 'ano';

  @override
  String get editAccountHeader => 'Atualizar conta';

  @override
  String get editAccountTooltip => 'Editar conta';

  @override
  String get editBillHeader => 'Atualizar fatura';

  @override
  String get editBillTooltip => 'Editar fatura';

  @override
  String get editBudgetHeader => 'Atualizar categoria de orçamento';

  @override
  String get editBudgetTooltip => 'Editar categoria de orçamento';

  @override
  String get editGoalHeader => 'Atualizar objetivo';

  @override
  String get editGoalTooltip => 'Editar objetivo';

  @override
  String get editInvoiceTooltip => 'Editar fatura';

  @override
  String get editPaymentTooltip => 'Editar pagamento';

  @override
  String get editTooltip => 'Editar';

  @override
  String get editTransferTooltip => 'Editar transferência';

  @override
  String get encryptionMode => 'Criptografia de dados';

  @override
  String error(Object value) {
    return 'Erro: $value';
  }

  @override
  String get errorExpired => 'Cartão expirado';

  @override
  String get errorNegative =>
      'Não pode ser negativo! Por favor, corrija o erro';

  @override
  String get example => 'Exemplo';

  @override
  String get expand => 'Expandir secção';

  @override
  String get expense => 'Montante das despesas';

  @override
  String get expenseDateTime => 'Facturadas em';

  @override
  String get expenseHeadline => 'Despesas';

  @override
  String get expenseTransfer => 'Montante da transferência';

  @override
  String exportFile(Object value) {
    return 'Exportar como ficheiro .$value';
  }

  @override
  String get failData => 'Dedução do montante';

  @override
  String get flowTypeInvoice => 'Fatura';

  @override
  String get flowTypeTooltip => 'Tipo de montante: Fatura, Nota Fiscal';

  @override
  String get forecastData => 'Previsão';

  @override
  String get from => 'de';

  @override
  String get goNextTooltip => 'Ir Próximo';

  @override
  String get goalHeadline => 'Objectivos';

  @override
  String goalProfit(Object value) {
    return 'Objetivo dos objectivos: $value';
  }

  @override
  String get goalProfitTooltip => 'Lucro vs Objetivo dos Objectivos';

  @override
  String get goalTooltip => 'Objectivos abertos';

  @override
  String get hasEncrypted => 'Uma vez definidos, não podem ser alterados';

  @override
  String get helpTooltip => '[Ajuda] Mostrar descrição da página';

  @override
  String get homeHeadline => 'Página inicial';

  @override
  String get homeTooltip => 'Voltar à página principal';

  @override
  String get icon => 'Ícone';

  @override
  String get iconTooltip => 'Selecionar ícone';

  @override
  String get ignoreTooltip => 'Ignorar';

  @override
  String get importHeadline => 'Importação / Exportação';

  @override
  String get income => 'Montante do rendimento';

  @override
  String get incomeHeadline => 'Rendimento';

  @override
  String get incomeHealth => 'Radar de saúde do rendimento';

  @override
  String get incomeTooltip => 'Definir detalhes do rendimento';

  @override
  String get invoiceHeadline => 'Facturas';

  @override
  String invoiceSum(Object value) {
    return 'Facturas: $value';
  }

  @override
  String get isCleaned => 'Remover dados existentes';

  @override
  String get isCreated => 'Já criado, siga os passos seguintes!';

  @override
  String get isEncrypted => 'O ficheiro é encriptado (por predefinição)';

  @override
  String get isRequired => 'necessário';

  @override
  String get language => 'Língua';

  @override
  String get left => 'esquerda';

  @override
  String get lightMode => 'Luz';

  @override
  String get link => 'Localizador Uniforme de Recursos (URL)';

  @override
  String get meaning => 'Significado';

  @override
  String get metricsHeadline => 'Métrica';

  @override
  String get metricsTooltip => 'Métrica';

  @override
  String get milestones => 'Marcos';

  @override
  String get missingContent =>
      'O ficheiro não pode ser processado (ou cancelado)';

  @override
  String get navigationTooltip => 'Abrir o menu principal';

  @override
  String netProfit(Object value) {
    return 'Lucro: $value';
  }

  @override
  String get noChartData =>
      'Faltam dados (ou não são suficientes) para serem mostrados';

  @override
  String get notifyHeadline => 'Analisador de notificações';

  @override
  String get ok => 'OK';

  @override
  String get orderPin => 'Ordem prioritária';

  @override
  String get orderUnpin => 'Ordem generalizada';

  @override
  String get outputFile => 'Destino do ficheiro';

  @override
  String get parseFile => 'Analisar ficheiro';

  @override
  String get password => 'Palavra-passe';

  @override
  String get path => 'Nome do ficheiro (para guardar ou carregar)';

  @override
  String get paymentType => 'Intervalo de pagamento';

  @override
  String get paymentsHeadline => 'Pagamentos recorrentes';

  @override
  String get pearDisabled => '-- desativado --';

  @override
  String get pearLoading => 'Em progresso...';

  @override
  String get peerAccept => 'aceitar';

  @override
  String get peerAction => 'Ação';

  @override
  String get peerClosed => 'terminada';

  @override
  String get peerConnect => 'Ligar dispositivo';

  @override
  String get peerConnectBtn => 'ligar';

  @override
  String get peerDelete => 'eliminar';

  @override
  String get peerDevice => 'Dispositivos ligados';

  @override
  String get peerId => 'O seu identificador de dispositivo para ligação';

  @override
  String get peerOffline => 'offline';

  @override
  String get peerOnline => 'ligado';

  @override
  String get peerOtherId => 'Identificador do dispositivo para ligação';

  @override
  String get peerPending => 'pendente';

  @override
  String get peerPing => 'ping';

  @override
  String get peerSent =>
      'Os dados são transferidos para os dispositivos ligados';

  @override
  String get peerStatus => 'Estado';

  @override
  String get peerSync => 'Transferir dados';

  @override
  String pickFile(Object value) {
    return 'Escolher ficheiro .$value';
  }

  @override
  String pongStatus(Object uuid) {
    return 'Pedido recebido de $uuid';
  }

  @override
  String get processIsFinished => 'Terminado!';

  @override
  String progress(Object value) {
    return 'Progresso: $value%';
  }

  @override
  String get raiseData => 'Adição de montante';

  @override
  String get recoveryHeadline => 'Recuperação';

  @override
  String get recoveryTooltip => 'Recuperar de';

  @override
  String get releases => 'Liberta';

  @override
  String get reset => 'repor';

  @override
  String get returnBack => 'Voltar atrás';

  @override
  String get roadmap => 'Roteiro';

  @override
  String get saveNotification => 'Alterações guardadas!';

  @override
  String get saveSettingsTooltip => 'Salvar';

  @override
  String get saveTooltip => 'Guardar para';

  @override
  String search(Object value) {
    return 'Mostrar por padrão \'$value';
  }

  @override
  String get searchTooltip => 'Pesquisa';

  @override
  String get settingsBaseHeadline => 'Noções básicas';

  @override
  String get settingsHeadline => 'Definições';

  @override
  String get skipFromTotals => 'Excluir dos totais';

  @override
  String get skipTooltip => 'Saltar passo(s)';

  @override
  String get spent => 'gasto';

  @override
  String get splitCancelTooltip => 'Cancelar divisão por mês';

  @override
  String get splitTooltip => 'Declarar limites por mês';

  @override
  String get subscription =>
      'Sendo um projeto de código aberto, a subscrição não desbloqueia quaisquer funcionalidades adicionais. No entanto, serviria como um investimento na evolução e melhoria contínuas da aplicação, e para preservar a sua disponibilidade.';

  @override
  String get subscriptionCoffee => 'Comprar um café';

  @override
  String get subscriptionDinner => 'Oferecer um jantar';

  @override
  String get subscriptionDonorbox => 'Subscrever através da Donorbox';

  @override
  String get subscriptionGithub => 'Subscrever através do GitHub';

  @override
  String get subscriptionHeadline => 'Patrocínio';

  @override
  String get subscriptionInactive => 'Serviço de compra indisponível';

  @override
  String get subscriptionPatreon => 'Subscrever através do Patreon';

  @override
  String get subscriptionPaypal => 'Comprar um café (PayPal)';

  @override
  String get subscriptionTiny => 'Oferecer uma moeda da sorte';

  @override
  String get subscriptionTooltip => 'Apoio (Patrocínio)';

  @override
  String get success => 'Bem-sucedido';

  @override
  String get summary => 'Resumo';

  @override
  String get symbol => 'Símbolo';

  @override
  String get syncHeadline => 'Dispositivos de sincronização';

  @override
  String get systemMode => 'Sistema';

  @override
  String get tapToOpen => 'Toque para abrir';

  @override
  String get targetAmount => 'Montante pretendido';

  @override
  String get termPrivacy => 'Política de privacidade';

  @override
  String get termUse => 'Termos de utilização';

  @override
  String get title => 'Título';

  @override
  String get titleAccountTooltip => 'Introduzir identificador de conta';

  @override
  String get titleBudgetTooltip =>
      'Introduzir o nome da categoria de orçamento';

  @override
  String get titleGoal => 'Objetivo';

  @override
  String get titleGoalTooltip => 'Definir a descrição do objetivo';

  @override
  String get to => 'para';

  @override
  String get total => 'total';

  @override
  String get transactionFile =>
      'Ficheiro de registo de transacções do Fingrom (.log)';

  @override
  String get transferHeadline => 'Transferir';

  @override
  String get transferTooltip => 'Definir detalhes da transferência';

  @override
  String get transfersHeadline => 'Transferências';

  @override
  String get typeButton => 'Botão';

  @override
  String get updateAccountTooltip => 'Atualizar conta';

  @override
  String get updateBillTooltip => 'Atualizar fatura';

  @override
  String get updateBudgetTooltip => 'Atualizar categoria orçamental';

  @override
  String get updateGoalTooltip => 'Atualizar objetivo';

  @override
  String get updatePaymentTooltip => 'Atualizar pagamento';

  @override
  String get username => 'Nome de utilizador (conta)';

  @override
  String get uuid => 'Identificador único de transação';

  @override
  String get validTillDate => 'Transação válida';

  @override
  String get webDav =>
      'Criação de versões e autoria distribuída na Web (WebDav)';

  @override
  String get zoomState => 'Ampliar / Reduzir o zoom';
}

/// The translations for Portuguese, as used in Brazil (`pt_BR`).
class AppLocalizationsPtBr extends AppLocalizationsPt {
  AppLocalizationsPtBr() : super('pt_BR');

  @override
  String get a =>
      'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => 'Sobre a';

  @override
  String get account => 'Conta';

  @override
  String get accountFrom => 'Da conta';

  @override
  String get accountHeadline => 'Contas';

  @override
  String get accountTo => 'Para a conta';

  @override
  String get accountTooltip => 'Contas abertas';

  @override
  String get accountType => 'Tipo de conta';

  @override
  String get accountTypeTooltip => 'Selecionar o tipo de conta';

  @override
  String get acknowledgeTooltip => 'Confirmar';

  @override
  String get activate => 'Ativar';

  @override
  String get actualData => 'Dados históricos';

  @override
  String get addAccountTooltip => 'Adicionar conta';

  @override
  String get addBudgetTooltip => 'Adicionar nova categoria orçamentária';

  @override
  String get addGoalTooltip => 'Adicionar nova meta';

  @override
  String get addMainTooltip => 'Adicionar fatura, receita ou transferência';

  @override
  String afterNDays(Object value) {
    return 'após $value dias';
  }

  @override
  String get amountFrom => 'De Valor';

  @override
  String get amountTo => 'Para Valor';

  @override
  String appBuild(Object build) {
    return 'Criar: $build';
  }

  @override
  String get appInitHeadline => 'Inicialização do projeto';

  @override
  String get appStartHeadline => 'Configuração inicial';

  @override
  String get appTitle => 'Finanças';

  @override
  String appVersion(Object version) {
    return 'Versão: $version';
  }

  @override
  String get automationHeadline => 'Automação';

  @override
  String get automationTypeDays => 'depois de alguns dias';

  @override
  String get backTooltip => 'Retorno';

  @override
  String get balance => 'Saldo real';

  @override
  String get balanceDate => 'Atualização da data do saldo';

  @override
  String get balanceDateTooltip =>
      'Os resultados e rendimentos anteriores a essa data não afetarão o saldo';

  @override
  String get balanceTooltip => 'Definir saldo';

  @override
  String get bankAccount => 'Conta bancária';

  @override
  String get bill => 'Conta';

  @override
  String get billHeadline => 'Contas';

  @override
  String get billSetTooltip => 'Definir valor';

  @override
  String billSum(Object value) {
    return 'Contas: $value';
  }

  @override
  String get billTooltip => 'Contas em aberto';

  @override
  String get billTypeTooltip => '[Tipo] Conta, Renda ou Transferência';

  @override
  String get brightnessTheme => 'Tema de brilho';

  @override
  String get btnAdd => 'Adicionar';

  @override
  String get btnCancel => 'Cancelar';

  @override
  String get btnConfirm => 'Confirmar';

  @override
  String get btnMore => 'Mais informações';

  @override
  String get budget => 'Categoria de orçamento';

  @override
  String get budgetHeadline => 'Orçamentos';

  @override
  String get budgetLimit => 'Limite por mês';

  @override
  String get budgetLimitHeadline => 'Ajustes de limite';

  @override
  String get budgetRelativeLimit => 'Coeficiente relativo por mês';

  @override
  String get budgetTooltip => 'Tipos de orçamento aberto';

  @override
  String get budgetType => 'Intervalo de elaboração do orçamento';

  @override
  String get budgetTypeAsIs => 'Ilimitado';

  @override
  String get budgetTypeFixed => 'Fixo';

  @override
  String get budgetTypeMonth => 'mensal';

  @override
  String get budgetTypeRelative => 'Relativo';

  @override
  String get budgetTypeWeek => 'semanal';

  @override
  String get budgetTypeYear => 'anual';

  @override
  String get cash => 'Dinheiro';

  @override
  String get chartBarRace => 'Corrida de barras para categorias';

  @override
  String get chartForecast => 'Gráfico de previsão';

  @override
  String get chartOHLC => 'Gráfico de velas (OHLC)';

  @override
  String get chartYtdExpense => 'Despesas YTD';

  @override
  String get clear => 'Valor de queda';

  @override
  String get closeTooltip => 'Fechar';

  @override
  String get closedAt => 'Concluído até a data';

  @override
  String get cmpChart => 'Diagramas';

  @override
  String get cmpRecent => 'Itens recentes';

  @override
  String get cmpRecentCount => 'Tamanho da lista';

  @override
  String get coAuthor => 'autor';

  @override
  String get coConsult => 'consultor';

  @override
  String get coDeveloper => 'desenvolvedor';

  @override
  String get coNew => 'Aderir';

  @override
  String get coPromoter => 'promotor';

  @override
  String get coTranslator => 'tradutor';

  @override
  String get coef => 'coef.';

  @override
  String get collapse => 'Recolher (restaurar) a seção';

  @override
  String get color => 'Cor';

  @override
  String get colorApp => 'Personalizada';

  @override
  String get colorBackground => 'Fundo';

  @override
  String get colorDark => 'Escuro';

  @override
  String get colorInversePrimary => 'Inverso primário';

  @override
  String get colorInverseSurface => 'Superfície inversa';

  @override
  String get colorLight => 'Clara';

  @override
  String get colorOnInverseSurface => 'Na superfície inversa';

  @override
  String get colorOnSecondary => 'Na secundária';

  @override
  String get colorOnSecondaryContainer => 'No contêiner';

  @override
  String get colorPrimary => 'Primária';

  @override
  String get colorRestore => 'Redefinir paleta';

  @override
  String get colorSecondary => 'Secundária';

  @override
  String get colorSystem => 'Padrão';

  @override
  String get colorTheme => 'Paleta';

  @override
  String get colorTooltip => 'Selecionar uma cor';

  @override
  String get colorType => 'Tipo de cor';

  @override
  String get colorUser => 'Pessoal';

  @override
  String columnMap(Object value) {
    return 'Mapeamento da coluna \'$value\'';
  }

  @override
  String columnMapTooltip(Object value) {
    return '\'$value\' - Escolha o mapeamento da coluna';
  }

  @override
  String get completeGoalTooltip => 'Concluir meta';

  @override
  String get confirmHeader => 'Confirmar ação';

  @override
  String get confirmTooltip => 'Tem certeza? Essa ação não pode ser desfeita.';

  @override
  String get contributors => 'Contribuintes';

  @override
  String get conversion => 'Conversão';

  @override
  String conversionMessage(Object currency) {
    return 'Realizada em $currency';
  }

  @override
  String get copiedToClipboard => 'Copiado para a área de transferência';

  @override
  String get createAccountHeader => 'Criar nova conta';

  @override
  String get createAccountTooltip => 'Criar nova conta';

  @override
  String get createBillHeader => 'Criar nova transação';

  @override
  String get createBillTooltip => 'Adicionar nova fatura';

  @override
  String get createBudgetHeader => 'Nova categoria orçamentária';

  @override
  String get createBudgetTooltip => 'Criar nova categoria orçamentária';

  @override
  String get createGoalHeader => 'Criar meta';

  @override
  String get createGoalTooltip => 'Adicionar nova meta';

  @override
  String get createIncomeTooltip => 'Adicionar nova renda';

  @override
  String get createPaymentTooltip => 'Adicionar novo pagamento';

  @override
  String get createTransferTooltip => 'Criar transferência';

  @override
  String get credit => 'Crédito';

  @override
  String get creditCard => 'Cartão de crédito';

  @override
  String get currency => 'Moeda';

  @override
  String get currencyAddHeadline => 'Câmbio de moedas';

  @override
  String get currencyAddTooltip => 'Adicionar taxa de câmbio';

  @override
  String get currencyDefault => 'Moeda padrão';

  @override
  String get currencyDistribution => 'Distribuição';

  @override
  String currencyExchange(Object from, Object to) {
    return 'Câmbio de moedas: $from -> $to';
  }

  @override
  String get currencyHeadline => 'Moedas';

  @override
  String currencyIn(Object value) {
    return 'Em $value';
  }

  @override
  String get currencyShort => 'Moeda';

  @override
  String get currencyTooltip => 'Tipo de moeda (código)';

  @override
  String get currencyUpdateTooltip => 'Atualizar taxa de moedas';

  @override
  String get currentDate => 'Ponteiro de data atual';

  @override
  String get customAddTooltip => 'Adicionar widget';

  @override
  String get customDeleteTooltip => 'Excluir personalização';

  @override
  String get customSaveTooltip => 'Salvar personalização';

  @override
  String get customizeTooltip => 'Personalizar página';

  @override
  String get darkMode => 'Escuro';

  @override
  String get dateFormat => 'Formato de data';

  @override
  String get dateRange => 'Intervalo de datas';

  @override
  String get dateTooltip => 'Selecionar data';

  @override
  String get dayMonday => 'Segunda-feira';

  @override
  String get dayStartOfMonth => 'Início do mês';

  @override
  String get dayStartOfWeek => 'Início da semana';

  @override
  String get daySunday => 'Domingo';

  @override
  String get debitCard => 'Cartão de débito';

  @override
  String def(Object value) {
    return 'Valor padrão para \'$value\'';
  }

  @override
  String get deleteAccountTooltip => 'Desativar conta';

  @override
  String get deleteBillTooltip => 'Excluir conta';

  @override
  String get deleteBudgetTooltip => 'Desativar categoria orçamentária';

  @override
  String get deleteGoalTooltip => 'Excluir meta';

  @override
  String get deleteInvoiceTooltip => 'Excluir fatura';

  @override
  String get deletePaymentTooltip => 'Excluir pagamento';

  @override
  String get deleteTooltip => 'Excluir';

  @override
  String get deleteTransferTooltip => 'Excluir transferência';

  @override
  String get deposit => 'Depósito';

  @override
  String get description => 'Descrição';

  @override
  String get descriptionTooltip => 'Definir detalhes de despesas';

  @override
  String get design => 'Modo de design (específico da cultura)';

  @override
  String get designAsiaGeneral => 'Ásia Geral';

  @override
  String get designGermany => 'Alemanha';

  @override
  String get designGlobal => 'Global';

  @override
  String get designRtlGeneral => 'Letras da direita para a esquerda';

  @override
  String get details => 'Detalhes';

  @override
  String get detailsTooltip => '****2345 - últimos 4 dígitos do número';

  @override
  String get dtAm => 'am';

  @override
  String get dtAmPm => 'hora em am/pm (0~11)';

  @override
  String get dtDay => 'dia no mês';

  @override
  String get dtEscape => 'escape para texto';

  @override
  String get dtHalfHour => 'hora em am/pm (1~12)';

  @override
  String get dtHour => 'hora no dia (0~23)';

  @override
  String get dtMinute => 'minuto em hora';

  @override
  String get dtMonth => 'mês no ano';

  @override
  String get dtNamedDay => 'dia da semana';

  @override
  String get dtPm => 'pm';

  @override
  String get dtQuote => 'aspas simples';

  @override
  String get dtSecond => 'segundo em minuto';

  @override
  String get dtYear => 'ano';

  @override
  String get editAccountHeader => 'Atualizar conta';

  @override
  String get editAccountTooltip => 'Editar conta';

  @override
  String get editBillHeader => 'Atualizar conta';

  @override
  String get editBillTooltip => 'Editar fatura';

  @override
  String get editBudgetHeader => 'Atualizar categoria orçamentária';

  @override
  String get editBudgetTooltip => 'Editar categoria orçamentária';

  @override
  String get editGoalHeader => 'Atualizar meta';

  @override
  String get editGoalTooltip => 'Editar meta';

  @override
  String get editInvoiceTooltip => 'Editar fatura';

  @override
  String get editPaymentTooltip => 'Editar pagamento';

  @override
  String get editTooltip => 'Editar';

  @override
  String get editTransferTooltip => 'Editar transferência';

  @override
  String get encryptionMode => 'Criptografia de dados';

  @override
  String error(Object value) {
    return 'Erro: $value';
  }

  @override
  String get errorExpired => 'Cartão expirado';

  @override
  String get errorNegative =>
      'Não pode ser negativo! Por favor, corrija o erro';

  @override
  String get example => 'Exemplo';

  @override
  String get expand => 'Expandir seção';

  @override
  String get expense => 'Valor das despesas';

  @override
  String get expenseDateTime => 'Faturadas em';

  @override
  String get expenseHeadline => 'Despesa';

  @override
  String get expenseTransfer => 'Valor da transferência';

  @override
  String exportFile(Object value) {
    return 'Exportar como arquivo .$value';
  }

  @override
  String get failData => 'Dedução do valor';

  @override
  String get flowTypeInvoice => 'Fatura';

  @override
  String get flowTypeTooltip => 'Tipo de valor: Nota Fiscal, Fatura';

  @override
  String get forecastData => 'Previsão';

  @override
  String get from => 'de';

  @override
  String get goNextTooltip => 'Ir para o próximo';

  @override
  String get goalHeadline => 'Metas';

  @override
  String goalProfit(Object value) {
    return 'Meta de metas: $value';
  }

  @override
  String get goalProfitTooltip => 'Lucro versus meta de metas';

  @override
  String get goalTooltip => 'Metas abertas';

  @override
  String get hasEncrypted => 'Uma vez definidas, não podem ser alteradas';

  @override
  String get helpTooltip => '[Ajuda] Mostrar descrição dessa página';

  @override
  String get homeHeadline => 'Página inicial';

  @override
  String get homeTooltip => 'Voltar à página principal';

  @override
  String get icon => 'Ícone';

  @override
  String get iconTooltip => 'Selecionar ícone';

  @override
  String get ignoreTooltip => 'Ignorar';

  @override
  String get importHeadline => 'Importação / Exportação';

  @override
  String get income => 'Valor do rendimento';

  @override
  String get incomeHeadline => 'Renda';

  @override
  String get incomeHealth => 'Radar de saúde do rendimento';

  @override
  String get incomeTooltip => 'Definir detalhes do rendimento';

  @override
  String get invoiceHeadline => 'Faturas';

  @override
  String invoiceSum(Object value) {
    return 'Faturas: $value';
  }

  @override
  String get isCleaned => 'Remover dados existentes';

  @override
  String get isCreated => 'Já criado, siga as próximas etapas!';

  @override
  String get isEncrypted => 'O arquivo é criptografado (por padrão)';

  @override
  String get isRequired => 'obrigatório';

  @override
  String get language => 'Idioma';

  @override
  String get left => 'esquerda';

  @override
  String get lightMode => 'Luz';

  @override
  String get link => 'Localizador uniforme de recursos (URL)';

  @override
  String get meaning => 'Significado';

  @override
  String get metricsHeadline => 'Métrica';

  @override
  String get metricsTooltip => 'Métricas';

  @override
  String get milestones => 'Marcos';

  @override
  String get missingContent =>
      'O arquivo não pode ser processado (ou cancelado)';

  @override
  String get navigationTooltip => 'Abrir o menu principal';

  @override
  String netProfit(Object value) {
    return 'Lucro: $value';
  }

  @override
  String get noChartData =>
      'Os dados estão faltando (ou não são suficientes) para serem exibidos';

  @override
  String get notifyHeadline => 'Analisador de notificações';

  @override
  String get ok => 'OK';

  @override
  String get orderPin => 'Ordem priorizada';

  @override
  String get orderUnpin => 'Ordem generalizada';

  @override
  String get outputFile => 'Destino do arquivo';

  @override
  String get parseFile => 'Analisar arquivo';

  @override
  String get password => 'Senha';

  @override
  String get path => 'Nome do arquivo (para salvar ou carregar)';

  @override
  String get paymentType => 'Intervalo de pagamento';

  @override
  String get paymentsHeadline => 'Pagamentos recorrentes';

  @override
  String get pearDisabled => '-- desativado --';

  @override
  String get pearLoading => 'Em andamento...';

  @override
  String get peerAccept => 'aceitar';

  @override
  String get peerAction => 'Ação';

  @override
  String get peerClosed => 'terminado';

  @override
  String get peerConnect => 'Conectar dispositivo';

  @override
  String get peerConnectBtn => 'conectar';

  @override
  String get peerDelete => 'excluir';

  @override
  String get peerDevice => 'Dispositivos conectados';

  @override
  String get peerId => 'Seu identificador de dispositivo para conexão';

  @override
  String get peerOffline => 'offline';

  @override
  String get peerOnline => 'conectado';

  @override
  String get peerOtherId => 'Identificador do dispositivo para conexão';

  @override
  String get peerPending => 'pendente';

  @override
  String get peerPing => 'ping';

  @override
  String get peerSent =>
      'Os dados são transferidos para os dispositivos conectados';

  @override
  String get peerStatus => 'Status';

  @override
  String get peerSync => 'Transferir dados';

  @override
  String pickFile(Object value) {
    return 'Escolher arquivo .$value';
  }

  @override
  String pongStatus(Object uuid) {
    return 'Solicitação recebida de $uuid';
  }

  @override
  String get processIsFinished => 'Concluído!';

  @override
  String progress(Object value) {
    return 'Progresso: $value%';
  }

  @override
  String get raiseData => 'Adição de valor';

  @override
  String get recoveryHeadline => 'Recuperação';

  @override
  String get recoveryTooltip => 'Recuperar de';

  @override
  String get releases => 'Liberações';

  @override
  String get reset => 'redefinir';

  @override
  String get returnBack => 'Retornar para trás';

  @override
  String get roadmap => 'Roteiro';

  @override
  String get saveNotification => 'Alterações salvas!';

  @override
  String get saveSettingsTooltip => 'Salvar';

  @override
  String get saveTooltip => 'Salvar para';

  @override
  String search(Object value) {
    return 'Mostrar por padrão \'$value\'';
  }

  @override
  String get searchTooltip => 'Procurar';

  @override
  String get settingsBaseHeadline => 'Noções básicas';

  @override
  String get settingsHeadline => 'Configurações';

  @override
  String get skipFromTotals => 'Excluir dos totais';

  @override
  String get skipTooltip => 'Pular etapa(s)';

  @override
  String get spent => 'gasto';

  @override
  String get splitCancelTooltip => 'Cancelar divisão por mês';

  @override
  String get splitTooltip => 'Declarar limites por mês';

  @override
  String get subscription =>
      'Como um projeto de código aberto, a assinatura não desbloqueará nenhum recurso adicional. No entanto, ela serviria como um investimento na evolução e no aprimoramento contínuos do aplicativo e para preservar sua disponibilidade.';

  @override
  String get subscriptionCoffee => 'Comprar um café';

  @override
  String get subscriptionDinner => 'Ofereça um jantar';

  @override
  String get subscriptionDonorbox => 'Assine via Donorbox';

  @override
  String get subscriptionGithub => 'Assine via GitHub';

  @override
  String get subscriptionHeadline => 'Patrocínio';

  @override
  String get subscriptionInactive => 'Serviço de compra indisponível';

  @override
  String get subscriptionPatreon => 'Assinar via Patreon';

  @override
  String get subscriptionPaypal => 'Comprar um café (PayPal)';

  @override
  String get subscriptionTiny => 'Dê uma moeda da sorte';

  @override
  String get subscriptionTooltip => 'Suporte (patrocínio)';

  @override
  String get success => 'Bem-sucedido';

  @override
  String get summary => 'Resumo';

  @override
  String get symbol => 'Símbolo';

  @override
  String get syncHeadline => 'Dispositivos de sincronização';

  @override
  String get systemMode => 'Sistema';

  @override
  String get tapToOpen => 'Toque para abrir';

  @override
  String get targetAmount => 'Valor alvo';

  @override
  String get termPrivacy => 'Política de privacidade';

  @override
  String get termUse => 'Termos de uso';

  @override
  String get title => 'Título';

  @override
  String get titleAccountTooltip => 'Inserir identificador de conta';

  @override
  String get titleBudgetTooltip => 'Inserir nome da categoria orçamentária';

  @override
  String get titleGoal => 'Meta';

  @override
  String get titleGoalTooltip => 'Definir descrição da meta';

  @override
  String get to => 'para';

  @override
  String get total => 'total';

  @override
  String get transactionFile =>
      'Arquivo de registro de transações do Fingrom (.log)';

  @override
  String get transferHeadline => 'Transferir';

  @override
  String get transferTooltip => 'Definir detalhes da transferência';

  @override
  String get transfersHeadline => 'Transferências';

  @override
  String get typeButton => 'Botão';

  @override
  String get updateAccountTooltip => 'Atualizar conta';

  @override
  String get updateBillTooltip => 'Update Bill (Atualizar conta)';

  @override
  String get updateBudgetTooltip =>
      'Update Budget Category (Atualizar categoria orçamentária)';

  @override
  String get updateGoalTooltip => 'Atualizar meta';

  @override
  String get updatePaymentTooltip => 'Atualizar pagamento';

  @override
  String get username => 'Nome de usuário (conta)';

  @override
  String get uuid => 'Identificador exclusivo de transação';

  @override
  String get validTillDate => 'Valid Till';

  @override
  String get webDav =>
      'Autoria e controle de versão distribuídos pela Web (WebDav)';

  @override
  String get zoomState => 'Ampliar / Reduzir o zoom';
}
