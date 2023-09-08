// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>(), MockSpec<BuildContext>()])
import 'app_locale_test.mocks.dart';

void main() {
  setUp(() {
    AppPreferences.pref = MockSharedPreferences();
  });

  group('AppLocale', () {
    test('fromCode', () {
      expect(AppLocale.fromCode('en'), const Locale('en'));
    });

    test('set [en]', () {
      final locale = AppLocale();
      expect(locale.value, null);
      locale.set('en');
      expect(locale.value, const Locale('en'));
    });

    test('[TBD] updateState', () {
      final locale = AppLocale();
      final context = MockBuildContext();
      when(context.dependOnInheritedWidgetOfExactType()).thenReturn(null);
      expect(() => locale.updateState(context), throwsA(isA<FlutterError>()));
    });
  });
}
