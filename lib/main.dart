import 'package:budget/logic/models/category.dart';
import 'package:budget/logic/models/monthly_budget.dart';
import 'package:budget/logic/providers/budget_provider.dart';
import 'package:budget/logic/providers/categories_provider.dart';
import 'package:budget/pages/primary/categories_page.dart';
import 'package:budget/pages/primary/dashboard_page.dart';
import 'package:budget/pages/primary/shopping_list_page.dart';
import 'package:budget/pages/primary/statistics_page.dart';
import 'package:budget/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BudgetProvider.load(),
        ),
        ChangeNotifierProvider(
          create: (context) => CategoriesProvider.db(),
        ),
      ],
      child: MaterialApp(
        theme: lightMode,
        initialRoute: '/',
        routes: {
          '/': (context) => const DashboardPage(),
          '/statistics': (context) => const StatisticsPage(),
          'categories': (context) => CategoriesPage(),
          '/shopping_list': (context) => ShoppingListPage(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
