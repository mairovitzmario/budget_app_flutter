import 'package:budget/widgets/appbar_default.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer_default.dart';

class ShoppingListPage extends StatelessWidget {
  const ShoppingListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(title: 'Shopping List'),
      body: Container(),
      drawer: DrawerDefault(),
    );
  }
}
