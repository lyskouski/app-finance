// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/wise/wise_client.dart';
import 'package:app_finance/_classes/integration/wise/wise_importer.dart';
import 'package:app_finance/_classes/integration/wise/wise_settings.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/storage/transaction_log.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/design/form/list_selector_item.dart';
import 'package:app_finance/design/generic/loading_widget.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/pages/integration/widgets/integration_account_card.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

class WiseBankAccount extends IntegrationTarget {
  final WiseBalance balance;

  WiseBankAccount(this.balance, {super.appAccount, super.category, required super.from});

  String get title => [balance.currency, balance.name ?? ''].where((e) => e.isNotEmpty).join(' — ');
}

class WiseWidget extends StatefulWidget {
  final WiseClient? client;

  const WiseWidget({super.key, this.client});

  @override
  WiseWidgetState createState() => WiseWidgetState();
}

class WiseWidgetState extends State<WiseWidget> {
  late final WiseClient client;
  late final WiseSettings settings;
  final token = TextEditingController();
  String? access;
  List<WiseProfile> profiles = [];
  List<WiseBankAccount> accounts = [];
  bool isLoading = false;
  String? error;
  String? notice;

  @override
  void initState() {
    super.initState();
    client = widget.client ?? WiseClient();
    settings = WiseSettings.load();
    access = WiseSettings.loadToken();
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
    } on WiseException catch (e) {
      error = e.message;
    } catch (e) {
      error = e.toString();
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  Future<void> _loadBalances() async {
    final profile = settings.profile;
    if (access == null || profile == null) {
      return;
    }
    final balances = await client.getBalances(access!, profile);
    final defaultBudget = AppPreferences.get(AppPreferences.prefBudget);
    final monthAgo = DateTime.now().subtract(const Duration(days: 30));
    accounts = balances
        .map((balance) => WiseBankAccount(
              balance,
              appAccount: settings.links['${balance.id}'],
              category: defaultBudget,
              from: settings.imported['${balance.id}'] ?? monthAgo,
            ))
        .toList();
    if (accounts.isEmpty) {
      notice = AppLocale.labels.integrationNoAccounts;
    }
  }

  Future<void> connect() => _run(() async {
        final value = access ?? token.text.trim();
        if (value.isEmpty) {
          throw WiseException(AppLocale.labels.wiseToken);
        }
        profiles = await client.getProfiles(value);
        if (access == null) {
          await WiseSettings.saveToken(value);
          token.clear();
          access = value;
        }
        if (profiles.isEmpty) {
          notice = AppLocale.labels.wiseNoProfiles;
          return;
        }
        if (!profiles.any((e) => e.id == settings.profile)) {
          settings.profile = profiles.first.id;
          await settings.save();
        }
        await _loadBalances();
      });

  Future<void> selectProfile(String? value) => _run(() async {
        final profile = int.tryParse(value ?? '');
        if (profile == null || profile == settings.profile) {
          return;
        }
        settings.profile = profile;
        await settings.save();
        accounts = [];
        await _loadBalances();
      });

  Future<void> disconnect() => _run(() async {
        profiles = [];
        accounts = [];
      });

  Future<void> forget() => _run(() async {
        await WiseSettings.clearToken();
        access = null;
        profiles = [];
        accounts = [];
      });

  Map<String, WiseCounterpart> _counterparts(WiseBankAccount item) => {
        for (final other in accounts)
          if (other != item && other.appAccount != null)
            other.balance.currency: (balanceId: '${other.balance.id}', account: other.appAccount!),
      };

  Future<void> importTransactions(WiseBankAccount item) => _run(() async {
        final current = access;
        final profile = settings.profile;
        if (current == null || profile == null) {
          return;
        }
        if (item.appAccount == null || item.category == null) {
          throw WiseException(AppLocale.labels.integrationSelectTarget);
        }
        final state = Provider.of<AppData>(context, listen: false);
        final transactions = await client.getStatement(
          current,
          profileId: profile,
          balance: item.balance,
          start: item.from,
        );
        final importer = WiseImporter(
          exists: (uuid) => state.getByUuid(uuid) != null,
          add: (value, uuid) => TransactionLog.save(state.add(value, uuid)),
          setRate: (rate) {
            state.update(rate.uuid, rate, true);
            TransactionLog.save(rate);
          },
        );
        final summary = importer.run(
          profileId: profile,
          balance: item.balance,
          transactions: transactions,
          account: item.appAccount!,
          category: item.category!,
          counterparts: _counterparts(item),
        );
        await state.restate();
        final today = DateTime.now();
        final id = '${item.balance.id}';
        settings.links[id] = item.appAccount!;
        settings.imported[id] = DateTime(today.year, today.month, today.day);
        await settings.save();
        notice = AppLocale.labels.integrationImported(summary.added, summary.pending, summary.skipped);
      });

  Widget buildAccount(BuildContext context, WiseBankAccount item, AppData state) {
    final balance = item.balance;
    return IntegrationAccountCard(
      title: item.title,
      subtitle: '${AppLocale.labels.balance}: ${balance.amount} ${balance.currency}',
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
          Text(AppLocale.labels.wiseDescription, style: textTheme.bodyMedium),
          ThemeHelper.hIndent2x,
          if (access == null) ...[
            Text(AppLocale.labels.wiseTokenSteps, key: const ValueKey('wise_steps'), style: textTheme.bodyMedium),
            ThemeHelper.hIndent2x,
          ],
          if (access == null)
            InputWrapper.text(
              title: AppLocale.labels.wiseToken,
              tooltip: AppLocale.labels.wiseTokenTooltip,
              controller: token,
              isRequired: true,
            ),
          if (profiles.length > 1)
            InputWrapper.select(
              title: AppLocale.labels.wiseProfile,
              value: settings.profile?.toString(),
              isRequired: true,
              options: <ListSelectorItem>[
                for (final profile in profiles) ListSelectorItem(id: '${profile.id}', name: profile.title),
              ],
              onChange: selectProfile,
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
            profiles.isEmpty
                ? FullSizedButtonWidget(
                    key: const ValueKey('wise_connect'),
                    icon: Icons.login,
                    onPressed: connect,
                    title: AppLocale.labels.integrationConnect,
                  )
                : FullSizedButtonWidget(
                    key: const ValueKey('wise_disconnect'),
                    icon: Icons.logout,
                    onPressed: disconnect,
                    title: AppLocale.labels.integrationDisconnect,
                  ),
            if (access != null)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  key: const ValueKey('wise_forget'),
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
