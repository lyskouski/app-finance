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
  String get aboutHeadline => 'Sobre';

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
  String get akahuAppToken => 'Token de App ID';

  @override
  String get akahuDescription =>
      'Importe saldos e transações de bancos da Nova Zelândia ligados ao Akahu com a sua própria aplicação pessoal gratuita. O Akahu atualiza os dados dos bancos segundo o seu próprio calendário (diariamente), pelo que as transações mais recentes podem aparecer mais tarde. O acesso é somente leitura: nenhum pagamento é efetuado.';

  @override
  String get akahuHeadline => 'Akahu Personal App (Nova Zelândia)';

  @override
  String get akahuInactive =>
      'O Akahu perdeu o acesso a esta conta: volte a ligá-la em my.akahu.nz/connections';

  @override
  String get akahuIncomplete =>
      'Preencha o token de App ID e o token de acesso do utilizador';

  @override
  String get akahuRefresh => 'Atualizar dados';

  @override
  String get akahuRefreshed =>
      'Foi pedido ao Akahu que obtenha novos dados dos bancos: repita a importação dentro de alguns minutos (no máximo uma vez por hora)';

  @override
  String get akahuSteps =>
      'Como obter os tokens:\n1. Registe-se em my.akahu.nz e ligue os seus bancos\n2. Abra a página \"Developers\", aceite os termos para programadores e configure a autenticação multifator\n3. Copie o token de App ID e o token de acesso do utilizador\n4. Cole-os abaixo e prima \"Ligar\"';

  @override
  String get akahuTokenTooltip =>
      'Apresentado na página \"Developers\" de my.akahu.nz; guardado encriptado';

  @override
  String get akahuUserToken => 'Token de acesso do utilizador';

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
  String get budgetPositive => 'Orçamento, Gerenciador de Resumo';

  @override
  String get budgetPositiveOff => 'Ignorar valores negativos';

  @override
  String get budgetPositiveOn => 'Incluir valores negativos';

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
  String get daySaturday => 'Sábado';

  @override
  String get dayStartOfMonth => 'Início do mês';

  @override
  String get dayStartOfWeek => 'Início da semana';

  @override
  String get daySunday => 'Domingo';

  @override
  String get deactivateAction => 'Desativar proteção por palavra-passe';

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
  String get enableBankingAppId => 'ID da aplicação';

  @override
  String get enableBankingBank => 'Banco';

  @override
  String get enableBankingCode =>
      'Endereço da página aberta após a autorização';

  @override
  String get enableBankingCodeTooltip =>
      'Confirme o acesso no banco, depois copie o endereço do navegador e cole-o aqui';

  @override
  String get enableBankingCountry => 'País (código ISO, p. ex. PT)';

  @override
  String get enableBankingDescription =>
      'Importe saldos e movimentos de bancos europeus através da API Enable Banking (PSD2) com a sua própria aplicação registada em enablebanking.com. Acesso apenas de leitura: não são efetuados pagamentos.';

  @override
  String get enableBankingHeadline => 'Enable Banking (EU)';

  @override
  String get enableBankingIncomplete =>
      'Preencha o ID da aplicação, a chave privada, o URL de redirecionamento e o país';

  @override
  String get enableBankingKey => 'Chave privada (PEM)';

  @override
  String get enableBankingKeyInvalid =>
      'Chave privada inválida: é esperado um bloco PEM \"PRIVATE KEY\"';

  @override
  String get enableBankingKeyNotRsa =>
      'Chave privada inválida: é esperada uma chave RSA';

  @override
  String get enableBankingKeyTooltip =>
      'Criada com a aplicação no Enable Banking Control Panel; guardada cifrada. Deixe vazio para manter a chave guardada';

  @override
  String get enableBankingLoadBanks => 'Carregar bancos';

  @override
  String get enableBankingNoAuthPage =>
      'O Enable Banking não devolveu nenhuma página de autorização';

  @override
  String get enableBankingNoCode =>
      'Nenhum código de autorização encontrado no endereço';

  @override
  String get enableBankingRedirect => 'URL de redirecionamento';

  @override
  String get enableBankingRedirectTooltip =>
      'Registado para a aplicação; o banco regressa a ele após a autorização';

  @override
  String get enableBankingStateMismatch =>
      'O endereço pertence a outra autorização, ligue novamente';

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
  String get finTsApproved => 'Aprovado na aplicação do banco';

  @override
  String get finTsBankCode => 'Código do banco (BLZ)';

  @override
  String get finTsCustomerId =>
      'ID de cliente (se diferente do ID de utilizador)';

  @override
  String get finTsDescription =>
      'Importe saldos e movimentos de bancos compatíveis com FinTS 4.1 (PIN/TAN). Acesso apenas de leitura: não são efetuados pagamentos.';

  @override
  String get finTsHeadline => 'Financial Transaction Services (FinTS 4.1)';

  @override
  String get finTsIncomplete =>
      'Preencha o URL do servidor, o código do banco, o ID de utilizador e o número de registo do produto';

  @override
  String finTsLoginChanged(Object value) {
    return 'O banco alterou os dados de acesso, atualize o ID de utilizador ou de cliente: $value';
  }

  @override
  String finTsLoginRefused(Object value) {
    return 'O banco recusou o início de sessão anterior: $value. Tentar novamente com o PIN introduzido?';
  }

  @override
  String get finTsPin => 'PIN';

  @override
  String get finTsPinHint => 'Utilizado apenas nesta sessão e nunca guardado';

  @override
  String get finTsProductId => 'Número de registo do produto';

  @override
  String get finTsProductIdTooltip =>
      'Atribuído pela Deutsche Kreditwirtschaft ao fabricante da aplicação';

  @override
  String get finTsTan => 'TAN';

  @override
  String get finTsTanHeadline => 'Autenticação da operação (TAN)';

  @override
  String get finTsTanMedium => 'Selecionar meio TAN';

  @override
  String get finTsTanMethod => 'Selecionar método TAN';

  @override
  String get finTsUrl => 'URL do servidor FinTS do banco';

  @override
  String get finTsUserId => 'ID de utilizador (login)';

  @override
  String get finTsVersion => 'Versão do protocolo';

  @override
  String get finTsWebUnsupported =>
      'Os servidores bancários não permitem o acesso a partir de um navegador. Utilize a aplicação para computador ou telemóvel.';

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
  String get hour => 'Hora';

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
  String get integrationAccessDenied =>
      'O acesso foi revogado ou as credenciais estão incorretas';

  @override
  String get integrationConnect => 'Ligar';

  @override
  String get integrationDateFrom => 'Importar movimentos desde';

  @override
  String get integrationDefaultBudgetCategory =>
      'Categoria de orçamento predefinida';

  @override
  String get integrationDisconnect => 'Desligar';

  @override
  String get integrationForget => 'Esquecer o acesso';

  @override
  String get integrationHeadline => 'Integrações';

  @override
  String integrationHttpError(Object value) {
    return 'O serviço respondeu com um erro (HTTP $value)';
  }

  @override
  String get integrationHttpsRequired =>
      'Apenas são permitidos endereços seguros (HTTPS)';

  @override
  String get integrationImport => 'Importar movimentos';

  @override
  String integrationImported(Object added, Object pending, Object skipped) {
    return 'Importados: $added, ignorados por já existirem: $skipped, pendentes (não importados): $pending';
  }

  @override
  String integrationInvalidAmount(Object value) {
    return 'Montante inválido: $value';
  }

  @override
  String get integrationNoAccounts => 'O banco não forneceu nenhuma conta';

  @override
  String get integrationPaymentRequired =>
      'O serviço exige um pagamento pelo acesso';

  @override
  String get integrationSelectTarget =>
      'Selecione a conta e a categoria de orçamento para importar';

  @override
  String integrationServiceError(Object value) {
    return 'Mensagem do serviço: $value';
  }

  @override
  String get integrationUnexpectedResponse => 'Resposta inesperada do serviço';

  @override
  String get investecApiKey => 'Chave de API';

  @override
  String get investecClientId => 'ID de cliente';

  @override
  String get investecCredentialsTooltip =>
      'Criado no Investec Online em Investec Developer → API keys; guardado encriptado';

  @override
  String get investecDescription =>
      'Importe saldos e transações de contas Investec Private Banking (África do Sul) através da Programmable Banking API com as suas próprias chaves de API. O acesso é somente leitura: nenhum pagamento é efetuado.';

  @override
  String get investecHeadline =>
      'Investec Programmable Banking (África do Sul)';

  @override
  String get investecIncomplete =>
      'Preencha o ID de cliente, o segredo e a chave de API';

  @override
  String get investecSandbox => 'Sandbox (dados de teste)';

  @override
  String get investecSecret => 'Segredo';

  @override
  String get investecSteps =>
      'Como obter as chaves de API:\n1. Inicie sessão no Investec Online e inscreva-se no Investec Developer (Programmable Banking)\n2. Abra API keys e crie uma chave com acesso a contas e transações\n3. Confirme-a com a verificação em dois passos e copie o ID de cliente, o segredo e a chave de API\n4. Cole-os abaixo e prima \"Ligar\"';

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
  String get managerHeadline => 'Gestor';

  @override
  String get meaning => 'Significado';

  @override
  String get metricsHeadline => 'Métrica';

  @override
  String get metricsTooltip => 'Métrica';

  @override
  String get milestones => 'Marcos';

  @override
  String get minute => 'Minuto';

  @override
  String get missingContent =>
      'O ficheiro não pode ser processado (ou cancelado)';

  @override
  String get monobankCreateAccount => 'Criar conta';

  @override
  String get monobankDescription =>
      'Importação de saldos e movimentos de cartões e mealheiros monobank com um token pessoal. O monobank permite um pedido por minuto: importar um período longo demora vários minutos. Acesso só de leitura: não são efetuados pagamentos.';

  @override
  String get monobankHeadline => 'monobank Personal API (Ucrânia)';

  @override
  String get monobankJar => 'Mealheiro';

  @override
  String monobankProgress(Object done, Object total) {
    return 'A pedir extratos: $done de $total';
  }

  @override
  String monobankRateLimit(Object value) {
    return 'O monobank permite um pedido por minuto: o próximo dentro de $value s';
  }

  @override
  String get monobankToken => 'Token pessoal';

  @override
  String get monobankTokenSteps =>
      'Como obter um token pessoal:\n1. Abra api.monobank.ua num navegador\n2. Leia o código QR com a aplicação monobank e confirme o acesso\n3. Copie o token da página\n4. Cole-o abaixo e prima «Ligar»\n5. Associe cada cartão ou mealheiro a uma conta (ou crie uma) e importe';

  @override
  String get monobankTokenTooltip =>
      'Emitido em api.monobank.ua após ler o código QR na aplicação monobank; guardado encriptado';

  @override
  String get monzoApprove =>
      'Aprove o acesso na aplicação Monzo e depois prima novamente \"Ligar\"';

  @override
  String get monzoClientId => 'ID de cliente';

  @override
  String get monzoClientSecret => 'Segredo de cliente';

  @override
  String get monzoClientSecretTooltip =>
      'Apresentado para o cliente OAuth em developers.monzo.com; guardado cifrado. Deixe vazio para manter o segredo guardado';

  @override
  String get monzoCode => 'Endereço da página aberta após o início de sessão';

  @override
  String get monzoCodeTooltip =>
      'Se o Fingrom não tiver sido aberto automaticamente, copie o endereço do navegador e cole-o aqui';

  @override
  String get monzoDescription =>
      'Importe saldos e transações de contas Monzo com o seu próprio cliente OAuth registado em developers.monzo.com (apenas para uso pessoal). O acesso é somente leitura: nenhum pagamento é efetuado.';

  @override
  String get monzoExpired => 'O acesso ao Monzo expirou: ligue novamente';

  @override
  String monzoFullHistory(Object value) {
    return 'O histórico completo está disponível até às $value: escolha uma data anterior e importe agora. Depois, o Monzo fornece apenas os últimos 90 dias';
  }

  @override
  String get monzoHeadline => 'Monzo Developer API (Reino Unido)';

  @override
  String monzoHistoryLimited(Object value) {
    return 'O Monzo fornece apenas os últimos 90 dias: os movimentos são importados desde $value';
  }

  @override
  String get monzoIncomplete =>
      'Preencha o ID de cliente, o segredo de cliente e o URL de redirecionamento';

  @override
  String get monzoRedirect => 'URL de redirecionamento';

  @override
  String get monzoRedirectTooltip =>
      'Defina exatamente este endereço para o cliente OAuth; o Monzo regressa a ele após o início de sessão';

  @override
  String get monzoSteps =>
      'Como ligar:\n1. Inicie sessão em developers.monzo.com com o e-mail da sua conta Monzo\n2. Abra Clients → New OAuth Client, escolha \"Confidential\" e defina o URL de redirecionamento apresentado abaixo\n3. Copie o ID de cliente e o segredo de cliente, cole-os abaixo e prima \"Ligar\"\n4. Abra a ligação enviada por e-mail, aprove o acesso na aplicação Monzo e prima novamente \"Ligar\"\n5. Importe de imediato: o histórico completo só está disponível durante 5 minutos após a aprovação, depois apenas os últimos 90 dias';

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
  String get notificationAccessSettings => 'Acesso às notificações';

  @override
  String get notificationAccessSteps =>
      'Como conceder o acesso:\n1. Prima \"Conceder acesso\" para abrir as definições do sistema\n2. Permita que o Fingrom leia as notificações\n3. Se o Android indicar uma definição restrita: abra as informações da aplicação Fingrom → ⋮ → \"Permitir definições restritas\" e tente novamente\n4. Volte ao Fingrom e selecione as aplicações cujas notificações devem ser lidas';

  @override
  String get notificationAccounts => 'Palavras-chave de contas';

  @override
  String get notificationAccountsTooltip =>
      'Palavras que identificam a conta numa notificação (últimos dígitos do cartão, nome da carteira): escreva uma palavra e prima Enter para a adicionar. Caso contrário, é usada a conta predefinida da aplicação';

  @override
  String get notificationApps => 'Aplicações cujas notificações são lidas';

  @override
  String notificationAutoImported(Object value) {
    return 'Adicionados a partir de notificações: $value';
  }

  @override
  String get notificationAutoTooltip =>
      'As notificações reconhecidas são adicionadas sem confirmação: de imediato enquanto o Fingrom está em execução, caso contrário no próximo arranque. As não reconhecidas aguardam revisão';

  @override
  String get notificationBalance => 'Palavras-chave de saldo';

  @override
  String get notificationBalanceTooltip =>
      'Palavras antes de um valor a ignorar (saldo, limite): escreva uma palavra e prima Enter para a adicionar';

  @override
  String notificationCaptured(Object value) {
    return 'Notificações capturadas: $value';
  }

  @override
  String get notificationClear => 'Limpar capturadas';

  @override
  String get notificationCurrencyTooltip =>
      'Os montantes sem moeda (por exemplo, Débito 20,00) são considerados nesta moeda';

  @override
  String get notificationDefaultAccount => 'Conta predefinida';

  @override
  String get notificationDescription =>
      'Crie movimentos a partir das notificações de aplicações bancárias e de pagamento neste dispositivo. Apenas as notificações das aplicações selecionadas são lidas e permanecem no dispositivo até serem importadas. O montante e a moeda são reconhecidos automaticamente.';

  @override
  String get notificationGrant => 'Conceder acesso';

  @override
  String get notificationIncome => 'Palavras-chave de receita';

  @override
  String get notificationIncomeTooltip =>
      'Palavras que marcam uma notificação como receita: escreva uma palavra e prima Enter para a adicionar';

  @override
  String get notificationMerchant => 'Etiquetas do comerciante';

  @override
  String get notificationMerchantTooltip =>
      'Palavras seguidas de dois pontos e de um comerciante (Local: Loja): escreva uma palavra e prima Enter para a adicionar';

  @override
  String get notificationNoApps =>
      'Ainda não foram recebidas notificações: as aplicações aparecem aqui depois de publicarem uma notificação';

  @override
  String get notificationUnparsed => 'Não reconhecido';

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
  String get privatBankAdd => 'Adicionar conta';

  @override
  String get privatBankDescription =>
      'Importar saldos e transações de contas empresariais (empresários individuais e empresas) do Privat24 for Business com um token Autoclient. As contas pessoais não são suportadas pela API. O acesso é apenas de leitura: não são efetuados pagamentos.';

  @override
  String get privatBankHeadline => 'PrivatBank Autoclient (Ucrânia)';

  @override
  String get privatBankIban => 'IBAN da conta';

  @override
  String get privatBankIbanInvalid =>
      'Introduza um IBAN ucraniano: UA seguido de 27 dígitos';

  @override
  String get privatBankIbanTooltip =>
      'A API não fornece uma lista de contas: adicione os IBAN das contas um a um';

  @override
  String privatBankNotReady(Object value) {
    return 'O PrivatBank está a preparar os extratos (fase $value): tente novamente dentro de alguns minutos';
  }

  @override
  String get privatBankRemove => 'Remover conta';

  @override
  String get privatBankToken => 'Token Autoclient';

  @override
  String get privatBankTokenSteps =>
      'Como obter um token Autoclient:\n1. Inicie sessão no Privat24 for Business\n2. Abra Integração (Autoclient)\n3. Ative-a e copie o token\n4. Cole-o abaixo e prima «Ligar»\n5. Adicione os IBAN das contas a importar';

  @override
  String get privatBankTokenTooltip =>
      'Emitido no Privat24 for Business em Integração (Autoclient); guardado de forma encriptada';

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
  String get secureBioNotMatch =>
      'Falha na autenticação! Por favor, tente novamente';

  @override
  String get secureBioPromptReason => 'Por favor, autentique-se para continuar';

  @override
  String get secureBioPromptTitle => 'Autenticação biométrica';

  @override
  String get secureOtpCode => 'Código de Palavra-passe Única';

  @override
  String get secureOtpCodeInvalid =>
      'Código inválido! Por favor, gere um novo código e insira-o';

  @override
  String get secureOtpDeactivated =>
      'A proteção por palavra-passe está desativada';

  @override
  String get securePassword => 'Palavra-passe (Frase de Recuperação)';

  @override
  String get securePasswordEmpty => 'A palavra-passe não pode estar em branco!';

  @override
  String get securePasswordNotMatch => 'As senhas não coincidem!';

  @override
  String get securePasswordRepeat => 'Repetir Palavra-passe';

  @override
  String get securityHeadline => 'Segurança';

  @override
  String get settingsBaseHeadline => 'Noções básicas';

  @override
  String get settingsHeadline => 'Definições';

  @override
  String get settingsSaved => 'Configurações salvas!';

  @override
  String get simpleFinDescription =>
      'Importe saldos e movimentos de bancos e emissores de cartões dos EUA através de um SimpleFIN Bridge. Acesso apenas de leitura: não são efetuados pagamentos.';

  @override
  String get simpleFinHeadline => 'SimpleFIN Bridge (US)';

  @override
  String get simpleFinNoCredentials =>
      'O SimpleFIN Bridge devolveu um endereço de acesso sem credenciais';

  @override
  String get simpleFinToken => 'Token de configuração SimpleFIN';

  @override
  String get simpleFinTokenClaimed =>
      'O token de configuração não existe ou já foi utilizado';

  @override
  String get simpleFinTokenInvalid =>
      'Token de configuração SimpleFIN inválido';

  @override
  String get simpleFinTokenTooltip =>
      'Criado no seu SimpleFIN Bridge (p. ex., bridge.simplefin.org) para esta aplicação; só pode ser utilizado uma vez';

  @override
  String get skipFromTotals => 'Excluir dos totais';

  @override
  String get skipTooltip => 'Saltar passo(s)';

  @override
  String get sortTooltip => 'Ordenar itens';

  @override
  String get sortingAmountAsc => 'Valor ascendente';

  @override
  String get sortingAmountDesc => 'Valor descendente';

  @override
  String get sortingCreatedAtAsc => 'Criado em ordem crescente';

  @override
  String get sortingCreatedAtDesc => 'Criado em ordem decrescente';

  @override
  String get sortingTitleAsc => 'Título em ordem crescente';

  @override
  String get sortingTitleDesc => 'Título em ordem decrescente';

  @override
  String get sortingUpdatedAtAsc => 'Atualizado em ordem crescente';

  @override
  String get sortingUpdatedAtDesc => 'Atualizado em ordem decrescente';

  @override
  String get spent => 'gasto';

  @override
  String get splitCancelTooltip => 'Cancelar divisão por mês';

  @override
  String get splitHeadline => 'Dividir a conta';

  @override
  String get splitTooltip => 'Declarar limites por mês';

  @override
  String get starlingDescription =>
      'Importe saldos e transações de contas Starling Bank com um token de acesso pessoal da sua conta de programador gratuita. O acesso é somente leitura: nenhum pagamento é efetuado.';

  @override
  String get starlingHeadline => 'Starling Bank Personal Access (Reino Unido)';

  @override
  String get starlingScopes =>
      'Falta uma permissão ao token: crie-o com os âmbitos \"account:read\", \"balance:read\" e \"transaction:read\"';

  @override
  String get starlingToken => 'Token de acesso pessoal';

  @override
  String get starlingTokenSteps =>
      'Como obter um token de acesso pessoal:\n1. Registe-se em developer.starlingbank.com (gratuito)\n2. Abra Personal Access, adicione a sua conta Starling e aprove-a na aplicação Starling\n3. Crie um token com os âmbitos \"account:read\", \"balance:read\" e \"transaction:read\"\n4. Cole-o abaixo e prima \"Ligar\"';

  @override
  String get starlingTokenTooltip =>
      'Criado em developer.starlingbank.com em Personal Access; guardado encriptado';

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
  String get tellerAccessToken => 'Token de acesso';

  @override
  String get tellerAccessTokenTooltip =>
      'Apresentado pela página de ligação depois de associar um banco: cole-o aqui se o Fingrom não tiver sido aberto automaticamente';

  @override
  String get tellerAppId => 'ID da aplicação';

  @override
  String get tellerAppIdTooltip =>
      'Apresentado no Teller Dashboard, começa por \"app_\"';

  @override
  String get tellerCertificate => 'Certificado (PEM)';

  @override
  String get tellerCertificateInvalid =>
      'Certificado inválido: é esperado um bloco PEM \"CERTIFICATE\"';

  @override
  String get tellerCertificateTooltip =>
      'Emitido no Teller Dashboard (Certificates); guardado cifrado. Deixe vazio para manter o certificado guardado';

  @override
  String get tellerConnectBank => 'Ligar banco';

  @override
  String get tellerConnectPage => 'Página de ligação';

  @override
  String get tellerConnectPageTooltip =>
      'Abre o Teller Connect num navegador e devolve o token de acesso ao Fingrom';

  @override
  String get tellerDescription =>
      'Importe saldos e movimentos de bancos e emissores de cartões dos EUA através do Teller com a sua própria aplicação registada em teller.io (o plano gratuito permite 100 ligações bancárias reais). Acesso apenas de leitura: não são efetuados pagamentos.';

  @override
  String get tellerDisconnected =>
      'A ligação ao banco requer a sua atenção (p. ex. um novo início de sessão ou um código de confirmação): ligue novamente o banco';

  @override
  String get tellerEnvironment => 'Ambiente';

  @override
  String get tellerHeadline => 'Teller (US)';

  @override
  String get tellerIncomplete =>
      'Preencha o ID da aplicação; o certificado e a chave privada são necessários para dados bancários reais';

  @override
  String get tellerKey => 'Chave privada (PEM)';

  @override
  String get tellerKeyInvalid =>
      'Chave privada inválida: é esperado um bloco PEM \"PRIVATE KEY\"';

  @override
  String get tellerKeyTooltip =>
      'Transferida juntamente com o certificado; guardada cifrada. Deixe vazio para manter a chave guardada';

  @override
  String get tellerMissingCertificate =>
      'O Teller rejeitou o pedido sem um certificado de cliente: carregue o certificado e a chave privada, ou escolha sandbox';

  @override
  String get tellerSteps =>
      'Como ligar:\n1. Registe-se em teller.io e abra o Teller Dashboard\n2. Copie o ID da aplicação e, em seguida, crie e transfira um certificado com a respetiva chave privada (Certificates)\n3. Preencha-os abaixo e escolha o ambiente (sandbox: dados de teste, inicie sessão num banco como \"username\" com \"password\")\n4. Prima \"Ligar banco\" e inicie sessão no seu banco na página aberta\n5. Selecione a conta e a categoria de orçamento e prima \"Importar movimentos\"';

  @override
  String get tellerUpload => 'Carregar ficheiro';

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
  String get upDescription =>
      'Importe saldos e transações de contas de despesas e poupança Up com um token de acesso pessoal. As transferências entre contas Up vinculadas (incluindo Round Ups) são importadas como transferências. O acesso é somente leitura: nenhum pagamento é efetuado.';

  @override
  String get upHeadline => 'Up Banking API (Austrália)';

  @override
  String get upToken => 'Token de acesso pessoal';

  @override
  String get upTokenSteps =>
      'Como obter um token de acesso pessoal:\n1. Abra a aplicação Up e vá a Data sharing → Personal Access Token (ou inicie sessão em api.up.com.au)\n2. Crie um token e copie-o (começa por \"up:yeah:\"); um novo token substitui o anterior\n3. Cole-o abaixo e prima \"Ligar\"\n4. Vincule todas as contas Up (incluindo as de poupança) para que as transferências entre elas sejam importadas como transferências';

  @override
  String get upTokenTooltip =>
      'Criado na aplicação Up ou em api.up.com.au; guardado encriptado. Apenas o token mais recente é válido';

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
  String get wiseDescription =>
      'Importe saldos e transações de contas multimoeda Wise com um token de API pessoal. As conversões entre saldos vinculados são importadas como transferências. O acesso é somente leitura: nenhum pagamento é efetuado.';

  @override
  String get wiseHeadline => 'Wise API (Global)';

  @override
  String get wiseNoProfiles => 'Não há perfis Wise disponíveis para o token';

  @override
  String get wiseProfile => 'Perfil';

  @override
  String get wiseScaRequired =>
      'A Wise exige uma autenticação forte do cliente: abra o extrato deste saldo na aplicação Wise e tente novamente';

  @override
  String get wiseToken => 'Token de API pessoal';

  @override
  String get wiseTokenSteps =>
      'Como obter um token de API pessoal:\n1. Inicie sessão em wise.com num navegador (os tokens não podem ser criados na aplicação móvel)\n2. Abra Definições → Integrações e ferramentas → Tokens de API\n3. Escolha \"Adicionar novo token\", dê-lhe um nome (p. ex. Fingrom) e selecione o acesso \"Só de leitura\"\n4. Confirme com a verificação em dois passos e copie o token\n5. Cole-o abaixo e prima \"Ligar\"';

  @override
  String get wiseTokenTooltip =>
      'Criado na Wise em Definições → Tokens de API (só de leitura, se disponível); guardado encriptado';

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
  String get aboutHeadline => 'Sobre';

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
  String get akahuAppToken => 'Token de App ID';

  @override
  String get akahuDescription =>
      'Importe saldos e transações de bancos da Nova Zelândia conectados ao Akahu com seu próprio aplicativo pessoal gratuito. O Akahu atualiza os dados dos bancos conforme sua própria programação (diariamente), então as transações mais recentes podem aparecer mais tarde. O acesso é somente leitura: nenhum pagamento é efetuado.';

  @override
  String get akahuHeadline => 'Akahu Personal App (Nova Zelândia)';

  @override
  String get akahuInactive =>
      'O Akahu perdeu o acesso a esta conta: conecte-a novamente em my.akahu.nz/connections';

  @override
  String get akahuIncomplete =>
      'Preencha o token de App ID e o token de acesso do usuário';

  @override
  String get akahuRefresh => 'Atualizar dados';

  @override
  String get akahuRefreshed =>
      'Foi solicitado ao Akahu que busque novos dados dos bancos: tente a importação novamente em alguns minutos (no máximo uma vez por hora)';

  @override
  String get akahuSteps =>
      'Como obter os tokens:\n1. Cadastre-se em my.akahu.nz e conecte seus bancos\n2. Abra a página \"Developers\", aceite os termos para desenvolvedores e configure a autenticação multifator\n3. Copie o token de App ID e o token de acesso do usuário\n4. Cole-os abaixo e toque em \"Conectar\"';

  @override
  String get akahuTokenTooltip =>
      'Exibido na página \"Developers\" de my.akahu.nz; armazenado criptografado';

  @override
  String get akahuUserToken => 'Token de acesso do usuário';

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
  String get budgetPositive => 'Orçamento, Gerenciador de Resumo';

  @override
  String get budgetPositiveOff => 'Ignorar valores negativos';

  @override
  String get budgetPositiveOn => 'Incluir valores negativos';

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
  String get daySaturday => 'Sábado';

  @override
  String get dayStartOfMonth => 'Início do mês';

  @override
  String get dayStartOfWeek => 'Início da semana';

  @override
  String get daySunday => 'Domingo';

  @override
  String get deactivateAction => 'Desativar proteção por senha';

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
  String get enableBankingAppId => 'ID do aplicativo';

  @override
  String get enableBankingBank => 'Banco';

  @override
  String get enableBankingCode =>
      'Endereço da página aberta após a autorização';

  @override
  String get enableBankingCodeTooltip =>
      'Confirme o acesso no banco, depois copie o endereço do navegador e cole-o aqui';

  @override
  String get enableBankingCountry => 'País (código ISO, ex.: PT)';

  @override
  String get enableBankingDescription =>
      'Importe saldos e transações de bancos europeus pela API Enable Banking (PSD2) com seu próprio aplicativo registrado em enablebanking.com. Acesso somente leitura: nenhum pagamento é realizado.';

  @override
  String get enableBankingHeadline => 'Enable Banking (EU)';

  @override
  String get enableBankingIncomplete =>
      'Preencha o ID do aplicativo, a chave privada, a URL de redirecionamento e o país';

  @override
  String get enableBankingKey => 'Chave privada (PEM)';

  @override
  String get enableBankingKeyInvalid =>
      'Chave privada inválida: é esperado um bloco PEM \"PRIVATE KEY\"';

  @override
  String get enableBankingKeyNotRsa =>
      'Chave privada inválida: é esperada uma chave RSA';

  @override
  String get enableBankingKeyTooltip =>
      'Criada com o aplicativo no Enable Banking Control Panel; armazenada criptografada. Deixe vazio para manter a chave armazenada';

  @override
  String get enableBankingLoadBanks => 'Carregar bancos';

  @override
  String get enableBankingNoAuthPage =>
      'O Enable Banking não retornou nenhuma página de autorização';

  @override
  String get enableBankingNoCode =>
      'Nenhum código de autorização encontrado no endereço';

  @override
  String get enableBankingRedirect => 'URL de redirecionamento';

  @override
  String get enableBankingRedirectTooltip =>
      'Registrada para o aplicativo; o banco retorna a ela após a autorização';

  @override
  String get enableBankingStateMismatch =>
      'O endereço pertence a outra autorização, conecte novamente';

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
  String get finTsApproved => 'Aprovado no aplicativo do banco';

  @override
  String get finTsBankCode => 'Código do banco (BLZ)';

  @override
  String get finTsCustomerId => 'ID do cliente (se diferente do ID do usuário)';

  @override
  String get finTsDescription =>
      'Importe saldos e transações de bancos compatíveis com FinTS 4.1 (PIN/TAN). Acesso somente leitura: nenhum pagamento é realizado.';

  @override
  String get finTsHeadline => 'Financial Transaction Services (FinTS 4.1)';

  @override
  String get finTsIncomplete =>
      'Preencha a URL do servidor, o código do banco, o ID do usuário e o número de registro do produto';

  @override
  String finTsLoginChanged(Object value) {
    return 'O banco alterou os dados de acesso, atualize o ID do usuário ou do cliente: $value';
  }

  @override
  String finTsLoginRefused(Object value) {
    return 'O banco recusou o login anterior: $value. Tentar novamente com o PIN informado?';
  }

  @override
  String get finTsPin => 'PIN';

  @override
  String get finTsPinHint => 'Usado somente nesta sessão e nunca armazenado';

  @override
  String get finTsProductId => 'Número de registro do produto';

  @override
  String get finTsProductIdTooltip =>
      'Emitido pela Deutsche Kreditwirtschaft para o fabricante do aplicativo';

  @override
  String get finTsTan => 'TAN';

  @override
  String get finTsTanHeadline => 'Autenticação da transação (TAN)';

  @override
  String get finTsTanMedium => 'Selecionar meio TAN';

  @override
  String get finTsTanMethod => 'Selecionar método TAN';

  @override
  String get finTsUrl => 'URL do servidor FinTS do banco';

  @override
  String get finTsUserId => 'ID do usuário (login)';

  @override
  String get finTsVersion => 'Versão do protocolo';

  @override
  String get finTsWebUnsupported =>
      'Os servidores bancários não permitem acesso pelo navegador. Use o aplicativo para desktop ou celular.';

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
  String get hour => 'Hora';

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
  String get integrationAccessDenied =>
      'O acesso foi revogado ou as credenciais estão incorretas';

  @override
  String get integrationConnect => 'Conectar';

  @override
  String get integrationDateFrom => 'Importar transações desde';

  @override
  String get integrationDefaultBudgetCategory =>
      'Categoria de orçamento padrão';

  @override
  String get integrationDisconnect => 'Desconectar';

  @override
  String get integrationForget => 'Esquecer o acesso';

  @override
  String get integrationHeadline => 'Integrações';

  @override
  String integrationHttpError(Object value) {
    return 'O serviço respondeu com um erro (HTTP $value)';
  }

  @override
  String get integrationHttpsRequired =>
      'Somente endereços seguros (HTTPS) são permitidos';

  @override
  String get integrationImport => 'Importar transações';

  @override
  String integrationImported(Object added, Object pending, Object skipped) {
    return 'Importadas: $added, ignoradas por já existirem: $skipped, pendentes (não importadas): $pending';
  }

  @override
  String integrationInvalidAmount(Object value) {
    return 'Valor inválido: $value';
  }

  @override
  String get integrationNoAccounts => 'O banco não forneceu nenhuma conta';

  @override
  String get integrationPaymentRequired =>
      'O serviço exige um pagamento pelo acesso';

  @override
  String get integrationSelectTarget =>
      'Selecione a conta e a categoria de orçamento para importar';

  @override
  String integrationServiceError(Object value) {
    return 'Mensagem do serviço: $value';
  }

  @override
  String get integrationUnexpectedResponse => 'Resposta inesperada do serviço';

  @override
  String get investecApiKey => 'Chave de API';

  @override
  String get investecClientId => 'ID de cliente';

  @override
  String get investecCredentialsTooltip =>
      'Criado no Investec Online em Investec Developer → API keys; armazenado criptografado';

  @override
  String get investecDescription =>
      'Importe saldos e transações de contas Investec Private Banking (África do Sul) por meio da Programmable Banking API com suas próprias chaves de API. O acesso é somente leitura: nenhum pagamento é efetuado.';

  @override
  String get investecHeadline =>
      'Investec Programmable Banking (África do Sul)';

  @override
  String get investecIncomplete =>
      'Preencha o ID de cliente, o segredo e a chave de API';

  @override
  String get investecSandbox => 'Sandbox (dados de teste)';

  @override
  String get investecSecret => 'Segredo';

  @override
  String get investecSteps =>
      'Como obter as chaves de API:\n1. Entre no Investec Online e inscreva-se no Investec Developer (Programmable Banking)\n2. Abra API keys e crie uma chave com acesso a contas e transações\n3. Confirme-a com a verificação em duas etapas e copie o ID de cliente, o segredo e a chave de API\n4. Cole-os abaixo e toque em \"Conectar\"';

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
  String get managerHeadline => 'Gerenciador';

  @override
  String get meaning => 'Significado';

  @override
  String get metricsHeadline => 'Métrica';

  @override
  String get metricsTooltip => 'Métricas';

  @override
  String get milestones => 'Marcos';

  @override
  String get minute => 'Minuto';

  @override
  String get missingContent =>
      'O arquivo não pode ser processado (ou cancelado)';

  @override
  String get monobankCreateAccount => 'Criar conta';

  @override
  String get monobankDescription =>
      'Importação de saldos e transações de cartões e cofrinhos monobank com um token pessoal. O monobank permite uma requisição por minuto: importar um período longo leva vários minutos. Acesso somente leitura: nenhum pagamento é feito.';

  @override
  String get monobankHeadline => 'monobank Personal API (Ucrânia)';

  @override
  String get monobankJar => 'Cofrinho';

  @override
  String monobankProgress(Object done, Object total) {
    return 'Solicitando extratos: $done de $total';
  }

  @override
  String monobankRateLimit(Object value) {
    return 'O monobank permite uma requisição por minuto: a próxima em $value s';
  }

  @override
  String get monobankToken => 'Token pessoal';

  @override
  String get monobankTokenSteps =>
      'Como obter um token pessoal:\n1. Abra api.monobank.ua em um navegador\n2. Escaneie o QR code com o app monobank e confirme o acesso\n3. Copie o token da página\n4. Cole-o abaixo e toque em \"Conectar\"\n5. Vincule cada cartão ou cofrinho a uma conta (ou crie uma) e importe';

  @override
  String get monobankTokenTooltip =>
      'Emitido em api.monobank.ua após escanear o QR code no app monobank; armazenado criptografado';

  @override
  String get monzoApprove =>
      'Aprove o acesso no aplicativo Monzo e depois toque em \"Conectar\" novamente';

  @override
  String get monzoClientId => 'ID de cliente';

  @override
  String get monzoClientSecret => 'Segredo de cliente';

  @override
  String get monzoClientSecretTooltip =>
      'Exibido para o cliente OAuth em developers.monzo.com; armazenado criptografado. Deixe vazio para manter o segredo armazenado';

  @override
  String get monzoCode => 'Endereço da página aberta após o login';

  @override
  String get monzoCodeTooltip =>
      'Se o Fingrom não foi aberto automaticamente, copie o endereço do navegador e cole-o aqui';

  @override
  String get monzoDescription =>
      'Importe saldos e transações de contas Monzo com seu próprio cliente OAuth registrado em developers.monzo.com (somente para uso pessoal). O acesso é somente leitura: nenhum pagamento é efetuado.';

  @override
  String get monzoExpired => 'O acesso ao Monzo expirou: conecte novamente';

  @override
  String monzoFullHistory(Object value) {
    return 'O histórico completo está disponível até as $value: escolha uma data anterior e importe agora. Depois, o Monzo fornece apenas os últimos 90 dias';
  }

  @override
  String get monzoHeadline => 'Monzo Developer API (Reino Unido)';

  @override
  String monzoHistoryLimited(Object value) {
    return 'O Monzo fornece apenas os últimos 90 dias: as transações são importadas desde $value';
  }

  @override
  String get monzoIncomplete =>
      'Preencha o ID de cliente, o segredo de cliente e a URL de redirecionamento';

  @override
  String get monzoRedirect => 'URL de redirecionamento';

  @override
  String get monzoRedirectTooltip =>
      'Defina exatamente este endereço para o cliente OAuth; o Monzo retorna a ele após o login';

  @override
  String get monzoSteps =>
      'Como conectar:\n1. Entre em developers.monzo.com com o e-mail da sua conta Monzo\n2. Abra Clients → New OAuth Client, escolha \"Confidential\" e defina a URL de redirecionamento exibida abaixo\n3. Copie o ID de cliente e o segredo de cliente, cole-os abaixo e toque em \"Conectar\"\n4. Abra o link enviado por e-mail, aprove o acesso no aplicativo Monzo e toque em \"Conectar\" novamente\n5. Importe imediatamente: o histórico completo fica disponível apenas por 5 minutos após a aprovação, depois apenas os últimos 90 dias';

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
  String get notificationAccessSettings => 'Acesso às notificações';

  @override
  String get notificationAccessSteps =>
      'Como conceder o acesso:\n1. Toque em \"Conceder acesso\" para abrir as configurações do sistema\n2. Permita que o Fingrom leia as notificações\n3. Se o Android informar uma configuração restrita: abra as informações do app Fingrom → ⋮ → \"Permitir configurações restritas\" e tente novamente\n4. Volte ao Fingrom e selecione os aplicativos cujas notificações serão lidas';

  @override
  String get notificationAccounts => 'Palavras-chave de contas';

  @override
  String get notificationAccountsTooltip =>
      'Palavras que identificam a conta em uma notificação (últimos dígitos do cartão, nome da carteira): digite uma palavra e pressione Enter para adicioná-la. Caso contrário, é usada a conta padrão do aplicativo';

  @override
  String get notificationApps => 'Aplicativos cujas notificações são lidas';

  @override
  String notificationAutoImported(Object value) {
    return 'Adicionadas a partir de notificações: $value';
  }

  @override
  String get notificationAutoTooltip =>
      'As notificações reconhecidas são adicionadas sem confirmação: imediatamente enquanto o Fingrom está em execução, caso contrário na próxima abertura. As não reconhecidas aguardam revisão';

  @override
  String get notificationBalance => 'Palavras-chave de saldo';

  @override
  String get notificationBalanceTooltip =>
      'Palavras antes de um valor a ignorar (saldo, limite): digite uma palavra e pressione Enter para adicioná-la';

  @override
  String notificationCaptured(Object value) {
    return 'Notificações capturadas: $value';
  }

  @override
  String get notificationClear => 'Limpar capturadas';

  @override
  String get notificationCurrencyTooltip =>
      'Os valores sem moeda (por exemplo, Débito 20,00) são considerados nesta moeda';

  @override
  String get notificationDefaultAccount => 'Conta padrão';

  @override
  String get notificationDescription =>
      'Crie transações a partir de notificações de aplicativos bancários e de pagamento neste dispositivo. Apenas as notificações dos aplicativos selecionados são lidas e ficam no dispositivo até serem importadas. O valor e a moeda são reconhecidos automaticamente.';

  @override
  String get notificationGrant => 'Conceder acesso';

  @override
  String get notificationIncome => 'Palavras-chave de receita';

  @override
  String get notificationIncomeTooltip =>
      'Palavras que marcam uma notificação como receita: digite uma palavra e pressione Enter para adicioná-la';

  @override
  String get notificationMerchant => 'Rótulos do estabelecimento';

  @override
  String get notificationMerchantTooltip =>
      'Palavras seguidas de dois-pontos e de um estabelecimento (Local: Loja): digite uma palavra e pressione Enter para adicioná-la';

  @override
  String get notificationNoApps =>
      'Nenhuma notificação recebida ainda: os aplicativos aparecem aqui depois de enviarem uma notificação';

  @override
  String get notificationUnparsed => 'Não reconhecido';

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
  String get privatBankAdd => 'Adicionar conta';

  @override
  String get privatBankDescription =>
      'Importe saldos e transações de contas empresariais (MEI e empresas) do Privat24 for Business com um token Autoclient. Contas pessoais não são suportadas pela API. O acesso é somente leitura: nenhum pagamento é feito.';

  @override
  String get privatBankHeadline => 'PrivatBank Autoclient (Ucrânia)';

  @override
  String get privatBankIban => 'IBAN da conta';

  @override
  String get privatBankIbanInvalid =>
      'Informe um IBAN ucraniano: UA seguido de 27 dígitos';

  @override
  String get privatBankIbanTooltip =>
      'A API não fornece uma lista de contas: adicione os IBANs das contas um por um';

  @override
  String privatBankNotReady(Object value) {
    return 'O PrivatBank está preparando os extratos (fase $value): tente novamente em alguns minutos';
  }

  @override
  String get privatBankRemove => 'Remover conta';

  @override
  String get privatBankToken => 'Token Autoclient';

  @override
  String get privatBankTokenSteps =>
      'Como obter um token Autoclient:\n1. Entre no Privat24 for Business\n2. Abra Integração (Autoclient)\n3. Ative-a e copie o token\n4. Cole-o abaixo e toque em \"Conectar\"\n5. Adicione os IBANs das contas a importar';

  @override
  String get privatBankTokenTooltip =>
      'Emitido no Privat24 for Business em Integração (Autoclient); armazenado criptografado';

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
  String get secureBioNotMatch =>
      'Falha na autenticação! Por favor, tente novamente';

  @override
  String get secureBioPromptReason => 'Por favor, autentique-se para continuar';

  @override
  String get secureBioPromptTitle => 'Autenticação biométrica';

  @override
  String get secureOtpCode => 'Código de Senha Única';

  @override
  String get secureOtpCodeInvalid =>
      'Código inválido! Por favor, gere um novo código e insira-o';

  @override
  String get secureOtpDeactivated => 'A proteção por senha está desativada';

  @override
  String get securePassword => 'Senha (Frase de Recuperação)';

  @override
  String get securePasswordEmpty => 'A senha não pode estar em branco!';

  @override
  String get securePasswordNotMatch => 'As senhas não coincidem!';

  @override
  String get securePasswordRepeat => 'Repetir Senha';

  @override
  String get securityHeadline => 'Segurança';

  @override
  String get settingsBaseHeadline => 'Noções básicas';

  @override
  String get settingsHeadline => 'Configurações';

  @override
  String get settingsSaved => 'Configurações salvas!';

  @override
  String get simpleFinDescription =>
      'Importe saldos e transações de bancos e emissores de cartões dos EUA por meio de um SimpleFIN Bridge. Acesso somente leitura: nenhum pagamento é realizado.';

  @override
  String get simpleFinHeadline => 'SimpleFIN Bridge (US)';

  @override
  String get simpleFinNoCredentials =>
      'O SimpleFIN Bridge retornou um endereço de acesso sem credenciais';

  @override
  String get simpleFinToken => 'Token de configuração do SimpleFIN';

  @override
  String get simpleFinTokenClaimed =>
      'O token de configuração não existe ou já foi usado';

  @override
  String get simpleFinTokenInvalid =>
      'Token de configuração do SimpleFIN inválido';

  @override
  String get simpleFinTokenTooltip =>
      'Criado no seu SimpleFIN Bridge (ex.: bridge.simplefin.org) para este aplicativo; pode ser usado apenas uma vez';

  @override
  String get skipFromTotals => 'Excluir dos totais';

  @override
  String get skipTooltip => 'Pular etapa(s)';

  @override
  String get sortTooltip => 'Ordenar itens';

  @override
  String get sortingAmountAsc => 'Valor ascendente';

  @override
  String get sortingAmountDesc => 'Valor descendente';

  @override
  String get sortingCreatedAtAsc => 'Criado em ordem crescente';

  @override
  String get sortingCreatedAtDesc => 'Criado em ordem decrescente';

  @override
  String get sortingTitleAsc => 'Título em ordem crescente';

  @override
  String get sortingTitleDesc => 'Título em ordem decrescente';

  @override
  String get sortingUpdatedAtAsc => 'Atualizado em ordem crescente';

  @override
  String get sortingUpdatedAtDesc => 'Atualizado em ordem decrescente';

  @override
  String get spent => 'gasto';

  @override
  String get splitCancelTooltip => 'Cancelar divisão por mês';

  @override
  String get splitHeadline => 'Dividir a conta';

  @override
  String get splitTooltip => 'Declarar limites por mês';

  @override
  String get starlingDescription =>
      'Importe saldos e transações de contas Starling Bank com um token de acesso pessoal da sua conta de desenvolvedor gratuita. O acesso é somente leitura: nenhum pagamento é efetuado.';

  @override
  String get starlingHeadline => 'Starling Bank Personal Access (Reino Unido)';

  @override
  String get starlingScopes =>
      'Falta uma permissão no token: crie-o com os escopos \"account:read\", \"balance:read\" e \"transaction:read\"';

  @override
  String get starlingToken => 'Token de acesso pessoal';

  @override
  String get starlingTokenSteps =>
      'Como obter um token de acesso pessoal:\n1. Cadastre-se em developer.starlingbank.com (gratuito)\n2. Abra Personal Access, adicione sua conta Starling e aprove-a no aplicativo Starling\n3. Crie um token com os escopos \"account:read\", \"balance:read\" e \"transaction:read\"\n4. Cole-o abaixo e toque em \"Conectar\"';

  @override
  String get starlingTokenTooltip =>
      'Criado em developer.starlingbank.com em Personal Access; armazenado criptografado';

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
  String get tellerAccessToken => 'Token de acesso';

  @override
  String get tellerAccessTokenTooltip =>
      'Exibido pela página de conexão depois que um banco é vinculado: cole-o aqui se o Fingrom não tiver sido aberto automaticamente';

  @override
  String get tellerAppId => 'ID do aplicativo';

  @override
  String get tellerAppIdTooltip =>
      'Exibido no Teller Dashboard, começa com \"app_\"';

  @override
  String get tellerCertificate => 'Certificado (PEM)';

  @override
  String get tellerCertificateInvalid =>
      'Certificado inválido: é esperado um bloco PEM \"CERTIFICATE\"';

  @override
  String get tellerCertificateTooltip =>
      'Emitido no Teller Dashboard (Certificates); armazenado criptografado. Deixe vazio para manter o certificado armazenado';

  @override
  String get tellerConnectBank => 'Conectar banco';

  @override
  String get tellerConnectPage => 'Página de conexão';

  @override
  String get tellerConnectPageTooltip =>
      'Abre o Teller Connect em um navegador e retorna o token de acesso ao Fingrom';

  @override
  String get tellerDescription =>
      'Importe saldos e transações de bancos e emissores de cartões dos EUA por meio do Teller com seu próprio aplicativo registrado em teller.io (o plano gratuito permite 100 conexões bancárias reais). Acesso somente leitura: nenhum pagamento é realizado.';

  @override
  String get tellerDisconnected =>
      'A conexão com o banco requer sua atenção (ex.: um novo login ou um código de confirmação): conecte o banco novamente';

  @override
  String get tellerEnvironment => 'Ambiente';

  @override
  String get tellerHeadline => 'Teller (US)';

  @override
  String get tellerIncomplete =>
      'Preencha o ID do aplicativo; o certificado e a chave privada são necessários para dados bancários reais';

  @override
  String get tellerKey => 'Chave privada (PEM)';

  @override
  String get tellerKeyInvalid =>
      'Chave privada inválida: é esperado um bloco PEM \"PRIVATE KEY\"';

  @override
  String get tellerKeyTooltip =>
      'Baixada junto com o certificado; armazenada criptografada. Deixe vazio para manter a chave armazenada';

  @override
  String get tellerMissingCertificate =>
      'O Teller rejeitou a solicitação sem um certificado de cliente: envie o certificado e a chave privada ou escolha sandbox';

  @override
  String get tellerSteps =>
      'Como conectar:\n1. Cadastre-se em teller.io e abra o Teller Dashboard\n2. Copie o ID do aplicativo e, em seguida, crie e baixe um certificado com sua chave privada (Certificates)\n3. Preencha-os abaixo e escolha o ambiente (sandbox: dados de teste, entre em um banco como \"username\" com \"password\")\n4. Toque em \"Conectar banco\" e entre no seu banco na página aberta\n5. Selecione a conta e a categoria de orçamento e toque em \"Importar transações\"';

  @override
  String get tellerUpload => 'Enviar arquivo';

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
  String get upDescription =>
      'Importe saldos e transações de contas de gastos e poupança Up com um token de acesso pessoal. As transferências entre contas Up vinculadas (incluindo Round Ups) são importadas como transferências. O acesso é somente leitura: nenhum pagamento é efetuado.';

  @override
  String get upHeadline => 'Up Banking API (Austrália)';

  @override
  String get upToken => 'Token de acesso pessoal';

  @override
  String get upTokenSteps =>
      'Como obter um token de acesso pessoal:\n1. Abra o aplicativo Up e vá em Data sharing → Personal Access Token (ou entre em api.up.com.au)\n2. Crie um token e copie-o (ele começa com \"up:yeah:\"); um novo token substitui o anterior\n3. Cole-o abaixo e toque em \"Conectar\"\n4. Vincule todas as contas Up (incluindo as de poupança) para que as transferências entre elas sejam importadas como transferências';

  @override
  String get upTokenTooltip =>
      'Criado no aplicativo Up ou em api.up.com.au; armazenado criptografado. Apenas o token mais recente é válido';

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
  String get wiseDescription =>
      'Importe saldos e transações de contas multimoeda Wise com um token de API pessoal. As conversões entre saldos vinculados são importadas como transferências. O acesso é somente leitura: nenhum pagamento é efetuado.';

  @override
  String get wiseHeadline => 'Wise API (Global)';

  @override
  String get wiseNoProfiles => 'Não há perfis Wise disponíveis para o token';

  @override
  String get wiseProfile => 'Perfil';

  @override
  String get wiseScaRequired =>
      'A Wise exige uma autenticação forte do cliente: abra o extrato deste saldo no aplicativo Wise e tente novamente';

  @override
  String get wiseToken => 'Token de API pessoal';

  @override
  String get wiseTokenSteps =>
      'Como obter um token de API pessoal:\n1. Entre em wise.com pelo navegador (não é possível criar tokens no aplicativo)\n2. Abra Configurações → Integrações e ferramentas → Tokens de API\n3. Escolha \"Adicionar novo token\", dê um nome (ex.: Fingrom) e selecione o acesso \"Somente leitura\"\n4. Confirme com a verificação em duas etapas e copie o token\n5. Cole-o abaixo e toque em \"Conectar\"';

  @override
  String get wiseTokenTooltip =>
      'Criado na Wise em Configurações → Tokens de API (somente leitura, se disponível); armazenado criptografado';

  @override
  String get zoomState => 'Ampliar / Reduzir o zoom';
}
