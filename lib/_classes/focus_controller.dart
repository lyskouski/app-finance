// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';

class FocusController {
  static const DEFAULT = -1;

  static List<FocusNode> nodes = [];
  static int focus = DEFAULT;
  static int _focus = DEFAULT;
  static late BuildContext _context;
  static ScrollController? _controller;

  static void setContext(BuildContext context) {
    _context = context;
  }

  static FocusNode? getFocusNode(int idx) {
    while (idx >= nodes.length) {
      nodes.add(FocusNode());
    }
    return idx >= 0 ? nodes[idx] : null;
  }

  static ScrollController getController() {
    _controller ??= ScrollController();
    return _controller!;
  }

  static bool isLast(int idx) {
    return idx >= nodes.length;
  }

  static TextInputAction getAction(int idx) {
    return isLast(idx) ? TextInputAction.done : TextInputAction.next;
  }

  static void requestFocus() {
    Future.delayed(const Duration(milliseconds: 300), () {
      if (focus >= 0 && _focus != focus) {
        _focus = focus;
        FocusScope.of(_context).requestFocus(nodes[focus]);
        _scrollToFocusedElement(nodes[focus]);
      }
    });
  }

  static void _scrollToFocusedElement(FocusNode node) {
    final focusedNode = node.context?.findRenderObject();
    final firstNode = nodes[0].context?.findRenderObject();
    if (focusedNode is RenderBox && firstNode is RenderBox) {
      _controller?.animateTo(
        focusedNode.localToGlobal(Offset.zero).dy -
            firstNode.localToGlobal(Offset.zero).dy,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeInOut,
      );
    }
  }

  static void resetFocus() {
    focus = DEFAULT;
    _focus = DEFAULT;
  }

  static bool isFocused(int idx, dynamic value) {
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
    resetFocus();
  }
}
