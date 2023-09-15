// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_zoom.dart';
import 'package:app_finance/_classes/structure/navigation/app_menu.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/controller/focus_controller.dart';
import 'package:app_finance/_configs/responsive_matrix.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/widgets/generic/menu_widget.dart';
import 'package:app_finance/widgets/wrapper/input_controller_wrapper.dart';
import 'package:app_finance/widgets/wrapper/row_widget.dart';
import 'package:app_finance/widgets/wrapper/text_wrapper.dart';
import 'package:app_finance/widgets/wrapper/toolbar_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

abstract class AbstractPageState<T extends StatefulWidget> extends State<T> {
  static const barHeight = 40.0;
  dynamic bar;
  late AppData state;

  int selectedMenu = 0;

  String getTitle();

  String getButtonName();

  Widget buildButton(BuildContext context, BoxConstraints constraints);

  Widget buildContent(BuildContext context, BoxConstraints constraints);

  Widget? getBarLeading(NavigatorState nav) {
    return ToolbarButtonWidget(
      child: IconButton(
        hoverColor: Colors.transparent,
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white70,
        ),
        tooltip: AppLocale.labels.backTooltip,
        onPressed: () => nav.pop(),
      ),
    );
  }

  List<Widget> getBarActions(NavigatorState nav) {
    return [
      PopupMenuButton(
        itemBuilder: (BuildContext context) {
          return AppMenu.get().map((menuItem) {
            return PopupMenuItem(
              value: menuItem.route,
              child: Row(
                children: [
                  Icon(menuItem.icon),
                  ThemeHelper.wIndent,
                  Text(menuItem.name),
                ],
              ),
            );
          }).toList();
        },
        onSelected: (value) => nav.pushNamed(value),
        child: ToolbarButtonWidget(
          child: Padding(
            padding: EdgeInsets.all(ThemeHelper.getIndent()),
            child: Icon(
              Icons.menu,
              semanticLabel: AppLocale.labels.navigationTooltip,
              color: Colors.white70,
            ),
          ),
        ),
      ),
    ];
  }

  Widget getBarTitle(BuildContext context, [bool isBottom = false]) {
    return TextWrapper(
      getTitle(),
      style: TextStyle(color: context.colorScheme.onInverseSurface.withOpacity(0.8)),
    );
  }

  AppBar buildBar(BuildContext context) {
    final nav = Navigator.of(context);
    return AppBar(
      title: Center(child: getBarTitle(context)),
      toolbarHeight: barHeight,
      backgroundColor: context.colorScheme.primary,
      leading: getBarLeading(nav),
      actions: getBarActions(nav),
    );
  }

  BottomAppBar buildBottomBar(BuildContext context, BoxConstraints constraints) {
    final theme = Theme.of(context);
    final nav = Navigator.of(context);
    return BottomAppBar(
      padding: EdgeInsets.zero,
      notchMargin: CircularProgressIndicator.strokeAlignCenter,
      clipBehavior: Clip.none,
      elevation: 0.0,
      height: barHeight,
      color: theme.colorScheme.primary,
      child: RowWidget(
        maxWidth: constraints.maxWidth,
        indent: 0,
        chunk: [50, null, getButtonName().isNotEmpty ? 0.5 : 0, 50],
        children: [
          [getBarLeading(nav) ?? ThemeHelper.emptyBox],
          [
            Center(
              heightFactor: 2,
              child: getBarTitle(context, true),
            ),
          ],
          [
            Padding(
              padding: EdgeInsets.only(left: 84, top: ThemeHelper.getIndent(0.5)),
              child: TextWrapper(
                getButtonName(),
                maxLines: 2,
                style: theme.textTheme.bodySmall!.copyWith(color: theme.colorScheme.onInverseSurface.withOpacity(0.6)),
              ),
            ),
          ],
          getBarActions(nav),
        ],
      ),
    );
  }

  Drawer? buildDrawer() {
    final ColorScheme colorScheme = context.colorScheme;
    double indent = ThemeHelper.getIndent();
    return Drawer(
      elevation: 0,
      shape: Border.all(width: 0),
      child: Container(
        color: colorScheme.background,
        child: ListView.separated(
          scrollDirection: Axis.vertical,
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(vertical: indent * 4),
          separatorBuilder: (context, index) => ThemeHelper.hIndent2x,
          itemCount: AppMenu.get().length,
          itemBuilder: (context, index) => MenuWidget(
            index: index,
            setState: () => setState(() => selectedMenu = index),
            selectedIndex: selectedMenu,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    FocusController.init();
    final scale = context.watch<AppZoom>().value;
    return Consumer<AppData>(builder: (context, appState, _) {
      state = appState;
      return LayoutBuilder(builder: (context, constraints) {
        final button = buildButton(context, constraints);
        final isBottom = ResponsiveMatrix(getWindowType(context)).isNavBottom(constraints);
        if (isBottom && bar is! BottomAppBar || bar is! AppBar) {
          bar = isBottom ? buildBottomBar(context, constraints) : buildBar(context);
        }
        final dx = (constraints.maxWidth - constraints.maxWidth / scale) / 2;
        final dy = (constraints.maxHeight - constraints.maxHeight / scale) / 2;
        return Scaffold(
          appBar: isBottom ? null : bar as AppBar,
          bottomNavigationBar: isBottom ? bar as BottomAppBar : null,
          drawer: buildDrawer(),
          body: SafeArea(
            child: InputControllerWrapper(
              child: OverflowBox(
                alignment: Alignment.topLeft,
                minWidth: constraints.maxWidth / scale,
                maxWidth: constraints.maxWidth / scale,
                minHeight: constraints.maxHeight / scale,
                maxHeight: constraints.maxHeight / scale,
                child: Transform.translate(
                  offset: Offset(dx, dy),
                  child: Transform.scale(
                    scale: scale,
                    child: buildContent(context, constraints),
                  ),
                ),
              ),
            ),
          ),
          floatingActionButtonLocation: isBottom ? FloatingActionButtonLocation.centerDocked : null,
          floatingActionButton: button,
        );
      });
    });
  }
}
