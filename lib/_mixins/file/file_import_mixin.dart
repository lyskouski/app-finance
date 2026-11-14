// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';

mixin FileImportMixin {
  Future<Uint8List?> importFileBytes(List<String> ext) async {
    final PlatformFile? file;
    if (defaultTargetPlatform == TargetPlatform.android) {
      file = await FilePicker.pickFile(type: FileType.any);
    } else {
      file = await FilePicker.pickFile(type: FileType.custom, allowedExtensions: ext);
    }
    return file != null ? await file.readAsBytes() : null;
  }

  Future<String?> importFile(List<String> ext) async {
    final bytes = await importFileBytes(ext);
    return bytes != null ? String.fromCharCodes(bytes) : null;
  }
}
