// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/integration/notification/notification_channel.dart';
import 'package:app_finance/_classes/integration/notification/notification_importer.dart';
import 'package:app_finance/_classes/integration/notification/notification_settings.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/transaction_log.dart';
import 'package:app_finance/_classes/structure/account_app_data.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

// Imports recognized notifications of the applications with an enabled automatic mode:
// on start, on return to the application, and right after a notification is captured
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
      NotificationChannel.channel.setMethodCallHandler((call) async {
        if (call.method == 'onCaptured') {
          await run();
        }
      });
      run();
    }
  }

  void detach() {
    if (_state == null) {
      return;
    }
    WidgetsBinding.instance.removeObserver(this);
    NotificationChannel.channel.setMethodCallHandler(null);
    _state = null;
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      run();
    }
  }

  // Calls during an import are merged into a single repetition
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
      final apps = NotificationSettings.load().apps.entries.where((e) => e.value.auto && e.value.isLinked).toList();
      if (state == null || apps.isEmpty) {
        return;
      }
      try {
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
      pattern: link.pattern,
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
