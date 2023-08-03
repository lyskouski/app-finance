// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:convert';
import 'dart:io';

List<int> getReleaseParts(String tag) {
  return tag.substring(1).split('.').map(int.parse).toList();
}

String? getPreviousTag(String tag) {
  List<int> parts = getReleaseParts(tag);
  assert(parts.length == 3);

  ProcessResult versions = Process.runSync('git', ['tag', '--list', 'v*'], runInShell: true);

  List<String> tagList = const LineSplitter().convert(versions.stdout).reversed.toList();

  String? tillTag;
  for (String tagName in tagList) {
    List<int> curr = getReleaseParts(tagName);
    if (curr.length != 3) {
      continue;
    }
    if ((parts[2] == curr[2] && parts[1] == curr[1] && parts[0] != curr[0]) ||
        (parts[2] == 0 && curr[2] == 0 && parts[1] != 0 && parts[1] != curr[1]) ||
        (parts[2] != 0 && parts[2] != curr[2])) {
      tillTag = tagName;
      break;
    }
  }
  return tillTag;
}

String genRelease(String tag) {
  String? tillTag = getPreviousTag(tag);
  final process = ['log', '--pretty=format:"%s"'];
  if (tillTag != null) {
    process.add('HEAD...$tillTag');
  }
  ProcessResult log = Process.runSync('git', process, runInShell: true);

  List<String> commentList = const LineSplitter()
      .convert(log.stdout)
      .where((comment) => !comment.contains('Merge pull') && !comment.contains('Revert'))
      .map((comment) => '- ${comment.split('.').first.replaceAll('"', '')}')
      .toSet()
      .toList();
  commentList.addAll([
    '## [CI] Critical Issue(s)',
    '## [NF] New Functionality',
    '## [CR] Change Request(s)',
    '## [BF] Bug Fix(es)',
    '## [...] Other(s)'
  ]);

  final order = ['[CI]', '[NF]', '[CR]', '[BF]', '[', ''];
  commentList.sort((a, b) {
    int indexA = order.indexWhere((item) => a.contains(item));
    int indexB = order.indexWhere((item) => b.contains(item));
    if (indexA.compareTo(indexB) == 0) {
      return a.contains('##') ? -1 : 1;
    }
    return indexA.compareTo(indexB);
  });

  final output = StringBuffer();
  for (String comment in commentList) {
    output.writeln(comment);
  }
  return output.toString();
}
