// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';
import 'dart:ui' as ui;

import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_theme.dart';
import 'package:app_finance/_classes/gen/generate_with_method_setters.dart';
import 'package:app_finance/_mixins/shared_preferences_mixin.dart';
import 'package:app_finance/main.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

@GenerateNiceMocks([MockSpec<SharedPreferences>()])
import 'pump_main.mocks.dart';
@GenerateWithMethodSetters([MockSharedPreferences])
import 'pump_main.wrapper.dart';

class PumpMain {
  static GlobalKey id = GlobalKey();
  static int step = 0;
  static String imgLocation = '${Directory.current.absolute.path}/coverage';
  static bool _saveScreen = false;

  static void enableScreenCapture() {
    _saveScreen = true;
    PumpMain.dropImages();
  }

  static Future<void> takeScreenshot(String name) async {
    if (!_saveScreen) {
      return;
    }
    int currentStep = step++;
    // debugDumpApp();
    final boundary = id.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List imageData = bytes!.buffer.asUint8List();
    File file = File('$imgLocation/${currentStep.toString().padLeft(8, '0')}_$name.png');
    file.createSync(recursive: true, exclusive: false);
    file.writeAsBytesSync(imageData);
  }

  static Future<void> dropImages() async {
    final dir = Directory(imgLocation);
    if (!dir.existsSync()) {
      return;
    }
    final scope = dir.listSync(recursive: true);
    for (FileSystemEntity entity in scope) {
      if (entity.uri.pathSegments.last.split('.').last == 'png') {
        entity.deleteSync();
      }
    }
  }

  static init(WidgetTester tester, [bool isIntegration = false]) async {
    final pumpMain = PumpMain();
    await pumpMain.initPref(isIntegration);
    await pumpMain.initMain(tester, isIntegration);
  }

  AppData getStore(bool isIntegration) {
    final appData = AppData();
    if (!isIntegration) {
      appData.isLoading = false;
    }
    return appData;
  }

  Future<void> initPref(bool isIntegration) async {
    if (isIntegration) {
      SharedPreferencesMixin.pref = await SharedPreferences.getInstance();
    } else {
      final pref = WrapperMockSharedPreferences();
      pref.mockGetString = (value) => '';
      SharedPreferencesMixin.pref = pref;
    }
  }

  Future<void> initMain(WidgetTester tester, bool isIntegration) async {
    await tester.pumpWidget(MultiProvider(
      providers: [
        ChangeNotifierProvider<AppData>(
          create: (_) => getStore(isIntegration),
        ),
        ChangeNotifierProvider<AppTheme>(
          create: (_) => AppTheme(ThemeMode.system),
        ),
        ChangeNotifierProvider<AppLocale>(
          create: (_) => AppLocale(AppLocale.fromCode('en')),
        ),
      ],
      child: RepaintBoundary(
        key: id,
        child: const MyApp(),
      ),
    ));
  }
}
