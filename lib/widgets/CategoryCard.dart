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
                  color: model.color.computeLuminance() <= 0.5
                      ? Colors.white
                      : Colors.black,
                ),
          ),
          Text(
            '-${NumberFormat.compact().format(model.totalSum)}',
            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                  fontSize: 26,
                  color: model.color.computeLuminance() <= 0.5
                      ? Colors.white
                      : Colors.black,
                ),
          ),
        ],
      ),
    );
  }
}
