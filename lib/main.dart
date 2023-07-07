// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/custom_text_theme.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/_classes/app_route.dart';
import 'package:app_finance/routes/account_add_page.dart';
import 'package:app_finance/routes/account_edit_page.dart';
import 'package:app_finance/routes/account_view_page.dart';
import 'package:app_finance/routes/account_page.dart';
import 'package:app_finance/routes/bill_add_page.dart';
import 'package:app_finance/routes/bill_edit_page.dart';
import 'package:app_finance/routes/bill_page.dart';
import 'package:app_finance/routes/bill_view_page.dart';
import 'package:app_finance/routes/budget_page.dart';
import 'package:app_finance/routes/budget_add_page.dart';
import 'package:app_finance/routes/budget_edit_page.dart';
import 'package:app_finance/routes/budget_view_page.dart';
import 'package:app_finance/routes/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppData(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  MaterialPageRoute? getDynamicRouter(settings) {
    final String route = settings.name!;
    final regex = RegExp(r'\/uuid:([\w-]+)');
    final match = regex.firstMatch(route);
    if (match != null) {
      final String uuid = match.group(1) ?? '';
      switch (route.replaceAll(uuid, '')) {
        case AppRoute.accountViewRoute:
          return MaterialPageRoute(
              builder: (context) => AccountViewPage(uuid: uuid));
        case AppRoute.accountEditRoute:
          return MaterialPageRoute(
              builder: (context) => AccountEditPage(uuid: uuid));
        case AppRoute.budgetViewRoute:
          return MaterialPageRoute(
              builder: (context) => BudgetViewPage(uuid: uuid));
        case AppRoute.budgetEditRoute:
          return MaterialPageRoute(
              builder: (context) => BudgetEditPage(uuid: uuid));
        case AppRoute.billViewRoute:
          return MaterialPageRoute(
              builder: (context) => BillViewPage(uuid: uuid));
        case AppRoute.billEditRoute:
          return MaterialPageRoute(
              builder: (context) => BillEditPage(uuid: uuid));
      }
    }
    return null;
  }

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
      home: HomePage(),
      initialRoute: AppRoute.homeRoute,
      onGenerateRoute: getDynamicRouter,
      routes: <String, WidgetBuilder>{
        AppRoute.homeRoute: (context) => HomePage(),
        AppRoute.accountRoute: (context) => AccountPage(),
        AppRoute.accountAddRoute: (context) => AccountAddPage(),
        AppRoute.budgetRoute: (context) => BudgetPage(),
        AppRoute.budgetAddRoute: (context) => BudgetAddPage(),
        AppRoute.billRoute: (context) => BillPage(),
        AppRoute.billAddRoute: (context) => BillAddPage(),
      },
    );
  }
}
