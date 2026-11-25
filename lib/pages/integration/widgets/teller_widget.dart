// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/deep_link/deep_link_handler.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/teller/teller_client.dart';
import 'package:app_finance/_classes/integration/teller/teller_http.dart';
import 'package:app_finance/_classes/integration/teller/teller_importer.dart';
import 'package:app_finance/_classes/integration/teller/teller_settings.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/storage/transaction_log.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_mixins/file/file_import_mixin.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/design/form/list_selector_item.dart';
import 'package:app_finance/design/generic/loading_widget.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/pages/integration/widgets/enablebanking_widget.dart' show UrlLauncher;
import 'package:app_finance/pages/integration/widgets/integration_account_card.dart';
import 'package:http/http.dart' as http;
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class TellerBankAccount extends IntegrationTarget {
  final TellerAccount account;
  final TellerEnrollment enrollment;
  TellerBalance? balance;

  TellerBankAccount(this.account, this.enrollment, {super.appAccount, super.category, required super.from});

  String get title {
    final institution = account.institution ?? enrollment.institution;
    final number = account.lastFour != null && account.lastFour!.isNotEmpty ? '…${account.lastFour}' : '';
    return [
      institution,
      [account.name, number].where((e) => e.isNotEmpty).join(' '),
    ].where((e) => e.isNotEmpty).join(' — ');
  }
}

class TellerWidget extends StatefulWidget {
  final http.Client? httpClient;
  final UrlLauncher? launcher;

  const TellerWidget({super.key, this.httpClient, this.launcher});

  @override
  TellerWidgetState createState() => TellerWidgetState();
}

class TellerWidgetState extends State<TellerWidget> with FileImportMixin {
  // Pending transactions may get an earlier date when posted: a repeated import looks back for them
  static const postingDelay = Duration(days: 10);

  late final TellerSettings settings;
  late final TextEditingController applicationId;
  late final TextEditingController connectPage;
  final certificate = TextEditingController();
  final privateKey = TextEditingController();
  final accessToken = TextEditingController();
  List<TellerEnrollment> enrollments = [];
  List<TellerBankAccount> accounts = [];
  // Enrollment to be repaired by Teller Connect (new login, MFA, ...)
  String? disconnected;
  bool isLoading = false;
  String? error;
  String? notice;

  @override
  void initState() {
    super.initState();
    settings = TellerSettings.load();
    enrollments = TellerSettings.loadEnrollments();
    applicationId = TextEditingController(text: settings.applicationId);
    connectPage = TextEditingController(
      text: settings.connectPage.isEmpty ? TellerSettings.defaultConnectPage : settings.connectPage,
    );
    DeepLinkHandler.tellerCallback.addListener(onLink);
    // A callback that came before this section was open (e.g. the application was started by it)
    WidgetsBinding.instance.addPostFrameCallback((_) => onLink());
  }

  @override
  void dispose() {
    DeepLinkHandler.tellerCallback.removeListener(onLink);
    for (final controller in [applicationId, connectPage, certificate, privateKey, accessToken]) {
      controller.dispose();
    }
    super.dispose();
  }

  bool get hasCertificate => TellerSettings.loadCertificate() != null && TellerSettings.loadKey() != null;

  Future<void> _run(Future<void> Function(TellerClient client) callback) async {
    setState(() {
      isLoading = true;
      error = null;
      notice = null;
    });
    TellerClient? client;
    try {
      await saveSettings();
      final cert = TellerSettings.loadCertificate();
      final key = TellerSettings.loadKey();
      if (settings.environment.requiresCertificate && (cert == null || key == null)) {
        throw TellerException(AppLocale.labels.tellerIncomplete);
      }
      client = TellerClient(
        client: widget.httpClient ?? createTellerHttpClient(certificate: cert, privateKey: key),
      );
      await callback(client);
    } on TellerException catch (e) {
      error = e.message;
    } catch (e) {
      error = e.toString();
    } finally {
      if (widget.httpClient == null) {
        client?.close();
      }
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  Future<void> saveSettings() async {
    final cert = certificate.text.trim();
    final key = privateKey.text.trim();
    // Both are validated before either is stored
    final normalizedCert = cert.isNotEmpty ? TellerClient.normalizeCertificate(cert) : null;
    final normalizedKey = key.isNotEmpty ? TellerClient.normalizePrivateKey(key) : null;
    if (normalizedCert != null) {
      await TellerSettings.saveCertificate(normalizedCert);
      certificate.clear();
    }
    if (normalizedKey != null) {
      await TellerSettings.saveKey(normalizedKey);
      privateKey.clear();
    }
    final page = connectPage.text.trim();
    settings
      ..applicationId = applicationId.text.trim()
      ..connectPage = page == TellerSettings.defaultConnectPage ? '' : page;
    await settings.save();
  }

  Future<void> upload(TextEditingController controller) async {
    final content = await importFile(['pem', 'crt', 'cer', 'key']);
    if (content != null && mounted) {
      setState(() => controller.text = content);
    }
  }

  void onLink() {
    if (!mounted || DeepLinkHandler.tellerCallback.value == null) {
      return;
    }
    if (isLoading) {
      Future.delayed(const Duration(milliseconds: 300), onLink);
      return;
    }
    final link = DeepLinkHandler.takeTellerCallback()!;
    connect(enrollment: TellerEnrollment.fromLink(link));
  }

  // Teller Connect is a JavaScript widget: it is opened by the connection page in a browser
  Future<void> connectBank() => _run((_) async {
        if (settings.applicationId.isEmpty) {
          throw TellerException(AppLocale.labels.tellerIncomplete);
        }
        final page = settings.connectUrl(enrollmentId: disconnected);
        if (page.scheme != 'https') {
          throw TellerException(AppLocale.labels.integrationHttpsRequired);
        }
        await (widget.launcher ?? (uri) => launchUrl(uri, mode: LaunchMode.externalApplication))(page);
      });

  // [enrollment] comes from the connection page (deep link); the access token field is filled in manually
  Future<void> connect({TellerEnrollment? enrollment}) => _run((client) async {
        final added = enrollment ?? TellerEnrollment.parse(accessToken.text);
        if (added != null) {
          // The token is checked before it is stored
          await client.getAccounts(added.accessToken);
          enrollments = TellerSettings.merge(enrollments, added);
          await TellerSettings.saveEnrollments(enrollments);
          accessToken.clear();
          if (added.id == disconnected) {
            disconnected = null;
          }
        }
        if (enrollments.isEmpty) {
          throw TellerException(AppLocale.labels.tellerAccessToken);
        }
        await _loadAccounts(client);
      });

  Future<void> _loadAccounts(TellerClient client) async {
    final defaultBudget = AppPreferences.get(AppPreferences.prefBudget);
    final monthAgo = DateTime.now().subtract(const Duration(days: 30));
    final errors = <String>[];
    final result = <TellerBankAccount>[];
    for (final enrollment in enrollments) {
      try {
        final items = await client.getAccounts(enrollment.accessToken);
        for (final account in items.where((e) => e.isOpen)) {
          final item = TellerBankAccount(
            account,
            enrollment,
            appAccount: settings.links[account.id],
            category: defaultBudget,
            from: settings.imported[account.id] ?? monthAgo,
          );
          try {
            item.balance = await client.getBalances(enrollment.accessToken, account.id);
          } on TellerException catch (e) {
            if (e.isDisconnected) {
              rethrow;
            }
            // Balances are optional for the import
          }
          result.add(item);
        }
      } on TellerException catch (e) {
        if (e.isDisconnected) {
          disconnected = enrollment.id.isNotEmpty ? enrollment.id : disconnected;
        }
        final name = enrollment.institution.isNotEmpty ? '${enrollment.institution}: ' : '';
        errors.add('$name${e.message}');
      }
    }
    accounts = result;
    if (errors.isNotEmpty) {
      error = errors.join('\n');
    } else if (accounts.isEmpty) {
      notice = AppLocale.labels.integrationNoAccounts;
    }
  }

  Future<void> disconnect() async => setState(() => accounts = []);

  Future<void> forget() => _run((client) async {
        final current = enrollments;
        enrollments = [];
        accounts = [];
        disconnected = null;
        await TellerSettings.saveEnrollments(enrollments);
        for (final enrollment in current) {
          try {
            await client.deleteEnrollment(enrollment.accessToken);
          } on TellerException {
            // Already revoked or disconnected: nothing else to do
          }
        }
      });

  Future<void> importTransactions(TellerBankAccount item) => _run((client) async {
        if (item.appAccount == null || item.category == null) {
          throw TellerException(AppLocale.labels.integrationSelectTarget);
        }
        final state = Provider.of<AppData>(context, listen: false);
        final id = item.account.id;
        final last = settings.imported[id];
        final from = last != null && !item.from.isAfter(last) ? item.from.subtract(postingDelay) : item.from;
        final List<TellerTransaction> transactions;
        try {
          transactions = await client.getTransactions(item.enrollment.accessToken, id, from: from);
        } on TellerException catch (e) {
          if (e.isDisconnected && item.enrollment.id.isNotEmpty) {
            disconnected = item.enrollment.id;
          }
          rethrow;
        }
        final importer = TellerImporter(
          exists: (uuid) => state.getByUuid(uuid) != null,
          add: (value, uuid) => TransactionLog.save(state.add(value, uuid)),
        );
        final summary = importer.run(
          source: item.account,
          transactions: transactions,
          account: item.appAccount!,
          category: item.category!,
          prediction: state.prediction,
        );
        await state.restate();
        final today = DateTime.now();
        settings.links[id] = item.appAccount!;
        settings.imported[id] = DateTime(today.year, today.month, today.day);
        await settings.save();
        notice = AppLocale.labels.integrationImported(summary.added, summary.pending, summary.skipped);
      });

  Widget buildUpload(String key, TextEditingController controller) => Align(
        alignment: Alignment.centerRight,
        child: TextButton.icon(
          key: ValueKey('teller_upload_$key'),
          icon: const Icon(Icons.upload_file),
          onPressed: isLoading ? null : () => upload(controller),
          label: Text(AppLocale.labels.tellerUpload),
        ),
      );

  Widget buildSettings(BuildContext context) {
    final stored = hasCertificate;
    return Column(
      crossAxisAlignment: AppDesign.getAlignment(),
      children: [
        Text(AppLocale.labels.tellerSteps, style: context.textTheme.bodyMedium),
        ThemeHelper.hIndent2x,
        InputWrapper.text(
          title: AppLocale.labels.tellerAppId,
          tooltip: AppLocale.labels.tellerAppIdTooltip,
          controller: applicationId,
          isRequired: true,
        ),
        InputWrapper.select(
          title: AppLocale.labels.tellerEnvironment,
          value: settings.environment.name,
          isRequired: true,
          options: <ListSelectorItem>[
            for (final env in TellerEnvironment.values) ListSelectorItem(id: env.name, name: env.name),
          ],
          onChange: (value) => setState(() => settings.environment = TellerEnvironment.parse(value)),
        ),
        if (isTellerCertificateSupported) ...[
          InputWrapper.text(
            title: AppLocale.labels.tellerCertificate,
            tooltip: AppLocale.labels.tellerCertificateTooltip,
            controller: certificate,
            isRequired: settings.environment.requiresCertificate && !stored,
          ),
          buildUpload('certificate', certificate),
          InputWrapper.text(
            title: AppLocale.labels.tellerKey,
            tooltip: AppLocale.labels.tellerKeyTooltip,
            controller: privateKey,
            isRequired: settings.environment.requiresCertificate && !stored,
          ),
          buildUpload('key', privateKey),
        ],
        InputWrapper.text(
          title: AppLocale.labels.tellerConnectPage,
          tooltip: AppLocale.labels.tellerConnectPageTooltip,
          controller: connectPage,
          isRequired: true,
          inputType: TextInputType.url,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            key: const ValueKey('teller_connect_bank'),
            icon: const Icon(Icons.account_balance),
            onPressed: isLoading ? null : connectBank,
            label: Text(AppLocale.labels.tellerConnectBank),
          ),
        ),
        InputWrapper.text(
          title: AppLocale.labels.tellerAccessToken,
          tooltip: AppLocale.labels.tellerAccessTokenTooltip,
          controller: accessToken,
          isRequired: enrollments.isEmpty,
        ),
      ],
    );
  }

  Widget buildAccount(BuildContext context, TellerBankAccount item, AppData state) {
    final amount = item.balance?.amount;
    return IntegrationAccountCard(
      title: item.title,
      subtitle: amount != null ? '${AppLocale.labels.balance}: $amount ${item.account.currency}' : null,
      target: item,
      state: state,
      isDisabled: isLoading,
      onChanged: () => setState(() {}),
      onImport: () => importTransactions(item),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    return Consumer<AppData>(builder: (context, state, _) {
      return Column(
        crossAxisAlignment: AppDesign.getAlignment(),
        children: [
          Text(AppLocale.labels.tellerDescription, style: textTheme.bodyMedium),
          ThemeHelper.hIndent2x,
          if (accounts.isEmpty) buildSettings(context),
          ThemeHelper.hIndent2x,
          if (error != null) ...[
            Text(error!, style: textTheme.bodyLarge?.copyWith(color: colorScheme.error)),
            ThemeHelper.hIndent,
          ],
          if (notice != null) ...[
            Text(notice!, style: textTheme.bodyLarge),
            ThemeHelper.hIndent,
          ],
          if (isLoading)
            const Center(child: LoadingWidget(isLoading: true, size: Size(48, 48)))
          else ...[
            if (accounts.isNotEmpty)
              FullSizedButtonWidget(
                key: const ValueKey('teller_disconnect'),
                icon: Icons.logout,
                onPressed: disconnect,
                title: AppLocale.labels.integrationDisconnect,
              )
            else
              FullSizedButtonWidget(
                key: const ValueKey('teller_connect'),
                icon: Icons.login,
                onPressed: connect,
                title: AppLocale.labels.integrationConnect,
              ),
            if (accounts.isNotEmpty || disconnected != null)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  key: const ValueKey('teller_add_bank'),
                  icon: const Icon(Icons.add_link),
                  onPressed: connectBank,
                  label: Text(AppLocale.labels.tellerConnectBank),
                ),
              ),
            if (enrollments.isNotEmpty)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  key: const ValueKey('teller_forget'),
                  icon: const Icon(Icons.link_off),
                  onPressed: forget,
                  label: Text(AppLocale.labels.integrationForget),
                ),
              ),
          ],
          for (final item in accounts) buildAccount(context, item, state),
        ],
      );
    });
  }
}
