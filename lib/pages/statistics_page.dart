import 'package:budget/widgets/appbar_default.dart';
import 'package:budget/widgets/navigation_widgets/bottom_navigation_bar_default.dart';
import 'package:flutter/material.dart';

class StatisticsPage extends StatelessWidget {
  const StatisticsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarDefault(title: 'Statistics'),
      bottomNavigationBar: BottomNavigationBarDefault(
        selectedIndex: 2,
      ),
    );
  }
}
