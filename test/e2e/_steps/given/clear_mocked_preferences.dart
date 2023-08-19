// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/gen/generate_with_method_setters.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../file_runner.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
import 'clear_mocked_preferences.mocks.dart';
@GenerateWithMethodSetters([MockSharedPreferences])
import 'clear_mocked_preferences.wrapper.dart';

class ClearMockedPreferences extends Given with SharedPreferencesMixin {
  @override
  RegExp get pattern => RegExp(r"I clear my preferences at the start");

  @override
  Future<void> executeStep() async {
    final pref = WrapperMockSharedPreferences();
    pref.mockGetString = (value) => null;
    SharedPreferencesMixin.pref = pref;
    await FileRunner.tester.pumpAndSettle();
  }
}
