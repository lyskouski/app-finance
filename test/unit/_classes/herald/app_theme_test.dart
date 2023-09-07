// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_theme.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
import 'app_theme_test.mocks.dart';

void main() {
  setUp(() {
    SharedPreferencesMixin.pref = MockSharedPreferences();
  });

  group('AppTheme', () {
    group('setTheme', () {
      final testCases = [
        (value: '', result: ThemeMode.system),
        (value: '0', result: ThemeMode.system),
        (value: '1', result: ThemeMode.light),
        (value: '2', result: ThemeMode.dark),
        (value: '3', result: ThemeMode.system),
        (value: 'test', result: ThemeMode.system),
      ];

      for (var v in testCases) {
        test('$v', () async {
          final theme = AppTheme(ThemeMode.system);
          await theme.setTheme(v.value);
          expect(theme.value, v.result);
        });
      }
    });
  });
}
