import 'package:budget/widgets/appbar_default.dart';
import 'package:flutter/material.dart';

import '../widgets/drawer_default.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarDefault(title: 'Settings'),
      body: Container(),
      drawer: DrawerDefault(),
    );
  }
}
