// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter_gherkin_generator/gen/generate_gherkin_resources.dart';
import 'package:flutter_gherkin_wrapper/flutter_gherkin_wrapper.dart';
import 'package:flutter_test/flutter_test.dart';

@GenerateGherkinResources(['../../'])
class Generics extends GivenGeneric {
  @override
  RegExp get pattern => RegExp('%step%');

  @override
  // Execute sub-step
  Future<void> executeStep() async {
    final reporter = FileReporter();
    final step = await FileReader().getFromString('''%feature%''', reporter);
    final result = await FileRunner(FileRunner.tester, reporter).run(step);
    if (!result) {
      reporter.publish();
    }
    expectSync(result, true);
  }
}
