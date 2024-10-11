import 'package:flutter/material.dart';

import 'item.dart';

class Category {
  String _name;
  Color _color;
  List<Item> _items;

  Category({
    required String name,
    required Color color,
    List<Item>? items,
  })  : _name = name,
        _color = color,
        _items = items ?? [];

  //NAME
  set name(String value) {
    _name = name;
  }

  String get name => _name;

  //COLOR
  set color(Color value) {
    _color = value;
  }

  Color get color => _color;

  //ITEMS LIST
  List<Item> get items => _items;

  set items(List<Item> value) {
    _items = value;
  }

  void addItem(Item item) {
    _items.add(item);
  }

  void removeItem(Item item) {
    _items.remove(item);
  }

  get totalSum {
    double sum = 0;

    if (items.length == 0) {
      return sum;
    }

    for (int i = 0; i < items.length; i++) {
      sum += items[i].price * items[i].quantity;
    }

    return sum;
  }

  Category filterItemsByDate(DateTime startDate, DateTime endDate) {
    List<Item> filteredItems = _items.where((item) {
      return item.date.isAfter(startDate) && item.date.isBefore(endDate);
    }).toList();

    return Category(
      name: _name,
      color: _color,
      items: filteredItems,
    );
  }

  static double getListSum(List<Category> categories) {
    double sum = 0;
    for (int i = 0; i < categories.length; i++) {
      sum += categories[i].totalSum;
    }
    return sum;
  }
}
