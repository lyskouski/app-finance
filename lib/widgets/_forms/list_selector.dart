// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/_classes/focus_controller.dart';
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

class ListSelector<K extends ListSelectorItem> extends StatefulWidget {
  final List<K> options;
  final Function setState;
  final TextStyle? style;
  final String? value;
  final String? hintText;
  final double indent;
  final int focusOrder;

  ListSelector({
    required this.options,
    required this.setState,
    this.style,
    this.value,
    this.hintText = '',
    this.indent = 0.0,
    this.focusOrder = FocusController.DEFAULT,
  }) : super(key: UniqueKey());

  @override
  ListSelectorState createState() => ListSelectorState();
}

class ListSelectorState<T extends ListSelector, K extends ListSelectorItem> extends State<T> {
  final _textController = TextEditingController(text: '');
  late FocusNode focus;
  bool isFocused = false;

  @override
  void initState() {
    FocusController.init(widget.focusOrder, widget.value);
    focus = FocusController.getFocusNode() ?? FocusNode();
    super.initState();
  }

  Widget selectorBuilder(context, K item) {
    return Text(item.name, style: widget.style);
  }

  Widget itemBuilder(context, K item, bool isSelected) {
    return Padding(
      padding: EdgeInsets.all(widget.indent),
      child: selectorBuilder(context, item),
    );
  }

  Widget dropDownBuilder(BuildContext context, K? selectedItem) {
    if (selectedItem == null) {
      return const SizedBox();
    }
    return selectorBuilder(context, selectedItem);
  }

  @override
  Widget build(context) {
    if (widget.value == '' && focus.hasFocus && !isFocused) {
      Future.delayed(Duration.zero, () => setState(() => isFocused = true));
      Future.delayed(Duration.zero, () => FocusController.scrollToFocusedElement(focus));
    }

    return DropdownSearch<K>(
      onChanged: (value) => widget.setState(value.toString()),
      selectedItem: widget.options.where((element) => element.id == widget.value).firstOrNull as K?,
      items: widget.options as List<K>,
      compareFn: (item, selectedItem) => item.name.contains(selectedItem.name),
      dropdownDecoratorProps: DropDownDecoratorProps(
        dropdownSearchDecoration: InputDecoration(
          hintText: widget.hintText,
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
          autofocus: FocusController.isFocused(),
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
