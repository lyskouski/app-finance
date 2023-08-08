// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:io';

import 'package:app_finance/_classes/app_theme.dart';
import 'package:app_finance/_classes/app_data.dart';
import 'package:app_finance/_classes/gen/generate_with_method_setters.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '_steps/file_runner.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
import 'e2e_test.mocks.dart';
@GenerateWithMethodSetters([MockSharedPreferences])
import 'e2e_test.wrapper.dart';

void main() {
  Iterable<File> features = Directory('./test/e2e')
      .listSync(recursive: true)
      .where((entity) => entity is File && entity.path.endsWith('.feature'))
      .cast<File>();

  group('Behavioral Tests', () {
    for (var file in features) {
      testWidgets(file.path, (WidgetTester tester) async {
        final pref = WrapperMockSharedPreferences();
        pref.mockGetString = (value) => '';
        SharedPreferencesMixin.pref = pref;
        final appData = AppData();
        appData.isLoading = false;
        await tester.pumpWidget(MultiProvider(
          providers: [
            ChangeNotifierProvider<AppData>(
              create: (_) => appData,
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
        await tester.pumpAndSettle(const Duration(seconds: 1));
      });
    }
  });
}
