// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

import 'given/on_defined_page.dart';
import 'then/can_see_defined_component.dart';
import 'when/tap_defined_button.dart';
import 'when/tap_defined_header.dart';

class ExecutableStepIterator {
  final List<CustomParameter> param = <CustomParameter>[];

  ExecutableStepIterator() {
    param.addAll([
      NumParameterLower(),
      IntParameterLower(),
      StringParameterLower(),
      WordParameterLower(),
    ]);
  }

  List<ExecutableStep> _register(List<dynamic> steps) {
    return steps
        .map(
          (s) => ExecutableStep(GherkinExpression(s.pattern, param), s),
        )
        .toList();
  }

  Iterable<ExecutableStep> aggregate() {
    return _register([
      // Given
      OnDefinedPage(),
      // When
      TapDefinedButton(),
      TapDefinedHeader(),
      // Then
      CanSeeDefinedComponent(),
    ]);
  }
}
