// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

mixin FileImportMixin {
  Future<String?> importFile(List<String> ext) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ext,
      withData: true,
    );
    String? content;
    if (result != null) {
      Uint8List? fileBytes = result.files.first.bytes;
      if (fileBytes != null) {
        content = String.fromCharCodes(fileBytes);
      } else {
        final file = File(result.paths.first.toString());
        content = file.readAsStringSync();
      }
    }
    return content;
  }
}
