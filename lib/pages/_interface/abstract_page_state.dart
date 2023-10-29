// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_zoom.dart';
import 'package:app_finance/_classes/structure/navigation/app_menu.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_configs/display_helper.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/pages/_interface/widgets/menu_widget.dart';
import 'package:app_finance/widgets/wrapper/input_controller_wrapper.dart';
import 'package:app_finance/widgets/wrapper/row_widget.dart';
import 'package:app_finance/widgets/wrapper/text_wrapper.dart';
import 'package:app_finance/widgets/button/toolbar_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:provider/provider.dart';

abstract class AbstractPageState<T extends StatefulWidget> extends State<T> {
  static const barHeight = 40.0;
  static const menuWidth = 200.0;
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
    return [
      if (getHelperName() != null)
        ToolbarButtonWidget(
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
    final isWide = ThemeHelper.isWideScreen(constraints);
    return AppBar(
      title: Center(child: getBarTitle(context)),
      toolbarHeight: barHeight,
      shape: isWide
          ? UnderlineInputBorder(
              borderSide: BorderSide(color: context.colorScheme.primary),
              borderRadius: BorderRadius.zero,
            )
          : null,
      backgroundColor: isWide ? context.colorScheme.inverseSurface.withOpacity(0.4) : context.colorScheme.primary,
      leading: getBarLeading(nav),
      actions: getBarActions(nav),
    );
  }

  Widget? buildRightBar(BuildContext context, BoxConstraints constraints) {
    final nav = Navigator.of(context);
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        color: context.colorScheme.primary,
        width: barHeight,
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

  BottomAppBar? buildBottomBar(BuildContext context, BoxConstraints constraints) {
    if (ThemeHelper.isNavRight(context, constraints)) {
      return null;
    }
    final theme = Theme.of(context);
    final nav = Navigator.of(context);
    final actions = getBarActions(nav);
    final btnWidth = 50.0 * actions.length;
    final titleWidth = ThemeHelper.getWidth(context, 0, constraints, false) / 2 - 100;
    final hasTooltip = getButtonName().isNotEmpty;
    final showTooltip = hasTooltip && (constraints.maxWidth - titleWidth - btnWidth - 50 > 125);

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

  Widget buildNavigation() {
    double indent = ThemeHelper.getIndent();
    return FocusScope(
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
    );
  }

  Drawer? buildDrawer() {
    final ColorScheme colorScheme = context.colorScheme;
    return Drawer(
      key: drawerKey,
      elevation: 0,
      shape: Border.all(width: 0),
      child: InputControllerWrapper(
        child: Container(
          color: colorScheme.background,
          child: buildNavigation(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scale = context.watch<AppZoom>().value;
    return Consumer<AppData>(builder: (context, appState, _) {
      state = appState;
      return LayoutBuilder(builder: (context, constraints) {
        final display = DisplayHelper.getInstance(context, constraints);
        final hasShift = display.isBottom && !display.isWearable && !display.isRight;
        final height = constraints.maxHeight / scale - (hasShift ? barHeight + ThemeHelper.getIndent() : 0);
        double width = constraints.maxWidth / scale;
        Widget? rightBar;
        if (display.isRight && !display.isWearable) {
          rightBar = buildRightBar(context, constraints);
          if (rightBar != null) {
            width -= barHeight;
          }
        } else if (display.isWide) {
          width -= menuWidth;
        }
        final dx = (constraints.maxWidth - constraints.maxWidth / scale) / 2;
        final dy = (constraints.maxHeight - constraints.maxHeight / scale) / 2;
        return Scaffold(
          appBar: display.isBottom ? null : buildBar(context, constraints),
          bottomNavigationBar: display.isBottom ? buildBottomBar(context, constraints) : null,
          drawer: buildDrawer(),
          floatingActionButtonLocation: hasShift ? FloatingActionButtonLocation.centerDocked : null,
          floatingActionButton: buildButton(context, constraints),
          resizeToAvoidBottomInset: true,
          body: SafeArea(
            child: InputControllerWrapper(
              child: Stack(
                children: [
                  if (display.isWide)
                    Container(
                      color: context.colorScheme.inversePrimary.withOpacity(0.2),
                      width: menuWidth,
                      height: double.infinity,
                      child: buildNavigation(),
                    ),
                  Container(
                    margin: display.isWide ? const EdgeInsets.only(left: menuWidth) : EdgeInsets.zero,
                    child: OverflowBox(
                      alignment: Alignment.topLeft,
                      minWidth: width,
                      maxWidth: width,
                      minHeight: height,
                      maxHeight: height,
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
                ],
              ),
            ),
          ),
        );
      });
    });
  }
}
