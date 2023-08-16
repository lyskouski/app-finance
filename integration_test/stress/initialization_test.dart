// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';
import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/_classes/app_theme.dart';
import 'package:app_finance/_classes/data/transaction_log.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../test/e2e/_steps/file_runner.dart';
import '../../test/e2e/_steps/given/first_run.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  Future<File> getLog() async {
    var file = File('coverage/initialization.log');
    if (!(await file.exists())) {
      await file.create(recursive: true);
    }
    return file;
  }

  Future<void> doubleTransactionSize() async {
    //await for (var line in TransactionLog.read()) {
    //  await TransactionLog.saveRaw(line);
    //}
    final path = await getApplicationDocumentsDirectory();
    var file = File('${path.absolute.path}/terCAD/app-finance.log');
    if (!file.existsSync()) {
      file = File('${Directory.systemTemp.absolute.path}/terCAD/app-finance.log');
    }
    final existingContent = await file.readAsString();
    await file.writeAsString(existingContent, mode: FileMode.append);
  }

  init(WidgetTester tester) async {
    SharedPreferencesMixin.pref = await SharedPreferences.getInstance();
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<AppData>(
          create: (_) => AppData(),
        ),
        ChangeNotifierProvider<AppTheme>(
          create: (_) => AppTheme(ThemeMode.system),
        ),
      ],
      child: const MyApp(),
    ));
  }

  testWidgets('Cover Initial Page', (WidgetTester tester) async {
    final file = await getLog();
    doubleTransactionSize();
    final startTime = DateTime.now();
    await init(tester);
    FileRunner.tester = tester;
    await FirstRun().executeStep();
    final endTime = DateTime.now();
    final duration = endTime.difference(startTime);
    file.writeAsString(
      "${duration.inMilliseconds} ms | ${await TransactionLog.getSize()} | ${TransactionLog.increment}\n",
      mode: FileMode.append,
    );
  }, timeout: const Timeout(Duration(minutes: 30)));
}
