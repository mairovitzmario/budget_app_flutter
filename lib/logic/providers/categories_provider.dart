import 'package:budget/logic/models/category.dart';
import 'package:flutter/material.dart';

class CategoriesProvider extends ChangeNotifier {
  List<Category> categoriesList;

  CategoriesProvider({required this.categoriesList});
}
