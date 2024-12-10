import 'package:budget/logic/providers/categories_provider.dart';
import 'package:budget/widgets/add_floating_action_button.dart';
import 'package:budget/widgets/appbar_default.dart';
import 'package:budget/widgets/category_card_big.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widgets/drawer_default.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(title: 'Categories'),
      body: ListView.builder(
          padding: EdgeInsets.fromLTRB(0, 20, 0, 80),
          itemCount: context.watch<CategoriesProvider>().categoriesList.length,
          itemBuilder: (context, index) {
            return CategoryCardBig(
                model:
                    context.watch<CategoriesProvider>().categoriesList[index]);
          }),
      floatingActionButton: AddFloatingActionButton(),
      drawer: DrawerDefault(),
    );
  }
}
