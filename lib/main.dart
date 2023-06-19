import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:app_finance/customTextTheme.dart';
import 'package:app_finance/routes.dart' as routes;
import 'package:app_finance/routes/homePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'terCAD: Finance',
      debugShowCheckedModeBanner: false,
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
