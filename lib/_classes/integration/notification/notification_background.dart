// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:async';

import 'package:app_finance/_classes/herald/app_sync.dart';
import 'package:app_finance/_classes/integration/notification/notification_channel.dart';
import 'package:app_finance/_classes/integration/notification/notification_controller.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_currency_picker/flutter_currency_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NotificationBackground {
  static Future<void> run() async {
    WidgetsFlutterBinding.ensureInitialized();
    try {
      AppPreferences.pref = await SharedPreferences.getInstance();
      CurrencyDefaults.cache = AppPreferences.pref;
      final state = AppData(AppSync(isOnline: false));
      await loaded(state);
      await NotificationController.instance.attachBackground(state);
    } catch (_) {
      await const NotificationChannel().done(0);
    }
  }

  static Future<void> loaded(AppData state) {
    if (!state.isLoading) {
      return Future.value();
    }
    final completer = Completer<void>();
    void listener() {
      if (!state.isLoading && !completer.isCompleted) {
        state.removeListener(listener);
        completer.complete();
      }
    }

    state.addListener(listener);
    return completer.future;
  }
}
