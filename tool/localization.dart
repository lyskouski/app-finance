// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

void sortArbKeys(String path) {
  print('Checking $path');
  final arbDir = Directory(path);

  if (!arbDir.existsSync()) {
    print('Error: Directory not found');
    return;
  }

  for (var file in arbDir.listSync()) {
    if (file is File && file.path.endsWith('.arb')) {
      print('- ${file.path}');
      sortArbFileKeys(file);
    }
  }
}

void sortArbFileKeys(File file) {
  final jsonContent = file.readAsStringSync();
  final arbMap = json.decode(jsonContent) as Map<String, dynamic>;

  final entries = arbMap.entries.toList();

  entries.sort((a, b) {
    final aKey = a.key.startsWith('@') ? a.key.substring(1) : a.key;
    final bKey = b.key.startsWith('@') ? b.key.substring(1) : b.key;
    return aKey.compareTo(bKey);
  });

  final sortedArbMap = Map.fromEntries(entries);

  const encoder = JsonEncoder.withIndent('    ');
  file.writeAsStringSync(encoder.convert(sortedArbMap));
}
