// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/controller/deep_link/deep_link_handler.dart';
import 'package:app_finance/_classes/integration/enablebanking/enablebanking_client.dart';
import 'package:app_finance/_classes/integration/enablebanking/enablebanking_settings.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/pages/integration/widgets/enablebanking_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:material_ui/material_ui.dart';

import '../../pump_main.dart';
import '../../pump_main.wrapper.dart';
import '../../unit/_classes/integration/enablebanking_test_keys.dart';

Future<void> pumpFrames(WidgetTester tester) async {
  for (var i = 0; i < 10; i++) {
    await tester.pump(const Duration(milliseconds: 100));
  }
}

void main() {
  late List<http.Request> requests;
  late MockClient client;

  Future<void> setUpApp(WidgetTester tester) async {
    await PumpMain.init(tester);
    final memory = <String, String>{};
    final pref = AppPreferences.pref as WrapperMockSharedPreferences;
    pref.mockGetString = (key) => memory[key] ?? (key == AppPreferences.prefCurrency ? 'USD' : null);
    pref.mockSetString = (key, value) async {
      memory[key!] = value!;
      return true;
    };
    pref.mockRemove = (key) async => memory.remove(key) != null;
    await EnableBankingSettings(applicationId: 'app-id', country: 'FI', aspsp: 'Nordea').save();
    await EnableBankingSettings.saveKey(EnableBankingClient.normalizePrivateKey(testPrivateKeyPkcs8));
    DeepLinkHandler.enableBankingCallback.value = null;
    requests = [];
    client = MockClient((request) async {
      requests.add(request);
      final body = switch ((request.method, request.url.path)) {
        ('POST', '/auth') => {'url': 'https://bank.example.com/authorize', 'authorization_id': 'A1'},
        ('POST', '/sessions') => {
            'session_id': 'S1',
            'access': {'valid_until': DateTime.now().add(const Duration(days: 90)).toUtc().toIso8601String()},
            'accounts': [
              {
                'uid': 'U1',
                'account_id': {'iban': 'FI2112345600000785'},
                'name': 'Current',
                'currency': 'EUR',
              },
            ],
          },
        ('GET', '/accounts/U1/balances') => {'balances': []},
        _ => throw StateError('Unexpected ${request.method} ${request.url}'),
      };
      return http.Response(jsonEncode(body), 200);
    });
  }

  Future<EnableBankingWidgetState> open(WidgetTester tester) async {
    Navigator.of(tester.element(find.byType(Scaffold).first)).push(MaterialPageRoute(
      builder: (_) => Scaffold(
        body: SingleChildScrollView(child: EnableBankingWidget(httpClient: client, launcher: (url) async {})),
      ),
    ));
    await tester.pumpAndSettle();
    return tester.state<EnableBankingWidgetState>(find.byType(EnableBankingWidget));
  }

  Future<String> startAuthorization(WidgetTester tester) async {
    await tester.ensureVisible(find.byKey(const ValueKey('enablebanking_connect')));
    await tester.tap(find.byKey(const ValueKey('enablebanking_connect')));
    await pumpFrames(tester);
    await tester.pumpAndSettle();
    return jsonDecode(requests.last.body)['state'];
  }

  testWidgets('Redirect URL defaults to the deep link of the application', (WidgetTester tester) async {
    await setUpApp(tester);
    final state = await open(tester);

    expect(state.redirectUrl.text, EnableBankingSettings.defaultRedirectUrl);
    expect(state.redirectUrl.text, 'fingrom://integration/enablebanking');
    await tester.pump(const Duration(seconds: 10));
  });

  testWidgets('The deep link of the bank completes the authorization', (WidgetTester tester) async {
    await setUpApp(tester);
    final widgetState = await open(tester);
    final authState = await startAuthorization(tester);
    expect(EnableBankingSettings.load().authorizationState, authState);

    DeepLinkHandler.handle(Uri.parse('fingrom://integration/enablebanking?state=$authState&code=C1'));
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    expect(widgetState.error, isNull);
    expect(jsonDecode(requests.firstWhere((e) => e.url.path == '/sessions').body), {'code': 'C1'});
    expect(find.text('Current …0785'), findsOneWidget);
    expect(EnableBankingSettings.loadSession()?.id, 'S1');
    expect(EnableBankingSettings.load().authorizationState, '');
    expect(DeepLinkHandler.enableBankingCallback.value, isNull);
    await tester.pump(const Duration(seconds: 10));
  });

  testWidgets('A callback waiting since a restart completes once the section opens', (WidgetTester tester) async {
    await setUpApp(tester);
    final settings = EnableBankingSettings.load()..authorizationState = 'S-RESTART';
    await settings.save();
    DeepLinkHandler.handle(Uri.parse('fingrom://integration/enablebanking?state=S-RESTART&code=C2'));

    final widgetState = await open(tester);
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    expect(widgetState.error, isNull);
    expect(jsonDecode(requests.firstWhere((e) => e.url.path == '/sessions').body), {'code': 'C2'});
    expect(find.text('Current …0785'), findsOneWidget);
    await tester.pump(const Duration(seconds: 10));
  });

  testWidgets('Links without a pending authorization are left alone', (WidgetTester tester) async {
    await setUpApp(tester);
    await open(tester);

    DeepLinkHandler.handle(Uri.parse('fingrom://integration/enablebanking?state=X&code=C3'));
    await pumpFrames(tester);

    expect(requests, isEmpty);
    expect(DeepLinkHandler.enableBankingCallback.value, isNotNull);
    DeepLinkHandler.enableBankingCallback.value = null;
    await tester.pump(const Duration(seconds: 10));
  });

  testWidgets('A link of another authorization is refused', (WidgetTester tester) async {
    await setUpApp(tester);
    final widgetState = await open(tester);
    await startAuthorization(tester);

    DeepLinkHandler.handle(Uri.parse('fingrom://integration/enablebanking?state=foreign&code=C4'));
    await pumpFrames(tester);
    await tester.pumpAndSettle();

    expect(requests.where((e) => e.url.path == '/sessions'), isEmpty);
    expect(widgetState.error, contains('another authorization'));
    await tester.pump(const Duration(seconds: 10));
  });
}
