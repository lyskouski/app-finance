// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/helpers/theme_helper.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutPage extends AbstractPage {
  AboutPage() : super();

  @override
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends AbstractPageState<AboutPage> {
  String version = '';
  String buildNumber = '';

  @override
  void initState() {
    PackageInfo.fromPlatform().then((PackageInfo value) {
      setState(() {
        version = value.version;
        buildNumber = value.buildNumber;
      });
    });
    super.initState();
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return const SizedBox();
  }

  Future<void> _launchURL(String path) async {
    final url = Uri.parse(path);
    await launchUrl(url, mode: LaunchMode.externalApplication);
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    var helper = ThemeHelper(windowType: getWindowType(context));
    double indent = helper.getIndent();
    double width = MediaQuery.of(context).size.width - indent * 4;
    final locale = AppLocalizations.of(context)!.localeName;
    return Padding(
      padding: EdgeInsets.fromLTRB(indent, indent, indent, 0),
      child: Column(
        children: [
          RowWidget(
            indent: indent,
            maxWidth: width,
            chunk: const [0.2, 0.8],
            children: [
              [
                Image.asset(
                  'assets/images/logo.png',
                  width: width * 0.2,
                  height: width * 0.2,
                ),
              ],
              [
                Text(
                  AppLocalizations.of(context)!.appTitle,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Text(AppLocalizations.of(context)!.appVersion(version)),
                Text(AppLocalizations.of(context)!.appBuild(buildNumber)),
                SizedBox(width: width * 0.8),
              ],
            ],
          ),
          const Divider(),
          RowWidget(
            indent: indent,
            maxWidth: width,
            chunk: const [0.3, 0.3, 0.4],
            children: [
              [
                ElevatedButton(
                  onPressed: () => _launchURL(
                      'https://github.com/lyskouski/app-finance/releases'),
                  child: Text(AppLocalizations.of(context)!.releases),
                ),
              ],
              [
                ElevatedButton(
                  onPressed: () => _launchURL(
                      'https://github.com/users/lyskouski/projects/2/views/1'),
                  child: Text(AppLocalizations.of(context)!.roadmap),
                ),
              ],
              [
                ElevatedButton(
                  onPressed: () => _launchURL(
                      'https://github.com/lyskouski/app-finance/milestones'),
                  child: Text(AppLocalizations.of(context)!.milestones),
                ),
              ],
            ],
          ),
          const Divider(),
          Expanded(
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
        ],
      ),
    );
  }

  @override
  String getTitle(BuildContext context) {
    return AppLocalizations.of(context)!.aboutHeadline;
  }
}
