// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_design.dart';
import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_ext/build_context_ext.dart';
import 'package:app_finance/design/wrapper/text_wrapper.dart';
import 'package:flutter/material.dart';

typedef MemberData = ({
  String name,
  List<String> badge,
});

class MemberWidget extends StatelessWidget {
  static final colors = {
    AppLocale.labels.coAuthor: Colors.amber.withOpacity(0.2),
    AppLocale.labels.coDeveloper: Colors.indigo.withOpacity(0.2),
    AppLocale.labels.coTranslator: Colors.pink.withOpacity(0.2),
    AppLocale.labels.coPromoter: Colors.purple.withOpacity(0.2),
    AppLocale.labels.coConsult: Colors.cyan.withOpacity(0.2),
  };

  final MemberData member;

  const MemberWidget(this.member, {super.key});

  @override
  Widget build(BuildContext context) {
    final indent = ThemeHelper.getIndent();
    final border = BorderSide(width: 1, color: context.colorScheme.primary.withOpacity(0.1));
    return Container(
      padding: EdgeInsets.all(indent),
      margin: EdgeInsets.only(top: indent, right: indent),
      decoration: BoxDecoration(
        border: Border(top: border, bottom: border, left: border, right: border),
        color: context.colorScheme.background,
        boxShadow: [
          BoxShadow(
            color: context.colorScheme.secondary.withOpacity(0.08),
            spreadRadius: 1,
            blurRadius: 2,
            offset: const Offset(2, 2),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: AppDesign.getAlignment<MainAxisAlignment>(),
        crossAxisAlignment: AppDesign.getAlignment(),
        children: [
          TextWrapper(member.name, style: context.textTheme.bodyMedium),
          Expanded(
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: member.badge.length,
              itemBuilder: (BuildContext context, int i) => Container(
                margin: EdgeInsets.only(right: indent),
                padding: EdgeInsets.symmetric(horizontal: indent / 2),
                decoration: BoxDecoration(
                  border: Border(top: border, bottom: border, left: border, right: border),
                  borderRadius: BorderRadius.all(Radius.circular(indent)),
                  color: colors[member.badge[i]],
                ),
                child: TextWrapper(member.badge[i], style: context.textTheme.numberSmall),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
