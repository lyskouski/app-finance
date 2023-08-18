// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'dart:math';

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/widgets/_forms/abstract_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';

class ColorSelector extends AbstractInput {
  final Function setState;
  @override
  // ignore: overridden_fields
  final MaterialColor? value;

  ColorSelector({
    super.key,
    required this.setState,
    this.value,
  }) : super(value: value);

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
    MaterialColor clr = value ?? getRandomMaterialColor();
    NavigatorState nav = Navigator.of(context);
    if (value == null) {
      setState(clr);
    }
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(AppLocale.labels.colorTooltip),
          content: SingleChildScrollView(
            child: ColorPicker(
              pickerColor: clr,
              onColorChanged: (color) {
                setState(convertToMaterialColor(color));
              },
            ),
          ),
          actions: <Widget>[
            ElevatedButton(
              onPressed: () {
                nav.pop();
                FocusController.onEditingComplete(focusOrder);
              },
              child: Text(AppLocale.labels.ok),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(context) {
    if (!focus.hasFocus && FocusController.isFocused(focusOrder, value)) {
      Future.delayed(const Duration(milliseconds: 300), () {
        onTap(context);
      });
    }
    return TextFormField(
      readOnly: true,
      onTap: () => onTap(context),
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none,
        fillColor: value ?? Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
        suffixIcon: GestureDetector(
          child: const Icon(Icons.color_lens),
        ),
      ),
    );
  }
}
