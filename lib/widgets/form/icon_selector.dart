// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/def/list_selector_item.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_ext/icons_ext.dart';
import 'package:app_finance/widgets/form/list_selector.dart';
import 'package:app_finance/widgets/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';

class IconSelectorItem extends ListSelectorItem {
  IconData value;

  @override
  bool equal(val) => value == val;

  IconSelectorItem({required this.value, required super.name}) : super(id: value.toString());
}

class IconSelector extends ListSelector {
  @override
  // ignore: overridden_fields
  final IconData? value;

  IconSelector({
    super.key,
    required super.setState,
    this.value,
    super.options = const [],
  }) : super(value: value.toString(), hintText: AppLocale.labels.iconTooltip);

  @override
  List<IconSelectorItem> get options => IconsExt.getAll()
      .map((e) => IconSelectorItem(
            value: e.value,
            name: e.key,
          ))
      .toList();

  @override
  IconSelectorState createState() => IconSelectorState();
}

class IconSelectorState extends ListSelectorState<IconSelector, IconSelectorItem> {
  late List<IconSelectorItem> fullScope = widget.options;
  late List<IconSelectorItem> options = widget.options;

  @override
  void setState(VoidCallback fn) {
    textController.addListener(() => setState(() {
          options = fullScope.where((e) => e.name.contains(textController.text)).toList();
        }));
    super.setState(fn);
  }

  @override
  void onChange(IconSelectorItem value) {
    widget.setState(value.value);
    textController.closeView(null);
    FocusController.onEditingComplete(widget.focusOrder);
  }

  @override
  Widget Function(Iterable<Widget>)? getViewBuilder(BuildContext context) {
    final count = ThemeHelper.getWidthCount(null, context);
    return (Iterable<Widget> suggestions) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: count * 4,
        ),
        itemCount: suggestions.length,
        itemBuilder: (_, index) => suggestions.elementAt(index),
      );
    };
  }

  @override
  Widget selectorBuilder(context, item) => Icon(
        item.value,
        semanticLabel: item.name,
      );

  @override
  Widget itemBuilder(BuildContext context, item) => Column(
        children: [
          ThemeHelper.hIndent,
          Icon(
            item.value,
            semanticLabel: item.name,
            size: 32,
          ),
          ThemeHelper.hIndent,
          TextWrapper(item.name, style: context.textTheme.numberSmall),
        ],
      );
}
