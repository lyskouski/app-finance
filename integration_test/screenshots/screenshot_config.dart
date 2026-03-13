// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter/foundation.dart';

import 'device_config.dart';

class ScreenshotConfig {
  ScreenshotConfig({
    this.enabledPlatforms = const {
      'ios': true,
      'android': true,
      'macos': true,
      'windows': true,
      'linux': false, // Disabled by default for CI compatibility
    },
    this.enabledDeviceTypes = const {
      'phones': true,
      'tablets': true,
      'desktops': true,
    },
    this.outputDirectory = 'screenshots',
    this.pixelRatio = 3.0,
    this.animationSettleTime = const Duration(milliseconds: 500),
    this.generateHtmlReport = true,
    this.enableGoldenComparison = true,
    this.comparisonThreshold = 0.05, // 5% difference threshold
  });

  final Map<String, bool> enabledPlatforms;
  final Map<String, bool> enabledDeviceTypes;
  final String outputDirectory;
  final double pixelRatio;
  final Duration animationSettleTime;
  final bool generateHtmlReport;
  final bool enableGoldenComparison;
  final double comparisonThreshold;

  /// Get filtered device list based on configuration
  List<DeviceConfig> getEnabledDevices() {
    final devices = <DeviceConfig>[];

    // Add phones if enabled
    if (enabledDeviceTypes['phones'] == true) {
      if (enabledPlatforms['ios'] == true) {
        devices.addAll(PlatformDevices.iPhones);
      }
      if (enabledPlatforms['android'] == true) {
        devices.addAll(PlatformDevices.androidPhones);
      }
    }

    // Add tablets if enabled
    if (enabledDeviceTypes['tablets'] == true) {
      if (enabledPlatforms['ios'] == true) {
        devices.addAll(PlatformDevices.iPads);
      }
      if (enabledPlatforms['android'] == true) {
        devices.addAll(PlatformDevices.androidTablets);
      }
    }

    // Add desktops if enabled
    if (enabledDeviceTypes['desktops'] == true) {
      devices.addAll(PlatformDevices.desktops.where((device) {
        switch (device.platform) {
          case TargetPlatform.macOS:
            return enabledPlatforms['macos'] == true;
          case TargetPlatform.windows:
            return enabledPlatforms['windows'] == true;
          case TargetPlatform.linux:
            return enabledPlatforms['linux'] == true;
          default:
            return false;
        }
      }));
    }

    return devices;
  }
}

/// Predefined configurations for different testing scenarios
class ScreenshotPresets {
  /// Mobile-only configuration for quick testing
  static final ScreenshotConfig mobileOnly = ScreenshotConfig(
    enabledPlatforms: {
      'ios': true,
      'android': true,
      'macos': false,
      'windows': false,
      'linux': false,
    },
    enabledDeviceTypes: {
      'phones': true,
      'tablets': false,
      'desktops': false,
    },
  );

  /// iOS-only configuration
  static final ScreenshotConfig iosOnly = ScreenshotConfig(
    enabledPlatforms: {
      'ios': true,
      'android': false,
      'macos': false,
      'windows': false,
      'linux': false,
    },
    enabledDeviceTypes: {
      'phones': true,
      'tablets': true,
      'desktops': false,
    },
  );

  /// Android-only configuration
  static final ScreenshotConfig androidOnly = ScreenshotConfig(
    enabledPlatforms: {
      'ios': false,
      'android': true,
      'macos': false,
      'windows': false,
      'linux': false,
    },
    enabledDeviceTypes: {
      'phones': true,
      'tablets': true,
      'desktops': false,
    },
  );

  /// Desktop-only configuration
  static final ScreenshotConfig desktopOnly = ScreenshotConfig(
    enabledPlatforms: {
      'ios': false,
      'android': false,
      'macos': true,
      'windows': true,
      'linux': true,
    },
    enabledDeviceTypes: {
      'phones': false,
      'tablets': false,
      'desktops': true,
    },
  );

  /// CI/CD optimized configuration (fewer devices for faster builds)
  static final ScreenshotConfig ciOptimized = ScreenshotConfig(
    enabledPlatforms: {
      'ios': true,
      'android': true,
      'macos': false,
      'windows': false,
      'linux': false,
    },
    enabledDeviceTypes: {
      'phones': true,
      'tablets': false,
      'desktops': false,
    },
    pixelRatio: 2.0, // Reduced for faster generation
    generateHtmlReport: false,
    comparisonThreshold: 0.1, // More lenient for CI
  );

  /// Full comprehensive testing
  static final ScreenshotConfig comprehensive = ScreenshotConfig(
    enabledPlatforms: {
      'ios': true,
      'android': true,
      'macos': true,
      'windows': true,
      'linux': true,
    },
    enabledDeviceTypes: {
      'phones': true,
      'tablets': true,
      'desktops': true,
    },
    pixelRatio: 3.0,
    generateHtmlReport: true,
    comparisonThreshold: 0.03, // Stricter comparison
  );
}
