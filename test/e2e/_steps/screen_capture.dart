// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';
import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class ScreenCapture {
  static final GlobalKey _id = GlobalKey();
  static int _step = 0;
  static final String _imgLocation = '${Directory.current.absolute.path}/coverage/images';
  static bool _saveScreen = false;

  static GlobalKey getKey() {
    return _id;
  }

  static void enableScreenCapture() {
    _saveScreen = true;
    dropImages();
  }

  static Future<void> seize(String name) async {
    if (!_saveScreen || _id.currentContext == null) {
      return;
    }
    int currentStep = _step++;
    // debugDumpApp();
    final boundary = _id.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
    ByteData? bytes = await image.toByteData(format: ui.ImageByteFormat.png);
    Uint8List imageData = bytes!.buffer.asUint8List();
    File file = File('$_imgLocation/${currentStep.toString().padLeft(8, '0')}_$name.png');
    file.createSync(recursive: true, exclusive: false);
    file.writeAsBytesSync(imageData);
  }

  static Future<void> dropImages() async {
    final dir = Directory(_imgLocation);
    if (!dir.existsSync()) {
      return;
    }
    dir.deleteSync(recursive: true);
  }
}
