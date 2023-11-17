// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';
import 'package:path/path.dart' as path;
import '../_classes/dir.dart' as dir;

dependencyGraph() {
  final rootFolder = Directory('${Directory.current.path}/lib');
  List<String> files = dir.scanDirectory(rootFolder).where((v) => !(v.contains('l10n/') || '/main.dart' == v)).toList();
  const eol = '\n';

  final graph = StringBuffer();
  graph.writeAll([
    'digraph G {',
    '  node [shape=record, width=.1, height=.1];',
    '  ranksep=.75;',
    '  edge [penwidth=1.3];',
    // '  compound=true;',
    // '  concentrate=true;',
    '  nodesep=.05;',
    '  rankdir=LR;',
    '',
  ], eol);

  final structure = <String, Map<String, List<String>>>{};
  for (final filePath in files) {
    final parts = filePath.split('/');
    final key = parts[1];
    if (structure[key] == null) {
      structure[key] = {};
    }
    final path = convertPath(filePath, false).split(':');
    final sub = path[0];
    if (structure[key]![sub] == null) {
      structure[key]![sub] = [];
    }
    structure[key]![sub]!.add(path[1]);
  }

  final groundList = structure.keys.toList();
  groundList.sort();
  graph.writeAll([
    '  {',
    '    node [shape=plaintext, fontsize=16];',
    '    past -> ${groundList.map((e) => '"$e" -> ').join()} "future";',
    '  }',
    '',
  ], eol);

  for (var entry in structure.entries) {
    for (var sub in entry.value.entries) {
      graph.writeAll([
        '  {',
        '    rank = same; "${entry.key}";',
        '    ${sub.key.replaceAll('/', '_')} ['
            'label="${sub.key.replaceAll('/', ' / ').toUpperCase()}|${sub.value.map((e) => '<$e>$e').join('|')}| ",'
            'fillcolor="silver:white", gradientangle=240, style="filled"'
            '];',
        '  }',
        '',
      ], eol);
    }
  }

  final dependencies = <String>{};
  for (final from in files) {
    final file = File(path.join(Directory.current.path, 'lib/$from'));
    final content = file.readAsStringSync();
    final search = RegExp("import 'package:app_finance/(.*?).dart';");
    for (final to in search.allMatches(content).where((v) => v.groupCount > 0).map((v) => v.group(1)!).toList()) {
      dependencies.add('  ${convertPath(from)} -> ${convertPath(to)} [color="${getColor(from)}"];');
    }
  }
  graph.writeln(dependencies.toList().join(eol));

  graph.writeln('}');
  File(path.join(Directory.current.path, 'coverage/dependencies.dot')).writeAsStringSync(graph.toString());
}

String convertPath(String filePath, [bool isShort = true]) {
  if (filePath.startsWith('/')) {
    filePath = filePath.replaceFirst('/', '');
  }
  final parts = filePath.split('/');
  String sub = '';
  if (parts.length > 1) {
    sub = parts.sublist(1, parts.length - 1).join('_');
  }
  if (sub.isEmpty) {
    sub = '${parts.first}_';
  }
  return isShort ? sub : '$sub:${parts.last.replaceAll('.dart', '')}';
}

String getColor(String filePath) => switch (filePath.split('/')[1]) {
      '_classes' => 'green',
      '_configs' => 'green',
      '_ext' => 'green',
      '_mixins' => 'green',
      'charts' => 'red',
      'components' => '#FF00FF50',
      'design' => '#0000FF50',
      _ => '#F0F0F050',
    };
