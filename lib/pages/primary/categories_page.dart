import 'package:budget/widgets/appbar_default.dart';
import 'package:flutter/material.dart';

import '../../widgets/drawer_default.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(title: 'Categories'),
      body: Container(),
      drawer: DrawerDefault(),
    );
  }
}
