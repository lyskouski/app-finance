// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.
import 'dart:io';

// ignore: depend_on_referenced_packages
import 'package:gherkin/gherkin.dart';

class FileReporter extends ProgressReporter {
  final _log = StringBuffer();
  Function(String text) get _writeln => _log.writeln;
  Function(String text) get _write => _log.write;

  @override
  void printMessageLine(
    String message, [
    String? color,
  ]) {
    if (supportsAnsiEscapes) {
      _writeln(
          '${color ?? StdoutReporter.RESET_COLOR}$message${StdoutReporter.RESET_COLOR}');
    } else {
      _writeln(message);
    }
  }

  @override
  void printMessage(
    String message, [
    String? color,
  ]) {
    if (supportsAnsiEscapes) {
      _write(
          '${color ?? StdoutReporter.RESET_COLOR}$message${StdoutReporter.RESET_COLOR}');
    } else {
      _writeln(message);
    }
  }

  void publish() {
    stdout.writeln(_log.toString());
  }
}
