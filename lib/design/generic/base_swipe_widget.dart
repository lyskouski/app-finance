// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/controller/flow_state_machine.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swipe_action_cell/core/cell.dart';
import 'package:provider/provider.dart';

class BaseSwipeWidget extends StatelessWidget {
  final String uuid;
  final String? routePath;
  final Widget child;
  final double height;

  const BaseSwipeWidget({
    super.key,
    required this.child,
    required this.uuid,
    required this.routePath,
    this.height = 35,
  });

  Widget _getIcon(IconData icon, Color bgColor, Color color, String tooltip) {
    final indent = ThemeHelper.getIndent(0.5);
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Tooltip(
        message: tooltip,
        child: Container(
          padding: EdgeInsets.fromLTRB(1.5 * indent, indent, 1.5 * indent, indent),
          height: height,
          decoration: BoxDecoration(color: bgColor, borderRadius: BorderRadius.circular(25)),
          child: Icon(icon, color: color),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (routePath == null || routePath == '') {
      return child;
    }
    NavigatorState nav = Navigator.of(context);
    return Consumer<AppData>(builder: (context, appState, _) {
      return Visibility(
        visible: !appState.getByUuid(uuid)?.hidden,
        child: SwipeActionCell(
          key: ValueKey(key),
          backgroundColor: Colors.transparent,
          trailingActions: [
            SwipeAction(
              nestedAction: SwipeNestedAction(
                content: MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: Container(
                    height: height,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.red,
                    ),
                    child: OverflowBox(
                      maxWidth: double.infinity,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(Icons.delete, color: Colors.white),
                          TextWrapper(AppLocale.labels.deleteTooltip, style: const TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              color: Colors.transparent,
              closeOnTap: true,
              onTap: (_) => FlowStateMachine.deactivate(null, uuid: uuid, store: appState),
              content: _getIcon(Icons.delete, Colors.red, Colors.white, AppLocale.labels.deleteTooltip),
            ),
            SwipeAction(
              color: Colors.transparent,
              closeOnTap: true,
              onTap: (_) => nav.pushNamed(routePath!, arguments: {routeArguments.uuid: uuid}),
              content: _getIcon(Icons.edit, Colors.grey, Colors.white, AppLocale.labels.editTooltip),
            ),
          ],
          child: child,
        ),
      );
    });
  }
}
