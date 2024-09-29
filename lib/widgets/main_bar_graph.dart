import 'package:flutter/material.dart';

class MainBarGraph extends StatelessWidget {
  const MainBarGraph({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            width: 30,
            height: 200,
            color: Theme.of(context).colorScheme.primary,
          ),
          Container(
            width: 30,
            height: 100,
            color: Theme.of(context).colorScheme.primary,
          ),
          Container(
            width: 30,
            height: 100,
            color: Theme.of(context).colorScheme.primary,
          ),
          Container(
            width: 30,
            height: 28,
            color: Theme.of(context).colorScheme.primary,
          ),
          Container(
            width: 30,
            height: 100,
            color: Theme.of(context).colorScheme.primary,
          ),
          Container(
            width: 30,
            height: 100,
            color: Theme.of(context).colorScheme.primary,
          ),
          Container(
            width: 30,
            height: 100,
            color: Theme.of(context).colorScheme.primary,
          ),
        ],
      ),
    );
  }
}
