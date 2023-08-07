// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/focus_controller.dart';
import 'package:app_finance/widgets/_forms/abstract_input.dart';
import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';

class ListSelectorItem {
  final String id;
  final String name;

  @override
  String toString() => id;

  bool isEqual(ListSelectorItem model) {
    return id == model.id;
  }

  ListSelectorItem({required this.id, required this.name});
}

class ListSelector<K extends ListSelectorItem> extends AbstractInput {
  final List<K> options;
  final Function setState;
  final TextStyle? style;
  final String? hintText;
  final double indent;
  final _textController = TextEditingController(text: '');

  ListSelector({
    required this.options,
    required this.setState,
    this.style,
    super.value,
    this.hintText = '',
    this.indent = 0.0,
  }) : super();

  Widget selectorBuilder(context, K item) {
    return Text(item.name, style: style);
  }

  Widget itemBuilder(context, K item, bool isSelected) {
    return Padding(
      padding: EdgeInsets.all(indent),
      child: selectorBuilder(context, item),
    );
  }

  Widget dropDownBuilder(BuildContext context, K? selectedItem) {
    if (selectedItem == null) {
      return const SizedBox();
    }
    return selectorBuilder(context, selectedItem);
  }

  void onChange(K? value) {
    setState(value.toString());
    FocusController.onEditingComplete(focusOrder);
  }

  @override
  Widget build(context) {
    bool isFocused = FocusController.isFocused(focusOrder, value);
    if (isFocused) {
      // open popup: openDropDownSearch
    }
    return DropdownSearch<K>(
      onChanged: onChange,
      selectedItem: options.where((element) => element.id == value).firstOrNull,
      items: options,
      compareFn: (item, selectedItem) => item.name.contains(selectedItem.name),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          hintText: hintText,
          filled: true,
          border: InputBorder.none,
          fillColor: Theme.of(context).colorScheme.inversePrimary.withOpacity(0.3),
        ),
      ),
      dropdownBuilder: dropDownBuilder,
      popupProps: PopupProps.menu(
        showSearchBox: true,
        showSelectedItems: true,
        searchFieldProps: TextFieldProps(
          controller: _textController,
          focusNode: focus,
          autofocus: isFocused,
          decoration: InputDecoration(
            suffixIcon: IconButton(
              icon: const Icon(Icons.clear),
              onPressed: _textController.clear,
            ),
          ),
        ),
        itemBuilder: itemBuilder,
      ),
    );
  }
}
