// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/deep_link/deep_link_handler.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/monzo/monzo_client.dart';
import 'package:app_finance/_classes/integration/monzo/monzo_importer.dart';
import 'package:app_finance/_classes/integration/monzo/monzo_settings.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/storage/transaction_log.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/design/generic/loading_widget.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/pages/integration/widgets/enablebanking_widget.dart' show UrlLauncher;
import 'package:app_finance/pages/integration/widgets/integration_account_card.dart';
import 'package:http/http.dart' as http;
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MonzoBankAccount extends IntegrationTarget {
  final MonzoAccount account;
  MonzoBalance? balance;

  MonzoBankAccount(this.account, {super.appAccount, super.category, required super.from});
}

class MonzoWidget extends StatefulWidget {
  final http.Client? httpClient;
  final UrlLauncher? launcher;
  final DateTime Function()? now;

  const MonzoWidget({super.key, this.httpClient, this.launcher, this.now});

  @override
  MonzoWidgetState createState() => MonzoWidgetState();
}

class MonzoWidgetState extends State<MonzoWidget> {
  late final MonzoSettings settings;
  late final TextEditingController clientId;
  late final TextEditingController redirectUrl;
  final clientSecret = TextEditingController();
  final code = TextEditingController();
  MonzoTokens? tokens;
  String? authorizationState;
  List<MonzoBankAccount> accounts = [];
  bool isLoading = false;
  String? error;
  String? notice;

  DateTime now() => (widget.now ?? DateTime.now)();

  @override
  void initState() {
    super.initState();
    settings = MonzoSettings.load();
    tokens = MonzoSettings.loadTokens();
    authorizationState = settings.authorizationState.isEmpty ? null : settings.authorizationState;
    clientId = TextEditingController(text: settings.clientId);
    redirectUrl = TextEditingController(
      text: settings.redirectUrl.isEmpty ? MonzoSettings.defaultRedirectUrl : settings.redirectUrl,
    );
    DeepLinkHandler.monzoCallback.addListener(onLink);
    // A callback that came before this section was open (e.g. the application was started by it)
    WidgetsBinding.instance.addPostFrameCallback((_) => onLink());
  }

  @override
  void dispose() {
    DeepLinkHandler.monzoCallback.removeListener(onLink);
    for (final controller in [clientId, redirectUrl, clientSecret, code]) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _run(Future<void> Function(MonzoClient client) callback) async {
    setState(() {
      isLoading = true;
      error = null;
      notice = null;
    });
    MonzoClient? client;
    try {
      await saveSettings();
      final secret = MonzoSettings.loadSecret();
      if (settings.clientId.isEmpty || secret == null || settings.redirectUrl.isEmpty) {
        throw MonzoException(AppLocale.labels.monzoIncomplete);
      }
      client = MonzoClient(
        clientId: settings.clientId,
        clientSecret: secret,
        tokens: tokens,
        onTokens: (value) async {
          tokens = value;
          await MonzoSettings.saveTokens(value);
        },
        client: widget.httpClient ?? http.Client(),
        now: now,
      );
      await callback(client);
    } on MonzoException catch (e) {
      error = e.message;
      // Neither the access token nor the refresh token is valid anymore: a new sign-in is needed
      if (e.statusCode == 401) {
        await _clearAccess();
      }
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

  Future<void> _clearAccess() async {
    tokens = null;
    accounts = [];
    settings.approvedAt = null;
    await MonzoSettings.clearTokens();
    await settings.save();
  }

  Future<void> saveSettings() async {
    final secret = clientSecret.text.trim();
    if (secret.isNotEmpty) {
      await MonzoSettings.saveSecret(secret);
      clientSecret.clear();
    }
    settings
      ..clientId = clientId.text.trim()
      ..redirectUrl = redirectUrl.text.trim();
    await settings.save();
  }

  void onLink() {
    if (!mounted || DeepLinkHandler.monzoCallback.value == null || authorizationState == null) {
      return;
    }
    if (isLoading) {
      Future.delayed(const Duration(milliseconds: 300), onLink);
      return;
    }
    confirm(link: DeepLinkHandler.takeMonzoCallback().toString());
  }

  Future<void> _setAuthorizationState(String? state) async {
    authorizationState = state;
    settings.authorizationState = state ?? '';
    await settings.save();
  }

  Future<void> connect() => _run((client) async {
        if (tokens != null) {
          return _loadAccounts(client);
        }
        final state = MonzoSettings.newState();
        final url = client.authorizationUrl(redirectUrl: settings.redirectUrl, state: state);
        await _setAuthorizationState(state);
        await (widget.launcher ?? (uri) => launchUrl(uri, mode: LaunchMode.externalApplication))(url);
      });

  // [link] comes from Monzo's redirect (deep link) and has to return the pending state; the field is entered manually
  Future<void> confirm({String? link}) => _run((client) async {
        final value = MonzoClient.extractCode(
          link ?? code.text,
          state: authorizationState,
          requireState: link != null,
        );
        await client.exchange(value, redirectUrl: settings.redirectUrl);
        settings.approvedAt = null;
        await _setAuthorizationState(null);
        code.clear();
        await _loadAccounts(client);
      });

  Future<void> _loadAccounts(MonzoClient client) async {
    final List<MonzoAccount> items;
    try {
      items = await client.getAccounts();
    } on MonzoException catch (e) {
      // Expected right after the sign-in: the access is granted in the Monzo app
      if (e.code != null && e.code!.contains('insufficient_permissions')) {
        notice = e.message;
        return;
      }
      rethrow;
    }
    if (settings.approvedAt == null) {
      settings.approvedAt = now();
      await settings.save();
    }
    final defaultBudget = AppPreferences.get(AppPreferences.prefBudget);
    final monthAgo = now().subtract(const Duration(days: 30));
    accounts = items
        .where((account) => !account.isClosed)
        .map((account) => MonzoBankAccount(
              account,
              appAccount: settings.links[account.id],
              category: defaultBudget,
              from: settings.imported[account.id] ?? monthAgo,
            ))
        .toList();
    for (final item in accounts) {
      try {
        item.balance = await client.getBalance(item.account.id);
      } on MonzoException {
        // The balance is optional for the import
      }
    }
    final until = settings.fullHistoryUntil;
    if (accounts.isEmpty) {
      notice = AppLocale.labels.integrationNoAccounts;
    } else if (until != null && now().isBefore(until)) {
      final time = TimeOfDay.fromDateTime(until);
      notice = AppLocale.labels
          .monzoFullHistory('${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}');
    }
  }

  Future<void> disconnect() async => setState(() => accounts = []);

  Future<void> forget() => _run((client) async {
        try {
          await client.logout();
        } catch (_) {
          // The access is dropped locally in any case
        }
        await _clearAccess();
        await _setAuthorizationState(null);
      });

  Future<void> importTransactions(MonzoBankAccount item) => _run((client) async {
        if (item.appAccount == null || item.category == null) {
          throw MonzoException(AppLocale.labels.integrationSelectTarget);
        }
        final state = Provider.of<AppData>(context, listen: false);
        final id = item.account.id;
        var since = item.from;
        String? limited;
        final until = settings.fullHistoryUntil;
        final earliest = now().subtract(MonzoClient.historyLimit);
        if ((until == null || !now().isBefore(until)) && since.isBefore(earliest)) {
          since = DateTime(earliest.year, earliest.month, earliest.day);
          limited = AppLocale.labels.monzoHistoryLimited(since.toIso8601String().substring(0, 10));
        }
        final transactions = await client.getTransactions(id, since: since);
        final importer = MonzoImporter(
          exists: (uuid) => state.getByUuid(uuid) != null,
          add: (value, uuid) => TransactionLog.save(state.add(value, uuid)),
        );
        final summary = importer.run(
          accountId: id,
          transactions: transactions,
          account: item.appAccount!,
          category: item.category!,
          prediction: state.prediction,
        );
        await state.restate();
        final today = now();
        settings.links[id] = item.appAccount!;
        settings.imported[id] = DateTime(today.year, today.month, today.day);
        await settings.save();
        notice = [
          if (limited != null) limited,
          AppLocale.labels.integrationImported(summary.added, summary.pending, summary.skipped),
        ].join('\n');
      });

  Widget buildSettings(BuildContext context) => Column(
        crossAxisAlignment: AppDesign.getAlignment(),
        children: [
          Text(AppLocale.labels.monzoSteps, key: const ValueKey('monzo_steps'), style: context.textTheme.bodyMedium),
          ThemeHelper.hIndent2x,
          InputWrapper.text(
            title: AppLocale.labels.monzoClientId,
            controller: clientId,
            isRequired: true,
          ),
          InputWrapper.text(
            title: AppLocale.labels.monzoClientSecret,
            tooltip: AppLocale.labels.monzoClientSecretTooltip,
            controller: clientSecret,
            isRequired: MonzoSettings.loadSecret() == null,
          ),
          InputWrapper.text(
            title: AppLocale.labels.monzoRedirect,
            tooltip: AppLocale.labels.monzoRedirectTooltip,
            controller: redirectUrl,
            isRequired: true,
            inputType: TextInputType.url,
          ),
        ],
      );

  Widget buildAccount(BuildContext context, MonzoBankAccount item, AppData state) {
    final balance = item.balance;
    return IntegrationAccountCard(
      title: item.account.title,
      subtitle: balance != null ? '${AppLocale.labels.balance}: ${balance.balance} ${balance.currency}' : null,
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
          Text(AppLocale.labels.monzoDescription, style: textTheme.bodyMedium),
          ThemeHelper.hIndent2x,
          if (tokens == null) buildSettings(context),
          if (authorizationState != null && tokens == null)
            InputWrapper.text(
              title: AppLocale.labels.monzoCode,
              tooltip: AppLocale.labels.monzoCodeTooltip,
              controller: code,
              isRequired: true,
              inputType: TextInputType.url,
            ),
          ThemeHelper.hIndent2x,
          if (error != null) ...[
            Text(error!, style: textTheme.bodyLarge?.copyWith(color: colorScheme.error)),
            ThemeHelper.hIndent,
          ],
          if (notice != null) ...[
            Text(notice!, key: const ValueKey('monzo_notice'), style: textTheme.bodyLarge),
            ThemeHelper.hIndent,
          ],
          if (isLoading)
            const Center(child: LoadingWidget(isLoading: true, size: Size(48, 48)))
          else ...[
            if (accounts.isNotEmpty)
              FullSizedButtonWidget(
                key: const ValueKey('monzo_disconnect'),
                icon: Icons.logout,
                onPressed: disconnect,
                title: AppLocale.labels.integrationDisconnect,
              )
            else
              FullSizedButtonWidget(
                key: const ValueKey('monzo_connect'),
                icon: Icons.login,
                onPressed: authorizationState != null && tokens == null ? confirm : connect,
                title: AppLocale.labels.integrationConnect,
              ),
            if (tokens != null)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  key: const ValueKey('monzo_forget'),
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
