// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/herald/app_zoom.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
// import 'package:app_finance/pages/_interfaces/abstract_page_state.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

enum AppEvents {
  zoomIn,
  zoomOut,
  zoomReset,
  tipDrawer,
  newBill,
  edit,
  delete,
  back,
}

class InputControllerWrapper extends StatefulWidget {
  final Widget child;

  const InputControllerWrapper({
    super.key,
    required this.child,
  });

  @override
  InputControllerWrapperState createState() => InputControllerWrapperState();
}

class InputControllerWrapperState extends State<InputControllerWrapper> {
  bool _ctrlPressed = false;
  late AppZoom zoom;
  final focus = FocusNode();

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  void _onScaleUpdate(double step) => zoom.set(zoom.value + step);

  void _onScaleReset() => zoom.set(1.0);

  void _toggleDrawer() {
    if (Scaffold.of(context).isDrawerOpen) {
      Scaffold.of(context).closeDrawer();
    } else {
      Scaffold.of(context).openDrawer();
    }
  }

  void _pop() {
    if (Navigator.of(context).canPop()) {
      Navigator.of(context).pop();
    }
  }

  void onKeyEvent(KeyEvent event) {
    var isControlPressed = HardwareKeyboard.instance.isControlPressed;
    var isShiftPressed = HardwareKeyboard.instance.isShiftPressed;
    if (isControlPressed) {
      if (HardwareKeyboard.instance.isLogicalKeyPressed(LogicalKeyboardKey.minus)) {
        return _onScaleUpdate(-0.1);
      }
      if (HardwareKeyboard.instance.isLogicalKeyPressed(LogicalKeyboardKey.equal)) {
        return _onScaleUpdate(0.1);
      }
      if (HardwareKeyboard.instance.isLogicalKeyPressed(LogicalKeyboardKey.digit0)) {
        return _onScaleReset();
      }
      if (HardwareKeyboard.instance.isLogicalKeyPressed(LogicalKeyboardKey.keyN)) {
        Navigator.of(context).pushNamed(AppRoute.billAddRoute);
        return;
      }
      if (HardwareKeyboard.instance.isLogicalKeyPressed(LogicalKeyboardKey.keyE)) {
        return; // TBD: edit item
      }
      if (HardwareKeyboard.instance.isLogicalKeyPressed(LogicalKeyboardKey.keyD)) {
        return; // TBD: delete item
      }
      if (HardwareKeyboard.instance.isLogicalKeyPressed(LogicalKeyboardKey.backspace)) {
        return _pop();
      }
    } else if (isShiftPressed && HardwareKeyboard.instance.isLogicalKeyPressed(LogicalKeyboardKey.enter)) {
      return _toggleDrawer();
    }
    if (event.logicalKey == LogicalKeyboardKey.controlLeft || event.logicalKey == LogicalKeyboardKey.controlRight) {
      setState(() => _ctrlPressed = isControlPressed);
    }
  }

  void onPointerSignal(PointerSignalEvent event) {
    if (_ctrlPressed && event is PointerScrollEvent) {
      _onScaleUpdate(event.scrollDelta.dy > 0 ? -0.1 : 0.1);
    }
  }

  @override
  Widget build(BuildContext context) {
    zoom = Provider.of<AppZoom>(context, listen: false);
    return Listener(
      onPointerSignal: onPointerSignal,
      child: KeyboardListener(
        focusNode: FocusController.force ? focus : (focus..requestFocus()),
        onKeyEvent: onKeyEvent,
        child: widget.child,
      ),
    );
  }
}
