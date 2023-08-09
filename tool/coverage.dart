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
