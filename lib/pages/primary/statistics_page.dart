import 'package:budget/widgets/appbar_default.dart';
import 'package:budget/widgets/drawer_default.dart';
import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarDefault(title: 'Statistics'),
      drawer: DrawerDefault(),
    );
  }
}
