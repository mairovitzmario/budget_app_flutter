import 'package:budget/logic/models/category.dart';
import 'package:budget/logic/utils/utils.dart';
import 'package:budget/theme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CategoryCardSmall extends StatelessWidget {
  Category model;
  CategoryCardSmall({super.key, required this.model});

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
          Expanded(
            child: Text(
              '${model.name}',
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                    fontSize: 26,
                    color: getAdaptiveColor(model.color),
                  ),
            ),
          ),
          Text(
            '-${formatPrice(price: model.totalSum, symbol: symbol)}',
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
