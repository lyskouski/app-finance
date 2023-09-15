// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_mixins/launcher_mixin.dart';
import 'package:app_finance/widgets/wrapper/elevate_button_widget.dart';
import 'package:flutter/material.dart';

class OtherWidget extends StatelessWidget with LauncherMixin {
  const OtherWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(children: [
        ThemeHelper.hIndent,
        ElevatedButtonWidget(
          onPressed: () => openURL('https://www.buymeacoffee.com/lyskouski'),
          text: AppLocale.labels.subscriptionCoffee,
          icon: Icons.coffee,
        ),
        ThemeHelper.hIndent2x,
        ElevatedButtonWidget(
          onPressed: () => openURL('https://paypal.me/terCAD'),
          text: AppLocale.labels.subscriptionPaypal,
          icon: Icons.coffee_maker,
        ),
        ThemeHelper.hIndent2x,
        ElevatedButtonWidget(
          onPressed: () => openURL('https://donorbox.org/tercad'),
          text: AppLocale.labels.subscriptionDonorbox,
          icon: Icons.support,
        ),
        ThemeHelper.hIndent2x,
        ElevatedButtonWidget(
          onPressed: () => openURL('https://patreon.com/terCAD'),
          text: AppLocale.labels.subscriptionPatreon,
          icon: Icons.pattern,
        ),
        ThemeHelper.hIndent2x,
        ElevatedButtonWidget(
          onPressed: () => openURL('https://github.com/sponsors/lyskouski'),
          text: AppLocale.labels.subscriptionGithub,
          icon: Icons.gite,
        ),
      ]),
    );
  }
}
