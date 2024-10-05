import 'package:budget/logic/navigation_utils.dart';
import 'package:budget/pages/categories_page.dart';
import 'package:budget/pages/dashboard_page.dart';
import 'package:budget/pages/settings_page.dart';
import 'package:budget/pages/shopping_list_page.dart';
import 'package:budget/pages/statistics_page.dart';
import 'package:flutter/material.dart';

class DrawerDefault extends StatelessWidget {
  const DrawerDefault({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.secondary,
      child: Padding(
        padding: const EdgeInsets.only(left: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 40,
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
                  height: 30,
                ),
                _buildListTile(
                    context, Icons.home_filled, 'Dashboard', DashboardPage()),
                _buildListTile(context, Icons.bar_chart_outlined, 'Statistics',
                    StatisticsPage()),
                _buildListTile(
                    context, Icons.folder, 'Categories', CategoriesPage()),
                _buildListTile(context, Icons.description, 'Shopping List',
                    ShoppingListPage()),
              ],
            ),
            _buildListTile(context, Icons.settings, 'Settings', SettingsPage()),
          ],
        ),
      ),
    );
  }

  ListTile _buildListTile(
      BuildContext context, IconData icon, String label, Widget page) {
    return ListTile(
      onTap: () => NavigationUtils.switchPageTo(context, page),
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
