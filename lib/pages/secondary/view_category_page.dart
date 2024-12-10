import 'package:budget/logic/models/category.dart';
import 'package:budget/logic/providers/categories_provider.dart';
import 'package:budget/main.dart';
import 'package:budget/pages/secondary/add_expense_page.dart';
import 'package:budget/pages/secondary/edit_category_page.dart';
import 'package:budget/theme.dart';
import 'package:budget/widgets/item_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ViewCategoryPage extends StatefulWidget {
  Category model;
  ViewCategoryPage({super.key, required this.model});

  @override
  State<ViewCategoryPage> createState() => _ViewCategoryPageState();
}

class _ViewCategoryPageState extends State<ViewCategoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(context),
      body: SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListView.separated(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: context
                  .watch<CategoriesProvider>()
                  .getItemList(widget.model)
                  .length,
              itemBuilder: (context, index) => ItemTile(
                  model: context
                      .read<CategoriesProvider>()
                      .getItemList(widget.model)[index],
                  category: widget.model),
              separatorBuilder: (context, index) => Divider(
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.of(context).push(MaterialPageRoute(
              builder: (context) =>
                  AddExpensePage(selectedValue: widget.model)));

          setState(() {});
        },
        child: Icon(
          Icons.add_rounded,
          size: 36,
        ),
        backgroundColor: widget.model.color,
        foregroundColor: getAdaptiveColor(widget.model.color),
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) {
    return AppBar(
      title: Text(
        widget.model.name,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          color: getAdaptiveColor(widget.model.color),
          fontSize: 32,
          fontWeight: FontWeight.w600,
        ),
      ),
      backgroundColor: widget.model.color,
      leading: IconButton(
        onPressed: () => Navigator.of(context).pop(),
        icon: Icon(
          Icons.arrow_back_ios_rounded,
          color: getAdaptiveColor(widget.model.color),
          size: 28,
        ),
      ),
      actions: [
        // EDIT
        IconButton(
          onPressed: () async {
            await Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditCategoryPage(model: widget.model)));

            setState(() {});
          },
          icon: Icon(
            Icons.edit_rounded,
            color: getAdaptiveColor(widget.model.color),
            size: 28,
          ),
        ),
        // DELETE
        IconButton(
          onPressed: () => _onPressedDelete(context),
          icon: Icon(
            Icons.delete_rounded,
            color: getAdaptiveColor(widget.model.color),
            size: 28,
          ),
        ),
        SizedBox(
          width: 5,
        ),
      ],
    );
  }

  _onPressedDelete(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(
          'Delete Category',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontSize: 30,
              ),
        ),
        content: Text(
          'Are you sure you want to delete this category along with all of its items?',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 18,
                color: Theme.of(context).colorScheme.primary,
              ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            child: Text(
              'No',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.secondary,
              ),
            ),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              context.read<CategoriesProvider>().deleteCategory(widget.model);
              Navigator.of(context).pop();
            },
            style: ButtonStyle(
              shape: WidgetStatePropertyAll(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
            ),
            child: Text(
              'Yes',
              style: TextStyle(
                fontSize: 20,
                color: Theme.of(context).colorScheme.primary,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
