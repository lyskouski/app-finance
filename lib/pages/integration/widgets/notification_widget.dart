// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/notification/notification_channel.dart';
import 'package:app_finance/_classes/integration/notification/notification_controller.dart';
import 'package:app_finance/_classes/integration/notification/notification_parser.dart';
import 'package:app_finance/_classes/integration/notification/notification_settings.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/design/form/tags_input.dart';
import 'package:app_finance/design/generic/loading_widget.dart';
import 'package:app_finance/design/wrapper/input_wrapper.dart';
import 'package:app_finance/pages/integration/widgets/integration_account_card.dart';
import 'package:flutter/services.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';

class NotificationSource extends IntegrationTarget {
  final String package;
  final String label;
  Currency? currency;

  NotificationSource(
    this.package,
    this.label, {
    super.appAccount,
    super.category,
    required super.from,
    this.currency,
  });

  NotificationApp toLink() => NotificationApp(
        account: appAccount,
        category: category,
        currency: currency?.code,
      );
}

class NotificationWidget extends StatefulWidget {
  final NotificationChannel channel;

  const NotificationWidget({super.key, this.channel = const NotificationChannel()});

  @override
  NotificationWidgetState createState() => NotificationWidgetState();
}

class NotificationWidgetState extends State<NotificationWidget> with WidgetsBindingObserver {
  late final NotificationSettings settings;
  // Parsing options shared by all apps
  late final ValueNotifier<List<String>> income;
  late final ValueNotifier<List<String>> balance;
  // Keywords recognizing the account of a transaction instead of the default one
  final Map<String, ValueNotifier<List<String>>> accounts = {};
  bool isGranted = false;
  bool isLoading = false;
  Map<String, String> apps = {};
  Set<String> packages = {};
  List<NotificationRecord> records = [];
  final Map<String, NotificationSource> sources = {};
  String? error;

  NotificationChannel get channel => widget.channel;

  NotificationController get controller => NotificationController.instance;

  @override
  void initState() {
    super.initState();
    settings = NotificationSettings.load();
    income = ValueNotifier([...settings.income])..addListener(persistKeywords);
    balance = ValueNotifier([...settings.balance])..addListener(persistKeywords);
    WidgetsBinding.instance.addObserver(this);
    controller.revision.addListener(refresh);
    refresh();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    controller.revision.removeListener(refresh);
    income.dispose();
    balance.dispose();
    for (final item in accounts.values) {
      item.dispose();
    }
    super.dispose();
  }

  // The access is granted in the system settings, outside of the application
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      refresh();
    }
  }

  Future<void> _run(Future<void> Function() callback) async {
    if (!mounted) {
      return;
    }
    setState(() {
      isLoading = true;
      error = null;
    });
    try {
      await callback();
    } on PlatformException catch (e) {
      error = e.message ?? e.code;
    } on MissingPluginException {
      isGranted = false;
    } catch (e) {
      error = e.toString();
    } finally {
      if (mounted) {
        setState(() => isLoading = false);
      }
    }
  }

  NotificationSource source(String package) => sources.putIfAbsent(package, () {
        final link = settings.get(package);
        return NotificationSource(
          package,
          apps[package] ?? package,
          appAccount: link.account,
          category: link.category ?? AppPreferences.get(AppPreferences.prefBudget),
          from: DateTime.now().subtract(const Duration(days: 30)),
          currency: link.currency != null ? CurrencyProvider.find(link.currency!) : null,
        );
      });

  Future<void> persist(String package) async {
    final item = sources[package];
    if (item == null) {
      return;
    }
    settings.apps[package] = item.toLink();
    await settings.save();
    await controller.syncAutoPackages();
    await importLinked();
  }

  // Recognized notifications of linked apps are imported right away, the rest wait for adjusted settings
  Future<void> importLinked() async {
    if (!mounted || !settings.apps.values.any((e) => e.isLinked)) {
      return;
    }
    controller.attach(Provider.of<AppData>(context, listen: false));
    await controller.run();
  }

  ValueNotifier<List<String>> accountKeywords(String uuid) => accounts.putIfAbsent(
        uuid,
        () => ValueNotifier([...?settings.accounts[uuid]])..addListener(persistKeywords),
      );

  Listenable get keywords => Listenable.merge([income, balance, ...accounts.values]);

  Future<void> persistKeywords() async {
    settings
      ..income = [...income.value]
      ..balance = [...balance.value];
    accounts.forEach((uuid, item) => settings.accounts[uuid] = [...item.value]);
    await settings.save();
    await importLinked();
  }

  Future<void> refresh() => _run(() async {
        isGranted = await channel.isGranted();
        if (!isGranted) {
          return;
        }
        apps = await channel.getApps();
        packages = await channel.getPackages();
        records = await channel.getNotifications();
      });

  Future<void> grant() => _run(() => channel.openSettings());

  Future<void> toggle(String package, bool isSelected) => _run(() async {
        final scope = {...packages};
        isSelected ? scope.add(package) : scope.remove(package);
        await channel.setPackages(scope);
        packages = scope;
        records = await channel.getNotifications();
      });

  Future<void> clear(NotificationSource item) => _run(() async {
        await channel.removeNotifications(records.where((e) => e.package == item.package).map((e) => e.id));
        records = await channel.getNotifications();
      });

  Widget buildPreview(BuildContext context, NotificationSource item, List<NotificationRecord> scope, AppData state) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        for (final record in scope.reversed.take(3))
          Builder(builder: (context) {
            // The same order of currencies as by the import: recognized account, app, default account
            final recognized = NotificationParser.toAccount('${record.title}\n${record.text}', settings.accounts);
            final uuid = recognized ?? item.appAccount;
            final account = uuid != null ? state.getByUuid(uuid) : null;
            final defaultAccount = item.appAccount != null ? state.getByUuid(item.appAccount!) : null;
            final parsed = NotificationParser.parse(
              record.title,
              record.text,
              fallback: (recognized != null && account is AccountAppData ? account.currency : null) ??
                  item.currency ??
                  (defaultAccount is AccountAppData ? defaultAccount.currency : null),
              isBare: item.currency != null,
              income: income.value,
              balance: balance.value,
            );
            return ListTile(
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: Icon(
                parsed != null ? Icons.check_circle_outline : Icons.help_outline,
                color: parsed != null ? colorScheme.primary : colorScheme.error,
              ),
              title: Text(
                parsed != null
                    ? '${parsed.amount} ${parsed.currency ?? ''} — ${parsed.title}'
                        '${account is AccountAppData ? ' → ${account.title}' : ''}'
                    : AppLocale.labels.notificationUnparsed,
                style: textTheme.bodyMedium,
              ),
              subtitle: Text(
                NotificationParser.toLine([record.title, record.text].where((e) => e.isNotEmpty).join(': ')),
                style: textTheme.bodySmall,
              ),
            );
          }),
      ],
    );
  }

  // Keywords are matched case-insensitively
  static String _normalize(String value) => value.trim().toLowerCase();

  Widget buildSource(BuildContext context, NotificationSource item, AppData state) {
    final scope = records.where((e) => e.package == item.package).toList();
    return IntegrationAccountCard(
      key: ValueKey('notification_${item.package}'),
      title: item.label,
      subtitle: AppLocale.labels.notificationCaptured(scope.length),
      accountTitle: AppLocale.labels.notificationDefaultAccount,
      target: item,
      state: state,
      onChanged: () {
        setState(() {});
        persist(item.package);
      },
      children: [
        InputWrapper.currency(
          key: ValueKey('notification_currency_${item.package}'),
          title: AppLocale.labels.currencyDefault,
          tooltip: AppLocale.labels.notificationCurrencyTooltip,
          value: item.currency,
          onChange: (value) {
            setState(() => item.currency = value);
            persist(item.package);
          },
        ),
        Text(AppLocale.labels.notificationAutoTooltip, style: context.textTheme.bodySmall),
        ListenableBuilder(
          listenable: keywords,
          builder: (context, _) => buildPreview(context, item, scope, state),
        ),
        if (scope.isNotEmpty)
          Align(
            alignment: Alignment.centerRight,
            child: TextButton.icon(
              icon: const Icon(Icons.delete_sweep_outlined),
              onPressed: isLoading ? null : () => clear(item),
              label: Text(AppLocale.labels.notificationClear),
            ),
          ),
      ],
    );
  }

  List<MapEntry<String, String>> _sortedApps() => apps.entries.toList()
    ..sort((a, b) {
      final selected = (packages.contains(a.key) ? 0 : 1) - (packages.contains(b.key) ? 0 : 1);
      return selected != 0 ? selected : a.value.toLowerCase().compareTo(b.value.toLowerCase());
    });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    final colorScheme = context.colorScheme;
    return Consumer<AppData>(builder: (context, state, _) {
      return Column(
        crossAxisAlignment: AppDesign.getAlignment(),
        children: [
          Text(AppLocale.labels.notificationDescription, style: textTheme.bodyMedium),
          ThemeHelper.hIndent2x,
          TagsInput(
            key: const ValueKey('notification_income'),
            title: AppLocale.labels.notificationIncome,
            tooltip: AppLocale.labels.notificationIncomeTooltip,
            controller: income,
            defaults: NotificationParser.incomeKeywords,
            normalize: _normalize,
          ),
          TagsInput(
            key: const ValueKey('notification_balance'),
            title: AppLocale.labels.notificationBalance,
            tooltip: AppLocale.labels.notificationBalanceTooltip,
            controller: balance,
            defaults: NotificationParser.balanceKeywords,
            normalize: _normalize,
          ),
          Text(AppLocale.labels.notificationAccounts, style: textTheme.titleMedium),
          Text(AppLocale.labels.notificationAccountsTooltip, style: textTheme.bodySmall),
          ThemeHelper.hIndent,
          for (final account in state.getList(AppDataType.accounts).whereType<AccountAppData>())
            TagsInput(
              key: ValueKey('notification_account_${account.uuid}'),
              title: account.title,
              controller: accountKeywords(account.uuid!),
              normalize: _normalize,
            ),
          if (error != null) ...[
            Text(error!, style: textTheme.bodyLarge?.copyWith(color: colorScheme.error)),
            ThemeHelper.hIndent,
          ],
          if (isLoading && apps.isEmpty)
            const Center(child: LoadingWidget(isLoading: true, size: Size(48, 48)))
          else if (!isGranted) ...[
            Text(AppLocale.labels.notificationAccessSteps,
                key: const ValueKey('notification_steps'), style: textTheme.bodyMedium),
            ThemeHelper.hIndent2x,
            FullSizedButtonWidget(
              key: const ValueKey('notification_grant'),
              icon: Icons.notifications_active_outlined,
              onPressed: grant,
              title: AppLocale.labels.notificationGrant,
            ),
          ] else ...[
            Text(AppLocale.labels.notificationApps, style: textTheme.titleMedium),
            if (apps.isEmpty) Text(AppLocale.labels.notificationNoApps, style: textTheme.bodyMedium),
            for (final app in _sortedApps())
              SwitchListTile(
                key: ValueKey('notification_app_${app.key}'),
                contentPadding: EdgeInsets.zero,
                title: Text(app.value),
                subtitle: Text(app.key, style: textTheme.bodySmall),
                value: packages.contains(app.key),
                onChanged: isLoading ? null : (value) => toggle(app.key, value),
              ),
            for (final package in packages) buildSource(context, source(package), state),
            Align(
              alignment: Alignment.centerRight,
              child: TextButton.icon(
                key: const ValueKey('notification_settings'),
                icon: const Icon(Icons.settings_outlined),
                onPressed: grant,
                label: Text(AppLocale.labels.notificationAccessSettings),
              ),
            ),
          ],
        ],
      );
    });
  }
}
