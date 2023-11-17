// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

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
  static final drawerKey = GlobalKey();
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
  initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) focus.requestFocus();
    });
    super.initState();
  }

  @override
  void dispose() {
    focus.dispose();
    super.dispose();
  }

  void handleEvent(AppEvents event) {
    switch (event) {
      case AppEvents.zoomOut:
        return onScaleUpdate(ScaleUpdateDetails(scale: 0.9));
      case AppEvents.zoomIn:
        return onScaleUpdate(ScaleUpdateDetails(scale: 1.1));
      case AppEvents.zoomReset:
        zoom.set(1.0);
        break;
      case AppEvents.tipDrawer:
        final render = InputControllerWrapper.drawerKey.currentContext?.findRenderObject();
        if (render != null) {
          Scaffold.of(context).closeDrawer();
        } else {
          Scaffold.of(context).openDrawer();
        }
        break;
      case AppEvents.newBill:
        Navigator.of(context).pushNamed(AppRoute.billAddRoute);
        break;
      case AppEvents.back:
        Navigator.of(context).pop();
        break;
      case AppEvents.edit:
      case AppEvents.delete:
        // TBD: FocusScope.of(context).focusedChild);
        break;
    }
  }

  void onKeyPressed(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      if (event.isControlPressed) {
        if (event.logicalKey == LogicalKeyboardKey.minus) {
          return handleEvent(AppEvents.zoomOut);
        }
        if (event.logicalKey == LogicalKeyboardKey.equal) {
          return handleEvent(AppEvents.zoomIn);
        }
        if (event.logicalKey == LogicalKeyboardKey.digit0) {
          return handleEvent(AppEvents.zoomReset);
        }
        if (event.isKeyPressed(LogicalKeyboardKey.keyN)) {
          return handleEvent(AppEvents.newBill);
        }
        if (event.isKeyPressed(LogicalKeyboardKey.keyE)) {
          return handleEvent(AppEvents.edit);
        }
        if (event.isKeyPressed(LogicalKeyboardKey.keyD)) {
          return handleEvent(AppEvents.delete);
        }
        if (event.isKeyPressed(LogicalKeyboardKey.backspace)) {
          return handleEvent(AppEvents.back);
        }
      } else if (event.isShiftPressed) {
        if (event.isKeyPressed(LogicalKeyboardKey.enter)) {
          return handleEvent(AppEvents.tipDrawer);
        }
      }
    }
    if (event.logicalKey == LogicalKeyboardKey.controlLeft || event.logicalKey == LogicalKeyboardKey.controlRight) {
      setState(() => _ctrlPressed = event is RawKeyDownEvent);
    }
  }

  void onPointerSignal(PointerSignalEvent event) {
    if (_ctrlPressed && event is PointerScrollEvent) {
      handleEvent(event.scrollDelta.dy > 0 ? AppEvents.zoomOut : AppEvents.zoomIn);
    }
  }

  void onScaleUpdate(ScaleUpdateDetails details) {
    const step = 0.1;
    zoom.set(zoom.value + (details.scale > 1 ? step : -step));
  }

  @override
  Widget build(BuildContext context) {
    zoom = Provider.of<AppZoom>(context, listen: false);
    return Listener(
      onPointerSignal: onPointerSignal,
      child: RawKeyboardListener(
        focusNode: focus,
        onKey: onKeyPressed,
        //child: GestureDetector(
        //  onScaleUpdate: onScaleUpdate,
        child: widget.child,
        //),
      ),
    );
  }
}
