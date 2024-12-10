import 'package:budget/logic/database.dart';
import 'package:budget/logic/models/category.dart';
import 'package:budget/logic/providers/budget_provider.dart';
import 'package:budget/logic/utils/dashboard_utils.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/item.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Category> categoriesList = [];

  CategoriesProvider({required this.categoriesList});

  CategoriesProvider.db() {
    _initializeFromDatabase();
  }

  Future<void> _initializeFromDatabase() async {
    var db = DatabaseHelper.instance;
    categoriesList = await db.fetchCategories();
    notifyListeners();
  }

  void addCategory(String name, Color color) async {
    Category toAdd =
        Category(id: categoriesList.length + 1, name: name, color: color);

    categoriesList.add(toAdd);

    var db = DatabaseHelper.instance;
    await db.addCategory(toAdd);

    notifyListeners();
  }

  void deleteCategory(Category toDelete) async {
    categoriesList.remove(toDelete);

    var db = DatabaseHelper.instance;
    await db.deleteCategory(toDelete.id);
    notifyListeners();
  }

  void editCategory(Category toEdit, String newName, Color newColor) async {
    toEdit.name = newName;
    toEdit.color = newColor;

    var db = DatabaseHelper.instance;
    await db.updateCategory(toEdit);

    notifyListeners();
  }

  void addItemToCategory(
      BuildContext context, Category? category, Item item) async {
    if (category == null) return;

    category.addItem(item);
    context
        .read<BudgetProvider>()
        .increaseSpentBudget(item.price * item.quantity);

    var db = DatabaseHelper.instance;
    await db.updateCategory(category);
    notifyListeners();
  }

  void removeItemFromCategory(
      BuildContext context, Category category, Item item) async {
    context
        .read<BudgetProvider>()
        .decreaseSpentBudget(item.price * item.quantity);

    category.removeItem(item);

    var db = DatabaseHelper.instance;
    await db.updateCategory(category);
    notifyListeners();
  }

  List<Item> getItemList(Category category) {
    return category.items;
  }

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

  Map<DateTime, List<Item>> groupItemsByDate(List<Item> items) {
    Map<DateTime, List<Item>> groupedItems = {};

    for (var item in items) {
      if (groupedItems.containsKey(item.date)) {
        groupedItems[item.date]!.add(item);
      } else {
        groupedItems[item.date] = [item];
      }
    }

    return groupedItems;
  }
}
