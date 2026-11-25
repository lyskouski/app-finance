// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localization.dart';

// ignore_for_file: type=lint

/// The translations for French (`fr`).
class AppLocalizationsFr extends AppLocalizations {
  AppLocalizationsFr([String locale = 'fr']) : super(locale);

  @override
  String get a =>
      'RUN `dart run grinder sort-translations --quiet` FOR ORDERING';

  @override
  String get aboutHeadline => 'À propos';

  @override
  String get account => 'Compte';

  @override
  String get accountFrom => 'Du compte';

  @override
  String get accountHeadline => 'Comptes';

  @override
  String get accountTo => 'Vers le compte';

  @override
  String get accountTooltip => 'Ouvrir un compte';

  @override
  String get accountType => 'Type de compte';

  @override
  String get accountTypeTooltip => 'Choisir le type de compte';

  @override
  String get acknowledgeTooltip => 'Accuser réception';

  @override
  String get activate => 'Activer';

  @override
  String get actualData => 'Données historiques';

  @override
  String get addAccountTooltip => 'Ajouter un compte';

  @override
  String get addBudgetTooltip => 'Ajouter une nouvelle catégorie budgétaire';

  @override
  String get addGoalTooltip => 'Ajouter un nouvel objectif';

  @override
  String get addMainTooltip => 'Ajouter une facture, un revenu ou un transfert';

  @override
  String afterNDays(Object value) {
    return 'après $value jours';
  }

  @override
  String get akahuAppToken => 'Jeton App ID';

  @override
  String get akahuDescription =>
      'Importer les soldes et les transactions des banques néo-zélandaises connectées à Akahu avec votre propre application personnelle gratuite. Akahu actualise les données des banques selon son propre calendrier (quotidien), les dernières transactions peuvent donc apparaître plus tard. L’accès est en lecture seule : aucun paiement n’est effectué.';

  @override
  String get akahuHeadline => 'Akahu Personal App (Nouvelle-Zélande)';

  @override
  String get akahuInactive =>
      'Akahu a perdu l’accès à ce compte : reconnectez-le sur my.akahu.nz/connections';

  @override
  String get akahuIncomplete =>
      'Renseignez le jeton App ID et le jeton d’accès utilisateur';

  @override
  String get akahuRefresh => 'Actualiser les données';

  @override
  String get akahuRefreshed =>
      'Akahu a été invité à récupérer de nouvelles données auprès des banques : relancez l’importation dans quelques minutes (au plus une fois par heure)';

  @override
  String get akahuSteps =>
      'Comment obtenir les jetons :\n1. Inscrivez-vous sur my.akahu.nz et connectez vos banques\n2. Ouvrez la page « Developers », acceptez les conditions pour les développeurs et configurez l’authentification multifacteur\n3. Copiez le jeton App ID et le jeton d’accès utilisateur\n4. Collez-les ci-dessous et appuyez sur « Se connecter »';

  @override
  String get akahuTokenTooltip =>
      'Affiché sur la page « Developers » de my.akahu.nz ; stocké chiffré';

  @override
  String get akahuUserToken => 'Jeton d’accès utilisateur';

  @override
  String get amountFrom => 'Montant de départ';

  @override
  String get amountTo => 'Montant d\'arrivée';

  @override
  String appBuild(Object build) {
    return 'Construire : $build';
  }

  @override
  String get appInitHeadline => 'Initialisation du projet';

  @override
  String get appStartHeadline => 'Configuration initiale';

  @override
  String get appTitle => 'Fingrom';

  @override
  String appVersion(Object version) {
    return 'Version : $version';
  }

  @override
  String get automationHeadline => 'Automatisation';

  @override
  String get automationTypeDays => 'après quelques jours';

  @override
  String get backTooltip => 'Retour';

  @override
  String get balance => 'Solde réel';

  @override
  String get balanceDate => 'Mise à jour de la date du solde';

  @override
  String get balanceDateTooltip =>
      'Les résultats et revenus antérieurs à cette date n\'affecteront pas le solde.';

  @override
  String get balanceTooltip => 'Fixer le solde';

  @override
  String get bankAccount => 'Compte bancaire';

  @override
  String get bill => 'Factures';

  @override
  String get billHeadline => 'Factures';

  @override
  String get billSetTooltip => 'Fixer le montant';

  @override
  String billSum(Object value) {
    return 'Factures : $value';
  }

  @override
  String get billTooltip => 'Ouvrir des factures';

  @override
  String get billTypeTooltip => '[Type] Facture, revenu ou transfert';

  @override
  String get brightnessTheme => 'Thème de luminosité';

  @override
  String get btnAdd => 'Ajouter';

  @override
  String get btnCancel => 'Annuler';

  @override
  String get btnConfirm => 'Confirmer';

  @override
  String get btnMore => 'Plus d\'informations';

  @override
  String get budget => 'Catégorie de budget';

  @override
  String get budgetHeadline => 'Budgets';

  @override
  String get budgetLimit => 'Limite par mois';

  @override
  String get budgetLimitHeadline => 'Ajustements des limites';

  @override
  String get budgetPositive => 'Budget, Gestionnaire de résumé';

  @override
  String get budgetPositiveOff => 'Ignorer les valeurs négatives';

  @override
  String get budgetPositiveOn => 'Inclure les valeurs négatives';

  @override
  String get budgetRelativeLimit => 'Coefficient relatif par mois';

  @override
  String get budgetTooltip => 'Types de budgets ouverts';

  @override
  String get budgetType => 'Intervalle de budgétisation';

  @override
  String get budgetTypeAsIs => 'Illimité';

  @override
  String get budgetTypeFixed => 'Fixe';

  @override
  String get budgetTypeMonth => 'mensuel';

  @override
  String get budgetTypeRelative => 'Relatif';

  @override
  String get budgetTypeWeek => 'hebdomadaire';

  @override
  String get budgetTypeYear => 'annuel';

  @override
  String get cash => 'Argent liquide';

  @override
  String get chartBarRace => 'Barre de course pour les catégories';

  @override
  String get chartForecast => 'Graphique des prévisions';

  @override
  String get chartOHLC => 'Graphique en chandelier (OHLC)';

  @override
  String get chartYtdExpense => 'Dépenses YTD';

  @override
  String get clear => 'Valeur de la goutte';

  @override
  String get closeTooltip => 'Fermer';

  @override
  String get closedAt => 'Terminé à ce jour';

  @override
  String get cmpChart => 'Diagrammes';

  @override
  String get cmpRecent => 'Éléments récents';

  @override
  String get cmpRecentCount => 'Taille de la liste';

  @override
  String get coAuthor => 'auteur';

  @override
  String get coConsult => 'conseillère';

  @override
  String get coDeveloper => 'développeur';

  @override
  String get coNew => 'Rejoindre';

  @override
  String get coPromoter => 'promoteur';

  @override
  String get coTranslator => 'traducteur';

  @override
  String get coef => 'coef.';

  @override
  String get collapse => 'Réduire (rétablir) la section';

  @override
  String get color => 'Couleur';

  @override
  String get colorApp => 'Personnalisée';

  @override
  String get colorBackground => 'Arrière-plan';

  @override
  String get colorDark => 'Foncé';

  @override
  String get colorInversePrimary => 'Primaire inversée';

  @override
  String get colorInverseSurface => 'Surface inversée';

  @override
  String get colorLight => 'Clair';

  @override
  String get colorOnInverseSurface => 'Sur la surface inversée';

  @override
  String get colorOnSecondary => 'Sur le secondaire';

  @override
  String get colorOnSecondaryContainer => 'Sur le conteneur';

  @override
  String get colorPrimary => 'Primaire';

  @override
  String get colorRestore => 'Réinitialiser la palette';

  @override
  String get colorSecondary => 'Secondaire';

  @override
  String get colorSystem => 'Défaut';

  @override
  String get colorTheme => 'Palette';

  @override
  String get colorTooltip => 'Sélectionner une couleur';

  @override
  String get colorType => 'Type de couleur';

  @override
  String get colorUser => 'Personnelle';

  @override
  String columnMap(Object value) {
    return 'Correspondance pour la colonne \'$value\'';
  }

  @override
  String columnMapTooltip(Object value) {
    return '\'$value\' - Choisir le mappage de la colonne';
  }

  @override
  String get completeGoalTooltip => 'Terminer l\'objectif';

  @override
  String get confirmHeader => 'Confirmer l\'action';

  @override
  String get confirmTooltip =>
      'Êtes-vous sûr de vous ? Cette action ne peut pas être annulée.';

  @override
  String get contributors => 'Adhérents';

  @override
  String get conversion => 'Conversion';

  @override
  String conversionMessage(Object currency) {
    return 'Pris en $currency';
  }

  @override
  String get copiedToClipboard => 'Copié dans le presse-papiers';

  @override
  String get createAccountHeader => 'Créer un nouveau compte';

  @override
  String get createAccountTooltip => 'Créer un nouveau compte';

  @override
  String get createBillHeader => 'Créer une nouvelle transaction';

  @override
  String get createBillTooltip => 'Ajouter une nouvelle facture';

  @override
  String get createBudgetHeader => 'Nouvelle catégorie budgétaire';

  @override
  String get createBudgetTooltip => 'Créer une nouvelle catégorie budgétaire';

  @override
  String get createGoalHeader => 'Créer un objectif';

  @override
  String get createGoalTooltip => 'Ajouter un nouvel objectif';

  @override
  String get createIncomeTooltip => 'Ajouter un nouveau revenu';

  @override
  String get createPaymentTooltip => 'Ajouter un nouveau paiement';

  @override
  String get createTransferTooltip => 'Créer Transfert';

  @override
  String get credit => 'Crédit';

  @override
  String get creditCard => 'Carte de crédit';

  @override
  String get currency => 'Devise';

  @override
  String get currencyAddHeadline => 'Change de devises';

  @override
  String get currencyAddTooltip => 'Ajouter le taux de change';

  @override
  String get currencyDefault => 'Devise par défaut';

  @override
  String get currencyDistribution => 'Distribution';

  @override
  String currencyExchange(Object from, Object to) {
    return 'Échange de devises : $from -> $to';
  }

  @override
  String get currencyHeadline => 'Devises';

  @override
  String currencyIn(Object value) {
    return 'En $value';
  }

  @override
  String get currencyShort => 'mon.';

  @override
  String get currencyTooltip => 'Type de devise (code)';

  @override
  String get currencyUpdateTooltip => 'Mise à jour du taux de change';

  @override
  String get currentDate => 'Pointeur de la date actuelle';

  @override
  String get customAddTooltip => 'Ajouter un widget';

  @override
  String get customDeleteTooltip => 'Supprimer la personnalisation';

  @override
  String get customSaveTooltip => 'Sauvegarder la personnalisation';

  @override
  String get customizeTooltip => 'Personnaliser la page';

  @override
  String get darkMode => 'Sombre';

  @override
  String get dateFormat => 'Format de la date';

  @override
  String get dateRange => 'Plage de dates';

  @override
  String get dateTooltip => 'Sélectionner la date';

  @override
  String get dayMonday => 'Lundi';

  @override
  String get daySaturday => 'Samedi';

  @override
  String get dayStartOfMonth => 'Début du mois';

  @override
  String get dayStartOfWeek => 'Début de la semaine';

  @override
  String get daySunday => 'Dimanche';

  @override
  String get deactivateAction => 'Désactiver la protection par mot de passe';

  @override
  String get debitCard => 'Carte de débit';

  @override
  String def(Object value) {
    return 'Valeur par défaut pour \'$value\'';
  }

  @override
  String get deleteAccountTooltip => 'Désactiver le compte';

  @override
  String get deleteBillTooltip => 'Supprimer la facture';

  @override
  String get deleteBudgetTooltip => 'Désactiver la catégorie budgétaire';

  @override
  String get deleteGoalTooltip => 'Supprimer l\'objectif';

  @override
  String get deleteInvoiceTooltip => 'Supprimer la facture';

  @override
  String get deletePaymentTooltip => 'Supprimer un paiement';

  @override
  String get deleteTooltip => 'Supprimer';

  @override
  String get deleteTransferTooltip => 'Supprimer Transfert';

  @override
  String get deposit => 'Dépôt';

  @override
  String get description => 'Description de la dépense';

  @override
  String get descriptionTooltip => 'Définir les détails des dépenses';

  @override
  String get design => 'Mode de conception (spécifique à la culture)';

  @override
  String get designAsiaGeneral => 'Asie - Général';

  @override
  String get designGermany => 'Allemagne';

  @override
  String get designGlobal => 'Monde';

  @override
  String get designRtlGeneral => 'Lettrage de droite à gauche';

  @override
  String get details => 'Détails';

  @override
  String get detailsTooltip => '****2345 - 4 derniers chiffres du numéro';

  @override
  String get dtAm => 'am';

  @override
  String get dtAmPm => 'heure en am/pm (0~11)';

  @override
  String get dtDay => 'jour du mois';

  @override
  String get dtEscape => 'échappatoire pour le texte';

  @override
  String get dtHalfHour => 'heure en am/pm (1~12)';

  @override
  String get dtHour => 'heure du jour (0~23)';

  @override
  String get dtMinute => 'minute en heure';

  @override
  String get dtMonth => 'le mois dans l\'année';

  @override
  String get dtNamedDay => 'jour de la semaine';

  @override
  String get dtPm => 'pm';

  @override
  String get dtQuote => 'guillemet simple';

  @override
  String get dtSecond => 'seconde en minute';

  @override
  String get dtYear => 'année';

  @override
  String get editAccountHeader => 'Mettre à jour le compte';

  @override
  String get editAccountTooltip => 'Modifier le compte';

  @override
  String get editBillHeader => 'Mise à jour de la facture';

  @override
  String get editBillTooltip => 'Modifier la facture';

  @override
  String get editBudgetHeader => 'Mise à jour de la catégorie budgétaire';

  @override
  String get editBudgetTooltip => 'Modifier la catégorie budgétaire';

  @override
  String get editGoalHeader => 'Mise à jour de l\'objectif';

  @override
  String get editGoalTooltip => 'Modifier l\'objectif';

  @override
  String get editInvoiceTooltip => 'Modifier la facture';

  @override
  String get editPaymentTooltip => 'Modifier le paiement';

  @override
  String get editTooltip => 'Modifier';

  @override
  String get editTransferTooltip => 'Modifier le transfert';

  @override
  String get enableBankingAppId => 'ID de l\'application';

  @override
  String get enableBankingBank => 'Banque';

  @override
  String get enableBankingCode =>
      'Adresse de la page ouverte après l\'autorisation';

  @override
  String get enableBankingCodeTooltip =>
      'Confirmez l\'accès auprès de la banque, puis copiez l\'adresse depuis le navigateur et collez-la ici';

  @override
  String get enableBankingCountry => 'Pays (code ISO, p. ex. FR)';

  @override
  String get enableBankingDescription =>
      'Importez les soldes et les opérations des banques européennes via l\'API Enable Banking (DSP2) avec votre propre application enregistrée sur enablebanking.com. Accès en lecture seule : aucun paiement n\'est effectué.';

  @override
  String get enableBankingHeadline => 'Enable Banking (EU)';

  @override
  String get enableBankingIncomplete =>
      'Renseignez l\'ID de l\'application, la clé privée, l\'URL de redirection et le pays';

  @override
  String get enableBankingKey => 'Clé privée (PEM)';

  @override
  String get enableBankingKeyInvalid =>
      'Clé privée invalide : un bloc PEM « PRIVATE KEY » est attendu';

  @override
  String get enableBankingKeyNotRsa =>
      'Clé privée invalide : une clé RSA est attendue';

  @override
  String get enableBankingKeyTooltip =>
      'Créée avec l\'application dans le Enable Banking Control Panel ; stockée chiffrée. Laissez vide pour conserver la clé enregistrée';

  @override
  String get enableBankingLoadBanks => 'Charger les banques';

  @override
  String get enableBankingNoAuthPage =>
      'Enable Banking n\'a renvoyé aucune page d\'autorisation';

  @override
  String get enableBankingNoCode =>
      'Aucun code d\'autorisation trouvé dans l\'adresse';

  @override
  String get enableBankingRedirect => 'URL de redirection';

  @override
  String get enableBankingRedirectTooltip =>
      'Enregistrée pour l\'application ; la banque y revient après l\'autorisation';

  @override
  String get enableBankingStateMismatch =>
      'L\'adresse appartient à une autre autorisation, reconnectez-vous';

  @override
  String get encryptionMode => 'Cryptage des données';

  @override
  String error(Object value) {
    return 'Erreur : $value';
  }

  @override
  String get errorExpired => 'Carte expirée';

  @override
  String get errorNegative =>
      'Ne peut être négatif ! Veuillez corriger l\'erreur';

  @override
  String get example => 'Exemple';

  @override
  String get expand => 'Développer la section';

  @override
  String get expense => 'Montant des dépenses';

  @override
  String get expenseDateTime => 'facturés à';

  @override
  String get expenseHeadline => 'Dépenses';

  @override
  String get expenseTransfer => 'Montant du transfert';

  @override
  String exportFile(Object value) {
    return 'Exporter comme fichier .$value';
  }

  @override
  String get failData => 'Montant de la déduction';

  @override
  String get finTsApproved => 'Approuvé dans l\'application bancaire';

  @override
  String get finTsBankCode => 'Code bancaire (BLZ)';

  @override
  String get finTsCustomerId =>
      'Identifiant client (s\'il diffère de l\'identifiant utilisateur)';

  @override
  String get finTsDescription =>
      'Importez les soldes et les opérations des banques prenant en charge FinTS 4.1 (PIN/TAN). Accès en lecture seule : aucun paiement n\'est effectué.';

  @override
  String get finTsHeadline => 'Financial Transaction Services (FinTS 4.1)';

  @override
  String get finTsIncomplete =>
      'Renseignez l\'URL du serveur, le code bancaire, l\'identifiant utilisateur et le numéro d\'enregistrement du produit';

  @override
  String finTsLoginChanged(Object value) {
    return 'La banque a modifié les données de connexion, mettez à jour l\'identifiant utilisateur ou client : $value';
  }

  @override
  String finTsLoginRefused(Object value) {
    return 'La banque a refusé la connexion précédente : $value. Réessayer avec le PIN saisi ?';
  }

  @override
  String get finTsPin => 'PIN';

  @override
  String get finTsPinHint =>
      'Utilisé uniquement pour cette session et jamais enregistré';

  @override
  String get finTsProductId => 'Numéro d\'enregistrement du produit';

  @override
  String get finTsProductIdTooltip =>
      'Attribué par la Deutsche Kreditwirtschaft à l\'éditeur de l\'application';

  @override
  String get finTsTan => 'TAN';

  @override
  String get finTsTanHeadline => 'Authentification de l\'opération (TAN)';

  @override
  String get finTsTanMedium => 'Choisir le support TAN';

  @override
  String get finTsTanMethod => 'Choisir la méthode TAN';

  @override
  String get finTsUrl => 'URL du serveur FinTS de la banque';

  @override
  String get finTsUserId => 'Identifiant utilisateur (login)';

  @override
  String get finTsVersion => 'Version du protocole';

  @override
  String get finTsWebUnsupported =>
      'Les serveurs bancaires n\'autorisent pas l\'accès depuis un navigateur. Utilisez l\'application de bureau ou mobile.';

  @override
  String get flowTypeInvoice => 'Facture';

  @override
  String get flowTypeTooltip => 'Type de montant : Facture';

  @override
  String get forecastData => 'Prévision';

  @override
  String get from => 'from';

  @override
  String get goNextTooltip => 'Aller au suivant';

  @override
  String get goalHeadline => 'Objectifs';

  @override
  String goalProfit(Object value) {
    return 'Objectif : $value';
  }

  @override
  String get goalProfitTooltip => 'Profit par rapport à l\'objectif';

  @override
  String get goalTooltip => 'Objectifs ouverts';

  @override
  String get hasEncrypted =>
      'Une fois définis, ils ne peuvent pas être modifiés';

  @override
  String get helpTooltip => '[Aide] Afficher la description de cette page';

  @override
  String get homeHeadline => 'Accueil';

  @override
  String get homeTooltip => 'Retour à la page principale';

  @override
  String get hour => 'Heure';

  @override
  String get icon => 'Icône';

  @override
  String get iconTooltip => 'Sélectionner l\'icône';

  @override
  String get ignoreTooltip => 'Ignorer';

  @override
  String get importHeadline => 'Importation / Exportation';

  @override
  String get income => 'Montant du revenu';

  @override
  String get incomeHeadline => 'Revenu';

  @override
  String get incomeHealth => 'Radar de santé du revenu';

  @override
  String get incomeTooltip => 'Définir les détails du revenu';

  @override
  String get integrationAccessDenied =>
      'L\'accès a été révoqué ou les identifiants sont incorrects';

  @override
  String get integrationConnect => 'Se connecter';

  @override
  String get integrationDateFrom => 'Importer les opérations depuis';

  @override
  String get integrationDefaultBudgetCategory =>
      'Catégorie de budget par défaut';

  @override
  String get integrationDisconnect => 'Se déconnecter';

  @override
  String get integrationForget => 'Oublier l\'accès';

  @override
  String get integrationHeadline => 'Intégrations';

  @override
  String integrationHttpError(Object value) {
    return 'Le service a répondu par une erreur (HTTP $value)';
  }

  @override
  String get integrationHttpsRequired =>
      'Seules les adresses sécurisées (HTTPS) sont autorisées';

  @override
  String get integrationImport => 'Importer les opérations';

  @override
  String integrationImported(Object added, Object pending, Object skipped) {
    return 'Importées : $added, ignorées car déjà présentes : $skipped, en attente (non importées) : $pending';
  }

  @override
  String integrationInvalidAmount(Object value) {
    return 'Montant invalide : $value';
  }

  @override
  String get integrationNoAccounts => 'La banque n\'a fourni aucun compte';

  @override
  String get integrationPaymentRequired =>
      'Le service exige un paiement pour l\'accès';

  @override
  String get integrationSelectTarget =>
      'Sélectionnez le compte et la catégorie de budget pour l\'importation';

  @override
  String integrationServiceError(Object value) {
    return 'Message du service : $value';
  }

  @override
  String get integrationUnexpectedResponse => 'Réponse inattendue du service';

  @override
  String get investecApiKey => 'Clé d’API';

  @override
  String get investecClientId => 'ID client';

  @override
  String get investecCredentialsTooltip =>
      'Créé dans Investec Online sous Investec Developer → API keys ; stocké chiffré';

  @override
  String get investecDescription =>
      'Importer les soldes et les transactions des comptes Investec Private Banking (Afrique du Sud) via la Programmable Banking API avec vos propres clés d’API. L’accès est en lecture seule : aucun paiement n’est effectué.';

  @override
  String get investecHeadline =>
      'Investec Programmable Banking (Afrique du Sud)';

  @override
  String get investecIncomplete =>
      'Renseignez l’ID client, le secret et la clé d’API';

  @override
  String get investecSandbox => 'Sandbox (données de test)';

  @override
  String get investecSecret => 'Secret';

  @override
  String get investecSteps =>
      'Comment obtenir les clés d’API :\n1. Connectez-vous à Investec Online et inscrivez-vous à Investec Developer (Programmable Banking)\n2. Ouvrez API keys et créez une clé avec accès aux comptes et aux transactions\n3. Confirmez-la avec la vérification en deux étapes et copiez l’ID client, le secret et la clé d’API\n4. Collez-les ci-dessous et appuyez sur « Se connecter »';

  @override
  String get invoiceHeadline => 'Factures';

  @override
  String invoiceSum(Object value) {
    return 'Factures : $value';
  }

  @override
  String get isCleaned => 'Supprimer les données existantes';

  @override
  String get isCreated => 'Déjà créé, suivez les étapes suivantes !';

  @override
  String get isEncrypted => 'Le fichier est crypté (par défaut)';

  @override
  String get isRequired => 'requis';

  @override
  String get language => 'Langue';

  @override
  String get left => 'gauche';

  @override
  String get lightMode => 'Léger';

  @override
  String get link => 'Localisateur de ressources uniformes (URL)';

  @override
  String get managerHeadline => 'Gestionnaire';

  @override
  String get meaning => 'Signification';

  @override
  String get metricsHeadline => 'métrique';

  @override
  String get metricsTooltip => 'Métriques';

  @override
  String get milestones => 'Jalons';

  @override
  String get minute => 'Minute';

  @override
  String get missingContent =>
      'Le fichier ne peut pas être traité (soit annulé)';

  @override
  String get monobankCreateAccount => 'Créer un compte';

  @override
  String get monobankDescription =>
      'Import des soldes et des opérations des cartes et des tirelires monobank avec un jeton personnel. monobank autorise une requête par minute : l’import d’une longue période prend plusieurs minutes. Accès en lecture seule : aucun paiement n’est effectué.';

  @override
  String get monobankHeadline => 'monobank Personal API (Ukraine)';

  @override
  String get monobankJar => 'Tirelire';

  @override
  String monobankProgress(Object done, Object total) {
    return 'Demande des relevés : $done sur $total';
  }

  @override
  String monobankRateLimit(Object value) {
    return 'monobank autorise une requête par minute : la prochaine dans $value s';
  }

  @override
  String get monobankToken => 'Jeton personnel';

  @override
  String get monobankTokenSteps =>
      'Comment obtenir un jeton personnel :\n1. Ouvrez api.monobank.ua dans un navigateur\n2. Scannez le code QR avec l’application monobank et confirmez l’accès\n3. Copiez le jeton depuis la page\n4. Collez-le ci-dessous et appuyez sur « Se connecter »\n5. Associez chaque carte ou tirelire à un compte (ou créez-en un) et importez';

  @override
  String get monobankTokenTooltip =>
      'Délivré sur api.monobank.ua après le scan du code QR dans l’application monobank ; stocké chiffré';

  @override
  String get monzoApprove =>
      'Approuvez l’accès dans l’application Monzo, puis appuyez de nouveau sur « Se connecter »';

  @override
  String get monzoClientId => 'ID client';

  @override
  String get monzoClientSecret => 'Secret client';

  @override
  String get monzoClientSecretTooltip =>
      'Affiché pour le client OAuth sur developers.monzo.com ; stocké chiffré. Laissez vide pour conserver le secret enregistré';

  @override
  String get monzoCode => 'Adresse de la page ouverte après la connexion';

  @override
  String get monzoCodeTooltip =>
      'Si Fingrom ne s’est pas ouvert automatiquement, copiez l’adresse depuis le navigateur et collez-la ici';

  @override
  String get monzoDescription =>
      'Importer les soldes et les transactions des comptes Monzo avec votre propre client OAuth enregistré sur developers.monzo.com (pour un usage personnel uniquement). L’accès est en lecture seule : aucun paiement n’est effectué.';

  @override
  String get monzoExpired => 'L’accès à Monzo a expiré : reconnectez-vous';

  @override
  String monzoFullHistory(Object value) {
    return 'L’historique complet est disponible jusqu’à $value : choisissez une date antérieure et importez maintenant. Ensuite, Monzo ne fournit que les 90 derniers jours';
  }

  @override
  String get monzoHeadline => 'Monzo Developer API (Royaume-Uni)';

  @override
  String monzoHistoryLimited(Object value) {
    return 'Monzo ne fournit que les 90 derniers jours : les opérations sont importées depuis le $value';
  }

  @override
  String get monzoIncomplete =>
      'Renseignez l’ID client, le secret client et l’URL de redirection';

  @override
  String get monzoRedirect => 'URL de redirection';

  @override
  String get monzoRedirectTooltip =>
      'Définissez exactement cette adresse pour le client OAuth ; Monzo y revient après la connexion';

  @override
  String get monzoSteps =>
      'Comment se connecter :\n1. Connectez-vous à developers.monzo.com avec l’adresse e-mail de votre compte Monzo\n2. Ouvrez Clients → New OAuth Client, choisissez « Confidential » et définissez l’URL de redirection affichée ci-dessous\n3. Copiez l’ID client et le secret client, collez-les ci-dessous et appuyez sur « Se connecter »\n4. Ouvrez le lien envoyé par e-mail, approuvez l’accès dans l’application Monzo et appuyez de nouveau sur « Se connecter »\n5. Importez tout de suite : l’historique complet n’est disponible que 5 minutes après l’approbation, ensuite seulement les 90 derniers jours';

  @override
  String get navigationTooltip => 'Ouvrir le menu principal';

  @override
  String netProfit(Object value) {
    return 'Profit : $value';
  }

  @override
  String get noChartData =>
      'Données manquantes (ou insuffisantes) pour être affichées';

  @override
  String get notificationAccessSettings => 'Accès aux notifications';

  @override
  String get notificationAccessSteps =>
      'Comment accorder l\'accès :\n1. Appuyez sur \"Accorder l\'accès\" pour ouvrir les paramètres du système\n2. Autorisez Fingrom à lire les notifications\n3. Si Android signale un paramètre restreint : ouvrez les infos de l\'application Fingrom → ⋮ → \"Autoriser les paramètres restreints\", puis réessayez\n4. Revenez dans Fingrom et sélectionnez les applications dont les notifications doivent être lues';

  @override
  String get notificationAccounts => 'Mots-clés des comptes';

  @override
  String get notificationAccountsTooltip =>
      'Mots identifiant le compte dans une notification (derniers chiffres de la carte, nom du portefeuille) : saisissez un mot et appuyez sur Entrée pour l\'ajouter. Sinon, le compte par défaut de l\'application est utilisé';

  @override
  String get notificationApps =>
      'Applications dont les notifications sont lues';

  @override
  String notificationAutoImported(Object value) {
    return 'Ajoutées depuis les notifications : $value';
  }

  @override
  String get notificationAutoTooltip =>
      'Les notifications reconnues sont ajoutées sans confirmation : immédiatement si Fingrom est ouvert, sinon au prochain démarrage. Les non reconnues attendent une vérification';

  @override
  String get notificationBalance => 'Mots-clés de solde';

  @override
  String get notificationBalanceTooltip =>
      'Mots précédant un montant à ignorer (solde, plafond) : saisissez un mot et appuyez sur Entrée pour l\'ajouter';

  @override
  String notificationCaptured(Object value) {
    return 'Notifications capturées : $value';
  }

  @override
  String get notificationClear => 'Effacer les capturées';

  @override
  String get notificationCurrencyTooltip =>
      'Les montants sans devise (par ex. Débit 20,00) sont pris dans cette devise';

  @override
  String get notificationDefaultAccount => 'Compte par défaut';

  @override
  String get notificationDescription =>
      'Créez des opérations à partir des notifications des applications bancaires et de paiement de cet appareil. Seules les notifications des applications sélectionnées sont lues, et elles restent sur l\'appareil jusqu\'à leur importation. Le montant et la devise sont reconnus automatiquement.';

  @override
  String get notificationGrant => 'Accorder l\'accès';

  @override
  String get notificationIncome => 'Mots-clés de revenu';

  @override
  String get notificationIncomeTooltip =>
      'Mots indiquant qu\'une notification est un revenu : saisissez un mot et appuyez sur Entrée pour l\'ajouter';

  @override
  String get notificationMerchant => 'Libellés du commerçant';

  @override
  String get notificationMerchantTooltip =>
      'Mots suivis de deux-points et d\'un commerçant (Lieu : Magasin) : saisissez un mot et appuyez sur Entrée pour l\'ajouter';

  @override
  String get notificationNoApps =>
      'Aucune notification reçue pour l\'instant : les applications apparaissent ici après avoir publié une notification';

  @override
  String get notificationUnparsed => 'Non reconnu';

  @override
  String get notifyHeadline => 'Analyseur de notifications';

  @override
  String get ok => 'OK';

  @override
  String get orderPin => 'Ordre de priorité';

  @override
  String get orderUnpin => 'Ordre généralisé';

  @override
  String get outputFile => 'Destination du fichier';

  @override
  String get parseFile => 'Analyser le fichier';

  @override
  String get password => 'Mot de passe';

  @override
  String get path => 'Nom du fichier (à enregistrer ou à charger)';

  @override
  String get paymentType => 'Intervalle de paiement';

  @override
  String get paymentsHeadline => 'Paiements récurrents';

  @override
  String get pearDisabled => '-- désactivé --';

  @override
  String get pearLoading => 'En cours...';

  @override
  String get peerAccept => 'accepter';

  @override
  String get peerAction => 'Action';

  @override
  String get peerClosed => 'terminé';

  @override
  String get peerConnect => 'Connecter l\'appareil';

  @override
  String get peerConnectBtn => 'connecter';

  @override
  String get peerDelete => 'supprimer';

  @override
  String get peerDevice => 'Appareils connectés';

  @override
  String get peerId => 'Votre identificateur d\'appareil pour la connexion';

  @override
  String get peerOffline => 'hors ligne';

  @override
  String get peerOnline => 'connecté';

  @override
  String get peerOtherId => 'Identifiant de l\'appareil pour la connexion';

  @override
  String get peerPending => 'en attente';

  @override
  String get peerPing => 'ping';

  @override
  String get peerSent => 'Les données sont transférées aux appareils connectés';

  @override
  String get peerStatus => 'État de la connexion';

  @override
  String get peerSync => 'Transférer les données';

  @override
  String pickFile(Object value) {
    return 'Choisir le fichier .$value';
  }

  @override
  String pongStatus(Object uuid) {
    return 'Demande reçue de $uuid';
  }

  @override
  String get privatBankAdd => 'Ajouter un compte';

  @override
  String get privatBankDescription =>
      'Importer les soldes et les transactions des comptes professionnels (entrepreneurs individuels et sociétés) de Privat24 for Business avec un jeton Autoclient. Les comptes personnels ne sont pas pris en charge par l\'API. L\'accès est en lecture seule : aucun paiement n\'est effectué.';

  @override
  String get privatBankHeadline => 'PrivatBank Autoclient (Ukraine)';

  @override
  String get privatBankIban => 'IBAN du compte';

  @override
  String get privatBankIbanInvalid =>
      'Saisissez un IBAN ukrainien : UA suivi de 27 chiffres';

  @override
  String get privatBankIbanTooltip =>
      'L\'API ne fournit pas de liste de comptes : ajoutez les IBAN des comptes un par un';

  @override
  String privatBankNotReady(Object value) {
    return 'PrivatBank prépare les relevés (phase $value) : réessayez dans quelques minutes';
  }

  @override
  String get privatBankRemove => 'Supprimer le compte';

  @override
  String get privatBankToken => 'Jeton Autoclient';

  @override
  String get privatBankTokenSteps =>
      'Comment obtenir un jeton Autoclient :\n1. Connectez-vous à Privat24 for Business\n2. Ouvrez Intégration (Autoclient)\n3. Activez-la et copiez le jeton\n4. Collez-le ci-dessous et appuyez sur « Se connecter »\n5. Ajoutez les IBAN des comptes à importer';

  @override
  String get privatBankTokenTooltip =>
      'Délivré dans Privat24 for Business sous Intégration (Autoclient) ; stocké chiffré';

  @override
  String get processIsFinished => 'Terminé !';

  @override
  String progress(Object value) {
    return 'Progression : $value%';
  }

  @override
  String get raiseData => 'Montant ajouté';

  @override
  String get recoveryHeadline => 'Récupération';

  @override
  String get recoveryTooltip => 'Récupérer de';

  @override
  String get releases => 'Rejets';

  @override
  String get reset => 'réinitialisation';

  @override
  String get returnBack => 'Retourner';

  @override
  String get roadmap => 'Feuille de route';

  @override
  String get saveNotification => 'Changements sauvegardés !';

  @override
  String get saveSettingsTooltip => 'Sauvegarder';

  @override
  String get saveTooltip => 'Enregistrer dans';

  @override
  String search(Object value) {
    return 'Afficher par le motif \'$value\'.';
  }

  @override
  String get searchTooltip => 'Recherche';

  @override
  String get secureBioNotMatch =>
      'Échec de l\'authentification ! Veuillez réessayer';

  @override
  String get secureBioPromptReason =>
      'Veuillez vous authentifier pour continuer';

  @override
  String get secureBioPromptTitle => 'Authentification biométrique';

  @override
  String get secureOtpCode => 'Code de mot de passe à usage unique';

  @override
  String get secureOtpCodeInvalid =>
      'Code invalide ! Veuillez générer un nouveau code et le saisir';

  @override
  String get secureOtpDeactivated =>
      'La protection par mot de passe est désactivée';

  @override
  String get securePassword => 'Mot de passe (Phrase de récupération)';

  @override
  String get securePasswordEmpty => 'Le mot de passe ne peut pas être vide !';

  @override
  String get securePasswordNotMatch =>
      'Les mots de passe ne correspondent pas !';

  @override
  String get securePasswordRepeat => 'Répéter le mot de passe';

  @override
  String get securityHeadline => 'Sécurité';

  @override
  String get settingsBaseHeadline => 'Principes de base';

  @override
  String get settingsHeadline => 'Paramètres';

  @override
  String get settingsSaved => 'Paramètres enregistrés !';

  @override
  String get simpleFinDescription =>
      'Importez les soldes et les opérations des banques et émetteurs de cartes américains via un SimpleFIN Bridge. Accès en lecture seule : aucun paiement n\'est effectué.';

  @override
  String get simpleFinHeadline => 'SimpleFIN Bridge (US)';

  @override
  String get simpleFinNoCredentials =>
      'Le SimpleFIN Bridge a renvoyé une adresse d\'accès sans identifiants';

  @override
  String get simpleFinToken => 'Jeton de configuration SimpleFIN';

  @override
  String get simpleFinTokenClaimed =>
      'Le jeton de configuration n\'existe pas ou a déjà été utilisé';

  @override
  String get simpleFinTokenInvalid =>
      'Jeton de configuration SimpleFIN invalide';

  @override
  String get simpleFinTokenTooltip =>
      'Créé dans votre SimpleFIN Bridge (p. ex. bridge.simplefin.org) pour cette application ; utilisable une seule fois';

  @override
  String get skipFromTotals => 'Exclure des totaux';

  @override
  String get skipTooltip => 'Sauter étape(s)';

  @override
  String get sortTooltip => 'Trier les éléments';

  @override
  String get sortingAmountAsc => 'Montant croissant';

  @override
  String get sortingAmountDesc => 'Montant décroissant';

  @override
  String get sortingCreatedAtAsc => 'Créé le croissant';

  @override
  String get sortingCreatedAtDesc => 'Créé le décroissant';

  @override
  String get sortingTitleAsc => 'Titre croissant';

  @override
  String get sortingTitleDesc => 'Titre décroissant';

  @override
  String get sortingUpdatedAtAsc => 'Mis à jour le croissant';

  @override
  String get sortingUpdatedAtDesc => 'Mis à jour le décroissant';

  @override
  String get spent => 'dépensé';

  @override
  String get splitCancelTooltip => 'Annuler le fractionnement par mois';

  @override
  String get splitHeadline => 'Partager la facture';

  @override
  String get splitTooltip => 'Déclarer des limites par mois';

  @override
  String get starlingDescription =>
      'Importer les soldes et les transactions des comptes Starling Bank avec un jeton d’accès personnel de votre compte développeur gratuit. L’accès est en lecture seule : aucun paiement n’est effectué.';

  @override
  String get starlingHeadline => 'Starling Bank Personal Access (Royaume-Uni)';

  @override
  String get starlingScopes =>
      'Il manque une autorisation au jeton : créez-le avec les portées \"account:read\", \"balance:read\" et \"transaction:read\"';

  @override
  String get starlingToken => 'Jeton d’accès personnel';

  @override
  String get starlingTokenSteps =>
      'Comment obtenir un jeton d’accès personnel :\n1. Inscrivez-vous sur developer.starlingbank.com (gratuit)\n2. Ouvrez Personal Access, ajoutez votre compte Starling et approuvez-le dans l’application Starling\n3. Créez un jeton avec les portées \"account:read\", \"balance:read\" et \"transaction:read\"\n4. Collez-le ci-dessous et appuyez sur « Se connecter »';

  @override
  String get starlingTokenTooltip =>
      'Créé sur developer.starlingbank.com sous Personal Access ; stocké chiffré';

  @override
  String get subscription =>
      'Comme il s\'agit d\'un projet open-source, l\'abonnement ne débloquera pas de fonctionnalités supplémentaires. Cependant, il s\'agit d\'un investissement dans l\'évolution et l\'amélioration continues de l\'application, et dans la préservation de sa disponibilité.';

  @override
  String get subscriptionCoffee => 'Acheter un café';

  @override
  String get subscriptionDinner => 'Offrir un dîner';

  @override
  String get subscriptionDonorbox => 'S\'abonner via Donorbox';

  @override
  String get subscriptionGithub => 'S\'abonner via GitHub';

  @override
  String get subscriptionHeadline => 'Parrainage';

  @override
  String get subscriptionInactive => 'Service d\'achat indisponible';

  @override
  String get subscriptionPatreon => 'S\'abonner via Patreon';

  @override
  String get subscriptionPaypal => 'Acheter un café (PayPal)';

  @override
  String get subscriptionTiny => 'Offrir une pièce de monnaie chanceuse';

  @override
  String get subscriptionTooltip => 'Soutien (parrainage)';

  @override
  String get success => 'Réussi';

  @override
  String get summary => 'Résumé';

  @override
  String get symbol => 'Symbole';

  @override
  String get syncHeadline => 'Synchroniser les appareils';

  @override
  String get systemMode => 'Système';

  @override
  String get tapToOpen => 'Tapez pour ouvrir';

  @override
  String get targetAmount => 'Montant cible';

  @override
  String get tellerAccessToken => 'Jeton d\'accès';

  @override
  String get tellerAccessTokenTooltip =>
      'Affiché par la page de connexion après la liaison d\'une banque : collez-le ici si Fingrom ne s\'est pas ouvert automatiquement';

  @override
  String get tellerAppId => 'ID de l\'application';

  @override
  String get tellerAppIdTooltip =>
      'Affiché dans le Teller Dashboard, commence par « app_ »';

  @override
  String get tellerCertificate => 'Certificat (PEM)';

  @override
  String get tellerCertificateInvalid =>
      'Certificat invalide : un bloc PEM « CERTIFICATE » est attendu';

  @override
  String get tellerCertificateTooltip =>
      'Émis dans le Teller Dashboard (Certificates) ; stocké chiffré. Laissez vide pour conserver le certificat enregistré';

  @override
  String get tellerConnectBank => 'Connecter la banque';

  @override
  String get tellerConnectPage => 'Page de connexion';

  @override
  String get tellerConnectPageTooltip =>
      'Ouvre Teller Connect dans un navigateur et renvoie le jeton d\'accès à Fingrom';

  @override
  String get tellerDescription =>
      'Importez les soldes et les opérations des banques et émetteurs de cartes américains via Teller avec votre propre application enregistrée sur teller.io (l\'offre gratuite autorise 100 connexions bancaires réelles). Accès en lecture seule : aucun paiement n\'est effectué.';

  @override
  String get tellerDisconnected =>
      'La connexion bancaire requiert votre attention (p. ex. une nouvelle identification ou un code de confirmation) : connectez de nouveau la banque';

  @override
  String get tellerEnvironment => 'Environnement';

  @override
  String get tellerHeadline => 'Teller (US)';

  @override
  String get tellerIncomplete =>
      'Renseignez l\'ID de l\'application ; le certificat et la clé privée sont requis pour les données bancaires réelles';

  @override
  String get tellerKey => 'Clé privée (PEM)';

  @override
  String get tellerKeyInvalid =>
      'Clé privée invalide : un bloc PEM « PRIVATE KEY » est attendu';

  @override
  String get tellerKeyTooltip =>
      'Téléchargée avec le certificat ; stockée chiffrée. Laissez vide pour conserver la clé enregistrée';

  @override
  String get tellerMissingCertificate =>
      'Teller a refusé la requête sans certificat client : importez le certificat et la clé privée, ou choisissez sandbox';

  @override
  String get tellerSteps =>
      'Comment se connecter :\n1. Inscrivez-vous sur teller.io et ouvrez le Teller Dashboard\n2. Copiez l\'ID de l\'application, puis créez et téléchargez un certificat avec sa clé privée (Certificates)\n3. Renseignez-les ci-dessous et choisissez l\'environnement (sandbox : données de test, connectez-vous à une banque en tant que \"username\" avec \"password\")\n4. Appuyez sur « Connecter la banque » et connectez-vous à votre banque sur la page ouverte\n5. Sélectionnez le compte et la catégorie de budget, puis appuyez sur « Importer les opérations »';

  @override
  String get tellerUpload => 'Importer un fichier';

  @override
  String get termPrivacy => 'Politique de confidentialité';

  @override
  String get termUse => 'Conditions d\'utilisation';

  @override
  String get title => 'Titre';

  @override
  String get titleAccountTooltip => 'Saisir l\'identifiant du compte';

  @override
  String get titleBudgetTooltip => 'Saisir le nom de la catégorie budgétaire';

  @override
  String get titleGoal => 'Objectif';

  @override
  String get titleGoalTooltip => 'Définir la description de l\'objectif';

  @override
  String get to => 'jusqu\'à';

  @override
  String get total => 'total';

  @override
  String get transactionFile =>
      'Fichier journal des transactions Fingrom (.log)';

  @override
  String get transferHeadline => 'Transfert';

  @override
  String get transferTooltip => 'Définir les détails du transfert';

  @override
  String get transfersHeadline => 'Transferts';

  @override
  String get typeButton => 'Bouton';

  @override
  String get updateAccountTooltip => 'Mise à jour du compte';

  @override
  String get updateBillTooltip => 'Mise à jour de la facture';

  @override
  String get updateBudgetTooltip => 'Mise à jour de la catégorie budgétaire';

  @override
  String get updateGoalTooltip => 'Mise à jour de l\'objectif';

  @override
  String get updatePaymentTooltip => 'Mise à jour du paiement';

  @override
  String get username => 'Nom d\'utilisateur (compte)';

  @override
  String get uuid => 'Identifiant unique de transaction';

  @override
  String get validTillDate => 'Valable jusqu\'à la date';

  @override
  String get webDav => 'Rédaction et version distribuées sur le web (WebDav)';

  @override
  String get wiseDescription =>
      'Importer les soldes et les transactions des comptes multidevises Wise avec un jeton d’API personnel. Les conversions entre soldes liés sont importées comme virements. L’accès est en lecture seule : aucun paiement n’est effectué.';

  @override
  String get wiseHeadline => 'Wise API (Global)';

  @override
  String get wiseNoProfiles =>
      'Aucun profil Wise n’est disponible pour ce jeton';

  @override
  String get wiseProfile => 'Profil';

  @override
  String get wiseScaRequired =>
      'Wise exige une authentification forte du client : ouvrez le relevé de ce solde dans l’application Wise, puis réessayez';

  @override
  String get wiseToken => 'Jeton d’API personnel';

  @override
  String get wiseTokenSteps =>
      'Comment obtenir un jeton d’API personnel :\n1. Connectez-vous à wise.com dans un navigateur (les jetons ne peuvent pas être créés dans l’application mobile)\n2. Ouvrez Paramètres → Intégrations et outils → Jetons d’API\n3. Choisissez « Ajouter un jeton », nommez-le (p. ex. Fingrom) et sélectionnez l’accès « Lecture seule »\n4. Confirmez avec la vérification en deux étapes et copiez le jeton\n5. Collez-le ci-dessous et appuyez sur « Se connecter »';

  @override
  String get wiseTokenTooltip =>
      'Créé dans Wise sous Paramètres → Jetons d’API (en lecture seule si proposé) ; stocké chiffré';

  @override
  String get zoomState => 'Zoom avant / Zoom arrière';
}
