import 'package:flutter/material.dart';

class AppBarSecondary extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const AppBarSecondary({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        title,
        style: Theme.of(context).textTheme.titleSmall,
      ),
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.close,
          color: Theme.of(context).colorScheme.primary,
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
