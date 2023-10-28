// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';
import 'package:grinder/grinder.dart';

List<String> scanDirectory(Directory root, Directory directory, [String pattern = '*.dart']) {
  final fileSet = FileSet.fromDir(
    directory,
    pattern: pattern,
    recurse: true,
  );
  return fileSet.files
      .map((file) => file.absolute.path.replaceAll(root.absolute.path, '').replaceAll('\\', '/'))
      .toList();
}
