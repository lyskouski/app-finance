import 'dart:io';

void scanDirectory(Directory root, Directory directory, Set<String> files) {
  directory.listSync(recursive: true).forEach((entity) {
    if (entity is File && entity.path.endsWith('.dart') && !entity.path.endsWith('.g.dart')) {
      files.add(entity.absolute.path.replaceAll(root.absolute.path, '').replaceAll('\\', '/'));
    } else if (entity is Directory) {
      scanDirectory(root, entity, files);
    }
  });
}
