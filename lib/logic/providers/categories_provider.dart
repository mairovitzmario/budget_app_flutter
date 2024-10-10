import 'package:budget/logic/models/category.dart';
import 'package:budget/logic/providers/budget_provider.dart';
import 'package:budget/logic/utils/dashboard_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Category> categoriesList;

  CategoriesProvider({required this.categoriesList});

  List<Category> filterCurrentMonth() {
    List<Category> newList = [];
    DateTime now = DateTime.now();

    for (int categoryIndex = 0;
        categoryIndex < categoriesList.length;
        categoryIndex++) {
      Category newCategory = categoriesList[categoryIndex]
          .filterItemsByDate(DateTime(now.year, now.month, 1), now);
      newList.add(newCategory);
    }

    newList.sort((a, b) => b.totalSum.compareTo(a.totalSum));

    return newList;
  }

  void addItemToCategory(BuildContext context, Category? category, Item item) {
    category?.addItem(item);
    notifyListeners();
    context
        .read<BudgetProvider>()
        .increaseSpentBudget(item.price * item.quantity);
  }
}
