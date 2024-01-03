// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/design/form/list_selector_item.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/form/list_selector_page.dart';
import 'package:app_finance/design/wrapper/focus_wrapper.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/tap_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';

typedef FnState = Function(ListSelectorItem? value);

class ListSelector<K extends ListSelectorItem> extends StatefulWidget {
  final List<K> options;
  final K? value;
  final FnState setState;
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
    this.value,
    this.withLabel = false,
  });

  @override
  ListSelectorState createState() => ListSelectorState();
}

class ListSelectorState<T extends ListSelector, K extends ListSelectorItem> extends State<T> {
  final textController = SearchController();
  late FocusController focusController;
  FntSelectorCallback? getItemBuilder() => null;

  void onTap(BuildContext context) async {
    focusController.blur();
    FocusController.force = true;
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
    FocusController.force = false;
    widget.setState(result);
    WidgetsBinding.instance.addPostFrameCallback((_) => focusController.onEditingComplete(this));
  }

  @override
  Widget build(BuildContext context) {
    focusController = FocusWrapper.of(context) ?? FocusController();
    final indent = ThemeHelper.getIndent(1.5);
    final hintStyle = context.textTheme.tooltipMedium.copyWith(overflow: TextOverflow.ellipsis);
    final labelStyle = context.textTheme.tooltipSmall;
    K? item = widget.value != null ? widget.options.cast().where((e) => e.equal(widget.value?.id)).firstOrNull : null;

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
          child: LayoutBuilder(builder: (_, constraints) {
            return RowWidget(
              chunk: [null, ThemeHelper.barHeight - ThemeHelper.getIndent()],
              maxWidth: constraints.maxWidth,
              indent: 0.0,
              children: [
                [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                      indent / 1.5,
                      widget.withLabel && item != null ? 1 : indent,
                      AppDesign.isRightToLeft() ? ThemeHelper.getIndent() : 0,
                      widget.withLabel && item != null ? indent / 2 : indent,
                    ),
                    constraints: BoxConstraints(maxWidth: constraints.maxWidth - ThemeHelper.barHeight),
                    child: item != null
                        ? widget.withLabel
                            ? Column(
                                mainAxisAlignment: AppDesign.getAlignment<MainAxisAlignment>(),
                                crossAxisAlignment: AppDesign.getAlignment(),
                                children: [
                                  TextWrapper(widget.hintText ?? '...', style: labelStyle),
                                  item.build(context),
                                ],
                              )
                            : item.build(context)
                        : TextWrapper(
                            widget.hintText ?? '...',
                            style: widget.hintStyle ?? hintStyle,
                          ),
                  ),
                ],
                [
                  Padding(
                    padding: EdgeInsets.only(top: indent / 3),
                    child: ExcludeFocus(
                      child: IconButton(
                        tooltip: widget.hintText ?? '...',
                        icon: Icon(Icons.arrow_drop_down, color: widget.hintStyle?.color),
                        onPressed: () => onTap(context),
                      ),
                    ),
                  ),
                ],
              ],
            );
          }),
        ),
      ),
    );
  }
}
