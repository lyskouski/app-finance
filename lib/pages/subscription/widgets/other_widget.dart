// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_mixins/launcher_mixin.dart';
import 'package:app_finance/pages/_widgets/button/full_sized_button_widget.dart';
import 'package:flutter/material.dart';

class OtherWidget extends StatelessWidget with LauncherMixin {
  const OtherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(children: [
        ThemeHelper.hIndent,
        FullSizedButtonWidget(
          setState: () => openURL('https://www.buymeacoffee.com/lyskouski'),
          title: AppLocale.labels.subscriptionCoffee,
          icon: Icons.coffee,
        ),
        ThemeHelper.hIndent2x,
        FullSizedButtonWidget(
          setState: () => openURL('https://paypal.me/terCAD'),
          title: AppLocale.labels.subscriptionPaypal,
          icon: Icons.coffee_maker,
        ),
        ThemeHelper.hIndent2x,
        FullSizedButtonWidget(
          setState: () => openURL('https://donorbox.org/tercad'),
          title: AppLocale.labels.subscriptionDonorbox,
          icon: Icons.support,
        ),
        ThemeHelper.hIndent2x,
        FullSizedButtonWidget(
          setState: () => openURL('https://patreon.com/terCAD'),
          title: AppLocale.labels.subscriptionPatreon,
          icon: Icons.pattern,
        ),
        ThemeHelper.hIndent2x,
        FullSizedButtonWidget(
          setState: () => openURL('https://github.com/sponsors/lyskouski'),
          title: AppLocale.labels.subscriptionGithub,
          icon: Icons.gite,
        ),
        ThemeHelper.hIndent2x,
      ]),
    );
  }
}
