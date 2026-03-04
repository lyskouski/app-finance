// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

// flutter test integration_test/screenshots/capture_test.dart

import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../test/pump_main.dart';
import 'device_configs.dart';
import 'screenshot_helper.dart';
import 'screenshot_config.dart';

void main() {
  group('Cross-Platform Screenshots:', () {
    TestWidgetsFlutterBinding.ensureInitialized();

    final preset = ScreenshotPresets.comprehensive;
    // This test is meant to GENERATE screenshots, not compare them.
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

    // Test home screen on all enabled devices
    group('Home Screen:', () {
      for (final device in enabledDevices) {
        _screenshotForDevice('1_home', device, config);
      }
    });

    // Test navigation functionality
    group('Navigation:', () {
      for (final device in enabledDevices) {
        _screenshotForDevice('2_chat_jane', device, config, beforeScreenshot: (tester) async {
          await tester.pumpAndSettle(config.animationSettleTime);
          final janeButton = find.text('Jane');
          if (janeButton.evaluate().isNotEmpty) {
            await tester.tap(janeButton);
            await tester.pumpAndSettle(config.animationSettleTime);
          }
        });
      }
    });

    // Platform-specific tests
    group('Platform Specific Features:', () {
      final mobileDevices = enabledDevices
          .where((d) => d.platform == TargetPlatform.iOS || d.platform == TargetPlatform.android)
          .toList();

      final desktopDevices = enabledDevices
          .where((d) =>
              d.platform == TargetPlatform.macOS ||
              d.platform == TargetPlatform.windows ||
              d.platform == TargetPlatform.linux)
          .toList();

      // Mobile-specific tests
      if (mobileDevices.isNotEmpty) {
        group('Mobile Features:', () {
          for (final device in mobileDevices) {
            _screenshotForDevice('mobile_menu', device, config, beforeScreenshot: (tester) async {
              await tester.pumpAndSettle(config.animationSettleTime);
              // Test mobile-specific menu behavior
              final drawer = find.byTooltip('Open navigation drawer');
              if (drawer.evaluate().isNotEmpty) {
                await tester.tap(drawer);
                await tester.pumpAndSettle(config.animationSettleTime);
              }
            });
          }
        });
      }

      // Desktop-specific tests
      if (desktopDevices.isNotEmpty) {
        group('Desktop Features:', () {
          for (final device in desktopDevices) {
            _screenshotForDevice('desktop_layout', device, config, beforeScreenshot: (tester) async {
              await tester.pumpAndSettle(config.animationSettleTime);
              // Desktop layout should show full navigation
            });
          }
        });
      }
    });
  });
}

/// Capture screenshot for a specific device
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
