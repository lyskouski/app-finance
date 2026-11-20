// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/monobank/monobank_client.dart';
import 'package:app_finance/_classes/integration/monobank/monobank_importer.dart';
import 'package:app_finance/_classes/integration/monobank/monobank_settings.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/storage/transaction_log.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_classes/structure/bill_app_data.dart';
import 'package:app_finance/_configs/account_type.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/design/generic/loading_widget.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/pages/integration/widgets/integration_account_card.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

class MonobankBankAccount extends IntegrationTarget {
  final MonobankAccount account;

  MonobankBankAccount(this.account, {super.appAccount, super.category, required super.from});

  String get title {
    final source = account;
    if (source.isJar) {
      return [AppLocale.labels.monobankJar, source.title ?? ''].where((e) => e.isNotEmpty).join(': ');
    }
    final type = source.type.isNotEmpty ? '${source.type[0].toUpperCase()}${source.type.substring(1)}' : '';
    final pan = source.maskedPan.isNotEmpty ? source.maskedPan.first : (source.iban ?? '');
    return [type, pan, source.currency].where((e) => e.isNotEmpty).join(' — ');
  }

  String get accountType {
    if (account.isJar) {
      return AppAccountType.deposit.toString();
    }
    if (account.type == 'fop') {
      return AppAccountType.account.toString();
    }
    return (account.creditLimit > 0 ? AppAccountType.creditCard : AppAccountType.debitCard).toString();
  }
}

class MonobankWidget extends StatefulWidget {
  final MonobankClient? client;

  const MonobankWidget({super.key, this.client});

  @override
  MonobankWidgetState createState() => MonobankWidgetState();
}

class MonobankWidgetState extends State<MonobankWidget> {
  late final MonobankClient client;
  late final MonobankSettings settings;
  final token = TextEditingController();
  String? access;
  List<MonobankBankAccount> accounts = [];
  bool isLoading = false;
  String? error;
  String? notice;
  MonobankCancelToken? cancelToken;
  String? progress;
  double? progressValue;

  @override
  void initState() {
    super.initState();
    client = widget.client ?? MonobankClient();
    settings = MonobankSettings.load();
    access = MonobankSettings.loadToken();
  }

  @override
  void dispose() {
    cancelToken?.cancel();
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
      progress = null;
      progressValue = null;
    });
    try {
      await callback();
    } on MonobankCanceledException {
      // Already imported windows are kept
    } on MonobankException catch (e) {
      error = e.message;
    } catch (e) {
      error = e.toString();
    } finally {
      cancelToken = null;
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  void _progress(int done, int total, Duration? wait) {
    if (!mounted) {
      return;
    }
    setState(() {
      progressValue = total > 0 ? done / total : null;
      progress = [
        AppLocale.labels.monobankProgress(done, total),
        if (wait != null) AppLocale.labels.monobankRateLimit(wait.inSeconds),
      ].join('\n');
    });
  }

  void cancel() => cancelToken?.cancel();

  Future<void> connect() => _run(() async {
        final value = access ?? token.text.trim();
        if (value.isEmpty) {
          throw MonobankException(AppLocale.labels.monobankToken);
        }
        cancelToken = MonobankCancelToken();
        final info = await client.getClientInfo(value, cancel: cancelToken);
        if (access == null) {
          await MonobankSettings.saveToken(value);
          token.clear();
          access = value;
        }
        final defaultBudget = AppPreferences.get(AppPreferences.prefBudget);
        final monthAgo = DateTime.now().subtract(const Duration(days: 30));
        accounts = info.accounts
            .map((account) => MonobankBankAccount(
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

  Future<void> disconnect() => _run(() async => accounts = []);

  Future<void> forget() => _run(() async {
        await MonobankSettings.clearToken();
        access = null;
        accounts = [];
      });

  Future<void> createAccount(MonobankBankAccount item) => _run(() async {
        final state = Provider.of<AppData>(context, listen: false);
        final currency = CurrencyProvider.find(item.account.currency);
        final created = state.add(AccountAppData(
          title: item.title,
          type: item.accountType,
          details: item.account.amount,
          progress: 1.0,
          currency: currency,
          hidden: false,
        )) as AccountAppData;
        item.appAccount = created.uuid;
        settings.links[item.account.id] = created.uuid!;
        await settings.save();
      });

  Future<void> importTransactions(MonobankBankAccount item) => _run(() async {
        final current = access;
        if (current == null) {
          return;
        }
        if (item.appAccount == null || item.category == null) {
          throw MonobankException(AppLocale.labels.integrationSelectTarget);
        }
        final state = Provider.of<AppData>(context, listen: false);
        final id = item.account.id;
        final importer = MonobankImporter(
          exists: (uuid) => state.getByUuid(uuid) != null,
          add: (value, uuid) => TransactionLog.save(state.add(value, uuid)),
          categories: MonobankImporter.learn(settings.records, (uuid) {
            final bill = state.getByUuid(uuid);
            return bill is BillAppData && !bill.hidden ? bill.category : null;
          }),
        );
        var added = 0;
        var skipped = 0;
        var pending = 0;
        settings.links[id] = item.appAccount!;
        cancelToken = MonobankCancelToken();
        try {
          await client.getTransactions(
            current,
            id,
            from: item.from,
            cancel: cancelToken,
            onProgress: _progress,
            onWindow: (window, transactions) {
              final summary = importer.run(
                id: id,
                transactions: transactions,
                account: item.appAccount!,
                category: item.category!,
                currency: item.account.currency,
                prediction: state.prediction,
              );
              added += summary.added;
              skipped += summary.skipped;
              pending += summary.pending;
              // Transactions on hold are requested again on the next import
              final since = importer.pendingSince;
              final last = since != null && since.isBefore(window.to) ? since : window.to;
              settings.imported[id] = DateTime(last.year, last.month, last.day);
            },
          );
        } finally {
          settings.addRecords(importer.records);
          await settings.save();
          item.from = settings.imported[id] ?? item.from;
          await state.restate();
          notice = AppLocale.labels.integrationImported(added, pending, skipped);
        }
      });

  Widget buildAccount(BuildContext context, MonobankBankAccount item, AppData state) {
    final source = item.account;
    return IntegrationAccountCard(
      key: ValueKey('monobank_${source.id}'),
      title: item.title,
      subtitle: [
        '${AppLocale.labels.balance}: ${source.amount} ${source.currency}',
        if (source.creditLimit > 0) '${AppLocale.labels.creditCard}: ${source.limit} ${source.currency}',
      ].join('\n'),
      target: item,
      state: state,
      isDisabled: isLoading,
      onChanged: () => setState(() {}),
      onImport: () => importTransactions(item),
      children: [
        if (item.appAccount == null || state.getByUuid(item.appAccount!) == null)
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              key: ValueKey('monobank_create_${source.id}'),
              icon: const Icon(Icons.add),
              onPressed: isLoading ? null : () => createAccount(item),
              label: Text(AppLocale.labels.monobankCreateAccount),
            ),
          ),
      ],
    );
  }

  Widget buildProgress(BuildContext context) {
    final textTheme = context.textTheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        if (progress != null) ...[
          Text(progress!, key: const ValueKey('monobank_progress'), style: textTheme.bodyMedium),
          ThemeHelper.hIndent,
          LinearProgressIndicator(value: progressValue),
        ] else
          const Center(child: LoadingWidget(isLoading: true, size: Size(48, 48))),
        if (cancelToken != null)
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              key: const ValueKey('monobank_cancel'),
              icon: const Icon(Icons.close),
              onPressed: cancel,
              label: Text(AppLocale.labels.btnCancel),
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
          Text(AppLocale.labels.monobankDescription, style: textTheme.bodyMedium),
          ThemeHelper.hIndent2x,
          if (access == null) ...[
            Text(AppLocale.labels.monobankTokenSteps,
                key: const ValueKey('monobank_steps'), style: textTheme.bodyMedium),
            ThemeHelper.hIndent2x,
            InputWrapper.text(
              title: AppLocale.labels.monobankToken,
              tooltip: AppLocale.labels.monobankTokenTooltip,
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
            buildProgress(context)
          else ...[
            accounts.isEmpty
                ? FullSizedButtonWidget(
                    key: const ValueKey('monobank_connect'),
                    icon: Icons.login,
                    onPressed: connect,
                    title: AppLocale.labels.integrationConnect,
                  )
                : FullSizedButtonWidget(
                    key: const ValueKey('monobank_disconnect'),
                    icon: Icons.logout,
                    onPressed: disconnect,
                    title: AppLocale.labels.integrationDisconnect,
                  ),
            if (access != null)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  key: const ValueKey('monobank_forget'),
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
