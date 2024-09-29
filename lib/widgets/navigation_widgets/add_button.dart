import 'package:budget/widgets/navigation_widgets/add_dialogs.dart';
import 'package:flutter/material.dart';

class AddButton extends StatelessWidget {
  const AddButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<int>(
      itemBuilder: _buildMenu,
      onSelected: (index) => _onSelected(index, context),
      offset: const Offset(-55, -170),
      popUpAnimationStyle: AnimationStyle.noAnimation,
      color: Theme.of(context).colorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      elevation: 0,
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: Colors.transparent,
          border: Border.all(
            width: 3.5,
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        child: Icon(
          Icons.add,
          weight: 16,
          color: Theme.of(context).colorScheme.primary,
          size: 50,
        ),
      ),
    );
  }

  void _onSelected(int index, BuildContext context) {
    // ADD A CATEGORY
    if (index == 0) {
      showDialog(context: context, builder: (context) => AddCategoryDialog());
    }
    // ADD A SHOPPING LIST
    else if (index == 1) {
      print('shopping cart');
    }
    // ADD AN ITEM
    else if (index == 2) {
      showDialog(context: context, builder: (context) => AddItemDialog());
    }
  }

  List<PopupMenuEntry<int>> _buildMenu(context) => [
        // ADD A CATEGORY
        PopupMenuItem(
          value: 0,
          child: Row(
            children: [
              Icon(
                Icons.folder_outlined,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Category',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        // ADD A SHOPPING LIST
        PopupMenuItem(
          value: 1,
          child: Row(
            children: [
              Icon(
                Icons.shopping_cart_outlined,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Shopping list',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
        // ADD AN ITEM
        PopupMenuItem(
          value: 2,
          child: Row(
            children: [
              Icon(
                Icons.sell_outlined,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                'Item',
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ],
          ),
        ),
      ];
}
