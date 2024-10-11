import 'package:budget/logic/models/category.dart';
import 'package:budget/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CategoryCardBig extends StatelessWidget {
  Category model;
  CategoryCardBig({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 6,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: model.color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${model.name}',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 26,
                  color: getAdaptiveColor(model.color),
                ),
          ),
          Text(
            '-${NumberFormat.compact().format(model.totalSum)}',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 26,
                  color: getAdaptiveColor(model.color),
                ),
          ),
        ],
      ),
    );
  }
}
