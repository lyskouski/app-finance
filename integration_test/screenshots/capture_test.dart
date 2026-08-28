// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

// # Run all tests
// flutter test integration_test/screenshots/capture_test.dart
// # Limit by devices
// flutter test integration_test/screenshots/capture_test.dart --dart-define=SCREENSHOT_DEVICES="iPhone 15 Pro"
// # Limit by languages
// flutter test integration_test/screenshots/capture_test.dart --dart-define=SCREENSHOT_LOCALES=en
// # Limit by steps
// flutter test integration_test/screenshots/capture_test.dart --dart-define=SCREENSHOT_STEPS=1_home
// # Skip devices for which a folder already exists
// flutter test integration_test/screenshots/capture_test.dart --dart-define=SKIP_EXISTANT=true

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/l10n/app_localization.dart';
import 'package:app_finance/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenshot_generator/flutter_screenshot_generator.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../test/pump_main.dart';

void main() {
  final gen = ScreenshotGenerator(
    locales: AppLocalizations.supportedLocales,
    fnGetApp: () => PumpMain().getApp(const MyApp(), true),
    fnInit: (device, config, localeCode) async {
      AppPreferences.pref = await SharedPreferences.getInstance();
      // Set locale
      await AppPreferences.set(AppPreferences.prefLocale, localeCode);
      final design = AppDesign.fromLocale(AppLocale.fromCode(localeCode));
      await AppPreferences.set(AppPreferences.prefDesign, design);
      // Skip onboarding/start gate in HomePage
      if (AppPreferences.get(AppPreferences.prefPrivacyPolicy) == null) {
        await AppPreferences.set(AppPreferences.prefPrivacyPolicy, '');
      }
      // Screenshot generation should not attempt to start P2P sync/WebRTC
      await AppPreferences.clear(AppPreferences.prefPeer);
      await AppPreferences.clear(AppPreferences.prefP2P);
    },
  );
  gen.inject('1_home');
  gen.inject('2_bills', before: (tester) => _goToRoute(AppRoute.billRoute, tester, gen.config));
  gen.inject('3_accounts', before: (tester) => _goToRoute(AppRoute.accountRoute, tester, gen.config));
  gen.inject(
    '4_metrics__budgets',
    before: (tester) => _goToRoute(
      AppRoute.metricsSearchRoute,
      tester,
      gen.config,
      arguments: {routeArguments.search: '0'},
    ),
  );
  gen.inject(
    '5_metrics__accounts',
    before: (tester) => _goToRoute(
      AppRoute.metricsSearchRoute,
      tester,
      gen.config,
      arguments: {routeArguments.search: '1'},
    ),
  );
  gen.inject(
    '6_metrics__bills',
    before: (tester) => _goToRoute(
      AppRoute.metricsSearchRoute,
      tester,
      gen.config,
      arguments: {routeArguments.search: '2'},
    ),
  );
  gen.inject(
    '7_automation',
    before: (tester) => _goToRoute(AppRoute.automationRoute, tester, gen.config),
  );
  gen.inject(
    '8_goals',
    before: (tester) => _goToRoute(AppRoute.goalRoute, tester, gen.config),
  );
  gen.run();
}

Future<void> _goToRoute(
  String route,
  WidgetTester tester,
  ScreenshotConfig config, {
  Map<String, dynamic>? arguments,
}) async {
  final navigator = tester.state<NavigatorState>(find.byType(Navigator));
  navigator.pushNamed(route, arguments: arguments);
  await tester.pumpAndSettle(config.animationSettleTime);
}
