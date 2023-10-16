// Copyright 2023 The terCAD team. All rights reserved.
// Use of this source code is governed by a CC BY-NC-ND 4.0 license that can be found in the LICENSE file.

import 'package:app_finance/_classes/herald/app_locale.dart';
import 'package:app_finance/_classes/herald/app_palette.dart';
import 'package:app_finance/_classes/herald/app_purchase.dart';
import 'package:app_finance/_classes/herald/app_sync.dart';
import 'package:app_finance/_classes/herald/app_theme.dart';
import 'package:app_finance/_classes/herald/app_zoom.dart';
import 'package:app_finance/_classes/storage/app_preferences.dart';
import 'package:app_finance/_classes/structure/navigation/app_page_route.dart';
import 'package:app_finance/_configs/custom_color_scheme.dart';
import 'package:app_finance/_configs/custom_text_theme.dart';
import 'package:app_finance/_classes/storage/app_data.dart';
import 'package:app_finance/_classes/structure/navigation/app_route.dart';
import 'package:app_finance/_configs/firebase_options.dart';
import 'package:app_finance/pages/about_page.dart';
import 'package:app_finance/pages/account/account_add_page.dart';
import 'package:app_finance/pages/account/account_edit_page.dart';
import 'package:app_finance/pages/account/account_view_page.dart';
import 'package:app_finance/pages/account/account_page.dart';
import 'package:app_finance/pages/automation/automation_page.dart';
import 'package:app_finance/pages/bill/bill_add_page.dart';
import 'package:app_finance/pages/bill/bill_edit_page.dart';
import 'package:app_finance/pages/bill/bill_page.dart';
import 'package:app_finance/pages/bill/bill_view_page.dart';
import 'package:app_finance/pages/budget/budget_page.dart';
import 'package:app_finance/pages/budget/budget_add_page.dart';
import 'package:app_finance/pages/budget/budget_edit_page.dart';
import 'package:app_finance/pages/budget/budget_view_page.dart';
import 'package:app_finance/pages/currency_page.dart';
import 'package:app_finance/pages/goal/goal_add_page.dart';
import 'package:app_finance/pages/goal/goal_edit_page.dart';
import 'package:app_finance/pages/goal/goal_page.dart';
import 'package:app_finance/pages/goal/goal_view_page.dart';
import 'package:app_finance/pages/home/home_page.dart';
import 'package:app_finance/pages/metrics/metrics_page.dart';
import 'package:app_finance/pages/settings/settings_page.dart';
import 'package:app_finance/pages/start/start_page.dart';
import 'package:app_finance/pages/subscription/subscription_page.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final platform = DefaultFirebaseOptions.currentPlatform;
  if (platform != null) {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
    FirebaseAnalytics.instance.logAppOpen();
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseAnalytics.instance.logSelectContent(contentType: error.toString(), itemId: 'platform-error');
      return true;
    };
    FlutterError.onError = (details) {
      FlutterError.presentError(details);
      FirebaseAnalytics.instance.logSelectContent(contentType: details.toString(), itemId: 'flutter-error');
    };
  }
  AppPreferences.pref = await SharedPreferences.getInstance();
  final appSync = AppSync();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider<AppSync>(
          create: (_) => appSync,
        ),
        ChangeNotifierProvider<AppData>(
          create: (_) => AppData(appSync),
        ),
        ChangeNotifierProvider<AppTheme>(
          create: (_) => AppTheme(ThemeMode.system),
        ),
        ChangeNotifierProvider<AppLocale>(
          create: (_) => AppLocale(),
        ),
        ChangeNotifierProvider<AppZoom>(
          create: (_) => AppZoom(),
        ),
        ChangeNotifierProvider<AppPalette>(
          create: (_) => AppPalette(),
        ),
        ChangeNotifierProvider<AppPurchase>(
          create: (_) => AppPurchase(),
        ),
      ],
      child: MyApp(platform: platform),
    ),
  );
}

class MyApp extends StatefulWidget {
  final FirebaseOptions? platform;
  const MyApp({super.key, this.platform});

  @override
  MyAppState createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  String route = AppRoute.homeRoute;

  WidgetBuilder? getPage(String route, Object? arguments) {
    if (widget.platform != null) {
      FirebaseAnalytics.instance.logSelectContent(
        contentType: route,
        itemId: arguments != null ? 'dynamic' : 'static',
      );
    }
    final args = arguments as Map<String, String>?;
    final String key = args?['uuid'] ?? args?['search'] ?? '';

    final routes = <String, WidgetBuilder>{
      AppRoute.accountViewRoute: (context) => AccountViewPage(uuid: key),
      AppRoute.accountSearchRoute: (context) => AccountPage(search: key),
      AppRoute.accountEditRoute: (context) => AccountEditPage(uuid: key),
      AppRoute.budgetViewRoute: (context) => BudgetViewPage(uuid: key),
      AppRoute.budgetEditRoute: (context) => BudgetEditPage(uuid: key),
      AppRoute.budgetSearchRoute: (context) => BudgetPage(search: key),
      AppRoute.billViewRoute: (context) => BillViewPage(uuid: key),
      AppRoute.billEditRoute: (context) => BillEditPage(uuid: key),
      AppRoute.goalViewRoute: (context) => GoalViewPage(uuid: key),
      AppRoute.goalEditRoute: (context) => GoalEditPage(uuid: key),
      AppRoute.metricsSearchRoute: (context) => MetricsPage(search: key),
      AppRoute.aboutRoute: (context) => const AboutPage(),
      AppRoute.accountAddRoute: (context) => const AccountAddPage(),
      AppRoute.accountRoute: (context) => const AccountPage(),
      AppRoute.automationRoute: (context) => const AutomationPage(),
      AppRoute.billAddRoute: (context) => const BillAddPage(),
      AppRoute.billRoute: (context) => const BillPage(),
      AppRoute.budgetAddRoute: (context) => const BudgetAddPage(),
      AppRoute.budgetRoute: (context) => const BudgetPage(),
      AppRoute.currencyRoute: (context) => const CurrencyPage(),
      AppRoute.goalAddRoute: (context) => const GoalAddPage(),
      AppRoute.goalRoute: (context) => const GoalPage(),
      AppRoute.homeRoute: (context) => const HomePage(),
      AppRoute.metricsRoute: (context) => const MetricsPage(),
      AppRoute.settingsRoute: (context) => const SettingsPage(),
      AppRoute.startRoute: (context) => const StartPage(),
      AppRoute.subscriptionRoute: (context) => const SubscriptionPage(),
    };
    return routes[route] ?? (context) => const HomePage();
  }

  @override
  Widget build(BuildContext context) {
    final palette = context.watch<AppPalette>().value;
    final text = Theme.of(context).textTheme.withCustom(palette, Brightness.light);
    final textDark = Theme.of(context).textTheme.withCustom(palette, Brightness.dark);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      locale: context.watch<AppLocale>().value,
      theme: ThemeData(
        colorScheme: const ColorScheme.light().withCustom(palette),
        floatingActionButtonTheme: const FloatingActionButtonThemeData().withCustom(palette, Brightness.light),
        brightness: Brightness.light,
        textTheme: text,
        datePickerTheme: DatePickerTheme.of(context).withCustom(palette, text, Brightness.light),
        timePickerTheme: TimePickerTheme.of(context).withCustom(palette, text, Brightness.light),
        dividerTheme: CustomDividerTheme(palette, Brightness.light),
        useMaterial3: true,
      ),
      darkTheme: ThemeData(
        colorScheme: const ColorScheme.dark().withCustom(palette),
        floatingActionButtonTheme: const FloatingActionButtonThemeData().withCustom(palette, Brightness.dark),
        brightness: Brightness.dark,
        textTheme: textDark,
        datePickerTheme: DatePickerTheme.of(context).withCustom(palette, textDark, Brightness.dark),
        timePickerTheme: TimePickerTheme.of(context).withCustom(palette, textDark, Brightness.dark),
        dividerTheme: CustomDividerTheme(palette, Brightness.dark),
        useMaterial3: true,
      ),
      themeMode: context.watch<AppTheme>().value,
      home: const HomePage(),
      onGenerateRoute: (settings) => AppPageRoute(builder: getPage(settings.name ?? '', settings.arguments)!),
    );
  }
}
