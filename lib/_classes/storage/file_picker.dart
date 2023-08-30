// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/file_parser.dart';
import 'package:app_finance/_mixins/file/file_import_mixin.dart';
import 'package:csv/csv.dart';
import 'package:xml/xml.dart';

typedef FileScope = List<List<dynamic>>;

class FilePicker with FileImportMixin {
  static const csvFormat = 'csv';
  static const qifFormat = 'qif';
  static const ofxFormat = 'ofx';
  static const fileFormats = [csvFormat, qifFormat, ofxFormat];
  final List<String> ext;
  List<String> columnMap = [
    FileParser.attrBillUuid,
    FileParser.attrBillAmount,
    FileParser.attrBillComment,
    FileParser.attrCategoryName,
    FileParser.attrBillDate,
    FileParser.attrBillType,
  ];
  final header = [
    AppLocale.labels.uuid,
    AppLocale.labels.expense,
    AppLocale.labels.description,
    AppLocale.labels.budget,
    AppLocale.labels.balanceDate,
    AppLocale.labels.flowTypeTooltip,
  ];

  FilePicker(this.ext);

  FileScope _parseCsv(String content, String splitter) {
    final result = CsvToListConverter(eol: splitter).convert(content);
    columnMap = List<String>.filled(result.first.length, '');
    return result;
  }

  FileScope _parseQif(String content, String splitter) {
    final scope = content.split(splitter);
    int idx = 1;
    Map<String, int> mapping = {
      'N': 0, // "Number" for the transaction
      'T': 1, // "Total" amount
      'P': 2, // "Payee"
      'L': 3, // "Category/Account Line"
      'D': 4, // "Date"
    };
    int billType = 5;
    FileScope result = [header];
    result.add(List<dynamic>.filled(header.length, null));
    for (int i = 0; i < scope.length; i++) {
      if (scope[i].isEmpty) {
        continue;
      }
      final key = scope[i].substring(0, 1);
      final value = scope[i].substring(1);
      if (key == '^') {
        idx++;
        result.add(List<dynamic>.filled(header.length, null));
        continue;
      }
      int? pos = mapping[key];
      if (pos != null) {
        if (key == 'T') {
          result[idx][pos] = (double.tryParse(value) ?? 0.0).abs().toString();
          result[idx][billType] = (double.tryParse(value) ?? 0) > 0 ? AppLocale.labels.flowTypeInvoice : '';
        } else {
          result[idx][pos] = value;
        }
      }
    }
    if (result.last.every((element) => element == null)) {
      result.removeLast();
    }
    return result;
  }

  FileScope _parseOfx(String content) {
    FileScope result = [header];
    final xmlData = XmlDocument.parse(content);
    int amountType = 1;
    int dateType = 4;
    int billType = 5;
    Map<String, int> mapping = {
      'FITID': 0, // Unique ID
      'TRNAMT': amountType, // Amount
      'NAME': 2, // Description
      'DTPOSTED': dateType, // Date
    };
    for (XmlElement node in xmlData.findAllElements('STMTTRN')) {
      final tmp = List<dynamic>.filled(6, null);
      for (XmlElement element in node.childElements) {
        int? pos = mapping[element.name.toString()];
        String value = element.innerText;
        if (pos != null) {
          if (pos == dateType) {
            List<String> date = value.split('');
            date.insert(8, 'T');
            tmp[pos] = date.join('');
          } else if (pos == amountType) {
            double nm = double.tryParse(value) ?? 0.0;
            tmp[pos] = nm.abs().toString();
            tmp[billType] = nm > 0 ? AppLocale.labels.flowTypeInvoice : '';
          } else {
            tmp[pos] = value;
          }
        }
      }
      result.add(tmp);
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
        case ofxFormat:
          return _parseOfx(content);
      }
    } else {
      throw Exception(AppLocale.labels.missingContent);
    }
    return null;
  }
}
