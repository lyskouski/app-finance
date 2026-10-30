// Copyright 2026 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/_ext/date_time_ext.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:app_finance/pages/manager/widgets/log_entry.dart';
import 'package:flutter/material.dart';

class LogEntryWidget extends StatelessWidget {
  final LogEntry entry;
  final int position;
  final VoidCallback onToggle;
  final VoidCallback onDelete;

  const LogEntryWidget({
    super.key,
    required this.entry,
    required this.position,
    required this.onToggle,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;
    return Padding(
      padding: EdgeInsets.symmetric(vertical: ThemeHelper.getIndent(0.5)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              ReorderableDragStartListener(
                index: position,
                child: Padding(
                  padding: EdgeInsets.all(ThemeHelper.getIndent()),
                  child: const Icon(Icons.drag_handle),
                ),
              ),
              IconButton(
                tooltip: entry.isExpanded ? AppLocale.labels.collapse : AppLocale.labels.expand,
                icon: Icon(entry.isExpanded ? Icons.expand_less : Icons.expand_more),
                onPressed: onToggle,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextWrapper(entry.type, style: textTheme.bodyLarge),
                    TextWrapper(entry.date?.dateTime() ?? '?', style: textTheme.bodySmall),
                  ],
                ),
              ),
              IconButton(
                tooltip: AppLocale.labels.deleteTooltip,
                icon: const Icon(Icons.delete_outline),
                onPressed: onDelete,
              ),
            ],
          ),
          if (entry.isExpanded)
            Container(
              padding: EdgeInsets.all(ThemeHelper.getIndent()),
              color: context.colorScheme.surfaceContainerHighest,
              child: SelectableText(
                entry.formatted,
                style: textTheme.bodySmall?.copyWith(fontFamily: 'monospace'),
              ),
            ),
        ],
      ),
    );
  }
}
