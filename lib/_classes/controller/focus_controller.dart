// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:collection';
import 'dart:math';

import 'package:app_finance/_classes/controller/delayed_call.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:flutter/material.dart';

class FocusController {
  final DelayedCall _scrollTo = DelayedCall(300);
  final DelayedCall _focus = DelayedCall(300);
  final _controller = ScrollController();

  final scope = <int?, FocusNode>{};
  final values = <int?, dynamic>{};
  final order = SplayTreeMap<int, int?>();
  int? focus;
  int? idButton;
  static bool force = false;

  FocusController();

  ScrollController get controller {
    order.clear();
    values.clear();
    return _controller;
  }

  int key(dynamic item) => item?.hashCode ?? 0;

  FocusNode last(dynamic item) {
    idButton = key(item);
    scope[idButton] ??= FocusNode();
    return scope[idButton]!;
  }

  FocusNode bind(dynamic item, {required BuildContext context, dynamic value}) {
    final id = key(item);
    if (!order.containsValue(id)) {
      order[order.length] = id;
    }
    scope[id] ??= FocusNode();
    values[id] = value;
    if (!force) {
      _focus.run(onEditingComplete);
    }
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
    if (order.containsValue(idx) && scope[idx] != null && scope[idx]!.context != null) {
      double position = _getPosition(scope[idx]!.context!) - _getMinPosition() - ThemeHelper.barHeight;
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
    force = false;
    if (item != null) {
      idx = key(item);
      values[idx] = true;
    }
    List<int?> check = order.values.toList();
    if (idButton != null) {
      values[idButton] = null;
      check.add(idButton);
    }
    for (int? key in check) {
      if (targetKey != null && key != targetKey && (values[key] == '' || values[key] == null)) {
        onFocus(null, key, false);
        targetKey = null;
      }
      if (key == idx) {
        targetKey = key;
      }
    }
  }

  bool isFocused(dynamic item) => key(item) == focus;

  void blur() => scope.forEach((_, value) => value.unfocus());

  void onFocus(dynamic item, [int? idx, bool isForced = true]) {
    idx ??= key(item);
    focus = idx;
    if ((order.containsValue(idx) || idx == idButton) &&
        scope[idx] != null &&
        scope[idx]!.context != null &&
        scope[idx]!.context!.mounted) {
      blur();
      scope[idx]?.requestFocus();
      if (item != null) {
        _scrollTo.run(() => scrollToFocusedElement(item, idx));
      }
    }
    force = isForced;
  }

  void dispose() {
    scope.forEach((_, node) => node.dispose());
    scope.clear();
    values.clear();
    order.clear();
    _controller.dispose();
    focus = null;
  }
}
