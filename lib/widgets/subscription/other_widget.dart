// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/widgets/_wrappers/elevate_button_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:url_launcher/url_launcher.dart';

class OtherWidget extends StatelessWidget {
  const OtherWidget({super.key});

  Future<void> _launchURL(String path) async {
    final url = Uri.parse(path);
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  @override
  Widget build(BuildContext context) {
    final helper = ThemeHelper(windowType: getWindowType(context));
    double indent = helper.getIndent() * 2;
    return Expanded(
      child: Column(children: [
        SizedBox(height: indent / 2),
        ElevatedButtonWidget(
          onPressed: () => _launchURL('https://www.buymeacoffee.com/lyskouski'),
          text: AppLocalizations.of(context)!.subscriptionCoffee,
          icon: Icons.coffee,
        ),
        SizedBox(height: indent),
        ElevatedButtonWidget(
          onPressed: () => _launchURL('https://paypal.me/terCAD'),
          text: AppLocalizations.of(context)!.subscriptionPaypal,
          icon: Icons.coffee_maker,
        ),
        SizedBox(height: indent),
        ElevatedButtonWidget(
          onPressed: () => _launchURL('https://donorbox.org/tercad'),
          text: AppLocalizations.of(context)!.subscriptionDonorbox,
          icon: Icons.support,
        ),
        SizedBox(height: indent),
        ElevatedButtonWidget(
          onPressed: () => _launchURL('https://patreon.com/terCAD'),
          text: AppLocalizations.of(context)!.subscriptionPatreon,
          icon: Icons.pattern,
        ),
      ]),
    );
  }
}
