import 'package:flutter/material.dart';
import 'router/app_routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Streaming Profile',
      debugShowCheckedModeBanner: false,
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      initialRoute: AppRoutes.initialRoute,
      routes: AppRoutes.getAppRoutes(
        () => setState(() => isDarkMode = !isDarkMode),
      ),
    );
  }
}