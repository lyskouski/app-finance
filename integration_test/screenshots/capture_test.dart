// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

// flutter test integration_test/screenshots/capture_test.dart

import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/l10n/app_localization.dart';
import 'package:app_finance/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../test/pump_main.dart';
import 'device_configs.dart';
import 'screenshot_helper.dart';
import 'screenshot_config.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  final preset = ScreenshotPresets.comprehensive;
  // This test is meant to GENERATE screenshots, not to compare them
  final config = ScreenshotConfig(
    enabledPlatforms: preset.enabledPlatforms,
    enabledDeviceTypes: preset.enabledDeviceTypes,
    outputDirectory: preset.outputDirectory,
    pixelRatio: preset.pixelRatio,
    animationSettleTime: preset.animationSettleTime,
    generateHtmlReport: false,
    enableGoldenComparison: false,
    comparisonThreshold: preset.comparisonThreshold,
  );

  final enabledDevices = config.getEnabledDevices();

  // flutter test integration_test/screenshots/capture_test.dart --dart-define=SCREENSHOT_DEVICES="iPhone 15 Pro"
  const deviceCsv = String.fromEnvironment('SCREENSHOT_DEVICES');
  final deviceFilter = deviceCsv.split(',').map((v) => v.trim()).where((v) => v.isNotEmpty).toSet();

  bool matchesDeviceFilter(DeviceConfig device) {
    if (deviceFilter.isEmpty) {
      return true;
    }
    final name = device.name;
    final normalized = name.toLowerCase();
    final underscored = name.replaceAll(' ', '_').toLowerCase();
    return deviceFilter.any((f) {
      final ff = f.toLowerCase();
      return ff == normalized || ff == underscored;
    });
  }

  final filteredDevices = enabledDevices.where(matchesDeviceFilter).toList();

  // flutter test integration_test/screenshots/capture_test.dart --dart-define=SCREENSHOT_LOCALES=en
  const localeCsv = String.fromEnvironment('SCREENSHOT_LOCALES');
  final localeFilter = localeCsv.split(',').map((v) => v.trim()).where((v) => v.isNotEmpty).toSet();

  final locales = localeFilter.isEmpty
      ? AppLocalizations.supportedLocales
      : AppLocalizations.supportedLocales.where((l) => localeFilter.contains(l.toString())).toList();

  // flutter test integration_test/screenshots/capture_test.dart --dart-define=SCREENSHOT_STEPS=4_m_budgets
  const stepCsv = String.fromEnvironment('SCREENSHOT_STEPS');
  final stepFilter = stepCsv.split(',').map((v) => v.trim()).where((v) => v.isNotEmpty).toSet();

  bool isEnabledStep(String stepId) {
    if (stepFilter.isEmpty) {
      return true;
    }
    final normalized = stepId.toLowerCase();
    return stepFilter.any((s) => s.toLowerCase() == normalized);
  }

  for (final locale in locales) {
    final localeCode = locale.toString();
    for (final device in filteredDevices) {
      // Home
      if (isEnabledStep('1_home')) {
        _screenshotForDevice('1_home', device, config, localeCode: localeCode);
      }

      // Bills
      if (isEnabledStep('2_bills')) {
        _screenshotForDevice(
          '2_bills',
          device,
          config,
          localeCode: localeCode,
          beforeScreenshot: (tester) => _goToRoute(AppRoute.billRoute, tester, config),
        );
      }

      // Accounts
      if (isEnabledStep('3_accounts')) {
        _screenshotForDevice(
          '3_accounts',
          device,
          config,
          localeCode: localeCode,
          beforeScreenshot: (tester) => _goToRoute(AppRoute.accountRoute, tester, config),
        );
      }

      // Metrics > Budgets (tab 0)
      if (isEnabledStep('4_m_budgets')) {
        _screenshotForDevice(
          '4_m_budgets',
          device,
          config,
          localeCode: localeCode,
          beforeScreenshot: (tester) => _goToRoute(
            AppRoute.metricsSearchRoute,
            tester,
            config,
            arguments: {routeArguments.search: '0'},
          ),
        );
      }

      // Metrics > Accounts (tab 1)
      if (isEnabledStep('5_m_accounts')) {
        _screenshotForDevice(
          '5_m_accounts',
          device,
          config,
          localeCode: localeCode,
          beforeScreenshot: (tester) => _goToRoute(
            AppRoute.metricsSearchRoute,
            tester,
            config,
            arguments: {routeArguments.search: '1'},
          ),
        );
      }

      // Metrics > Bills (tab 2)
      if (isEnabledStep('6_m_bills')) {
        _screenshotForDevice(
          '6_m_bills',
          device,
          config,
          localeCode: localeCode,
          beforeScreenshot: (tester) => _goToRoute(
            AppRoute.metricsSearchRoute,
            tester,
            config,
            arguments: {routeArguments.search: '2'},
          ),
        );
      }

      // Automation (defaults to Payments tab)
      if (isEnabledStep('7_automation')) {
        _screenshotForDevice(
          '7_automation',
          device,
          config,
          localeCode: localeCode,
          beforeScreenshot: (tester) => _goToRoute(AppRoute.automationRoute, tester, config),
        );
      }

      // Goals
      if (isEnabledStep('8_goals')) {
        _screenshotForDevice(
          '8_goals',
          device,
          config,
          localeCode: localeCode,
          beforeScreenshot: (tester) => _goToRoute(AppRoute.goalRoute, tester, config),
        );
      }
    }
  }
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

void _screenshotForDevice(
  String description,
  DeviceConfig device,
  ScreenshotConfig config, {
  Future<void> Function(WidgetTester tester)? beforeScreenshot,
  required String localeCode,
}) {
  testWidgets('$description - ${device.name} - $localeCode', (tester) async {
    // Configure device settings
    ScreenshotHelper.configureDevice(tester, device);

    try {
      // Initialize app preferences
      AppPreferences.pref = await SharedPreferences.getInstance();

      // Ensure the app starts in the requested locale.
      await AppPreferences.set(AppPreferences.prefLocale, localeCode);

      // Skip onboarding/start gate in HomePage.
      if (AppPreferences.get(AppPreferences.prefPrivacyPolicy) == null) {
        await AppPreferences.set(AppPreferences.prefPrivacyPolicy, '');
      }

      // Screenshot generation should not attempt to start P2P sync/WebRTC
      await AppPreferences.clear(AppPreferences.prefPeer);
      await AppPreferences.clear(AppPreferences.prefP2P);

      // Create screenshot-ready app
      final pumpMain = PumpMain();
      final appWidget = ScreenshotHelper.createScreenshotApp(
        device: device,
        screenshotKey: '${description}_${device.name}_$localeCode',
        child: pumpMain.getApp(const MyApp(), true),
      );

      await tester.pumpWidget(appWidget);
      await tester.pumpAndSettleForDevice(device);
      await tester.loadDeviceAssets(device);

      // Execute pre-screenshot actions
      if (beforeScreenshot != null) {
        await beforeScreenshot(tester);
      }

      // Wait for any final animations
      await tester.pumpAndSettle(config.animationSettleTime);

      // Capture the screenshot
      await ScreenshotHelper.captureScreenshot(
        testName: description,
        device: device,
        screenshotKey: '${description}_${device.name}_$localeCode',
        customPath: '${config.outputDirectory}/$localeCode',
        pixelRatio: device.devicePixelRatio,
      );

      // Optionally compare with golden files
      if (config.enableGoldenComparison) {
        await ScreenshotHelper.expectScreenshotForDevice(
          tester,
          device,
          description,
          threshold: config.comparisonThreshold,
        );
      }
    } finally {
      // Reset device configuration
      ScreenshotHelper.resetDevice(tester);
    }
  });
}
