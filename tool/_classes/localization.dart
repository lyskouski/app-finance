// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:convert';
import 'dart:io';
import 'package:grinder/grinder.dart';
import 'package:yaml/yaml.dart';
import 'package:csv/csv.dart';

typedef LocaleMap = Map<String, Map<String, String>>;

void arb2csv(String path, RegExp? filter, {String? csvPath}) {
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
  csvPath ??= 'localization_${hash.stdout.toString().replaceAll('"', '')}.csv';
  final csv = File('./$csvPath');
  csv.writeAsStringSync(const ListToCsvConverter().convert(data));
  log('Done, `$csvPath`!');
}

void csv2arb(String path, String file) {
  log('Identifying differences:');
  for (final locale in getDiff(file).entries) {
    final arbPath = '$path/app_${locale.key}.arb';
    final arb = File('$path/app_${locale.key}.arb');
    if (!arb.existsSync()) {
      log('Creating new localization: $arbPath');
      Process.runSync('cp', ['$path/app_en.arb', arbPath], runInShell: true);
      log('[!] Update: $path/index.dart');
      log('[!] Update: ./l10n.yaml');
    }
    log('Updating: $arbPath');
    String content = arb.readAsStringSync();
    for (final label in locale.value.entries) {
      content = content.replaceFirst(
        RegExp('"${label.key}": "(.*?)",'),
        '"${label.key}": "${label.value.replaceAll('"', '\\"')}",',
      );
      log('- [${locale.key}] ${label.key}: ${label.value}');
    }
    arb.writeAsStringSync(content);
  }
  log('Done');
}

LocaleMap getDiff(String file) {
  const oldFiles = 'all.tar';
  const oldFile = 'localization-old.csv';
  final regex = RegExp(r'localization_(.*?)\.csv');
  final hash = regex.firstMatch(file)!.group(1).toString();
  Process.runSync('git', ['archive', '--format=tar', hash, 'lib/l10n', '-o', oldFiles], runInShell: true);
  Process.runSync('tar', ['-xf', oldFiles, '-C', 'build'], runInShell: true);
  Process.runSync('rm', [oldFiles], runInShell: true);
  arb2csv('./build/lib/l10n', null, csvPath: oldFile);
  final initial = list2map(const CsvToListConverter().convert(File(oldFile).readAsStringSync()));
  final content = File(file).readAsStringSync();
  String splitter = content.contains('\r\n') ? '\r\n' : '\n';
  final current = list2map(CsvToListConverter(eol: splitter).convert(content));
  return current.map((key, value) {
    return MapEntry(
        key,
        value.entries
            .where((entry) => initial.values.every((firstMapValue) => !firstMapValue.containsValue(entry.value)))
            .fold<Map<String, String>>({}, (acc, entry) {
          acc[entry.key] = entry.value;
          return acc;
        }));
  });
}

LocaleMap list2map(List<List<dynamic>> scope) {
  // ignore: prefer_collection_literals
  final result = LocaleMap();
  for (int i = 0; i < scope.length; i++) {
    for (int j = 1; j < scope[i].length; j++) {
      if (i == 0) {
        result[scope[i][j]] = <String, String>{};
      } else {
        result[scope[0][j]]![scope[i][0]] = scope[i][j];
      }
    }
  }
  return result;
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
