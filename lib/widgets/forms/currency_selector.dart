// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

typedef SetViewFunction = String Function(Currency input);

class CurrencySelector extends StatelessWidget {
  Function setState;
  SetViewFunction? setView;
  Currency? value;

  CurrencySelector({
    super.key,
    this.value,
    required this.setState,
    this.setView,
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
    showCurrencyPicker(
      context: context,
      showFlag: true,
      showCurrencyName: true,
      showCurrencyCode: true,
      onSelect: (Currency currency) => setState(currency),
    );
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onTap: () => onTap(context),
      key: ValueKey(value),
      initialValue: getValue(value),
      readOnly: true,
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
