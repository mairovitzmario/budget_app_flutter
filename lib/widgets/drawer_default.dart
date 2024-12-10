import 'package:budget/logic/utils/navigation_utils.dart';
import 'package:budget/pages/primary/categories_page.dart';
import 'package:budget/pages/primary/dashboard_page.dart';
import 'package:budget/pages/primary/shopping_list_page.dart';
import 'package:budget/pages/primary/statistics_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerDefault extends StatelessWidget {
  const DrawerDefault({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.primary,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(
                'Budget App',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: Theme.of(context).colorScheme.inversePrimary),
              ),
            ),
            SizedBox(
              height: 35,
            ),
            _buildListTile(
                context, Icons.home_filled, 'Dashboard', DashboardPage()),
            _buildListTile(
                context, Icons.folder, 'Categories', CategoriesPage()),
            _buildListTile(context, Icons.description, 'Shopping List',
                ShoppingListPage()),
            _buildListTile(context, Icons.bar_chart_outlined, 'Statistics',
                StatisticsPage()),
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile(
      BuildContext context, IconData icon, String label, Widget page) {
    return ListTile(
      onTap: () => Navigator.of(context)
          .pushReplacement(CupertinoPageRoute(builder: (context) => page)),
      leading: Icon(
        icon,
        color: Theme.of(context).colorScheme.inversePrimary,
        size: 26,
      ),
      title: Text(
        label,
        style: Theme.of(context)
            .textTheme
            .titleSmall
            ?.copyWith(color: Theme.of(context).colorScheme.inversePrimary),
      ),
    );
  }
}
