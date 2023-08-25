// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:file_picker/file_picker.dart';

mixin FileExportMixin {
  Future<void> exportFile(List<int> codeUnits, String filename) async {
    final path = await FilePicker.platform.saveFile(dialogTitle: AppLocale.labels.outputFile, fileName: filename);
    if (path != null) {
      final saveFile = File(path);
      await saveFile.writeAsBytes(codeUnits);
    }
  }
}
