import 'package:budget/logic/models/category.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CategoryCard extends StatelessWidget {
  Category model;
  CategoryCard({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 5,
        vertical: 10,
      ),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: model.color, width: 5),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${model.name}',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: model.color),
          ),
          Text(
            '-${NumberFormat.compact().format(model.totalSum)}',
            style: Theme.of(context)
                .textTheme
                .titleMedium
                ?.copyWith(color: model.color),
          ),
        ],
      ),
    );
  }
}
