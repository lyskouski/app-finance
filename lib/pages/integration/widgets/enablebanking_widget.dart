// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/deep_link/deep_link_handler.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/integration/enablebanking/enablebanking_client.dart';
import 'package:app_finance/_classes/integration/enablebanking/enablebanking_importer.dart';
import 'package:app_finance/_classes/integration/enablebanking/enablebanking_settings.dart';
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
import 'package:http/http.dart' as http;
import 'package:material_ui/material_ui.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:uuid/uuid.dart';

typedef UrlLauncher = Future<void> Function(Uri url);

class EnableBankingBankAccount extends IntegrationTarget {
  final EnableBankingAccount account;
  EnableBankingBalance? balance;

  EnableBankingBankAccount(this.account, {super.appAccount, super.category, required super.from});

  String get title {
    final number = account.iban ?? '';
    final masked = number.length > 4 ? '…${number.substring(number.length - 4)}' : number;
    return [account.name, masked].where((e) => e.isNotEmpty).join(' ');
  }
}

class EnableBankingWidget extends StatefulWidget {
  final http.Client? httpClient;
  final UrlLauncher? launcher;

  const EnableBankingWidget({super.key, this.httpClient, this.launcher});

  @override
  EnableBankingWidgetState createState() => EnableBankingWidgetState();
}

class EnableBankingWidgetState extends State<EnableBankingWidget> {
  late final EnableBankingSettings settings;
  late final TextEditingController applicationId;
  late final TextEditingController redirectUrl;
  late final TextEditingController country;
  final privateKey = TextEditingController();
  final code = TextEditingController();
  List<EnableBankingAspsp> aspsps = [];
  EnableBankingSession? session;
  String? authorizationState;
  List<EnableBankingBankAccount> accounts = [];
  bool isLoading = false;
  String? error;
  String? notice;

  @override
  void initState() {
    super.initState();
    settings = EnableBankingSettings.load();
    session = EnableBankingSettings.loadSession();
    authorizationState = settings.authorizationState.isEmpty ? null : settings.authorizationState;
    applicationId = TextEditingController(text: settings.applicationId);
    redirectUrl = TextEditingController(
      text: settings.redirectUrl.isEmpty ? EnableBankingSettings.defaultRedirectUrl : settings.redirectUrl,
    );
    country = TextEditingController(text: settings.country);
    DeepLinkHandler.enableBankingCallback.addListener(onLink);
    // A callback that came before this section was open (e.g. the application was restarted meanwhile)
    WidgetsBinding.instance.addPostFrameCallback((_) => onLink());
  }

  @override
  void dispose() {
    DeepLinkHandler.enableBankingCallback.removeListener(onLink);
    for (final controller in [applicationId, redirectUrl, country, privateKey, code]) {
      controller.dispose();
    }
    super.dispose();
  }

  Future<void> _run(Future<void> Function(EnableBankingClient client) callback) async {
    setState(() {
      isLoading = true;
      error = null;
      notice = null;
    });
    EnableBankingClient? client;
    try {
      await saveSettings();
      final key = EnableBankingSettings.loadKey();
      if (settings.applicationId.isEmpty || key == null || settings.redirectUrl.isEmpty || settings.country.isEmpty) {
        throw EnableBankingException(AppLocale.labels.enableBankingIncomplete);
      }
      client = EnableBankingClient(
        applicationId: settings.applicationId,
        privateKey: key,
        client: widget.httpClient ?? http.Client(),
      );
      await callback(client);
    } on EnableBankingException catch (e) {
      error = e.message;
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

  Future<void> saveSettings() async {
    final key = privateKey.text.trim();
    if (key.isNotEmpty) {
      EnableBankingClient.parsePrivateKey(key);
      await EnableBankingSettings.saveKey(EnableBankingClient.normalizePrivateKey(key));
      privateKey.clear();
    }
    settings
      ..applicationId = applicationId.text.trim()
      ..redirectUrl = redirectUrl.text.trim()
      ..country = country.text.trim().toUpperCase();
    await settings.save();
  }

  void onLink() {
    if (!mounted || DeepLinkHandler.enableBankingCallback.value == null || authorizationState == null) {
      return;
    }
    if (isLoading) {
      Future.delayed(const Duration(milliseconds: 300), onLink);
      return;
    }
    code.text = DeepLinkHandler.takeEnableBankingCallback().toString();
    confirm();
  }

  Future<void> _setAuthorizationState(String? state) async {
    authorizationState = state;
    settings.authorizationState = state ?? '';
    await settings.save();
  }

  EnableBankingAspsp? get _aspsp {
    final selected = aspsps.where((e) => e.name == settings.aspsp).firstOrNull;
    if (selected != null || settings.aspsp.isEmpty) {
      return selected;
    }
    return EnableBankingAspsp(name: settings.aspsp, country: settings.country);
  }

  Future<void> loadBanks() => _run((client) async {
        aspsps = await client.getAspsps(settings.country);
        if (aspsps.isEmpty) {
          notice = AppLocale.labels.integrationNoAccounts;
        }
      });

  Future<void> connect() => _run((client) async {
        final current = session;
        if (current != null && current.isValid) {
          return _loadAccounts(client, current);
        }
        final aspsp = _aspsp;
        if (aspsp == null) {
          throw EnableBankingException(AppLocale.labels.enableBankingBank);
        }
        final state = const Uuid().v4();
        final url = await client.startAuthorization(aspsp: aspsp, redirectUrl: settings.redirectUrl, state: state);
        await _setAuthorizationState(state);
        await (widget.launcher ?? (uri) => launchUrl(uri, mode: LaunchMode.externalApplication))(url);
      });

  Future<void> confirm() => _run((client) async {
        final value = EnableBankingClient.extractCode(code.text, state: authorizationState);
        final created = await client.createSession(value);
        await EnableBankingSettings.saveSession(created);
        session = created;
        await _setAuthorizationState(null);
        code.clear();
        await _loadAccounts(client, created);
      });

  Future<void> _loadAccounts(EnableBankingClient client, EnableBankingSession current) async {
    final defaultBudget = AppPreferences.get(AppPreferences.prefBudget);
    final monthAgo = DateTime.now().subtract(const Duration(days: 30));
    accounts = current.accounts
        .map((account) => EnableBankingBankAccount(
              account,
              appAccount: settings.links[account.key],
              category: defaultBudget,
              from: settings.imported[account.key] ?? monthAgo,
            ))
        .toList();
    for (final item in accounts) {
      try {
        item.balance = (await client.getBalances(item.account.uid)).firstOrNull;
      } on EnableBankingException {
        // Some banks offer no balances
      }
    }
    if (accounts.isEmpty) {
      notice = AppLocale.labels.integrationNoAccounts;
    }
  }

  Future<void> disconnect() async => setState(() => accounts = []);

  Future<void> forget() => _run((client) async {
        final current = session;
        session = null;
        accounts = [];
        await EnableBankingSettings.clearSession();
        if (current != null) {
          await client.deleteSession(current.id);
        }
      });

  Future<void> importTransactions(EnableBankingBankAccount item) => _run((client) async {
        if (item.appAccount == null || item.category == null) {
          throw EnableBankingException(AppLocale.labels.integrationSelectTarget);
        }
        final state = Provider.of<AppData>(context, listen: false);
        final transactions = await client.getTransactions(item.account.uid, from: item.from);
        final importer = EnableBankingImporter(
          exists: (uuid) => state.getByUuid(uuid) != null,
          add: (value, uuid) => TransactionLog.save(state.add(value, uuid)),
        );
        final summary = importer.run(
          accountKey: item.account.key,
          transactions: transactions,
          account: item.appAccount!,
          category: item.category!,
        );
        await state.restate();
        final today = DateTime.now();
        settings.links[item.account.key] = item.appAccount!;
        settings.imported[item.account.key] = DateTime(today.year, today.month, today.day);
        await settings.save();
        notice = AppLocale.labels.integrationImported(summary.added, summary.pending, summary.skipped);
      });

  Widget buildSettings(BuildContext context) {
    final banks = aspsps.isNotEmpty
        ? aspsps
        : [if (settings.aspsp.isNotEmpty) EnableBankingAspsp(name: settings.aspsp, country: settings.country)];
    return Column(
      crossAxisAlignment: AppDesign.getAlignment(),
      children: [
        InputWrapper.text(
          title: AppLocale.labels.enableBankingAppId,
          controller: applicationId,
          isRequired: true,
        ),
        InputWrapper.text(
          title: AppLocale.labels.enableBankingKey,
          tooltip: AppLocale.labels.enableBankingKeyTooltip,
          controller: privateKey,
          isRequired: EnableBankingSettings.loadKey() == null,
        ),
        InputWrapper.text(
          title: AppLocale.labels.enableBankingRedirect,
          tooltip: AppLocale.labels.enableBankingRedirectTooltip,
          controller: redirectUrl,
          isRequired: true,
          inputType: TextInputType.url,
        ),
        InputWrapper.text(
          title: AppLocale.labels.enableBankingCountry,
          controller: country,
          isRequired: true,
        ),
        if (banks.isNotEmpty)
          InputWrapper.select(
            title: AppLocale.labels.enableBankingBank,
            value: settings.aspsp.isEmpty ? null : settings.aspsp,
            isRequired: true,
            options: <ListSelectorItem>[for (final bank in banks) ListSelectorItem(id: bank.name, name: bank.name)],
            onChange: (value) => setState(() => settings.aspsp = value ?? ''),
          ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton.icon(
            key: const ValueKey('enablebanking_banks'),
            icon: const Icon(Icons.account_balance),
            onPressed: isLoading ? null : loadBanks,
            label: Text(AppLocale.labels.enableBankingLoadBanks),
          ),
        ),
      ],
    );
  }

  Widget buildAccount(BuildContext context, EnableBankingBankAccount item, AppData state) {
    final balance = item.balance;
    return IntegrationAccountCard(
      title: item.title,
      subtitle: balance != null ? '${AppLocale.labels.balance}: ${balance.amount} ${balance.currency}' : null,
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
          Text(AppLocale.labels.enableBankingDescription, style: textTheme.bodyMedium),
          ThemeHelper.hIndent2x,
          if (session == null) buildSettings(context),
          if (authorizationState != null)
            InputWrapper.text(
              title: AppLocale.labels.enableBankingCode,
              tooltip: AppLocale.labels.enableBankingCodeTooltip,
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
            Text(notice!, style: textTheme.bodyLarge),
            ThemeHelper.hIndent,
          ],
          if (isLoading)
            const Center(child: LoadingWidget(isLoading: true, size: Size(48, 48)))
          else ...[
            if (accounts.isNotEmpty)
              FullSizedButtonWidget(
                key: const ValueKey('enablebanking_disconnect'),
                icon: Icons.logout,
                onPressed: disconnect,
                title: AppLocale.labels.integrationDisconnect,
              )
            else
              FullSizedButtonWidget(
                key: const ValueKey('enablebanking_connect'),
                icon: Icons.login,
                onPressed: authorizationState != null ? confirm : connect,
                title: AppLocale.labels.integrationConnect,
              ),
            if (session != null)
              Align(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                  key: const ValueKey('enablebanking_forget'),
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
