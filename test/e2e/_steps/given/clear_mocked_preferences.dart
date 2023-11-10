// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:dart_class_wrapper/dart_class_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gherkin_wrapper/flutter_gherkin_wrapper.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';
import 'package:mockito/annotations.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
import 'clear_mocked_preferences.mocks.dart';

@GenerateWithMethodSetters([MockSharedPreferences])
import 'clear_mocked_preferences.wrapper.dart';

class ClearMockedPreferences extends Given {
  @override
  RegExp get pattern => RegExp(r"I clear my preferences at the start");

  @override
  Future<void> executeStep() async {
    final pref = WrapperMockSharedPreferences();
    pref.mockGetString = (value) => null;
    AppPreferences.pref = pref;
    await FileRunner.tester.pumpAndSettle();
    final ScaffoldState scafState = FileRunner.tester.firstState(find.byType(Scaffold).at(0));
    scafState.openDrawer();
    await FileRunner.tester.pumpAndSettle();
  }
}
