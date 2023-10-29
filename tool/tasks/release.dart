// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:io';
import 'package:grinder/grinder.dart';
import 'package:path/path.dart' as path;
import '../_classes/git_history.dart' as git;

releaseNotes() {
  TaskArgs args = context.invocation.arguments;
  String tag = args.getOption('tag') ?? '0.0.0';
  String? output = args.getOption('output');
  String release = git.genRelease(tag);
  if (output != null) {
    final currDir = Directory('./');
    final file = File(path.join(currDir.absolute.path, output));
    file.writeAsStringSync(release);
  }
  log(release);
}

pubspecUpdate() {
  final dir = Directory('./');
  TaskArgs args = context.invocation.arguments;
  String build = args.getOption('build-name') ?? '0.0.0';
  String number = args.getOption('build-number') ?? '0';

  final spec = File(path.join(dir.absolute.path, 'pubspec.yaml'));
  spec.writeAsStringSync(spec
      .readAsStringSync()
      .replaceFirst('version: 1.0.0+1', 'version: $build+$number')
      .replaceFirst('msix_version: 1.0.0.1', 'msix_version: $build.$number'));

  final snap = File(path.join(dir.absolute.path, 'snapcraft.yaml'));
  snap.writeAsStringSync(snap.readAsStringSync().replaceFirst('version: 1.0.0+1', 'version: $build+$number'));
}
