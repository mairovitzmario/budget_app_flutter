import 'package:budget/logic/models/category.dart';
import 'package:budget/logic/models/item.dart';
import 'package:budget/logic/providers/categories_provider.dart';
import 'package:budget/logic/utils/utils.dart';
import 'package:budget/theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';

class ItemTile extends StatelessWidget {
  Item model;
  Category category;

  ItemTile({super.key, required this.model, required this.category});

  @override
  Widget build(BuildContext context) {
    return Slidable(
      key: const ValueKey(0),

      // The start action pane is the one at the left or the top side.
      endActionPane: ActionPane(
        // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),

        // A pane can dismiss the Slidable.
        dismissible: DismissiblePane(
          onDismissed: () {
            context
                .read<CategoriesProvider>()
                .removeItemFromCategory(context, category, model);
          },
        ),

        // All actions are defined in the children parameter.
        children: [
          // A SlidableAction can have an icon and/or a label.
          SlidableAction(
            onPressed: (context) {
              context
                  .read<CategoriesProvider>()
                  .removeItemFromCategory(context, category, model);
            },
            backgroundColor: Color(0xFFFE4A49),
            foregroundColor: Colors.white,
            icon: Icons.delete,
            label: 'Delete',
          ),
        ],
      ),

      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 5,
          horizontal: 20,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    model.name,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.black87,
                          fontSize: 28,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Baseline(
                  baselineType: TextBaseline.alphabetic,
                  baseline: 20,
                  child: Text(
                    DateFormat.yMMMd().format(model.date),
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey.shade700,
                        ),
                  ),
                ),
                Baseline(
                  baselineType: TextBaseline.alphabetic,
                  baseline: 20,
                  child: Text(
                    '${formatPrice(price: model.price, symbol: symbol)} x ${model.quantity} pcs.',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: Colors.black87,
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
