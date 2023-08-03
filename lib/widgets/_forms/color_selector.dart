// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'dart:math';

import 'package:app_finance/_classes/focus_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class ColorSelector extends StatefulWidget {
  final Function setState;
  final MaterialColor? value;
  final int focusOrder;

  const ColorSelector({
    super.key,
    required this.setState,
    this.value,
    this.focusOrder = FocusController.DEFAULT,
  });

  @override
  ColorSelectorState createState() => ColorSelectorState();
}

class ColorSelectorState extends State<ColorSelector> {
  late MaterialColor value;
  bool isOpened = false;

  @override
  void initState() {
    value = widget.value ?? getRandomMaterialColor();
    super.initState();
  }

  MaterialColor convertToMaterialColor(Color color) {
    final Map<int, Color> colorMap = {};
    final red = color.red;
    final green = color.green;
    final blue = color.blue;
    for (int i = 50; i <= 900; i += 100) {
      colorMap[i] = Color.fromRGBO(red, green, blue, i / 1000.0);
    }
    return MaterialColor(color.value, colorMap);
  }

  MaterialColor getRandomMaterialColor() {
    List<Color> colors = Colors.primaries;
    Random random = Random();
    Color randomColor = colors[random.nextInt(colors.length)];
    return convertToMaterialColor(randomColor);
  }

  void onTap(context) {
    setState(() => isOpened = true);
    if (widget.value == null) {
      widget.setState(convertToMaterialColor(value));
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocalizations.of(context)!.colorTooltip),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: value,
              onColorChanged: (color) {
                widget.setState(convertToMaterialColor(color));
                setState(() => isOpened = false);
                FocusController.resetFocus();
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text(AppLocalizations.of(context)!.ok),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(context) {
    FocusController.setContext(widget.focusOrder, widget.value);
    if (!isOpened &&
        widget.value == null &&
        widget.focusOrder > FocusController.DEFAULT &&
        FocusController.isFocused()) {
      Future.delayed(const Duration(milliseconds: 300), () {
        if (!isOpened && widget.value == null) {
          onTap(context);
        }
      });
    }
    return TextFormField(
      readOnly: true,
      onTap: () => onTap(context),
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none,
        fillColor: widget.value ?? Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
        suffixIcon: GestureDetector(
          child: const Icon(Icons.color_lens),
        ),
      ),
    );
  }
}
