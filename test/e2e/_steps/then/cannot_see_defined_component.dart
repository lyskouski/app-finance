// Copyright 2025 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

import '../../../screen_capture.dart';

class CannotSeeDefinedComponent extends Then1WithWorld<String, World> {
  @override
  RegExp get pattern => RegExp(r"I cannot see {string} component");

  @override
  Future<void> executeStep(String name) async {
    ScreenCapture.seize(runtimeType.toString());
    final component = find.text(name);
    expectSync(component, findsNothing);
  }
}
