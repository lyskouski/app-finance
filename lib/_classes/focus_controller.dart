// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class FocusController {
  static const DEFAULT = -1;

  static List<FocusNode> nodes = [];
  static List<dynamic> values = [];
  static int _idx = DEFAULT;
  static int focus = DEFAULT;
  static int _focus = DEFAULT;
  static ScrollController? _controller;
  static BuildContext? _context;

  static void setContext(BuildContext context) {
    _context = context;
  }

  static void init(int idx, [dynamic value]) {
    while (idx >= values.length) {
      values.add(null);
    }
    if (idx >= 0) {
      values[idx] = value;
    }
    _idx = idx;
  }

  static FocusNode? getFocusNode() {
    while (_idx >= nodes.length) {
      nodes.add(FocusNode());
    }
    return _idx >= 0 ? nodes[_idx] : null;
  }

  static ScrollController getController() {
    _controller ??= ScrollController();
    return _controller!;
  }

  static bool isLast() {
    return _idx >= nodes.length;
  }

  static TextInputAction getAction() {
    return isLast() ? TextInputAction.done : TextInputAction.next;
  }

  static void requestFocus() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (focus >= 0 && _focus != focus && nodes[focus].context != null) {
        _focus = focus;
        FocusScope.of(nodes[focus].context!).requestFocus(nodes[focus]);
        scrollToFocusedElement(nodes[focus]);
      }
    });
  }

  static void scrollToFocusedElement(FocusNode node) {
    bool isAttached = _controller?.hasClients ?? false;
    RenderObject? firstNode;
    BuildContext? context = nodes[0].context;
    if (context != null && context.mounted) {
      firstNode = context.findRenderObject();
    }
    // @todo: drop after changing 'package:dropdown_search'
    double shift = 0;
    if (firstNode == null) {
      context = nodes[1].context;
      if (context != null && context.mounted) {
        firstNode = context.findRenderObject();
      }
      shift = 100;
    }
    final focusedNode = node.context?.findRenderObject();
    if (isAttached && focusedNode is RenderBox && firstNode is RenderBox) {
      double delta = focusedNode.localToGlobal(Offset.zero).dy - firstNode.localToGlobal(Offset.zero).dy + shift;
      _controller?.animateTo(
        delta,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  static void onEditingComplete(index) {
    resetFocus();
    if (index >= 0 && (values[index] == null || values[index] == '')) {
      values[index] = true;
    }
    for (int idx = 0; idx < nodes.length; idx++) {
      if (isFocused(idx, values[idx])) {
        break;
      }
    }
  }

  static void resetFocus() {
    focus = DEFAULT;
    _focus = DEFAULT;
  }

  static bool isFocused([int? i, dynamic val]) {
    bool isFocused = false;
    int idx = i ?? _idx;
    dynamic value = val ?? (idx >= 0 ? values[idx] : null);
    if ((value == null || value == '') && idx != DEFAULT && (focus == DEFAULT || focus == idx)) {
      focus = idx;
      isFocused = true;
      requestFocus();
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
