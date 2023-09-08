// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/encryption_handler.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
import 'encryption_handler_test.mocks.dart';

void main() {
  setUp(() {
    AppPreferences.pref = MockSharedPreferences();
  });

  group('EncryptionHandler', () {
    test('getHash', () {
      Map<String, dynamic> data = {'test': 123};
      expect(EncryptionHandler.getHash(data), 'ff4123302616ba02c74a95824d40f192');
    });

    group('doEncrypt', () {
      final testCases = [
        (getPreference: null, result: true),
        (getPreference: 'true', result: true),
        (getPreference: 'false', result: false),
      ];

      for (var v in testCases) {
        test('$v', () {
          when(AppPreferences.pref.getString('doEncrypt')).thenReturn(v.getPreference);
          expect(EncryptionHandler.doEncrypt(), v.result);
        });
      }
    });

    test('encrypt / decrypt', () {
      String data = 'sample content';
      final enc = EncryptionHandler.encrypt(data);
      expect(enc.length, 24);
      expect(EncryptionHandler.decrypt(enc), data);
    });
  });
}
