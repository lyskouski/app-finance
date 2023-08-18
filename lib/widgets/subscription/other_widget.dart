// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/widgets/_wrappers/elevate_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class OtherWidget extends StatelessWidget {
  const OtherWidget({super.key});

  Future<void> _launchURL(String path) async {
    final url = Uri.parse(path);
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    double indent = ThemeHelper.getIndent(2);
    return Expanded(
      child: Column(children: [
        SizedBox(height: indent / 2),
        ElevatedButtonWidget(
          onPressed: () => _launchURL('https://www.buymeacoffee.com/lyskouski'),
          text: AppLocale.labels.subscriptionCoffee,
          icon: Icons.coffee,
        ),
        SizedBox(height: indent),
        ElevatedButtonWidget(
          onPressed: () => _launchURL('https://paypal.me/terCAD'),
          text: AppLocale.labels.subscriptionPaypal,
          icon: Icons.coffee_maker,
        ),
        SizedBox(height: indent),
        ElevatedButtonWidget(
          onPressed: () => _launchURL('https://donorbox.org/tercad'),
          text: AppLocale.labels.subscriptionDonorbox,
          icon: Icons.support,
        ),
        SizedBox(height: indent),
        ElevatedButtonWidget(
          onPressed: () => _launchURL('https://patreon.com/terCAD'),
          text: AppLocale.labels.subscriptionPatreon,
          icon: Icons.pattern,
        ),
        SizedBox(height: indent),
        ElevatedButtonWidget(
          onPressed: () => _launchURL('https://github.com/sponsors/lyskouski'),
          text: AppLocale.labels.subscriptionGithub,
          icon: Icons.gite,
        ),
      ]),
    );
  }
}
