// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:material_ui/material_ui.dart';

class TagsChipsWidget extends StatelessWidget {
  final List<String> tags;

  const TagsChipsWidget({super.key, required this.tags});

  @override
  Widget build(BuildContext context) {
    if (tags.isEmpty) {
      return ThemeHelper.emptyBox;
    }
    final indent = ThemeHelper.getIndent(0.5);
    final nav = Navigator.of(context);
    return Padding(
      padding: EdgeInsets.all(indent * 2),
      child: Align(
        alignment: AppDesign.isRightToLeft() ? Alignment.centerRight : Alignment.centerLeft,
        child: Wrap(
          spacing: indent,
          runSpacing: indent,
          children: [
            for (final tag in tags)
              ActionChip(
                avatar: const Icon(Icons.sell_outlined, size: 16),
                label: Text(tag),
                tooltip: AppLocale.labels.tagsHeadline,
                visualDensity: VisualDensity.compact,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                onPressed: () => nav.pushNamed(AppRoute.tagsRoute, arguments: {routeArguments.search: tag}),
              ),
          ],
        ),
      ),
    );
  }
}
