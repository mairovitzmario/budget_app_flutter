import 'package:budget/logic/navigation_utils.dart';
import 'package:budget/pages/home_page.dart';
import 'package:budget/pages/statistics_page.dart';
import 'package:budget/widgets/navigation_widgets/add_button.dart';
import 'package:flutter/material.dart';

class BottomNavigationBarDefault extends StatelessWidget {
  final int selectedIndex;

  const BottomNavigationBarDefault({
    super.key,
    this.selectedIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: selectedIndex,
      items: [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home_filled,
            size: 40,
            color: selectedIndex == 0
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
          ),
          label: 'Home',
        ),
        BottomNavigationBarItem(icon: AddButton(), label: 'Add'),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.bar_chart,
            size: 40,
            color: selectedIndex == 2
                ? Theme.of(context).colorScheme.primary
                : Theme.of(context).colorScheme.secondary,
          ),
          label: 'Statistics',
        ),
      ],
      onTap: (value) => _changePage(context: context, value: value),
      elevation: 0,
      showSelectedLabels: false,
      showUnselectedLabels: false,
      enableFeedback: false,
    );
  }

  // Function to change the pages (HOME PAGE AND STATISTICS PAGE ONLY)
  void _changePage({required BuildContext context, required int value}) {
    if (value == selectedIndex) {
      return;
    }

    if (value == 0) {
      NavigationUtils.switchPageTo(context, const HomePage());
    } else if (value == 2) {
      NavigationUtils.switchPageTo(context, const StatisticsPage());
    }
  }
}
