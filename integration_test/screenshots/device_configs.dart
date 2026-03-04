// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:flutter/material.dart';

/// Device configuration for screenshot capture
class DeviceConfig {
  const DeviceConfig({
    required this.name,
    required this.size,
    required this.devicePixelRatio,
    this.platform,
    this.safeArea = EdgeInsets.zero,
    this.navigationBarHeight = kBottomNavigationBarHeight,
  });

  final String name;
  final Size size;
  final double devicePixelRatio;
  final TargetPlatform? platform;
  final EdgeInsets safeArea;
  final double navigationBarHeight;

  Size get logicalSize => Size(
        size.width / devicePixelRatio,
        size.height / devicePixelRatio,
      );

  @override
  String toString() => name;
}

/// Platform-specific device configurations
class PlatformDevices {
  // iOS Devices
  static const DeviceConfig iphone15Pro = DeviceConfig(
    name: 'iPhone 15 Pro',
    size: Size(1179, 2556),
    devicePixelRatio: 3.0,
    platform: TargetPlatform.iOS,
    safeArea: EdgeInsets.only(top: 47, bottom: 34),
  );

  static const DeviceConfig iphone15ProMax = DeviceConfig(
    name: 'iPhone 15 Pro Max',
    size: Size(1290, 2796),
    devicePixelRatio: 3.0,
    platform: TargetPlatform.iOS,
    safeArea: EdgeInsets.only(top: 47, bottom: 34),
  );

  static const DeviceConfig iphone14 = DeviceConfig(
    name: 'iPhone 14',
    size: Size(1170, 2532),
    devicePixelRatio: 3.0,
    platform: TargetPlatform.iOS,
    safeArea: EdgeInsets.only(top: 47, bottom: 34),
  );

  static const DeviceConfig iphoneSE = DeviceConfig(
    name: 'iPhone SE 3rd Gen',
    size: Size(750, 1334),
    devicePixelRatio: 2.0,
    platform: TargetPlatform.iOS,
    safeArea: EdgeInsets.only(top: 20, bottom: 0),
  );

  static const DeviceConfig ipadPro = DeviceConfig(
    name: 'iPad Pro 12.9',
    size: Size(2048, 2732),
    devicePixelRatio: 2.0,
    platform: TargetPlatform.iOS,
    safeArea: EdgeInsets.only(top: 24, bottom: 20),
  );

  // Android Devices
  static const DeviceConfig pixel8Pro = DeviceConfig(
    name: 'Pixel 8 Pro',
    size: Size(1344, 2992),
    devicePixelRatio: 2.8,
    platform: TargetPlatform.android,
    safeArea: EdgeInsets.only(top: 24, bottom: 0),
  );

  static const DeviceConfig pixel7a = DeviceConfig(
    name: 'Pixel 7a',
    size: Size(1080, 2400),
    devicePixelRatio: 2.2,
    platform: TargetPlatform.android,
    safeArea: EdgeInsets.only(top: 24, bottom: 0),
  );

  static const DeviceConfig galaxyS24 = DeviceConfig(
    name: 'Galaxy S24',
    size: Size(1080, 2340),
    devicePixelRatio: 3.0,
    platform: TargetPlatform.android,
    safeArea: EdgeInsets.only(top: 28, bottom: 0),
  );

  static const DeviceConfig galaxyS24Ultra = DeviceConfig(
    name: 'Galaxy S24 Ultra',
    size: Size(1440, 3120),
    devicePixelRatio: 3.0,
    platform: TargetPlatform.android,
    safeArea: EdgeInsets.only(top: 34, bottom: 0),
  );

  static const DeviceConfig galaxyTabS9 = DeviceConfig(
    name: 'Galaxy Tab S9',
    size: Size(1600, 2560),
    devicePixelRatio: 2.0,
    platform: TargetPlatform.android,
    safeArea: EdgeInsets.only(top: 24, bottom: 0),
  );

  // Desktop Devices
  static const DeviceConfig macBookPro14 = DeviceConfig(
    name: 'MacBook Pro 14"',
    size: Size(3024, 1964),
    devicePixelRatio: 2.0,
    platform: TargetPlatform.macOS,
    safeArea: EdgeInsets.zero,
    navigationBarHeight: 0,
  );

  static const DeviceConfig macBookAir13 = DeviceConfig(
    name: 'MacBook Air 13"',
    size: Size(2560, 1664),
    devicePixelRatio: 2.0,
    platform: TargetPlatform.macOS,
    safeArea: EdgeInsets.zero,
    navigationBarHeight: 0,
  );

  static const DeviceConfig windows1080p = DeviceConfig(
    name: 'Windows 1080p',
    size: Size(1920, 1080),
    devicePixelRatio: 1.0,
    platform: TargetPlatform.windows,
    safeArea: EdgeInsets.zero,
    navigationBarHeight: 0,
  );

  static const DeviceConfig windows1440p = DeviceConfig(
    name: 'Windows 1440p',
    size: Size(2560, 1440),
    devicePixelRatio: 1.25,
    platform: TargetPlatform.windows,
    safeArea: EdgeInsets.zero,
    navigationBarHeight: 0,
  );

  static const DeviceConfig linux1080p = DeviceConfig(
    name: 'Linux 1080p',
    size: Size(1920, 1080),
    devicePixelRatio: 1.0,
    platform: TargetPlatform.linux,
    safeArea: EdgeInsets.zero,
    navigationBarHeight: 0,
  );

  // Grouped collections
  static const List<DeviceConfig> iPhones = [
    iphone15Pro,
    iphone15ProMax,
    iphone14,
    iphoneSE,
  ];

  static const List<DeviceConfig> iPads = [
    ipadPro,
  ];

  static const List<DeviceConfig> androidPhones = [
    pixel8Pro,
    pixel7a,
    galaxyS24,
    galaxyS24Ultra,
  ];

  static const List<DeviceConfig> androidTablets = [
    galaxyTabS9,
  ];

  static const List<DeviceConfig> desktops = [
    macBookPro14,
    macBookAir13,
    windows1080p,
    windows1440p,
    linux1080p,
  ];

  static const List<DeviceConfig> allDevices = [
    ...iPhones,
    ...iPads,
    ...androidPhones,
    ...androidTablets,
    ...desktops,
  ];

  static const List<DeviceConfig> mobileDevices = [
    ...iPhones,
    ...androidPhones,
  ];

  static const List<DeviceConfig> tabletDevices = [
    ...iPads,
    ...androidTablets,
  ];
}
