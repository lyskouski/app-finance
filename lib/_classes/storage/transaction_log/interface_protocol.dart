// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

abstract class InterfaceProtocol {
  final Function callbackMessage;
  final Function callbackProgress;

  InterfaceProtocol({
    required this.callbackMessage,
    required this.callbackProgress,
  });

  Future<void> save(dynamic data);
  Future<void> load(dynamic data, [bool isEncrypted = true]);
}
