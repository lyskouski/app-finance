// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';
import 'package:path/path.dart' as path;
import '../_classes/dependency_graph.dart';
import '../_classes/dir.dart' as dir;

createClassGraph() {
  Process.runSync('dot', ['-Tsvg', 'coverage/dependencies.dot', '-o', 'coverage/dependencies.svg'], runInShell: true);
}

generateClassGraph() {
  final rootFolder = Directory('${Directory.current.path}/lib');
  List<String> files = dir.scanDirectory(rootFolder).where((v) => !(v.contains('l10n/') || '/main.dart' == v)).toList();

  final graph = DependencyGraph();
  graph.init(files);
  graph.bind(files);
  graph.connect(files);
  File(path.join(Directory.current.path, 'coverage/dependencies.dot')).writeAsStringSync(graph.toString());
}
