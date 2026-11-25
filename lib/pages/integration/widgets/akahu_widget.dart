// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/akahu/akahu_client.dart';
import 'package:app_finance/_classes/integration/akahu/akahu_importer.dart';
import 'package:app_finance/_classes/integration/akahu/akahu_settings.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/storage/transaction_log.dart';
import 'package:app_finance/_classes/structure/budget_app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/design/generic/loading_widget.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/pages/integration/widgets/integration_account_card.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

class AkahuBankAccount extends IntegrationTarget {
  final AkahuAccount account;

  AkahuBankAccount(this.account, {super.appAccount, super.category, required super.from});
}

class AkahuWidget extends StatefulWidget {
  final AkahuClient? client;

  const AkahuWidget({super.key, this.client});

  @override
  AkahuWidgetState createState() => AkahuWidgetState();
}

class AkahuWidgetState extends State<AkahuWidget> {
  // Banks may change the date of a transaction in the days after it is posted: a repeated import looks back for them
  static const postingDelay = Duration(days: 10);

  late final AkahuClient client;
  late final AkahuSettings settings;
  final appToken = TextEditingController();
  final userToken = TextEditingController();
  AkahuTokens? tokens;
  List<AkahuBankAccount> accounts = [];
  bool isLoading = false;
  String? error;
  String? notice;

  @override
  void initState() {
    super.initState();
    client = widget.client ?? AkahuClient();
    settings = AkahuSettings.load();
    tokens = AkahuSettings.loadTokens();
  }

  @override
  void dispose() {
    appToken.dispose();
    userToken.dispose();
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
    } on AkahuException catch (e) {
      error = e.message;
    } catch (e) {
      error = e.toString();
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  Future<void> connect() => _run(() async {
        var current = tokens;
        if (current == null) {
          final entered = (appToken: appToken.text.trim(), userToken: userToken.text.trim());
          if (entered.appToken.isEmpty || entered.userToken.isEmpty) {
            throw AkahuException(AppLocale.labels.akahuIncomplete);
          }
          current = entered;
        }
        final items = await client.getAccounts(current);
        // Stored only after Akahu has accepted them
        if (tokens == null) {
          await AkahuSettings.saveTokens(current);
          tokens = current;
          appToken.clear();
          userToken.clear();
        }
        final defaultBudget = AppPreferences.get(AppPreferences.prefBudget);
        final monthAgo = DateTime.now().subtract(const Duration(days: 30));
        accounts = items
            .where((account) => account.hasTransactions)
            .map((account) => AkahuBankAccount(
                  account,
                  appAccount: settings.links[account.id],
                  category: defaultBudget,
                  from: settings.imported[account.id] ?? monthAgo,
                ))
            .toList();
        if (accounts.isEmpty) {
          notice = AppLocale.labels.integrationNoAccounts;
        }
      });

  Future<void> refresh() => _run(() async {
        final current = tokens;
        if (current == null) {
          return;
        }
        await client.refresh(current);
        notice = AppLocale.labels.akahuRefreshed;
      });

  Future<void> disconnect() => _run(() async => accounts = []);

  Future<void> forget() => _run(() async {
        await AkahuSettings.clearTokens();
        tokens = null;
        accounts = [];
      });

  String? _budgetOf(AppData state, String name) {
    final value = name.trim().toLowerCase();
    return state
        .getList(AppDataType.budgets, false)
        .whereType<BudgetAppData>()
        .where((e) => e.title.trim().toLowerCase() == value)
        .firstOrNull
        ?.uuid;
  }

  Future<void> importTransactions(AkahuBankAccount item) => _run(() async {
        final current = tokens;
        if (current == null) {
          return;
        }
        if (item.appAccount == null || item.category == null) {
          throw AkahuException(AppLocale.labels.integrationSelectTarget);
        }
        final state = Provider.of<AppData>(context, listen: false);
        final id = item.account.id;
        final last = settings.imported[id];
        final from = last != null && !item.from.isAfter(last) ? item.from.subtract(postingDelay) : item.from;
        final transactions = await client.getTransactions(current, id, from: from);
        var pending = 0;
        try {
          pending = await client.countPending(current, id);
        } on AkahuException {
          // Pending transactions are only reported
        }
        final importer = AkahuImporter(
          exists: (uuid) => state.getByUuid(uuid) != null,
          add: (value, uuid) => TransactionLog.save(state.add(value, uuid)),
          budgetOf: (name) => _budgetOf(state, name),
        );
        final summary = importer.run(
          source: item.account,
          transactions: transactions,
          account: item.appAccount!,
          category: item.category!,
          pending: pending,
          prediction: state.prediction,
        );
        await state.restate();
        final today = DateTime.now();
        settings.links[id] = item.appAccount!;
        settings.imported[id] = DateTime(today.year, today.month, today.day);
        await settings.save();
        notice = AppLocale.labels.integrationImported(summary.added, summary.pending, summary.skipped);
      });

  Widget buildAccount(BuildContext context, AkahuBankAccount item, AppData state) {
    final account = item.account;
    return IntegrationAccountCard(
      title: account.title,
      subtitle: account.balance != null ? '${AppLocale.labels.balance}: ${account.balance} ${account.currency}' : null,
      target: item,
      state: state,
      isDisabled: isLoading,
      onChanged: () => setState(() {}),
      onImport: () => importTransactions(item),
      children: [
        if (!account.isActive)
          Text(
            AppLocale.labels.akahuInactive,
            style: context.textTheme.bodyMedium?.copyWith(color: context.colorScheme.error),
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
          Text(AppLocale.labels.akahuDescription, style: textTheme.bodyMedium),
          ThemeHelper.hIndent2x,
          if (tokens == null) ...[
            Text(AppLocale.labels.akahuSteps, key: const ValueKey('akahu_steps'), style: textTheme.bodyMedium),
            ThemeHelper.hIndent2x,
            InputWrapper.text(
              title: AppLocale.labels.akahuAppToken,
              tooltip: AppLocale.labels.akahuTokenTooltip,
              controller: appToken,
              isRequired: true,
            ),
            InputWrapper.text(
              title: AppLocale.labels.akahuUserToken,
              tooltip: AppLocale.labels.akahuTokenTooltip,
              controller: userToken,
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
            accounts.isEmpty
                ? FullSizedButtonWidget(
                    key: const ValueKey('akahu_connect'),
                    icon: Icons.login,
                    onPressed: connect,
                    title: AppLocale.labels.integrationConnect,
                  )
                : FullSizedButtonWidget(
                    key: const ValueKey('akahu_disconnect'),
                    icon: Icons.logout,
                    onPressed: disconnect,
                    title: AppLocale.labels.integrationDisconnect,
                  ),
            if (tokens != null)
              Wrap(
                alignment: WrapAlignment.end,
                children: [
                  TextButton.icon(
                    key: const ValueKey('akahu_refresh'),
                    icon: const Icon(Icons.sync),
                    onPressed: refresh,
                    label: Text(AppLocale.labels.akahuRefresh),
                  ),
                  TextButton.icon(
                    key: const ValueKey('akahu_forget'),
                    icon: const Icon(Icons.link_off),
                    onPressed: forget,
                    label: Text(AppLocale.labels.integrationForget),
                  ),
                ],
              ),
          ],
          for (final item in accounts) buildAccount(context, item, state),
        ],
      );
    });
  }
}
