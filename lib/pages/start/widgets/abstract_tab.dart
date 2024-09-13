// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:flutter/material.dart';

abstract class AbstractTab<T> extends StatefulWidget {
  final bool isFirstBoot;
  final Function() setState;
  final Function(Widget btn) setButton;

  const AbstractTab({
    super.key,
    required this.setState,
    required this.setButton,
    required this.isFirstBoot,
  });
}

abstract class AbstractTabState<T extends AbstractTab> extends State<T> {
  String getButtonTitle();

  Widget buildContent(BuildContext context, BoxConstraints constraints);

  void updateState() => widget.setState();

  IconData getButtonIcon() => Icons.navigate_next;

  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return FullSizedButtonWidget(
      constraints: constraints,
      onPressed: updateState,
      title: getButtonTitle() != ''
          ? '${getButtonTitle()} (${AppLocale.labels.goNextTooltip})'
          : AppLocale.labels.goNextTooltip,
      icon: getButtonIcon(),
    );
  }

  @override
  Widget build(BuildContext context) {
    double indent = ThemeHelper.getIndent(2);
    return LayoutBuilder(builder: (context, constraints) {
      if (widget.isFirstBoot) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          widget.setButton(buildButton(context, constraints));
        });
        return ThemeHelper.emptyBox;
      }
      return Container(
        margin: EdgeInsets.all(indent),
        child: buildContent(context, constraints),
      );
    });
  }
}
