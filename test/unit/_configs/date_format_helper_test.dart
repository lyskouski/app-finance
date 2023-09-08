// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_configs/date_format_helper.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DateFormatMixin', () {
    final object = DateFormatHelper();

    group('splitDateTime', () {
      final testCases = [
        (date: 'Sun, 8/13/2023', result: ['Sun', ',', ' ', '8', '/', '13', '/', '2023']),
        (date: '8/29/2023 12:00 PM', result: ['8', '/', '29', '/', '2023', ' ', '12', ':', '00', ' ', 'PM']),
      ];

      for (var v in testCases) {
        test('$v', () {
          expect(object.splitDateTime(v.date), v.result);
        });
      }
    });

    group('detectFormat', () {
      final testCases = [
        (date: ['Sun, 8/13/2023'], result: 'E, M/d/yyyy', locale: 'en_US'),
        (date: ['8/29/2023 12:00 PM'], result: 'M/d/yyyy HH:mm a', locale: 'en_US'),
        (date: ['29/8/2023 12:00 PM'], result: 'd/M/yyyy HH:mm a', locale: 'en_US'),
        (date: ['6/20/23', '8/12/23'], result: 'M/d/yy', locale: 'en_US'),
        (date: ['6/2/23', '18/12/23'], result: 'd/M/yy', locale: 'en_US'),
        (date: ['2023-06-02', '2023-12-18'], result: 'yyyy-M-d', locale: 'en_US'),
        (date: ["1/ 1' 0", "1/ 1' 12"], result: "M/ d'' yy", locale: 'en_US'),
        (date: ['8/13/2023 23:00'], result: 'M/d/yyyy HH:mm', locale: 'en_US'),
        // (date: ['8/13/2023 23:00'], result: 'd/M/yyyy HH:mm', locale: 'de'), // Locale has not been initialized
        (date: ['24/12/2023 23:00:12'], result: 'd/M/yyyy HH:mm:ss', locale: 'en_US'),
        (date: ['20050824T080000'], result: "yyyyMMdd'T'HHmmss", locale: 'en_US'),
        (date: ['20050824'], result: 'yyyyMMdd', locale: 'en_US'),
      ];

      for (var v in testCases) {
        test('$v', () async {
          expect(object.detectFormat(v.date, v.locale, ['am', 'pm']), v.result);
        });
      }
    });
  });
}
