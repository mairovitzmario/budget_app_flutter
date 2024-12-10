import 'package:budget/logic/models/category.dart';
import 'package:budget/logic/utils/utils.dart';
import 'package:budget/pages/secondary/view_category_page.dart';
import 'package:budget/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CategoryCardBig extends StatelessWidget {
  Category model;
  CategoryCardBig({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.of(context).push(
        CupertinoPageRoute<void>(
          builder: (BuildContext context) => ViewCategoryPage(
            model: model,
          ),
        ),
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 8,
        ),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: model.color,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          // crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${model.name}',
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 48,
                          color: getAdaptiveColor(model.color),
                        ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    '${formatPrice(price: model.totalSum, symbol: symbol)} spent',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 24,
                          color: getAdaptiveColor(model.color),
                        ),
                  ),
                  Text(
                    model.items.length == 1
                        ? '${model.items.length} expense'
                        : '${model.items.length} expenses',
                    style: Theme.of(context).textTheme.titleSmall?.copyWith(
                          fontSize: 24,
                          color: getAdaptiveColor(model.color),
                        ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: getAdaptiveColor(model.color),
              size: 42,
            ),
          ],
        ),
      ),
    );
  }
}
