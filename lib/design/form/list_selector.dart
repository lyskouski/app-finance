// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/design/form/list_selector_item.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/form/abstract_selector.dart';
import 'package:app_finance/design/form/list_selector_page.dart';
import 'package:app_finance/design/wrapper/focus_wrapper.dart';
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
  FntSelectorCallback? getItemBuilder() => null;

  @override
  void onTap(BuildContext context) async {
    focusController.onFocus(this);
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ListSelectorPage(
          options: widget.options,
          result: widget.value,
          tooltip: widget.tooltip ?? widget.hintText ?? '...',
          itemBuilder: getItemBuilder(),
        ),
      ),
    );
    widget.setState(result);
    WidgetsBinding.instance.addPostFrameCallback((_) => focusController.onEditingComplete(this));
  }

  @override
  Widget buildContent(BuildContext context) => ThemeHelper.emptyBox;

  @override
  Widget build(BuildContext context) {
    focusController = FocusWrapper.of(context) ?? FocusController();
    final indent = ThemeHelper.getIndent(1.5);
    final hintStyle = context.textTheme.tooltipMedium.copyWith(overflow: TextOverflow.ellipsis);
    final labelStyle = context.textTheme.tooltipSmall;
    K? item = widget.value != null ? widget.options.cast().where((e) => e.equal(widget.value)).firstOrNull : null;

    return InkWell(
      autofocus: focusController.isFocused(this),
      focusNode: focusController.bind(this, context: context, value: widget.value),
      child: TapWidget(
        tooltip: widget.tooltip ?? '',
        onTap: () => onTap(context),
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
                                item.build(context),
                              ],
                            )
                          : item.build(context)
                      : Text(
                          widget.hintText ?? '...',
                          style: widget.hintStyle ?? hintStyle,
                        ),
                ),
              ),
              ExcludeFocus(
                child: IconButton(
                  tooltip: widget.hintText ?? '...',
                  icon: Icon(Icons.arrow_drop_down, color: widget.hintStyle?.color),
                  onPressed: () => onTap(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
