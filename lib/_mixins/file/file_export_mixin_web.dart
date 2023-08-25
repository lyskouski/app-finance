// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

mixin FileExportMixin {
  Future<void> exportFile(List<int> codeUnits, String filename) async {
    final blob = html.Blob(['', String.fromCharCodes(codeUnits)]);
    final anchorElement = html.AnchorElement(
      href: html.Url.createObjectUrlFromBlob(blob).toString(),
    )..setAttribute('download', filename);
    html.document.body!.children.add(anchorElement);
    anchorElement.click();
    html.document.body!.children.remove(anchorElement);
  }
}
