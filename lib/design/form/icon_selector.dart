// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/design/form/list_selector_item.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_ext/icons_ext.dart';
import 'package:app_finance/design/form/list_selector.dart';
import 'package:app_finance/design/form/list_selector_page.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';

class IconSelectorItem extends ListSelectorItem {
  IconData value;

  @override
  Widget build(context) => Icon(value, semanticLabel: name);

  @override
  Widget suggest(BuildContext context) => Column(
        children: [
          ThemeHelper.hIndent,
          Icon(value, semanticLabel: name, size: 32),
          ThemeHelper.hIndent,
          TextWrapper(name, style: context.textTheme.numberSmall),
        ],
      );

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
    super.withLabel,
    super.options = const [],
    String? hintText,
  }) : super(
          value: value,
          hintText: hintText ?? AppLocale.labels.iconTooltip,
          tooltip: AppLocale.labels.iconTooltip,
        );

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
  late int crossAxisCount;

  @override
  void setState(VoidCallback fn) {
    textController.addListener(() => setState(() {
          options = fullScope.where((e) => e.name.contains(textController.text)).toList();
        }));
    super.setState(fn);
  }

  @override
  FntSelectorCallback getItemBuilder() =>
      (List<ListSelectorItem> options, List<ValueNotifier<bool>> show, nav) => GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: crossAxisCount,
            ),
            itemCount: options.length,
            itemBuilder: (BuildContext context, int index) => ValueListenableBuilder<bool>(
              valueListenable: show[index],
              builder: (context, value, child) {
                bool oddRow = (index ~/ crossAxisCount) % 2 == 0;
                bool highlight = index % 2 == 0 && oddRow || index % 2 != 0 && !oddRow;
                return Visibility(
                  visible: value,
                  child: ListTile(
                    tileColor: highlight ? context.colorScheme.primary.withOpacity(0.05) : null,
                    hoverColor: context.colorScheme.primary.withOpacity(0.15),
                    title: widget.options[index].suggest(context),
                    onTap: () => nav.pop<IconSelectorItem>(widget.options[index]),
                  ),
                );
              },
            ),
          );
}
