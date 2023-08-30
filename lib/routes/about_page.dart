// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_configs/theme_helper.dart';
import 'package:app_finance/_mixins/launcher_mixin.dart';
import 'package:app_finance/routes/abstract_page.dart';
import 'package:app_finance/widgets/_wrappers/row_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AboutPage extends AbstractPage {
  AboutPage() : super();

  @override
  AboutPageState createState() => AboutPageState();
}

class AboutPageState extends AbstractPageState<AboutPage> with LauncherMixin {
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
  String getTitle() {
    return AppLocale.labels.aboutHeadline;
  }

  @override
  Widget buildButton(BuildContext context, BoxConstraints constraints) {
    return ThemeHelper.emptyBox;
  }

  @override
  Widget buildContent(BuildContext context, BoxConstraints constraints) {
    double indent = ThemeHelper.getIndent();
    double width = ThemeHelper.getWidth(context);
    final locale = AppLocale.labels.localeName;
    return Padding(
      padding: EdgeInsets.fromLTRB(indent, indent, indent, 0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Image.asset(
                'assets/images/logo.png',
                width: 60,
                height: 60,
              ),
              Text(
                AppLocale.labels.appTitle,
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              Column(
                children: [
                  Text(AppLocale.labels.appVersion(version)),
                  Text(AppLocale.labels.appBuild(buildNumber)),
                ],
              ),
            ],
          ),
          const Divider(),
          RowWidget(
            indent: indent,
            maxWidth: width,
            alignment: MainAxisAlignment.spaceEvenly,
            chunk: const [null, null, null],
            children: [
              [
                ElevatedButton(
                  onPressed: () => openURL('https://github.com/lyskouski/app-finance/releases'),
                  child: Text(AppLocale.labels.releases, overflow: TextOverflow.ellipsis),
                ),
              ],
              [
                ElevatedButton(
                  onPressed: () => openURL('https://github.com/users/lyskouski/projects/2/views/1'),
                  child: Text(AppLocale.labels.roadmap, overflow: TextOverflow.ellipsis),
                ),
              ],
              [
                ElevatedButton(
                  onPressed: () => openURL('https://github.com/lyskouski/app-finance/milestones'),
                  child: Text(AppLocale.labels.milestones, overflow: TextOverflow.ellipsis),
                ),
              ],
            ],
          ),
          const Divider(),
          Expanded(
            child: FutureBuilder(
              future: DefaultAssetBundle.of(context).loadString('./assets/l10n/privacy_policy_$locale.md'),
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
}
