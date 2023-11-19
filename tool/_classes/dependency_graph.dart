// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';
import 'package:path/path.dart' as path;

typedef FilesStructure = Map<String, Map<String, List<String>>>;

class DependencyGraph {
  static const eol = '\n';
  final graph = StringBuffer();

  DependencyGraph() {
    graph.writeAll([
      'digraph G {',
      '  node [shape=record, width=.1, height=.1];',
      '  ranksep=.75;',
      '  edge [penwidth=1.3];',
      '  nodesep=.05;',
      '  rankdir=LR;',
      '',
    ], eol);
  }

  void init(List<String> files) {
    final structure = _convert(files);
    final groundList = structure.keys.toList();
    groundList.sort();
    graph.writeAll([
      '  {',
      '    node [shape=plaintext, fontsize=16];',
      '    past -> ${groundList.map((e) => '"$e" -> ').join()} "future";',
      '  }',
      '',
    ], eol);
  }

  void bind(List<String> files, [String color = 'silver:white']) {
    final structure = _convert(files);
    for (var entry in structure.entries) {
      for (var sub in entry.value.entries) {
        graph.writeAll([
          '  {',
          '    rank = same; "${entry.key}";',
          '    ${sub.key.replaceAll('/', '_')} ['
              'label="<0>${sub.key.replaceAll('/', ' / ').toUpperCase()}|${sub.value.map((e) => '<$e>$e').join('|')}| ",'
              'fillcolor="$color", gradientangle=240, style="filled"'
              '];',
          '  }',
          '',
        ], eol);
      }
    }
  }

  void connect(List<String> files, [String? color]) {
    for (final from in files) {
      final file = File(path.join(Directory.current.path, 'lib/$from'));
      parse(file.readAsStringSync(), from, color ?? _getColor(from));
    }
  }

  void parse(String content, String from, String color) {
    final dependencies = <String>{};
    final search = RegExp("import 'package:app_finance/(.*?).dart';");
    for (final to in search.allMatches(content).where((v) => v.groupCount > 0).map((v) => v.group(1)!).toList()) {
      dependencies.add('  ${_convertPath(from)} -> ${_convertPath(to)} [color="$color"];');
    }
    graph.writeln(dependencies.toList().join(eol));
  }

  @override
  String toString() => '${graph.toString()}}';

  FilesStructure _convert(List<String> files) {
    final FilesStructure structure = {};
    for (final filePath in files) {
      final parts = filePath.split('/');
      final key = parts[1];
      if (structure[key] == null) {
        structure[key] = {};
      }
      final path = _convertPath(filePath, false).split(':');
      final sub = path[0];
      if (structure[key]![sub] == null) {
        structure[key]![sub] = [];
      }
      structure[key]![sub]!.add(path[1]);
    }
    return structure;
  }

  String _convertPath(String filePath, [bool isShort = true]) {
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

  String _getColor(String filePath) => switch (filePath.split('/')[1]) {
        '_classes' => 'green',
        '_configs' => 'green',
        '_ext' => 'green',
        '_mixins' => 'green',
        'charts' => 'red',
        'components' => '#FF00FF50',
        'design' => '#0000FF50',
        _ => '#F0F0F050',
      };
}
