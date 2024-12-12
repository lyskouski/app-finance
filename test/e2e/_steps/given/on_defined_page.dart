// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter_gherkin_wrapper/flutter_gherkin_wrapper.dart';
import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

import '../../../screen_capture.dart';

class OnDefinedPage extends Given1<String> {
  @override
  RegExp get pattern => RegExp(r"I am on {string} page");

  @override
  Future<void> executeStep(String route) async {
    ScreenCapture.seize(runtimeType.toString());
    final btn = find.byTooltip('Open main menu');
    expectSync(btn, findsOneWidget);
    await FileRunner.tester.ensureVisible(btn);
    await FileRunner.tester.tap(btn);
    await FileRunner.tester.pumpAndSettle();

    ScreenCapture.seize('${runtimeType.toString()}_$route');
    Finder header = find.text(route);
    final matchCount = FileRunner.tester.widgetList(header).length;
    if (matchCount == 1) {
      // do nothing
    } else if (matchCount > 1) {
      header = header.first;
    } else {
      fail('No widget found with text "$route"');
    }
    await FileRunner.tester.ensureVisible(header);
    await FileRunner.tester.tap(header);
    await FileRunner.tester.pumpAndSettle();

    ScreenCapture.seize(runtimeType.toString());
  }
}
