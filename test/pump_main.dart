// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_theme.dart';
import 'package:app_finance/_classes/gen/generate_with_method_setters.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
import 'pump_main.mocks.dart';
@GenerateWithMethodSetters([MockSharedPreferences])
import 'pump_main.wrapper.dart';

class PumpMain {
  static init(WidgetTester tester, [bool isIntegration = false]) async {
    final pumpMain = PumpMain();
    await pumpMain.initPref(isIntegration);
    await pumpMain.initMain(tester, isIntegration);
  }

  AppData getStore(bool isIntegration) {
    final appData = AppData();
    if (!isIntegration) {
      appData.isLoading = false;
    }
    return appData;
  }

  Future<void> initPref(bool isIntegration) async {
    if (isIntegration) {
      SharedPreferencesMixin.pref = await SharedPreferences.getInstance();
    } else {
      final pref = WrapperMockSharedPreferences();
      pref.mockGetString = (value) => '';
      SharedPreferencesMixin.pref = pref;
    }
  }

  Future<void> initMain(WidgetTester tester, bool isIntegration) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<AppData>(
          create: (_) => getStore(isIntegration),
        ),
        ChangeNotifierProvider<AppTheme>(
          create: (_) => AppTheme(ThemeMode.system),
        ),
        ChangeNotifierProvider<AppLocale>(
          create: (_) => AppLocale(AppLocale.fromCode('en')),
        ),
      ],
      child: const MyApp(),
    ));
  }
}
