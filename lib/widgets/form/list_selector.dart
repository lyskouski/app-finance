// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/structure/def/list_selector_item.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/widgets/form/abstract_selector.dart';
import 'package:app_finance/widgets/wrapper/tap_widget.dart';
import 'package:app_finance/widgets/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';

class ListSelector<K extends ListSelectorItem> extends AbstractSelector {
  final List<K> options;
  final Function setState;
  final String? hintText;
  final TextStyle? hintStyle;

  ListSelector({
    super.key,
    required this.options,
    required this.setState,
    required this.hintText,
    this.hintStyle,
    super.value,
  }) : super();

  @override
  ListSelectorState createState() => ListSelectorState();
}

class ListSelectorState<T extends ListSelector, K extends ListSelectorItem> extends AbstractSelectorState<T> {
  Widget selectorBuilder(BuildContext context, K item) {
    final textTheme = Theme.of(context).textTheme;
    return TextWrapper(item.toString(), style: textTheme.numberMedium.copyWith(color: textTheme.headlineSmall?.color));
  }

  Widget itemBuilder(BuildContext context, K item) {
    return selectorBuilder(context, item);
  }

  void onChange(K value) {
    widget.setState(value.id);
    textController.closeView(null);
    FocusController.onEditingComplete(widget.focusOrder);
  }

  @override
  void onTap(BuildContext? context) {
    FocusController.onFocus(widget.focusOrder);
    if (!textController.isOpen) {
      textController.openView();
    }
  }

  Widget Function(Iterable<Widget>)? getViewBuilder(BuildContext context) => null;

  @override
  Widget buildContent(BuildContext context) {
    final indent = ThemeHelper.getIndent();
    final hintStyle = context.textTheme.numberMedium.copyWith(
      color: context.textTheme.headlineSmall?.color!.withOpacity(0.4),
      overflow: TextOverflow.ellipsis,
    );
    K? item = widget.value != null ? widget.options.cast().where((e) => e.equal(widget.value)).firstOrNull : null;
    return SearchAnchor(
      isFullScreen: true,
      searchController: textController,
      viewHintText: widget.hintText,
      headerHintStyle: hintStyle,
      builder: (context, controller) => TapWidget(
        onTap: () => onTap(null),
        child: Container(
          width: double.infinity,
          color: context.colorScheme.fieldBackground,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(indent, indent * 3 / 2, 0, indent * 3 / 2),
                  child: item != null
                      ? selectorBuilder(context, item)
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
      suggestionsBuilder: (context, controller) =>
          widget.options.cast().where((e) => e.match(controller.text)).map((e) => ListTile(
                title: itemBuilder(context, e),
                onTap: () => onChange(e),
              )),
    );
  }
}
