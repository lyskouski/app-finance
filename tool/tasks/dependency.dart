// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';
import 'package:grinder/grinder.dart';
import 'package:path/path.dart' as path;
import '../_classes/dependency_graph.dart';
import '../_classes/dir.dart' as dir;

createClassGraph([String? from, String? to]) {
  final out = Process.runSync(
      'dot', ['-Tsvg', from ?? 'coverage/dependencies.dot', '-o', to ?? 'coverage/dependencies.svg'],
      runInShell: true);
  log(out.stderr);
}

createClassGraphFromDot() {
  TaskArgs args = context.invocation.arguments;
  String? file = args.getOption('file');
  createClassGraph(file!, '${file.replaceAll('.dot', '')}.svg');
}

generateClassGraph() {
  final rootFolder = Directory('${Directory.current.path}/lib');
  List<String> files = dir.scanDirectory(rootFolder).where(_excludeScope).toList();

  TaskArgs args = context.invocation.arguments;
  bool showDiff = args.getFlag('diff');
  String? from = args.getOption('from');
  String? to = args.getOption('to');
  final graph = DependencyGraph();
  graph.init(files);
  if (showDiff) {
    final added = _getDiff('AM', from!, to!);
    graph.bind(files.where((v) => !added.contains(v)).toList());
    graph.bind(added, '_ADD', 'green:white');
    for (final path in added) {
      graph.parse(_getChanges(path, from, to), path, '_ADD', 'green');
    }
    final removed = _getDiff('D', from, to);
    graph.bind(removed, '_DEL', 'maroon:white');
    for (final path in removed) {
      graph.parse(_getChanges(path, from, to), path, '_DEL', 'black');
    }
  } else {
    graph.bind(files);
    graph.connect(files);
  }
  File(path.join(Directory.current.path, 'coverage/dependencies.dot'))
    ..createSync(recursive: true)
    ..writeAsStringSync(graph.toString());
}

List<String> _getDiff(String type, String from, String to) {
  final out = Process.runSync('git', ['diff', '--name-only', '--diff-filter=$type', from, to], runInShell: true);
  final result = out.stdout.split('\n').where((v) => v.contains('.dart') && v.contains('lib/') && _excludeScope(v));
  return result.map((v) => v.replaceFirst('lib', '')).cast<String>().toList();
}

String _getChanges(String path, String from, String to) =>
    Process.runSync('git', ['diff', to, from, '--word-diff', '--unified=0', 'lib/$path'], runInShell: true).stdout;

bool _excludeScope(String v) => !(v.contains('l10n/') || v.trim().endsWith('main.dart'));
