// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:io';
import 'package:grinder/grinder.dart';
import 'package:yaml/yaml.dart';
import 'package:csv/csv.dart';

void arb2csv(String path, RegExp? filter) {
  final arbDir = Directory(path);
  if (!arbDir.existsSync()) {
    log('Error: Directory not found');
    return;
  }
  List<List<String>> data = [
    ['key']
  ];
  for (var file in arbDir.listSync()) {
    if (file is File && file.path.endsWith('.arb') && (filter == null || file.path.contains(filter))) {
      log('- ${file.path}');
      final regex = RegExp(r'app_(.*?)\.arb');
      data[0].add(regex.firstMatch(file.path)!.group(1).toString());
      int i = 1;
      final scope = loadYaml(file.readAsStringSync()) as Map;
      for (var pair in scope.entries) {
        if (pair.key.toString().contains('@')) {
          continue;
        }
        if (data.length <= i) {
          data.add([pair.key]);
        }
        data[i].add(pair.value);
        i++;
      }
    }
  }
  ProcessResult hash = Process.runSync('git', ['log', '-n', '1', '--pretty=format:"%H"'], runInShell: true);
  final csvPath = 'localization_${hash.stdout.toString().replaceAll('"', '')}.csv';
  final csv = File('./$csvPath');
  csv.writeAsStringSync(const ListToCsvConverter().convert(data));
  log('Done, `$csvPath`!');
}

bool sortArbKeys(String path) {
  log('Checking $path');
  final arbDir = Directory(path);
  bool isChanged = false;

  if (!arbDir.existsSync()) {
    log('Error: Directory not found');
    return true;
  }

  for (var file in arbDir.listSync()) {
    if (file is File && file.path.endsWith('.arb')) {
      log('- ${file.path}');
      isChanged |= sortArbFileKeys(file);
    }
  }
  if (isChanged) {
    log('Labels reordered');
  } else {
    log('Nothing was changed');
  }
  return isChanged;
}

bool sortArbFileKeys(File file) {
  final jsonContent = file.readAsStringSync();
  final arbMap = json.decode(jsonContent) as Map<String, dynamic>;

  final entries = arbMap.entries.toList();

  entries.sort((a, b) {
    final aKey = a.key.startsWith('@') ? a.key.substring(1) : a.key;
    final bKey = b.key.startsWith('@') ? b.key.substring(1) : b.key;
    if (aKey == bKey) {
      if (a.key.startsWith('@')) {
        return 1;
      }
      if (b.key.startsWith('@')) {
        return -1;
      }
    }
    return aKey.compareTo(bKey);
  });

  final sortedArbMap = Map.fromEntries(entries);

  const encoder = JsonEncoder.withIndent('    ');
  var jsonOutputContent = encoder.convert(sortedArbMap);
  file.writeAsStringSync(jsonOutputContent);
  return jsonOutputContent != jsonContent;
}
