// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be
// found in the LICENSE file.

import 'package:app_finance/custom_text_theme.dart';
import 'package:app_finance/data.dart';
import 'package:app_finance/_classes/app_route.dart';
import 'package:app_finance/firebase_options.dart';
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
import 'package:app_finance/routes/currency_page.dart';
import 'package:app_finance/routes/goal_add_page.dart';
import 'package:app_finance/routes/goal_edit_page.dart';
import 'package:app_finance/routes/goal_page.dart';
import 'package:app_finance/routes/goal_view_page.dart';
import 'package:app_finance/routes/home_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final platform = DefaultFirebaseOptions.currentPlatform;
  if (platform != null) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseAnalytics.instance.logAppOpen();
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseAnalytics.instance.logSelectContent(
          contentType: error.toString(), itemId: 'platform-error');
      return true;
    };
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      FirebaseAnalytics.instance.logSelectContent(
          contentType: details.toString(), itemId: 'flutter-error');
    };
  }
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
    if (DefaultFirebaseOptions.currentPlatform != null) {
      FirebaseAnalytics.instance.logSelectContent(
          contentType: route, itemId: match != null ? 'dynamic' : 'static');
    }
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
        case AppRoute.goalViewRoute:
          return MaterialPageRoute(
              builder: (context) => GoalViewPage(uuid: uuid));
        case AppRoute.goalEditRoute:
          return MaterialPageRoute(
              builder: (context) => GoalEditPage(uuid: uuid));
      }
    } else {
      final staticRoutes = <String, WidgetBuilder>{
        AppRoute.homeRoute: (context) => HomePage(),
        AppRoute.accountRoute: (context) => AccountPage(),
        AppRoute.accountAddRoute: (context) => AccountAddPage(),
        AppRoute.budgetRoute: (context) => BudgetPage(),
        AppRoute.budgetAddRoute: (context) => BudgetAddPage(),
        AppRoute.billRoute: (context) => BillPage(),
        AppRoute.billAddRoute: (context) => BillAddPage(),
        AppRoute.currencyRoute: (context) => CurrencyPage(),
        AppRoute.goalRoute: (context) => GoalPage(),
        AppRoute.goalAddRoute: (context) => GoalAddPage(),
      };
      return MaterialPageRoute(
        builder: staticRoutes[route] ?? (context) => HomePage(),
      );
    }
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
    );
  }
}
