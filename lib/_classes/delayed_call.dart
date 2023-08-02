// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:async';
import 'package:flutter/material.dart';

class DelayedCall {
  final int delay;
  Timer? _timer;
  VoidCallback? _action;

  DelayedCall(this.delay);

  void run(VoidCallback action) {
    _timer?.cancel();
    _action = action;
    _timer = Timer(Duration(milliseconds: delay), action);
  }

  void cancel() {
    _action?.call();
    _timer?.cancel();
  }
}
