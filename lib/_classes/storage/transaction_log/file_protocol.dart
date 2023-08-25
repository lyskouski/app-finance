// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/transaction_log/interface_protocol.dart';

class FileProtocol implements InterfaceProtocol {
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

  Future<void> save(dynamic data) async {
    if (data.isEmpty()) {
      callbackMessage(message = AppLocale.labels.isRequired);
      return null;
    }
    // tbd
  }

  Future<void> load(dynamic data) async {
    // tbd
  }
}
