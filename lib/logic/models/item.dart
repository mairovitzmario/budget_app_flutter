import 'dart:convert';
import 'package:flutter/material.dart';

class Item {
  String _name;
  double _price;
  int _quantity;
  DateTime _date;

  Item({
    required String name,
    required double price,
    required int quantity,
    DateTime? date,
  })  : _name = name,
        _price = price,
        _quantity = quantity,
        _date = date ?? DateTime.now();

//SERIALIZE
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
      'date': date.toIso8601String(),
    };
  }

//DESERIALIZE
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
      name: map['name'] as String,
      price: map['price'] as double,
      quantity: map['quantity'] as int,
      date: DateTime.parse(map['date'] as String),
    );
  }

  //NAME
  set name(String value) {
    _name = value;
  }

  String get name => _name;

  //PRICE
  set price(double value) {
    if (value < 0) {
      throw ArgumentError("Price cannot be negative");
    }
    _price = value;
  }

  double get price => _price;

  //QUANTITY
  set quantity(int value) {
    if (value < 0) {
      throw ArgumentError("Quantity cannot be negative");
    }
    _quantity = value;
  }

  int get quantity => _quantity;

  //DATE
  DateTime get date => _date;

  set date(DateTime value) {
    _date = value;
  }
}
