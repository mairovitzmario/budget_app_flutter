import 'dart:math';

import 'package:flutter/material.dart';

class MonthlyBudget {
  // Private member variables
  int _spentBudget;
  int _totalBudget;
  String _month;
  int _year;

  // Constructor with optional named parameters
  MonthlyBudget(
      {required int spentBudget,
      required int totalBudget,
      required String month,
      required int year})
      : _spentBudget = spentBudget,
        _totalBudget = totalBudget,
        _month = month,
        _year = year;

  // Current Budget
  int get spentBudget => _spentBudget;

  set spentBudget(int budget) {
    if (budget < 0) {
      throw ArgumentError("Budget cannot be negative");
    }

    _spentBudget = budget;
  }

  // Total Budget
  int get totalBudget => _totalBudget;

  set totalBudget(int budget) {
    if (budget < 0) {
      throw ArgumentError("Budget cannot be negative");
    }

    _totalBudget = budget;
  }

  double get percentageSpent {
    double ratio = _spentBudget / _totalBudget;

    if (ratio > 1) {
      return 1;
    } else {
      return ratio;
    }
  }

  int get remainingBudget => max(0, _totalBudget - _spentBudget);

  // Month
  String get month => _month;

  set month(String month) {
    _month = month;
  }

  // Year
  int get year => _year;

  set year(int year) {
    _year = year;
  }
}
