import 'package:budget/logic/models/monthly_budget.dart';
import 'package:budget/widgets/appbar_default.dart';
import 'package:budget/widgets/monthly_budget_overview_card.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer_default.dart';

List budgets = [
  MonthlyBudget(
    spentBudget: 500,
    totalBudget: 400,
    month: 'June',
    year: 2024,
  ),
  MonthlyBudget(
    spentBudget: 5000,
    totalBudget: 10000,
    month: 'May',
    year: 2024,
  ),
  MonthlyBudget(
    spentBudget: 1400,
    totalBudget: 1400,
    month: 'April',
    year: 2024,
  ),
  MonthlyBudget(
    spentBudget: 100,
    totalBudget: 2000,
    month: 'March',
    year: 2024,
  ),
];

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(title: 'Dashboard'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),
            SizedBox(
              height: 400,
              child: ListView.builder(
                physics: PageScrollPhysics(),
                scrollDirection: Axis.horizontal,
                reverse: true,
                itemCount: budgets.length,
                itemBuilder: (context, index) {
                  return MonthlyBudgetOverviewCard(
                    model: budgets[index],
                  );
                },
              ),
            ),
          ],
        ),
      ),
      drawer: const DrawerDefault(),
    );
  }
}
