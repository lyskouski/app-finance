// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/custom_text_theme.dart';
import 'package:app_finance/routes.dart' as routes;
import 'package:app_finance/routes/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
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
      home: const HomePage(),
      initialRoute: routes.homeRoute,
      routes: <String, WidgetBuilder>{
        routes.homeRoute: (context) => const HomePage(),
      },
    );
  }
}
