// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/focus_controller.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

typedef SetViewFunction = String Function(Currency input);

class CurrencySelector extends StatelessWidget {
  Function setState;
  SetViewFunction? setView;
  Currency? value;
  int focusOrder;
  bool isOpened = false;

  CurrencySelector({
    super.key,
    this.value,
    required this.setState,
    this.setView,
    this.focusOrder = FocusController.DEFAULT,
  }) {
    setView ??= setDefaultView;
  }

  String setDefaultView(Currency value) {
    return '${value.symbol} - ${value.name} (${value.code})';
  }

  String getValue(Currency? value) {
    return value != null ? setView!(value) : '';
  }

  void onTap(BuildContext context) {
    isOpened = true;
    showCurrencyPicker(
        context: context,
        showFlag: true,
        showCurrencyName: true,
        showCurrencyCode: true,
        onSelect: (Currency currency) {
          isOpened = false;
          setState(currency);
          FocusController.resetFocus();
        });
  }

  @override
  Widget build(BuildContext context) {
    FocusController.setContext(focusOrder, value);
    if (!isOpened &&
        focusOrder > FocusController.DEFAULT &&
        FocusController.isFocused()) {
      Future.delayed(const Duration(milliseconds: 300), () {
        onTap(context);
      });
    }
    return TextFormField(
      onTap: () => onTap(context),
      key: ValueKey(value),
      initialValue: getValue(value),
      readOnly: true,
      focusNode: FocusController.getFocusNode(),
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none,
        fillColor:
            Theme.of(context).colorScheme.inversePrimary.withOpacity(0.0),
        suffixIcon: const Icon(Icons.arrow_drop_down),
      ),
    );
  }
}
