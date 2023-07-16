// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

class CanSeeDefinedComponent extends Then1WithWorld<String, World> {
  @override
  Future<void> executeStep(String loginbtn) async {
    // TBD
  }

  @override
  RegExp get pattern => RegExp(r"I can see {string} component");
}
