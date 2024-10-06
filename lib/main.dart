import 'package:budget/logic/models/category.dart';
import 'package:budget/logic/models/monthly_budget.dart';
import 'package:budget/logic/providers/budget_provider.dart';
import 'package:budget/logic/providers/categories_provider.dart';
import 'package:budget/pages/categories_page.dart';
import 'package:budget/pages/dashboard_page.dart';
import 'package:budget/pages/shopping_list_page.dart';
import 'package:budget/pages/statistics_page.dart';
import 'package:budget/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

var categories = [
  Category(name: 'Bills', color: Colors.yellow),
  Category(name: 'Food', color: Colors.red),
  Category(name: 'Trips', color: Colors.blue),
  Category(name: 'Commute', color: Colors.green)
];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (context) => BudgetProvider(
                model: MonthlyBudget.now(spentBudget: 0, totalBudget: 0))),
        ChangeNotifierProvider(
          create: (context) => CategoriesProvider(categoriesList: categories),
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
