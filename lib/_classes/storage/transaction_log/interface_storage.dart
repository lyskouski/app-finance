// Copyright 2024 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

abstract interface class InterfaceStorage {
  static Future<String> getSize() async => Future.value('');

  static void saveRaw(String line) {}

  static Stream<String> read() async* {}

  static void clear() {}
}
