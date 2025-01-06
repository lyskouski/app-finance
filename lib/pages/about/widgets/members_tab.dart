// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_mixins/launcher_mixin.dart';
import 'package:app_finance/design/button/full_sized_button_widget.dart';
import 'package:app_finance/pages/about/widgets/member_widget.dart';
import 'package:flutter/material.dart';

class MembersTab extends StatelessWidget with LauncherMixin {
  static late final members = [
    (name: 'Viachaslau Lyskouski', badge: [AppLocale.labels.coAuthor]),
    (name: 'Iryna Shepetovetska', badge: [AppLocale.labels.coTranslator]),
    (name: 'Raj Jani', badge: [AppLocale.labels.coPromoter]),
    (name: 'Filip Zatloukal', badge: [AppLocale.labels.coPromoter]),
    (name: 'Aman Raj Singh Mourya', badge: [AppLocale.labels.coDeveloper]),
    (name: 'Ivan Alessandro Sala', badge: [AppLocale.labels.coPromoter]),
    (name: 'Carolina Murazik', badge: [AppLocale.labels.coPromoter]),
    (name: 'Zbymal', badge: [AppLocale.labels.coPromoter]),
    (name: 'Hazem', badge: [AppLocale.labels.coPromoter]),
    (name: 'Andrei Tarasevich', badge: [AppLocale.labels.coConsult]),
    (name: 'Halina Gulevich', badge: [AppLocale.labels.coConsult]),
    (name: 'Muhammadyusuf Kurbonov', badge: [AppLocale.labels.coDeveloper]),
    (name: 'Edivaldo Brito', badge: [AppLocale.labels.coPromoter]),
    (name: 'Jardeson Márcio', badge: [AppLocale.labels.coPromoter]),
    (name: 'Paul', badge: [AppLocale.labels.coPromoter]),
    (name: 'Alexey Alter-Pesotskiy', badge: [AppLocale.labels.coPromoter]),
  ];

  const MembersTab({super.key});

  @override
  Widget build(BuildContext context) {
    final indent = ThemeHelper.getIndent();
    final crossAxisCount = ThemeHelper.getWidthCount(null, context);
    final width = ThemeHelper.getWidth(context) / (64 * crossAxisCount);
    return Padding(
      padding: EdgeInsets.fromLTRB(indent, indent * 4, indent, indent),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: indent,
          mainAxisSpacing: indent,
          childAspectRatio: width,
        ),
        shrinkWrap: true,
        itemCount: members.length + 1,
        itemBuilder: (BuildContext context, int index) => index == 0
            ? Padding(
                padding: EdgeInsets.only(right: indent, top: indent),
                child: FullSizedButtonWidget(
                  onPressed: () => openURL('https://github.com/lyskouski/app-finance/blob/main/CONTRIBUTING.md'),
                  title: AppLocale.labels.coNew,
                  icon: Icons.add,
                ),
              )
            : MemberWidget(members[index - 1]),
      ),
    );
  }
}
