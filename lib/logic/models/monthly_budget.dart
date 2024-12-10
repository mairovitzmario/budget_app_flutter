import 'dart:math';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MonthlyBudget {
  double _spentBudget;
  double _totalBudget;
  String _month;
  int _year;

  MonthlyBudget({
    required double spentBudget,
    required double totalBudget,
    required String month,
    required int year,
  })  : _spentBudget = spentBudget,
        _totalBudget = totalBudget,
        _month = month,
        _year = year;

  MonthlyBudget.now({
    required double spentBudget,
    required double totalBudget,
  })  : _spentBudget = spentBudget,
        _totalBudget = totalBudget,
        _month = DateFormat.MMMM().format(DateTime.now()),
        _year = DateTime.now().year;

  static Future<MonthlyBudget> load() async {
    final prefs = await SharedPreferences.getInstance();

    double spentBudget = prefs.getDouble('spentBudget') ?? 0;
    double totalBudget = prefs.getDouble('totalBudget') ?? 0;
    String? month = prefs.getString('month');
    int? year = prefs.getInt('year');

    if (year == null ||
        month == null ||
        month != DateFormat.MMMM().format(DateTime.now()) ||
        year != DateTime.now().year) {
      return MonthlyBudget.now(spentBudget: 0, totalBudget: 0);
    } else {
      return MonthlyBudget.now(
          spentBudget: spentBudget, totalBudget: totalBudget);
    }
  }

  void save() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setDouble('spentBudget', spentBudget);
    prefs.setDouble('totalBudget', totalBudget);
    prefs.setString('month', month);
    prefs.setInt('year', year);
  }

  // Current Budget
  double get spentBudget => _spentBudget;

  set spentBudget(double budget) {
    if (budget < 0) {
      throw ArgumentError("Budget cannot be negative");
    }

    _spentBudget = budget;
  }

  // Total Budget
  double get totalBudget => _totalBudget;

  set totalBudget(double budget) {
    if (budget < 0) {
      throw ArgumentError("Budget cannot be negative");
    }

    _totalBudget = budget;
  }

  double get percentageSpent {
    if (_totalBudget == 0) {
      return 1;
    }

    double ratio = _spentBudget / _totalBudget;

    if (ratio > 1) {
      return 1;
    } else {
      return ratio;
    }
  }

  double get remainingBudget => max(0, _totalBudget - _spentBudget);

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
