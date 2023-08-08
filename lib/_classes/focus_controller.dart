// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/delayed_call.dart';
import 'package:flutter/material.dart';

class FocusController {
  static const DEFAULT = -1;

  static List<FocusNode> nodes = [];
  static List<dynamic> values = [];
  static int _idx = DEFAULT;
  static int focus = DEFAULT;
  static final Map<Type, ScrollController?> _controller = {};
  static Type? _activeClass;
  static final DelayedCall _delay = DelayedCall(600);

  static void init() {
    values = values.map((e) => null).cast<dynamic>().toList();
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

  static ScrollController getController(Type name) {
    _controller[name] ??= ScrollController();
    _activeClass = name;
    return _controller[name]!;
  }

  static bool isLast() {
    return _idx >= nodes.length;
  }

  static TextInputAction getAction() {
    return isLast() ? TextInputAction.done : TextInputAction.next;
  }

  static void requestFocus() {
    if (focus >= 0) {
      nodes[focus].requestFocus();
      _delay.run(() => _scrollToFocusedElement(nodes[focus]));
    }
  }

  static void _scrollToFocusedElement(FocusNode node) {
    bool isAttached = _controller[_activeClass]?.hasClients ?? false;
    RenderObject? firstNode;
    // @todo: drop after changing 'package:dropdown_search'
    double shift = 0;
    int idx = nodes.indexOf(node);
    for (int i = 0; i <= idx; i++) {
      BuildContext? context = nodes[i].context;
      if (context != null && context.mounted) {
        firstNode = context.findRenderObject();
      }
      if (firstNode is RenderBox) {
        break;
      }
      shift += 67;
    }
    // end
    RenderObject? focusedNode;
    if (node.context != null && node.context!.mounted) {
      focusedNode = node.context?.findRenderObject();
    }
    if (isAttached && focusedNode is RenderBox && firstNode is RenderBox) {
      double delta = focusedNode.localToGlobal(Offset.zero).dy - firstNode.localToGlobal(Offset.zero).dy + shift;
      _controller[_activeClass]?.animateTo(
        delta,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  static void onEditingComplete(index) {
    resetFocus();
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

  static void resetFocus() {
    focus = DEFAULT;
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
    resetFocus();
  }
}
