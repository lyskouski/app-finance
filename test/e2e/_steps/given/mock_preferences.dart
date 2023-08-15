// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

import '../file_runner.dart';
import '../../e2e_test.wrapper.dart';

class MockPreferences extends Given with SharedPreferencesMixin {
  @override
  RegExp get pattern => RegExp(r"preferences are updated \(actually, mocked\)");

  @override
  Future<void> executeStep() async {
    final pref = WrapperMockSharedPreferences();
    pref.mockGetString = (value) => '';
    SharedPreferencesMixin.pref = pref;
    await FileRunner.tester.pumpAndSettle();
  }
}
