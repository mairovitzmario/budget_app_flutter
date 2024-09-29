import 'package:budget/widgets/appbar_default.dart';
import 'package:budget/widgets/navigation_widgets/bottom_navigation_bar_default.dart';
import 'package:flutter/material.dart';

import '../widgets/main_bar_graph.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarDefault(title: 'Budget'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 40,
            ),
            MainBarGraph(),
          ],
        ),
      ),
      bottomNavigationBar: const BottomNavigationBarDefault(),
    );
  }
}
