// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:async';
import 'package:flutter/material.dart';

class DelayedCall {
  final int delay;
  Timer? _timer;
  VoidCallback? _action;
  bool preserveFirst;

  DelayedCall(this.delay, {this.preserveFirst = false});

  void run(VoidCallback action) {
    _timer?.cancel();
    if (!preserveFirst || _action == null) {
      _action = action;
    }
    _timer = Timer(Duration(milliseconds: delay), () {
      final v = _action;
      _action = null;
      v?.call();
    });
  }

  void cancel() {
    _action?.call();
    _timer?.cancel();
  }
}
