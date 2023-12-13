// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/design/form/list_selector_item.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_ext/color_ext.dart';
import 'package:app_finance/design/form/simple_input.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

typedef FntSelectorCallback = Widget Function(
  List<ListSelectorItem> options,
  NavigatorState nav,
);

class ListSelectorPage<T extends Object?> extends StatefulWidget {
  final T? result;
  final List<ListSelectorItem> options;
  final String tooltip;
  final FntSelectorCallback? itemBuilder;

  const ListSelectorPage({
    super.key,
    required this.options,
    required this.tooltip,
    this.result,
    this.itemBuilder,
  });

  @override
  State<StatefulWidget> createState() => ListSelectorPageState<T>();
}

class ListSelectorPageState<T extends Object?> extends State<ListSelectorPage> {
  final controller = TextEditingController();
  late NavigatorState nav;
  List<ValueNotifier<bool>> show = [];
  dynamic result;
  List<ListSelectorItem> options = [];

  @override
  void initState() {
    result = widget.result;
    options = widget.options;
    show = List.generate(widget.options.length, (index) => ValueNotifier<bool>(true));
    if (widget.itemBuilder == null) {
      controller.addListener(() => filter(controller.text));
    } else {
      controller.addListener(
        () => setState(() => options = widget.options.where((e) => e.match(controller.text)).toList()),
      );
    }
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    show.clear();
    super.dispose();
  }

  void filter(String value) {
    for (int i = widget.options.length - 1; i >= 0; i--) {
      show[i].value = widget.options[i].match(value);
    }
  }

  Widget itemBuilder(List<ListSelectorItem> options) =>
      widget.itemBuilder?.call(options, nav) ??
      ListView.builder(
        itemCount: widget.options.length,
        itemBuilder: (BuildContext context, int index) {
          return ValueListenableBuilder<bool>(
            valueListenable: show[index],
            builder: (context, value, child) {
              return Visibility(
                visible: value,
                child: ListTile(
                  tileColor: index % 2 == 0 ? context.colorScheme.primary.withOpacity(0.05) : null,
                  hoverColor: context.colorScheme.primary.withOpacity(0.15),
                  title: widget.options[index].suggest(context),
                  onTap: () => nav.pop<T>(widget.options[index] as T),
                ),
              );
            },
          );
        },
      );

  @override
  Widget build(BuildContext context) {
    Provider.of<AppLocale>(context, listen: false).updateState(context);
    final indent = ThemeHelper.getIndent();
    nav = Navigator.of(context);
    return Material(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(ThemeHelper.getIndent()),
            width: double.infinity,
            decoration: BoxDecoration(
              color: context.colorScheme.background,
              boxShadow: [
                BoxShadow(
                  color: context.colorScheme.onBackground.withOpacity(0.1),
                  offset: const Offset(0, 1),
                  blurRadius: 3,
                  spreadRadius: 1,
                ),
                BoxShadow(
                  color: context.colorScheme.background,
                  offset: const Offset(0, 3),
                  blurRadius: 0,
                  spreadRadius: 0,
                ),
              ],
              border: Border(bottom: BorderSide(width: 4, color: context.colorScheme.background.withOpacity(0.2))),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: context.colorScheme.background,
                border: Border.all(color: context.colorScheme.onBackground.withOpacity(0.1)),
                borderRadius: BorderRadius.all(Radius.circular(indent / 2)),
              ),
              child: Row(
                children: [
                  Expanded(
                    child: SimpleInput(
                      controller: controller,
                      tooltip: widget.tooltip,
                      withLabel: true,
                      forceFocus: true,
                      onFieldSubmitted: (String value) =>
                          nav.pop<T>(widget.options.where((e) => e.match(value)).firstOrNull as T?),
                    ),
                  ),
                  Transform.translate(
                    offset: const Offset(-ThemeHelper.barHeight / 2, 0),
                    child: IconButton(
                      tooltip: AppLocale.labels.clear,
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          context.colorScheme.background.mesh(context.colorScheme.primary.withOpacity(1), 0.1),
                        ),
                      ),
                      icon: const Icon(Icons.clear),
                      onPressed: () => nav.pop<T?>(null),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(-indent, 0),
                    child: IconButton(
                      tooltip: AppLocale.labels.returnBack,
                      icon: const Icon(Icons.rotate_left_rounded),
                      onPressed: () => nav.pop<T?>(result as T?),
                    ),
                  ),
                ],
              ),
            ),
          ),
          if (result != null)
            ListTile(
              tileColor: context.colorScheme.primary.withOpacity(0.15),
              hoverColor: context.colorScheme.primary.withOpacity(0.20),
              title: widget.options.where((e) => e.equal(result)).firstOrNull?.build(context) ?? ThemeHelper.emptyBox,
              onTap: () => nav.pop<T>(result as T),
            ),
          Expanded(child: Padding(padding: EdgeInsets.all(indent), child: itemBuilder(options))),
        ],
      ),
    );
  }
}
