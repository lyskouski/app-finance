// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class PrivacyTab extends StatefulWidget {
  final Function()? setState;

  const PrivacyTab({
    super.key,
    required this.setState,
  });

  @override
  PrivacyTabState createState() => PrivacyTabState();
}

class PrivacyTabState extends State<PrivacyTab> {
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    final helper = ThemeHelper(windowType: getWindowType(context));
    String title = AppLocalizations.of(context)!.acknowledgeTooltip;
    return SizedBox(
      width: constraints.maxWidth - helper.getIndent() * 4,
      child: FloatingActionButton(
        onPressed: widget.setState,
        tooltip: title,
        child: Align(
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.exit_to_app_rounded),
              SizedBox(height: helper.getIndent()),
              Text(title, style: Theme.of(context).textTheme.headlineMedium)
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final locale = AppLocalizations.of(context)!.localeName;
    double indent =
        ThemeHelper(windowType: getWindowType(context)).getIndent() * 2;
    return LayoutBuilder(builder: (context, constraints) {
      return Scaffold(
        floatingActionButton: buildButton(context, constraints),
        body: Container(
          margin: EdgeInsets.fromLTRB(indent, indent, indent, 90),
          child: Expanded(
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context)
                  .loadString('./assets/l10n/privacy_policy_$locale.md'),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return Markdown(data: snapshot.data ?? '');
                }
                return Container();
              },
            ),
          ),
        ),
      );
    });
  }
}
