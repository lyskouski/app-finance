// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/investec/investec_client.dart';
import 'package:app_finance/_classes/integration/investec/investec_importer.dart';
import 'package:app_finance/_classes/integration/investec/investec_settings.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/storage/transaction_log.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/design/generic/loading_widget.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/pages/integration/widgets/integration_account_card.dart';
import 'package:http/http.dart' as http;
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

class InvestecBankAccount extends IntegrationTarget {
  final InvestecAccount account;
  InvestecBalance? balance;

  InvestecBankAccount(this.account, {super.appAccount, super.category, required super.from});

  // South African Rand, unless the bank tells otherwise
  String get currency => balance?.currency ?? 'ZAR';
}

class InvestecWidget extends StatefulWidget {
  final http.Client? httpClient;

  const InvestecWidget({super.key, this.httpClient});

  @override
  InvestecWidgetState createState() => InvestecWidgetState();
}

class InvestecWidgetState extends State<InvestecWidget> {
  late final InvestecSettings settings;
  final clientId = TextEditingController();
  final secret = TextEditingController();
  final apiKey = TextEditingController();
  InvestecCredentials? credentials;
  // Keeps the bearer token between requests (valid for 30 minutes)
  InvestecClient? _client;
  List<InvestecBankAccount> accounts = [];
  bool isLoading = false;
  String? error;
  String? notice;

  @override
  void initState() {
    super.initState();
    settings = InvestecSettings.load();
    credentials = InvestecSettings.loadCredentials();
  }

  @override
  void dispose() {
    for (final controller in [clientId, secret, apiKey]) {
      controller.dispose();
    }
    _closeClient();
    super.dispose();
  }

  void _closeClient() {
    if (widget.httpClient == null) {
      _client?.close();
    }
    _client = null;
  }

  InvestecClient get client =>
      _client ??= InvestecClient(client: widget.httpClient ?? http.Client(), sandbox: settings.sandbox);

  Future<void> _run(Future<void> Function() callback) async {
    setState(() {
      isLoading = true;
      error = null;
      notice = null;
    });
    try {
      await callback();
    } on InvestecException catch (e) {
      error = e.message;
    } catch (e) {
      error = e.toString();
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  Future<void> setSandbox(bool value) async {
    setState(() => settings.sandbox = value);
    _closeClient();
    await settings.save();
  }

  Future<void> connect() => _run(() async {
        var current = credentials;
        if (current == null) {
          final entered = (clientId: clientId.text.trim(), secret: secret.text.trim(), apiKey: apiKey.text.trim());
          if (entered.clientId.isEmpty || entered.secret.isEmpty || entered.apiKey.isEmpty) {
            throw InvestecException(AppLocale.labels.investecIncomplete);
          }
          current = entered;
        }
        final items = await client.getAccounts(current);
        // Stored only after the bank has accepted them
        if (credentials == null) {
          await InvestecSettings.saveCredentials(current);
          await settings.save();
          credentials = current;
          for (final controller in [clientId, secret, apiKey]) {
            controller.clear();
          }
        }
        final defaultBudget = AppPreferences.get(AppPreferences.prefBudget);
        final monthAgo = DateTime.now().subtract(const Duration(days: 30));
        accounts = items
            .map((account) => InvestecBankAccount(
                  account,
                  appAccount: settings.links[account.id],
                  category: defaultBudget,
                  from: settings.imported[account.id] ?? monthAgo,
                ))
            .toList();
        for (final item in accounts) {
          try {
            item.balance = await client.getBalance(current, item.account.id);
          } on InvestecException {
            // The balance is optional for the import
          }
        }
        if (accounts.isEmpty) {
          notice = AppLocale.labels.integrationNoAccounts;
        }
      });

  Future<void> disconnect() => _run(() async => accounts = []);

  Future<void> forget() => _run(() async {
        await InvestecSettings.clearCredentials();
        credentials = null;
        accounts = [];
        _closeClient();
      });

  Future<void> importTransactions(InvestecBankAccount item) => _run(() async {
        final current = credentials;
        if (current == null) {
          return;
        }
        if (item.appAccount == null || item.category == null) {
          throw InvestecException(AppLocale.labels.integrationSelectTarget);
        }
        final state = Provider.of<AppData>(context, listen: false);
        final id = item.account.id;
        final transactions = await client.getTransactions(current, id, from: item.from);
        final importer = InvestecImporter(
          exists: (uuid) => state.getByUuid(uuid) != null,
          add: (value, uuid) => TransactionLog.save(state.add(value, uuid)),
        );
        final summary = importer.run(
          accountId: id,
          currency: item.currency,
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

  Widget buildAccount(BuildContext context, InvestecBankAccount item, AppData state) {
    final balance = item.balance;
    return IntegrationAccountCard(
      title: item.account.title,
      subtitle: balance != null ? '${AppLocale.labels.balance}: ${balance.current} ${balance.currency}' : null,
      target: item,
      state: state,
      isDisabled: isLoading,
      onChanged: () => setState(() {}),
      onImport: () => importTransactions(item),
    );
  }

  Widget buildCredentials(BuildContext context) => Column(
        crossAxisAlignment: AppDesign.getAlignment(),
        children: [
          Text(
            AppLocale.labels.investecSteps,
            key: const ValueKey('investec_steps'),
            style: context.textTheme.bodyMedium,
          ),
          ThemeHelper.hIndent2x,
          InputWrapper.text(
            title: AppLocale.labels.investecClientId,
            tooltip: AppLocale.labels.investecCredentialsTooltip,
            controller: clientId,
            isRequired: true,
          ),
          InputWrapper.text(
            title: AppLocale.labels.investecSecret,
            tooltip: AppLocale.labels.investecCredentialsTooltip,
            controller: secret,
            isRequired: true,
          ),
          InputWrapper.text(
            title: AppLocale.labels.investecApiKey,
            tooltip: AppLocale.labels.investecCredentialsTooltip,
            controller: apiKey,
            isRequired: true,
          ),
          SwitchListTile(
            key: const ValueKey('investec_sandbox'),
            contentPadding: EdgeInsets.zero,
            title: Text(AppLocale.labels.investecSandbox),
            value: settings.sandbox,
            onChanged: isLoading ? null : setSandbox,
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    return Consumer<AppData>(builder: (context, state, _) {
      return Column(
        crossAxisAlignment: AppDesign.getAlignment(),
        children: [
          Text(AppLocale.labels.investecDescription, style: textTheme.bodyMedium),
          ThemeHelper.hIndent2x,
          if (credentials == null) buildCredentials(context),
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
            accounts.isEmpty
                ? FullSizedButtonWidget(
                    key: const ValueKey('investec_connect'),
                    icon: Icons.login,
                    onPressed: connect,
                    title: AppLocale.labels.integrationConnect,
                  )
                : FullSizedButtonWidget(
                    key: const ValueKey('investec_disconnect'),
                    icon: Icons.logout,
                    onPressed: disconnect,
                    title: AppLocale.labels.integrationDisconnect,
                  ),
            if (credentials != null)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  key: const ValueKey('investec_forget'),
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
