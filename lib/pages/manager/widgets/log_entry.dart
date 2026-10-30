// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';

import 'package:app_finance/_classes/controller/encryption_handler.dart';

class LogEntry {
  final int index;
  final String raw;
  bool isExpanded = false;
  Map<String, dynamic>? _content;
  bool _isParsed = false;

  LogEntry(this.index, this.raw);

  Map<String, dynamic>? get content {
    if (!_isParsed) {
      _isParsed = true;
      try {
        final line = EncryptionHandler.doEncrypt() ? EncryptionHandler.decrypt(raw) : raw;
        _content = json.decode(line) as Map<String, dynamic>;
      } catch (e) {
        _content = null;
      }
    }
    return _content;
  }

  String get type => content?['type']?['name']?.toString() ?? '?';

  DateTime? get date {
    final data = content?['data'];
    return DateTime.tryParse(data?['updatedAt'] ?? data?['createdAt'] ?? '');
  }

  String get formatted => content != null ? const JsonEncoder.withIndent('  ').convert(content) : raw;
}
