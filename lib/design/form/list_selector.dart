// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/structure/def/list_selector_item.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/form/abstract_selector.dart';
import 'package:app_finance/design/wrapper/tap_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';

class ListSelector<K extends ListSelectorItem> extends AbstractSelector {
  final List<K> options;
  final Function setState;
  final String? hintText;
  final String? tooltip;
  final TextStyle? hintStyle;
  final Color? hintColor;
  final bool withLabel;

  const ListSelector({
    super.key,
    required this.options,
    required this.setState,
    this.hintText,
    this.tooltip,
    this.hintStyle,
    this.hintColor,
    super.value,
    this.withLabel = false,
  });

  @override
  ListSelectorState createState() => ListSelectorState();
}

class ListSelectorState<T extends ListSelector, K extends ListSelectorItem> extends AbstractSelectorState<T> {
  Widget selectorBuilder(BuildContext context, K item) {
    final textTheme = Theme.of(context).textTheme;
    return TextWrapper(item.toString(), style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color));
  }

  Widget itemBuilder(BuildContext context, K item) => selectorBuilder(context, item);

  void onChange(K value) {
    textController.closeView(null);
    widget.setState(value.id);
    focusController.onEditingComplete(this);
  }

  @override
  void onTap(BuildContext? context) {
    focusController.onFocus(this);
    if (!textController.isOpen) {
      textController.openView();
    }
  }

  Widget Function(Iterable<Widget>)? getViewBuilder(BuildContext context) => null;

  List<Widget> buildSuggestions(BuildContext context, SearchController controller) {
    final result = <Widget>[];
    final scope = widget.options.cast().where((e) => e.match(controller.text));
    scope.toList().asMap().forEach((index, e) {
      result.add(ListTile(
        title: itemBuilder(context, e),
        tileColor: index % 2 == 0 ? context.colorScheme.primary.withOpacity(0.05) : null,
        hoverColor: context.colorScheme.primary.withOpacity(0.15),
        onTap: () => onChange(e),
      ));
    });
    return result;
  }

  @override
  Widget buildContent(BuildContext context) {
    final indent = ThemeHelper.getIndent(1.5);
    final hintStyle = context.textTheme.tooltipMedium.copyWith(overflow: TextOverflow.ellipsis);
    final labelStyle = context.textTheme.tooltipSmall;
    K? item = widget.value != null ? widget.options.cast().where((e) => e.equal(widget.value)).firstOrNull : null;
    return SearchAnchor(
      isFullScreen: true,
      searchController: textController,
      viewHintText: widget.tooltip ?? widget.hintText,
      headerHintStyle: hintStyle,
      builder: (context, controller) => TapWidget(
        tooltip: widget.tooltip ?? '',
        onTap: () => onTap(null),
        onFocusChange: (v) => v ? focusController.scrollToFocusedElement(this) : null,
        child: Container(
          width: double.infinity,
          color: context.colorScheme.fieldBackground,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(
                    indent / 1.5,
                    widget.withLabel && item != null ? 1 : indent,
                    0,
                    widget.withLabel && item != null ? indent / 2 : indent,
                  ),
                  child: item != null
                      ? widget.withLabel
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextWrapper(widget.hintText ?? '...', style: labelStyle),
                                selectorBuilder(context, item),
                              ],
                            )
                          : selectorBuilder(context, item)
                      : Text(
                          widget.hintText ?? '...',
                          style: widget.hintStyle ?? hintStyle,
                        ),
                ),
              ),
              IconButton(
                icon: Icon(Icons.arrow_drop_down, color: widget.hintStyle?.color),
                onPressed: () => controller.openView(),
              ),
            ],
          ),
        ),
      ),
      viewBuilder: getViewBuilder(context),
      suggestionsBuilder: (context, controller) => buildSuggestions(context, controller),
    );
  }
}
