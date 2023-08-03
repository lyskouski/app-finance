// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/focus_controller.dart';
import 'package:currency_picker/currency_picker.dart';
import 'package:flutter/material.dart';

typedef SetViewFunction = String Function(Currency input);

class CurrencySelector extends StatefulWidget {
  final Function setState;
  final SetViewFunction? setView;
  final Currency? value;
  final int focusOrder;

  const CurrencySelector({
    super.key,
    this.value,
    required this.setState,
    this.setView,
    this.focusOrder = FocusController.DEFAULT,
  });

  @override
  CurrencySelectorState createState() => CurrencySelectorState();
}

class CurrencySelectorState extends State<CurrencySelector> {
  late SetViewFunction setView;
  bool isOpened = false;

  @override
  void initState() {
    setView = widget.setView ?? setDefaultView;
    super.initState();
  }

  String setDefaultView(Currency value) {
    return '${value.symbol} - ${value.name} (${value.code})';
  }

  String getValue(Currency? value) {
    return value != null ? setView(value) : '';
  }

  void onTap(BuildContext context) {
    setState(() => isOpened = true);
    showCurrencyPicker(
        context: context,
        showFlag: true,
        showCurrencyName: true,
        showCurrencyCode: true,
        onSelect: (Currency currency) {
          widget.setState(currency);
          FocusController.resetFocus();
          setState(() => isOpened = false);
        });
  }

  @override
  Widget build(BuildContext context) {
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
      onTap: () => onTap(context),
      key: ValueKey(widget.value),
      initialValue: getValue(widget.value),
      readOnly: true,
      focusNode: FocusController.getFocusNode(),
      decoration: InputDecoration(
        filled: true,
        border: InputBorder.none,
        fillColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.0),
        suffixIcon: const Icon(Icons.arrow_drop_down),
      ),
    );
  }
}
