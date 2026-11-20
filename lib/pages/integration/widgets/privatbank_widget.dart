// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/privatbank/privatbank_client.dart';
import 'package:app_finance/_classes/integration/privatbank/privatbank_importer.dart';
import 'package:app_finance/_classes/integration/privatbank/privatbank_settings.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/storage/transaction_log.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/design/generic/loading_widget.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/pages/integration/widgets/integration_account_card.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

class PrivatBankAccount extends IntegrationTarget {
  final String iban;
  PrivatBankBalance? balance;

  PrivatBankAccount(this.iban, {this.balance, super.appAccount, super.category, required super.from});

  String get title => [iban, balance?.name ?? ''].where((e) => e.isNotEmpty).join(' — ');
}

class PrivatBankWidget extends StatefulWidget {
  final PrivatBankClient? client;

  const PrivatBankWidget({super.key, this.client});

  @override
  PrivatBankWidgetState createState() => PrivatBankWidgetState();
}

class PrivatBankWidgetState extends State<PrivatBankWidget> {
  late final PrivatBankClient client;
  late final PrivatBankSettings settings;
  final token = TextEditingController();
  final iban = TextEditingController();
  String? access;
  bool isConnected = false;
  List<PrivatBankAccount> accounts = [];
  bool isLoading = false;
  String? error;
  String? notice;

  @override
  void initState() {
    super.initState();
    client = widget.client ?? PrivatBankClient();
    settings = PrivatBankSettings.load();
    access = PrivatBankSettings.loadToken();
  }

  @override
  void dispose() {
    token.dispose();
    iban.dispose();
    if (widget.client == null) {
      client.close();
    }
    super.dispose();
  }

  Future<void> _run(Future<void> Function() callback) async {
    setState(() {
      isLoading = true;
      error = null;
      notice = null;
    });
    try {
      await callback();
    } on PrivatBankException catch (e) {
      error = e.message;
    } catch (e) {
      error = e.toString();
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  PrivatBankAccount _account(String value) => PrivatBankAccount(
        value,
        appAccount: settings.links[value],
        category: AppPreferences.get(AppPreferences.prefBudget),
        from: settings.imported[value] ?? DateTime.now().subtract(const Duration(days: 30)),
      );

  Future<void> _loadBalance(PrivatBankAccount item) async {
    item.balance = await client.getBalance(access!, item.iban);
  }

  Future<void> connect() => _run(() async {
        final value = access ?? token.text.trim();
        if (value.isEmpty) {
          throw PrivatBankException(AppLocale.labels.privatBankToken);
        }
        await client.ensureReady(value);
        if (access == null) {
          await PrivatBankSettings.saveToken(value);
          token.clear();
          access = value;
        }
        isConnected = true;
        accounts = settings.accounts.map(_account).toList();
        for (final item in accounts) {
          await _loadBalance(item);
        }
        if (accounts.isEmpty) {
          notice = AppLocale.labels.privatBankIbanTooltip;
        }
      });

  Future<void> addAccount() => _run(() async {
        final value = PrivatBankClient.normalizeIban(iban.text);
        if (value == null) {
          throw PrivatBankException(AppLocale.labels.privatBankIbanInvalid);
        }
        if (!settings.accounts.contains(value)) {
          settings.accounts.add(value);
          await settings.save();
        }
        iban.clear();
        if (!accounts.any((e) => e.iban == value)) {
          final item = _account(value);
          accounts.add(item);
          await _loadBalance(item);
        }
      });

  Future<void> removeAccount(PrivatBankAccount item) => _run(() async {
        settings.accounts.remove(item.iban);
        settings.links.remove(item.iban);
        settings.imported.remove(item.iban);
        await settings.save();
        accounts.remove(item);
      });

  Future<void> disconnect() => _run(() async {
        isConnected = false;
        accounts = [];
      });

  Future<void> forget() => _run(() async {
        await PrivatBankSettings.clearToken();
        access = null;
        isConnected = false;
        accounts = [];
      });

  Future<void> importTransactions(PrivatBankAccount item) => _run(() async {
        final current = access;
        if (current == null) {
          return;
        }
        if (item.appAccount == null || item.category == null) {
          throw PrivatBankException(AppLocale.labels.integrationSelectTarget);
        }
        final state = Provider.of<AppData>(context, listen: false);
        await client.ensureReady(current);
        final transactions = await client.getTransactions(current, iban: item.iban, start: item.from);
        final importer = PrivatBankImporter(
          exists: (uuid) => state.getByUuid(uuid) != null,
          add: (value, uuid) => TransactionLog.save(state.add(value, uuid)),
        );
        final summary = importer.run(
          iban: item.iban,
          transactions: transactions,
          account: item.appAccount!,
          category: item.category!,
          currency: item.balance?.currency,
          prediction: state.prediction,
        );
        await state.restate();
        final today = DateTime.now();
        settings.links[item.iban] = item.appAccount!;
        settings.imported[item.iban] = DateTime(today.year, today.month, today.day);
        await settings.save();
        notice = AppLocale.labels.integrationImported(summary.added, summary.pending, summary.skipped);
      });

  Widget buildAccount(BuildContext context, PrivatBankAccount item, AppData state) {
    final balance = item.balance;
    return IntegrationAccountCard(
      key: ValueKey('privatbank_${item.iban}'),
      title: item.title,
      subtitle: balance != null ? '${AppLocale.labels.balance}: ${balance.amount} ${balance.currency}' : null,
      target: item,
      state: state,
      isDisabled: isLoading,
      onChanged: () => setState(() {}),
      onImport: () => importTransactions(item),
      children: [
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            icon: const Icon(Icons.delete_outline),
            onPressed: isLoading ? null : () => removeAccount(item),
            label: Text(AppLocale.labels.privatBankRemove),
          ),
        ),
      ],
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
          Text(AppLocale.labels.privatBankDescription, style: textTheme.bodyMedium),
          ThemeHelper.hIndent2x,
          if (access == null) ...[
            Text(AppLocale.labels.privatBankTokenSteps,
                key: const ValueKey('privatbank_steps'), style: textTheme.bodyMedium),
            ThemeHelper.hIndent2x,
            InputWrapper.text(
              title: AppLocale.labels.privatBankToken,
              tooltip: AppLocale.labels.privatBankTokenTooltip,
              controller: token,
              isRequired: true,
            ),
          ],
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
            !isConnected
                ? FullSizedButtonWidget(
                    key: const ValueKey('privatbank_connect'),
                    icon: Icons.login,
                    onPressed: connect,
                    title: AppLocale.labels.integrationConnect,
                  )
                : FullSizedButtonWidget(
                    key: const ValueKey('privatbank_disconnect'),
                    icon: Icons.logout,
                    onPressed: disconnect,
                    title: AppLocale.labels.integrationDisconnect,
                  ),
            if (access != null)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  key: const ValueKey('privatbank_forget'),
                  icon: const Icon(Icons.link_off),
                  onPressed: forget,
                  label: Text(AppLocale.labels.integrationForget),
                ),
              ),
          ],
          for (final item in accounts) buildAccount(context, item, state),
          if (isConnected) ...[
            ThemeHelper.hIndent2x,
            InputWrapper.text(
              title: AppLocale.labels.privatBankIban,
              tooltip: AppLocale.labels.privatBankIbanTooltip,
              controller: iban,
            ),
            FullSizedButtonWidget(
              key: const ValueKey('privatbank_add'),
              icon: Icons.add,
              onPressed: addAccount,
              title: AppLocale.labels.privatBankAdd,
              isDisabled: isLoading,
            ),
          ],
        ],
      );
    });
  }
}
