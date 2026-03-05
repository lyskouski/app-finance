// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';
import 'dart:ui' as ui;
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'device_configs.dart';

class ScreenshotHelper {
  static const String _baseOutputDir = 'screenshots';
  static final Map<String, GlobalKey> _screenshotKeys = {};

  /// Configure device-specific settings for the test
  static void configureDevice(WidgetTester tester, DeviceConfig device) {
    tester.view.physicalSize = device.size;
    tester.view.devicePixelRatio = device.devicePixelRatio;

    // Set platform-specific defaults
    if (device.platform != null) {
      debugDefaultTargetPlatformOverride = device.platform;
    }
  }

  /// Reset device configuration after test
  static void resetDevice(WidgetTester tester) {
    tester.view.resetPhysicalSize();
    tester.view.resetDevicePixelRatio();
    debugDefaultTargetPlatformOverride = null;
  }

  /// Create a screenshot-ready app wrapper
  static Widget createScreenshotApp({
    required Widget child,
    required DeviceConfig device,
    String? screenshotKey,
  }) {
    final key = GlobalKey();
    if (screenshotKey != null) {
      _screenshotKeys[screenshotKey] = key;
    }

    return RepaintBoundary(
      key: key,
      child: MediaQuery(
        data: MediaQueryData(
          size: device.logicalSize,
          devicePixelRatio: device.devicePixelRatio,
          padding: device.safeArea,
          viewInsets: EdgeInsets.zero,
          platformBrightness: Brightness.light,
        ),
        child: Theme(
          data: _getThemeForPlatform(device.platform),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: child,
          ),
        ),
      ),
    );
  }

  /// Capture screenshot and save to file
  static Future<void> captureScreenshot({
    required String testName,
    required DeviceConfig device,
    String? customPath,
    String? screenshotKey,
    double? pixelRatio,
  }) async {
    final key = screenshotKey != null ? _screenshotKeys[screenshotKey] : null;
    if (key?.currentContext == null) {
      throw FlutterError('No valid screenshot context found. `createScreenshotApp` wrapper is needed.');
    }

    try {
      final boundary = key!.currentContext!.findRenderObject() as RenderRepaintBoundary;
      final effectivePixelRatio = pixelRatio ?? device.devicePixelRatio;
      final image = await boundary.toImage(pixelRatio: effectivePixelRatio);
      final bytes = await image.toByteData(format: ui.ImageByteFormat.png);

      if (bytes != null) {
        await _saveScreenshot(
          bytes.buffer.asUint8List(),
          testName,
          device,
          customPath,
        );
      }
    } catch (e) {
      throw FlutterError('Failed to capture screenshot: $e');
    }
  }

  /// Save screenshot bytes to file
  static Future<void> _saveScreenshot(
    Uint8List bytes,
    String testName,
    DeviceConfig device,
    String? customPath,
  ) async {
    final sanitizedTestName = testName.replaceAll(RegExp(r'[^\w\-_.]'), '_');
    final sanitizedDeviceName = device.name.replaceAll(RegExp(r'[^\w\-_.]'), '_');

    final outputDir = customPath ?? _baseOutputDir;
    final fullPath = '$outputDir/$sanitizedDeviceName';

    final directory = Directory(fullPath);
    if (!directory.existsSync()) {
      directory.createSync(recursive: true);
    }

    final filename = '$sanitizedTestName.png';
    final file = File('$fullPath/$filename');

    await file.writeAsBytes(bytes);
    debugPrint('Screenshot saved: ${file.path}');
  }

  /// Get platform-specific theme
  static ThemeData _getThemeForPlatform(TargetPlatform? platform) {
    switch (platform) {
      case TargetPlatform.iOS:
        return ThemeData.light().copyWith(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        );
      case TargetPlatform.android:
        return ThemeData.light().copyWith(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        );
      case TargetPlatform.macOS:
      case TargetPlatform.windows:
      case TargetPlatform.linux:
        return ThemeData.light().copyWith(
          visualDensity: VisualDensity.standard,
        );
      default:
        return ThemeData.light().copyWith(
          visualDensity: VisualDensity.adaptivePlatformDensity,
        );
    }
  }

  /// Clean up all generated screenshots
  static Future<void> cleanupScreenshots([String? customPath]) async {
    final outputDir = Directory(customPath ?? _baseOutputDir);
    if (outputDir.existsSync()) {
      outputDir.deleteSync(recursive: true);
      debugPrint('Cleaned up screenshots directory: ${outputDir.path}');
    }
  }

  /// Generate comparison report between screenshots
  static Future<void> generateComparisonReport({
    required String baseDir,
    required String compareDir,
    String? outputFile,
  }) async {
    // This could be enhanced to generate HTML reports comparing screenshots
    // across different devices and test runs
    final reportFile = File(outputFile ?? 'screenshot_comparison_report.html');
    final buffer = StringBuffer();

    buffer.writeln('<!DOCTYPE html>');
    buffer.writeln('<html><head><title>Screenshot Comparison Report</title></head><body>');
    buffer.writeln('<h1>Screenshot Comparison Report</h1>');
    buffer.writeln('<p>Generated on: ${DateTime.now()}</p>');
    // Add more comparison logic here
    buffer.writeln('</body></html>');

    await reportFile.writeAsString(buffer.toString());
  }

  /// Extension for WidgetTester with screenshot functionality
  static Future<void> expectScreenshotForDevice(
    WidgetTester tester,
    DeviceConfig device,
    String goldenKey, {
    double threshold = 0.01,
  }) async {
    final finder = find.byType(RepaintBoundary).first;

    await expectLater(
      finder,
      matchesGoldenFile('goldens/${device.name.replaceAll(' ', '_').toLowerCase()}/$goldenKey.png'),
      skip: !kIsWeb && Platform.isLinux && !Platform.environment.containsKey('GITHUB_ACTIONS'),
    );
  }
}

/// Extension methods for easier testing
extension ScreenshotTestHelpers on WidgetTester {
  /// Pump and settle with device-specific timing
  Future<void> pumpAndSettleForDevice(DeviceConfig device) async {
    // Mobile devices might need more time for animations
    final duration = device.platform == TargetPlatform.iOS || device.platform == TargetPlatform.android
        ? const Duration(milliseconds: 500)
        : const Duration(milliseconds: 200);

    await pumpAndSettle(duration);
  }

  /// Load device-specific assets
  Future<void> loadDeviceAssets(DeviceConfig device) async {
    // Preload any device-specific assets or fonts
    await runAsync(() async {
      // Load platform-specific assets here if needed
    });
    await pumpAndSettle();
  }
}
