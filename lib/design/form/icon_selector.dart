// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/def/list_selector_item.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_ext/icons_ext.dart';
import 'package:app_finance/design/form/list_selector.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
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
    super.withLabel,
    super.options = const [],
    String? hintText,
  }) : super(
          value: value.toString(),
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
  void onChange(IconSelectorItem value, [NavigatorState? nav]) {
    widget.setState(value.value);
    textController.closeView(null);
    focusController.onEditingComplete(this);
  }

  @override
  Widget Function(Iterable<Widget>)? getViewBuilder(BuildContext context) {
    crossAxisCount = ThemeHelper.getWidthCount(null, context) * 4;
    return (Iterable<Widget> suggestions) {
      return GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
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

  @override
  List<Widget> buildSuggestions(BuildContext context, SearchController controller) {
    final result = <Widget>[];
    final scope = widget.options.cast().where((e) => e.match(controller.text));
    scope.toList().asMap().forEach((index, e) {
      bool oddRow = (index ~/ crossAxisCount) % 2 == 0;
      bool highlight = index % 2 == 0 && oddRow || index % 2 != 0 && !oddRow;
      result.add(ListTile(
        title: itemBuilder(context, e),
        tileColor: highlight ? context.colorScheme.primary.withOpacity(0.05) : null,
        hoverColor: context.colorScheme.primary.withOpacity(0.15),
        onTap: () => onChange(e),
      ));
    });
    return result;
  }
}
