import 'package:budget/logic/models/monthly_budget.dart';
import 'package:flutter/material.dart';

class BudgetProvider extends ChangeNotifier {
  MonthlyBudget model = MonthlyBudget.now(spentBudget: 0, totalBudget: 0);

  BudgetProvider({required this.model});

  BudgetProvider.load() {
    _load();
  }

  void _load() async {
    model = await MonthlyBudget.load();
    notifyListeners();
  }

  void setTotalBudget(double newBudget) {
    model.totalBudget = newBudget;
    notifyListeners();
    model.save();
  }

  void setSpentBudget(double newBudget) {
    model.spentBudget = newBudget;
    notifyListeners();
    model.save();
  }

  void increaseSpentBudget(double addedMoney) {
    model.spentBudget += addedMoney;
    notifyListeners();
    model.save();
  }

  void decreaseSpentBudget(double removedMoney) {
    double newBudget = model.spentBudget - removedMoney;
    if (newBudget < 0) {
      model.spentBudget = 0;
    } else {
      model.spentBudget = newBudget;
    }
    notifyListeners();
    model.save();
  }
}
