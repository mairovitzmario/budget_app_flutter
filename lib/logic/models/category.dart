import 'package:flutter/material.dart';
import 'dart:convert';

import 'item.dart';

class Category {
  int _id;
  String _name;
  Color _color;
  List<Item> _items;

  Category({
    required int id,
    required String name,
    required Color color,
    List<Item>? items,
  })  : _id = id,
        _name = name,
        _color = color,
        _items = items ?? [];

  Category.copy(Category other)
      : _id = other.id,
        _name = other.name,
        _color = other.color,
        _items = List<Item>.from(other.items);

//SERIALIZE
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'color': color.value.toRadixString(16), // Convert color to hex
      'items': jsonEncode(items.map((item) => item.toMap()).toList()),
    };
  }

//DESERIALIZE
  factory Category.fromMap(Map<String, dynamic> map) {
    return Category(
      id: map['id'] as int,
      name: map['name'] as String,
      color: Color(int.parse(map['color'], radix: 16)),
      items: (jsonDecode(map['items']) as List)
          .map((item) => Item.fromMap(item))
          .toList(),
    );
  }

//ID
  set id(int value) {
    _id = value;
  }

  int get id => _id;

  //NAME
  set name(String value) {
    _name = value;
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
      id: _id,
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
