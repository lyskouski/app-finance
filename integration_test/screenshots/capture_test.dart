// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

// flutter test integration_test/screenshots/capture_test.dart

import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/main.dart';
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

  for (final device in enabledDevices) {
    // Home
    _screenshotForDevice('1_home', device, config, beforeScreenshot: (tester) async {
      await _goTo('Home', tester, config);
    });
    // Bills
    _screenshotForDevice('2_bills', device, config, beforeScreenshot: (tester) async {
      await _goTo('Bills', tester, config);
    });
    // Accounts
    _screenshotForDevice('3_accounts', device, config, beforeScreenshot: (tester) async {
      await _goTo('Accounts', tester, config);
    });
    // Metrics > Budgets
    _screenshotForDevice('4_m_budgets', device, config, beforeScreenshot: (tester) async {
      await _goTo('Metrics', tester, config);
      final btn = find.text('Budgets').first;
      await tester.tap(btn);
      await tester.pumpAndSettle(config.animationSettleTime);
    });
    // Metrics > Accounts
    _screenshotForDevice('5_m_accounts', device, config, beforeScreenshot: (tester) async {
      await _goTo('Metrics', tester, config);
      final btn = find.text('Accounts');
      await tester.tap(btn);
      await tester.pumpAndSettle(config.animationSettleTime);
    });
    // Metrics > Bills
    _screenshotForDevice('6_m_bills', device, config, beforeScreenshot: (tester) async {
      await _goTo('Metrics', tester, config);
      final btn = find.text('Bills').first;
      await tester.tap(btn);
      await tester.pumpAndSettle(config.animationSettleTime);
    });
    // Automation > Recurring Payments
    _screenshotForDevice('7_automation', device, config, beforeScreenshot: (tester) async {
      await _goTo('Automation', tester, config);
      final btn = find.text('Recurring Payments').first;
      await tester.tap(btn);
      await tester.pumpAndSettle(config.animationSettleTime);
    });
    // Goals
    _screenshotForDevice('8_goals', device, config, beforeScreenshot: (tester) async {
      await _goTo('Goals', tester, config);
    });
  }
}

Future<void> _goTo(String route, WidgetTester tester, ScreenshotConfig config) async {
  final btn = find.byTooltip('Open main menu');
  if (btn.evaluate().isNotEmpty) {
    await tester.tap(btn);
    await tester.pumpAndSettle(config.animationSettleTime);
  }
  Finder header = find.text(route);
  final matchCount = tester.widgetList(header).length;
  if (matchCount > 1) {
    header = header.last;
  }
  await tester.ensureVisible(header);
  await tester.tap(header);
  await tester.pumpAndSettle(config.animationSettleTime);
}

void _screenshotForDevice(
  String description,
  DeviceConfig device,
  ScreenshotConfig config, {
  Future<void> Function(WidgetTester tester)? beforeScreenshot,
}) {
  testWidgets('$description - ${device.name}', (tester) async {
    // Configure device settings
    ScreenshotHelper.configureDevice(tester, device);

    try {
      // Initialize app preferences
      AppPreferences.pref = await SharedPreferences.getInstance();

      // Screenshot generation should not attempt to start P2P sync/WebRTC
      await AppPreferences.clear(AppPreferences.prefPeer);
      await AppPreferences.clear(AppPreferences.prefP2P);

      // Create screenshot-ready app
      final pumpMain = PumpMain();
      final appWidget = ScreenshotHelper.createScreenshotApp(
        device: device,
        screenshotKey: '${description}_${device.name}',
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
        screenshotKey: '${description}_${device.name}',
        customPath: config.outputDirectory,
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
