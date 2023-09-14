// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_zoom.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

enum AppEvents {
  zoomIn,
  zoomOut,
  zoomReset,
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

  @override
  initState() {
    super.initState();
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
    }
  }

  void onKeyPressed(RawKeyEvent event) {
    if (event is RawKeyDownEvent) {
      if (event.isControlPressed) {
        if (event.logicalKey == LogicalKeyboardKey.minus) {
          handleEvent(AppEvents.zoomOut);
        } else if (event.logicalKey == LogicalKeyboardKey.equal) {
          handleEvent(AppEvents.zoomIn);
        } else if (event.logicalKey == LogicalKeyboardKey.digit0) {
          handleEvent(AppEvents.zoomReset);
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
        focusNode: FocusNode()..requestFocus(),
        onKey: onKeyPressed,
        child: GestureDetector(
          onScaleUpdate: onScaleUpdate,
          child: widget.child,
        ),
      ),
    );
  }
}
