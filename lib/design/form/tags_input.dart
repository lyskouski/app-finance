// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:material_ui/material_ui.dart';
import 'package:flutter/services.dart';

// List of tags: a tag is added by Enter (or comma), removed by its icon or Backspace in the empty input
class TagsInput extends StatefulWidget {
  final String title;
  final String? tooltip;
  final ValueNotifier<List<String>> controller;
  // Restores the initial list of tags when differs from the current one
  final List<String>? defaults;
  final String Function(String value) normalize;

  const TagsInput({
    super.key,
    required this.title,
    required this.controller,
    this.tooltip,
    this.defaults,
    this.normalize = _trim,
  });

  static String _trim(String value) => value.trim();

  @override
  TagsInputState createState() => TagsInputState();
}

class TagsInputState extends State<TagsInput> {
  final input = TextEditingController();
  late final focus = FocusNode(onKeyEvent: _onKey);

  List<String> get tags => widget.controller.value;

  @override
  void dispose() {
    input.dispose();
    focus.dispose();
    super.dispose();
  }

  void add(String value) {
    final scope = value.split(',').map(widget.normalize).where((e) => e.isNotEmpty && !tags.contains(e)).toSet();
    if (scope.isNotEmpty) {
      widget.controller.value = [...tags, ...scope];
    }
    input.clear();
    focus.requestFocus();
  }

  void remove(String value) => widget.controller.value = tags.where((e) => e != value).toList();

  void reset() => widget.controller.value = [...widget.defaults!];

  KeyEventResult _onKey(FocusNode node, KeyEvent event) {
    if (event is KeyDownEvent &&
        event.logicalKey == LogicalKeyboardKey.backspace &&
        input.text.isEmpty &&
        tags.isNotEmpty) {
      remove(tags.last);
      return KeyEventResult.handled;
    }
    return KeyEventResult.ignored;
  }

  bool get isDefault {
    final defaults = widget.defaults;
    return defaults == null || (defaults.length == tags.length && defaults.every(tags.contains));
  }

  Widget buildInput(BuildContext context) {
    final textTheme = context.textTheme;
    return ConstrainedBox(
      constraints: const BoxConstraints(minWidth: 120, maxWidth: 240),
      child: IntrinsicWidth(
        child: TextField(
          controller: input,
          focusNode: focus,
          style: textTheme.numberMedium,
          keyboardAppearance: context.colorScheme.brightness,
          textInputAction: TextInputAction.done,
          onChanged: (value) => value.contains(',') ? add(value) : null,
          onSubmitted: add,
          decoration: InputDecoration(
            isDense: true,
            border: InputBorder.none,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final indent = ThemeHelper.getIndent(1.8);
    return ValueListenableBuilder<List<String>>(
      valueListenable: widget.controller,
      builder: (context, value, _) => Column(
        crossAxisAlignment: AppDesign.getAlignment(),
        children: [
          Row(
            children: [
              Expanded(child: TextWrapper(widget.title, style: context.textTheme.bodyLarge)),
              if (!isDefault)
                TextButton.icon(
                  icon: const Icon(Icons.restart_alt, size: 18),
                  onPressed: reset,
                  label: Text(AppLocale.labels.reset),
                ),
            ],
          ),
          if (widget.tooltip != null) Text(widget.tooltip!, style: context.textTheme.bodyMedium),
          ThemeHelper.hIndent05,
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: focus.requestFocus,
            child: Container(
              width: double.infinity,
              color: context.colorScheme.fieldBackground,
              padding: EdgeInsets.fromLTRB(indent / 1.5, indent / 2, indent / 1.5, indent / 2),
              child: Wrap(
                spacing: ThemeHelper.getIndent(0.5),
                runSpacing: ThemeHelper.getIndent(0.5),
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  for (final tag in value)
                    InputChip(
                      key: ValueKey('tag_$tag'),
                      label: Text(tag),
                      visualDensity: VisualDensity.compact,
                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      deleteIcon: const Icon(Icons.close, size: 16),
                      onDeleted: () => remove(tag),
                    ),
                  buildInput(context),
                ],
              ),
            ),
          ),
          ThemeHelper.hIndent2x,
        ],
      ),
    );
  }
}
