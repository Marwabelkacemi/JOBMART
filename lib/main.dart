import 'package:flutter/material.dart';
import 'package:jobmart/routes.dart';
import 'package:jobmart/theme/app_theme.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.light;

  void toggleTheme(bool isDark) {
    setState(() {
      _themeMode = isDark ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //home: const Introduction1Screen(),
      title: 'JobMart',
      theme: AppTheme.light(),
      darkTheme: AppTheme.dark(),
      themeMode: _themeMode,
      initialRoute: AppRoutes.intro1, // Doit pointer vers '/intro1'
  routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}