// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/delayed_call.dart';
import 'package:flutter/material.dart';

class FocusController {
  static const DEFAULT = -1;

  static List<FocusNode> nodes = [];
  static List<dynamic> values = [];
  static int _idx = DEFAULT;
  static int focus = DEFAULT;
  static final Map<Type, ScrollController?> _controller = {};
  static List<double> _shift = [];
  static Type? _activeClass;
  static final DelayedCall _delay = DelayedCall(600);

  static void init() {
    focus = DEFAULT;
    values = values.map((e) => null).cast<dynamic>().toList();
    _shift = [];
    _idx = DEFAULT;
  }

  static int get current => _idx;

  static FocusNode getFocusNode([dynamic value]) {
    _idx++;
    if (_idx >= values.length) {
      values.add(value);
      nodes.add(FocusNode());
    }
    return nodes[_idx];
  }

  static bool _isControllerActive() {
    return _controller[_activeClass]?.hasClients ?? false;
  }

  static void recordPosition(BuildContext context) {
    RenderObject? firstNode = context.findRenderObject();
    if (firstNode is RenderBox && _isControllerActive()) {
      _shift.add(_controller[_activeClass]!.offset + firstNode.localToGlobal(Offset.zero).dy);
    }
  }

  static ScrollController getController(Type name) {
    if (_controller[name] != null && _controller[name]!.hasClients) {
      _controller[name]!.dispose();
      _controller[name] = null;
    }
    _controller[name] ??= ScrollController();
    _activeClass = name;
    return _controller[name]!;
  }

  static bool isLast() {
    return focus + 1 == nodes.length;
  }

  static TextInputAction getAction() {
    return isLast() ? TextInputAction.done : TextInputAction.next;
  }

  static void requestFocus() {
    int idx = focus;
    if (idx >= 0 && idx < _shift.length - 1) {
      nodes[idx].requestFocus();
      _delay.run(() => _scrollToFocusedElement(idx));
    }
  }

  static void _scrollToFocusedElement(int idx) {
    if (!_isControllerActive()) {
      return;
    }
    if (_shift.isNotEmpty) {
      _controller[_activeClass]?.animateTo(
        _shift[idx] - _shift.first,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  static void onEditingComplete(index) {
    focus = DEFAULT;
    if (index >= 0) {
      values.fillRange(0, index + 1, true);
    }
    for (int idx = 0; idx < nodes.length; idx++) {
      if (isFocused(idx, values[idx])) {
        break;
      }
    }
  }

  static void onFocus(idx) {
    focus = idx;
    requestFocus();
  }

  static bool isFocused(int idx, dynamic value) {
    bool isFocused = false;
    if ((value == null || value == '') && idx != DEFAULT && (focus == DEFAULT || focus == idx)) {
      isFocused = true;
      onFocus(idx);
    }
    return isFocused;
  }

  static void dispose() {
    List<FocusNode> nodesCopy = List.of(nodes);
    for (FocusNode node in nodesCopy) {
      node.dispose();
      nodes.remove(node);
    }
    values.removeWhere((value) => true);
    focus = DEFAULT;
    _idx = DEFAULT;
  }
}
