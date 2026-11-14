// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:async';

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/fints/fints_importer.dart';
import 'package:app_finance/_classes/integration/fints/fints_settings.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/storage/transaction_log.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/form/list_selector_item.dart';
import 'package:app_finance/design/generic/loading_widget.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/pages/integration/widgets/fints_dialogs.dart';
import 'package:fints/fints.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef FinTsClientFactory = FinTsClient Function(FinTsSettings settings, String pin, FinTsClientOptions options);

class FinTsBankAccount {
  final Account account;
  final String key;
  Balance? balance;
  String? appAccount;
  String? category;
  DateTime from;

  FinTsBankAccount(this.account, {this.appAccount, this.category, required this.from})
      : key = FinTsSettings.accountKey(account);

  String get title {
    final name = account.productName ?? account.ownerName ?? '';
    final number = account.iban ?? account.accountNumber ?? '';
    final masked = number.length > 4 ? '…${number.substring(number.length - 4)}' : number;
    return [name, masked].where((e) => e.isNotEmpty).join(' ');
  }
}

class FinTsWidget extends StatefulWidget {
  final FinTsClientFactory? clientFactory;
  final bool isWeb;

  const FinTsWidget({super.key, this.clientFactory, this.isWeb = kIsWeb});

  @override
  FinTsWidgetState createState() => FinTsWidgetState();
}

class FinTsWidgetState extends State<FinTsWidget> {
  late final FinTsSettings settings;
  late final FinTsDialogs dialogs;
  late final TextEditingController url;
  late final TextEditingController bankCode;
  late final TextEditingController userId;
  late final TextEditingController customerId;
  late final TextEditingController productId;
  FinTsClient? client;
  List<FinTsBankAccount> accounts = [];
  bool isLoading = false;
  String? error;
  String? notice;

  @override
  void initState() {
    super.initState();
    settings = FinTsSettings.load();
    dialogs = FinTsDialogs(() => context);
    url = TextEditingController(text: settings.url);
    bankCode = TextEditingController(text: settings.bankCode);
    userId = TextEditingController(text: settings.userId);
    customerId = TextEditingController(text: settings.customerId);
    productId = TextEditingController(text: settings.productId);
  }

  @override
  void dispose() {
    unawaited(_close());
    for (final controller in [url, bankCode, userId, customerId, productId]) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _close() async {
    final current = client;
    client = null;
    if (current == null) {
      return;
    }
    try {
      await current.close();
    } finally {
      await FinTsSettings.saveState(current.state);
    }
  }

  FinTsClient _createClient(String pin) {
    final options = FinTsClientOptions(
      state: FinTsSettings.loadState(),
      tanCallback: dialogs.askTan,
      tanMethodSelector: dialogs.selectTanMethod,
      tanMediumSelector: dialogs.selectTanMedium,
      onBankMessage: (message) => _notify('${message.subject}: ${message.text}'),
      onWarning: (warning) => _notify('${warning.code}: ${warning.text}'),
    );
    return widget.clientFactory?.call(settings, pin, options) ??
        FinTs4Client(config: settings.toConfig(), pin: pin, options: options, namespaces: settings.namespace);
  }

  void _notify(String text) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text), duration: const Duration(seconds: 8)));
    }
  }

  Future<void> _run(Future<void> Function() callback) async {
    setState(() {
      isLoading = true;
      error = null;
      notice = null;
    });
    try {
      await callback();
    } on FinTsLoginDataChangedException catch (e) {
      error = AppLocale.labels.finTsLoginChanged(e.message);
      await _close();
    } on FinTsException catch (e) {
      error = e.message;
    } on ArgumentError catch (e) {
      error = e.message?.toString() ?? e.toString();
    } catch (e) {
      error = e.toString();
    } finally {
      final current = client;
      if (current != null) {
        await FinTsSettings.saveState(current.state);
      }
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  Future<void> saveSettings() async {
    settings
      ..url = url.text.trim()
      ..bankCode = bankCode.text.trim()
      ..userId = userId.text.trim()
      ..customerId = customerId.text.trim()
      ..productId = productId.text.trim();
    await settings.save();
  }

  Future<void> connect() => _run(() async {
        await saveSettings();
        if (!settings.isComplete) {
          throw ArgumentError(AppLocale.labels.finTsIncomplete);
        }
        settings.toConfig();
        final pin = await dialogs.askPin();
        if (pin == null) {
          return;
        }
        await _close();
        final current = _createClient(pin);
        final refusal = current.loginRefusal;
        if (refusal is FinTsLoginDataChangedException) {
          throw refusal;
        } else if (refusal != null) {
          if (!await dialogs.confirm(AppLocale.labels.finTsLoginRefused(refusal.message))) {
            await current.close();
            return;
          }
          await current.clearLoginRefusal(pin);
        }
        client = current;
        final list = await current.getAccounts();
        final defaultBudget = AppPreferences.get(AppPreferences.prefBudget);
        final monthAgo = DateTime.now().subtract(const Duration(days: 30));
        accounts = list.map((account) {
          final key = FinTsSettings.accountKey(account);
          return FinTsBankAccount(
            account,
            appAccount: settings.links[key],
            category: defaultBudget,
            from: settings.imported[key] ?? monthAgo,
          );
        }).toList();
        for (final item in accounts) {
          try {
            item.balance = await current.getBalance(item.account);
          } on FinTsUnsupportedException {
            // The bank offers no balance for this account
          }
        }
        if (accounts.isEmpty) {
          notice = AppLocale.labels.finTsNoAccounts;
        }
      });

  Future<void> disconnect() => _run(() async {
        await _close();
        accounts = [];
      });

  Future<void> importTransactions(FinTsBankAccount item) => _run(() async {
        final current = client;
        if (current == null) {
          return;
        }
        if (item.appAccount == null || item.category == null) {
          throw ArgumentError(AppLocale.labels.finTsSelectTarget);
        }
        final state = Provider.of<AppData>(context, listen: false);
        List<Transaction> transactions;
        try {
          transactions = await current.getTransactions(item.account, from: item.from);
        } on FinTsIncompleteResultException<List<Transaction>> catch (e) {
          transactions = e.partialResult ?? const [];
          _notify(e.feedback.map((f) => '${f.code}: ${f.text}').join('\n'));
        }
        final importer = FinTsImporter(
          exists: (uuid) => state.getByUuid(uuid) != null,
          add: (value, uuid) => TransactionLog.save(state.add(value, uuid)),
        );
        final result = importer.run(
          accountKey: item.key,
          transactions: transactions,
          account: item.appAccount!,
          category: item.category!,
        );
        await state.restate();
        final today = DateTime.now();
        settings.links[item.key] = item.appAccount!;
        settings.imported[item.key] = DateTime(today.year, today.month, today.day);
        await settings.save();
        notice = AppLocale.labels.finTsImported(result.added, result.pending, result.skipped);
      });

  Widget buildSettings(BuildContext context) {
    final isConnected = client != null;
    return Column(
      crossAxisAlignment: AppDesign.getAlignment(),
      children: [
        InputWrapper.text(
          title: AppLocale.labels.finTsUrl,
          tooltip: 'https://…',
          controller: url,
          isRequired: true,
          isDisabled: isConnected,
          inputType: TextInputType.url,
        ),
        InputWrapper.text(
          title: AppLocale.labels.finTsBankCode,
          controller: bankCode,
          isRequired: true,
          isDisabled: isConnected,
          inputType: TextInputType.number,
        ),
        InputWrapper.text(
          title: AppLocale.labels.finTsUserId,
          controller: userId,
          isRequired: true,
          isDisabled: isConnected,
        ),
        InputWrapper.text(
          title: AppLocale.labels.finTsCustomerId,
          controller: customerId,
          isDisabled: isConnected,
        ),
        InputWrapper.text(
          title: AppLocale.labels.finTsProductId,
          tooltip: AppLocale.labels.finTsProductIdTooltip,
          controller: productId,
          isRequired: true,
          isDisabled: isConnected,
        ),
        InputWrapper.select(
          title: AppLocale.labels.finTsVersion,
          value: settings.version,
          isDisabled: isConnected,
          options: <ListSelectorItem>[
            for (final version in FinTsSettings.namespaces.keys) ListSelectorItem(id: version, name: 'FinTS $version'),
          ],
          onChange: (value) => setState(() => settings.version = value ?? settings.version),
        ),
      ],
    );
  }

  Widget buildAccount(BuildContext context, FinTsBankAccount item, AppData state) {
    final textTheme = context.textTheme;
    final balance = item.balance?.booked;
    return Card(
      margin: EdgeInsets.symmetric(vertical: ThemeHelper.getIndent()),
      child: Padding(
        padding: EdgeInsets.all(ThemeHelper.getIndent(2)),
        child: LayoutBuilder(
          builder: (context, constraints) => Column(
            crossAxisAlignment: AppDesign.getAlignment(),
            children: [
              Text(item.title, style: textTheme.titleMedium),
              if (balance != null) Text('${AppLocale.labels.balance}: ${balance.value} ${balance.currency}'),
              ThemeHelper.hIndent,
              InputWrapper(
                type: NamedInputType.accountSelector,
                title: AppLocale.labels.account,
                isRequired: true,
                value: item.appAccount != null ? state.getByUuid(item.appAccount!) : null,
                onChange: (value) => setState(() => item.appAccount = value?.uuid),
                state: state,
                width: constraints.maxWidth,
              ),
              InputWrapper(
                type: NamedInputType.budgetSelector,
                title: AppLocale.labels.budget,
                isRequired: true,
                value: item.category != null ? state.getByUuid(item.category!) : null,
                onChange: (value) => setState(() => item.category = value?.uuid),
                state: state,
                width: constraints.maxWidth,
              ),
              InputWrapper(
                type: NamedInputType.dateSelector,
                title: AppLocale.labels.finTsDateFrom,
                value: item.from,
                onChange: (value) => setState(() => item.from = value ?? item.from),
              ),
              ThemeHelper.hIndent,
              SizedBox(
                width: double.infinity,
                child: FilledButton.icon(
                  icon: const Icon(Icons.download),
                  onPressed: isLoading ? null : () => importTransactions(item),
                  label: Text(AppLocale.labels.finTsImport),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    if (widget.isWeb) {
      return Text(AppLocale.labels.finTsWebUnsupported, style: textTheme.bodyLarge);
    }
    return Consumer<AppData>(builder: (context, state, _) {
      return Column(
        crossAxisAlignment: AppDesign.getAlignment(),
        children: [
          Text(AppLocale.labels.finTsDescription, style: textTheme.bodyMedium),
          ThemeHelper.hIndent2x,
          buildSettings(context),
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
          else
            SizedBox(
              width: double.infinity,
              child: client == null
                  ? FilledButton.icon(
                      key: const ValueKey('fints_connect'),
                      icon: const Icon(Icons.login),
                      onPressed: connect,
                      label: Text(AppLocale.labels.finTsConnect),
                    )
                  : OutlinedButton.icon(
                      key: const ValueKey('fints_disconnect'),
                      icon: const Icon(Icons.logout),
                      onPressed: disconnect,
                      label: Text(AppLocale.labels.finTsDisconnect),
                    ),
            ),
          for (final item in accounts) buildAccount(context, item, state),
        ],
      );
    });
  }
}
