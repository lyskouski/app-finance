// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/custom_text_theme.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/routes.dart' as routes;
import 'package:app_finance/routes/account_add_page.dart';
import 'package:app_finance/routes/account_view_page.dart';
import 'package:app_finance/routes/account_page.dart';
import 'package:app_finance/routes/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppData state = AppData();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        brightness: Brightness.light,
        textTheme: CustomTextTheme.textTheme(Theme.of(context).textTheme),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        textTheme: CustomTextTheme.textTheme(Theme.of(context).textTheme),
        useMaterial3: true,
      ),
      themeMode: ThemeMode.system,
      home: HomePage(state: state),
      initialRoute: routes.homeRoute,
      onGenerateRoute: (settings) {
        final regex = RegExp(r'\/uuid:([\w-]+)');
        final match = regex.firstMatch(settings.name!);
        if (match != null) {
          final uuid = match.group(1);
          return MaterialPageRoute(
            builder: (context) => AccountViewPage(state: state, uuid: uuid ?? '')
          );
        }
        return null;
      },
      routes: <String, WidgetBuilder>{
        routes.homeRoute: (context) => HomePage(state: state),
        routes.accountRoute: (context) => AccountPage(state: state),
        routes.accountAddRoute: (context) => AccountAddPage(state: state),
      },
    );
  }
}
