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
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

abstract class AbstractPageState<T extends StatefulWidget> extends State<T> {
  static final drawerKey = GlobalKey();
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
      child: IconButton(
        hoverColor: Colors.transparent,
        tooltip: AppLocale.labels.backTooltip,
        onPressed: () => nav.pop(),
        icon: const Icon(
          Icons.arrow_back,
          color: Colors.white70,
        ),
      ),
    );
  }

  Widget buildHelper(BuildContext context) {
    final locale = AppLocale.labels.localeName;
    final type = getHelperName();
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
              builder: (context, snapshot) {
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
          child: IconButton(
            hoverColor: Colors.transparent,
            tooltip: AppLocale.labels.helpTooltip,
            onPressed: () => showModalBottomSheet(
              context: context,
              backgroundColor: context.colorScheme.background,
              builder: buildHelper,
            ),
            icon: Icon(
              Icons.contact_support_outlined,
              color: Colors.white70,
              semanticLabel: AppLocale.labels.helpTooltip,
            ),
          ),
        ),
      if (!isWide)
        Builder(
          builder: (context) => ToolbarButtonWidget(
            child: IconButton(
              hoverColor: Colors.transparent,
              icon: const Icon(
                Icons.menu,
                color: Colors.white70,
              ),
              tooltip: AppLocale.labels.navigationTooltip,
              onPressed: () => Scaffold.of(context).openDrawer(),
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
    final titleWidth = ThemeHelper.getWidth(context, 0, constraints, false) / 2 - 100;
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
                      theme.textTheme.bodySmall!.copyWith(color: theme.colorScheme.onInverseSurface.withOpacity(0.6)),
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
    final indent = ThemeHelper.getIndent();
    final isWide = ScreenHelper.state().isWide;
    final list = ListView.separated(
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
    );
    return isWide ? list : FocusScope(child: list);
  }

  Drawer? buildDrawer() {
    final ColorScheme colorScheme = context.colorScheme;
    return Drawer(
      key: drawerKey,
      elevation: 0,
      shape: Border.all(width: 0),
      child: ScreenHelper.state().isWide
          ? buildNavigation()
          : InputControllerWrapper(
              child: Container(
                color: colorScheme.background,
                child: buildNavigation(),
              ),
            ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height;
    final scale = context.watch<AppZoom>().value;
    return Flex(direction: Axis.vertical, children: [
      Expanded(
        child: Consumer<AppData>(builder: (context, appState, _) {
          state = appState;
          return LayoutBuilder(builder: (context, constraints) {
            final display = ScreenHelper.getInstance(context, constraints);
            final hasShift = display.isBottom && !display.isWearable && !display.isRight;
            final blockHeight = height / scale - (hasShift ? ThemeHelper.barHeight + ThemeHelper.getIndent() : 0);
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
            final dx = (constraints.maxWidth - constraints.maxWidth / scale) / 2;
            final dy = (constraints.maxHeight - constraints.maxHeight / scale) / 2;
            return Scaffold(
              appBar: display.isBottom ? null : buildBar(context, constraints),
              drawer: buildDrawer(),
              floatingActionButtonLocation: hasShift ? FloatingActionButtonLocation.centerDocked : null,
              floatingActionButton: buildButton(context, constraints),
              resizeToAvoidBottomInset: true,
              body: SafeArea(
                child: InputControllerWrapper(
                  child: Stack(
                    children: [
                      if (leftBar != null)
                        Container(
                          color: context.colorScheme.inversePrimary.withOpacity(0.2),
                          width: ThemeHelper.menuWidth,
                          height: double.infinity,
                          child: buildNavigation(),
                        ),
                      Container(
                        margin: leftBar != null ? const EdgeInsets.only(left: ThemeHelper.menuWidth) : EdgeInsets.zero,
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
                      if (rightBar != null) rightBar,
                      if (rightBar == null && display.isBottom)
                        Container(
                          margin: EdgeInsets.only(top: height - ThemeHelper.barHeight),
                          child: buildBottomBar(context, constraints),
                        ),
                    ],
                  ),
                ),
              ),
            );
          });
        }),
      ),
    ]);
  }
}
