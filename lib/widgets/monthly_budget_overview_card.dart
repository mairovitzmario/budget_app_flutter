import 'package:budget/logic/models/monthly_budget.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class MonthlyBudgetOverviewCard extends StatefulWidget {
  MonthlyBudget model;

  MonthlyBudgetOverviewCard({super.key, required this.model});

  @override
  _MonthlyBudgetOverviewCardState createState() =>
      _MonthlyBudgetOverviewCardState();
}

class _MonthlyBudgetOverviewCardState extends State<MonthlyBudgetOverviewCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(20),
      width: MediaQuery.sizeOf(context).width - 40,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context, widget.model.month, widget.model.year),
          const SizedBox(
            height: 20,
          ),
          _buildPercentIndicator(context),
          SizedBox(
            height: 20,
          ),
          _buildRemaining(context)
        ],
      ),
    );
  }

  Center _buildPercentIndicator(BuildContext context) {
    return Center(
      child: Container(
        child: CircularPercentIndicator(
          radius: 100,
          lineWidth: 20,
          percent: widget.model.percentageSpent,
          center: Text(
            '${NumberFormat.compact().format(widget.model.spentBudget)} / ${NumberFormat.compact().format(widget.model.totalBudget)}',
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Theme.of(context).colorScheme.inversePrimary,
                fontSize: 26),
          ),
          progressColor: const Color.fromARGB(255, 255, 206, 132),
          backgroundColor: Theme.of(context).colorScheme.secondary,
          circularStrokeCap: CircularStrokeCap.round,
        ),
      ),
    );
  }

  RichText _buildRemaining(BuildContext context) {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: 'Remaining: ',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.normal,
            ),
          ),
          TextSpan(
            text: NumberFormat.compact()
                .format(widget.model.remainingBudget)
                .toString(),
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
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

  RichText _buildBudgetText({
    required BuildContext context,
    required String label,
    required int amount,
  }) {
    // Row(
    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //   children: [
    //     _buildBudgetText(
    //       context: context,
    //       label: 'Spent:',
    //       amount: widget.model.spentBudget,
    //     ),
    //     _buildBudgetText(
    //       context: context,
    //       label: 'Budget:',
    //       amount: widget.model.totalBudget,
    //     ),
    //   ],
    // ),

    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text: label,
            style: TextStyle(
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
          TextSpan(
            text: amount.toString(),
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),
          ),
        ],
      ),
    );
  }
}
