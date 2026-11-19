// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/integration/notification/notification_channel.dart';
import 'package:app_finance/_classes/integration/notification/notification_importer.dart';
import 'package:app_finance/_classes/integration/notification/notification_parser.dart';
import 'package:app_finance/_classes/integration/notification/notification_settings.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/transaction_log.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:flutter/services.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:flutter/widgets.dart';

class NotificationController with WidgetsBindingObserver {
  static NotificationController? _instance;

  static NotificationController get instance => _instance ??= NotificationController();

  @visibleForTesting
  static set instance(NotificationController? value) => _instance = value;

  final NotificationChannel channel;
  // Changed after each automatic import, to refresh the views
  final revision = ValueNotifier<int>(0);
  void Function(int added)? onImported;
  AppData? _state;
  bool _isBackground = false;
  Future<void>? _running;
  bool _isRepeated = false;

  NotificationController({this.channel = const NotificationChannel()});

  bool get isAttached => _state != null;

  void attach(AppData state) {
    if (!NotificationChannel.isSupported) {
      return;
    }
    final isFirst = _state == null;
    _state = state;
    if (isFirst) {
      WidgetsBinding.instance.addObserver(this);
      NotificationChannel.channel.setMethodCallHandler(_handle);
      syncAutoPackages();
      run();
    }
  }

  Future<void> attachBackground(AppData state) async {
    _isBackground = true;
    _state = state;
    var added = 0;
    var generation = 0;
    onImported = (value) => added += value;
    Future<void> drain() async {
      final current = ++generation;
      await run();
      if (current == generation) {
        await channel.done(added);
      }
    }

    NotificationChannel.channel.setMethodCallHandler((call) async {
      if (call.method == 'onCaptured') {
        await drain();
      }
    });
    await drain();
  }

  void detach() {
    if (_state == null) {
      return;
    }
    WidgetsBinding.instance.removeObserver(this);
    NotificationChannel.channel.setMethodCallHandler(null);
    _state = null;
  }

  Future<void> _handle(MethodCall call) async {
    switch (call.method) {
      case 'onCaptured':
        await run();
      case 'onReload':
        final added = (call.arguments as Map?)?['added'] as int? ?? 0;
        if (added > 0) {
          await _state?.flush();
          revision.value++;
          onImported?.call(added);
        }
        await run();
    }
  }

  Future<void> syncAutoPackages() async {
    try {
      final apps = NotificationSettings.load().apps.entries.where((e) => e.value.isLinked);
      await channel.setAutoPackages(apps.map((e) => e.key));
    } on PlatformException {
      // Not critical: the background import would be skipped
    } on MissingPluginException {
      // Not supported
    }
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      run();
    }
  }

  Future<void> run() {
    if (_running != null) {
      _isRepeated = true;
      return _running!;
    }
    return _running = _run().whenComplete(() => _running = null);
  }

  Future<void> _run() async {
    do {
      _isRepeated = false;
      final state = _state;
      final settings = NotificationSettings.load();
      final apps = settings.apps.entries.where((e) => e.value.isLinked).toList();
      if (state == null || apps.isEmpty) {
        return;
      }
      try {
        if (!_isBackground && await channel.isBusy()) {
          return;
        }
        if (!await channel.isGranted()) {
          return;
        }
        final records = await channel.getNotifications();
        var added = 0;
        for (final app in apps) {
          final summary = await importApp(
            state,
            channel,
            package: app.key,
            link: app.value,
            records: records,
            from: DateTime.fromMillisecondsSinceEpoch(0),
            income: settings.income,
            balance: settings.balance,
            accounts: settings.accounts,
          );
          added += summary.added;
        }
        if (added > 0) {
          revision.value++;
          onImported?.call(added);
        }
      } on PlatformException {
        return;
      } on MissingPluginException {
        return;
      }
    } while (_isRepeated);
  }

  static Future<NotificationImportResult> importApp(
    AppData state,
    NotificationChannel channel, {
    required String package,
    required NotificationApp link,
    required List<NotificationRecord> records,
    required DateTime from,
    List<String> income = NotificationParser.incomeKeywords,
    List<String> balance = NotificationParser.balanceKeywords,
    Map<String, List<String>> accounts = const {},
  }) async {
    final account = state.getByUuid(link.account!);
    final importer = NotificationImporter(
      exists: (uuid) => state.getByUuid(uuid) != null,
      add: (value, uuid) => TransactionLog.save(state.add(value, uuid)),
    );
    final summary = importer.run(
      records: records.where((e) => e.package == package).toList(),
      account: link.account!,
      category: link.category!,
      from: from,
      currency: account is AccountAppData ? account.currency : null,
      appCurrency: link.currency != null ? CurrencyProvider.find(link.currency!) : null,
      income: income,
      balance: balance,
      accounts: accounts,
      currencyOf: (uuid) => switch (state.getByUuid(uuid)) { AccountAppData item => item.currency, _ => null },
      prediction: state.prediction,
    );
    if (summary.added > 0) {
      await state.restate();
    }
    if (summary.processed.isNotEmpty) {
      await channel.removeNotifications(summary.processed);
    }
    return summary;
  }
}
