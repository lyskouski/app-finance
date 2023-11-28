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

  IconSelectorItem(this.value, {required super.name}) : super(id: value.toString());
}

class IconSelector extends ListSelector<IconSelectorItem> {
  IconSelector({
    super.key,
    required super.setState,
    IconData? value,
    super.withLabel,
    super.options = const [],
    String? hintText,
  }) : super(
          value: value != null ? IconSelectorItem(value, name: '') : null,
          hintText: hintText ?? AppLocale.labels.iconTooltip,
          tooltip: AppLocale.labels.iconTooltip,
        );

  @override
  List<IconSelectorItem> get options => IconsExt.getAll().map((e) => IconSelectorItem(e.value, name: e.key)).toList();

  @override
  IconSelectorState createState() => IconSelectorState();
}

class IconSelectorState extends ListSelectorState<IconSelector, IconSelectorItem> {
  late int crossAxisCount;

  @override
  Widget build(BuildContext context) {
    crossAxisCount = ThemeHelper.getWidthCount(null, context) * 4;
    return super.build(context);
  }

  @override
  FntSelectorCallback getItemBuilder() => (List<ListSelectorItem> options, nav) => GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
        ),
        itemCount: options.length,
        shrinkWrap: true,
        itemBuilder: (BuildContext context, int index) {
          bool oddRow = (index ~/ crossAxisCount) % 2 == 0;
          bool highlight = index % 2 == 0 && oddRow || index % 2 != 0 && !oddRow;
          return ListTile(
            tileColor: highlight ? context.colorScheme.primary.withOpacity(0.05) : null,
            hoverColor: context.colorScheme.primary.withOpacity(0.15),
            title: options[index].suggest(context),
            onTap: () => nav.pop<IconSelectorItem?>(options[index] as IconSelectorItem?),
          );
        },
      );
}
