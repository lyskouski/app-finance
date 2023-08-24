// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/charts/painter/foreground_chart_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ForegroundChartPainter', () {
    final testCases = [
      (yDivider: 12, xDivider: 12, yArea: [0.8, 0.6], yType: double),
      (yDivider: 6, xDivider: 12, yArea: [0.5], yType: double),
      (yDivider: 2, xDivider: 6, yArea: [], yType: double),
      (yDivider: 12, xDivider: 12, yArea: [], yType: null),
      (yDivider: 12, xDivider: 12, yArea: [], yType: IconData),
    ];

    for (int i = 0; i < testCases.length; i++) {
      testWidgets('${testCases[i]}', (WidgetTester tester) async {
        const size = Size(320, 240);
        tester.view.physicalSize = size;
        tester.view.devicePixelRatio = 1;
        await tester.pumpWidget(CustomPaint(
          size: size,
          foregroundPainter: ForegroundChartPainter(
            size: size,
            xDivider: testCases[i].xDivider,
            yDivider: testCases[i].yDivider,
            yArea: testCases[i].yArea.cast(),
            yType: testCases[i].yType,
          ),
        ));
        await expectLater(
          find.byType(CustomPaint),
          matchesGoldenFile('./foreground_chart_painter_test.dart.$i.png'),
        );
      });
    }
  });
}
