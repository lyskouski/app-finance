// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/starling/starling_client.dart';
import 'package:app_finance/_classes/integration/starling/starling_importer.dart';
import 'package:app_finance/_classes/integration/starling/starling_settings.dart';
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

class StarlingBankAccount extends IntegrationTarget {
  final StarlingAccount account;
  StarlingAmount? balance;

  StarlingBankAccount(this.account, {super.appAccount, super.category, required super.from});
}

class StarlingWidget extends StatefulWidget {
  final StarlingClient? client;

  const StarlingWidget({super.key, this.client});

  @override
  StarlingWidgetState createState() => StarlingWidgetState();
}

class StarlingWidgetState extends State<StarlingWidget> {
  // Pending transactions keep their date when settled: a repeated import looks back for them
  static const settlementDelay = Duration(days: 10);

  late final StarlingClient client;
  late final StarlingSettings settings;
  final token = TextEditingController();
  String? access;
  List<StarlingBankAccount> accounts = [];
  bool isLoading = false;
  String? error;
  String? notice;

  @override
  void initState() {
    super.initState();
    client = widget.client ?? StarlingClient();
    settings = StarlingSettings.load();
    access = StarlingSettings.loadToken();
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
    } on StarlingException catch (e) {
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
        final value = access ?? token.text.trim();
        if (value.isEmpty) {
          throw StarlingException(AppLocale.labels.starlingToken);
        }
        final items = await client.getAccounts(value);
        // Stored only after Starling has accepted it
        if (access == null) {
          await StarlingSettings.saveToken(value);
          token.clear();
          access = value;
        }
        final defaultBudget = AppPreferences.get(AppPreferences.prefBudget);
        final monthAgo = DateTime.now().subtract(const Duration(days: 30));
        accounts = items
            .map((account) => StarlingBankAccount(
                  account,
                  appAccount: settings.links[account.id],
                  category: defaultBudget,
                  from: settings.imported[account.id] ?? monthAgo,
                ))
            .toList();
        for (final item in accounts) {
          try {
            item.balance = await client.getBalance(value, item.account.id);
          } on StarlingException {
            // The balance is optional for the import (e.g. without the scope "balance:read")
          }
        }
        if (accounts.isEmpty) {
          notice = AppLocale.labels.integrationNoAccounts;
        }
      });

  Future<void> disconnect() => _run(() async => accounts = []);

  Future<void> forget() => _run(() async {
        await StarlingSettings.clearToken();
        access = null;
        accounts = [];
      });

  Future<void> importTransactions(StarlingBankAccount item) => _run(() async {
        final current = access;
        if (current == null) {
          return;
        }
        if (item.appAccount == null || item.category == null) {
          throw StarlingException(AppLocale.labels.integrationSelectTarget);
        }
        final state = Provider.of<AppData>(context, listen: false);
        final id = item.account.id;
        final last = settings.imported[id];
        final from = last != null && !item.from.isAfter(last) ? item.from.subtract(settlementDelay) : item.from;
        final items = await client.getFeed(current, item.account, from: from);
        final importer = StarlingImporter(
          exists: (uuid) => state.getByUuid(uuid) != null,
          add: (value, uuid) => TransactionLog.save(state.add(value, uuid)),
        );
        final summary = importer.run(
          accountId: id,
          items: items,
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

  Widget buildAccount(BuildContext context, StarlingBankAccount item, AppData state) {
    final balance = item.balance;
    return IntegrationAccountCard(
      title: item.account.title,
      subtitle: balance != null ? '${AppLocale.labels.balance}: ${balance.value} ${balance.currency}' : null,
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
          Text(AppLocale.labels.starlingDescription, style: textTheme.bodyMedium),
          ThemeHelper.hIndent2x,
          if (access == null) ...[
            Text(AppLocale.labels.starlingTokenSteps,
                key: const ValueKey('starling_steps'), style: textTheme.bodyMedium),
            ThemeHelper.hIndent2x,
            InputWrapper.text(
              title: AppLocale.labels.starlingToken,
              tooltip: AppLocale.labels.starlingTokenTooltip,
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
            accounts.isEmpty
                ? FullSizedButtonWidget(
                    key: const ValueKey('starling_connect'),
                    icon: Icons.login,
                    onPressed: connect,
                    title: AppLocale.labels.integrationConnect,
                  )
                : FullSizedButtonWidget(
                    key: const ValueKey('starling_disconnect'),
                    icon: Icons.logout,
                    onPressed: disconnect,
                    title: AppLocale.labels.integrationDisconnect,
                  ),
            if (access != null)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  key: const ValueKey('starling_forget'),
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
