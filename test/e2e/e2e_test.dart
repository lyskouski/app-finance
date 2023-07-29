// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:app_finance/_classes/app_theme.dart';
import 'package:app_finance/main.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '_steps/file_runner.dart';

void main() {
  Iterable<File> features = Directory('./test/e2e')
      .listSync(recursive: true)
      .where((entity) => entity is File && entity.path.endsWith('.feature'))
      .cast<File>();

  group('Behavioral Tests', () {
    for (var file in features) {
      testWidgets(file.path, (WidgetTester tester) async {
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
        final runner = FileRunner(tester);
        await runner.init(file);
        expectSync(await runner.run(), true);
      });
    }
  });
}
