import 'package:budget/logic/models/monthly_budget.dart';
import 'package:budget/logic/providers/budget_provider.dart';
import 'package:budget/logic/utils/utils.dart';
import 'package:budget/main.dart';
import 'package:budget/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';

class BudgetOverview extends StatefulWidget {
  const BudgetOverview({super.key});
  @override
  _BudgetOverviewState createState() => _BudgetOverviewState();
}

class _BudgetOverviewState extends State<BudgetOverview> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      //width: MediaQuery.sizeOf(context).width - 40,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 10,
          ),
          _buildHeader(context, context.watch<BudgetProvider>().model.month,
              context.watch<BudgetProvider>().model.year),
          const SizedBox(
            height: 20,
          ),
          _buildPercentIndicator(context),
          const SizedBox(
            height: 20,
          ),
          _buildFooter(context),
        ],
      ),
    );
  }

  RichText _buildHeader(BuildContext context, String month, int year) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: '$month ',
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 42,
              fontWeight: FontWeight.w300,
            ),
          ),
          TextSpan(
            text: year.toString(),
            style: TextStyle(
              color: Theme.of(context).colorScheme.inversePrimary,
              fontSize: 42,
              fontWeight: FontWeight.w800,
            ),
          ),
        ],
      ),
    );
  }

  Center _buildPercentIndicator(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 20,
        child: LinearProgressIndicator(
          value: context.watch<BudgetProvider>().model.percentageSpent,
          borderRadius: BorderRadius.circular(12),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          color: Color.fromARGB(255, 255, 224, 87),
        ),
      ),
    );
  }

  Column _buildFooter(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Spent: ',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(
                text: formatPrice(
                    price: context.watch<BudgetProvider>().model.spentBudget,
                    symbol: symbol),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 2,
        ),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Total: ',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(
                text: formatPrice(
                    price: context.watch<BudgetProvider>().model.totalBudget,
                    symbol: symbol),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: 'Remaining: ',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.normal,
                ),
              ),
              TextSpan(
                text: formatPrice(
                    price:
                        context.watch<BudgetProvider>().model.remainingBudget,
                    symbol: symbol),
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
