import 'package:budget/pages/home_page.dart';
import 'package:budget/pages/statistics_page.dart';
import 'package:budget/theme.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: lightMode,
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/statistics': (context) => const StatisticsPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
