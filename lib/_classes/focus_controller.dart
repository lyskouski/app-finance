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

  static Type setContext(int idx, [dynamic value]) {
    while (idx >= values.length) {
      values.add(null);
    }
    if (idx >= 0) {
      values[idx] = value;
    }
    _idx = idx;
    return FocusController;
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
        _scrollToFocusedElement(nodes[focus]);
      }
    });
  }

  static void _scrollToFocusedElement(FocusNode node) {
    final focusedNode = node.context?.findRenderObject();
    final firstNode = nodes[0].context?.findRenderObject();
    bool isAttached = _controller?.hasClients ?? false;
    if (isAttached && focusedNode is RenderBox && firstNode is RenderBox) {
      _controller?.animateTo(
        focusedNode.localToGlobal(Offset.zero).dy -
            firstNode.localToGlobal(Offset.zero).dy,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  static void onEditingComplete() {
    resetFocus();
    if (_idx >= 0 && (values[_idx] == null || values[_idx] == '')) {
      values[_idx] == true;
    }
    for (int idx = 0; idx < nodes.length; idx++) {
      isFocused(idx, values[idx]);
    }
  }

  static void resetFocus() {
    focus = DEFAULT;
    _focus = DEFAULT;
  }

  static bool isFocused([int? i, dynamic val]) {
    int idx = i ?? _idx;
    dynamic value = val ?? (_idx >= 0 ? values[idx] : null);
    if ((value == null || value == '') &&
        idx != DEFAULT &&
        (focus == DEFAULT || focus == idx)) {
      focus = idx;
      requestFocus();
      return true;
    }
    return false;
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
