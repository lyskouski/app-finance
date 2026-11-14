// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:async';

import 'package:app_finance/_classes/controller/deep_link/deep_link_handler.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('DeepLinkHandler', () {
    tearDown(() => DeepLinkHandler.enableBankingCallback.value = null);

    test('takes only callbacks of Enable Banking', () {
      expect(DeepLinkHandler.handle(Uri.parse('fingrom://integration/enablebanking?code=C&state=S')), isTrue);
      expect(DeepLinkHandler.enableBankingCallback.value?.queryParameters, {'code': 'C', 'state': 'S'});

      DeepLinkHandler.enableBankingCallback.value = null;
      for (final link in [
        'https://integration/enablebanking?code=C',
        'fingrom://other/enablebanking?code=C',
        'fingrom://integration/simplefin?code=C',
      ]) {
        expect(DeepLinkHandler.handle(Uri.parse(link)), isFalse, reason: link);
      }
      expect(DeepLinkHandler.enableBankingCallback.value, isNull);
    });

    test('hands a callback over once', () {
      DeepLinkHandler.handle(Uri.parse('fingrom://integration/enablebanking?code=C'));

      expect(DeepLinkHandler.takeEnableBankingCallback()?.queryParameters['code'], 'C');
      expect(DeepLinkHandler.takeEnableBankingCallback(), isNull);
    });

    test('listens to the links opening the application', () async {
      final links = StreamController<Uri>();
      await DeepLinkHandler.init(links: links.stream);

      links.add(Uri.parse('fingrom://integration/enablebanking?code=C2'));
      await Future<void>.delayed(Duration.zero);

      expect(DeepLinkHandler.enableBankingCallback.value?.queryParameters['code'], 'C2');
      await links.close();
    });
  });
}
