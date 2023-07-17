import 'dart:io';

void scanDirectory(Directory root, Directory directory, List<String> files) {
  directory.listSync(recursive: true).forEach((entity) {
    if (entity is File &&
        entity.path.endsWith('.dart') &&
        !entity.path.endsWith('.g.dart') &&
        !entity.path.endsWith('.generic.dart') &&
        !entity.path.endsWith('.mocks.dart') &&
        !entity.path.endsWith('.wrapper.dart')) {
      files.add(entity.absolute.path
          .replaceAll(root.absolute.path, '')
          .replaceAll('\\', '/'));
    } else if (entity is Directory) {
      scanDirectory(root, entity, files);
    }
  });
}
