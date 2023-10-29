// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:collection';
import 'dart:math';

import 'package:app_finance/_classes/controller/delayed_call.dart';
import 'package:flutter/material.dart';

class FocusController {
  final DelayedCall _scrollTo = DelayedCall(300);
  final DelayedCall _focus = DelayedCall(300);
  final _controller = ScrollController();

  final scope = <int?, FocusNode>{};
  final values = <int?, dynamic>{};
  final order = SplayTreeMap<int, int?>();
  int? focus;

  FocusController();

  ScrollController get controller {
    order.clear();
    return _controller;
  }

  int key(dynamic item) => item?.hashCode ?? 0;

  FocusNode bind(dynamic item, {required BuildContext context, dynamic value}) {
    final id = key(item);
    if (!order.containsValue(id)) {
      order[order.length] = id;
    }
    scope[id] ??= FocusNode();
    values[id] = value;
    _focus.run(onEditingComplete);
    return scope[id]!;
  }

  bool _isControllerActive() => _controller.hasClients;

  double _getPosition(BuildContext context) {
    RenderObject? obj = context.findRenderObject();
    return obj is RenderBox ? obj.localToGlobal(Offset.zero).dy : 0;
  }

  double _getMinPosition() => order.values
      .map((id) => scope[id]?.context)
      .where((element) => element != null)
      .map((e) => _getPosition(e!))
      .reduce(min);

  bool _isLast(int? idx) => idx == order[order.lastKey()];

  TextInputAction getAction(dynamic item) => _isLast(key(item)) ? TextInputAction.done : TextInputAction.next;

  void scrollToFocusedElement(dynamic item, [int? idx]) {
    idx ??= key(item!);
    if (!_isControllerActive() || scope.isEmpty) {
      return;
    }
    if (order.containsValue(idx) && scope[idx]!.context != null) {
      double position = _getPosition(scope[idx]!.context!) - _getMinPosition() - 40;
      if (position < 0) {
        position = 0;
      }
      _controller.animateTo(
        position,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  void onEditingComplete([dynamic item]) {
    int? targetKey = item == null ? focus ?? order.values.firstOrNull : null;
    int? idx;
    if (item != null) {
      idx = key(item);
      values[idx] = true;
    }
    order.forEach((_, value) {
      if (targetKey != null && (values[value] == '' || values[value] == null)) {
        onFocus(null, value);
        targetKey = null;
      }
      if (value == idx) {
        targetKey = value;
      }
    });
  }

  bool isFocused(dynamic item) => key(item) == focus;

  void _blur() => scope.forEach((_, value) => value.unfocus());

  void onFocus(dynamic item, [int? idx]) {
    idx ??= key(item!);
    focus = idx;
    _blur();
    if (order.containsValue(idx) && scope[idx]?.context != null) {
      scope[idx]!.requestFocus();
      _scrollTo.run(() => scrollToFocusedElement(item, idx));
    }
  }

  void dispose() {
    scope.forEach((_, node) => node.dispose());
    scope.clear();
    values.clear();
    _controller.dispose();
    focus = null;
  }
}
