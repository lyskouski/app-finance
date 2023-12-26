// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_zoom.dart';
import 'package:app_finance/_classes/structure/navigation/app_menu.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/screen_helper.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/pages/_interfaces/widgets/menu_widget.dart';
import 'package:app_finance/design/wrapper/input_controller_wrapper.dart';
import 'package:app_finance/design/wrapper/row_widget.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:app_finance/design/button/toolbar_button_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_grid_layout/flutter_grid_layout.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

abstract class AbstractPageState<T extends StatefulWidget> extends State<T> {
  late AppData state;

  int selectedMenu = 0;

  String getTitle();

  String getButtonName();

  String? getHelperName() => null;

  Widget buildButton(BuildContext context, BoxConstraints constraints);

  Widget buildContent(BuildContext context, BoxConstraints constraints);

  Widget? getBarLeading(NavigatorState nav) {
    return ToolbarButtonWidget(
      isWide: ScreenHelper.state().isWide,
      tooltip: AppLocale.labels.backTooltip,
      onPressed: () => nav.pop(),
      icon: Icons.arrow_back,
      color: Colors.white70,
    );
  }

  Widget buildHelper(BuildContext context,
      {String? type, Widget Function(BuildContext, AsyncSnapshot<String>)? builder}) {
    final locale = AppLocale.labels.localeName;
    type ??= getHelperName();
    return Container(
      width: double.infinity,
      color: context.colorScheme.background,
      child: Column(
        children: [
          Transform.translate(
            offset: const Offset(-10, -24),
            child: Align(
              alignment: Alignment.topRight,
              child: FloatingActionButton(
                heroTag: 'helper',
                mini: true,
                tooltip: AppLocale.labels.closeTooltip,
                onPressed: () => Navigator.pop(context),
                child: Icon(
                  Icons.close,
                  color: Colors.white70,
                  semanticLabel: AppLocale.labels.closeTooltip,
                ),
              ),
            ),
          ),
          Expanded(
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context).loadString('./assets/l10n/${type}_$locale.md'),
              builder: builder ??
                  (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.hasData) {
                      return Markdown(data: snapshot.data!);
                    }
                    return Container();
                  },
            ),
          ),
        ],
      ),
    );
  }

  List<Widget> getBarActions(NavigatorState nav) {
    final isWide = ScreenHelper.state().isWide;
    return [
      if (getHelperName() != null)
        ToolbarButtonWidget(
          isWide: isWide,
          tooltip: AppLocale.labels.helpTooltip,
          onPressed: () => showModalBottomSheet(
            context: context,
            backgroundColor: context.colorScheme.background,
            builder: buildHelper,
          ),
          icon: Icons.contact_support_outlined,
          color: Colors.white70,
          semanticLabel: AppLocale.labels.helpTooltip,
        ),
      if (!isWide)
        Builder(
          builder: (context) => ToolbarButtonWidget(
            icon: Icons.menu,
            color: Colors.white70,
            tooltip: AppLocale.labels.navigationTooltip,
            onPressed: () => Scaffold.of(context).openDrawer(),
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

  AppBar? buildBar(BuildContext context, BoxConstraints constraints) {
    final nav = Navigator.of(context);
    final isWide = ScreenHelper.state().isWide;
    return AppBar(
      title: Center(child: getBarTitle(context)),
      toolbarHeight: ThemeHelper.barHeight,
      shape: isWide
          ? UnderlineInputBorder(
              borderSide: BorderSide(color: context.colorScheme.primary),
              borderRadius: BorderRadius.zero,
            )
          : null,
      backgroundColor: isWide ? context.colorScheme.inverseSurface.withOpacity(0.4) : context.colorScheme.primary,
      leading: getBarLeading(nav),
      leadingWidth: isWide ? ThemeHelper.menuWidth : null,
      actions: getBarActions(nav),
    );
  }

  Widget? buildRightBar(BuildContext context, BoxConstraints constraints) {
    final nav = Navigator.of(context);
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        color: context.colorScheme.primary,
        width: ThemeHelper.barHeight,
        child: Column(
          children: [
            getBarLeading(nav) ?? ThemeHelper.emptyBox,
            ...getBarActions(nav),
            ThemeHelper.hIndent,
            RotatedBox(
              quarterTurns: 3,
              child: SizedBox(width: constraints.maxHeight / 2.5, child: getBarTitle(context)),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBottomBar(BuildContext context, BoxConstraints constraints) {
    final theme = Theme.of(context);
    final nav = Navigator.of(context);
    final actions = getBarActions(nav);
    final btnWidth = 50.0 * actions.length;
    final titleWidth = ThemeHelper.getWidth(context, 0, null, false) / 2 - 100;
    final hasTooltip = getButtonName().isNotEmpty;
    final showTooltip = hasTooltip && (constraints.maxWidth - titleWidth - btnWidth - 50 > 125);
    return Container(
      padding: EdgeInsets.zero,
      clipBehavior: Clip.none,
      height: ThemeHelper.barHeight,
      color: theme.colorScheme.primary,
      child: RowWidget(
        maxWidth: constraints.maxWidth,
        indent: 0,
        chunk: [50, hasTooltip ? titleWidth : null, hasTooltip ? null : 0, btnWidth],
        children: [
          [getBarLeading(nav) ?? ThemeHelper.emptyBox],
          [
            Center(
              heightFactor: 1.9,
              child: getBarTitle(context, true),
            ),
          ],
          [
            if (showTooltip)
              Padding(
                padding: EdgeInsets.only(left: 84, top: ThemeHelper.getIndent(0.5)),
                child: TextWrapper(
                  getButtonName(),
                  maxLines: 2,
                  style:
                      theme.textTheme.bodySmall?.copyWith(color: theme.colorScheme.onInverseSurface.withOpacity(0.6)),
                ),
              ),
          ],
          [
            RowWidget(
              chunk: List.filled(actions.length, null),
              maxWidth: btnWidth,
              indent: 0,
              children: actions.map((e) => [e]).toList(),
            ),
          ],
        ],
      ),
    );
  }

  Widget? buildNavigation() {
    return ListView.separated(
      scrollDirection: Axis.vertical,
      addSemanticIndexes: true,
      padding: EdgeInsets.symmetric(vertical: ThemeHelper.getIndent(4)),
      separatorBuilder: (context, index) => ThemeHelper.hIndent2x,
      itemCount: AppMenu.get().length,
      itemBuilder: (context, index) => MenuWidget(
        index: index,
        setState: () => setState(() => selectedMenu = index),
        selectedIndex: selectedMenu,
      ),
    );
  }

  Drawer? buildDrawer() {
    return Drawer(
      key: InputControllerWrapper.drawerKey,
      elevation: 0,
      shape: Border.all(width: 0),
      child: ScreenHelper.state().isWide
          ? buildNavigation()
          : InputControllerWrapper(
              child: buildNavigation() ?? ThemeHelper.emptyBox,
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scale = context.watch<AppZoom>().value;
    return Scaffold(
      appBar: AppBar(backgroundColor: context.colorScheme.primary, toolbarHeight: 0),
      body: Consumer<AppData>(builder: (context, appState, _) {
        state = appState;
        return LayoutBuilder(builder: (context, constraints) {
          final display = ScreenHelper.getInstance(context, constraints);
          final isBottom = display.isBottom && !display.isRight;
          final hasKeyboard = ThemeHelper.isKeyboardVisible(context, constraints);
          final height = constraints.maxHeight;
          final blockHeight = height / scale - (display.isRight ? 0 : ThemeHelper.barHeight + ThemeHelper.getIndent());
          double width = constraints.maxWidth / scale;
          Widget? rightBar;
          Widget? leftBar;
          if (display.isRight) {
            rightBar = buildRightBar(context, constraints);
            if (rightBar != null) {
              width -= ThemeHelper.barHeight;
            }
          } else if (display.isWide) {
            leftBar = buildNavigation();
            if (leftBar != null) {
              width -= ThemeHelper.menuWidth;
            }
          }
          if (width < 0) {
            width = 0;
          }
          final dx = (constraints.maxWidth - constraints.maxWidth / scale) / 2;
          final dy = (height - height / scale) / 2;
          return Scaffold(
            appBar: display.isBottom ? null : buildBar(context, constraints),
            drawer: buildDrawer(),
            floatingActionButtonLocation: isBottom ? FloatingActionButtonLocation.centerDocked : null,
            floatingActionButton: isBottom
                ? hasKeyboard
                    ? Transform.translate(
                        offset: const Offset(0, 12),
                        child: SizedBox(
                          height: ThemeHelper.barHeight * 1.2,
                          child: buildButton(context, constraints),
                        ),
                      )
                    : defaultTargetPlatform == TargetPlatform.iOS
                        ? buildButton(context, constraints)
                        : Container(
                            margin: EdgeInsets.only(bottom: ThemeHelper.getIndent()),
                            child: buildButton(context, constraints),
                          )
                : buildButton(context, constraints),
            resizeToAvoidBottomInset: true,
            body: InputControllerWrapper(
              child: GridContainer(
                rows: const [ThemeHelper.menuWidth, null, ThemeHelper.barHeight],
                columns: const [null, ThemeHelper.barHeight],
                children: [
                  if (leftBar != null)
                    GridItem(
                      order: 2,
                      start: const Size(0, 0),
                      end: const Size(1, 2),
                      child: Container(
                        color: context.colorScheme.inversePrimary.withOpacity(0.2),
                        width: ThemeHelper.menuWidth,
                        height: double.infinity,
                        child: buildNavigation(),
                      ),
                    ),
                  GridItem(
                    order: 1,
                    start: Size(leftBar != null ? 1 : 0, 0),
                    end: Size(rightBar != null ? 2 : 3, rightBar == null && display.isBottom ? 1 : 2),
                    child: OverflowBox(
                      alignment: Alignment.topLeft,
                      minWidth: width,
                      maxWidth: width,
                      minHeight: blockHeight,
                      maxHeight: blockHeight,
                      child: Transform.translate(
                        offset: Offset(dx, dy),
                        child: Transform.scale(
                          scale: scale,
                          child: buildContent(context, constraints),
                        ),
                      ),
                    ),
                  ),
                  if (rightBar != null)
                    GridItem(
                      order: 2,
                      start: const Size(2, 0),
                      end: const Size(3, 2),
                      child: rightBar,
                    ),
                  if (rightBar == null && display.isBottom)
                    GridItem(
                      order: 2,
                      start: const Size(0, 1),
                      end: const Size(3, 2),
                      child: buildBottomBar(context, constraints),
                    ),
                ],
              ),
            ),
          );
        });
      }),
    );
  }
}
