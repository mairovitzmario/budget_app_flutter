import 'package:budget/pages/secondary/add_category_page.dart';
import 'package:budget/pages/secondary/add_expense_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddFloatingActionButton extends StatelessWidget {
  const AddFloatingActionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        _onPressed(context);
      },
      child: Icon(
        Icons.add_rounded,
        size: 36,
      ),
    );
  }

  Future<dynamic> _onPressed(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            height: 150,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primary,
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(12),
                bottom: Radius.circular(0),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {
                    _onAddCategoryTap(context);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: Text(
                      'Add a category',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _onAddExpenseTap(context);
                  },
                  child: Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                    child: Text(
                      'Add an expense',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ),
                ),
              ],
            ),
          );
        });
  }

  void _onAddExpenseTap(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => AddExpensePage()));
  }

  void _onAddCategoryTap(BuildContext context) {
    Navigator.of(context).pop();
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (context) => const AddCategoryPage()));
  }
}
