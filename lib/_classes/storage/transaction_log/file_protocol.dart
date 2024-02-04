// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/transaction_log/abstract_protocol.dart';
import 'package:app_finance/_classes/storage/transaction_log/interface_protocol.dart';
import 'package:app_finance/_mixins/file/file_import_mixin.dart';
import 'package:app_finance/_mixins/file/file_export_mixin_web.dart'
    if (dart.library.io) 'package:app_finance/_mixins/file/file_export_mixin.dart';

class FileProtocol extends AbstractProtocol with FileImportMixin, FileExportMixin implements InterfaceProtocol {
  @override
  final Function callbackMessage;
  @override
  final Function callbackProgress;
  String message = '';
  bool inProgress = false;

  FileProtocol({
    required this.callbackMessage,
    required this.callbackProgress,
  });

  @override
  Future<void> save(dynamic data) async {
    if (data.isEmpty) {
      callbackMessage(message = AppLocale.labels.isRequired);
      return;
    }
    callbackProgress(inProgress = true);
    final codeUnits = await exportTransactions();
    await exportFile(codeUnits, data);
    callbackProgress(inProgress = false);
    callbackMessage(message = AppLocale.labels.success);
  }

  @override
  Future<void> load(dynamic data, [bool isEncrypted = true, bool isCleaned = false]) async {
    callbackProgress(inProgress = true);
    final content = await importFile(['log']);
    if (content != null) {
      if (isCleaned) {
        clearTransactions();
      }
      importTransactions(content.codeUnits, isEncrypted);
      callbackMessage(message = AppLocale.labels.success);
    } else {
      callbackMessage(message = AppLocale.labels.missingContent);
    }
    callbackProgress(inProgress = false);
  }
}
