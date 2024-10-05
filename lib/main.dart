import 'package:budget/pages/categories_page.dart';
import 'package:budget/pages/dashboard_page.dart';
import 'package:budget/pages/shopping_list_page.dart';
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
        '/': (context) => const DashboardPage(),
        '/statistics': (context) => const StatisticsPage(),
        'categories': (context) => CategoriesPage(),
        '/shopping_list': (context) => ShoppingListPage(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}
