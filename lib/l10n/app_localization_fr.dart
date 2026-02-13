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
  String get dayStartOfMonth => 'Début du mois';

  @override
  String get dayStartOfWeek => 'Début de la semaine';

  @override
  String get daySunday => 'Dimanche';

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
  String get meaning => 'Signification';

  @override
  String get metricsHeadline => 'métrique';

  @override
  String get metricsTooltip => 'Métriques';

  @override
  String get milestones => 'Jalons';

  @override
  String get missingContent =>
      'Le fichier ne peut pas être traité (soit annulé)';

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
  String get securityHeadline => 'Sécurité';

  @override
  String get settingsBaseHeadline => 'Principes de base';

  @override
  String get settingsHeadline => 'Paramètres';

  @override
  String get skipFromTotals => 'Exclure des totaux';

  @override
  String get skipTooltip => 'Sauter étape(s)';

  @override
  String get spent => 'dépensé';

  @override
  String get splitCancelTooltip => 'Annuler le fractionnement par mois';

  @override
  String get splitTooltip => 'Déclarer des limites par mois';

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
  String get zoomState => 'Zoom avant / Zoom arrière';
}
