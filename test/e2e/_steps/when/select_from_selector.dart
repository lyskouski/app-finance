// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter_test/flutter_test.dart';
// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

import 'enter_text_field.dart';
import 'tap_on_num_of_defined_element.dart';
import 'tap_on_num_of_defined_field.dart';

class SelectFromSelector extends When3WithWorld<String, String, String, World> {
  @override
  RegExp get pattern => RegExp(r"I select {string} from {string} with {string} tooltip");

  @override
  Future<void> executeStep(String option, String selector, String tooltip) async {
    await TapOnNumOfDefinedField().executeStep(0, selector);
    await EnterTextField().executeStep(option, tooltip);
    await TapOnNumOfDefinedElement().executeStep(1, option);
  }
}
