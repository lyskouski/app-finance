// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/simplefin/simplefin_client.dart';
import 'package:app_finance/_classes/integration/simplefin/simplefin_importer.dart';
import 'package:app_finance/_classes/integration/simplefin/simplefin_settings.dart';
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

class SimpleFinBankAccount extends IntegrationTarget {
  final SimpleFinAccount account;

  SimpleFinBankAccount(this.account, {super.appAccount, super.category, required super.from});

  String get title => [account.institution ?? '', account.name].where((e) => e.isNotEmpty).join(' — ');
}

class SimpleFinWidget extends StatefulWidget {
  final SimpleFinClient? client;

  const SimpleFinWidget({super.key, this.client});

  @override
  SimpleFinWidgetState createState() => SimpleFinWidgetState();
}

class SimpleFinWidgetState extends State<SimpleFinWidget> {
  late final SimpleFinClient client;
  late final SimpleFinSettings settings;
  final token = TextEditingController();
  Uri? access;
  List<SimpleFinBankAccount> accounts = [];
  bool isLoading = false;
  String? error;
  String? notice;

  @override
  void initState() {
    super.initState();
    client = widget.client ?? SimpleFinClient();
    settings = SimpleFinSettings.load();
    access = SimpleFinSettings.loadAccess();
  }

  @override
  void dispose() {
    token.dispose();
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
    } on SimpleFinException catch (e) {
      error = e.message;
    } catch (e) {
      error = e.toString();
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  void _report(List<String> errors) {
    if (errors.isNotEmpty) {
      notice = [if (notice != null) notice!, ...errors].join('\n');
    }
  }

  Future<void> connect() => _run(() async {
        if (access == null) {
          final value = token.text.trim();
          if (value.isEmpty) {
            throw SimpleFinException(AppLocale.labels.simpleFinToken);
          }
          final claimed = await client.claim(value);
          await SimpleFinSettings.saveAccess(claimed);
          token.clear();
          access = claimed;
        }
        final result = await client.getAccounts(access!, balancesOnly: true);
        final defaultBudget = AppPreferences.get(AppPreferences.prefBudget);
        final monthAgo = DateTime.now().subtract(const Duration(days: 30));
        accounts = result.accounts
            .map((account) => SimpleFinBankAccount(
                  account,
                  appAccount: settings.links[account.id],
                  category: defaultBudget,
                  from: settings.imported[account.id] ?? monthAgo,
                ))
            .toList();
        if (accounts.isEmpty) {
          notice = AppLocale.labels.integrationNoAccounts;
        }
        _report(result.errors);
      });

  Future<void> disconnect() => _run(() async => accounts = []);

  Future<void> forget() => _run(() async {
        await SimpleFinSettings.clearAccess();
        access = null;
        accounts = [];
      });

  Future<void> importTransactions(SimpleFinBankAccount item) => _run(() async {
        final current = access;
        if (current == null) {
          return;
        }
        if (item.appAccount == null || item.category == null) {
          throw SimpleFinException(AppLocale.labels.integrationSelectTarget);
        }
        final state = Provider.of<AppData>(context, listen: false);
        final result = await client.getAccounts(current, start: item.from, accountIds: [item.account.id]);
        final source = result.accounts.where((e) => e.id == item.account.id).firstOrNull;
        final importer = SimpleFinImporter(
          exists: (uuid) => state.getByUuid(uuid) != null,
          add: (value, uuid) => TransactionLog.save(state.add(value, uuid)),
        );
        final summary = source != null
            ? importer.run(source: source, account: item.appAccount!, category: item.category!)
            : (added: 0, skipped: 0, pending: 0);
        await state.restate();
        final today = DateTime.now();
        settings.links[item.account.id] = item.appAccount!;
        settings.imported[item.account.id] = DateTime(today.year, today.month, today.day);
        await settings.save();
        notice = AppLocale.labels.integrationImported(summary.added, summary.pending, summary.skipped);
        _report(result.errors);
      });

  Widget buildAccount(BuildContext context, SimpleFinBankAccount item, AppData state) {
    final account = item.account;
    return IntegrationAccountCard(
      title: item.title,
      subtitle: '${AppLocale.labels.balance}: ${account.balance} ${account.currency}',
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
          Text(AppLocale.labels.simpleFinDescription, style: textTheme.bodyMedium),
          ThemeHelper.hIndent2x,
          if (access == null)
            InputWrapper.text(
              title: AppLocale.labels.simpleFinToken,
              tooltip: AppLocale.labels.simpleFinTokenTooltip,
              controller: token,
              isRequired: true,
            ),
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
                    key: const ValueKey('simplefin_connect'),
                    icon: Icons.login,
                    onPressed: connect,
                    title: AppLocale.labels.integrationConnect,
                  )
                : FullSizedButtonWidget(
                    key: const ValueKey('simplefin_disconnect'),
                    icon: Icons.logout,
                    onPressed: disconnect,
                    title: AppLocale.labels.integrationDisconnect,
                  ),
            if (access != null)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  key: const ValueKey('simplefin_forget'),
                  icon: const Icon(Icons.link_off),
                  onPressed: forget,
                  label: Text(AppLocale.labels.simpleFinForget),
                ),
              ),
          ],
          for (final item in accounts) buildAccount(context, item, state),
        ],
      );
    });
  }
}
