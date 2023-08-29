// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:async';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_mixins/file/file_import_mixin.dart';
import 'package:csv/csv.dart';

typedef FileScope = List<List<dynamic>>;

class FileParser with FileImportMixin {
  static const csvFormat = 'csv';
  static const qifFormat = 'qif';
  static const fileFormats = [csvFormat, qifFormat];
  final List<String> ext;

  FileParser(this.ext);

  FileScope _parseCsv(String content, String splitter) {
    return CsvToListConverter(eol: splitter).convert(content);
  }

  FileScope _parseQif(String content, String splitter) {
    final header = ['uuid', 'amount', 'comment', 'category'];
    FileScope result = [header];
    final scope = content.split(splitter);
    int idx = 0;
    Map<String, int> mapping = {
      'N': 0, // "Number" for the transaction
      'T': 1, // "Total" amount
      'P': 2, // "Payee"
      'L': 3, // "Category/Account Line"
    };
    for (int i = 0; i < scope.length; i++) {
      if (scope[i].isEmpty) {
        continue;
      }
      final key = scope[i].substring(0, 1);
      final value = scope[i].substring(1);
      if (key == '!') {
        idx++;
        result.add(List<dynamic>.filled(header.length, null));
        continue;
      }
      if (idx == 0) {
        continue;
      }
      int? pos = mapping[key];
      if (pos != null) {
        result[idx][pos] = value;
      }
    }
    return result;
  }

  Future<FileScope?> pickFile() async {
    String? content = await importFile(ext);
    if (content != null) {
      final splitter = content.contains('\r\n') ? '\r\n' : '\n';
      switch (ext.first) {
        case csvFormat:
          return _parseCsv(content, splitter);
        case qifFormat:
          return _parseQif(content, splitter);
      }
    } else {
      throw Exception(AppLocale.labels.missingContent);
    }
    return null;
  }
}
