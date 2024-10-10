import 'package:budget/logic/models/monthly_budget.dart';
import 'package:budget/logic/providers/budget_provider.dart';
import 'package:budget/logic/providers/categories_provider.dart';
import 'package:budget/widgets/CategoryCard.dart';
import 'package:budget/widgets/appbar_default.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../logic/utils/dashboard_utils.dart';
import '../../widgets/add_floating_action_button.dart';
import '../../widgets/budget_overview.dart';
import '../../widgets/drawer_default.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    var recentCategoriesList =
        context.watch<CategoriesProvider>().filterCurrentMonth();

    return Scaffold(
      appBar: const AppBarDefault(title: 'Dashboard'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              _buildBudgetPart(context),
              BudgetOverview(),
              const SizedBox(
                height: 40,
              ),
              Text(
                "Expenses",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: recentCategoriesList.length,
                  itemBuilder: (context, index) {
                    return CategoryCard(
                      model: recentCategoriesList[index],
                    );
                  }),
              const SizedBox(
                height: 100,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: AddFloatingActionButton(),
      drawer: const DrawerDefault(),
    );
  }

  Row _buildBudgetPart(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Budget",
          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                fontWeight: FontWeight.w500,
              ),
        ),
        GestureDetector(
          onTap: () => DashboardUtils.onEditTap(context),
          child: Row(
            children: [
              Text(
                NumberFormat.compact()
                    .format(context.watch<BudgetProvider>().model.totalBudget),
                style: TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 42,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Icon(
                Icons.edit,
                size: 24,
                color: Theme.of(context).colorScheme.secondary,
              )
            ],
          ),
        ),
      ],
    );
  }
}
