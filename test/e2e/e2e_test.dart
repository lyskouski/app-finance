// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:app_finance/main.dart';
import 'package:app_finance/data.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';

import '_steps/file_runner.dart';

void main() {
  late Iterable<File> scope = Directory('./test/e2e')
      .listSync(recursive: true)
      .where((entity) => entity is File && entity.path.endsWith('.feature'))
      .cast<File>();

  group('Behavioral Tests', () {
    for (var file in scope) {
      testWidgets(file.path, (WidgetTester tester) async {
        await tester.pumpWidget(ChangeNotifierProvider(
          create: (_) => AppData(),
          child: const MyApp(),
        ));
        final runner = FileRunner(file);
        await runner.init(tester);
        expect(await runner.run(), true);
      });
    }
  });
}
