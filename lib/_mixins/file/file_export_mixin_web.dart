// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert' show base64Encode, utf8;
// ignore: avoid_web_libraries_in_flutter
import 'package:web/web.dart' as web;

mixin FileExportMixin {
  Future<void> exportFile(List<int> codeUnits, String filename) async {
    final text = '\n${String.fromCharCodes(codeUnits)}';
    final bytes = utf8.encode(text);
    final web.HTMLAnchorElement anchor = web.document.createElement('a') as web.HTMLAnchorElement
      ..href = "data:application/octet-stream;base64,${base64Encode(bytes)}"
      ..style.display = 'none'
      ..download = filename;

    web.document.body!.appendChild(anchor);
    anchor.click();
    web.document.body!.removeChild(anchor);
  }
}
