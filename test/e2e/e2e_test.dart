// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';

import 'package:flutter_gherkin_generator/gen/generate_list_of_classes.dart';
import 'package:flutter_gherkin_wrapper/flutter_gherkin_wrapper.dart';
import 'package:flutter_test/flutter_test.dart';

import '../pump_main.dart';
import '../screen_capture.dart';

@GenerateListOfClasses(['_steps'])
import 'e2e_test.list.dart';

void main() {
  Iterable<File> features = Directory('./test/e2e')
      .listSync(recursive: true)
      .where((entity) => entity is File && entity.path.endsWith('.test.feature'))
      .cast<File>();

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
    ScreenCapture.enableScreenCapture();
    ExecutableStepIterator.inject(classList);
    PumpMain.cleanUpData();
  });

  group('Behavioral Tests', () {
    for (var file in features) {
      testWidgets(file.path, (WidgetTester tester) async {
        await PumpMain.init(tester);
        final runner = FileRunner(tester);
        await runner.init(file);
        expectSync(await runner.run(), true);
        await tester.pumpAndSettle(const Duration(seconds: 1));
      }, timeout: const Timeout(Duration(minutes: 5)));
    }
  });
}
