import 'package:budget/logic/models/monthly_budget.dart';
import 'package:flutter/material.dart';

class BudgetProvider extends ChangeNotifier {
  MonthlyBudget model;

  BudgetProvider({required this.model});

  void setTotalBudget(double newBudget) {
    model.totalBudget = newBudget;
    notifyListeners();
  }

  void setSpentBudget(double newBudget) {
    model.spentBudget = newBudget;
    notifyListeners();
  }

  void increaseSpentBudget(int addedMoney) {
    model.spentBudget += addedMoney;
    notifyListeners();
  }
}
